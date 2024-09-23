uint64_t LockedCameraCaptureExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a1);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_233AFD480();
}

uint64_t sub_233AF54C0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_233AF5518()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 32))();
}

uint64_t sub_233AF5550()
{
  uint64_t v0;

  v0 = sub_233AFD4B0();
  __swift_allocate_value_buffer(v0, qword_2561118D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2561118D8);
  return sub_233AFD498();
}

uint64_t LockedCameraCaptureUIScene.session.getter()
{
  return swift_retain();
}

id LockedCameraCaptureUIScene.init(content:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, char *a3@<X3>, uint64_t *a4@<X8>)
{
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
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  id result;
  void *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  void (*v40)(uint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;

  v42 = a3;
  v39 = a4;
  v40 = a1;
  v5 = *(_QWORD *)(a2 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v41 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - v8;
  v10 = sub_233AFD468();
  v37 = *(_QWORD *)(v10 - 8);
  v38 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2561118D0 != -1)
    swift_once();
  v43 = v5;
  v44 = a2;
  v13 = sub_233AFD4B0();
  __swift_project_value_buffer(v13, (uint64_t)qword_2561118D8);
  v14 = sub_233AFD4A4();
  v35 = v15;
  v36 = v14;
  v16 = objc_msgSend(objc_allocWithZone((Class)sub_233AFD4D4()), sel_init);
  sub_233AFD528();
  swift_allocObject();
  v17 = v16;
  v18 = sub_233AFD4EC();
  type metadata accessor for LockedCameraCaptureSession();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v18;
  swift_retain();
  swift_retain();
  v20 = (void *)sub_233AFD4E0();
  v21 = objc_msgSend(v20, sel_url);

  sub_233AFD45C();
  if (qword_2561118F8 != -1)
    swift_once();
  v22 = qword_2561125D8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)qword_2561125D8 + 16);
  v23 = (os_unfair_lock_s *)(qword_2561125D8
                           + ((*(unsigned int *)(*(_QWORD *)qword_2561125D8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v23);
  sub_233AF5940(v22, (uint64_t)v12);
  os_unfair_lock_unlock(v23);
  v40(v19);
  v24 = v44;
  sub_233AFD570();
  v42 = v12;
  v25 = v9;
  v26 = v43;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v41, v25, v24);
  v27 = (void *)sub_233AFD564();
  result = objc_msgSend(v27, sel_view);
  if (result)
  {
    v29 = result;
    v30 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v29, sel_setBackgroundColor_, v30);

    v31 = v27;
    sub_233AFD4C8();

    swift_release();
    swift_release();

    swift_release();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v24);
    result = (id)(*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v42, v38);
    v32 = v39;
    v33 = v36;
    *v39 = v19;
    v32[1] = v33;
    v32[2] = v35;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_233AF5940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_233AF5D14(a1);
  v4 = sub_233AFD468();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
}

uint64_t LockedCameraCaptureUIScene.body.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(v6 + 32) = v3;
  *(_QWORD *)(v6 + 40) = v4;
  *(_QWORD *)(v6 + 48) = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  return sub_233AFD474();
}

uint64_t sub_233AF5A80()
{
  return 0;
}

uint64_t sub_233AF5A90()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_233AF5ABC()
{
  return sub_233AFD4F8();
}

uint64_t sub_233AF5AE0(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23493C5CC](&protocol conformance descriptor for LockedCameraCaptureUIScene<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_233AF5B0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of LockedCameraCaptureExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_233AF5B48()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_233AF5B54()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_233AF5B7C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_233AF5BB8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *sub_233AF5C30(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_release();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233AF5C74(uint64_t *a1, int a2)
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

uint64_t sub_233AF5CBC(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for LockedCameraCaptureUIScene(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LockedCameraCaptureUIScene);
}

uint64_t sub_233AF5D08()
{
  return MEMORY[0x24BDC7A50];
}

uint64_t sub_233AF5D14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493C5B4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23493C578](a1, v6, a5);
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256111990)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256111990);
  }
}

uint64_t sub_233AF5E54()
{
  uint64_t v0;

  v0 = sub_233AFD54C();
  __swift_allocate_value_buffer(v0, qword_2561125C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2561125C0);
  return sub_233AFD540();
}

void LockedCameraCaptureSession.sessionContentURL.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_233AFD4E0();
  v1 = objc_msgSend(v0, sel_url);

  sub_233AFD45C();
}

uint64_t sub_233AF5F20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AF7360(a1, a2);
}

uint64_t sub_233AF5F48()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_233AFD468();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256111B20);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_233AF7360((uint64_t)v1, v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16));
  result = sub_233AF7324((uint64_t)v1, &qword_256111988);
  qword_2561125D8 = v3;
  return result;
}

BOOL static LockedCameraCaptureSession.hasActiveSession.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2561118F8 != -1)
    swift_once();
  v3 = qword_2561125D8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)qword_2561125D8 + 16);
  v4 = (os_unfair_lock_s *)(qword_2561125D8
                          + ((*(unsigned int *)(*(_QWORD *)qword_2561125D8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_233AF7360(v3, (uint64_t)v2);
  os_unfair_lock_unlock(v4);
  v5 = sub_233AFD468();
  v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v2, 1, v5) != 1;
  sub_233AF7324((uint64_t)v2, &qword_256111988);
  return v6;
}

uint64_t LockedCameraCaptureSession.urlsToOpen.getter()
{
  uint64_t v0;
  void *v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111A00);
  MEMORY[0x24BDAC7A8](v0);
  v1 = (void *)sub_233AFD4F8();
  sub_233AFD4BC();

  sub_233AFD468();
  sub_233AF715C(&qword_256111A10, &qword_256111A00, MEMORY[0x24BEE6AA8]);
  return sub_233AFD750();
}

uint64_t sub_233AF6224(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_233AF6240()
{
  uint64_t v0;

  sub_233AFD600();
  *(_QWORD *)(v0 + 32) = sub_233AFD5F4();
  sub_233AFD5E8();
  return swift_task_switch();
}

uint64_t sub_233AF62A8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  swift_release();
  *(_QWORD *)(v0 + 40) = objc_msgSend(v1, sel_URL);
  return swift_task_switch();
}

uint64_t sub_233AF6300()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);
  sub_233AFD45C();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493C5C0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t LockedCameraCaptureSession.openApplication(for:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_233AF63A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_233AF63F8;
  return sub_233AFD504();
}

uint64_t sub_233AF63F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233AF6464()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;

  v1 = *(void **)(v0 + 48);
  sub_233AF6700();
  swift_allocError();
  sub_233AF64E4((uint64_t)v1, v2);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF64E4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t result;
  int v15;
  void (*v16)(_BYTE *, uint64_t, uint64_t, uint64_t);
  void (*v17)(_BYTE *, _BYTE *, uint64_t);
  _BYTE v18[8];
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_233AFD510();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v18[-v12];
  v19 = a1;
  MEMORY[0x23493C53C](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2561120A0);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    *a2 = v18[7];
    return result;
  }
  v19 = a1;
  MEMORY[0x23493C53C](a1);
  v15 = swift_dynamicCast();
  v16 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (!v15)
  {
    v16(v6, 1, 1, v7);
    result = sub_233AF7324((uint64_t)v6, &qword_256111B18);
    goto LABEL_8;
  }
  v16(v6, 0, 1, v7);
  v17 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32);
  v17(v13, v6, v7);
  v17(v11, v13, v7);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 88))(v11, v7);
  if ((_DWORD)result == *MEMORY[0x24BE852F8])
  {
LABEL_8:
    *a2 = 0;
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x24BE852E8])
  {
    *a2 = 1;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE852F0])
  {
    *a2 = 2;
  }
  else
  {
    *a2 = 0;
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  }
  return result;
}

unint64_t sub_233AF6700()
{
  unint64_t result;

  result = qword_256111A20;
  if (!qword_256111A20)
  {
    result = MEMORY[0x23493C5CC](&protocol conformance descriptor for LockedCameraCaptureSession.ApplicationLaunchError, &type metadata for LockedCameraCaptureSession.ApplicationLaunchError);
    atomic_store(result, (unint64_t *)&qword_256111A20);
  }
  return result;
}

uint64_t LockedCameraCaptureSession.openApplicationAfterTransitionCompletion(for:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  sub_233AFD600();
  v2[5] = sub_233AFD5F4();
  v2[6] = sub_233AFD5E8();
  v2[7] = v3;
  return swift_task_switch();
}

uint64_t sub_233AF67B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_233AF6810;
  return sub_233AFD51C();
}

uint64_t sub_233AF6810()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233AF6870()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF68A4()
{
  uint64_t v0;
  void *v1;
  _BYTE *v2;

  v1 = *(void **)(v0 + 72);
  swift_release();
  sub_233AF6700();
  swift_allocError();
  sub_233AF64E4((uint64_t)v1, v2);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LockedCameraCaptureSession.invalidateSessionContent()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256112030);
  *(_QWORD *)(v1 + 24) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233AF6984()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = sub_233AFD618();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v1;
  swift_retain();
  sub_233AF6B5C(v2, (uint64_t)&unk_256111A40, (uint64_t)v4);
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF6A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_233AF6A40()
{
  uint64_t v0;
  void *v1;

  v1 = (void *)sub_233AFD4E0();
  objc_msgSend(v1, sel_invalidate);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF6A88()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233AF6AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233AF6B14;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_233AF6B14()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233AF6B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_233AFD618();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_233AFD60C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_233AF7324(a1, &qword_256112030);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_233AFD5E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t static LockedCameraCaptureSession.ApplicationLaunchError.errorDomain.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t LockedCameraCaptureSession.ApplicationLaunchError.errorCode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t LockedCameraCaptureSession.ApplicationLaunchError.failureReason.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000033;
  if (*v0 != 1)
    v1 = 0xD000000000000042;
  if (*v0)
    return v1;
  else
    return 0xD000000000000023;
}

BOOL static LockedCameraCaptureSession.ApplicationLaunchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LockedCameraCaptureSession.ApplicationLaunchError.hash(into:)()
{
  return sub_233AFD7F8();
}

uint64_t LockedCameraCaptureSession.ApplicationLaunchError.hashValue.getter()
{
  sub_233AFD7EC();
  sub_233AFD7F8();
  return sub_233AFD804();
}

BOOL sub_233AF6DAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_233AF6DC0()
{
  sub_233AFD7EC();
  sub_233AFD7F8();
  return sub_233AFD804();
}

uint64_t sub_233AF6E04()
{
  return sub_233AFD7F8();
}

uint64_t sub_233AF6E2C()
{
  sub_233AFD7EC();
  sub_233AFD7F8();
  return sub_233AFD804();
}

unint64_t sub_233AF6E6C()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_233AF6E88()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_233AF6EA4()
{
  sub_233AF719C();
  return sub_233AFD7C8();
}

uint64_t sub_233AF6ECC()
{
  sub_233AF719C();
  return sub_233AFD7BC();
}

uint64_t LockedCameraCaptureSession.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t LockedCameraCaptureSession.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_233AF6F40()
{
  unint64_t result;

  result = qword_256111A48;
  if (!qword_256111A48)
  {
    result = MEMORY[0x23493C5CC](&protocol conformance descriptor for LockedCameraCaptureSession.ApplicationLaunchError, &type metadata for LockedCameraCaptureSession.ApplicationLaunchError);
    atomic_store(result, (unint64_t *)&qword_256111A48);
  }
  return result;
}

uint64_t type metadata accessor for LockedCameraCaptureSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for LockedCameraCaptureSession()
{
  return swift_lookUpClassMethod();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LockedCameraCaptureSession.ApplicationLaunchError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LockedCameraCaptureSession.ApplicationLaunchError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AF70A0 + 4 * byte_233AFDD65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233AF70D4 + 4 * asc_233AFDD60[v4]))();
}

uint64_t sub_233AF70D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AF70DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AF70E4);
  return result;
}

uint64_t sub_233AF70F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AF70F8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233AF70FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AF7104(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AF7110(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_233AF7118(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LockedCameraCaptureSession.ApplicationLaunchError()
{
  return &type metadata for LockedCameraCaptureSession.ApplicationLaunchError;
}

uint64_t sub_233AF7130()
{
  return sub_233AF715C(&qword_256111AF0, &qword_256111AF8, MEMORY[0x24BEE6F08]);
}

uint64_t sub_233AF715C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23493C5CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_233AF719C()
{
  unint64_t result;

  result = qword_256111B00;
  if (!qword_256111B00)
  {
    result = MEMORY[0x23493C5CC](&protocol conformance descriptor for LockedCameraCaptureSession.ApplicationLaunchError, &type metadata for LockedCameraCaptureSession.ApplicationLaunchError);
    atomic_store(result, (unint64_t *)&qword_256111B00);
  }
  return result;
}

uint64_t sub_233AF71E0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_233AF7244;
  return v6(a1);
}

uint64_t sub_233AF7244()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233AF7290()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233AF72B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233AF6B14;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256111B08 + dword_256111B08))(a1, v4);
}

uint64_t sub_233AF7324(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_233AF7360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233AF73A8(void (*a1)(_QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(unint64_t, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(_QWORD);
  uint64_t v46;
  void (*v47)(_QWORD *, _QWORD);
  void (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (**v58)(uint64_t, char *, uint64_t);
  char *v59;
  uint64_t v60;
  uint64_t result;
  uint64_t v62;
  uint64_t locked;
  void (*v64)(_QWORD);
  char *v65;
  void (**v66)(char *, uint64_t, uint64_t);
  void (*v67)(char *, char *, uint64_t);
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[7];

  v74 = a2;
  v64 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112048);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&locked - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&locked - v6;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112050);
  v8 = MEMORY[0x24BDAC7A8](v75);
  v66 = (void (**)(char *, uint64_t, uint64_t))((char *)&locked - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&locked - v10;
  locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  MEMORY[0x24BDAC7A8](locked);
  v73 = (uint64_t *)((char *)&locked - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112058);
  v79 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&locked - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v65 = (char *)&locked - v16;
  v78 = sub_233AFD468();
  v17 = *(void (***)(unint64_t, char *, uint64_t))(v78 - 8);
  v18 = MEMORY[0x24BDAC7A8](v78);
  v68 = (char *)&locked - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&locked - v20;
  v22 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_233AFB088(0, &qword_256112060);
  v23 = sub_233AFD5DC();

  v71 = v5;
  v72 = v2;
  v70 = v7;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_233AFD774();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v25 = MEMORY[0x24BEE4AF8];
  v26 = v79;
  v77 = v11;
  if (v24)
  {
    v80[0] = MEMORY[0x24BEE4AF8];
    sub_233AFBF8C(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v67 = (void (*)(char *, char *, uint64_t))v13;
    v27 = 0;
    v25 = v80[0];
    do
    {
      if ((v23 & 0xC000000000000001) != 0)
        v28 = (id)MEMORY[0x23493C23C](v27, v23);
      else
        v28 = *(id *)(v23 + 8 * v27 + 32);
      v29 = v28;
      v30 = objc_msgSend(v28, sel_url);
      sub_233AFD45C();

      v80[0] = v25;
      v32 = *(_QWORD *)(v25 + 16);
      v31 = *(_QWORD *)(v25 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_233AFBF8C(v31 > 1, v32 + 1, 1);
        v25 = v80[0];
      }
      ++v27;
      *(_QWORD *)(v25 + 16) = v32 + 1;
      v17[4](v25+ ((*((unsigned __int8 *)v17 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v17 + 80))+ (_QWORD)v17[9] * v32, v21, v78);
      v26 = v79;
    }
    while (v24 != v27);
    v13 = (uint64_t)v67;
  }
  if (v24 >= *(_QWORD *)(v25 + 16))
    v33 = *(_QWORD *)(v25 + 16);
  else
    v33 = v24;
  if (v33)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256112068);
    v34 = sub_233AFD798();
  }
  else
  {
    v34 = MEMORY[0x24BEE4B00];
  }
  v80[0] = v34;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_233AFB2C8(v25, v23, 1, v80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v35 = v80[0];
  v80[0] = v25;
  v36 = v76;
  v80[4] = *(_QWORD *)(v76 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256112070);
  sub_233AF715C(&qword_256112078, &qword_256112070, MEMORY[0x24BEE12B0]);
  sub_233AFC034(&qword_256112080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  v37 = v65;
  sub_233AFD5AC();
  *(_QWORD *)(v36 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v36 + 128) = v35;
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v36 + 112) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v38 = (uint64_t)v77;
    v39 = (uint64_t)v66;
    v67 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
    v67((char *)v66, v37, v13);
    v40 = sub_233AF715C(&qword_256112088, &qword_256112058, MEMORY[0x24BEE3150]);
    sub_233AFD63C();
    v41 = v75;
    *(_QWORD *)(v39 + *(int *)(v75 + 36)) = v80[0];
    sub_233AFBFF0(v39, v38, &qword_256112050);
    v75 = v38 + *(int *)(v41 + 36);
    v76 = v40;
    v42 = *(_QWORD *)v75;
    sub_233AFD648();
    v43 = locked;
    v44 = v78;
    v45 = v64;
    v66 = (void (**)(char *, uint64_t, uint64_t))v17;
    if (v42 != v80[0])
    {
      do
      {
        v46 = (uint64_t)v77;
        v47 = (void (*)(_QWORD *, _QWORD))sub_233AFD660();
        v48 = v45;
        v49 = v44;
        v50 = v43;
        v51 = (uint64_t)v70;
        sub_233AFBFA8(v52, (uint64_t)v70);
        v47(v80, 0);
        v53 = v69;
        v67(v69, (char *)v46, v13);
        sub_233AFD654();
        (*(void (**)(char *, uint64_t))(v79 + 8))(v53, v13);
        v54 = v51;
        v43 = v50;
        v44 = v49;
        v45 = v48;
        v55 = (uint64_t)v73;
        v56 = (uint64_t)v71;
        sub_233AFBFF0(v54, (uint64_t)v71, &qword_256112048);
        swift_getEnumCaseMultiPayload();
        v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112090);
        v58 = (void (**)(uint64_t, char *, uint64_t))v66;
        v59 = v68;
        v66[4](v68, v56 + *(int *)(v57 + 48), v44);
        v58[2](v55, v59, v44);
        swift_storeEnumTagMultiPayload();
        v45(v55);
        sub_233AFACD4(v55);
        ((void (*)(char *, uint64_t))v58[1])(v59, v44);
        v60 = *(_QWORD *)v75;
        sub_233AFD648();
      }
      while (v60 != v80[0]);
    }
    sub_233AF7324((uint64_t)v77, &qword_256112050);
    return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v65, v13);
  }
  else
  {
    v62 = (uint64_t)v73;
    *v73 = v25;
    swift_storeEnumTagMultiPayload();
    v64(v62);
    sub_233AFACD4(v62);
    result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v37, v13);
    *(_BYTE *)(v36 + 112) = 1;
  }
  return result;
}

void sub_233AF7B34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  unint64_t v7;
  char v8;
  id v9;

  v2 = *(_QWORD *)(v1 + 120);
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = *(_QWORD *)(v1 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_233AF7C1C(a1, v2);
    v6 = v5;
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v4 + 16) && (v7 = sub_233AFB824(a1), (v8 & 1) != 0))
    {
      v9 = *(id *)(*(_QWORD *)(v4 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0 && (objc_msgSend(v9, sel_isTemporaryPath) & 1) == 0)
        objc_msgSend(v9, sel_invalidate);

    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_233AF7C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v4 = *(_QWORD *)(sub_233AFD468() - 8);
  v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v6 = *(_QWORD *)(v4 + 72);
  sub_233AFC034(&qword_256112080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  v7 = 0;
  while ((sub_233AFD5B8() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7)
      return 0;
  }
  return v7;
}

uint64_t sub_233AF7CE8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_233AF7D14()
{
  uint64_t v0;

  return v0;
}

void sub_233AF7D20(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void (*v25)(char *, char *, uint64_t);
  int v26;
  uint64_t v27;
  uint64_t v28;
  Class isa;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t aBlock;
  uint64_t v64;
  uint64_t (*v65)(uint64_t);
  void *v66;
  uint64_t (*v67)();
  _QWORD *v68;

  v54 = a1;
  v55 = a2;
  v61 = sub_233AFD57C();
  v57 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_233AFD594();
  v56 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v58 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_233AFD6A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_233AFD468();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v51 - v17;
  v62 = v2;
  if (v2[14].isa)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    if ((sub_233AFD6C0() & 1) == 0)
    {
      if (qword_2561118F0 != -1)
        swift_once();
      v40 = sub_233AFD54C();
      __swift_project_value_buffer(v40, (uint64_t)qword_2561125C0);
      v62 = sub_233AFD534();
      v41 = sub_233AFD66C();
      if (os_log_type_enabled(v62, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_233AF3000, v62, v41, "Already observing directory changes when beginObservingChanges called, bailing.", v42, 2u);
        MEMORY[0x23493C62C](v42, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();

      }
      return;
    }
    swift_unknownObjectRelease();
  }
  v19 = objc_allocWithZone(MEMORY[0x24BE60C40]);
  v20 = (void *)sub_233AFD5C4();
  v21 = objc_msgSend(v19, sel_initWithTypeIdentifier_, v20);

  v22 = v21;
  v23 = objc_msgSend(v21, sel_finalizedSessionsContainerURLForCurrentApplication);
  if (v23)
  {
    v24 = v23;
    sub_233AFD45C();

    v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v25(v11, v16, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v25(v18, v11, v12);
      sub_233AFD450();
      v26 = aBlock;
      if ((_DWORD)aBlock == -1)
      {
        if (qword_2561118F0 != -1)
          swift_once();
        v47 = sub_233AFD54C();
        __swift_project_value_buffer(v47, (uint64_t)qword_2561125C0);
        v48 = sub_233AFD534();
        v49 = sub_233AFD684();
        if (os_log_type_enabled(v48, v49))
        {
          v50 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v50 = 0;
          _os_log_impl(&dword_233AF3000, v48, v49, "Unable to acquire fd for session container URL", v50, 2u);
          MEMORY[0x23493C62C](v50, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      }
      else
      {
        sub_233AFB088(0, &qword_256111FF0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256111FF8);
        v53 = v22;
        v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_233AFDF30;
        sub_233AFD69C();
        aBlock = v27;
        sub_233AFC034(&qword_256112000, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5810], MEMORY[0x24BEE5820]);
        v52 = v18;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256112008);
        sub_233AF715C(&qword_256112010, &qword_256112008, MEMORY[0x24BEE12C8]);
        sub_233AFD720();
        v28 = sub_233AFD6B4();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        isa = v62[17].isa;
        swift_getObjectType();
        v30 = (_QWORD *)swift_allocObject();
        v30[2] = v28;
        v30[3] = isa;
        v31 = v55;
        v30[4] = v54;
        v30[5] = v31;
        v67 = sub_233AFAFB0;
        v68 = v30;
        aBlock = MEMORY[0x24BDAC760];
        v64 = 1107296256;
        v65 = sub_233AF89C4;
        v66 = &block_descriptor;
        v32 = _Block_copy(&aBlock);
        swift_unknownObjectRetain();
        swift_retain();
        swift_retain();
        v33 = v58;
        sub_233AFD588();
        v34 = v60;
        sub_233AF8AC4();
        sub_233AFD6CC();
        _Block_release(v32);
        v57 = *(_QWORD *)(v57 + 8);
        v35 = v61;
        ((void (*)(char *, uint64_t))v57)(v34, v61);
        v36 = *(void (**)(char *, uint64_t))(v56 + 8);
        v37 = v59;
        v36(v33, v59);
        swift_release();
        v38 = swift_allocObject();
        *(_DWORD *)(v38 + 16) = v26;
        v67 = sub_233AFAFE4;
        v68 = (_QWORD *)v38;
        aBlock = MEMORY[0x24BDAC760];
        v64 = 1107296256;
        v65 = sub_233AF89C4;
        v66 = &block_descriptor_7;
        v39 = _Block_copy(&aBlock);
        sub_233AFD588();
        sub_233AF8AC4();
        sub_233AFD6D8();
        _Block_release(v39);
        ((void (*)(char *, uint64_t))v57)(v34, v35);
        v36(v33, v37);
        swift_release();
        sub_233AFD6F0();

        (*(void (**)(char *, uint64_t))(v13 + 8))(v52, v12);
        v62[14].isa = (Class)v28;
        swift_unknownObjectRelease();
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_233AF7324((uint64_t)v11, &qword_256111988);
  if (qword_2561118F0 != -1)
    swift_once();
  v43 = sub_233AFD54C();
  __swift_project_value_buffer(v43, (uint64_t)qword_2561125C0);
  v44 = sub_233AFD534();
  v45 = sub_233AFD684();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_233AF3000, v44, v45, "beginObservingChanges: Unable to build sessions container URL for current application.", v46, 2u);
    MEMORY[0x23493C62C](v46, -1, -1);
  }

}

uint64_t sub_233AF8574@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  if (a1)
  {
    result = sub_233AFD558();
  }
  else
  {
    if (qword_2561118F0 != -1)
      swift_once();
    v4 = sub_233AFD54C();
    __swift_project_value_buffer(v4, (uint64_t)qword_2561125C0);
    v5 = sub_233AFD534();
    v6 = sub_233AFD684();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_233AF3000, v5, v6, "unable to get fs path for sessionContainerURL", v7, 2u);
      MEMORY[0x23493C62C](v7, -1, -1);
    }

    result = 0xFFFFFFFFLL;
  }
  *a2 = result;
  return result;
}

uint64_t sub_233AF866C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112030);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_233AFD6A8();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5810];
  v12 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v31 - v16;
  swift_getObjectType();
  sub_233AFD708();
  sub_233AFD69C();
  sub_233AFC034(&qword_256112000, v11, MEMORY[0x24BEE5820]);
  v18 = sub_233AFD714();
  v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, v10);
  if ((v18 & 1) != 0)
  {
    if (qword_2561118F0 != -1)
      swift_once();
    v20 = sub_233AFD54C();
    __swift_project_value_buffer(v20, (uint64_t)qword_2561125C0);
    v21 = sub_233AFD534();
    v22 = sub_233AFD690();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_233AF3000, v21, v22, "Write event received, refreshing session URLs", v23, 2u);
      MEMORY[0x23493C62C](v23, -1, -1);
    }

    v24 = sub_233AFD618();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = a2;
    v25[5] = a3;
    v25[6] = a4;
    swift_retain();
    swift_retain();
    sub_233AF6B5C((uint64_t)v9, (uint64_t)&unk_256112040, (uint64_t)v25);
    swift_release();
  }
  else
  {
    if (qword_2561118F0 != -1)
      swift_once();
    v26 = sub_233AFD54C();
    __swift_project_value_buffer(v26, (uint64_t)qword_2561125C0);
    v27 = sub_233AFD534();
    v28 = sub_233AFD678();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_233AF3000, v27, v28, "Event received, was not a write (or self == nil), bailing", v29, 2u);
      MEMORY[0x23493C62C](v29, -1, -1);
    }

  }
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, v10);
}

uint64_t sub_233AF8974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_233AF8990()
{
  uint64_t v0;

  sub_233AF73A8(*(void (**)(_QWORD))(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF89C4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_233AF89F0(int a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_2561118F0 != -1)
    swift_once();
  v2 = sub_233AFD54C();
  __swift_project_value_buffer(v2, (uint64_t)qword_2561125C0);
  v3 = sub_233AFD534();
  v4 = sub_233AFD690();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_233AF3000, v3, v4, "DispatchSource cancelled, closing file handle", v5, 2u);
    MEMORY[0x23493C62C](v5, -1, -1);
  }

  return close(a1);
}

uint64_t sub_233AF8AC4()
{
  sub_233AFD57C();
  sub_233AFC034(&qword_256112018, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256112020);
  sub_233AF715C(&qword_256112028, &qword_256112020, MEMORY[0x24BEE12C8]);
  return sub_233AFD720();
}

uint64_t sub_233AF8B78()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_233AF8BB4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for LockedCameraCaptureManager(0);
  v0 = swift_allocObject();
  result = sub_233AF8DD4();
  qword_256111B30 = v0;
  return result;
}

uint64_t static LockedCameraCaptureManager.shared.getter()
{
  if (qword_256111900 != -1)
    swift_once();
  return swift_retain();
}

uint64_t LockedCameraCaptureManager.sessionContentURLs.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v12;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2561118F8 != -1)
    swift_once();
  v5 = qword_2561125D8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)qword_2561125D8 + 16);
  v6 = (os_unfair_lock_s *)(qword_2561125D8
                          + ((*(unsigned int *)(*(_QWORD *)qword_2561125D8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_233AF5F20(v5, (uint64_t)v4);
  os_unfair_lock_unlock(v6);
  v7 = sub_233AFD468();
  LODWORD(v5) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v4, 1, v7);
  sub_233AF7324((uint64_t)v4, &qword_256111988);
  if ((_DWORD)v5 != 1)
    return MEMORY[0x24BEE4AF8];
  v8 = *(_QWORD *)(v1 + 32);
  v9 = (os_unfair_lock_s *)(v8 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  v10 = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v9);
  return v10;
}

uint64_t LockedCameraCaptureManager.sessionContentUpdates.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_233AF8DD4()
{
  _QWORD *v0;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  _QWORD *v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v58 = sub_233AFD468();
  v1 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v53 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v3);
  v61 = (unint64_t)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561120D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B48);
  v10 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  v60 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B40);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver) = 0;
  *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver) = 0;
  type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE6A10], v5);
  sub_233AFD624();
  v17 = v60;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v54 = v16;
  v55 = v14;
  v18 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v19 = v0;
  v56 = v13;
  v18((char *)v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream, v16, v13);
  v20 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v57 = v12;
  v21 = v12;
  v22 = v59;
  v20((char *)v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesContinuation, v21, v59);
  if (qword_2561118F8 != -1)
    swift_once();
  v23 = qword_2561125D8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)qword_2561125D8 + 16);
  v24 = (os_unfair_lock_s *)(qword_2561125D8
                           + ((*(unsigned int *)(*(_QWORD *)qword_2561125D8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v24);
  v25 = v61;
  sub_233AF5F20(v23, v61);
  os_unfair_lock_unlock(v24);
  v26 = v58;
  LODWORD(v23) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v25, 1, v58);
  sub_233AF7324(v25, &qword_256111988);
  if ((_DWORD)v23 != 1)
  {
    type metadata accessor for CaptureManagerURLs();
    v39 = swift_allocObject();
    swift_defaultActor_initialize();
    v40 = MEMORY[0x24BEE4B00];
    *(_BYTE *)(v39 + 112) = 0;
    v30 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v39 + 120) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v39 + 128) = v40;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v39 + 128) = v40;
LABEL_25:
    swift_bridgeObjectRelease();
    v19[2] = v39;
    type metadata accessor for CaptureManagerFSObserving();
    v47 = (_QWORD *)swift_allocObject();
    swift_retain();
    swift_defaultActor_initialize();
    v47[14] = 0;
    v47[15] = 0;
    v47[16] = 0;
    v47[17] = v39;
    v19[3] = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2561120E0);
    v48 = swift_allocObject();
    *(_DWORD *)(v48 + 24) = 0;
    *(_QWORD *)(v48 + 16) = v30;
    v19[4] = v48;
    sub_233AF970C((uint64_t)&unk_2504D9090, (uint64_t)&unk_256112108, (uint64_t)&unk_2504D90B8, (uint64_t)&unk_256112118);
    sub_233AF9454();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v57, v22);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
    return (uint64_t)v19;
  }
  v52 = 0;
  v27 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_233AFB088(0, &qword_256112060);
  v28 = sub_233AFD5DC();

  v61 = v28;
  if (v28 >> 62)
  {
    swift_bridgeObjectRetain();
    v29 = sub_233AFD774();
    swift_bridgeObjectRelease();
  }
  else
  {
    v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v30 = MEMORY[0x24BEE4AF8];
  v31 = v53;
  if (v29)
  {
    v62 = MEMORY[0x24BEE4AF8];
    sub_233AFBF8C(0, v29 & ~(v29 >> 63), 0);
    if (v29 < 0)
    {
      __break(1u);
      goto LABEL_28;
    }
    v51 = v19;
    v32 = 0;
    v30 = v62;
    v33 = v61 & 0xC000000000000001;
    do
    {
      if (v33)
        v34 = (id)MEMORY[0x23493C23C](v32, v61);
      else
        v34 = *(id *)(v61 + 8 * v32 + 32);
      v35 = v34;
      v36 = objc_msgSend(v34, sel_url);
      sub_233AFD45C();

      v62 = v30;
      v38 = *(_QWORD *)(v30 + 16);
      v37 = *(_QWORD *)(v30 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_233AFBF8C(v37 > 1, v38 + 1, 1);
        v30 = v62;
      }
      ++v32;
      *(_QWORD *)(v30 + 16) = v38 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(v30+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(_QWORD *)(v1 + 72) * v38, v31, v26);
    }
    while (v29 != v32);
    v19 = v51;
    v22 = v59;
  }
  if (v29 >= *(_QWORD *)(v30 + 16))
    v41 = *(_QWORD *)(v30 + 16);
  else
    v41 = v29;
  v42 = MEMORY[0x24BEE4B00];
  if (v41)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256112068);
    v43 = sub_233AFD798();
  }
  else
  {
    v43 = MEMORY[0x24BEE4B00];
  }
  v44 = v52;
  v45 = v61;
  v62 = v43;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_233AFB2C8(v30, v45, 1, &v62);
  if (!v44)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = v62;
    type metadata accessor for CaptureManagerURLs();
    v39 = swift_allocObject();
    swift_bridgeObjectRetain();
    swift_defaultActor_initialize();
    *(_BYTE *)(v39 + 112) = 1;
    *(_QWORD *)(v39 + 120) = v30;
    *(_QWORD *)(v39 + 128) = v42;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v39 + 128) = v46;
    goto LABEL_25;
  }
LABEL_28:
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_233AF9430()
{
  return sub_233AF970C((uint64_t)&unk_2504D9090, (uint64_t)&unk_256112108, (uint64_t)&unk_2504D90B8, (uint64_t)&unk_256112118);
}

uint64_t sub_233AF9454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  _BYTE v14[16];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112030);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2561118F8 != -1)
    swift_once();
  v8 = qword_2561125D8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)qword_2561125D8 + 16);
  v9 = (os_unfair_lock_s *)(qword_2561125D8
                          + ((*(unsigned int *)(*(_QWORD *)qword_2561125D8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v9);
  sub_233AF5F20(v8, (uint64_t)v7);
  os_unfair_lock_unlock(v9);
  v10 = sub_233AFD468();
  LODWORD(v8) = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v7, 1, v10);
  result = sub_233AF7324((uint64_t)v7, &qword_256111988);
  if ((_DWORD)v8 == 1)
  {
    v12 = sub_233AFD618();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v1;
    swift_retain();
    sub_233AF6B5C((uint64_t)v4, (uint64_t)&unk_2561120F0, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t LockedCameraCaptureManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_233AF970C((uint64_t)&unk_2504D9018, (uint64_t)&unk_2561120C0, (uint64_t)&unk_2504D9040, (uint64_t)&unk_2561120D0);
  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_233AF96E8()
{
  return sub_233AF970C((uint64_t)&unk_2504D9018, (uint64_t)&unk_2561120C0, (uint64_t)&unk_2504D9040, (uint64_t)&unk_2561120D0);
}

uint64_t sub_233AF970C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _BYTE v24[16];

  v7 = v4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112030);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2561118F8 != -1)
    swift_once();
  v14 = qword_2561125D8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)qword_2561125D8 + 16);
  v15 = (os_unfair_lock_s *)(qword_2561125D8
                           + ((*(unsigned int *)(*(_QWORD *)qword_2561125D8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v15);
  sub_233AF5F20(v14, (uint64_t)v13);
  os_unfair_lock_unlock(v15);
  v16 = sub_233AFD468();
  LODWORD(v14) = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v13, 1, v16);
  result = sub_233AF7324((uint64_t)v13, &qword_256111988);
  if ((_DWORD)v14 == 1)
  {
    v18 = sub_233AFD618();
    v19 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
    v19(v10, 1, 1, v18);
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = v7;
    swift_retain();
    sub_233AF6B5C((uint64_t)v10, a2, (uint64_t)v20);
    swift_release();
    v19(v10, 1, 1, v18);
    sub_233AFD600();
    swift_retain();
    v21 = sub_233AFD5F4();
    v22 = (_QWORD *)swift_allocObject();
    v23 = MEMORY[0x24BEE6930];
    v22[2] = v21;
    v22[3] = v23;
    v22[4] = v7;
    sub_233AF6B5C((uint64_t)v10, a4, (uint64_t)v22);
    return swift_release();
  }
  return result;
}

uint64_t LockedCameraCaptureManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_233AF970C((uint64_t)&unk_2504D9018, (uint64_t)&unk_2561120C0, (uint64_t)&unk_2504D9040, (uint64_t)&unk_2561120D0);
  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111B48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_233AF9A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_233AF9A44()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_233AF9A88()
{
  uint64_t v0;

  sub_233AFC6FC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF9AC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t locked;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int EnumCaseMultiPayload;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  unint64_t *p_os_unfair_lock_opaque;
  os_unfair_lock_s *v23;
  uint64_t v24;
  uint64_t v25;
  os_unfair_lock_s *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v3 = sub_233AFD468();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)&v29 - v6;
  locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  v8 = MEMORY[0x24BDAC7A8](locked);
  v10 = (uint64_t *)((char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561120F8);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233AFCE6C(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256111B48);
  sub_233AFD630();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_233AFCE6C(a1, (uint64_t)v10);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v19 = v32;
      v18 = v33;
      v20 = (uint64_t)v30;
      (*(void (**)(char *, uint64_t *, uint64_t))(v32 + 32))(v30, v10, v33);
      v21 = *(os_unfair_lock_s **)(v1 + 32);
      p_os_unfair_lock_opaque = (unint64_t *)&v21[4]._os_unfair_lock_opaque;
      v23 = v21 + 6;
      os_unfair_lock_lock(v21 + 6);
      sub_233AF9D4C(p_os_unfair_lock_opaque, v20);
    }
    else
    {
      v20 = (uint64_t)v31;
      v19 = v32;
      v18 = v33;
      (*(void (**)(char *, uint64_t *, uint64_t))(v32 + 32))(v31, v10, v33);
      v27 = *(os_unfair_lock_s **)(v1 + 32);
      v28 = (uint64_t)&v27[4];
      v23 = v27 + 6;
      os_unfair_lock_lock(v27 + 6);
      sub_233AF9E6C(v28, v20);
    }
    os_unfair_lock_unlock(v23);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
  }
  else
  {
    v24 = *v10;
    v25 = *(_QWORD *)(v1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v25 + 24));
    swift_bridgeObjectRelease();
    *(_QWORD *)(v25 + 16) = v24;
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 24));
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_233AF9D4C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = sub_233AFD468();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v8 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v8 = sub_233AFB0C0(0, *(_QWORD *)(v8 + 16) + 1, 1, v8);
  v10 = *(_QWORD *)(v8 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  if (v10 >= v9 >> 1)
    v8 = sub_233AFB0C0(v9 > 1, v10 + 1, 1, v8);
  *(_QWORD *)(v8 + 16) = v10 + 1;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v10, v7, v4);
  *a1 = v8;
  return result;
}

uint64_t sub_233AF9E6C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int64_t v4;
  _QWORD v5[4];

  v5[2] = a2;
  result = sub_233AFC390((uint64_t (*)(unint64_t))sub_233AFCFC8, (uint64_t)v5);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v4 >= result)
    return sub_233AFCFF4(result, v4);
  __break(1u);
  return result;
}

uint64_t sub_233AF9EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_233AF9EDC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_233AF9F20()
{
  uint64_t v0;

  sub_233AF7D20((uint64_t)sub_233AFD3D8, *(_QWORD *)(v0 + 16));
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AF9F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 64) = a4;
  sub_233AFD600();
  *(_QWORD *)(v4 + 72) = sub_233AFD5F4();
  sub_233AFD5E8();
  return swift_task_switch();
}

uint64_t sub_233AF9FD0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v1 = v0[8];
  swift_release();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_defaultCenter);
  v4 = swift_allocObject();
  swift_weakInit();
  v0[2] = MEMORY[0x24BDAC760];
  v5 = *MEMORY[0x24BEBDF98];
  v0[6] = sub_233AFD294;
  v0[7] = v4;
  v0[3] = 1107296256;
  v0[4] = sub_233AFA31C;
  v0[5] = &block_descriptor_37;
  v6 = _Block_copy(v0 + 2);
  swift_release();
  v7 = objc_msgSend(v3, sel_addObserverForName_object_queue_usingBlock_, v5, 0, 0, v6);
  _Block_release(v6);

  v8 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver;
  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver);
  if (v9)
  {
    swift_unknownObjectRetain();
    v10 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v10, sel_removeObserver_, v9);

    swift_unknownObjectRelease();
  }
  v11 = v0[8];
  *(_QWORD *)(v1 + v8) = v7;
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v2, sel_defaultCenter);
  v13 = *MEMORY[0x24BEBE008];
  v14 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_233AFD2BC;
  v0[7] = v14;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_233AFA31C;
  v0[5] = &block_descriptor_41;
  v15 = _Block_copy(v0 + 2);
  swift_release();
  v16 = objc_msgSend(v12, sel_addObserverForName_object_queue_usingBlock_, v13, 0, 0, v15);
  _Block_release(v15);

  v17 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver;
  v18 = *(_QWORD *)(v11 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver);
  if (v18)
  {
    swift_unknownObjectRetain();
    v19 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v19, sel_removeObserver_, v18);

    swift_unknownObjectRelease();
  }
  *(_QWORD *)(v11 + v17) = v16;
  swift_unknownObjectRelease();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_233AFA290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_233AFA2A8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  return swift_task_switch();
}

uint64_t sub_233AFA2C4()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_233AFD6FC();
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AFA31C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_233AFD408();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_233AFD3FC();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_233AFA3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112030);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = result;
    v10 = sub_233AFD618();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    sub_233AF6B5C((uint64_t)v7, a4, (uint64_t)v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_233AFA4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_233AFA4BC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  return swift_task_switch();
}

uint64_t sub_233AFA4D8()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_233AFD6F0();
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AFA530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_233AFA548()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24);
  return swift_task_switch();
}

uint64_t sub_233AFA564()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_233AFD6E4();
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233AFA5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_233AFD600();
  *(_QWORD *)(v4 + 24) = sub_233AFD5F4();
  sub_233AFD5E8();
  return swift_task_switch();
}

uint64_t sub_233AFA628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  v2 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver);
  if (v3)
  {
    v4 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v5 = objc_msgSend(v4, sel_defaultCenter);
    objc_msgSend(v5, sel_removeObserver_, v3);

    swift_unknownObjectRelease();
  }
  v6 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + v2) = 0;
  swift_unknownObjectRelease();
  v7 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver;
  v8 = *(_QWORD *)(v6 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver);
  if (v8)
  {
    v9 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v10 = objc_msgSend(v9, sel_defaultCenter);
    objc_msgSend(v10, sel_removeObserver_, v8);

    swift_unknownObjectRelease();
  }
  *(_QWORD *)(v6 + v7) = 0;
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LockedCameraCaptureManager.invalidateSessionContent(at:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_233AFA768()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
  return swift_task_switch();
}

uint64_t sub_233AFA784()
{
  uint64_t v0;

  sub_233AF7B34(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall LockedCameraCaptureManager.applicationDidCompleteTransition()()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v0, sel_applicationDidCompleteTransition);

}

uint64_t type metadata accessor for CaptureManagerURLs()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CaptureManagerFSObserving()
{
  return objc_opt_self();
}

uint64_t sub_233AFA848()
{
  return type metadata accessor for LockedCameraCaptureManager(0);
}

uint64_t type metadata accessor for LockedCameraCaptureManager(uint64_t a1)
{
  return sub_233AFA94C(a1, (uint64_t *)&unk_256111E78);
}

void sub_233AFA864()
{
  unint64_t v0;
  unint64_t v1;

  sub_233AFA980(319, &qword_256111E88, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_233AFA980(319, qword_256111E90, MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LockedCameraCaptureManager()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1)
{
  return sub_233AFA94C(a1, qword_256111FB0);
}

uint64_t sub_233AFA94C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_233AFA980(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t locked;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(255);
    v7 = a3(a1, locked);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for LockedCameraCaptureManager.SessionContentUpdate(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_233AFD468();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v3 = sub_233AFD468();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!(_DWORD)result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for LockedCameraCaptureManager.SessionContentUpdate(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v5 = sub_233AFD468();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for LockedCameraCaptureManager.SessionContentUpdate(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_233AFACD4((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v5 = sub_233AFD468();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_233AFACD4(uint64_t a1)
{
  uint64_t locked;

  locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(locked - 8) + 8))(a1, locked);
  return a1;
}

void *initializeWithTake for LockedCameraCaptureManager.SessionContentUpdate(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v7 = sub_233AFD468();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LockedCameraCaptureManager.SessionContentUpdate(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_233AFACD4((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_233AFD468();
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

uint64_t getEnumTagSinglePayload for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_233AFAECC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_233AFAEDC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233AFD468();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_233AFAF50()
{
  return sub_233AF715C(&qword_256111FE8, &qword_256111B40, MEMORY[0x24BEE6AA8]);
}

uint64_t sub_233AFAF7C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233AFAFB0()
{
  uint64_t *v0;

  return sub_233AF866C(v0[2], v0[3], v0[4], v0[5]);
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

uint64_t sub_233AFAFD4()
{
  return swift_deallocObject();
}

uint64_t sub_233AFAFE4()
{
  uint64_t v0;

  return sub_233AF89F0(*(_DWORD *)(v0 + 16));
}

uint64_t sub_233AFAFEC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233AFB020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_233AF6B14;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return swift_task_switch();
}

uint64_t sub_233AFB088(uint64_t a1, unint64_t *a2)
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

uint64_t sub_233AFB0C0(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2561120B0);
  v10 = *(_QWORD *)(sub_233AFD468() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_233AFD75C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_233AFD468() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_233AFCEB0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void sub_233AFB2C8(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  void (*v47)(char *, uint64_t, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  char *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;

  v58 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256111988);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_233AFD468();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v59 = (uint64_t)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)v46 - v14;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112098);
  MEMORY[0x24BDAC7A8](v54);
  v53 = (char *)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v52 = v16;
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
LABEL_30:
    sub_233AF7324((uint64_t)v9, &qword_256111988);
LABEL_31:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return;
  }
  v17 = 0;
  v18 = a2 & 0xFFFFFFFFFFFFFF8;
  v56 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0)
    v18 = a2;
  v46[1] = v18;
  v50 = a1;
  v51 = a2 & 0xC000000000000001;
  v48 = v9;
  v49 = a2;
  while (1)
  {
    if (v17 >= *(_QWORD *)(a1 + 16))
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      sub_233AFD7B0();
      __break(1u);
      goto LABEL_38;
    }
    v19 = *(_QWORD *)(v11 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)) + v19 * v17, v10);
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v20(v9, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
      goto LABEL_30;
    v55 = a3;
    v21 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v21(v57, v9, v10);
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v44 = sub_233AFD774();
      swift_bridgeObjectRelease();
      if (v17 == v44)
      {
LABEL_29:
        (*(void (**)(char *, uint64_t))(v11 + 8))(v57, v10);
        goto LABEL_31;
      }
    }
    else if (v17 == *(_QWORD *)(v56 + 16))
    {
      goto LABEL_29;
    }
    v47 = v20;
    if (v51)
    {
      v22 = (id)MEMORY[0x23493C23C](v17, a2);
    }
    else
    {
      if (v17 >= *(_QWORD *)(v56 + 16))
        goto LABEL_35;
      v22 = *(id *)(a2 + 8 * v17 + 32);
    }
    v23 = v22;
    v24 = v53;
    v25 = *(int *)(v54 + 48);
    v21(v53, v57, v10);
    v26 = v10;
    v27 = v23;
    *(_QWORD *)&v24[v25] = v23;
    v28 = v59;
    v29 = v26;
    ((void (*)(uint64_t, char *))v21)(v59, v24);
    v30 = (_QWORD *)*v58;
    v32 = sub_233AFB824(v28);
    v33 = v30[2];
    v34 = (v31 & 1) == 0;
    v35 = v33 + v34;
    if (__OFADD__(v33, v34))
      goto LABEL_34;
    v36 = v31;
    if (v30[3] < v35)
      break;
    if ((v55 & 1) != 0)
    {
      if ((v31 & 1) != 0)
        goto LABEL_26;
    }
    else
    {
      sub_233AFB890();
      if ((v36 & 1) != 0)
        goto LABEL_26;
    }
LABEL_19:
    v39 = v59;
    v40 = (_QWORD *)*v58;
    *(_QWORD *)(*v58 + 8 * (v32 >> 6) + 64) |= 1 << v32;
    v21((char *)(v40[6] + v32 * v19), (char *)v39, v29);
    *(_QWORD *)(v40[7] + 8 * v32) = v27;
    v41 = v40[2];
    v42 = __OFADD__(v41, 1);
    v43 = v41 + 1;
    if (v42)
      goto LABEL_36;
    ++v17;
    v40[2] = v43;
    a3 = 1;
    a2 = v49;
    a1 = v50;
    v9 = v48;
    v10 = v29;
    if (v52 == v17)
    {
      v47(v48, 1, 1, v29);
      goto LABEL_30;
    }
  }
  sub_233AFBAB8(v35, v55 & 1);
  v37 = sub_233AFB824(v59);
  if ((v36 & 1) != (v38 & 1))
    goto LABEL_37;
  v32 = v37;
  if ((v36 & 1) == 0)
    goto LABEL_19;
LABEL_26:
  v45 = (void *)swift_allocError();
  swift_willThrow();
  v62 = v45;
  MEMORY[0x23493C53C](v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2561120A0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v59, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_38:
  v60 = 0;
  v61 = 0xE000000000000000;
  sub_233AFD72C();
  sub_233AFD5D0();
  sub_233AFD744();
  sub_233AFD5D0();
  sub_233AFD768();
  __break(1u);
}

unint64_t sub_233AFB824(uint64_t a1)
{
  uint64_t v2;

  sub_233AFD468();
  sub_233AFC034(&qword_2561120A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  v2 = sub_233AFD5A0();
  return sub_233AFBE4C(a1, v2);
}

id sub_233AFB890()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_233AFD468();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256112068);
  v24 = v0;
  v5 = *v0;
  v6 = sub_233AFD780();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_233AFBAB8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_233AFD468();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256112068);
  v42 = a2;
  v10 = sub_233AFD78C();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_233AFC034(&qword_2561120A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    result = sub_233AFD5A0();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

unint64_t sub_233AFBE4C(uint64_t a1, uint64_t a2)
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
  v5 = sub_233AFD468();
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
      sub_233AFC034(&qword_256112080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
      v14 = sub_233AFD5B8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_233AFBF8C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_233AFC074(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_233AFBFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233AFBFF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_233AFC034(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23493C5CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_233AFC074(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2561120B0);
  v10 = *(_QWORD *)(sub_233AFD468() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_233AFD468() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_233AFD7A4();
  __break(1u);
  return result;
}

uint64_t sub_233AFC25C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233AFD3E0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_233AFC2C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_233AFD3E0;
  return sub_233AFA5BC(a1, v4, v5, v6);
}

uint64_t sub_233AFC330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233AFD3E0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_233AFC390(uint64_t (*a1)(unint64_t), uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *);
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t (*v35)(unint64_t, char *, uint64_t);
  uint64_t v36;
  BOOL v37;
  unint64_t v38;
  _QWORD v39[2];
  uint64_t (*v40)(unint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;

  v4 = v2;
  v7 = sub_233AFD468();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v42 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)v39 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v46 = v4;
  v14 = *v4;
  v15 = *(_QWORD *)(*v4 + 16);
  if (!v15)
    return 0;
  v44 = (char *)v39 - v13;
  v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v48 = *(_QWORD *)(v8 + 72);
  swift_bridgeObjectRetain();
  v17 = 0;
  v39[0] = v16;
  while (1)
  {
    v18 = a1(v14 + v16);
    if (v3)
    {
      swift_bridgeObjectRelease();
      return v17;
    }
    if ((v18 & 1) != 0)
      break;
    ++v17;
    v16 += v48;
    if (v15 == v17)
    {
      swift_bridgeObjectRelease();
      return *(_QWORD *)(v14 + 16);
    }
  }
  result = swift_bridgeObjectRelease();
  if (!__OFADD__(v17, 1))
  {
    v20 = *(_QWORD *)(v14 + 16);
    if (v17 + 1 == v20)
      return v17;
    v21 = v48 + v16;
    v22 = v17 + 1;
    v45 = v7;
    v39[1] = a2;
    v40 = a1;
    v43 = v8;
    while (v22 < v20)
    {
      v47 = v22;
      v23 = v21;
      v24 = v14 + v21;
      v25 = (uint64_t (*)(char *))a1;
      v26 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v27 = v44;
      v26(v44, v24, v7);
      LOBYTE(v25) = v25(v27);
      result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v27, v7);
      if ((v25 & 1) != 0)
      {
        a1 = v40;
        v28 = v23;
        v29 = v47;
      }
      else
      {
        v29 = v47;
        v28 = v23;
        if (v47 != v17)
        {
          if ((v17 & 0x8000000000000000) != 0)
            goto LABEL_32;
          v30 = *v46;
          v31 = *(_QWORD *)(*v46 + 16);
          if (v17 >= v31)
            goto LABEL_33;
          v32 = v17 * v48;
          v33 = v45;
          result = ((uint64_t (*)(char *, unint64_t, uint64_t))v26)(v41, v30 + v39[0] + v17 * v48, v45);
          if (v47 >= v31)
            goto LABEL_34;
          v26(v42, v30 + v23, v33);
          result = swift_isUniquelyReferenced_nonNull_native();
          *v46 = v30;
          if ((result & 1) == 0)
          {
            result = sub_233AFC6E8(v30);
            v30 = result;
            *v46 = result;
          }
          if (v17 >= *(_QWORD *)(v30 + 16))
            goto LABEL_35;
          v34 = v30 + v39[0] + v32;
          v35 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v43 + 40);
          v36 = v45;
          result = v35(v34, v42, v45);
          if (v47 >= *(_QWORD *)(*v46 + 16))
            goto LABEL_36;
          result = v35(*v46 + v23, v41, v36);
          v29 = v47;
        }
        v37 = __OFADD__(v17++, 1);
        a1 = v40;
        if (v37)
          goto LABEL_31;
      }
      v38 = v29 + 1;
      v7 = v45;
      v8 = v43;
      if (__OFADD__(v29, 1))
        goto LABEL_30;
      v14 = *v46;
      v20 = *(_QWORD *)(*v46 + 16);
      v22 = v29 + 1;
      v21 = v28 + v48;
      if (v38 == v20)
        return v17;
    }
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
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_233AFC6E8(unint64_t a1)
{
  return sub_233AFB0C0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_233AFC6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t locked;
  uint64_t v9;
  uint64_t *v10;
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
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
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
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t *v52;
  void (*v53)(_QWORD *, _QWORD);
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t result;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[7];

  v78 = a2;
  v71 = a1;
  v2 = sub_233AFD468();
  v80 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v64 - v6;
  locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  MEMORY[0x24BDAC7A8](locked);
  v10 = (uint64_t *)((char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112048);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v66 = (char *)&v64 - v15;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112050);
  v16 = MEMORY[0x24BDAC7A8](v70);
  v69 = (uint64_t *)((char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  v65 = (uint64_t)&v64 - v18;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256112058);
  v79 = *(_QWORD *)(v72 - 8);
  v19 = MEMORY[0x24BDAC7A8](v72);
  v73 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v68 = (char *)&v64 - v21;
  v22 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_233AFB088(0, &qword_256112060);
  v23 = sub_233AFD5DC();

  v67 = v7;
  v76 = locked;
  v77 = v10;
  v74 = v14;
  v75 = v11;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_233AFD774();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v25 = MEMORY[0x24BEE4AF8];
  if (v24)
  {
    v81[0] = MEMORY[0x24BEE4AF8];
    sub_233AFBF8C(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      swift_release();
      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v26 = 0;
    v25 = v81[0];
    v27 = v23 & 0xC000000000000001;
    v28 = v2;
    v29 = v23;
    do
    {
      if (v27)
        v30 = (id)MEMORY[0x23493C23C](v26, v23);
      else
        v30 = *(id *)(v23 + 8 * v26 + 32);
      v31 = v30;
      v32 = objc_msgSend(v30, sel_url);
      sub_233AFD45C();

      v81[0] = v25;
      v34 = *(_QWORD *)(v25 + 16);
      v33 = *(_QWORD *)(v25 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_233AFBF8C(v33 > 1, v34 + 1, 1);
        v25 = v81[0];
      }
      ++v26;
      *(_QWORD *)(v25 + 16) = v34 + 1;
      v2 = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v80 + 32))(v25+ ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80))+ *(_QWORD *)(v80 + 72) * v34, v5, v28);
      v23 = v29;
    }
    while (v24 != v26);
  }
  if (v24 >= *(_QWORD *)(v25 + 16))
    v35 = *(_QWORD *)(v25 + 16);
  else
    v35 = v24;
  if (v35)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256112068);
    v36 = sub_233AFD798();
  }
  else
  {
    v36 = MEMORY[0x24BEE4B00];
  }
  v37 = v72;
  v38 = v79;
  v39 = v68;
  v81[0] = v36;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_233AFB2C8(v25, v23, 1, v81);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v40 = v81[0];
  v81[0] = v25;
  v41 = v71;
  v81[4] = *(_QWORD *)(v71 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256112070);
  sub_233AF715C(&qword_256112078, &qword_256112070, MEMORY[0x24BEE12B0]);
  sub_233AFC034(&qword_256112080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  sub_233AFD5AC();
  *(_QWORD *)(v41 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v41 + 128) = v40;
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v41 + 112) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v42 = (uint64_t)v69;
    v71 = *(_QWORD *)(v38 + 16);
    v72 = v2;
    ((void (*)(uint64_t *, char *, uint64_t))v71)(v69, v39, v37);
    v43 = sub_233AF715C(&qword_256112088, &qword_256112058, MEMORY[0x24BEE3150]);
    sub_233AFD63C();
    v44 = v70;
    *(_QWORD *)(v42 + *(int *)(v70 + 36)) = v81[0];
    v45 = v65;
    sub_233AFBFF0(v42, v65, &qword_256112050);
    v69 = (uint64_t *)(v45 + *(int *)(v44 + 36));
    v70 = v43;
    v46 = *v69;
    sub_233AFD648();
    v47 = v46 == v81[0];
    v48 = v38;
    v49 = (uint64_t)v66;
    v50 = v67;
    v51 = (uint64_t)v74;
    if (!v47)
    {
      v52 = v69;
      do
      {
        v53 = (void (*)(_QWORD *, _QWORD))sub_233AFD660();
        sub_233AFBFA8(v54, v49);
        v53(v81, 0);
        v55 = v73;
        ((void (*)(char *, uint64_t, uint64_t))v71)(v73, v45, v37);
        sub_233AFD654();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v55, v37);
        sub_233AFBFF0(v49, v51, &qword_256112048);
        swift_getEnumCaseMultiPayload();
        v56 = v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256112090) + 48);
        v57 = v80;
        v58 = v49;
        v59 = v72;
        (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v50, v56, v72);
        v60 = (uint64_t)v77;
        (*(void (**)(uint64_t *, char *, uint64_t))(v57 + 16))(v77, v50, v59);
        swift_storeEnumTagMultiPayload();
        sub_233AF9AC4(v60);
        sub_233AFACD4(v60);
        (*(void (**)(char *, uint64_t))(v57 + 8))(v50, v59);
        v61 = *v52;
        sub_233AFD648();
        v47 = v61 == v81[0];
        v48 = v79;
        v49 = v58;
        v51 = (uint64_t)v74;
      }
      while (!v47);
    }
    sub_233AF7324(v45, &qword_256112050);
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v68, v37);
  }
  else
  {
    v63 = (uint64_t)v77;
    *v77 = v25;
    swift_storeEnumTagMultiPayload();
    sub_233AF9AC4(v63);
    sub_233AFACD4(v63);
    result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v39, v37);
    *(_BYTE *)(v41 + 112) = 1;
  }
  return result;
}

uint64_t sub_233AFCE6C(uint64_t a1, uint64_t a2)
{
  uint64_t locked;

  locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(locked - 8) + 16))(a2, a1, locked);
  return a2;
}

uint64_t sub_233AFCEB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_233AFD468() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_233AFD7A4();
  __break(1u);
  return result;
}

uint64_t sub_233AFCFC8(uint64_t a1)
{
  uint64_t v1;

  return MEMORY[0x23493BF48](a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_233AFCFF4(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_233AFB0C0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(sub_233AFD468() - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * a1;
  v16 = v13 + v14 * a1;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_25;
  v18 = *(_QWORD *)(v4 + 16);
  v19 = v18 - a2;
  if (__OFSUB__(v18, a2))
    goto LABEL_31;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v21 = *(_QWORD *)(v4 + 16);
    v22 = __OFADD__(v21, v8);
    v23 = v21 - v7;
    if (!v22)
    {
      *(_QWORD *)(v4 + 16) = v23;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  result = sub_233AFD7A4();
  __break(1u);
  return result;
}

uint64_t sub_233AFD1A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233AFD3E0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_233AFD204(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_233AFD3E0;
  return sub_233AF9F64(a1, v4, v5, v6);
}

uint64_t sub_233AFD270()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_233AFD294(uint64_t a1)
{
  uint64_t v1;

  return sub_233AFA3C0(a1, v1, (uint64_t)&unk_2504D9180, (uint64_t)&unk_256112138);
}

uint64_t sub_233AFD2BC(uint64_t a1)
{
  uint64_t v1;

  return sub_233AFA3C0(a1, v1, (uint64_t)&unk_2504D9158, (uint64_t)&unk_256112128);
}

uint64_t sub_233AFD2E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233AFD3E0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233AFD378()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_233AFD3E0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_233AFD3FC()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_233AFD408()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_233AFD414()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_233AFD420()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_233AFD42C()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_233AFD438()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_233AFD444()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_233AFD450()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_233AFD45C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_233AFD468()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_233AFD474()
{
  return MEMORY[0x24BDC7A40]();
}

uint64_t sub_233AFD480()
{
  return MEMORY[0x24BDC7A88]();
}

uint64_t sub_233AFD48C()
{
  return MEMORY[0x24BDC7A90]();
}

uint64_t sub_233AFD498()
{
  return MEMORY[0x24BDC7AC0]();
}

uint64_t sub_233AFD4A4()
{
  return MEMORY[0x24BDC7AC8]();
}

uint64_t sub_233AFD4B0()
{
  return MEMORY[0x24BDC7AD0]();
}

uint64_t sub_233AFD4BC()
{
  return MEMORY[0x24BE852A8]();
}

uint64_t sub_233AFD4C8()
{
  return MEMORY[0x24BE852B0]();
}

uint64_t sub_233AFD4D4()
{
  return MEMORY[0x24BE852B8]();
}

uint64_t sub_233AFD4E0()
{
  return MEMORY[0x24BE852C0]();
}

uint64_t sub_233AFD4EC()
{
  return MEMORY[0x24BE852C8]();
}

uint64_t sub_233AFD4F8()
{
  return MEMORY[0x24BE852D0]();
}

uint64_t sub_233AFD504()
{
  return MEMORY[0x24BE852D8]();
}

uint64_t sub_233AFD510()
{
  return MEMORY[0x24BE85300]();
}

uint64_t sub_233AFD51C()
{
  return MEMORY[0x24BE85310]();
}

uint64_t sub_233AFD528()
{
  return MEMORY[0x24BE85320]();
}

uint64_t sub_233AFD534()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_233AFD540()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_233AFD54C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_233AFD558()
{
  return MEMORY[0x24BEE5358]();
}

uint64_t sub_233AFD564()
{
  return MEMORY[0x24BDEF1B8]();
}

uint64_t sub_233AFD570()
{
  return MEMORY[0x24BDEF1F8]();
}

uint64_t sub_233AFD57C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_233AFD588()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_233AFD594()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_233AFD5A0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_233AFD5AC()
{
  return MEMORY[0x24BEE07C0]();
}

uint64_t sub_233AFD5B8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_233AFD5C4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_233AFD5D0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_233AFD5DC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_233AFD5E8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_233AFD5F4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_233AFD600()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_233AFD60C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_233AFD618()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_233AFD624()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_233AFD630()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_233AFD63C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_233AFD648()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_233AFD654()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_233AFD660()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_233AFD66C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_233AFD678()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_233AFD684()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_233AFD690()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_233AFD69C()
{
  return MEMORY[0x24BEE57F8]();
}

uint64_t sub_233AFD6A8()
{
  return MEMORY[0x24BEE5810]();
}

uint64_t sub_233AFD6B4()
{
  return MEMORY[0x24BEE58A8]();
}

uint64_t sub_233AFD6C0()
{
  return MEMORY[0x24BEE58B0]();
}

uint64_t sub_233AFD6CC()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_233AFD6D8()
{
  return MEMORY[0x24BEE58C0]();
}

uint64_t sub_233AFD6E4()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_233AFD6F0()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_233AFD6FC()
{
  return MEMORY[0x24BEE58E0]();
}

uint64_t sub_233AFD708()
{
  return MEMORY[0x24BEE5968]();
}

uint64_t sub_233AFD714()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_233AFD720()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_233AFD72C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_233AFD738()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_233AFD744()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_233AFD750()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_233AFD75C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_233AFD768()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_233AFD774()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_233AFD780()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_233AFD78C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_233AFD798()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_233AFD7A4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_233AFD7B0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_233AFD7BC()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_233AFD7C8()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_233AFD7D4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_233AFD7E0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_233AFD7EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_233AFD7F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_233AFD804()
{
  return MEMORY[0x24BEE4328]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

