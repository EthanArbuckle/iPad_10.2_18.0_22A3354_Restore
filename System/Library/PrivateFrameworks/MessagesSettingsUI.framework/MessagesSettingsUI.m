void sub_24190DC7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190DDB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190DF0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190E04C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190E158(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190E3E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190E67C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190E918(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190EBB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190EDD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190F070(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190F30C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_24190FE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_241910988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2419119AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241913418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,char a22)
{
  id *v22;
  id *v23;
  uint64_t v24;

  _Block_object_dispose((const void *)(v24 - 112), 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2419135F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_241913790(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_241914214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t iCloudQuotaUILibrary()
{
  uint64_t v0;
  void *v2;

  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
    iCloudQuotaUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = iCloudQuotaUILibraryCore_frameworkLibrary;
  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getICQInAppMessagingClass_block_invoke(uint64_t a1)
{
  Class result;

  iCloudQuotaUILibrary();
  result = objc_getClass("ICQInAppMessaging");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getICQInAppMessagingClass_block_invoke_cold_1();
  getICQInAppMessagingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_241915650()
{
  void *v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5CC();
  swift_release();
  v0 = (void *)objc_opt_self();
  if (objc_msgSend(v0, sel_hasUserCompletedOnboarding))
    return objc_msgSend(v0, sel_shareAllLocations) ^ 1;
  else
    return 2;
}

id sub_24191570C@<X0>(char *a1@<X8>)
{
  void *v2;
  id result;
  char v4;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5CC();
  swift_release();
  v2 = (void *)objc_opt_self();
  result = objc_msgSend(v2, sel_hasUserCompletedOnboarding);
  if ((_DWORD)result)
  {
    result = objc_msgSend(v2, sel_shareAllLocations);
    v4 = result ^ 1;
  }
  else
  {
    v4 = 2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_2419157D0()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5C0();
  return swift_release();
}

id sub_241915874(unsigned __int8 a1)
{
  int v1;
  void *v2;
  id result;

  v1 = a1;
  v2 = (void *)objc_opt_self();
  result = objc_msgSend(v2, sel_setHasUserCompletedOnboarding_, v1 != 2);
  if (v1 != 2)
    return objc_msgSend(v2, sel_setShareAllLocations_, (v1 & 1) == 0);
  return result;
}

uint64_t sub_2419158E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCV18MessagesSettingsUI15CheckInDataView5Model___observationRegistrar;
  v2 = sub_24192B5E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_241915934()
{
  return type metadata accessor for CheckInDataView.Model();
}

uint64_t type metadata accessor for CheckInDataView.Model()
{
  uint64_t result;

  result = qword_25715EA38;
  if (!qword_25715EA38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_241915978()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24192B5E4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

id sub_2419159EC()
{
  uint64_t v0;

  return sub_241915874(*(_BYTE *)(v0 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for CheckInDataView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CheckInDataView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for CheckInDataView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CheckInDataView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for CheckInDataView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CheckInDataView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CheckInDataView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CheckInDataView()
{
  return &type metadata for CheckInDataView;
}

uint64_t sub_241915C9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_241915CAC@<X0>(__int128 *a1@<X0>, char *a2@<X8>)
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
  char *v12;
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
  uint64_t OpaqueTypeConformance2;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  __int128 *v68;
  uint64_t v69;
  ValueMetadata *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73[6];

  v67 = a2;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB10);
  v59 = *(_QWORD *)(v61 - 8);
  v3 = MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v57 = (char *)&v54 - v5;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB18);
  v55 = *(_QWORD *)(v58 - 8);
  v6 = MEMORY[0x24BDAC7A8](v58);
  v56 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v62 = (char *)&v54 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB20);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v66 = (uint64_t)&v54 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB28);
  v64 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v65 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v54 - v17;
  v68 = a1;
  sub_241916C30(a1, v73);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB38);
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EB40);
  v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EB48);
  v21 = sub_24192B6D4();
  v22 = sub_241919930(&qword_25715EB50, &qword_25715EB48, MEMORY[0x24BDF4570]);
  v69 = v20;
  v70 = (ValueMetadata *)v21;
  v71 = v22;
  v72 = MEMORY[0x24BDEE580];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v24 = sub_241918778();
  v69 = v19;
  v70 = &type metadata for SettingsModel.CheckInData;
  v71 = OpaqueTypeConformance2;
  v72 = v24;
  swift_getOpaqueTypeConformance2();
  sub_2419187BC();
  v63 = v18;
  sub_24192B9F8();
  *(_OWORD *)v73 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB68);
  sub_24192B914();
  v25 = v69;
  swift_getKeyPath();
  v73[0] = v25;
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5CC();
  swift_release();
  v26 = (void *)objc_opt_self();
  if ((objc_msgSend(v26, sel_hasUserCompletedOnboarding) & 1) != 0)
  {
    v27 = objc_msgSend(v26, sel_shareAllLocations);
    v28 = swift_release();
    MEMORY[0x24BDAC7A8](v28);
    *((_BYTE *)&v54 - 16) = v27 ^ 1;
    sub_241917000((uint64_t)v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB80);
    sub_241918820();
    v29 = v62;
    v30 = sub_24192B9D4();
    MEMORY[0x24BDAC7A8](v30);
    *((_BYTE *)&v54 - 16) = v27 ^ 1;
    sub_241917804((uint64_t)v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25715EBD0);
    sub_241919930(&qword_25715EBD8, &qword_25715EBD0, MEMORY[0x24BDF5428]);
    v31 = v57;
    sub_24192B9F8();
    v54 = v14;
    v32 = v55;
    v33 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
    v34 = v56;
    v35 = v58;
    v33(v56, v29, v58);
    v36 = v59;
    v37 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
    v39 = v60;
    v38 = v61;
    v37(v60, v31, v61);
    v33(v12, v34, v35);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EBE0);
    v37(&v12[*(int *)(v40 + 48)], v39, v38);
    v41 = *(void (**)(char *, uint64_t))(v36 + 8);
    v41(v31, v38);
    v42 = *(void (**)(char *, uint64_t))(v32 + 8);
    v14 = v54;
    v42(v62, v35);
    v41(v39, v38);
    v42(v34, v35);
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB70);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v12, 0, 1, v43);
    v44 = v66;
    sub_241918B40((uint64_t)v12, v66, &qword_25715EB20);
  }
  else
  {
    swift_release();
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB70);
    v44 = v66;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v66, 1, 1, v45);
  }
  v47 = v64;
  v46 = v65;
  v48 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v49 = v63;
  v48(v65, v63, v14);
  sub_241918A1C(v44, (uint64_t)v12, &qword_25715EB20);
  v50 = v67;
  v48(v67, v46, v14);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB78);
  sub_241918A1C((uint64_t)v12, (uint64_t)&v50[*(int *)(v51 + 48)], &qword_25715EB20);
  sub_241918A60(v44, &qword_25715EB20);
  v52 = *(void (**)(char *, uint64_t))(v47 + 8);
  v52(v49, v14);
  sub_241918A60((uint64_t)v12, &qword_25715EB20);
  return ((uint64_t (*)(char *, uint64_t))v52)(v46, v14);
}

uint64_t sub_241916320@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
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
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  uint64_t v45;
  char v46[8];
  uint64_t v47;

  v39 = a2;
  v3 = sub_24192B6D4();
  v4 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  v36 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB48);
  v8 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  v34 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB40);
  v12 = *(_QWORD *)(v11 - 8);
  v37 = v11;
  v38 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = *((_QWORD *)a1 + 2);
  v14 = *((_QWORD *)a1 + 3);
  v30 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v14;
  v32 = *((_QWORD *)a1 + 4);
  v47 = v15;
  *(_QWORD *)&v44 = v15;
  *((_QWORD *)&v44 + 1) = v14;
  v45 = v32;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v17 = v40;
  v18 = v41;
  swift_getKeyPath();
  v40 = v17;
  v41 = v18;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v40 = v44;
  LOBYTE(v41) = v45;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC18);
  sub_241918ABC();
  sub_241919930(&qword_25715EC28, &qword_25715EC18, MEMORY[0x24BDF5428]);
  sub_24192B950();
  swift_release();
  swift_release();
  sub_24192B6C8();
  v19 = sub_241919930(&qword_25715EB50, &qword_25715EB48, MEMORY[0x24BDF4570]);
  v20 = v30;
  v21 = v33;
  v22 = v35;
  sub_24192B83C();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v22);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v21);
  *(_QWORD *)&v40 = v15;
  *((_QWORD *)&v40 + 1) = v31;
  v41 = v32;
  MEMORY[0x24269E0F0](&v44, v16);
  v23 = v44;
  swift_getKeyPath();
  *(_QWORD *)&v40 = v23;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  v24 = *(_BYTE *)(v23 + 35);
  swift_release();
  v43 = v24;
  v44 = *a1;
  sub_241918B40((uint64_t)&v44 + 8, (uint64_t)v46, &qword_25715EC38);
  v25 = swift_allocObject();
  v26 = a1[1];
  *(_OWORD *)(v25 + 16) = *a1;
  *(_OWORD *)(v25 + 32) = v26;
  *(_QWORD *)(v25 + 48) = *((_QWORD *)a1 + 4);
  swift_retain();
  sub_241918BD0((uint64_t)v46);
  sub_241918BD0((uint64_t)&v47);
  swift_retain();
  swift_retain();
  *(_QWORD *)&v40 = v21;
  *((_QWORD *)&v40 + 1) = v22;
  v41 = v19;
  v42 = MEMORY[0x24BDEE580];
  swift_getOpaqueTypeConformance2();
  sub_241918778();
  v27 = v37;
  sub_24192B884();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v20, v27);
}

uint64_t sub_24191673C@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  v5 = (void *)sub_24192BA1C();
  v6 = (void *)sub_24192BA1C();
  v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, 0, v6);

  v8 = sub_24192BA28();
  v10 = v9;

  v28 = v8;
  v29 = v10;
  sub_241918994();
  v11 = sub_24192B80C();
  v13 = v12;
  v15 = v14;
  LOBYTE(v7) = v16 & 1;
  v17 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, v28, v29);
  v18 = (void *)sub_24192BA1C();
  v19 = (void *)sub_24192BA1C();
  v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

  sub_24192BA28();
  v21 = sub_24192B80C();
  v23 = v22;
  v25 = v24 & 1;
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + 8) = v13;
  *(_BYTE *)(a1 + 16) = (_BYTE)v7;
  *(_QWORD *)(a1 + 24) = v15;
  *(_WORD *)(a1 + 32) = 257;
  *(_QWORD *)(a1 + 40) = v21;
  *(_QWORD *)(a1 + 48) = v22;
  *(_BYTE *)(a1 + 56) = v24 & 1;
  *(_QWORD *)(a1 + 64) = v26;
  *(_WORD *)(a1 + 72) = 0;
  sub_241918BF8(v11, v13, (char)v7);
  swift_bridgeObjectRetain();
  sub_241918BF8(v21, v23, v25);
  swift_bridgeObjectRetain();
  sub_241918C08(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_241918C08(v11, v13, (char)v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2419169B0(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8]();
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *a1++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_24192BA10();
  }
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_24192BA10();
}

uint64_t sub_241916B64()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB68);
  sub_24192B914();
  swift_getKeyPath();
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5C0();
  swift_release();
  return swift_release();
}

uint64_t sub_241916C30@<X0>(__int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v14 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB68);
  sub_24192B914();
  swift_getKeyPath();
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5CC();
  swift_release();
  v3 = (void *)objc_opt_self();
  if (objc_msgSend(v3, sel_hasUserCompletedOnboarding, v15, *((_QWORD *)&v14 + 1)))
  {
    objc_msgSend(v3, sel_shareAllLocations);
    swift_release();
    type metadata accessor for MessagesSettingsUtilities();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v6 = (void *)sub_24192BA1C();
    v7 = (void *)sub_24192BA1C();
    v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, 0, v7);

    sub_24192BA28();
    sub_241918994();
    result = sub_24192B80C();
    v13 = v12 & 1;
  }
  else
  {
    swift_release();
    result = 0;
    v10 = 0;
    v13 = 0;
    v11 = 0;
  }
  *a2 = result;
  a2[1] = v10;
  a2[2] = v13;
  a2[3] = v11;
  return result;
}

double sub_241916E30@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  _QWORD v17[2];

  v4 = sub_24192B8D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24192B5FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    if (qword_25715EA00 != -1)
      swift_once();
    v12 = qword_257161F68;
  }
  else
  {
    if (qword_25715E9F8 != -1)
      swift_once();
    v12 = qword_257161F50;
  }
  v13 = __swift_project_value_buffer(v8, (uint64_t)v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
  sub_24192B8FC();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
  v14 = sub_24192B8F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v17[1] = sub_24192B890();
  v15 = sub_24192B98C();
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v15;
  result = 0.0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_BYTE *)(a2 + 64) = 0;
  return result;
}

uint64_t sub_241917000@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_241917124@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  int *v52;
  char *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  char *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v72 = a2;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EBF0);
  v3 = MEMORY[0x24BDAC7A8](v69);
  v73 = (uint64_t)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v64 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v71 = (uint64_t)v64 - v8;
  v76 = sub_24192B794();
  v66 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v67 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25715EBF8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v70 = (uint64_t)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v64 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v77 = (uint64_t)v64 - v16;
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v74 = (id)objc_opt_self();
  v75 = ObjCClassFromMetadata;
  v18 = objc_msgSend(v74, sel_bundleForClass_, ObjCClassFromMetadata);
  v19 = (void *)sub_24192BA1C();
  v64[1] = "MPLE_DATA_FOOTER";
  v20 = (void *)sub_24192BA1C();
  v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, v20);

  v22 = sub_24192BA28();
  v65 = v23;

  v24 = 0;
  v25 = 0;
  v68 = a1;
  if ((a1 & 1) == 0)
  {
    v26 = objc_msgSend(v74, sel_bundleForClass_, v75);
    v27 = (void *)sub_24192BA1C();
    v28 = (void *)sub_24192BA1C();
    v29 = v22;
    v30 = objc_msgSend(v26, sel_localizedStringForKey_value_table_, v27, 0, v28);

    v24 = sub_24192BA28();
    v25 = v31;

    v22 = v29;
  }
  v78 = 0x4000000000000000;
  v32 = *MEMORY[0x24BDF1878];
  v33 = v67;
  v66 = *(_QWORD *)(v66 + 104);
  ((void (*)(char *, uint64_t, uint64_t))v66)(v67, v32, v76);
  sub_2419189D8();
  sub_24192B608();
  v34 = &v15[v10[7]];
  *(_QWORD *)v34 = 0x656E6F687069;
  *((_QWORD *)v34 + 1) = 0xE600000000000000;
  v35 = (uint64_t *)&v15[v10[8]];
  v36 = v65;
  *v35 = v22;
  v35[1] = v36;
  v37 = (uint64_t *)&v15[v10[9]];
  *v37 = v24;
  v37[1] = v25;
  sub_241917774((uint64_t *)&v15[v10[10]]);
  sub_241918B40((uint64_t)v15, v77, &qword_25715EBF8);
  v38 = objc_msgSend(v74, sel_bundleForClass_, v75);
  v39 = (void *)sub_24192BA1C();
  v40 = (void *)sub_24192BA1C();
  v41 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, 0, v40);

  v42 = sub_24192BA28();
  v44 = v43;

  v45 = 0;
  v46 = 0;
  if ((v68 & 1) == 0)
  {
    v47 = objc_msgSend(v74, sel_bundleForClass_, v75);
    v48 = (void *)sub_24192BA1C();
    v49 = (void *)sub_24192BA1C();
    v50 = objc_msgSend(v47, sel_localizedStringForKey_value_table_, v48, 0, v49);

    v45 = sub_24192BA28();
    v46 = v51;

  }
  v78 = 0x4000000000000000;
  ((void (*)(char *, uint64_t, uint64_t))v66)(v33, v32, v76);
  sub_24192B608();
  v52 = (int *)v69;
  v53 = &v7[*(int *)(v69 + 28)];
  *(_QWORD *)v53 = 0x746177656C707061;
  *((_QWORD *)v53 + 1) = 0xEA00000000006863;
  v54 = (uint64_t *)&v7[v52[8]];
  *v54 = v42;
  v54[1] = v44;
  v55 = (uint64_t *)&v7[v52[9]];
  *v55 = v45;
  v55[1] = v46;
  v56 = v52[10];
  *(_QWORD *)&v7[v56] = sub_24192B8CC();
  v57 = v71;
  sub_241918B40((uint64_t)v7, v71, &qword_25715EBF0);
  v58 = v77;
  v59 = v70;
  sub_241918A1C(v77, v70, &qword_25715EBF8);
  v60 = v73;
  sub_241918A1C(v57, v73, &qword_25715EBF0);
  v61 = v72;
  sub_241918A1C(v59, v72, &qword_25715EBF8);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC08);
  sub_241918A1C(v60, v61 + *(int *)(v62 + 48), &qword_25715EBF0);
  sub_241918A60(v57, &qword_25715EBF0);
  sub_241918A60(v58, &qword_25715EBF8);
  sub_241918A60(v60, &qword_25715EBF0);
  return sub_241918A60(v59, &qword_25715EBF8);
}

uint64_t sub_241917774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_24192B8CC();
  v3 = sub_24192B8C0();
  result = sub_24192B8CC();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

uint64_t sub_241917804@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_241917928@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
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
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  void (*v16)(_BYTE *, _BYTE *, uint64_t);
  void (*v17)(_BYTE *, uint64_t);
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECD0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECD8);
  v5 = *(_QWORD *)(a1 + 16);
  sub_24192BA04();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECE0);
  sub_24192B65C();
  swift_getTupleTypeMetadata2();
  v6 = sub_24192BA04();
  v7 = MEMORY[0x24BDF5428];
  MEMORY[0x24269E7D4](MEMORY[0x24BDF5428], v6);
  sub_24192B944();
  sub_24192B65C();
  swift_getTupleTypeMetadata3();
  v8 = sub_24192BA04();
  MEMORY[0x24269E7D4](v7, v8);
  v9 = sub_24192B944();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v19[-v14];
  v20 = v5;
  v21 = v2;
  sub_24192B6F8();
  sub_24192B938();
  MEMORY[0x24269E7D4](MEMORY[0x24BDF4498], v9);
  v16 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16);
  v16(v15, v13, v9);
  v17 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v16(a2, v15, v9);
  return ((uint64_t (*)(_BYTE *, uint64_t))v17)(v15, v9);
}

uint64_t sub_241917B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  int v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t KeyPath;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;
  unsigned __int8 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  _QWORD v79[3];
  uint64_t v80[3];
  _QWORD v81[2];

  v54 = a3;
  sub_24192BA04();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECE0);
  sub_24192B65C();
  swift_getTupleTypeMetadata2();
  v5 = sub_24192BA04();
  v52 = MEMORY[0x24269E7D4](MEMORY[0x24BDF5428], v5);
  v6 = sub_24192B944();
  v53 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v41 - v7;
  v9 = sub_24192B65C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)&v41 - v14;
  type metadata accessor for CheckInDataView.DeviceRow(0, a2, v15, v16);
  swift_bridgeObjectRetain();
  v59 = sub_24192B8CC();
  v58 = sub_24192B77C();
  KeyPath = swift_getKeyPath();
  v50 = sub_24192B71C();
  sub_2419180F4(a1, a2, v17, v18, (uint64_t)&v67);
  v19 = v68;
  v55 = v67;
  v43 = v68;
  v20 = v69;
  v42 = v69;
  v45 = v70;
  v48 = v71;
  v47 = v72;
  v46 = v73;
  v56 = v74;
  v49 = v75;
  v61 = a2;
  v62 = a1;
  sub_24192B6F8();
  sub_24192B938();
  sub_24192B764();
  v21 = MEMORY[0x24269E7D4](MEMORY[0x24BDF4498], v6);
  sub_24192B878();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v8, v6);
  v81[0] = v21;
  v81[1] = MEMORY[0x24BDECC60];
  v41 = v9;
  v52 = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v9, v81);
  v44 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v22 = v60;
  v44(v60, v13, v9);
  v53 = *(_QWORD *)(v10 + 8);
  ((void (*)(char *, uint64_t))v53)(v13, v9);
  v79[0] = v59;
  v79[1] = KeyPath;
  v79[2] = v58;
  v67 = v50;
  v68 = 0;
  v69 = 1;
  v23 = v55;
  v70 = v55;
  v71 = v19;
  LOBYTE(v72) = v20;
  v24 = v48;
  v73 = v45;
  v74 = v48;
  v25 = v47;
  LOBYTE(v21) = v46;
  v75 = v47;
  v76 = v46;
  v77 = v56;
  v78 = v49;
  v80[0] = (uint64_t)v79;
  v80[1] = (uint64_t)&v67;
  v51 = v13;
  v26 = v22;
  v27 = v41;
  v44(v13, v26, v41);
  v80[2] = (uint64_t)v13;
  swift_retain();
  swift_retain();
  swift_retain();
  v28 = v43;
  v29 = v42;
  sub_241918BF8(v23, v43, v42);
  swift_bridgeObjectRetain();
  v30 = v24;
  v31 = v24;
  v32 = v25;
  v33 = v25;
  v34 = v21;
  LOBYTE(v25) = v21;
  v35 = v56;
  sub_24191984C(v30, v32, v34, v56);
  v66[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_25715ECD0);
  v66[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_25715ECD8);
  v66[2] = v27;
  v63 = sub_24191987C();
  v64 = sub_241919930(&qword_25715ED00, &qword_25715ECD8, MEMORY[0x24BDF4700]);
  v65 = v52;
  sub_2419169B0(v80, 3uLL, (uint64_t)v66);
  v36 = (void (*)(char *, uint64_t))v53;
  ((void (*)(char *, uint64_t))v53)(v60, v27);
  sub_241918C08(v55, v28, v29);
  swift_bridgeObjectRelease();
  sub_241919900(v31, v33, v25, v35);
  swift_release();
  swift_release();
  swift_release();
  v36(v51, v27);
  v37 = v74;
  v38 = v75;
  LOBYTE(v10) = v76;
  v39 = v77;
  sub_241918C08(v70, v71, v72);
  swift_bridgeObjectRelease();
  sub_241919900(v37, v38, v10, v39);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2419180F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = (uint64_t *)(a1 + *(int *)(type metadata accessor for CheckInDataView.DeviceRow(0, a2, a3, a4) + 32));
  v9 = v8[1];
  v23 = *v8;
  v24 = v9;
  sub_241918994();
  swift_bridgeObjectRetain();
  v10 = sub_24192B80C();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  sub_241918218(a1, a2, v15, v13, &v23);
  v17 = v23;
  v18 = v24;
  v19 = v25;
  v20 = v26;
  v21 = sub_24192B734();
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v12;
  *(_BYTE *)(a5 + 16) = v16;
  *(_QWORD *)(a5 + 24) = v14;
  *(_QWORD *)(a5 + 32) = v17;
  *(_QWORD *)(a5 + 40) = v18;
  *(_QWORD *)(a5 + 48) = v19;
  *(_QWORD *)(a5 + 56) = v20;
  *(_DWORD *)(a5 + 64) = v21;
  sub_241918BF8(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_24191984C(v17, v18, v19, v20);
  sub_241919900(v17, v18, v19, v20);
  sub_241918C08(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_241918218@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  result = type metadata accessor for CheckInDataView.DeviceRow(0, a2, a3, a4);
  v8 = *(_QWORD *)(a1 + *(int *)(result + 36) + 8);
  if (v8)
  {
    sub_241918994();
    swift_bridgeObjectRetain();
    v9 = sub_24192B80C();
    v11 = v10;
    v13 = v12 & 1;
    sub_24192B7A0();
    v8 = sub_24192B7F4();
    v15 = v14;
    v17 = v16;
    v19 = v18;
    swift_release();
    v20 = v17 & 1;
    sub_241918C08(v9, v11, v13);
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
    v20 = 0;
    v19 = 0;
  }
  *a5 = v8;
  a5[1] = v15;
  a5[2] = v20;
  a5[3] = v19;
  return result;
}

uint64_t sub_24191831C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  _QWORD v23[4];
  _QWORD v24[2];
  uint64_t v25;
  char v26;
  uint64_t v27[2];
  _QWORD v28[2];

  v23[1] = a2;
  v3 = sub_24192B8E4();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24192BA04();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECE0);
  v8 = sub_24192B65C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v23 - v13;
  type metadata accessor for CheckInDataView.DeviceRow(0, a1, v15, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF40B0], v3);
  v17 = MEMORY[0x24269E7D4](MEMORY[0x24BDF5428], v7);
  sub_24192B830();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v18 = sub_241919930(&qword_25715ED08, &qword_25715ECE0, MEMORY[0x24BDF1028]);
  v28[0] = v17;
  v28[1] = v18;
  v19 = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v8, v28);
  v20 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v20(v14, v12, v8);
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v12, v8);
  v25 = 0;
  v26 = 1;
  v27[0] = (uint64_t)&v25;
  v20(v12, v14, v8);
  v27[1] = (uint64_t)v12;
  v24[0] = MEMORY[0x24BDF4638];
  v24[1] = v8;
  v23[2] = MEMORY[0x24BDF4610];
  v23[3] = v19;
  sub_2419169B0(v27, 2uLL, (uint64_t)v24);
  v21(v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v21)(v12, v8);
}

uint64_t sub_241918558()
{
  return sub_24192B854();
}

uint64_t sub_241918570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  __int128 v5;
  _BYTE v7[16];
  _OWORD *v8;
  _OWORD v9[2];
  uint64_t v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EAF0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = *(_OWORD *)(v0 + 16);
  v9[0] = *(_OWORD *)v0;
  v9[1] = v5;
  v10 = *(_QWORD *)(v0 + 32);
  v8 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EAF8);
  sub_241919930(&qword_25715EB00, &qword_25715EAF8, MEMORY[0x24BDF5428]);
  sub_24192B7C4();
  sub_24192B704();
  sub_241919930(&qword_25715EB08, &qword_25715EAF0, MEMORY[0x24BDF1A30]);
  sub_24192B860();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24269E7BC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_241918724@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_241915CAC(*(__int128 **)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24269E7C8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_241918770@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241916320(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_241918778()
{
  unint64_t result;

  result = qword_25715EB58;
  if (!qword_25715EB58)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D748, &type metadata for SettingsModel.CheckInData);
    atomic_store(result, (unint64_t *)&qword_25715EB58);
  }
  return result;
}

unint64_t sub_2419187BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25715EB60;
  if (!qword_25715EB60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EB38);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25715EB60);
  }
  return result;
}

double sub_241918818@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241916E30(*(_BYTE *)(v1 + 16), a1);
}

unint64_t sub_241918820()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25715EB88;
  if (!qword_25715EB88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EB80);
    v2[0] = sub_2419188A4();
    v2[1] = sub_241919930(&qword_25715EBC0, &qword_25715EBC8, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25715EB88);
  }
  return result;
}

unint64_t sub_2419188A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25715EB90;
  if (!qword_25715EB90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EB98);
    v2[0] = sub_241918928();
    v2[1] = sub_241919930(&qword_25715EBB0, &qword_25715EBB8, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25715EB90);
  }
  return result;
}

unint64_t sub_241918928()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25715EBA0;
  if (!qword_25715EBA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EBA8);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25715EBA0);
  }
  return result;
}

uint64_t sub_24191898C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241917124(*(unsigned __int8 *)(v1 + 16), a1);
}

unint64_t sub_241918994()
{
  unint64_t result;

  result = qword_25715EBE8;
  if (!qword_25715EBE8)
  {
    result = MEMORY[0x24269E7D4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25715EBE8);
  }
  return result;
}

unint64_t sub_2419189D8()
{
  unint64_t result;

  result = qword_25715EC00;
  if (!qword_25715EC00)
  {
    result = MEMORY[0x24269E7D4](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_25715EC00);
  }
  return result;
}

uint64_t sub_241918A1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_241918A60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_241918ABC()
{
  unint64_t result;

  result = qword_25715EC20;
  if (!qword_25715EC20)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D708, &type metadata for SettingsModel.CheckInData);
    atomic_store(result, (unint64_t *)&qword_25715EC20);
  }
  return result;
}

uint64_t sub_241918B00(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24269E7D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_241918B40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_241918B84()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241918BC8()
{
  return sub_241916B64();
}

uint64_t sub_241918BD0(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_241918BF8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_241918C08(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_241918C18()
{
  return swift_allocateGenericValueMetadata();
}

void sub_241918C20()
{
  unint64_t v0;
  unint64_t v1;

  sub_241919744();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_241918CBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(unint64_t, unint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  v12 = v11 + 16;
  v13 = v11 | *(_DWORD *)(v7 + 80) & 0xF8;
  if (v13 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0
    || ((v11 + 16 + ((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v11)
     + *(_QWORD *)(v10 + 64) > 0x18)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
    swift_retain();
  }
  else
  {
    v17 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    v18 = (_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    v19 = (_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v18 = *v19;
    v18[1] = v19[1];
    v20 = (_QWORD *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
    v21 = (_QWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v20 = *v21;
    v20[1] = v21[1];
    v22 = (_QWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
    v23 = (_QWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v22 = *v23;
    v22[1] = v23[1];
    v24 = ((unint64_t)v22 + v12) & v17;
    v25 = ((unint64_t)v23 + v12) & v17;
    v26 = *(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v24, v25, v9);
  }
  return a1;
}

uint64_t sub_241918E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  v6 = (a1 + *(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((((((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_241918EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64) + 7;
  v9 = (_QWORD *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  v9[1] = v10[1];
  v11 = (_QWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v11[1] = v12[1];
  v13 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v13[1] = v14[1];
  v15 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = ((unint64_t)v13 + v17 + 16) & ~v17;
  v19 = ((unint64_t)v14 + v17 + 16) & ~v17;
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v18, v19, v15);
  return a1;
}

uint64_t sub_241918FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64) + 7;
  v9 = (_QWORD *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = (_QWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 24))(((unint64_t)v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), ((unint64_t)v14 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_241919114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  _OWORD *v11;
  _OWORD *v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64) + 7;
  v9 = (_OWORD *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_OWORD *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  v11 = (_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v13 = (_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 32))(((unint64_t)v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), ((unint64_t)v14 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_2419191D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = *(_QWORD *)(v7 + 64) + 7;
  v9 = (_QWORD *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRelease();
  v11 = (_QWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRelease();
  v13 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 40))(((unint64_t)v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), ((unint64_t)v14 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_2419192CC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  int v20;
  unsigned int v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25715EC40);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if (v8 <= v11)
    v12 = *(_DWORD *)(v10 + 84);
  else
    v12 = *(_DWORD *)(v7 + 84);
  if (v12 <= 0x7FFFFFFF)
    v13 = 0x7FFFFFFF;
  else
    v13 = v12;
  if (!a2)
    return 0;
  v14 = v6;
  v15 = *(_QWORD *)(v7 + 64);
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = v16 + 16;
  if (a2 <= v13)
    goto LABEL_27;
  v18 = ((v17 + ((((((v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v16)
      + *(_QWORD *)(v10 + 64);
  v19 = 8 * v18;
  if (v18 <= 3)
  {
    v22 = ((a2 - v13 + ~(-1 << v19)) >> v19) + 1;
    if (HIWORD(v22))
    {
      v20 = *(_DWORD *)(a1 + v18);
      if (!v20)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v22 > 0xFF)
    {
      v20 = *(unsigned __int16 *)(a1 + v18);
      if (!*(_WORD *)(a1 + v18))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v22 < 2)
    {
LABEL_27:
      if (v8 == v13)
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v14);
      v25 = (a1 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
      if ((v12 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 48))((v17 + ((((v25 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v16, v11, v9);
      v26 = *(_QWORD *)(v25 + 8);
      if (v26 >= 0xFFFFFFFF)
        LODWORD(v26) = -1;
      return (v26 + 1);
    }
  }
  v20 = *(unsigned __int8 *)(a1 + v18);
  if (!*(_BYTE *)(a1 + v18))
    goto LABEL_27;
LABEL_18:
  v23 = (v20 - 1) << v19;
  if (v18 > 3)
    v23 = 0;
  if ((_DWORD)v18)
  {
    if (v18 <= 3)
      v24 = ((v17 + ((((((v15 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)) & ~(_DWORD)v16)
          + *(_DWORD *)(v10 + 64);
    else
      v24 = 4;
    __asm { BR              X12 }
  }
  return v13 + v23 + 1;
}

void sub_2419194BC(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_25715EC40) - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v8 + 84) <= *(_DWORD *)(v9 + 84))
    v10 = *(_DWORD *)(v9 + 84);
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (v10 <= 0x7FFFFFFF)
    v11 = 0x7FFFFFFF;
  else
    v11 = v10;
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = ((v12
        + 16
        + ((((((*(_QWORD *)(v8 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v12)
      + *(_QWORD *)(v9 + 64);
  if (a3 <= v11)
  {
    v14 = 0;
  }
  else if (v13 <= 3)
  {
    v16 = ((a3 - v11 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
    if (HIWORD(v16))
    {
      v14 = 4u;
    }
    else if (v16 >= 0x100)
    {
      v14 = 2;
    }
    else
    {
      v14 = v16 > 1;
    }
  }
  else
  {
    v14 = 1u;
  }
  if (v11 < a2)
  {
    v15 = ~v11 + a2;
    if (v13 < 4)
    {
      if ((_DWORD)v13)
      {
        v17 = v15 & ~(-1 << (8 * v13));
        bzero(a1, ((v12+ 16+ ((((((*(_QWORD *)(v8 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v12)+ *(_QWORD *)(v9 + 64));
        if ((_DWORD)v13 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if ((_DWORD)v13 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, ((v12+ 16+ ((((((*(_QWORD *)(v8 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v12)+ *(_QWORD *)(v9 + 64));
      *(_DWORD *)a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X1 }
}

uint64_t type metadata accessor for CheckInDataView.DeviceRow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CheckInDataView.DeviceRow);
}

void sub_241919744()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25715ECC8)
  {
    sub_2419189D8();
    v0 = sub_24192B614();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25715ECC8);
  }
}

uint64_t sub_24191979C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EAF0);
  sub_241919930(&qword_25715EB08, &qword_25715EAF0, MEMORY[0x24BDF1A30]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_241919800()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_241919834@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241917B38(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241919844@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24191831C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24191984C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_241918BF8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24191987C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25715ECE8;
  if (!qword_25715ECE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECD0);
    v2 = sub_241919930(&qword_25715ECF0, &qword_25715ECF8, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25715ECE8);
  }
  return result;
}

uint64_t sub_241919900(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_241918C08(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_241919930(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24269E7D4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24269E744](a1, v6, a5);
}

void sub_24191999C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECD0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECD8);
  sub_24192BA04();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715ECE0);
  sub_24192B65C();
  swift_getTupleTypeMetadata2();
  v0 = sub_24192BA04();
  v1 = MEMORY[0x24BDF5428];
  MEMORY[0x24269E7D4](MEMORY[0x24BDF5428], v0);
  sub_24192B944();
  sub_24192B65C();
  swift_getTupleTypeMetadata3();
  v2 = sub_24192BA04();
  MEMORY[0x24269E7D4](v1, v2);
  sub_24192B944();
  JUMPOUT(0x24269E7D4);
}

id sub_241919AC4()
{
  return sub_2419159EC();
}

uint64_t sub_241919ADC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessagesSettingsUtilities()
{
  return objc_opt_self();
}

uint64_t destroy for SendRecieveView()
{
  swift_release();
  return swift_release();
}

uint64_t _s18MessagesSettingsUI15SendRecieveViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SendRecieveView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for SendRecieveView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SendRecieveView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SendRecieveView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SendRecieveView()
{
  return &type metadata for SendRecieveView;
}

uint64_t sub_241919CC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_241919CD8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EDA8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v8 = sub_24192B710();
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EDB0);
  sub_241919E98(a1, a2, a3, (uint64_t)&v8[*(int *)(v9 + 44)]);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v12 = (void *)sub_24192BA1C();
  v13 = (void *)sub_24192BA1C();
  v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

  v15 = sub_24192BA28();
  v17 = v16;

  v19[0] = v15;
  v19[1] = v17;
  sub_24191A0CC();
  sub_241918994();
  sub_24192B86C();
  swift_bridgeObjectRelease();
  return sub_24191A118((uint64_t)v8);
}

uint64_t sub_241919E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  char *v30;
  uint64_t v31;

  v29 = a3;
  v28 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EDC0);
  v31 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - v9;
  sub_24192B704();
  v11 = sub_24192B800();
  v25 = v12;
  v26 = v11;
  v27 = v13;
  v15 = v14 & 1;
  sub_24192B704();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = v28;
  *(_BYTE *)(v16 + 32) = v29;
  swift_retain();
  swift_retain();
  sub_24192B92C();
  v17 = v30;
  v18 = v31;
  v19 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v19(v30, v10, v6);
  v20 = v25;
  v21 = v26;
  *(_QWORD *)a4 = v26;
  *(_QWORD *)(a4 + 8) = v20;
  *(_BYTE *)(a4 + 16) = v15;
  *(_QWORD *)(a4 + 24) = v27;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EDC8);
  v19((char *)(a4 + *(int *)(v22 + 48)), v17, v6);
  sub_241918BF8(v21, v20, v15);
  v23 = *(void (**)(char *, uint64_t))(v18 + 8);
  swift_bridgeObjectRetain();
  v23(v10, v6);
  v23(v17, v6);
  sub_241918C08(v21, v20, v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24191A0C0()
{
  uint64_t v0;

  return sub_241919CD8(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(unsigned __int8 *)(v0 + 16));
}

unint64_t sub_24191A0CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25715EDB8;
  if (!qword_25715EDB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EDA8);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_25715EDB8);
  }
  return result;
}

uint64_t sub_24191A118(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EDA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24191A158()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24191A184()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EDD0);
  return sub_24192B9A4();
}

uint64_t sub_24191A1D8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EDA8);
  sub_24191A0CC();
  sub_241918994();
  return swift_getOpaqueTypeConformance2();
}

Swift::Void __swiftcall CKSettingsHostingViewController.viewDidLoad()()
{
  char *v0;
  char *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  objc_super v16;

  v1 = v0;
  v16.super_class = (Class)CKSettingsHostingViewController;
  objc_msgSendSuper2(&v16, sel_viewDidLoad);
  type metadata accessor for SettingsContext();
  swift_allocObject();
  v2 = sub_24191AA18();
  type metadata accessor for SettingsModel();
  swift_allocObject();
  swift_retain();
  v15 = sub_24191EDBC(1, 0, 1, (uint64_t)&unk_2511BD420, 1, 1, 0, 1, (uint64_t)&v12, 0, 1, 1, 0, 1, 1, 1, 0, 1);
  sub_24192B908();
  v3 = v12;
  v4 = v13;
  v12 = v2;
  v13 = v3;
  v14 = v4;
  v5 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25715EDD8));
  swift_retain();
  swift_retain();
  swift_retain();
  v6 = (void *)sub_24192B728();
  objc_msgSend(v1, sel_addChildViewController_, v6);
  v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v6, sel_view);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v8, sel_addSubview_, v9);

      objc_msgSend(v6, sel_didMoveToParentViewController_, v1);
      swift_release();
      swift_release();
      swift_release_n();
      v11 = *(void **)&v1[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController];
      *(_QWORD *)&v1[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController] = v6;

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

Swift::Void __swiftcall CKSettingsHostingViewController.viewDidLayoutSubviews()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.super_class = (Class)CKSettingsHostingViewController;
  objc_msgSendSuper2(&v14, sel_viewDidLayoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController];
  if (v1)
  {
    v2 = objc_msgSend(v1, sel_view);
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v0, sel_view);
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, sel_bounds);
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;

        objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void __swiftcall CKSettingsHostingViewController.init(nibName:bundle:)(CKSettingsHostingViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_24192BA1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

id CKSettingsHostingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController] = 0;
  if (a2)
  {
    v5 = (void *)sub_24192BA1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)CKSettingsHostingViewController;
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void __swiftcall CKSettingsHostingViewController.init(coder:)(CKSettingsHostingViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id CKSettingsHostingViewController.init(coder:)(void *a1)
{
  uint64_t v1;
  id v3;
  objc_super v5;

  *(_QWORD *)(v1 + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
  v5.super_class = (Class)CKSettingsHostingViewController;
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

unint64_t type metadata accessor for CKSettingsHostingViewController()
{
  unint64_t result;

  result = qword_25715EE10;
  if (!qword_25715EE10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25715EE10);
  }
  return result;
}

uint64_t sub_24191A870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC18MessagesSettingsUI15SettingsContext___observationRegistrar;
  v2 = sub_24192B5E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_24191A91C()
{
  sub_24191A870();
  return swift_deallocClassInstance();
}

uint64_t sub_24191A940()
{
  return type metadata accessor for SettingsContext();
}

uint64_t type metadata accessor for SettingsContext()
{
  uint64_t result;

  result = qword_25715EE48;
  if (!qword_25715EE48)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24191A984()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24192B5E4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

_QWORD *sub_24191AA18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  type metadata accessor for SummarizationManager();
  v0[2] = swift_allocObject();
  type metadata accessor for ReadReceiptsManager();
  v0[3] = swift_allocObject();
  type metadata accessor for FilterSendersManager();
  v0[4] = swift_allocObject();
  type metadata accessor for RaiseToListenManager();
  v0[5] = swift_allocObject();
  type metadata accessor for SubjectFieldManager();
  v0[6] = swift_allocObject();
  type metadata accessor for KeepMessagesManager();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = objc_msgSend(objc_allocWithZone((Class)CKKeepMessagesPreferenceManager), sel_init);
  v0[7] = v1;
  type metadata accessor for AudioExpirationManager();
  v0[8] = swift_allocObject();
  type metadata accessor for MMSManager();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = objc_msgSend(objc_allocWithZone((Class)CKMMSSettingsHelper), sel_init);
  v0[9] = v2;
  type metadata accessor for CharacterCountManager();
  v0[10] = swift_allocObject();
  type metadata accessor for LowQualityImagesManager();
  v0[11] = swift_allocObject();
  type metadata accessor for ShowContactPhotosManager();
  v0[12] = swift_allocObject();
  type metadata accessor for SendAsTextMessageManager();
  v0[13] = swift_allocObject();
  type metadata accessor for BusinessUpdatesManager();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = objc_msgSend(objc_allocWithZone((Class)BusinessSettingsHelper), sel_init);
  v0[14] = v3;
  sub_24192B5D8();
  return v0;
}

_QWORD *sub_24191ABDC()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for SettingsContext();
  v0 = swift_allocObject();
  result = sub_24191AA18();
  qword_257161F48 = v0;
  return result;
}

uint64_t sub_24191AC18@<X0>(_QWORD *a1@<X8>)
{
  if (qword_25715E9E8 != -1)
    swift_once();
  *a1 = qword_257161F48;
  return swift_retain();
}

uint64_t sub_24191AC6C()
{
  uint64_t v1;

  sub_24191ACA4();
  sub_24192B6B0();
  return v1;
}

unint64_t sub_24191ACA4()
{
  unint64_t result;

  result = qword_25715EF60;
  if (!qword_25715EF60)
  {
    result = MEMORY[0x24269E7D4](&unk_24192CE94, &type metadata for SettingsContextKey);
    atomic_store(result, (unint64_t *)&qword_25715EF60);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsContextKey()
{
  return &type metadata for SettingsContextKey;
}

void sub_24191ACF8()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = (id)sub_24192BA64();
  objc_msgSend(v0, sel_setAudioMessageAutoKeep_, v1);

}

void KeepMessagesPreference.id.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL static KeepMessagesPreference.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t KeepMessagesPreference.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t KeepMessagesPreference.description.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1918985593;
  if (*v0 != 1)
    v1 = 0x72657665726F66;
  if (*v0)
    return v1;
  else
    return 0x68746E6F6DLL;
}

uint64_t sub_24191ADE8()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  type metadata accessor for CloudSettingsSwiftUtils();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = (void *)sub_24192BA1C();
  v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  v6 = sub_24192BA28();
  return v6;
}

MessagesSettingsUI::KeepMessagesPreference_optional __swiftcall KeepMessagesPreference.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (MessagesSettingsUI::KeepMessagesPreference_optional)rawValue;
}

void *static KeepMessagesPreference.allCases.getter()
{
  return &unk_2511BD458;
}

BOOL sub_24191AFBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24191AFD4()
{
  unint64_t result;

  result = qword_25715EF68;
  if (!qword_25715EF68)
  {
    result = MEMORY[0x24269E7D4](&protocol conformance descriptor for KeepMessagesPreference, &type metadata for KeepMessagesPreference);
    atomic_store(result, (unint64_t *)&qword_25715EF68);
  }
  return result;
}

uint64_t sub_24191B018()
{
  sub_24192BAB8();
  sub_24192BAC4();
  return sub_24192BAD0();
}

uint64_t sub_24191B05C()
{
  return sub_24192BAC4();
}

uint64_t sub_24191B084()
{
  sub_24192BAB8();
  sub_24192BAC4();
  return sub_24192BAD0();
}

MessagesSettingsUI::KeepMessagesPreference_optional sub_24191B0C4(Swift::Int *a1)
{
  return KeepMessagesPreference.init(rawValue:)(*a1);
}

void sub_24191B0CC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_24191B0DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25715EF70;
  if (!qword_25715EF70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EF78);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25715EF70);
  }
  return result;
}

void sub_24191B128(_QWORD *a1@<X8>)
{
  *a1 = &unk_2511BD480;
}

unint64_t sub_24191B13C()
{
  unint64_t result;

  result = qword_25715EF80;
  if (!qword_25715EF80)
  {
    result = MEMORY[0x24269E7D4](&protocol conformance descriptor for KeepMessagesPreference, &type metadata for KeepMessagesPreference);
    atomic_store(result, (unint64_t *)&qword_25715EF80);
  }
  return result;
}

void sub_24191B180(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL sub_24191B18C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_24191B1A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_24191B1B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_24191B1C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_24191B1DC()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1918985593;
  if (*v0 != 1)
    v1 = 0x72657665726F66;
  if (*v0)
    return v1;
  else
    return 0x68746E6F6DLL;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KeepMessagesPreference(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for KeepMessagesPreference(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24191B318 + 4 * byte_24192CED5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24191B34C + 4 * byte_24192CED0[v4]))();
}

uint64_t sub_24191B34C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191B354(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24191B35CLL);
  return result;
}

uint64_t sub_24191B368(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24191B370);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24191B374(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191B37C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191B388(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24191B394(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KeepMessagesPreference()
{
  return &type metadata for KeepMessagesPreference;
}

uint64_t destroy for SettingsContentView()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s18MessagesSettingsUI19SettingsContentViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SettingsContentView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
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

uint64_t assignWithTake for SettingsContentView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsContentView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsContentView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingsContentView()
{
  return &type metadata for SettingsContentView;
}

uint64_t sub_24191B598()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24191B5A8()
{
  sub_24191ACA4();
  swift_retain();
  return sub_24192B6BC();
}

uint64_t sub_24191B604@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;
  __int128 v8;

  v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EF88);
  sub_24192B920();
  KeyPath = swift_getKeyPath();
  sub_24192B908();
  sub_24192B908();
  v5 = swift_getKeyPath();
  *(_QWORD *)a1 = KeyPath;
  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_BYTE *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v5;
  *(_QWORD *)(a1 + 80) = v3;
  return swift_retain();
}

uint64_t sub_24191B704@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_24191ACA4();
  result = sub_24192B6B0();
  *a1 = v3;
  return result;
}

unint64_t sub_24191B758()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25715EF90;
  if (!qword_25715EF90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EF98);
    v2[0] = sub_24191B7C4();
    v2[1] = sub_24191B808();
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25715EF90);
  }
  return result;
}

unint64_t sub_24191B7C4()
{
  unint64_t result;

  result = qword_25715EFA0;
  if (!qword_25715EFA0)
  {
    result = MEMORY[0x24269E7D4](&unk_24192DE54, &type metadata for IOSSettingsView);
    atomic_store(result, (unint64_t *)&qword_25715EFA0);
  }
  return result;
}

unint64_t sub_24191B808()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25715EFA8;
  if (!qword_25715EFA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25715EFB0);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_25715EFA8);
  }
  return result;
}

unint64_t sub_24191B854(char a1)
{
  if (!a1)
    return 0xD000000000000013;
  if (a1 == 1)
    return 0xD000000000000010;
  return 0xD000000000000012;
}

uint64_t type metadata accessor for AppIntentsHelper()
{
  return objc_opt_self();
}

uint64_t sub_24191B8D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  char v11;
  _OWORD v12[2];
  _OWORD v13[2];

  v5 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v6 = (void *)sub_24192BA1C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithSuiteName_, v6);

  if (v7)
  {
    v8 = (void *)sub_24192BA1C();
    v9 = objc_msgSend(v7, sel_objectForKey_, v8);

    if (v9)
    {
      sub_24192BA94();

      swift_unknownObjectRelease();
      sub_24191BA4C(v12, v13);
      sub_24191BA4C(v13, v12);
      if ((swift_dynamicCast() & 1) != 0)
        a4 = v11;
    }
    else
    {

    }
  }
  return a4 & 1;
}

_OWORD *sub_24191BA4C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_24191BA5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFNotificationCenter *center;

  v8 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v9 = (void *)sub_24192BA1C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithSuiteName_, v9);

  if (v10)
  {
    v11 = (void *)sub_24192BA1C();
    objc_msgSend(v10, sel_setBool_forKey_, a4 & 1, v11);

    objc_msgSend(v10, sel_synchronize);
    center = CFNotificationCenterGetDarwinNotifyCenter();
    v12 = (__CFString *)sub_24192BA1C();
    CFNotificationCenterPostNotification(center, v12, 0, 0, 1u);

    if (a6)
    {
      v13 = (__CFString *)sub_24192BA1C();
      CFNotificationCenterPostNotification(center, v13, 0, 0, 1u);

    }
  }
}

uint64_t SettingsItem.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SettingsItem.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SettingsItem()
{
  return objc_opt_self();
}

uint64_t method lookup function for SettingsItem()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_24191BC70@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 35);
  return result;
}

uint64_t sub_24191BCFC()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191BDA4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_24191BE28@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_24191BEB4()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191BF5C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_24191BFE0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 17);
  return result;
}

uint64_t sub_24191C06C()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191C114()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 19);
}

uint64_t sub_24191C198@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 19);
  return result;
}

uint64_t sub_24191C224()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191C2CC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 20);
}

uint64_t sub_24191C350@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 20);
  return result;
}

uint64_t sub_24191C3DC()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191C484()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_24191C508@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 32);
  return result;
}

uint64_t sub_24191C594()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191C63C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t sub_24191C6C0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 33);
  return result;
}

uint64_t sub_24191C74C()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191C7F4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 34);
}

uint64_t sub_24191C878@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 34);
  return result;
}

uint64_t sub_24191C904()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191C9AC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 35);
}

uint64_t sub_24191CA30()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 37);
}

uint64_t sub_24191CAB4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 37);
  return result;
}

uint64_t sub_24191CB40()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191CBE8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 38);
}

uint64_t sub_24191CC6C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 38);
  return result;
}

uint64_t sub_24191CCF8()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191CDA0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 39);
}

uint64_t sub_24191CE24@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 39);
  return result;
}

uint64_t sub_24191CEB0()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191CF58()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_24191CFDC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 40);
  return result;
}

uint64_t sub_24191D068()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191D110@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a1 = *(_BYTE *)(v1 + 42);
  return result;
}

uint64_t sub_24191D19C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 42);
  return result;
}

uint64_t sub_24191D228()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191D2D0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 43);
}

uint64_t sub_24191D354@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 43);
  return result;
}

uint64_t sub_24191D3E0()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191D488()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 45);
}

uint64_t sub_24191D50C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 45);
  return result;
}

uint64_t sub_24191D598()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191D640()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 46);
}

uint64_t sub_24191D6C4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 46);
  return result;
}

uint64_t sub_24191D750()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191D7F8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 47);
}

uint64_t sub_24191D87C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 47);
  return result;
}

uint64_t sub_24191D908()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t sub_24191D9B0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t sub_24191DA34@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 50);
  return result;
}

uint64_t sub_24191DAC0()
{
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5C0();
  return swift_release();
}

uint64_t SettingsModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC18MessagesSettingsUI13SettingsModel___observationRegistrar;
  v2 = sub_24192B5E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SettingsModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC18MessagesSettingsUI13SettingsModel___observationRegistrar;
  v2 = sub_24192B5E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24191DC0C()
{
  return type metadata accessor for SettingsModel();
}

uint64_t type metadata accessor for SettingsModel()
{
  uint64_t result;

  result = qword_25715F118;
  if (!qword_25715F118)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24191DC50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24192B5E4();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for SettingsModel()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for SettingsModel.MessageReceivedSound(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24191DD78 + 4 * byte_24192D1D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24191DDAC + 4 * byte_24192D1D0[v4]))();
}

uint64_t sub_24191DDAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191DDB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24191DDBCLL);
  return result;
}

uint64_t sub_24191DDC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24191DDD0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24191DDD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191DDDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsModel.MessageReceivedSound()
{
  return &type metadata for SettingsModel.MessageReceivedSound;
}

ValueMetadata *type metadata accessor for SettingsModel.ShareNamePhoto()
{
  return &type metadata for SettingsModel.ShareNamePhoto;
}

ValueMetadata *type metadata accessor for SettingsModel.CheckInData()
{
  return &type metadata for SettingsModel.CheckInData;
}

ValueMetadata *type metadata accessor for SettingsModel.AudioExpiration()
{
  return &type metadata for SettingsModel.AudioExpiration;
}

uint64_t _s18MessagesSettingsUI13SettingsModelC18SettingsEnablementOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18MessagesSettingsUI13SettingsModelC18SettingsEnablementOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24191DF0C + 4 * byte_24192D1DF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24191DF40 + 4 * byte_24192D1DA[v4]))();
}

uint64_t sub_24191DF40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191DF48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24191DF50);
  return result;
}

uint64_t sub_24191DF5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24191DF64);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24191DF68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24191DF70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24191DF7C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsModel.SettingsEnablement()
{
  return &type metadata for SettingsModel.SettingsEnablement;
}

uint64_t sub_24191DF98()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  return v5;
}

BOOL sub_24191E09C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24191E0B4()
{
  sub_24192BAB8();
  sub_24192BAC4();
  return sub_24192BAD0();
}

uint64_t sub_24191E100()
{
  return sub_24192BAC4();
}

uint64_t sub_24191E134()
{
  sub_24192BAB8();
  sub_24192BAC4();
  return sub_24192BAD0();
}

_QWORD *sub_24191E17C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 3)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_24191E19C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 3;
  if (!*v1)
    v2 = 0;
  *a1 = v2;
}

void sub_24191E1B4(_QWORD *a1@<X8>)
{
  *a1 = &unk_2511BD4A8;
}

uint64_t sub_24191E1C4()
{
  return sub_24191DF98();
}

uint64_t sub_24191E1CC()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  return v5;
}

void sub_24191E2CC(_QWORD *a1@<X8>)
{
  *a1 = &unk_2511BD4D0;
}

uint64_t sub_24191E2DC()
{
  return sub_24191E1CC();
}

void sub_24191E2E4(_QWORD *a1@<X8>)
{
  *a1 = &unk_2511BD4F8;
}

uint64_t sub_24191E2F4()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  return v5;
}

void sub_24191E3EC(_QWORD *a1@<X8>)
{
  *a1 = &unk_2511BD520;
}

uint64_t sub_24191E3FC()
{
  return sub_24191E2F4();
}

uint64_t sub_24191E404()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  return v5;
}

void sub_24191E4F0(_QWORD *a1@<X8>)
{
  *a1 = &unk_2511BD548;
}

uint64_t sub_24191E500()
{
  return sub_24191E404();
}

unint64_t sub_24191E50C()
{
  unint64_t result;

  result = qword_25715F878;
  if (!qword_25715F878)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D498, &type metadata for SettingsModel.SettingsEnablement);
    atomic_store(result, (unint64_t *)&qword_25715F878);
  }
  return result;
}

uint64_t sub_24191E550()
{
  return sub_24191EBCC(&qword_25715F880, &qword_25715F888);
}

uint64_t sub_24191E574(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_24191E9FC(a1, a2, a3, (uint64_t (*)(void))sub_24191E598, (uint64_t (*)(void))sub_24191E5DC, (uint64_t (*)(void))sub_24191E50C, (uint64_t (*)(void))sub_24191E620);
}

unint64_t sub_24191E598()
{
  unint64_t result;

  result = qword_25715F890;
  if (!qword_25715F890)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D444, &type metadata for SettingsModel.SettingsEnablement);
    atomic_store(result, (unint64_t *)&qword_25715F890);
  }
  return result;
}

unint64_t sub_24191E5DC()
{
  unint64_t result;

  result = qword_25715F898;
  if (!qword_25715F898)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D3E4, &type metadata for SettingsModel.SettingsEnablement);
    atomic_store(result, (unint64_t *)&qword_25715F898);
  }
  return result;
}

unint64_t sub_24191E620()
{
  unint64_t result;

  result = qword_25715F8A0;
  if (!qword_25715F8A0)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D40C, &type metadata for SettingsModel.SettingsEnablement);
    atomic_store(result, (unint64_t *)&qword_25715F8A0);
  }
  return result;
}

unint64_t sub_24191E668()
{
  unint64_t result;

  result = qword_25715F8A8;
  if (!qword_25715F8A8)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D4D8, &type metadata for SettingsModel.SettingsEnablement);
    atomic_store(result, (unint64_t *)&qword_25715F8A8);
  }
  return result;
}

unint64_t sub_24191E6B0()
{
  unint64_t result;

  result = qword_25715F8B0;
  if (!qword_25715F8B0)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D5EC, &type metadata for SettingsModel.AudioExpiration);
    atomic_store(result, (unint64_t *)&qword_25715F8B0);
  }
  return result;
}

uint64_t sub_24191E6F4()
{
  return sub_24191EBCC(&qword_25715F8B8, &qword_25715F8C0);
}

uint64_t sub_24191E718(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_24191E9FC(a1, a2, a3, (uint64_t (*)(void))sub_24191E73C, (uint64_t (*)(void))sub_24191E780, (uint64_t (*)(void))sub_24191E6B0, (uint64_t (*)(void))sub_24191E7C4);
}

unint64_t sub_24191E73C()
{
  unint64_t result;

  result = qword_25715F8C8;
  if (!qword_25715F8C8)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D560, &type metadata for SettingsModel.AudioExpiration);
    atomic_store(result, (unint64_t *)&qword_25715F8C8);
  }
  return result;
}

unint64_t sub_24191E780()
{
  unint64_t result;

  result = qword_25715F8D0;
  if (!qword_25715F8D0)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D500, &type metadata for SettingsModel.AudioExpiration);
    atomic_store(result, (unint64_t *)&qword_25715F8D0);
  }
  return result;
}

unint64_t sub_24191E7C4()
{
  unint64_t result;

  result = qword_25715F8D8;
  if (!qword_25715F8D8)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D528, &type metadata for SettingsModel.AudioExpiration);
    atomic_store(result, (unint64_t *)&qword_25715F8D8);
  }
  return result;
}

unint64_t sub_24191E80C()
{
  unint64_t result;

  result = qword_25715F8E0;
  if (!qword_25715F8E0)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D62C, &type metadata for SettingsModel.AudioExpiration);
    atomic_store(result, (unint64_t *)&qword_25715F8E0);
  }
  return result;
}

uint64_t sub_24191E854()
{
  return sub_24191EBCC(&qword_25715F8E8, &qword_25715F8F0);
}

uint64_t sub_24191E878(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_24191E9FC(a1, a2, a3, (uint64_t (*)(void))sub_24191E89C, (uint64_t (*)(void))sub_24191E8E0, (uint64_t (*)(void))sub_241918ABC, (uint64_t (*)(void))sub_24191E924);
}

unint64_t sub_24191E89C()
{
  unint64_t result;

  result = qword_25715F8F8;
  if (!qword_25715F8F8)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D6B4, &type metadata for SettingsModel.CheckInData);
    atomic_store(result, (unint64_t *)&qword_25715F8F8);
  }
  return result;
}

unint64_t sub_24191E8E0()
{
  unint64_t result;

  result = qword_25715F900;
  if (!qword_25715F900)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D654, &type metadata for SettingsModel.CheckInData);
    atomic_store(result, (unint64_t *)&qword_25715F900);
  }
  return result;
}

unint64_t sub_24191E924()
{
  unint64_t result;

  result = qword_25715F908;
  if (!qword_25715F908)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D67C, &type metadata for SettingsModel.CheckInData);
    atomic_store(result, (unint64_t *)&qword_25715F908);
  }
  return result;
}

unint64_t sub_24191E970()
{
  unint64_t result;

  result = qword_25715F910;
  if (!qword_25715F910)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D824, &type metadata for SettingsModel.ShareNamePhoto);
    atomic_store(result, (unint64_t *)&qword_25715F910);
  }
  return result;
}

uint64_t sub_24191E9B4()
{
  return sub_24191EBCC(&qword_25715F918, &qword_25715F920);
}

uint64_t sub_24191E9D8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_24191E9FC(a1, a2, a3, (uint64_t (*)(void))sub_24191EA4C, (uint64_t (*)(void))sub_24191EA90, (uint64_t (*)(void))sub_24191E970, (uint64_t (*)(void))sub_24191EAD4);
}

uint64_t sub_24191E9FC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t result;

  a1[1] = a4();
  a1[2] = a5();
  a1[3] = a6();
  result = a7();
  a1[4] = result;
  return result;
}

unint64_t sub_24191EA4C()
{
  unint64_t result;

  result = qword_25715F928;
  if (!qword_25715F928)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D7D0, &type metadata for SettingsModel.ShareNamePhoto);
    atomic_store(result, (unint64_t *)&qword_25715F928);
  }
  return result;
}

unint64_t sub_24191EA90()
{
  unint64_t result;

  result = qword_25715F930;
  if (!qword_25715F930)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D770, &type metadata for SettingsModel.ShareNamePhoto);
    atomic_store(result, (unint64_t *)&qword_25715F930);
  }
  return result;
}

unint64_t sub_24191EAD4()
{
  unint64_t result;

  result = qword_25715F938;
  if (!qword_25715F938)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D798, &type metadata for SettingsModel.ShareNamePhoto);
    atomic_store(result, (unint64_t *)&qword_25715F938);
  }
  return result;
}

unint64_t sub_24191EB1C()
{
  unint64_t result;

  result = qword_25715F940;
  if (!qword_25715F940)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D864, &type metadata for SettingsModel.ShareNamePhoto);
    atomic_store(result, (unint64_t *)&qword_25715F940);
  }
  return result;
}

unint64_t sub_24191EB64()
{
  unint64_t result;

  result = qword_25715F948;
  if (!qword_25715F948)
  {
    result = MEMORY[0x24269E7D4](&unk_24192D904, &type metadata for SettingsModel.MessageReceivedSound);
    atomic_store(result, (unint64_t *)&qword_25715F948);
  }
  return result;
}

uint64_t sub_24191EBA8()
{
  return sub_24191EBCC(&qword_25715F950, &qword_25715F958);
}

uint64_t sub_24191EBCC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_24191EC14()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 50) = *(_BYTE *)(v0 + 24);
}

void sub_24191EC2C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 47) = *(_BYTE *)(v0 + 24);
}

void sub_24191EC44()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 46) = *(_BYTE *)(v0 + 24);
}

void sub_24191EC5C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 45) = *(_BYTE *)(v0 + 24);
}

void sub_24191EC74()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 43) = *(_BYTE *)(v0 + 24);
}

void sub_24191EC8C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 42) = *(_BYTE *)(v0 + 24);
}

void sub_24191ECA4()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 40) = *(_BYTE *)(v0 + 24);
}

void sub_24191ECBC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 39) = *(_BYTE *)(v0 + 24);
}

void sub_24191ECD4()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 38) = *(_BYTE *)(v0 + 24);
}

void sub_24191ECEC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 37) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED04()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 35) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED1C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 34) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED34()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 33) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED4C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 32) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED64()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 20) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED7C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 19) = *(_BYTE *)(v0 + 24);
}

void sub_24191ED94()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 17) = *(_BYTE *)(v0 + 24);
}

void sub_24191EDAC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_24191EDBC(char a1, char a2, char a3, uint64_t a4, char a5, char a6, char a7, char a8, uint64_t a9, char a10, char a11, char a12, uint64_t a13, char a14, char a15, char a16, char a17, char a18)
{
  uint64_t v18;
  uint64_t v19;
  char v25;
  char v26;
  void *v27;
  id v28;
  unsigned __int8 v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unsigned __int8 v35;
  char v36;
  id v37;
  void *v38;
  char v39;
  char v40;
  void *v41;
  char v42;
  id v43;
  id v44;
  uint64_t result;
  char v46;
  id v47;
  unsigned __int8 v48;
  char v50;
  uint64_t v51;

  v19 = v18;
  v25 = a2 & 1;
  v26 = a7 & 1;
  sub_24192B5D8();
  *(_BYTE *)(v19 + 16) = a1;
  *(_BYTE *)(v19 + 17) = v25;
  *(_BYTE *)(v19 + 18) = a3;
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_sharedInstance);
  v29 = objc_msgSend(v28, sel_areReadReceiptsEnabled);

  *(_BYTE *)(v19 + 19) = v29;
  *(_BYTE *)(v19 + 20) = objc_msgSend((id)objc_opt_self(), sel_messageSummarizationEnabled);
  *(_QWORD *)(v19 + 24) = a4;
  v30 = objc_msgSend(v27, sel_sharedInstance);
  v31 = objc_msgSend(v30, sel_getAudioMessageAutoKeep);

  v32 = sub_24192BA58();
  *(_BYTE *)(v19 + 32) = v32 == 3;
  *(_BYTE *)(v19 + 33) = sub_24191B8D0(0, 0xD000000000000014, 0x800000024192F8B0, 1) & 1;
  *(_BYTE *)(v19 + 34) = sub_24191B8D0(2, 0xD000000000000019, 0x800000024192F8D0, 0) & 1;
  type metadata accessor for CheckInDataView.Model();
  v33 = swift_allocObject();
  sub_24192B5D8();
  swift_getKeyPath();
  v51 = v33;
  sub_241918B00(&qword_25715EAE8, (uint64_t (*)(uint64_t))type metadata accessor for CheckInDataView.Model, (uint64_t)&unk_24192CB74);
  sub_24192B5CC();
  swift_release();
  v34 = (void *)objc_opt_self();
  if (objc_msgSend(v34, sel_hasUserCompletedOnboarding))
  {
    v35 = objc_msgSend(v34, sel_shareAllLocations);
    swift_release();
    v36 = v35 ^ 1;
  }
  else
  {
    swift_release();
    v36 = 1;
  }
  *(_BYTE *)(v19 + 35) = v36;
  *(_BYTE *)(v19 + 36) = a5 & 1;
  *(_BYTE *)(v19 + 37) = a6 & 1;
  *(_BYTE *)(v19 + 38) = v26;
  *(_BYTE *)(v19 + 39) = sub_24191B8D0(0, 0xD000000000000011, 0x800000024192F8F0, 1) & 1;
  *(_BYTE *)(v19 + 40) = sub_24191B8D0(0, 0xD00000000000001ELL, 0x800000024192F910, 0) & 1;
  *(_BYTE *)(v19 + 41) = a8 & 1;
  v37 = objc_msgSend((id)objc_opt_self(), sel_keepMessagesPreference);
  sub_24191F30C(0, &qword_25715F960);
  sub_24191F30C(0, (unint64_t *)&qword_25715F968);
  v38 = (void *)sub_24192BA7C();
  v39 = sub_24192BA88();

  if ((v39 & 1) != 0)
  {

    v40 = 0;
  }
  else
  {
    v41 = (void *)sub_24192BA7C();
    v42 = sub_24192BA88();

    if ((v42 & 1) != 0)
      v40 = 1;
    else
      v40 = 2;
  }
  *(_BYTE *)(v19 + 42) = v40;
  *(_BYTE *)(v19 + 43) = a10 & 1;
  v43 = objc_msgSend(objc_allocWithZone((Class)CKMMSSettingsHelper), sel_init);
  v44 = objc_msgSend(v43, sel_isMMSEnabled);

  v50 = 2;
  result = MEMORY[0x24269E1A4](v44, &v50);
  v46 = v50;
  if (v50 == 2)
  {
    __break(1u);
  }
  else
  {

    *(_BYTE *)(v19 + 44) = v46 & 1;
    *(_BYTE *)(v19 + 45) = sub_24191B8D0(0, 0x53776F6853534D4DLL, 0xEE007463656A6275, 0) & 1;
    *(_BYTE *)(v19 + 46) = sub_24191B8D0(0, 0xD000000000000015, 0x800000024192F930, 0) & 1;
    *(_BYTE *)(v19 + 47) = sub_24191B8D0(0, 0x4D537341646E6553, 0xE900000000000053, 0) & 1;
    *(_BYTE *)(v19 + 48) = a11 & 1;
    *(_BYTE *)(v19 + 49) = a12 & 1;
    v47 = objc_msgSend(objc_allocWithZone((Class)BusinessSettingsHelper), sel_init);
    v48 = objc_msgSend(v47, sel_areBusinessUpdatesEnabled);

    *(_BYTE *)(v19 + 50) = v48;
    *(_QWORD *)(v19 + 56) = a13;
    *(_BYTE *)(v19 + 64) = a14 & 1;
    *(_BYTE *)(v19 + 65) = a15 & 1;
    *(_BYTE *)(v19 + 66) = a16 & 1;
    *(_BYTE *)(v19 + 67) = a17;
    *(_BYTE *)(v19 + 68) = a18 & 1;
    return v19;
  }
  return result;
}

uint64_t sub_24191F30C(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for CloudSettingsSwiftUtils()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SummarizationManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ReadReceiptsManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for FilterSendersManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RaiseToListenManager()
{
  return objc_opt_self();
}

uint64_t sub_24191F3F8()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for KeepMessagesManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for AudioExpirationManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MMSManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SubjectFieldManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CharacterCountManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for LowQualityImagesManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ShowContactPhotosManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SendAsTextMessageManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for BusinessUpdatesManager()
{
  return objc_opt_self();
}

void sub_24191F53C(char a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  __CFNotificationCenter *v6;
  __CFString *v7;

  v2 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  if (v4)
  {
    v5 = (void *)sub_24192BA1C();
    objc_msgSend(v4, sel_setBool_forKey_, a1 & 1, v5);

    objc_msgSend(v4, sel_synchronize);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    v7 = (__CFString *)sub_24192BA1C();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);

  }
}

void sub_24191F678(char a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  __CFNotificationCenter *v6;
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  __CFNotificationCenter *v12;
  __CFString *v13;

  v2 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  if (v4)
  {
    v5 = (void *)sub_24192BA1C();
    objc_msgSend(v4, sel_setBool_forKey_, a1 & 1, v5);

    objc_msgSend(v4, sel_synchronize);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    v7 = (__CFString *)sub_24192BA1C();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);

  }
  v8 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v9 = (void *)sub_24192BA1C();
  v10 = objc_msgSend(v8, sel_initWithSuiteName_, v9);

  if (v10)
  {
    v11 = (void *)sub_24192BA1C();
    objc_msgSend(v10, sel_setBool_forKey_, 1, v11);

    objc_msgSend(v10, sel_synchronize);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    v13 = (__CFString *)sub_24192BA1C();
    CFNotificationCenterPostNotification(v12, v13, 0, 0, 1u);

  }
}

uint64_t destroy for IOSSettingsView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for IOSSettingsView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IOSSettingsView(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for IOSSettingsView(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IOSSettingsView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IOSSettingsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IOSSettingsView()
{
  return &type metadata for IOSSettingsView;
}

uint64_t sub_24191FBB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24191FBC4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t OpaqueTypeConformance2;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t ObjCClassFromMetadata;
  id v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t KeyPath;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t *v85;
  uint64_t v86;
  void (*v87)(char *, char *, uint64_t);
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  int *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t);
  void (*v108)(char *, uint64_t);
  void (*v109)(char *, uint64_t);
  void (*v110)(char *, uint64_t);
  void (*v111)(char *, uint64_t);
  void (*v112)(char *, uint64_t);
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  void (*v115)(char *, uint64_t);
  uint64_t v116;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(_QWORD, _QWORD, _QWORD);
  void (*v121)(char *, char *, uint64_t);
  uint64_t v122;
  char *v123;
  void (*v124)(char *, char *, uint64_t);
  uint64_t v125;
  _QWORD *v126;
  char *v127;
  char *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  uint64_t v152;
  char *v153;
  char *v154;
  uint64_t v155;
  char *v156;
  char *v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void (*v168)(_QWORD, _QWORD, _QWORD);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char v173;
  uint64_t v174;

  v127 = a2;
  v124 = (void (*)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_257160250);
  MEMORY[0x24BDAC7A8](v124);
  v121 = (void (*)(char *, char *, uint64_t))((char *)&v118 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v126 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_257160258);
  v125 = *(v126 - 1);
  MEMORY[0x24BDAC7A8](v126);
  v123 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160260);
  v5 = MEMORY[0x24BDAC7A8](v122);
  v134 = (uint64_t)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v147 = (uint64_t)&v118 - v7;
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160268);
  v146 = *(_QWORD *)(v148 - 8);
  v8 = MEMORY[0x24BDAC7A8](v148);
  v163 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v157 = (char *)&v118 - v10;
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160270);
  v145 = *(_QWORD *)(v162 - 8);
  v11 = MEMORY[0x24BDAC7A8](v162);
  v161 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v154 = (char *)&v118 - v13;
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160278);
  v143 = *(_QWORD *)(v160 - 8);
  v14 = MEMORY[0x24BDAC7A8](v160);
  v159 = (char *)&v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v153 = (char *)&v118 - v16;
  v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160280);
  v141 = *(_QWORD *)(v158 - 8);
  v17 = MEMORY[0x24BDAC7A8](v158);
  v156 = (char *)&v118 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v151 = (char *)&v118 - v19;
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160288);
  v139 = *(_QWORD *)(v155 - 8);
  v20 = MEMORY[0x24BDAC7A8](v155);
  v144 = (char *)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v150 = (char *)&v118 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160290);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v142 = (uint64_t)&v118 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v149 = (uint64_t)&v118 - v26;
  v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160298);
  v136 = *(_QWORD *)(v152 - 8);
  v27 = MEMORY[0x24BDAC7A8](v152);
  v140 = (char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v118 - v29;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602A0);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&v118 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602A8);
  v131 = *(_QWORD *)(v138 - 8);
  v34 = MEMORY[0x24BDAC7A8](v138);
  v137 = (char *)&v118 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v118 - v36;
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602B0);
  v129 = *(_QWORD *)(v135 - 8);
  v38 = MEMORY[0x24BDAC7A8](v135);
  v132 = (char *)&v118 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38);
  v41 = (char *)&v118 - v40;
  v166 = a1;
  sub_24192B704();
  v171 = sub_24192B800();
  v172 = v42;
  v173 = v43 & 1;
  v174 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571602B8);
  v45 = MEMORY[0x24BDF5428];
  sub_241919930(&qword_2571602C0, &qword_2571602B8, MEMORY[0x24BDF5428]);
  v128 = v41;
  sub_24192B9D4();
  v165 = a1;
  sub_241921FBC((uint64_t)v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571602C8);
  sub_241919930(&qword_2571602D0, &qword_2571602C8, v45);
  sub_241929954();
  v130 = v37;
  sub_24192B9F8();
  v164 = a1;
  sub_2419229E8(&v171);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EB38);
  v46 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571602F8);
  v47 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160300);
  v48 = sub_24192B6EC();
  v49 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8];
  v50 = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  v51 = sub_241918B00((unint64_t *)&qword_257160310, v49, MEMORY[0x24BDEE6B8]);
  v167 = v47;
  v168 = (void (*)(_QWORD, _QWORD, _QWORD))v48;
  v120 = (void (*)(_QWORD, _QWORD, _QWORD))v48;
  v169 = v50;
  v170 = v51;
  v119 = v51;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v167 = v46;
  v168 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x24BEE1328];
  v169 = OpaqueTypeConformance2;
  v170 = MEMORY[0x24BEE1340];
  swift_getOpaqueTypeConformance2();
  sub_24192AAFC((unint64_t *)&qword_25715EB60, &qword_25715EB38, MEMORY[0x24BDF5578]);
  v133 = v30;
  sub_24192B9F8();
  v53 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureFlags);
  LODWORD(v47) = objc_msgSend(v53, sel_generativeModelsAvailable);

  if ((_DWORD)v47)
  {
    MEMORY[0x24BDAC7A8](v54);
    v55 = v149;
    sub_24192B9EC();
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160318);
    v57 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v55, 0, 1, v56);
  }
  else
  {
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160318);
    v57 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v149, 1, 1, v58);
  }
  MEMORY[0x24BDAC7A8](v57);
  sub_241925048(&v171);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160320);
  v59 = MEMORY[0x24BDF5428];
  sub_241919930(&qword_257160328, &qword_257160320, MEMORY[0x24BDF5428]);
  v60 = sub_24192B9F8();
  MEMORY[0x24BDAC7A8](v60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160330);
  sub_241919930(&qword_257160338, &qword_257160330, v59);
  v61 = sub_24192B9EC();
  MEMORY[0x24BDAC7A8](v61);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160340);
  sub_241919930(&qword_257160348, &qword_257160340, v59);
  v62 = sub_24192B9EC();
  MEMORY[0x24BDAC7A8](v62);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v64 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v65 = (void *)sub_24192BA1C();
  v66 = (void *)sub_24192BA1C();
  v67 = objc_msgSend(v64, sel_localizedStringForKey_value_table_, v65, 0, v66);

  v68 = sub_24192BA28();
  v70 = v69;

  v171 = v68;
  v172 = v70;
  sub_241918994();
  v171 = sub_24192B80C();
  v172 = v71;
  v173 = v72 & 1;
  v174 = v73;
  sub_241928784((uint64_t)&v167);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160350);
  sub_241919930(&qword_257160358, &qword_257160350, v59);
  sub_24192B9E0();
  sub_241928AAC((uint64_t)&v171);
  sub_241928BD0((uint64_t)&v167);
  sub_241919930(&qword_257160360, &qword_257160250, MEMORY[0x24BDF19E0]);
  v74 = sub_24192B9E0();
  v118 = (uint64_t)&v118;
  MEMORY[0x24BDAC7A8](v74);
  sub_24192955C((uint64_t)&v171);
  sub_241929684((uint64_t)v121);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160368);
  v75 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160370);
  v76 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160378);
  v77 = sub_241919930(&qword_257160380, &qword_257160378, MEMORY[0x24BDF46D0]);
  v167 = v76;
  v168 = v120;
  v169 = v77;
  v170 = v119;
  v78 = swift_getOpaqueTypeConformance2();
  v167 = v75;
  v168 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x24BEE1328];
  v169 = v78;
  v170 = MEMORY[0x24BEE1340];
  swift_getOpaqueTypeConformance2();
  v79 = v123;
  sub_24192B9E0();
  v80 = sub_24192B788();
  KeyPath = swift_getKeyPath();
  v82 = v125;
  v83 = v134;
  v84 = v126;
  (*(void (**)(uint64_t, char *, _QWORD *))(v125 + 16))(v134, v79, v126);
  v85 = (uint64_t *)(v83 + *(int *)(v122 + 36));
  *v85 = KeyPath;
  v85[1] = v80;
  (*(void (**)(char *, _QWORD *))(v82 + 8))(v79, v84);
  v86 = v147;
  sub_241918B40(v83, v147, &qword_257160260);
  v87 = *(void (**)(char *, char *, uint64_t))(v129 + 16);
  v88 = v132;
  v89 = v135;
  v87(v132, v128, v135);
  v90 = v83;
  v120 = *(void (**)(_QWORD, _QWORD, _QWORD))(v131 + 16);
  v91 = v137;
  v120(v137, v130, v138);
  v121 = *(void (**)(char *, char *, uint64_t))(v136 + 16);
  v92 = v140;
  v121(v140, v133, v152);
  v93 = v142;
  sub_241918A1C(v149, v142, &qword_257160290);
  v122 = *(_QWORD *)(v139 + 16);
  v94 = v144;
  ((void (*)(char *, char *, uint64_t))v122)(v144, v150, v155);
  v123 = *(char **)(v141 + 16);
  ((void (*)(char *, char *, uint64_t))v123)(v156, v151, v158);
  v124 = *(void (**)(char *, char *, uint64_t))(v143 + 16);
  v124(v159, v153, v160);
  v125 = *(_QWORD *)(v145 + 16);
  ((void (*)(char *, char *, uint64_t))v125)(v161, v154, v162);
  v126 = *(_QWORD **)(v146 + 16);
  v95 = v148;
  ((void (*)(char *, char *, uint64_t))v126)(v163, v157, v148);
  v96 = v86;
  v97 = v90;
  sub_241918A1C(v96, v90, &qword_257160260);
  v98 = v127;
  v87(v127, v88, v89);
  v99 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_257160388);
  v100 = v138;
  v120(&v98[v99[12]], v91, v138);
  v101 = v92;
  v102 = v152;
  v121(&v98[v99[16]], v101, v152);
  sub_241918A1C(v93, (uint64_t)&v98[v99[20]], &qword_257160290);
  v103 = v155;
  ((void (*)(char *, char *, uint64_t))v122)(&v98[v99[24]], v94, v155);
  v104 = v158;
  ((void (*)(char *, char *, uint64_t))v123)(&v98[v99[28]], v156, v158);
  v105 = v160;
  v124(&v98[v99[32]], v159, v160);
  v106 = v162;
  ((void (*)(char *, char *, uint64_t))v125)(&v98[v99[36]], v161, v162);
  ((void (*)(char *, char *, uint64_t))v126)(&v98[v99[40]], v163, v95);
  sub_241918A1C(v97, (uint64_t)&v98[v99[44]], &qword_257160260);
  sub_241918A60(v147, &qword_257160260);
  v107 = *(void (**)(char *, uint64_t))(v146 + 8);
  v107(v157, v95);
  v108 = *(void (**)(char *, uint64_t))(v145 + 8);
  v108(v154, v106);
  v109 = *(void (**)(char *, uint64_t))(v143 + 8);
  v109(v153, v105);
  v110 = *(void (**)(char *, uint64_t))(v141 + 8);
  v110(v151, v104);
  v111 = *(void (**)(char *, uint64_t))(v139 + 8);
  v111(v150, v103);
  sub_241918A60(v149, &qword_257160290);
  v112 = *(void (**)(char *, uint64_t))(v136 + 8);
  v112(v133, v102);
  v113 = *(void (**)(char *, uint64_t))(v131 + 8);
  v114 = v100;
  v113(v130, v100);
  v115 = *(void (**)(char *, uint64_t))(v129 + 8);
  v116 = v135;
  v115(v128, v135);
  sub_241918A60(v134, &qword_257160260);
  v107(v163, v148);
  v108(v161, v162);
  v109(v159, v160);
  v110(v156, v158);
  v111(v144, v155);
  sub_241918A60(v142, &qword_257160290);
  v112(v140, v152);
  v113(v137, v114);
  return ((uint64_t (*)(char *, uint64_t))v115)(v132, v116);
}

uint64_t sub_241920EAC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  char *v36;
  void (*v37)(uint64_t, char *, uint64_t);
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  void (*v41)(char *, uint64_t);
  void (*v42)(char *, uint64_t);
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v54 = a2;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603B0);
  v60 = *(_QWORD *)(v53 - 8);
  v3 = MEMORY[0x24BDAC7A8](v53);
  v52 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v59 = (char *)v44 - v5;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160400);
  v61 = *(_QWORD *)(v51 - 8);
  v6 = MEMORY[0x24BDAC7A8](v51);
  v50 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v57 = (char *)v44 - v8;
  v48 = sub_24192B6EC();
  v49 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v10 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v47 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v56 = *(_QWORD *)(v58 - 8);
  v13 = MEMORY[0x24BDAC7A8](v58);
  v62 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v55 = (char *)v44 - v15;
  v44[1] = sub_24192B704();
  v44[0] = v16;
  v45 = a1;
  v64 = *(_OWORD *)(a1 + 16);
  v65 = *(_QWORD *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v17 = v66;
  v18 = v67;
  v19 = v68;
  swift_getKeyPath();
  v66 = v17;
  v67 = v18;
  v68 = v19;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24192B974();
  sub_24192B6E0();
  sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v20 = v62;
  v21 = v46;
  v22 = v48;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v22);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v21);
  v23 = v55;
  v24 = v56;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v55, v20, v58);
  sub_24192B704();
  v63 = *(_OWORD *)(v45 + 40);
  v64 = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C8);
  sub_24192B920();
  sub_24192A254();
  v25 = v57;
  sub_24192B644();
  v63 = v64;
  sub_24192B920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603A0);
  sub_241919930(&qword_2571603A8, &qword_2571603A0, MEMORY[0x24BDF4700]);
  v26 = v59;
  sub_24192B638();
  v27 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  v28 = v62;
  v29 = v23;
  v30 = v58;
  v27(v62, v29, v58);
  v31 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  v32 = v50;
  v33 = v51;
  v31(v50, v25, v51);
  v34 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  v36 = v52;
  v35 = v53;
  v34(v52, v26, v53);
  v37 = (void (*)(uint64_t, char *, uint64_t))v34;
  v38 = v54;
  v27(v54, v28, v30);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571605C0);
  v31(&v38[*(int *)(v39 + 48)], v32, v33);
  v37((uint64_t)&v38[*(int *)(v39 + 64)], v36, v35);
  v40 = *(void (**)(char *, uint64_t))(v60 + 8);
  v40(v59, v35);
  v41 = *(void (**)(char *, uint64_t))(v61 + 8);
  v41(v57, v33);
  v42 = *(void (**)(char *, uint64_t))(v56 + 8);
  v42(v55, v30);
  v40(v36, v35);
  v41(v32, v33);
  return ((uint64_t (*)(char *, uint64_t))v42)(v62, v30);
}

double sub_241921474@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2419290B4((void (*)(__n128 *__return_ptr))sub_241921480, a1).n128_u64[0];
  return result;
}

uint64_t sub_241921480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
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
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_24192B704();
  v2 = sub_24192B800();
  v4 = v3;
  v6 = v5 & 1;
  sub_24192B89C();
  v7 = sub_24192B7D0();
  v31 = v8;
  v32 = v7;
  v10 = v9;
  v33 = v11;
  swift_release();
  v30 = v10 & 1;
  sub_241918C08(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_24192B704();
  v12 = sub_24192B800();
  v14 = v13;
  v16 = v15 & 1;
  sub_24192B788();
  v17 = sub_24192B7F4();
  v19 = v18;
  v21 = v20;
  swift_release();
  sub_241918C08(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_24192B8A8();
  v22 = sub_24192B7D0();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  swift_release();
  sub_241918C08(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v32;
  *(_QWORD *)(a1 + 8) = v31;
  *(_BYTE *)(a1 + 16) = v30;
  *(_QWORD *)(a1 + 24) = v33;
  *(_QWORD *)(a1 + 32) = v22;
  *(_QWORD *)(a1 + 40) = v24;
  *(_BYTE *)(a1 + 48) = v26 & 1;
  *(_QWORD *)(a1 + 56) = v28;
  sub_241918BF8(v32, v31, v30);
  swift_bridgeObjectRetain();
  sub_241918BF8(v22, v24, v26 & 1);
  swift_bridgeObjectRetain();
  sub_241918C08(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  sub_241918C08(v32, v31, v30);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2419216D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(uint64_t, char *, uint64_t);
  char *v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  void (*v55)(char *, uint64_t);
  void (*v56)(char *, uint64_t);
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;

  v70 = a2;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160400);
  v76 = *(_QWORD *)(v69 - 8);
  v3 = MEMORY[0x24BDAC7A8](v69);
  v68 = (char *)v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v74 = (char *)v58 - v5;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C0);
  v75 = *(_QWORD *)(v67 - 8);
  v6 = MEMORY[0x24BDAC7A8](v67);
  v66 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v73 = (char *)v58 - v8;
  v62 = sub_24192B6EC();
  v65 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v10 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v60 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v72 = *(_QWORD *)(v59 - 8);
  v14 = MEMORY[0x24BDAC7A8](v59);
  v58[0] = (char *)v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v71 = (char *)v58 - v16;
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v64 = ObjCClassFromMetadata;
  v63 = (id)objc_opt_self();
  v18 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata);
  v19 = (void *)sub_24192BA1C();
  v61 = 0x800000024192EF60;
  v20 = (void *)sub_24192BA1C();
  v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, v20);

  v22 = sub_24192BA28();
  v24 = v23;

  *(_QWORD *)&v82 = v22;
  *((_QWORD *)&v82 + 1) = v24;
  v83 = *(_OWORD *)(a1 + 16);
  v84 = *(_QWORD *)(a1 + 32);
  v78 = *(_OWORD *)(a1 + 16);
  v79 = *(_QWORD *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v25 = v80;
  v26 = v81;
  swift_getKeyPath();
  v80 = v25;
  v81 = v26;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v58[1] = sub_241918994();
  sub_24192B980();
  sub_24192B6E0();
  sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v27 = (char *)v58[0];
  v28 = v62;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v10, v28);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v13, v11);
  v30 = v71;
  v29 = v72;
  v31 = v27;
  v32 = v59;
  (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v71, v27, v59);
  v78 = v83;
  v79 = v84;
  sub_24192B9BC();
  v33 = a1;
  v77 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603E0);
  sub_24192A2A0();
  sub_24192A2FC();
  v34 = v73;
  sub_24192B638();
  v35 = objc_msgSend(v63, sel_bundleForClass_, v64);
  v36 = (void *)sub_24192BA1C();
  v37 = (void *)sub_24192BA1C();
  v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, 0, v37);

  v39 = sub_24192BA28();
  v41 = v40;

  *(_QWORD *)&v78 = v39;
  *((_QWORD *)&v78 + 1) = v41;
  v82 = *(_OWORD *)(v33 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C8);
  sub_24192B920();
  sub_24192A254();
  v42 = v74;
  sub_24192B650();
  v43 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 16);
  v44 = v30;
  v45 = v32;
  v43((uint64_t)v31, v44, v32);
  v46 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
  v47 = v66;
  v48 = v67;
  v46(v66, v34, v67);
  v49 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  v50 = v68;
  v51 = v69;
  v49(v68, v42, v69);
  v52 = v70;
  v43(v70, v31, v45);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571605B8);
  v46((char *)(v52 + *(int *)(v53 + 48)), v47, v48);
  v49((char *)(v52 + *(int *)(v53 + 64)), v50, v51);
  v54 = *(void (**)(char *, uint64_t))(v76 + 8);
  v54(v74, v51);
  v55 = *(void (**)(char *, uint64_t))(v75 + 8);
  v55(v73, v48);
  v56 = *(void (**)(char *, uint64_t))(v72 + 8);
  v56(v71, v45);
  v54(v50, v51);
  v55(v47, v48);
  return ((uint64_t (*)(char *, uint64_t))v56)(v31, v45);
}

uint64_t sub_241921DFC()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  MEMORY[0x24269E0F0](v10, v8);
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  swift_release();
  sub_24191E404();
  sub_241918994();
  return sub_24192B62C();
}

uint64_t sub_241921FBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602E8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = (void *)sub_24192BA1C();
  v9 = (void *)sub_24192BA1C();
  v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  v11 = sub_24192BA28();
  v13 = v12;

  *(_QWORD *)v5 = sub_24192B710();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160580);
  v16 = v11;
  v17 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160588);
  sub_24192AA60();
  sub_24192B638();
  swift_bridgeObjectRelease();
  sub_241918B40((uint64_t)v5, a1, &qword_2571602E8);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(a1, 0, 1, v2);
}

uint64_t sub_24192219C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[2];
  char v8;
  uint64_t v9;

  sub_241922200((uint64_t)v7);
  v2 = v7[0];
  v3 = v7[1];
  v4 = v8;
  v5 = v9;
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_241922200@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t ObjCClassFromMetadata;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  sub_241918994();
  swift_bridgeObjectRetain();
  v1 = sub_24192B80C();
  v3 = v2;
  v5 = v4 & 1;
  sub_24192B788();
  v6 = sub_24192B7F4();
  v8 = v7;
  v10 = v9;
  swift_release();
  sub_241918C08(v1, v3, v5);
  swift_bridgeObjectRelease();
  v11 = (void *)objc_opt_self();
  MEMORY[0x24269E00C](objc_msgSend(v11, sel_systemGrayColor));
  v12 = sub_24192B7DC();
  v41 = v13;
  v42 = v12;
  v40 = v14 & 1;
  sub_241918C08(v6, v8, v10 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v16 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = (void *)sub_24192BA1C();
  v18 = (void *)sub_24192BA1C();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_24192BA28();
  v20 = sub_24192B80C();
  v22 = v21;
  LOBYTE(v8) = v23 & 1;
  sub_24192B788();
  v24 = sub_24192B7F4();
  v26 = v25;
  v28 = v27;
  swift_release();
  sub_241918C08(v20, v22, v8);
  swift_bridgeObjectRelease();
  MEMORY[0x24269E00C](objc_msgSend(v11, sel_systemBlueColor));
  v29 = sub_24192B7DC();
  v31 = v30;
  LOBYTE(v8) = v32 & 1;
  sub_241918C08(v24, v26, v28 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  v38 = sub_24192B7E8();
  v39 = v33;
  v35 = v34;
  LOBYTE(v24) = v36;
  sub_241918C08(v29, v31, v8);
  swift_bridgeObjectRelease();
  sub_241918C08(v42, v41, v40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v38;
  *(_QWORD *)(a1 + 8) = v35;
  *(_BYTE *)(a1 + 16) = v24 & 1;
  *(_QWORD *)(a1 + 24) = v39;
  return result;
}

uint64_t sub_241922598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;

  v43 = a2;
  v3 = sub_24192B6EC();
  v4 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  v40 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v8 = *(_QWORD *)(v7 - 8);
  v37 = v7;
  v38 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v12 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  v42 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v36 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v16 = (void *)sub_24192BA1C();
  v17 = (void *)sub_24192BA1C();
  v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  v19 = sub_24192BA28();
  v21 = v20;

  v49 = v19;
  v50 = v21;
  v51 = *(_OWORD *)(a1 + 16);
  v52 = *(_QWORD *)(a1 + 32);
  v47 = *(_OWORD *)(a1 + 16);
  v48 = *(_QWORD *)(a1 + 32);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v23 = v44;
  v24 = v45;
  swift_getKeyPath();
  v44 = v23;
  v45 = v24;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_241918994();
  sub_24192B980();
  sub_24192B6E0();
  v25 = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  v26 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v28 = v36;
  v27 = v37;
  v29 = v39;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v29);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v27);
  v44 = v51;
  v45 = v52;
  MEMORY[0x24269E0F0](&v47, v22);
  v30 = v47;
  swift_getKeyPath();
  *(_QWORD *)&v44 = v30;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v19) = *(_BYTE *)(v30 + 19);
  swift_release();
  LOBYTE(v47) = v19;
  v31 = swift_allocObject();
  v32 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v31 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v31 + 64) = v32;
  *(_QWORD *)(v31 + 80) = *(_QWORD *)(a1 + 64);
  v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v31 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v31 + 32) = v33;
  sub_241929C54(a1);
  *(_QWORD *)&v44 = v27;
  *((_QWORD *)&v44 + 1) = v29;
  v45 = v25;
  v46 = v26;
  swift_getOpaqueTypeConformance2();
  v34 = v41;
  sub_24192B884();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v28, v34);
}

uint64_t sub_2419229E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *a1 = result;
  a1[1] = v8;
  a1[2] = v9 & 1;
  a1[3] = v10;
  return result;
}

uint64_t sub_241922B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;

  v43 = a2;
  v3 = sub_24192B6EC();
  v4 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  v40 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v8 = *(_QWORD *)(v7 - 8);
  v37 = v7;
  v38 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v12 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  v42 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v36 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v16 = (void *)sub_24192BA1C();
  v17 = (void *)sub_24192BA1C();
  v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  v19 = sub_24192BA28();
  v21 = v20;

  v49 = v19;
  v50 = v21;
  v51 = *(_OWORD *)(a1 + 16);
  v52 = *(_QWORD *)(a1 + 32);
  v47 = *(_OWORD *)(a1 + 16);
  v48 = *(_QWORD *)(a1 + 32);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v23 = v44;
  v24 = v45;
  swift_getKeyPath();
  v44 = v23;
  v45 = v24;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_241918994();
  sub_24192B980();
  sub_24192B6E0();
  v25 = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  v26 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v28 = v36;
  v27 = v37;
  v29 = v39;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v29);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v27);
  v44 = v51;
  v45 = v52;
  MEMORY[0x24269E0F0](&v47, v22);
  v30 = v47;
  swift_getKeyPath();
  *(_QWORD *)&v44 = v30;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v19) = *(_BYTE *)(v30 + 20);
  swift_release();
  LOBYTE(v47) = v19;
  v31 = swift_allocObject();
  v32 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v31 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v31 + 64) = v32;
  *(_QWORD *)(v31 + 80) = *(_QWORD *)(a1 + 64);
  v33 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v31 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v31 + 32) = v33;
  sub_241929C54(a1);
  *(_QWORD *)&v44 = v27;
  *((_QWORD *)&v44 + 1) = v29;
  v45 = v25;
  v46 = v26;
  swift_getOpaqueTypeConformance2();
  v34 = v41;
  sub_24192B884();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v28, v34);
}

uint64_t sub_241922F5C(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = *a2;
  v4 = *(_BYTE *)(a3 + 8);
  v5 = swift_retain();
  sub_241929A00(v5, v4);
  swift_release();
  objc_msgSend((id)objc_opt_self(), sel_setMessageSummarizationUserPreference_, v3);
  return swift_release();
}

uint64_t sub_241922FC4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t ObjCClassFromMetadata;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  char *v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  void (*v96)(char *, char *, uint64_t);
  char *v97;
  uint64_t v98;
  void (*v99)(char *, char *, uint64_t);
  uint64_t v100;
  void (*v101)(char *, char *, uint64_t);
  uint64_t v102;
  void (*v103)(char *, char *, uint64_t);
  uint64_t v104;
  char *v105;
  int *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  void (*v110)(char *, uint64_t);
  void (*v111)(char *, uint64_t);
  void (*v112)(char *, uint64_t);
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  id v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  __int128 v139;
  char *v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  char *v155;
  char *v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  _BYTE v160[24];
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  __int128 v166;
  uint64_t v167;
  __int128 v168;
  uint64_t v169;

  v135 = a2;
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C0);
  v151 = *(_QWORD *)(v136 - 8);
  v3 = MEMORY[0x24BDAC7A8](v136);
  v153 = (char *)&v117 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v150 = (char *)&v117 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604C8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v152 = (uint64_t)&v117 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v149 = (uint64_t)&v117 - v9;
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v130 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v129 = (char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v133 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v132 = (char *)&v117 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F0);
  v157 = *(_QWORD *)(v148 - 8);
  v12 = MEMORY[0x24BDAC7A8](v148);
  v158 = (char *)&v117 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v156 = (char *)&v117 - v14;
  *(_QWORD *)&v139 = sub_24192B6EC();
  v138 = *(_QWORD *)(v139 - 8);
  MEMORY[0x24BDAC7A8](v139);
  v137 = (char *)&v117 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160378);
  v118 = *(_QWORD *)(v117 - 8);
  MEMORY[0x24BDAC7A8](v117);
  v17 = (char *)&v117 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160370);
  v120 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  v19 = (char *)&v117 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160368);
  v126 = *(_QWORD *)(v127 - 8);
  MEMORY[0x24BDAC7A8](v127);
  v119 = (char *)&v117 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604D0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v147 = (uint64_t)&v117 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v117 - v24;
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604D8);
  v143 = *(_QWORD *)(v146 - 8);
  v26 = MEMORY[0x24BDAC7A8](v146);
  v155 = (char *)&v117 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v117 - v28;
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160400);
  v141 = *(_QWORD *)(v145 - 8);
  v30 = MEMORY[0x24BDAC7A8](v145);
  v144 = (char *)&v117 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v117 - v32;
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v123 = (id)objc_opt_self();
  v124 = ObjCClassFromMetadata;
  v35 = objc_msgSend(v123, sel_bundleForClass_, ObjCClassFromMetadata);
  v36 = (void *)sub_24192BA1C();
  v122 = 0x800000024192EF60;
  v37 = (void *)sub_24192BA1C();
  v38 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, 0, v37);

  v39 = sub_24192BA28();
  v41 = v40;

  *(_QWORD *)&v168 = v39;
  *((_QWORD *)&v168 + 1) = v41;
  v166 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C8);
  sub_24192B920();
  sub_24192A254();
  v42 = sub_241918994();
  v140 = v33;
  v125 = v42;
  sub_24192B650();
  v159 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571604E0);
  sub_24192A6DC();
  v142 = v29;
  sub_24192B7C4();
  v128 = (id)objc_opt_self();
  v43 = objc_msgSend(v128, sel_sharedInstance);
  LODWORD(v39) = objc_msgSend(v43, sel_isRaiseGestureSupported);

  v154 = v25;
  if ((_DWORD)v39)
  {
    v168 = *(_OWORD *)(a1 + 16);
    v169 = *(_QWORD *)(a1 + 32);
    v166 = *(_OWORD *)(a1 + 16);
    v167 = *(_QWORD *)(a1 + 32);
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
    sub_24192B9BC();
    v45 = *(_OWORD *)v160;
    v46 = *(_QWORD *)&v160[16];
    swift_getKeyPath();
    *(_OWORD *)v160 = v45;
    *(_QWORD *)&v160[16] = v46;
    sub_24192B9B0();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2571603A0);
    sub_241919930(&qword_2571603A8, &qword_2571603A0, MEMORY[0x24BDF4700]);
    v47 = v17;
    sub_24192B968();
    v48 = v137;
    sub_24192B6E0();
    v49 = sub_241919930(&qword_257160380, &qword_257160378, MEMORY[0x24BDF46D0]);
    v50 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
    v51 = v117;
    v52 = v139;
    sub_24192B848();
    (*(void (**)(char *, uint64_t))(v138 + 8))(v48, v52);
    (*(void (**)(char *, uint64_t))(v118 + 8))(v47, v51);
    *(_OWORD *)v160 = v168;
    *(_QWORD *)&v160[16] = v169;
    MEMORY[0x24269E0F0](&v166, v44);
    v53 = v166;
    swift_getKeyPath();
    *(_QWORD *)v160 = v53;
    sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
    sub_24192B5CC();
    swift_release();
    LOBYTE(v47) = *(_BYTE *)(v53 + 33);
    swift_release();
    LOBYTE(v166) = (_BYTE)v47;
    v54 = swift_allocObject();
    v55 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v54 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v54 + 64) = v55;
    *(_QWORD *)(v54 + 80) = *(_QWORD *)(a1 + 64);
    v56 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v54 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v54 + 32) = v56;
    sub_241929C54(a1);
    *(_QWORD *)v160 = v51;
    *(_QWORD *)&v160[8] = v52;
    *(_QWORD *)&v160[16] = v49;
    *(_QWORD *)&v161 = v50;
    swift_getOpaqueTypeConformance2();
    v57 = v119;
    v58 = v121;
    sub_24192B884();
    v25 = v154;
    swift_release();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v19, v58);
    v59 = v126;
    v60 = v127;
    (*(void (**)(char *, char *, uint64_t))(v126 + 32))(v25, v57, v127);
    v61 = 0;
    v62 = v60;
    v63 = v59;
  }
  else
  {
    v61 = 1;
    v62 = v127;
    v63 = v126;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v25, v61, 1, v62);
  v64 = objc_msgSend(v123, sel_bundleForClass_, v124);
  v65 = (void *)sub_24192BA1C();
  v66 = (void *)sub_24192BA1C();
  v67 = objc_msgSend(v64, sel_localizedStringForKey_value_table_, v65, 0, v66);

  v68 = sub_24192BA28();
  v70 = v69;

  v164 = v68;
  v165 = v70;
  v166 = *(_OWORD *)(a1 + 16);
  v167 = *(_QWORD *)(a1 + 32);
  v162 = *(_OWORD *)(a1 + 16);
  v163 = *(_QWORD *)(a1 + 32);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v72 = *(_OWORD *)v160;
  v73 = *(_QWORD *)&v160[16];
  swift_getKeyPath();
  *(_OWORD *)v160 = v72;
  *(_QWORD *)&v160[16] = v73;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v74 = v129;
  sub_24192B980();
  v75 = v137;
  sub_24192B6E0();
  v76 = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  v77 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v78 = v132;
  v79 = v131;
  v80 = v139;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v138 + 8))(v75, v80);
  (*(void (**)(char *, uint64_t))(v130 + 8))(v74, v79);
  *(_OWORD *)v160 = v166;
  *(_QWORD *)&v160[16] = v167;
  MEMORY[0x24269E0F0](&v162, v71);
  v81 = v162;
  swift_getKeyPath();
  *(_QWORD *)v160 = v81;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v74) = *(_BYTE *)(v81 + 34);
  swift_release();
  LOBYTE(v162) = (_BYTE)v74;
  v82 = swift_allocObject();
  v83 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v82 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v82 + 64) = v83;
  *(_QWORD *)(v82 + 80) = *(_QWORD *)(a1 + 64);
  v84 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v82 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v82 + 32) = v84;
  sub_241929C54(a1);
  *(_QWORD *)v160 = v79;
  *(_QWORD *)&v160[8] = v80;
  *(_QWORD *)&v160[16] = v76;
  *(_QWORD *)&v161 = v77;
  swift_getOpaqueTypeConformance2();
  v85 = v158;
  v86 = v134;
  sub_24192B884();
  swift_release();
  (*(void (**)(char *, uint64_t))(v133 + 8))(v78, v86);
  (*(void (**)(char *, char *, uint64_t))(v157 + 32))(v156, v85, v148);
  v87 = objc_msgSend(v128, sel_sharedInstance);
  LODWORD(v81) = objc_msgSend(v87, sel_shouldShowCheckInLocationHistorySettings);

  if ((_DWORD)v81)
  {
    v162 = v166;
    v163 = v167;
    sub_24192B9BC();
    v88 = *(_QWORD *)v160;
    type metadata accessor for CheckInDataView.Model();
    v139 = *(_OWORD *)&v160[8];
    v89 = swift_allocObject();
    sub_24192B5D8();
    *(_QWORD *)&v162 = v89;
    v90 = sub_24192B908();
    *(_QWORD *)&v160[16] = v88;
    v161 = v139;
    MEMORY[0x24BDAC7A8](v90);
    *(&v117 - 2) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2571603E0);
    sub_24192A2A0();
    sub_24192A828();
    v91 = v149;
    sub_24192B638();
    v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160508);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v92 - 8) + 56))(v91, 0, 1, v92);
  }
  else
  {
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160508);
    v91 = v149;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 56))(v149, 1, 1, v93);
  }
  v162 = v166;
  v163 = v167;
  v94 = sub_24192B9BC();
  MEMORY[0x24BDAC7A8](v94);
  *(&v117 - 2) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603E0);
  sub_24192A2A0();
  sub_24192A2FC();
  v95 = v150;
  sub_24192B638();
  v96 = *(void (**)(char *, char *, uint64_t))(v141 + 16);
  v97 = v144;
  v98 = v145;
  v96(v144, v140, v145);
  v99 = *(void (**)(char *, char *, uint64_t))(v143 + 16);
  v99(v155, v142, v146);
  v100 = v147;
  sub_241918A1C((uint64_t)v154, v147, &qword_2571604D0);
  v101 = *(void (**)(char *, char *, uint64_t))(v157 + 16);
  v102 = v148;
  v101(v158, v156, v148);
  sub_241918A1C(v91, v152, &qword_2571604C8);
  v103 = *(void (**)(char *, char *, uint64_t))(v151 + 16);
  v104 = v136;
  v103(v153, v95, v136);
  v105 = v135;
  v96(v135, v97, v98);
  v106 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_257160510);
  v107 = v146;
  v99(&v105[v106[12]], v155, v146);
  sub_241918A1C(v100, (uint64_t)&v105[v106[16]], &qword_2571604D0);
  v101(&v105[v106[20]], v158, v102);
  v108 = v152;
  sub_241918A1C(v152, (uint64_t)&v105[v106[24]], &qword_2571604C8);
  v109 = v153;
  v103(&v105[v106[28]], v153, v104);
  v110 = *(void (**)(char *, uint64_t))(v151 + 8);
  v110(v150, v104);
  sub_241918A60(v149, &qword_2571604C8);
  v111 = *(void (**)(char *, uint64_t))(v157 + 8);
  v111(v156, v102);
  sub_241918A60((uint64_t)v154, &qword_2571604D0);
  v112 = *(void (**)(char *, uint64_t))(v143 + 8);
  v113 = v107;
  v112(v142, v107);
  v114 = *(void (**)(char *, uint64_t))(v141 + 8);
  v115 = v145;
  v114(v140, v145);
  v110(v109, v104);
  sub_241918A60(v108, &qword_2571604C8);
  v111(v158, v102);
  sub_241918A60(v147, &qword_2571604D0);
  v112(v155, v113);
  return ((uint64_t (*)(char *, uint64_t))v114)(v144, v115);
}

uint64_t sub_2419241D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;

  v49 = a2;
  v3 = sub_24192B74C();
  v4 = *(_QWORD *)(v3 - 8);
  v47 = v3;
  v48 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v44 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604F8);
  v41 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604F0);
  v46 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160520);
  v43 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v13 = (void *)sub_24192BA1C();
  v14 = (void *)sub_24192BA1C();
  v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, 0, v14);

  v16 = sub_24192BA28();
  v18 = v17;

  *(_QWORD *)&v50 = v16;
  *((_QWORD *)&v50 + 1) = v18;
  v55 = sub_24192BA40();
  v56 = v19;
  v57 = *(_OWORD *)(a1 + 16);
  v58 = *(_QWORD *)(a1 + 32);
  v53 = *(_OWORD *)(a1 + 16);
  v54 = *(_QWORD *)(a1 + 32);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v21 = v50;
  v22 = v51;
  swift_getKeyPath();
  v50 = v21;
  v51 = v22;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v50 = v53;
  LOBYTE(v51) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160528);
  sub_24191E6B0();
  sub_24192A4D8(&qword_257160530, &qword_257160528, (uint64_t (*)(void))sub_24192A8B0);
  sub_241918994();
  sub_24192B95C();
  v50 = v57;
  v51 = v58;
  MEMORY[0x24269E0F0](&v53, v20);
  v23 = v53;
  swift_getKeyPath();
  *(_QWORD *)&v50 = v23;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v12) = *(_BYTE *)(v23 + 32);
  swift_release();
  LOBYTE(v50) = (_BYTE)v12;
  v24 = swift_allocObject();
  v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(_QWORD *)(v24 + 80) = *(_QWORD *)(a1 + 64);
  v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v26;
  sub_241929C54(a1);
  v27 = sub_241919930(&qword_257160500, &qword_2571604F8, MEMORY[0x24BDF4570]);
  v28 = sub_24191E80C();
  v29 = v39;
  sub_24192B884();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
  v30 = v44;
  sub_24192B740();
  *(_QWORD *)&v50 = v6;
  *((_QWORD *)&v50 + 1) = &type metadata for SettingsModel.AudioExpiration;
  v51 = v27;
  v52 = v28;
  swift_getOpaqueTypeConformance2();
  v31 = v40;
  v32 = v42;
  v33 = v47;
  sub_24192B83C();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v30, v33);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v29, v32);
  v34 = v43;
  v35 = v49;
  v36 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 16))(v49, v31, v45);
  *(_BYTE *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2571604E0) + 36)) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v31, v36);
}

uint64_t sub_24192473C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715F8C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160540);
  sub_241919930(&qword_257160578, &qword_25715F8C0, MEMORY[0x24BEE12D8]);
  sub_24192A8B0();
  sub_24191E7C4();
  return sub_24192B9C8();
}

uint64_t sub_2419247FC@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v3 = *a1;
  sub_24191DF98();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 32) = v3;
  *(_BYTE *)(a2 + 33) = v3;
  return result;
}

uint64_t sub_241924860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;

  v3 = *(_BYTE *)(a3 + 8);
  v4 = swift_retain();
  sub_241929A00(v4, v3);
  swift_release();
  sub_24191ACF8();
  return swift_release();
}

double sub_2419248B4@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2419290B4((void (*)(__n128 *__return_ptr))sub_2419248C0, a1).n128_u64[0];
  return result;
}

uint64_t sub_2419248C0@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjCClassFromMetadata;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  v7 = sub_24192B80C();
  v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_24192B89C();
  v11 = sub_24192B7D0();
  v37 = v12;
  v38 = v11;
  v14 = v13;
  v39 = v15;
  swift_release();
  v36 = v14 & 1;
  sub_241918C08(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = (void *)sub_24192BA1C();
  v18 = (void *)sub_24192BA1C();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_24192BA28();
  v20 = sub_24192B80C();
  v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_24192B788();
  v24 = sub_24192B7F4();
  v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_241918C08(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_24192B8A8();
  v28 = sub_24192B7D0();
  v30 = v29;
  LOBYTE(v19) = v31;
  v33 = v32;
  swift_release();
  sub_241918C08(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v38;
  *(_QWORD *)(a1 + 8) = v37;
  *(_BYTE *)(a1 + 16) = v36;
  *(_QWORD *)(a1 + 24) = v39;
  *(_QWORD *)(a1 + 32) = v28;
  *(_QWORD *)(a1 + 40) = v30;
  *(_BYTE *)(a1 + 48) = v19 & 1;
  *(_QWORD *)(a1 + 56) = v33;
  sub_241918BF8(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_241918BF8(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_241918C08(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_241918C08(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_241924C48()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  MEMORY[0x24269E0F0](v10, v8);
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  swift_release();
  sub_24191E1CC();
  sub_241918994();
  return sub_24192B62C();
}

uint64_t sub_241924E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v10 = (void *)sub_24192BA1C();
  v11 = (void *)sub_24192BA1C();
  v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, v11);

  v13 = sub_24192BA28();
  v15 = v14;

  v24[1] = v13;
  v24[2] = v15;
  v22 = *(_OWORD *)(a1 + 16);
  v23 = *(_QWORD *)(a1 + 32);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  MEMORY[0x24269E0F0](v24, v16);
  v17 = v24[0];
  swift_getKeyPath();
  *(_QWORD *)&v22 = v17;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  v18 = *(unsigned __int8 *)(v17 + 37);
  swift_release();
  v19 = 6710863;
  if (v18)
    v19 = 28239;
  v20 = 0xE300000000000000;
  if (v18)
    v20 = 0xE200000000000000;
  *(_QWORD *)&v22 = v19;
  *((_QWORD *)&v22 + 1) = v20;
  sub_241918994();
  sub_24192B62C();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t sub_241925048@<X0>(uint64_t *a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *a1 = result;
  a1[1] = v8;
  a1[2] = v9 & 1;
  a1[3] = v10;
  return result;
}

uint64_t sub_24192516C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjCClassFromMetadata;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;

  v67 = a2;
  v56 = sub_24192B6EC();
  v57 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v55 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v8 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  v66 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F0);
  v68 = *(_QWORD *)(v64 - 8);
  v10 = MEMORY[0x24BDAC7A8](v64);
  v59 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v53 - v12;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604B8);
  v61 = *(_QWORD *)(v63 - 8);
  v13 = MEMORY[0x24BDAC7A8](v63);
  v60 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v58 = (char *)&v53 - v15;
  v77 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C8);
  sub_24192B920();
  v69 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603E0);
  sub_24192A2A0();
  sub_24192A254();
  sub_24192B638();
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v18 = (void *)sub_24192BA1C();
  v19 = (void *)sub_24192BA1C();
  v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

  v21 = sub_24192BA28();
  v23 = v22;

  v75 = v21;
  v76 = v23;
  v77 = *(_OWORD *)(a1 + 16);
  v78 = *(_QWORD *)(a1 + 32);
  v73 = *(_OWORD *)(a1 + 16);
  v74 = *(_QWORD *)(a1 + 32);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v25 = v70;
  v26 = v71;
  swift_getKeyPath();
  v70 = v25;
  v71 = v26;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_241918994();
  sub_24192B980();
  v27 = v4;
  sub_24192B6E0();
  v28 = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  v29 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v30 = v53;
  v31 = v54;
  v32 = v56;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v27, v32);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v6, v31);
  v70 = v77;
  v71 = v78;
  MEMORY[0x24269E0F0](&v73, v24);
  v33 = v73;
  swift_getKeyPath();
  *(_QWORD *)&v70 = v33;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v21) = *(_BYTE *)(v33 + 39);
  swift_release();
  LOBYTE(v73) = v21;
  v34 = swift_allocObject();
  v35 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v34 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v34 + 64) = v35;
  *(_QWORD *)(v34 + 80) = *(_QWORD *)(a1 + 64);
  v36 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v34 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v34 + 32) = v36;
  sub_241929C54(a1);
  *(_QWORD *)&v70 = v31;
  *((_QWORD *)&v70 + 1) = v32;
  v71 = v28;
  v72 = v29;
  swift_getOpaqueTypeConformance2();
  v37 = v59;
  v38 = v65;
  sub_24192B884();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v30, v38);
  v39 = v68;
  v40 = v62;
  v41 = v64;
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v62, v37, v64);
  v42 = v61;
  v43 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  v44 = v60;
  v45 = v58;
  v46 = v63;
  v43(v60, v58, v63);
  v47 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v47(v37, v40, v41);
  v48 = v67;
  v43(v67, v44, v46);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571604C0);
  v47(&v48[*(int *)(v49 + 48)], v37, v41);
  v50 = *(void (**)(char *, uint64_t))(v68 + 8);
  v50(v40, v41);
  v51 = *(void (**)(char *, uint64_t))(v42 + 8);
  v51(v45, v46);
  v50(v37, v41);
  return ((uint64_t (*)(char *, uint64_t))v51)(v44, v46);
}

uint64_t sub_241925840()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  MEMORY[0x24269E0F0](v10, v8);
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  swift_release();
  sub_24191E2F4();
  sub_241918994();
  return sub_24192B62C();
}

uint64_t sub_241925A00@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t ObjCClassFromMetadata;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  void (*v57)(char *, uint64_t);
  void (*v58)(char *, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;

  v73 = a2;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603F8);
  v79 = *(_QWORD *)(v72 - 8);
  v3 = MEMORY[0x24BDAC7A8](v72);
  v71 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v77 = (char *)&v60 - v5;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160400);
  v78 = *(_QWORD *)(v70 - 8);
  v6 = MEMORY[0x24BDAC7A8](v70);
  v69 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v76 = (char *)&v60 - v8;
  v67 = sub_24192B6EC();
  v68 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160378);
  v62 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160408);
  v66 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160410);
  v75 = *(_QWORD *)(v65 - 8);
  v15 = MEMORY[0x24BDAC7A8](v65);
  v61 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v74 = (char *)&v60 - v17;
  v87 = *(_OWORD *)(a1 + 16);
  v88 = *(_QWORD *)(a1 + 32);
  v85 = *(_OWORD *)(a1 + 16);
  v86 = *(_QWORD *)(a1 + 32);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v19 = v82;
  v20 = v83;
  swift_getKeyPath();
  v82 = v19;
  v83 = v20;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603A0);
  sub_241919930(&qword_2571603A8, &qword_2571603A0, MEMORY[0x24BDF4700]);
  sub_24192B968();
  v82 = v87;
  v83 = v88;
  MEMORY[0x24269E0F0](&v85, v18);
  v21 = v85;
  swift_getKeyPath();
  *(_QWORD *)&v82 = v21;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  v22 = *(_BYTE *)(v21 + 40);
  swift_release();
  LOBYTE(v82) = v22;
  v23 = swift_allocObject();
  v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v24;
  *(_QWORD *)(v23 + 80) = *(_QWORD *)(a1 + 64);
  v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  sub_241929C54(a1);
  v26 = sub_241919930(&qword_257160380, &qword_257160378, MEMORY[0x24BDF46D0]);
  v27 = MEMORY[0x24BEE1328];
  v28 = MEMORY[0x24BEE1340];
  sub_24192B884();
  swift_release();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v12, v10);
  v29 = v63;
  sub_24192B6E0();
  *(_QWORD *)&v82 = v10;
  *((_QWORD *)&v82 + 1) = v27;
  v83 = v26;
  v84 = v28;
  swift_getOpaqueTypeConformance2();
  sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v30 = v61;
  v31 = v64;
  v32 = v67;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v29, v32);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v14, v31);
  v33 = v75;
  v34 = v74;
  v35 = v65;
  (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v74, v30, v65);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v37 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v38 = (void *)sub_24192BA1C();
  v39 = (void *)sub_24192BA1C();
  v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, 0, v39);

  v41 = sub_24192BA28();
  v43 = v42;

  *(_QWORD *)&v85 = v41;
  *((_QWORD *)&v85 + 1) = v43;
  v81 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C8);
  sub_24192B920();
  sub_24192A254();
  sub_241918994();
  v44 = v76;
  sub_24192B650();
  v80 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160418);
  sub_24192A37C();
  v45 = v77;
  sub_24192B7C4();
  v46 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v46(v30, v34, v35);
  v47 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
  v48 = v69;
  v49 = v70;
  v47(v69, v44, v70);
  v50 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
  v51 = v71;
  v52 = v45;
  v53 = v72;
  v50(v71, v52, v72);
  v54 = v73;
  v46(v73, v30, v35);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160448);
  v47(&v54[*(int *)(v55 + 48)], v48, v49);
  v50(&v54[*(int *)(v55 + 64)], v51, v53);
  v56 = *(void (**)(char *, uint64_t))(v79 + 8);
  v56(v77, v53);
  v57 = *(void (**)(char *, uint64_t))(v78 + 8);
  v57(v76, v49);
  v58 = *(void (**)(char *, uint64_t))(v75 + 8);
  v58(v74, v35);
  v56(v51, v53);
  v57(v48, v49);
  return ((uint64_t (*)(char *, uint64_t))v58)(v30, v35);
}

double sub_2419261F8@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2419290B4((void (*)(__n128 *__return_ptr))sub_241926204, a1).n128_u64[0];
  return result;
}

uint64_t sub_241926204@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjCClassFromMetadata;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  v7 = sub_24192B80C();
  v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_24192B89C();
  v11 = sub_24192B7D0();
  v37 = v12;
  v38 = v11;
  v14 = v13;
  v39 = v15;
  swift_release();
  v36 = v14 & 1;
  sub_241918C08(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = (void *)sub_24192BA1C();
  v18 = (void *)sub_24192BA1C();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_24192BA28();
  v20 = sub_24192B80C();
  v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_24192B788();
  v24 = sub_24192B7F4();
  v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_241918C08(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_24192B8A8();
  v28 = sub_24192B7D0();
  v30 = v29;
  LOBYTE(v19) = v31;
  v33 = v32;
  swift_release();
  sub_241918C08(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v38;
  *(_QWORD *)(a1 + 8) = v37;
  *(_BYTE *)(a1 + 16) = v36;
  *(_QWORD *)(a1 + 24) = v39;
  *(_QWORD *)(a1 + 32) = v28;
  *(_QWORD *)(a1 + 40) = v30;
  *(_BYTE *)(a1 + 48) = v19 & 1;
  *(_QWORD *)(a1 + 56) = v33;
  sub_241918BF8(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_241918BF8(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_241918C08(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_241918C08(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

void sub_241926584(uint64_t a1, unsigned __int8 *a2, uint64_t a3, SEL *a4)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  id v8;

  v5 = *a2;
  v6 = *(_BYTE *)(a3 + 8);
  v7 = swift_retain();
  sub_241929A00(v7, v6);
  swift_release();
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v8, *a4, v5);
  swift_release();

}

uint64_t sub_241926614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  unint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;

  v46 = a2;
  v3 = sub_24192B74C();
  v4 = *(_QWORD *)(v3 - 8);
  v44 = v3;
  v45 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160430);
  v38 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160428);
  v43 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160450);
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v37 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v14 = (void *)sub_24192BA1C();
  v15 = (void *)sub_24192BA1C();
  v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, 0, v15);

  v17 = sub_24192BA28();
  v19 = v18;

  v52 = v17;
  v53 = v19;
  v54 = *(_OWORD *)(a1 + 16);
  v55 = *(_QWORD *)(a1 + 32);
  v50 = *(_OWORD *)(a1 + 16);
  v51 = *(_QWORD *)(a1 + 32);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v21 = v47;
  v22 = v48;
  swift_getKeyPath();
  v47 = v21;
  v48 = v22;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v47 = v50;
  LOBYTE(v48) = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160458);
  sub_24191B13C();
  sub_24192A4D8(&qword_257160460, &qword_257160458, (uint64_t (*)(void))sub_24192A53C);
  sub_241918994();
  sub_24192B95C();
  v47 = v54;
  v48 = v55;
  MEMORY[0x24269E0F0](&v50, v20);
  v23 = v50;
  swift_getKeyPath();
  *(_QWORD *)&v47 = v23;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v13) = *(_BYTE *)(v23 + 42);
  swift_release();
  LOBYTE(v47) = (_BYTE)v13;
  v24 = swift_allocObject();
  v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(_QWORD *)(v24 + 80) = *(_QWORD *)(a1 + 64);
  v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v26;
  sub_241929C54(a1);
  v27 = sub_241919930(&qword_257160438, &qword_257160430, MEMORY[0x24BDF4570]);
  v28 = sub_24191AFD4();
  sub_24192B884();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
  v29 = v41;
  sub_24192B740();
  *(_QWORD *)&v47 = v6;
  *((_QWORD *)&v47 + 1) = &type metadata for KeepMessagesPreference;
  v48 = v27;
  v49 = v28;
  swift_getOpaqueTypeConformance2();
  v30 = v37;
  v31 = v39;
  v32 = v44;
  sub_24192B83C();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v32);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v31);
  v33 = v40;
  v34 = v46;
  v35 = v42;
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 16))(v46, v30, v42);
  *(_BYTE *)(v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257160418) + 36)) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v30, v35);
}

uint64_t sub_241926B4C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EF78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160470);
  sub_241919930(&qword_2571604A8, &qword_25715EF78, MEMORY[0x24BEE12D8]);
  sub_24192A53C();
  sub_24192A628();
  return sub_24192B9C8();
}

uint64_t sub_241926C0C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v3 = *a1;
  sub_24191ADE8();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 32) = v3;
  *(_BYTE *)(a2 + 33) = v3;
  return result;
}

void sub_241926C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(_BYTE *)(a3 + 8);
  v4 = swift_retain();
  v5 = sub_241929A00(v4, v3);
  swift_release();
  v6 = *(_QWORD *)(v5 + 56);
  sub_24192A5EC();
  v7 = (id)sub_24192BA7C();
  objc_msgSend(*(id *)(v6 + 16), sel_updateKeepMessagesPreference_, v7);
  swift_release();

}

uint64_t sub_241926D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v26;
  id v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjCClassFromMetadata;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  char *v53;
  uint64_t v54;
  char *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  char *v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  char *v97;
  void (*v98)(char *, char *, uint64_t);
  void (*v99)(char *, char *, uint64_t);
  char *v100;
  uint64_t v101;
  uint64_t v102;
  int *v103;
  char *v104;
  char *v105;
  void (*v106)(char *, uint64_t);
  void (*v107)(char *, uint64_t);
  void (*v108)(char *, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(char *, char *, uint64_t);
  uint64_t OpaqueTypeConformance2;
  void (*v116)(char *, uint64_t);
  unint64_t v117;
  unint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  _QWORD *v147;
  char *v148;
  uint64_t v149;
  char *v150;
  char *v151;
  __int128 v152;
  uint64_t v153;
  uint64_t v154;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  uint64_t v160;

  v130 = a2;
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603B0);
  v142 = *(_QWORD *)(v131 - 8);
  v3 = MEMORY[0x24BDAC7A8](v131);
  v143 = (char *)&v110 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v141 = (char *)&v110 - v5;
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160378);
  v124 = *(_QWORD *)(v125 - 8);
  MEMORY[0x24BDAC7A8](v125);
  v123 = (char *)&v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160370);
  v127 = *(_QWORD *)(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v126 = (char *)&v110 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160368);
  v139 = *(_QWORD *)(v129 - 8);
  v8 = MEMORY[0x24BDAC7A8](v129);
  v140 = (char *)&v110 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v150 = (char *)&v110 - v10;
  v145 = sub_24192B6EC();
  v133 = *(_QWORD *)(v145 - 8);
  MEMORY[0x24BDAC7A8](v145);
  v134 = (char *)&v110 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v132 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v13 = (char *)&v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  v121 = *(_QWORD *)(v135 - 8);
  MEMORY[0x24BDAC7A8](v135);
  v144 = (char *)&v110 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F0);
  v147 = *(_QWORD **)(v149 - 8);
  v15 = MEMORY[0x24BDAC7A8](v149);
  v138 = (char *)&v110 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v148 = (char *)&v110 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v151 = (char *)&v110 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v146 = (char *)&v110 - v21;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603B8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v137 = (uint64_t)&v110 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v110 - v25;
  v27 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureFlags);
  v28 = objc_msgSend(v27, sel_isLazuliEnabled);

  v136 = v26;
  if (v28)
  {
    v159 = *(_OWORD *)(a1 + 16);
    v160 = *(_QWORD *)(a1 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
    v29 = sub_24192B9BC();
    MEMORY[0x24BDAC7A8](v29);
    *(&v110 - 2) = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2571603E0);
    sub_24192A2A0();
    sub_24192A2FC();
    sub_24192B638();
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v26, 0, 1, v30);
  }
  else
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v26, 1, 1, v31);
  }
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v120 = ObjCClassFromMetadata;
  v119 = (id)objc_opt_self();
  v33 = objc_msgSend(v119, sel_bundleForClass_, ObjCClassFromMetadata);
  v34 = (void *)sub_24192BA1C();
  v118 = 0x800000024192EF60;
  v35 = (void *)sub_24192BA1C();
  v36 = objc_msgSend(v33, sel_localizedStringForKey_value_table_, v34, 0, v35);

  v37 = sub_24192BA28();
  v39 = v38;

  v157 = v37;
  v158 = v39;
  v159 = *(_OWORD *)(a1 + 16);
  v160 = *(_QWORD *)(a1 + 32);
  v155 = *(_OWORD *)(a1 + 16);
  v156 = *(_QWORD *)(a1 + 32);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v41 = v152;
  v42 = v153;
  swift_getKeyPath();
  v152 = v41;
  v153 = v42;
  v113 = v40;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v117 = sub_241918994();
  sub_24192B980();
  v43 = v134;
  sub_24192B6E0();
  v44 = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  v45 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v46 = v145;
  v47 = v122;
  v112 = v44;
  v48 = v45;
  v111 = v45;
  sub_24192B848();
  v133 = *(_QWORD *)(v133 + 8);
  ((void (*)(char *, uint64_t))v133)(v43, v46);
  v116 = *(void (**)(char *, uint64_t))(v132 + 8);
  v116(v13, v47);
  v152 = v159;
  v153 = v160;
  MEMORY[0x24269E0F0](&v155, v40);
  v49 = v155;
  swift_getKeyPath();
  *(_QWORD *)&v152 = v49;
  v132 = sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  LOBYTE(v33) = *(_BYTE *)(v49 + 45);
  swift_release();
  LOBYTE(v155) = (_BYTE)v33;
  v50 = swift_allocObject();
  v51 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v50 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v50 + 64) = v51;
  *(_QWORD *)(v50 + 80) = *(_QWORD *)(a1 + 64);
  v52 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v50 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v50 + 32) = v52;
  sub_241929C54(a1);
  *(_QWORD *)&v152 = v47;
  *((_QWORD *)&v152 + 1) = v46;
  v153 = v44;
  v154 = v48;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v53 = v151;
  v54 = v135;
  v55 = v144;
  sub_24192B884();
  swift_release();
  v121 = *(_QWORD *)(v121 + 8);
  ((void (*)(char *, uint64_t))v121)(v55, v54);
  v114 = (void (*)(char *, char *, uint64_t))v147[4];
  v114(v146, v53, v149);
  v56 = objc_msgSend(v119, sel_bundleForClass_, v120);
  v57 = (void *)sub_24192BA1C();
  v58 = (void *)sub_24192BA1C();
  v59 = objc_msgSend(v56, sel_localizedStringForKey_value_table_, v57, 0, v58);

  v60 = sub_24192BA28();
  v62 = v61;

  v157 = v60;
  v158 = v62;
  v155 = v159;
  v156 = v160;
  v63 = v113;
  sub_24192B9BC();
  v64 = v152;
  v65 = v153;
  swift_getKeyPath();
  v152 = v64;
  v153 = v65;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24192B980();
  v66 = v134;
  sub_24192B6E0();
  v68 = v144;
  v67 = v145;
  v69 = v111;
  sub_24192B848();
  ((void (*)(char *, uint64_t))v133)(v66, v67);
  v116(v13, v47);
  v152 = v159;
  v153 = v160;
  MEMORY[0x24269E0F0](&v155, v63);
  v70 = v155;
  swift_getKeyPath();
  *(_QWORD *)&v152 = v70;
  sub_24192B5CC();
  swift_release();
  LOBYTE(v56) = *(_BYTE *)(v70 + 46);
  swift_release();
  LOBYTE(v152) = (_BYTE)v56;
  v71 = swift_allocObject();
  v72 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v71 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v71 + 64) = v72;
  *(_QWORD *)(v71 + 80) = *(_QWORD *)(a1 + 64);
  v73 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v71 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v71 + 32) = v73;
  sub_241929C54(a1);
  v74 = v148;
  v75 = v135;
  sub_24192B884();
  swift_release();
  ((void (*)(char *, uint64_t))v121)(v68, v75);
  v114(v151, v74, v149);
  v155 = v159;
  v156 = v160;
  sub_24192B9BC();
  v76 = v152;
  v77 = v153;
  swift_getKeyPath();
  v152 = v76;
  v153 = v77;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2571603A0);
  v144 = (char *)sub_241919930(&qword_2571603A8, &qword_2571603A0, MEMORY[0x24BDF4700]);
  v78 = v123;
  sub_24192B968();
  sub_24192B6E0();
  v79 = sub_241919930(&qword_257160380, &qword_257160378, MEMORY[0x24BDF46D0]);
  v80 = v126;
  v81 = v125;
  v82 = v145;
  sub_24192B848();
  ((void (*)(char *, uint64_t))v133)(v66, v82);
  (*(void (**)(char *, uint64_t))(v124 + 8))(v78, v81);
  v152 = v159;
  v153 = v160;
  MEMORY[0x24269E0F0](&v155, v63);
  v83 = v155;
  swift_getKeyPath();
  *(_QWORD *)&v152 = v83;
  sub_24192B5CC();
  swift_release();
  LOBYTE(v78) = *(_BYTE *)(v83 + 47);
  swift_release();
  LOBYTE(v155) = (_BYTE)v78;
  v84 = swift_allocObject();
  v85 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v84 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v84 + 64) = v85;
  *(_QWORD *)(v84 + 80) = *(_QWORD *)(a1 + 64);
  v86 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v84 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v84 + 32) = v86;
  sub_241929C54(a1);
  *(_QWORD *)&v152 = v81;
  *((_QWORD *)&v152 + 1) = v82;
  v153 = v79;
  v154 = v69;
  swift_getOpaqueTypeConformance2();
  v87 = v140;
  v88 = v128;
  sub_24192B884();
  swift_release();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v80, v88);
  v89 = v139;
  v90 = v87;
  v91 = v129;
  (*(void (**)(char *, char *, uint64_t))(v139 + 32))(v150, v87, v129);
  v155 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603C8);
  sub_24192B920();
  sub_24192A254();
  v92 = v141;
  sub_24192B638();
  v93 = v137;
  sub_241918A1C((uint64_t)v136, v137, &qword_2571603B8);
  v94 = v148;
  v95 = (void (*)(char *, char *, uint64_t))v147[2];
  v96 = v149;
  v95(v148, v146, v149);
  v97 = v138;
  v95(v138, v151, v96);
  v98 = *(void (**)(char *, char *, uint64_t))(v89 + 16);
  v98(v90, v150, v91);
  v99 = *(void (**)(char *, char *, uint64_t))(v142 + 16);
  v100 = v92;
  v101 = v131;
  v99(v143, v100, v131);
  v102 = v130;
  sub_241918A1C(v93, v130, &qword_2571603B8);
  v103 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2571603D8);
  v95((char *)(v102 + v103[12]), v94, v96);
  v95((char *)(v102 + v103[16]), v97, v96);
  v104 = v140;
  v98((char *)(v102 + v103[20]), v140, v91);
  v105 = v143;
  v99((char *)(v102 + v103[24]), v143, v101);
  v106 = *(void (**)(char *, uint64_t))(v142 + 8);
  v106(v141, v101);
  v107 = *(void (**)(char *, uint64_t))(v139 + 8);
  v107(v150, v91);
  v108 = (void (*)(char *, uint64_t))v147[1];
  v108(v151, v96);
  v108(v146, v96);
  sub_241918A60((uint64_t)v136, &qword_2571603B8);
  v106(v105, v101);
  v107(v104, v91);
  v108(v138, v96);
  v108(v148, v96);
  return sub_241918A60(v137, &qword_2571603B8);
}

uint64_t sub_241927DC8()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_24192BA1C();
  v3 = (void *)sub_24192BA1C();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_24192BA28();
  v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  MEMORY[0x24269E0F0](v10, v8);
  swift_getKeyPath();
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  swift_release();
  sub_24191E404();
  sub_241918994();
  return sub_24192B62C();
}

uint64_t sub_241927F8C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;
  char v6;
  uint64_t v7;

  v5 = *a2;
  v6 = *(_BYTE *)(a3 + 8);
  v7 = swift_retain();
  sub_241929A00(v7, v6);
  swift_release();
  a4(v5);
  return swift_release();
}

double sub_241927FE4@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2419290B4((void (*)(__n128 *__return_ptr))sub_241927FF0, a1).n128_u64[0];
  return result;
}

uint64_t sub_241927FF0@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjCClassFromMetadata;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  v7 = sub_24192B80C();
  v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_24192B89C();
  v11 = sub_24192B7D0();
  v37 = v12;
  v38 = v11;
  v14 = v13;
  v39 = v15;
  swift_release();
  v36 = v14 & 1;
  sub_241918C08(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = (void *)sub_24192BA1C();
  v18 = (void *)sub_24192BA1C();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_24192BA28();
  v20 = sub_24192B80C();
  v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_24192B788();
  v24 = sub_24192B7F4();
  v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_241918C08(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_24192B8A8();
  v28 = sub_24192B7D0();
  v30 = v29;
  LOBYTE(v19) = v31;
  v33 = v32;
  swift_release();
  sub_241918C08(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v38;
  *(_QWORD *)(a1 + 8) = v37;
  *(_BYTE *)(a1 + 16) = v36;
  *(_QWORD *)(a1 + 24) = v39;
  *(_QWORD *)(a1 + 32) = v28;
  *(_QWORD *)(a1 + 40) = v30;
  *(_BYTE *)(a1 + 48) = v19 & 1;
  *(_QWORD *)(a1 + 56) = v33;
  sub_241918BF8(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_241918BF8(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_241918C08(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_241918C08(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_241928370(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v11;
  char v12;
  uint64_t v13;

  v11 = *a2;
  v12 = *(_BYTE *)(a3 + 8);
  v13 = swift_retain();
  sub_241929A00(v13, v12);
  swift_release();
  sub_24191BA5C(0, a4, a5, v11, a6, a7);
  return swift_release();
}

double sub_2419283F8@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2419290B4((void (*)(__n128 *__return_ptr))sub_241928404, a1).n128_u64[0];
  return result;
}

uint64_t sub_241928404@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjCClassFromMetadata;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  v7 = sub_24192B80C();
  v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_24192B89C();
  v11 = sub_24192B7D0();
  v37 = v12;
  v38 = v11;
  v14 = v13;
  v39 = v15;
  swift_release();
  v36 = v14 & 1;
  sub_241918C08(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v17 = (void *)sub_24192BA1C();
  v18 = (void *)sub_24192BA1C();
  v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_24192BA28();
  v20 = sub_24192B80C();
  v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_24192B788();
  v24 = sub_24192B7F4();
  v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_241918C08(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_24192B8A8();
  v28 = sub_24192B7D0();
  v30 = v29;
  LOBYTE(v19) = v31;
  v33 = v32;
  swift_release();
  sub_241918C08(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v38;
  *(_QWORD *)(a1 + 8) = v37;
  *(_BYTE *)(a1 + 16) = v36;
  *(_QWORD *)(a1 + 24) = v39;
  *(_QWORD *)(a1 + 32) = v28;
  *(_QWORD *)(a1 + 40) = v30;
  *(_BYTE *)(a1 + 48) = v19 & 1;
  *(_QWORD *)(a1 + 56) = v33;
  sub_241918BF8(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_241918BF8(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_241918C08(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_241918C08(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_241928784@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_2419288AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD v19[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160398);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160250);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)sub_24192BA1C();
  v12 = (void *)sub_24192BA1C();
  v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  v14 = sub_24192BA28();
  v16 = v15;

  v19[0] = v14;
  v19[1] = v16;
  sub_24192B5A8();
  v17 = sub_24192B5B4();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v4, 1, v17);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_241918994();
    sub_24192B7B8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v8, v5);
  }
  return result;
}

uint64_t sub_241928AAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_241928BD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_241928CF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  char *v27;
  char *v29;
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
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  v36 = a2;
  v3 = sub_24192B6EC();
  v4 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  v33 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160378);
  v8 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  v31 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160370);
  v12 = *(_QWORD *)(v11 - 8);
  v34 = v11;
  v35 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v29 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = *(_OWORD *)(a1 + 16);
  v43 = *(_QWORD *)(a1 + 32);
  v40 = *(_OWORD *)(a1 + 16);
  v41 = *(_QWORD *)(a1 + 32);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v15 = v37;
  v16 = v38;
  swift_getKeyPath();
  v37 = v15;
  v38 = v16;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571603A0);
  sub_241919930(&qword_2571603A8, &qword_2571603A0, MEMORY[0x24BDF4700]);
  sub_24192B968();
  sub_24192B6E0();
  v17 = sub_241919930(&qword_257160380, &qword_257160378, MEMORY[0x24BDF46D0]);
  v18 = sub_241918B00((unint64_t *)&qword_257160310, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D8], MEMORY[0x24BDEE6B8]);
  v19 = v30;
  v20 = v32;
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v20);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v19);
  v37 = v42;
  v38 = v43;
  MEMORY[0x24269E0F0](&v40, v14);
  v21 = v40;
  swift_getKeyPath();
  *(_QWORD *)&v37 = v21;
  sub_241918B00(&qword_25715EC30, (uint64_t (*)(uint64_t))type metadata accessor for SettingsModel, (uint64_t)&protocol conformance descriptor for SettingsModel);
  sub_24192B5CC();
  swift_release();
  v22 = *(_BYTE *)(v21 + 50);
  swift_release();
  LOBYTE(v40) = v22;
  v23 = swift_allocObject();
  v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v24;
  *(_QWORD *)(v23 + 80) = *(_QWORD *)(a1 + 64);
  v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  sub_241929C54(a1);
  *(_QWORD *)&v37 = v19;
  *((_QWORD *)&v37 + 1) = v20;
  v38 = v17;
  v39 = v18;
  swift_getOpaqueTypeConformance2();
  v26 = v34;
  v27 = v29;
  sub_24192B884();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v27, v26);
}

double sub_2419290A8@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2419290B4((void (*)(__n128 *__return_ptr))sub_241929130, a1).n128_u64[0];
  return result;
}

__n128 sub_2419290B4@<Q0>(void (*a1)(__n128 *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;
  __n128 v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  char v15;
  uint64_t v16;

  v4 = sub_24192B71C();
  a1(&v11);
  v5 = v12;
  v6 = v13;
  v7 = v15;
  v8 = v16;
  result = v11;
  v10 = v14;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(_BYTE *)(a2 + 40) = v5;
  *(_QWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v10;
  *(_BYTE *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

uint64_t sub_241929130@<X0>(uint64_t a1@<X8>)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  uint64_t ObjCClassFromMetadata;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v39 = (void *)objc_opt_self();
  v2 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = (void *)sub_24192BA1C();
  v4 = sub_24192BA1C();
  v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, v4);

  sub_24192BA28();
  sub_241918994();
  v6 = sub_24192B80C();
  v8 = v7;
  LOBYTE(v5) = v9 & 1;
  sub_24192B770();
  v10 = sub_24192B7F4();
  v12 = v11;
  v14 = v13;
  swift_release();
  sub_241918C08(v6, v8, (char)v5);
  swift_bridgeObjectRelease();
  sub_24192B89C();
  v15 = sub_24192B7D0();
  v42 = v16;
  v43 = v15;
  v18 = v17;
  v44 = v19;
  swift_release();
  v41 = v18 & 1;
  sub_241918C08(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  v21 = (void *)sub_24192BA1C();
  v22 = (void *)sub_24192BA1C();
  v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, v22);

  sub_24192BA28();
  v24 = sub_24192B80C();
  v26 = v25;
  LOBYTE(v23) = v27 & 1;
  sub_24192B788();
  v28 = sub_24192B7F4();
  v30 = v29;
  LOBYTE(v4) = v31;
  swift_release();
  sub_241918C08(v24, v26, (char)v23);
  swift_bridgeObjectRelease();
  sub_24192B8A8();
  v32 = sub_24192B7D0();
  v34 = v33;
  LOBYTE(v23) = v35;
  v37 = v36;
  swift_release();
  sub_241918C08(v28, v30, v4 & 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v43;
  *(_QWORD *)(a1 + 8) = v42;
  *(_BYTE *)(a1 + 16) = v41;
  *(_QWORD *)(a1 + 24) = v44;
  *(_QWORD *)(a1 + 32) = v32;
  *(_QWORD *)(a1 + 40) = v34;
  *(_BYTE *)(a1 + 48) = v23 & 1;
  *(_QWORD *)(a1 + 56) = v37;
  sub_241918BF8(v43, v42, v41);
  swift_bridgeObjectRetain();
  sub_241918BF8(v32, v34, v23 & 1);
  swift_bridgeObjectRetain();
  sub_241918C08(v32, v34, v23 & 1);
  swift_bridgeObjectRelease();
  sub_241918C08(v43, v42, v41);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2419294F8(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a2;
  v4 = *(_BYTE *)(a3 + 8);
  v5 = swift_retain();
  v6 = sub_241929A00(v5, v4);
  swift_release();
  objc_msgSend(*(id *)(*(_QWORD *)(v6 + 112) + 16), sel_setRCSBusinessMessagesEnabled_, v3);
  return swift_release();
}

uint64_t sub_24192955C@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_241929684@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160398);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160250);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)sub_24192BA1C();
  v12 = (void *)sub_24192BA1C();
  v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  v14 = sub_24192BA28();
  v16 = v15;

  v20 = v14;
  v21 = v16;
  v20 = sub_24192BA40();
  v21 = v17;
  sub_24192B5A8();
  v18 = sub_24192B5B4();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v4, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_241918994();
    sub_24192B7B8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v8, v5);
  }
  return result;
}

uint64_t sub_2419298A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160240);
  sub_241919930(&qword_257160248, &qword_257160240, MEMORY[0x24BDF5428]);
  return sub_24192B7AC();
}

uint64_t sub_24192993C@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_24191FBC4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241929944@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_241920EAC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24192994C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2419216D8(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_241929954()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2571602D8;
  if (!qword_2571602D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571602A0);
    v2 = sub_241919930(&qword_2571602E0, &qword_2571602E8, MEMORY[0x24BDF4700]);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2571602D8);
  }
  return result;
}

uint64_t sub_2419299D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241922598(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2419299D8@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_241922FC4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2419299E0@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_24192516C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2419299E8@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_241925A00(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2419299F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241926D1C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2419299F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241928CF4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241929A00(uint64_t a1, char a2)
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

  v4 = sub_24192B6A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_24192BA70();
    v9 = sub_24192B758();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_241929CC4(0x73676E6974746553, 0xEF747865746E6F43, &v14);
      _os_log_impl(&dword_24190B000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24269E840](v11, -1, -1);
      MEMORY[0x24269E840](v10, -1, -1);
    }

    sub_24192B698();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_241929B98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24192B680();
  *a1 = result;
  return result;
}

uint64_t sub_241929BC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24192B680();
  *a1 = result;
  return result;
}

uint64_t sub_241929BE8()
{
  swift_retain();
  return sub_24192B68C();
}

uint64_t sub_241929C10()
{
  swift_retain();
  return sub_24192B68C();
}

uint64_t sub_241929C38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241922B0C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_241929C4C(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_241922F5C(a1, a2, v2 + 16);
}

uint64_t sub_241929C54(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_241929CC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_241929D94(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_241929EB0((uint64_t)v12, *a3);
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
      sub_241929EB0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_241929D94(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_241929EEC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_24192BAAC();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_241929EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_241929EEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_241929F80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24192A07C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24192A07C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_241929F80(uint64_t a1, unint64_t a2)
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
      v3 = sub_24192A018(v2, 0);
      result = sub_24192BAA0();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_24192BA34();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24192A018(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257160390);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24192A07C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257160390);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
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

uint64_t sub_24192A174(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_2419294F8(a1, a2, v2 + 16);
}

uint64_t sub_24192A188(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_241927F8C(a1, a2, v2 + 16, (void (*)(uint64_t))sub_24191F53C);
}

uint64_t sub_24192A1B4(uint64_t a1, char *a2)
{
  uint64_t v2;

  return sub_241928370(a1, a2, v2 + 16, 0xD000000000000015, 0x800000024192F930, 0xD000000000000031, 0x800000024192FF50);
}

uint64_t sub_24192A20C(uint64_t a1, char *a2)
{
  uint64_t v2;

  return sub_241928370(a1, a2, v2 + 16, 0x4D537341646E6553, 0xE900000000000053, 0xD00000000000002CLL, 0x800000024192FED0);
}

unint64_t sub_24192A254()
{
  unint64_t result;

  result = qword_2571603D0;
  if (!qword_2571603D0)
  {
    result = MEMORY[0x24269E7D4](&unk_24192CD74, &type metadata for SendRecieveView);
    atomic_store(result, (unint64_t *)&qword_2571603D0);
  }
  return result;
}

uint64_t sub_24192A298()
{
  return sub_241927DC8();
}

unint64_t sub_24192A2A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2571603E8;
  if (!qword_2571603E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571603E0);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDEC770], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2571603E8);
  }
  return result;
}

unint64_t sub_24192A2FC()
{
  unint64_t result;

  result = qword_2571603F0;
  if (!qword_2571603F0)
  {
    result = MEMORY[0x24269E7D4]("u", &type metadata for SharedWithYouView);
    atomic_store(result, (unint64_t *)&qword_2571603F0);
  }
  return result;
}

void sub_24192A354(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  sub_241926584(a1, a2, v2 + 16, (SEL *)&selRef_setConversationListFilteringEnabled_);
}

uint64_t sub_24192A374@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241926614(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24192A37C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_257160420;
  if (!qword_257160420)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160418);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160428);
    v3 = sub_24192B74C();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160430);
    sub_241919930(&qword_257160438, &qword_257160430, MEMORY[0x24BDF4570]);
    sub_24191AFD4();
    v4[2] = v2;
    v4[3] = v3;
    v4[4] = swift_getOpaqueTypeConformance2();
    v4[5] = MEMORY[0x24BDF0890];
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_24192A48C();
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_257160420);
  }
  return result;
}

unint64_t sub_24192A48C()
{
  unint64_t result;

  result = qword_257160440;
  if (!qword_257160440)
  {
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF08F0], MEMORY[0x24BDF0900]);
    atomic_store(result, (unint64_t *)&qword_257160440);
  }
  return result;
}

uint64_t sub_24192A4D8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF4A08], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24192A53C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257160468;
  if (!qword_257160468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160470);
    v2[0] = sub_24192A954(&qword_257160478, &qword_257160480, &qword_257160488, &qword_257160490);
    v2[1] = sub_241919930(&qword_257160498, &qword_2571604A0, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257160468);
  }
  return result;
}

void sub_24192A5E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_241926C7C(a1, a2, v2 + 16);
}

unint64_t sub_24192A5EC()
{
  unint64_t result;

  result = qword_25715F968;
  if (!qword_25715F968)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25715F968);
  }
  return result;
}

unint64_t sub_24192A628()
{
  unint64_t result;

  result = qword_2571604B0;
  if (!qword_2571604B0)
  {
    result = MEMORY[0x24269E7D4](&protocol conformance descriptor for KeepMessagesPreference, &type metadata for KeepMessagesPreference);
    atomic_store(result, (unint64_t *)&qword_2571604B0);
  }
  return result;
}

uint64_t sub_24192A66C()
{
  return sub_241925840();
}

uint64_t sub_24192A680(uint64_t a1, char *a2)
{
  uint64_t v2;

  return sub_241928370(a1, a2, v2 + 16, 0xD000000000000011, 0x800000024192F8F0, 0xD00000000000002DLL, 0x8000000241930020);
}

uint64_t sub_24192A6D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2419241D0(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24192A6DC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2571604E8;
  if (!qword_2571604E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571604E0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571604F0);
    v3 = sub_24192B74C();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571604F8);
    sub_241919930(&qword_257160500, &qword_2571604F8, MEMORY[0x24BDF4570]);
    sub_24191E80C();
    v4[2] = v2;
    v4[3] = v3;
    v4[4] = swift_getOpaqueTypeConformance2();
    v4[5] = MEMORY[0x24BDF0890];
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_24192A48C();
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2571604E8);
  }
  return result;
}

uint64_t sub_24192A7F8(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_241927F8C(a1, a2, v2 + 16, (void (*)(uint64_t))sub_24191F678);
}

uint64_t sub_24192A818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_241924E0C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24192A820()
{
  return sub_241924C48();
}

unint64_t sub_24192A828()
{
  unint64_t result;

  result = qword_257160518;
  if (!qword_257160518)
  {
    result = MEMORY[0x24269E7D4](&unk_24192CBB8, &type metadata for CheckInDataView);
    atomic_store(result, (unint64_t *)&qword_257160518);
  }
  return result;
}

void sub_24192A878(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  sub_241926584(a1, a2, v2 + 16, (SEL *)&selRef_setRaiseToListenEnabled_);
}

unint64_t sub_24192A8B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257160538;
  if (!qword_257160538)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160540);
    v2[0] = sub_24192A954(&qword_257160548, &qword_257160550, &qword_257160558, &qword_257160560);
    v2[1] = sub_241919930(&qword_257160568, &qword_257160570, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257160538);
  }
  return result;
}

uint64_t sub_24192A954(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = sub_241919930(a3, a4, MEMORY[0x24BDEFB48]);
    v10[0] = MEMORY[0x24BDF1F80];
    v10[1] = v9;
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v8, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24192A9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_241924860(a1, a2, v2 + 16);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_24192AA38(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  sub_241926584(a1, a2, v2 + 16, (SEL *)&selRef_setReadReceiptsEnabled_);
}

uint64_t sub_24192AA58@<X0>(uint64_t a1@<X8>)
{
  return sub_24192219C(a1);
}

unint64_t sub_24192AA60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257160590;
  if (!qword_257160590)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160588);
    v2[0] = sub_24192AAFC(&qword_257160598, &qword_2571605A0, MEMORY[0x24BDF3F50]);
    v2[1] = sub_241919930(&qword_2571605A8, &qword_2571605B0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257160590);
  }
  return result;
}

uint64_t sub_24192AAFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24269E7D4](a3, v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24192AB54@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24192B668();
  *a1 = result;
  return result;
}

uint64_t sub_24192AB7C()
{
  return sub_24192B674();
}

uint64_t sub_24192ABA8()
{
  return sub_241921DFC();
}

uint64_t sub_24192ABB8()
{
  return sub_241919930(&qword_2571605C8, &qword_2571605D0, MEMORY[0x24BDF1988]);
}

_QWORD *assignWithCopy for SharedWithYouView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SharedWithYouView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharedWithYouView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharedWithYouView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SharedWithYouView()
{
  return &type metadata for SharedWithYouView;
}

uint64_t sub_24192AD3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24192AD4C()
{
  _BYTE v1[32];

  sub_24192B0DC((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571602F8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160300);
  sub_24192B6EC();
  sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  sub_24192B348();
  swift_getOpaqueTypeConformance2();
  return sub_24192B9F8();
}

uint64_t sub_24192AE2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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

  v24 = a3;
  v26 = a4;
  v6 = sub_24192B6EC();
  v27 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257160300);
  v25 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v13 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v14 = (void *)sub_24192BA1C();
  v15 = (void *)sub_24192BA1C();
  v16 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v14, 0, v15);

  v17 = sub_24192BA28();
  v19 = v18;

  v34 = v17;
  v35 = v19;
  v28 = a1;
  v29 = a2;
  v30 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25715EC10);
  sub_24192B9BC();
  v20 = v31;
  v21 = v32;
  v22 = v33;
  swift_getKeyPath();
  v31 = v20;
  v32 = v21;
  v33 = v22;
  sub_24192B9B0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_241918994();
  sub_24192B980();
  sub_24192B6E0();
  sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
  sub_24192B348();
  sub_24192B848();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v11, v9);
}

uint64_t sub_24192B0DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;

  type metadata accessor for MessagesSettingsUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_24192BA1C();
  v5 = (void *)sub_24192BA1C();
  v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_24192BA28();
  sub_241918994();
  result = sub_24192B80C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v9 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_24192B200()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571605D8);
  sub_24192B270();
  return sub_24192B7C4();
}

uint64_t sub_24192B264()
{
  return sub_24192AD4C();
}

unint64_t sub_24192B270()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  _QWORD v3[7];

  result = qword_2571605E0;
  if (!qword_2571605E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2571605D8);
    v3[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257160300);
    v3[4] = sub_24192B6EC();
    v3[5] = sub_241919930(&qword_257160308, &qword_257160300, MEMORY[0x24BDF46D0]);
    v3[6] = sub_24192B348();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = OpaqueTypeConformance2;
    v3[2] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2571605E0);
  }
  return result;
}

unint64_t sub_24192B348()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257160310;
  if (!qword_257160310)
  {
    v1 = sub_24192B6EC();
    result = MEMORY[0x24269E7D4](MEMORY[0x24BDEE6B8], v1);
    atomic_store(result, (unint64_t *)&qword_257160310);
  }
  return result;
}

uint64_t sub_24192B390@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_24192AE2C(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_24192B3A4()
{
  return sub_241919930(&qword_2571605E8, &qword_2571605F0, MEMORY[0x24BDF1A30]);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id sub_24192B3F0()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2571605F8 = (uint64_t)result;
  return result;
}

uint64_t sub_24192B444(uint64_t a1)
{
  return sub_24192B48C(a1, qword_257161F50);
}

uint64_t sub_24192B468(uint64_t a1)
{
  return sub_24192B48C(a1, qword_257161F68);
}

uint64_t sub_24192B48C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_24192B5FC();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_25715E9F0 != -1)
    swift_once();
  v4 = (id)qword_2571605F8;
  return sub_24192B5F0();
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

void __getICQInAppMessagingClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_24192B5A8();
}

uint64_t sub_24192B5A8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_24192B5B4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24192B5C0()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_24192B5CC()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_24192B5D8()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_24192B5E4()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_24192B5F0()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_24192B5FC()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_24192B608()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_24192B614()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_24192B620()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_24192B62C()
{
  return MEMORY[0x24BDEC750]();
}

uint64_t sub_24192B638()
{
  return MEMORY[0x24BDEC888]();
}

uint64_t sub_24192B644()
{
  return MEMORY[0x24BDEC8A8]();
}

uint64_t sub_24192B650()
{
  return MEMORY[0x24BDEC8B0]();
}

uint64_t sub_24192B65C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_24192B668()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_24192B674()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_24192B680()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_24192B68C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_24192B698()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_24192B6A4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_24192B6B0()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_24192B6BC()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_24192B6C8()
{
  return MEMORY[0x24BDEE590]();
}

uint64_t sub_24192B6D4()
{
  return MEMORY[0x24BDEE598]();
}

uint64_t sub_24192B6E0()
{
  return MEMORY[0x24BDEE6C8]();
}

uint64_t sub_24192B6EC()
{
  return MEMORY[0x24BDEE6D8]();
}

uint64_t sub_24192B6F8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_24192B704()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_24192B710()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_24192B71C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_24192B728()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_24192B734()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_24192B740()
{
  return MEMORY[0x24BDF0898]();
}

uint64_t sub_24192B74C()
{
  return MEMORY[0x24BDF08A0]();
}

uint64_t sub_24192B758()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_24192B764()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_24192B770()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_24192B77C()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_24192B788()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_24192B794()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_24192B7A0()
{
  return MEMORY[0x24BDF1920]();
}

uint64_t sub_24192B7AC()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_24192B7B8()
{
  return MEMORY[0x24BDF19C8]();
}

uint64_t sub_24192B7C4()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_24192B7D0()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_24192B7DC()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_24192B7E8()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_24192B7F4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_24192B800()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_24192B80C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_24192B818()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_24192B824()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24192B830()
{
  return MEMORY[0x24BDF2168]();
}

uint64_t sub_24192B83C()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_24192B848()
{
  return MEMORY[0x24BDF2450]();
}

uint64_t sub_24192B854()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24192B860()
{
  return MEMORY[0x24BDF2880]();
}

uint64_t sub_24192B86C()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_24192B878()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_24192B884()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_24192B890()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_24192B89C()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_24192B8A8()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_24192B8B4()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_24192B8C0()
{
  return MEMORY[0x24BDF3F78]();
}

uint64_t sub_24192B8CC()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_24192B8D8()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_24192B8E4()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_24192B8F0()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_24192B8FC()
{
  return MEMORY[0x24BDF4140]();
}

uint64_t sub_24192B908()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_24192B914()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_24192B920()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_24192B92C()
{
  return MEMORY[0x24BDF4378]();
}

uint64_t sub_24192B938()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_24192B944()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_24192B950()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_24192B95C()
{
  return MEMORY[0x24BDF4550]();
}

uint64_t sub_24192B968()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_24192B974()
{
  return MEMORY[0x24BDF4698]();
}

uint64_t sub_24192B980()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_24192B98C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_24192B998()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_24192B9A4()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_24192B9B0()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_24192B9BC()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_24192B9C8()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_24192B9D4()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_24192B9E0()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_24192B9EC()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_24192B9F8()
{
  return MEMORY[0x24BDF4AD8]();
}

uint64_t sub_24192BA04()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_24192BA10()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_24192BA1C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24192BA28()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24192BA34()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24192BA40()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24192BA4C()
{
  return MEMORY[0x24BDCFC18]();
}

uint64_t sub_24192BA58()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t sub_24192BA64()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_24192BA70()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24192BA7C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_24192BA88()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24192BA94()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24192BAA0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24192BAAC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24192BAB8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24192BAC4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24192BAD0()
{
  return MEMORY[0x24BEE4328]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t IMCloudKitGetSyncStateDictionary()
{
  return MEMORY[0x24BE50C90]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x24BE506B8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x24BE506C8]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return MEMORY[0x24BE51030]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x24BE51038]();
}

uint64_t IMStringFromIMCloudKitSyncJobState()
{
  return MEMORY[0x24BE51080]();
}

uint64_t IMStringFromIMCloudKitSyncType()
{
  return MEMORY[0x24BE51088]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50840]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50848]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x24BDD0FE0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

uint64_t PSIsNanoMirroringDomain()
{
  return MEMORY[0x24BE75B10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x24BE50920]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x24BE509C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

