id MapKitBrandDataSourceObjcShim.opaqueWrapper.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___BSUIMapKitBrandDataSourceObjcShim_opaqueWrapper);
}

id MapKitBrandDataSourceObjcShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MapKitBrandDataSourceObjcShim.init()()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  id v5;
  objc_super v7;
  _BYTE v8[40];
  _QWORD v9[5];

  v1 = sub_2303C05A8();
  v2 = v0;
  v3 = sub_2303C059C();
  v9[3] = v1;
  v9[4] = MEMORY[0x24BE0FF88];
  v9[0] = v3;
  v4 = objc_allocWithZone(MEMORY[0x24BE0FFB8]);
  sub_2303B4734((uint64_t)v9, (uint64_t)v8);
  v5 = objc_msgSend(v4, sel_initWithThing_, sub_2303C0B54());
  swift_unknownObjectRelease();
  sub_2303B4770((uint64_t)v9);
  *(_QWORD *)&v2[OBJC_IVAR___BSUIMapKitBrandDataSourceObjcShim_opaqueWrapper] = v5;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for MapKitBrandDataSourceObjcShim();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_2303B4734(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MapKitBrandDataSource(a2, a1);
  return a2;
}

uint64_t sub_2303B4770(uint64_t a1)
{
  destroy for MapKitBrandDataSource(a1);
  return a1;
}

uint64_t type metadata accessor for MapKitBrandDataSourceObjcShim()
{
  return objc_opt_self();
}

id MapKitBrandDataSourceObjcShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MapKitBrandDataSourceObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id BrandPlacecardViewControllerObjcShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id BrandPlacecardViewControllerObjcShim.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandPlacecardViewControllerObjcShim();
  return objc_msgSendSuper2(&v2, sel_init);
}

id BrandPlacecardViewControllerObjcShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandPlacecardViewControllerObjcShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s18BusinessServicesUI36BrandPlacecardViewControllerObjcShimC04makedefG005brandhI13OpaqueWrapperSo06UIViewG0CSo08BSOpaqueM0C_tFZ_0(void *a1)
{
  id v1;
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;

  v1 = objc_msgSend(a1, sel_wrappedThing);
  sub_2303C0AE8();
  swift_unknownObjectRelease();
  sub_2303C0584();
  if (swift_dynamicCast())
  {
    sub_2303C0578();
    sub_2303C05CC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E73698);
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_release();
      v2 = -[BSUIMapItem makePlacecardViewController](v4);

      return (uint64_t)v2;
    }
  }
  else
  {
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

id _s18BusinessServicesUI36BrandPlacecardViewControllerObjcShimC18hoursConfiguration3foryXlSgSo15BSOpaqueWrapperC_tFZ_0(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id *v13;
  id *v14;
  id *v15;
  id v16;
  void *v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  void *v27;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73690);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2303C0530();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v26 - v9;
  v11 = objc_msgSend(a1, sel_wrappedThing);
  sub_2303C0AE8();
  swift_unknownObjectRelease();
  sub_2303C0584();
  if (!swift_dynamicCast())
    return 0;
  v12 = v27;
  sub_2303C0578();
  sub_2303C05CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73698);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_release();
    return 0;
  }
  v13 = (id *)v27;
  swift_release();
  v14 = -[BSUIMapItem messageBusinessHours](v13);
  if (!v14)
  {

    return 0;
  }
  v15 = v14;
  v16 = -[BSUIMapItem timeZone]((uint64_t)v13);
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_10;
  }
  v17 = v16;
  sub_2303C0524();

  v18 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v18(v3, v8, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_10:

    sub_2303B4DC4((uint64_t)v3);
    return 0;
  }
  v18(v10, v3, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73A40);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2303C1910;
  *(_QWORD *)(v19 + 32) = v15;
  v26[0] = v19;
  sub_2303C0A58();
  v20 = objc_allocWithZone(MEMORY[0x24BE63FC8]);
  sub_2303B4E04();
  v21 = v15;
  v22 = (void *)sub_2303C0A40();
  swift_bridgeObjectRelease();
  v23 = (void *)sub_2303C0518();
  v24 = objc_msgSend(v20, sel_initWithBusinessHours_timeZone_, v22, v23);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v24;
}

uint64_t type metadata accessor for BrandPlacecardViewControllerObjcShim()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348B895C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2303B4DC4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73690);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2303B4E04()
{
  unint64_t result;

  result = qword_255E736A0;
  if (!qword_255E736A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E736A0);
  }
  return result;
}

id Brand.primaryBrandColor.getter()
{
  return sub_2303B4E9C(MEMORY[0x24BE0FF18]);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

id Brand.secondaryBrandColor.getter()
{
  return sub_2303B4E9C(MEMORY[0x24BE0FF20]);
}

id sub_2303B4E9C(void (*a1)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_2303C05C0();
  v2 = v10;
  v3 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  a1(v2, v3);
  v5 = v4;
  if (v4)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    v6 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v7 = (void *)sub_2303C09E0();
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v6, sel_initWithHexString_, v7);

  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  return v5;
}

void __swiftcall Brand.makeBrandPlacecardViewController()(UIViewController *__return_ptr retstr)
{
  _QWORD *v1;

  sub_2303C05CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73698);
  if (swift_dynamicCast())
  {
    -[BSUIMapItem makePlacecardViewController](v1);

  }
  else
  {
    __break(1u);
  }
}

ValueMetadata *type metadata accessor for BSUIMapItemWrapper()
{
  return &type metadata for BSUIMapItemWrapper;
}

uint64_t initializeBufferWithCopyOfBuffer for MapKitBrandDataSource(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MapKitBrandDataSource(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for MapKitBrandDataSource(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for MapKitBrandDataSource(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for MapKitBrandDataSource(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MapKitBrandDataSource(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MapKitBrandDataSource(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MapKitBrandDataSource()
{
  return &type metadata for MapKitBrandDataSource;
}

uint64_t sub_2303B52D4(uint64_t a1, unint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  _BSUIMapServiceTicket *v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  uint64_t v25;
  uint64_t aBlock[6];
  _OWORD v27[2];
  uint64_t v28;

  v6 = v5;
  if (qword_255E73630 != -1)
    swift_once();
  v12 = sub_2303C05FC();
  __swift_project_value_buffer(v12, (uint64_t)qword_255E742D0);
  swift_bridgeObjectRetain_n();
  v13 = sub_2303C05E4();
  v14 = sub_2303C0A88();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v25 = v6;
    v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v27[0] = sub_2303B67B8(a1, a2, aBlock);
    sub_2303C0AB8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2303B2000, v13, v14, "Fetching brand with URI: %s", v15, 0xCu);
    swift_arrayDestroy();
    v17 = v16;
    v6 = v25;
    MEMORY[0x2348B89BC](v17, -1, -1);
    MEMORY[0x2348B89BC](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_opt_self();
  v18 = +[BSUIMapService sharedService]();
  v19 = (void *)sub_2303C09E0();
  v20 = -[BSUIMapService ticketForBrandLookupWithIMessageUid:]((uint64_t)v18, (uint64_t)v19);

  sub_2303B4734(v6, (uint64_t)v27);
  v21 = swift_allocObject();
  v22 = v27[1];
  *(_OWORD *)(v21 + 56) = v27[0];
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = a2;
  *(_BYTE *)(v21 + 32) = a3 & 1;
  *(_QWORD *)(v21 + 40) = a4;
  *(_QWORD *)(v21 + 48) = a5;
  *(_OWORD *)(v21 + 72) = v22;
  *(_QWORD *)(v21 + 88) = v28;
  aBlock[4] = (uint64_t)sub_2303B678C;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2303B661C;
  aBlock[3] = (uint64_t)&block_descriptor;
  v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  -[_BSUIMapServiceTicket submitWithHandler:](v20, sel_submitWithHandler_, v23);
  _Block_release(v23);
  return swift_unknownObjectRelease();
}

uint64_t sub_2303B55BC(unint64_t a1, void *a2, uint64_t a3, unint64_t a4, int a5, void (*a6)(uint64_t *), uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id *v51;
  id *v52;
  unint64_t v53;
  id *v54;
  id *v55;
  uint64_t v56;
  id *v57;
  id *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  char v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  id v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  void (*v102)(uint64_t *);
  uint64_t v103;
  id *v105;
  id *v106;
  uint64_t v107;
  id *v108;
  id *v109;
  uint64_t v110;
  id *v111;
  id *v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t, uint64_t, uint64_t);
  id *v115;
  id *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t, uint64_t);
  char *v121;
  NSObject *v122;
  os_log_type_t v123;
  uint8_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  void (*v129)(char *, uint64_t);
  uint64_t v130;
  uint8_t *v131;
  id *v132;
  uint64_t *boxed_opaque_existential_1;
  id *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _DWORD v138[2];
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  id *v147;
  char *v148;
  uint64_t v149;
  unint64_t v150;
  char *v151;
  void (*v152)(char *, uint64_t, uint64_t);
  void (*v153)(uint64_t *);
  uint64_t v154;
  _OWORD v155[2];
  uint64_t v156;
  uint64_t v157[3];
  uint64_t v158;
  uint64_t v159;
  id *v160;
  ValueMetadata *v161;
  unint64_t v162;
  char v163;

  v149 = a8;
  v153 = a6;
  v154 = a7;
  LODWORD(v151) = a5;
  v152 = (void (*)(char *, uint64_t, uint64_t))a3;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E736B8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v138 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v138 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v138 - v18;
  v20 = sub_2303C056C();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v138 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v138 - v25;
  v27 = sub_2303C0554();
  v28 = MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v138 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    v148 = v24;
    v149 = v21;
    v151 = v26;
    if (a1)
    {
      v46 = v17;
      v47 = v20;
      v150 = a4;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        v48 = sub_2303C0B24();
      }
      else
      {
        v48 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      v49 = v47;
      v50 = v46;
      if (v48)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          v51 = (id *)MEMORY[0x2348B859C](0, a1);
        }
        else
        {
          if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_75:
            swift_once();
LABEL_65:
            v118 = sub_2303C05FC();
            __swift_project_value_buffer(v118, (uint64_t)qword_255E742D0);
            v119 = v149;
            v120 = *(void (**)(char *, uint64_t, uint64_t))(v149 + 16);
            v121 = v148;
            v120(v148, v47, v49);
            v122 = sub_2303C05E4();
            v123 = sub_2303C0A70();
            if (os_log_type_enabled(v122, v123))
            {
              v124 = (uint8_t *)swift_slowAlloc();
              v125 = swift_slowAlloc();
              v152 = v120;
              v126 = v125;
              v157[0] = v125;
              *(_DWORD *)v124 = 136315138;
              sub_2303B6F34(&qword_255E736E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE0FF38], MEMORY[0x24BE0FF40]);
              v127 = sub_2303C0B3C();
              *(_QWORD *)&v155[0] = sub_2303B67B8(v127, v128, v157);
              sub_2303C0AB8();
              swift_bridgeObjectRelease();
              v129 = *(void (**)(char *, uint64_t))(v119 + 8);
              v129(v121, v49);
              _os_log_impl(&dword_2303B2000, v122, v123, "Fetched brand with model: %s", v124, 0xCu);
              swift_arrayDestroy();
              v130 = v126;
              v120 = v152;
              MEMORY[0x2348B89BC](v130, -1, -1);
              v131 = v124;
              v47 = (uint64_t)v151;
              MEMORY[0x2348B89BC](v131, -1, -1);
            }
            else
            {
              v129 = *(void (**)(char *, uint64_t))(v119 + 8);
              v129(v121, v49);
            }

            v132 = v147;
            v158 = v49;
            v159 = v141;
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v157);
            v120((char *)boxed_opaque_existential_1, v47, v49);
            v161 = &type metadata for BSUIMapItemWrapper;
            v162 = sub_2303B6EF0();
            v160 = v132;
            v163 = 0;
            v134 = v132;
            v153(v157);

            v129((char *)v47, v49);
            return sub_2303B6E74((uint64_t)v157);
          }
          v51 = (id *)*(id *)(a1 + 32);
        }
        v52 = v51;
        v53 = v150;
        swift_bridgeObjectRelease();
        v54 = -[BSUIMapItem name](v52);
        if (!v54)
        {
          if (qword_255E73630 != -1)
            swift_once();
          v92 = sub_2303C05FC();
          __swift_project_value_buffer(v92, (uint64_t)qword_255E742D0);
          swift_bridgeObjectRetain_n();
          v93 = sub_2303C05E4();
          v94 = sub_2303C0A88();
          if (os_log_type_enabled(v93, v94))
          {
            v95 = (uint8_t *)swift_slowAlloc();
            v96 = v53;
            v97 = swift_slowAlloc();
            v157[0] = v97;
            *(_DWORD *)v95 = 136315138;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v155[0] = sub_2303B67B8((uint64_t)v152, v96, v157);
            sub_2303C0AB8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2303B2000, v93, v94, "Found a brand with URI: %s but it was missing the name", v95, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2348B89BC](v97, -1, -1);
            MEMORY[0x2348B89BC](v95, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          v135 = sub_2303C0590();
          sub_2303B6F34(&qword_255E736C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE0FF68], MEMORY[0x24BE0FF70]);
          v136 = swift_allocError();
          (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v135 - 8) + 104))(v137, *MEMORY[0x24BE0FF58], v135);
          v157[0] = v136;
          v163 = 1;
          v153(v157);

          return sub_2303B6E74((uint64_t)v157);
        }
        v55 = v54;
        sub_2303C09EC();
        v146 = v56;

        v57 = -[BSUIMapItem phoneNumber](v52);
        if (v57)
        {
          v58 = v57;
          v145 = sub_2303C09EC();
          v144 = v59;

        }
        else
        {
          v145 = 0;
          v144 = 0;
        }
        v105 = -[BSUIMapItem _navBackgroundbrandColor](v52);
        if (v105)
        {
          v106 = v105;
          v143 = sub_2303B708C();
          v142 = v107;

        }
        else
        {
          v143 = 0;
          v142 = 0;
        }
        v108 = -[BSUIMapItem _navTintBrandColor](v52);
        if (v108)
        {
          v109 = v108;
          v140 = sub_2303B708C();
          v139 = v110;

        }
        else
        {
          v140 = 0;
          v139 = 0;
        }
        v138[1] = -[BSUIMapItem _isMessageIDVerified]((uint64_t)v52);
        v111 = -[BSUIMapItem url](v52);
        if (v111)
        {
          v112 = v111;
          sub_2303C0494();

          v113 = sub_2303C04B8();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v113 - 8) + 56))(v19, 0, 1, v113);
        }
        else
        {
          v113 = sub_2303C04B8();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v113 - 8) + 56))(v19, 1, 1, v113);
        }
        sub_2303C04B8();
        v114 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v113 - 8) + 56);
        v114(v50, 1, 1, v113);
        v147 = v52;
        v115 = -[BSUIMapItem _localizedResponseTime](v52);
        if (v115)
        {
          v116 = v115;
          sub_2303C09EC();

        }
        v114(v14, 1, 1, v113);
        v117 = sub_2303B6F34(&qword_255E736D0, (uint64_t (*)(uint64_t))MEMORY[0x24BE0FF38], MEMORY[0x24BE0FF30]);
        swift_bridgeObjectRetain();
        v141 = v117;
        v47 = (uint64_t)v151;
        sub_2303C0560();
        if (qword_255E73630 == -1)
          goto LABEL_65;
        goto LABEL_75;
      }
      swift_bridgeObjectRelease();
      a4 = v150;
    }
    if (qword_255E73630 != -1)
      swift_once();
    v83 = sub_2303C05FC();
    __swift_project_value_buffer(v83, (uint64_t)qword_255E742D0);
    swift_bridgeObjectRetain_n();
    v84 = sub_2303C05E4();
    v85 = sub_2303C0A88();
    if (os_log_type_enabled(v84, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc();
      v87 = a4;
      v88 = swift_slowAlloc();
      v157[0] = v88;
      *(_DWORD *)v86 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v155[0] = sub_2303B67B8((uint64_t)v152, v87, v157);
      sub_2303C0AB8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2303B2000, v84, v85, "Failed to find a brand with URI: %s - no results returned", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348B89BC](v88, -1, -1);
      MEMORY[0x2348B89BC](v86, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v89 = sub_2303C0590();
    sub_2303B6F34(&qword_255E736C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE0FF68], MEMORY[0x24BE0FF70]);
    v90 = swift_allocError();
    *v91 = 0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v89 - 8) + 104))(v91, *MEMORY[0x24BE0FF60], v89);
    v157[0] = v90;
    v163 = 1;
    v153(v157);
    return sub_2303B6E74((uint64_t)v157);
  }
  v32 = v31;
  v33 = v29;
  v148 = (char *)v28;
  v34 = a2;
  if (qword_255E73630 != -1)
    swift_once();
  v35 = sub_2303C05FC();
  __swift_project_value_buffer(v35, (uint64_t)qword_255E742D0);
  v36 = a2;
  swift_bridgeObjectRetain();
  v37 = a2;
  swift_bridgeObjectRetain();
  v38 = sub_2303C05E4();
  v39 = sub_2303C0A88();
  v40 = os_log_type_enabled(v38, v39);
  v150 = a4;
  if (v40)
  {
    v41 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v157[0] = v42;
    *(_DWORD *)v41 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v155[0] = sub_2303B67B8((uint64_t)v152, a4, v157);
    sub_2303C0AB8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v41 + 12) = 2080;
    *(_QWORD *)&v155[0] = a2;
    v43 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E736E8);
    v44 = sub_2303C0A04();
    *(_QWORD *)&v155[0] = sub_2303B67B8(v44, v45, v157);
    sub_2303C0AB8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v41 + 22) = 1024;
    LODWORD(v155[0]) = v151 & 1;
    sub_2303C0AB8();
    _os_log_impl(&dword_2303B2000, v38, v39, "Failed to fetch brand with URI: %s error: %s isNetworkRetry: %{BOOL}d", (uint8_t *)v41, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2348B89BC](v42, -1, -1);
    MEMORY[0x2348B89BC](v41, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v60 = (void *)sub_2303C0488();
  v61 = objc_msgSend(v60, sel_domain);
  v62 = sub_2303C09EC();
  v64 = v63;

  v65 = objc_msgSend(v60, sel_code);
  if (sub_2303C09EC() == v62 && v66 == v64)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v67 = sub_2303C0B48();
    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0)
      goto LABEL_22;
  }
  if (v65 != (id)4)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    v68 = (id)GEOErrorDomain();
    if (v68)
    {
      v69 = v68;
      v70 = sub_2303C09EC();
      v72 = v71;

      if (v70 == v62 && v72 == v64)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v73 = sub_2303C0B48();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v73 & 1) == 0)
          goto LABEL_31;
      }
      if (v65 == (id)-8)
        goto LABEL_29;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
LABEL_31:
    if (sub_2303C09EC() == v62 && v78 == v64)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v79 = sub_2303C0B48();
      swift_bridgeObjectRelease();
      if ((v79 & 1) == 0)
        goto LABEL_38;
    }
    sub_2303C053C();
    v80 = sub_2303C0548();
    (*(void (**)(char *, char *))(v33 + 8))(v32, v148);
    if ((id)v80 == v65)
    {
      if ((v151 & 1) == 0)
      {
        v98 = v149;
        sub_2303B6F74(v149, (uint64_t)v157);
        __swift_project_boxed_opaque_existential_1(v157, v158);
        sub_2303B4734(v98, (uint64_t)v155);
        v99 = swift_allocObject();
        v100 = v155[1];
        *(_OWORD *)(v99 + 16) = v155[0];
        *(_OWORD *)(v99 + 32) = v100;
        v101 = (uint64_t)v152;
        *(_QWORD *)(v99 + 48) = v156;
        *(_QWORD *)(v99 + 56) = v101;
        v102 = v153;
        v103 = v154;
        *(_QWORD *)(v99 + 64) = v150;
        *(_QWORD *)(v99 + 72) = v102;
        *(_QWORD *)(v99 + 80) = v103;
        swift_bridgeObjectRetain();
        swift_retain();
        sub_2303C05B4();

        swift_release();
        swift_bridgeObjectRelease();

        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v157);
      }
      v157[0] = (uint64_t)a2;
      v163 = 1;
      v81 = a2;
      v153(v157);

      goto LABEL_30;
    }
LABEL_38:
    swift_bridgeObjectRelease();
    v157[0] = (uint64_t)a2;
    v163 = 1;
    v82 = a2;
    v153(v157);

    goto LABEL_39;
  }
LABEL_29:
  v74 = sub_2303C0590();
  sub_2303B6F34(&qword_255E736C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE0FF68], MEMORY[0x24BE0FF70]);
  v75 = swift_allocError();
  *v76 = v60;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v74 - 8) + 104))(v76, *MEMORY[0x24BE0FF60], v74);
  v157[0] = v75;
  v163 = 1;
  v77 = v60;
  v153(v157);

LABEL_30:
  swift_bridgeObjectRelease();
LABEL_39:

  return sub_2303B6E74((uint64_t)v157);
}

uint64_t sub_2303B661C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2303B6E38();
    v4 = sub_2303C0A4C();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2303B6698(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2303B52D4(a1, a2, 0, a3, a4);
}

uint64_t sub_2303B66A8@<X0>(uint64_t a1@<X8>)
{
  return sub_2303B66C0((uint64_t (*)(_QWORD, uint64_t))-[BSUIMapItem _bestBrandIconURLForSize:allowSmaller:], a1);
}

uint64_t sub_2303B66B4@<X0>(uint64_t a1@<X8>)
{
  return sub_2303B66C0((uint64_t (*)(_QWORD, uint64_t))-[BSUIMapItem _bestNavbarBrandIconURLForSize:allowSmaller:], a1);
}

uint64_t sub_2303B66C0@<X0>(uint64_t (*a1)(_QWORD, uint64_t)@<X2>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = (id)a1(*v2, 1);
  if (v4)
  {
    v5 = v4;
    sub_2303C0494();

    v6 = sub_2303C04B8();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a2;
    v9 = 0;
  }
  else
  {
    v6 = sub_2303C04B8();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a2;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2303B6758()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocObject();
}

uint64_t sub_2303B678C(unint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_2303B55BC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void (**)(uint64_t *))(v2 + 40), *(_QWORD *)(v2 + 48), v2 + 56);
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

uint64_t sub_2303B67B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2303B6888(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2303B6DF8((uint64_t)v12, *a3);
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
      sub_2303B6DF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2303B6888(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2303C0AC4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2303B6A40(a5, a6);
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
  v8 = sub_2303C0B0C();
  if (!v8)
  {
    sub_2303C0B18();
    __break(1u);
LABEL_17:
    result = sub_2303C0B30();
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

uint64_t sub_2303B6A40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2303B6AD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2303B6CAC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2303B6CAC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2303B6AD4(uint64_t a1, unint64_t a2)
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
      v3 = sub_2303B6C48(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2303C0AF4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2303C0B18();
      __break(1u);
LABEL_10:
      v2 = sub_2303C0A34();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2303C0B30();
    __break(1u);
LABEL_14:
    result = sub_2303C0B18();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2303B6C48(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E736A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2303B6CAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E736A8);
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
  result = sub_2303C0B30();
  __break(1u);
  return result;
}

uint64_t sub_2303B6DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2303B6E38()
{
  unint64_t result;

  result = qword_255E736B0;
  if (!qword_255E736B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E736B0);
  }
  return result;
}

uint64_t sub_2303B6E74(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E736C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

unint64_t sub_2303B6EF0()
{
  unint64_t result;

  result = qword_255E736D8;
  if (!qword_255E736D8)
  {
    result = MEMORY[0x2348B8974](&unk_2303C19E0, &type metadata for BSUIMapItemWrapper);
    atomic_store(result, (unint64_t *)&qword_255E736D8);
  }
  return result;
}

uint64_t sub_2303B6F34(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348B8974](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2303B6F74(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2303B6FB8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2303B6FEC()
{
  _QWORD *v0;

  return sub_2303B52D4(v0[7], v0[8], 1, v0[9], v0[10]);
}

UIColor_optional __swiftcall UIColor.init(hexString:)(Swift::String hexString)
{
  id v1;
  void *v2;
  objc_class *v3;
  Swift::Bool v4;
  objc_class *v5;
  UIColor_optional result;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v2 = (void *)sub_2303C09E0();
  swift_bridgeObjectRelease();
  v3 = (objc_class *)objc_msgSend(v1, sel_initWithHexString_, v2);

  v5 = v3;
  result.value.super.isa = v5;
  result.is_nil = v4;
  return result;
}

uint64_t sub_2303B708C()
{
  void *v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = objc_msgSend(v0, sel_CGColor);
  v2 = sub_2303C0A64();

  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 < 3)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v5 = *(double *)(v2 + 32);
  v6 = *(double *)(v2 + 40);
  v7 = *(double *)(v2 + 48);
  if (v3 == 3)
  {
    swift_bridgeObjectRelease();
    v8 = 255.0;
  }
  else
  {
    v9 = *(double *)(v2 + 56);
    swift_bridgeObjectRelease();
    v10 = v9;
    v8 = v10 * 255.0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E736F8);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2303C1A10;
  v12 = lroundf(v5 * 255.0);
  v13 = MEMORY[0x24BEE1768];
  v14 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v11 + 64) = v14;
  *(_QWORD *)(v11 + 32) = v12;
  v15 = lroundf(v6 * 255.0);
  *(_QWORD *)(v11 + 96) = v13;
  *(_QWORD *)(v11 + 104) = v14;
  *(_QWORD *)(v11 + 72) = v15;
  v16 = lroundf(v7 * 255.0);
  *(_QWORD *)(v11 + 136) = v13;
  *(_QWORD *)(v11 + 144) = v14;
  *(_QWORD *)(v11 + 112) = v16;
  v17 = lroundf(v8);
  *(_QWORD *)(v11 + 176) = v13;
  *(_QWORD *)(v11 + 184) = v14;
  *(_QWORD *)(v11 + 152) = v17;
  return sub_2303C09F8();
}

id UIColor.init(hexString:)(unint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  _QWORD v22[5];
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = sub_2303C0470();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  v24 = a2;
  sub_2303C0464();
  sub_2303B7484();
  v10 = sub_2303C0AD0();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  v23 = v10;
  v24 = v12;
  v22[3] = 35;
  v22[4] = 0xE100000000000000;
  v22[1] = 0;
  v22[2] = 0xE000000000000000;
  sub_2303C0ADC();
  swift_bridgeObjectRelease();
  v23 = 0;
  v13 = sub_2303C0A1C();
  v14 = objc_allocWithZone(MEMORY[0x24BDD17A8]);
  v15 = (void *)sub_2303C09E0();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_initWithString_, v15);

  LODWORD(v15) = objc_msgSend(v16, sel_scanHexLongLong_, &v23);
  if (!(_DWORD)v15)
    goto LABEL_5;
  if (v13 == 8)
  {
    v18 = v23 >> 24;
    v19 = v23 >> 16;
    v17 = v23 >> 8;
    v20 = (double)v23 / 255.0;
    return objc_msgSend(v3, sel_initWithRed_green_blue_alpha_, (double)v18 / 255.0, (double)v19 / 255.0, (double)v17 / 255.0, v20);
  }
  if (v13 != 6)
  {
LABEL_5:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  LOBYTE(v17) = v23;
  v18 = v23 >> 16;
  v19 = v23 >> 8;
  v20 = 1.0;
  return objc_msgSend(v3, sel_initWithRed_green_blue_alpha_, (double)v18 / 255.0, (double)v19 / 255.0, (double)v17 / 255.0, v20);
}

unint64_t sub_2303B7484()
{
  unint64_t result;

  result = qword_255E736F0;
  if (!qword_255E736F0)
  {
    result = MEMORY[0x2348B8974](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255E736F0);
  }
  return result;
}

id sub_2303B74C8()
{
  unint64_t v0;
  uint64_t v1;

  v0 = sub_2303C09EC();
  return UIColor.init(hexString:)(v0, v1);
}

uint64_t BrandCardContentView.init(brand:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t BrandCardContentView.body.getter()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  __int128 v11;
  _QWORD v13[2];
  __int128 v14;
  uint64_t v15;
  __int128 v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73700);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (_QWORD *)((char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73708);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v0;
  if (*v0)
  {
    MEMORY[0x24BDAC7A8](v6);
    v13[-2] = v9;
    v13[1] = 0;
    v10 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E73728);
    sub_2303C0950();
    v11 = v14;
    v15 = 0;
    v14 = (unint64_t)v9;
    v16 = v11;
    sub_2303B77BC();
    sub_2303B7800();
    sub_2303C098C();
    (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(v3, v8, v4);
    swift_storeEnumTagMultiPayload();
    sub_2303B7700();
    sub_2303C07B8();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    *v3 = sub_2303C08F0();
    swift_storeEnumTagMultiPayload();
    sub_2303B7700();
    return sub_2303C07B8();
  }
}

unint64_t sub_2303B7700()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_255E73710;
  if (!qword_255E73710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73708);
    v2[0] = sub_2303B77BC();
    v2[1] = sub_2303B7800();
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2348B8974](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73710);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348B8968](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2303B77BC()
{
  unint64_t result;

  result = qword_255E73718;
  if (!qword_255E73718)
  {
    result = MEMORY[0x2348B8974](&protocol conformance descriptor for BrandHeaderView, &type metadata for BrandHeaderView);
    atomic_store(result, (unint64_t *)&qword_255E73718);
  }
  return result;
}

unint64_t sub_2303B7800()
{
  unint64_t result;

  result = qword_255E73720;
  if (!qword_255E73720)
  {
    result = MEMORY[0x2348B8974](&protocol conformance descriptor for BrandCardDetailView, &type metadata for BrandCardDetailView);
    atomic_store(result, (unint64_t *)&qword_255E73720);
  }
  return result;
}

id sub_2303B7844@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_2303B7850()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2303B7868()
{
  return sub_2303C08C0();
}

void **initializeBufferWithCopyOfBuffer for BrandCardContentView(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for BrandCardContentView(id *a1)
{

}

void **assignWithCopy for BrandCardContentView(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for BrandCardContentView(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for BrandCardContentView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BrandCardContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrandCardContentView()
{
  return &type metadata for BrandCardContentView;
}

unint64_t sub_2303B79E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73730;
  if (!qword_255E73730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73738);
    v2[0] = sub_2303B7700();
    v2[1] = MEMORY[0x24BDF3E20];
    result = MEMORY[0x2348B8974](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73730);
  }
  return result;
}

__n128 BrandHeaderView.init(brand:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __n128 v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73728);
  sub_2303C0950();
  result = v5;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = a1;
  *(__n128 *)(a2 + 24) = v5;
  return result;
}

__n128 BrandHeaderView.init(brand:fallbackHandle:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __n128 result;
  __n128 v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73728);
  sub_2303C0950();
  result = v9;
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(__n128 *)(a4 + 24) = v9;
  return result;
}

uint64_t sub_2303B7B18()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t ObjCClassFromMetadata;
  id v31;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  if (!*(_QWORD *)v0)
  {
    v9 = 0;
    v10 = 0;
    if (!v2)
      goto LABEL_34;
    goto LABEL_21;
  }
  v3 = *(id *)v0;
  v4 = objc_msgSend(v3, sel_name);
  v5 = sub_2303C09EC();
  v7 = v6;

  swift_bridgeObjectRelease();
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  if (v8)
    goto LABEL_5;
  v9 = (uint64_t)objc_msgSend(v3, sel_primaryPhoneNumber);
  if (!v9)
    goto LABEL_6;
  v18 = sub_2303C09EC();
  v20 = v19;

  swift_bridgeObjectRelease();
  v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0)
    v21 = v18 & 0xFFFFFFFFFFFFLL;
  if (!v21 || (v22 = objc_msgSend(v3, sel_primaryPhoneNumber)) == 0)
  {
LABEL_5:
    v9 = 0;
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v23 = v22;
  v9 = sub_2303C09EC();
  v10 = v24;

LABEL_7:
  v11 = objc_msgSend(v3, sel_name);
  v12 = sub_2303C09EC();
  v14 = v13;

  swift_bridgeObjectRelease();
  v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0)
    v15 = v12 & 0xFFFFFFFFFFFFLL;
  if (v15)
  {
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v3, sel_name);
    v9 = sub_2303C09EC();
    v10 = v17;

    if (!v2)
      goto LABEL_34;
  }
  else
  {

    if (!v2)
      goto LABEL_34;
  }
LABEL_21:
  v25 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v25 = v1 & 0xFFFFFFFFFFFFLL;
  if (v25)
  {
    v26 = v9 & 0xFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v10)
      v27 = v10;
    else
      v27 = 0xE000000000000000;
    if (!v10)
      v26 = 0;
    swift_bridgeObjectRelease();
    if ((v27 & 0x2000000000000000) != 0)
      v28 = HIBYTE(v27) & 0xF;
    else
      v28 = v26;
    if (!v28)
    {
      swift_bridgeObjectRelease();
      return v1;
    }
    swift_bridgeObjectRelease();
  }
LABEL_34:
  if (!v10)
  {
    v29 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v31 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);

    v9 = sub_2303C047C();
  }
  return v9;
}

uint64_t sub_2303B7DE8()
{
  id *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;

  v1 = sub_2303C06EC();
  MEMORY[0x24BDAC7A8](v1);
  if (!*v0)
    goto LABEL_10;
  v2 = *v0;
  if (!objc_msgSend(v2, sel_isRCSChatBot)
    || !objc_msgSend(v2, sel_isVerified)
    || (v3 = objc_msgSend(v2, sel_verifiedBy)) == 0)
  {
    if (objc_msgSend(v2, sel_isVerified))
    {
      v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
      swift_getObjectType();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);

      sub_2303C047C();
      sub_2303C06E0();
      sub_2303C06D4();
      sub_2303C092C();
      sub_2303C06BC();
      swift_release();
      sub_2303C06D4();
      sub_2303C06C8();
      swift_bridgeObjectRelease();
      sub_2303C06D4();
      sub_2303C06F8();
      v12 = sub_2303C0884();
      goto LABEL_8;
    }

LABEL_10:
    v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    v18 = swift_getObjCClassFromMetadata();
    v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v18);

    sub_2303C047C();
    sub_2303B7484();
    return sub_2303C0890();
  }
  v4 = v3;
  v5 = sub_2303C09EC();
  v7 = v6;

  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  v9 = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v9);

  sub_2303C047C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E736F8);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2303C1AA0;
  *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v11 + 64) = sub_2303BB5F0();
  *(_QWORD *)(v11 + 32) = v5;
  *(_QWORD *)(v11 + 40) = v7;
  sub_2303C09F8();
  swift_bridgeObjectRelease();
  sub_2303B7484();
  v12 = sub_2303C0890();
LABEL_8:
  v16 = v12;

  return v16;
}

uint64_t BrandHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD *v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  void (**v38)();
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _OWORD v69[12];
  char v70;
  _BYTE v71[200];
  char v72;
  __int128 v73;
  _OWORD v74[13];
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  v2 = v1;
  v68 = a1;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73740);
  MEMORY[0x24BDAC7A8](v63);
  v59 = (uint64_t *)((char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73748);
  MEMORY[0x24BDAC7A8](v57);
  v5 = (_OWORD *)((char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73750);
  v6 = MEMORY[0x24BDAC7A8](v67);
  v58 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v56 - v8;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73758);
  MEMORY[0x24BDAC7A8](v65);
  v66 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73760);
  MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73768);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73770);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73778);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73780);
  MEMORY[0x24BDAC7A8](v61);
  v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73788);
  v23 = MEMORY[0x24BDAC7A8](v64);
  v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v56 - v26;
  v28 = v2[1];
  v75 = *v2;
  v76 = v28;
  v77 = *((_QWORD *)v2 + 4);
  if ((_QWORD)v75)
  {
    v29 = (char *)(id)v75;
    v60 = v29;
    *(_QWORD *)v14 = sub_2303C0710();
    *((_QWORD *)v14 + 1) = 0;
    v14[16] = 0;
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E737F0);
    sub_2303B8A48((uint64_t)&v75, v29, (uint64_t)&v14[*(int *)(v30 + 44)]);
    sub_2303C09A4();
    sub_2303B96EC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, 0.0, 1);
    sub_2303BB5B4((uint64_t)v14, &qword_255E73768);
    v31 = sub_2303C086C();
    v32 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v62, 1, 1, v31);
    KeyPath = swift_getKeyPath();
    v34 = (uint64_t *)&v20[*(int *)(v18 + 36)];
    sub_2303BB570(v32, (uint64_t)v34 + *(int *)(v63 + 28), &qword_255E73760);
    *v34 = KeyPath;
    sub_2303BB570((uint64_t)v17, (uint64_t)v20, &qword_255E73770);
    sub_2303BB5B4(v32, &qword_255E73760);
    sub_2303BB5B4((uint64_t)v17, &qword_255E73770);
    LODWORD(KeyPath) = sub_2303C07C4();
    sub_2303BB570((uint64_t)v20, (uint64_t)v22, &qword_255E73778);
    *(_DWORD *)&v22[*(int *)(v61 + 36)] = KeyPath;
    sub_2303BB5B4((uint64_t)v20, &qword_255E73778);
    v35 = swift_allocObject();
    v36 = v60;
    *(_QWORD *)(v35 + 16) = v60;
    v37 = v76;
    *(_OWORD *)(v35 + 24) = v75;
    *(_OWORD *)(v35 + 40) = v37;
    *(_QWORD *)(v35 + 56) = v77;
    sub_2303BB570((uint64_t)v22, (uint64_t)v25, &qword_255E73780);
    v38 = (void (**)())&v25[*(int *)(v64 + 36)];
    *v38 = sub_2303BAA74;
    v38[1] = (void (*)())v35;
    v38[2] = 0;
    v38[3] = 0;
    v39 = v36;
    sub_2303BAA80((uint64_t)&v75);
    sub_2303BB5B4((uint64_t)v22, &qword_255E73780);
    sub_2303BB52C((uint64_t)v25, (uint64_t)v27, &qword_255E73788);
    sub_2303BB570((uint64_t)v27, v66, &qword_255E73788);
    swift_storeEnumTagMultiPayload();
    sub_2303BB2A0(&qword_255E73790, &qword_255E73788, (uint64_t (*)(void))sub_2303BA784, MEMORY[0x24BDF0910]);
    sub_2303BA910();
    sub_2303C07B8();

    v40 = (uint64_t)v27;
    v41 = &qword_255E73788;
  }
  else
  {
    v42 = sub_2303C0710();
    sub_2303B9C9C((uint64_t)&v75, (uint64_t)v69);
    *(_OWORD *)&v71[151] = v69[9];
    *(_OWORD *)&v71[167] = v69[10];
    *(_OWORD *)&v71[183] = v69[11];
    v71[199] = v70;
    *(_OWORD *)&v71[87] = v69[5];
    *(_OWORD *)&v71[103] = v69[6];
    *(_OWORD *)&v71[119] = v69[7];
    *(_OWORD *)&v71[135] = v69[8];
    *(_OWORD *)&v71[23] = v69[1];
    *(_OWORD *)&v71[39] = v69[2];
    *(_OWORD *)&v71[55] = v69[3];
    *(_OWORD *)&v71[71] = v69[4];
    *(_OWORD *)&v71[7] = v69[0];
    *(_OWORD *)((char *)&v74[9] + 1) = *(_OWORD *)&v71[144];
    *(_OWORD *)((char *)&v74[10] + 1) = *(_OWORD *)&v71[160];
    *(_OWORD *)((char *)&v74[11] + 1) = *(_OWORD *)&v71[176];
    *(_OWORD *)((char *)&v74[5] + 1) = *(_OWORD *)&v71[80];
    *(_OWORD *)((char *)&v74[6] + 1) = *(_OWORD *)&v71[96];
    *(_OWORD *)((char *)&v74[7] + 1) = *(_OWORD *)&v71[112];
    *(_OWORD *)((char *)&v74[8] + 1) = *(_OWORD *)&v71[128];
    *(_OWORD *)((char *)&v74[1] + 1) = *(_OWORD *)&v71[16];
    *(_OWORD *)((char *)&v74[2] + 1) = *(_OWORD *)&v71[32];
    *(_OWORD *)((char *)&v74[3] + 1) = *(_OWORD *)&v71[48];
    *(_OWORD *)((char *)&v74[4] + 1) = *(_OWORD *)&v71[64];
    v72 = 0;
    v73 = (unint64_t)v42;
    LOBYTE(v74[0]) = 0;
    *(_QWORD *)((char *)&v74[12] + 1) = *(_QWORD *)&v71[192];
    *(_OWORD *)((char *)v74 + 1) = *(_OWORD *)v71;
    v43 = sub_2303C086C();
    v44 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v62, 1, 1, v43);
    v45 = swift_getKeyPath();
    v46 = v59;
    sub_2303BB570(v44, (uint64_t)v59 + *(int *)(v63 + 28), &qword_255E73760);
    *v46 = v45;
    sub_2303BB570((uint64_t)v46, (uint64_t)v5 + *(int *)(v57 + 36), &qword_255E73740);
    v47 = v74[10];
    v5[10] = v74[9];
    v5[11] = v47;
    v5[12] = v74[11];
    *(_OWORD *)((char *)v5 + 201) = *(_OWORD *)((char *)&v74[11] + 9);
    v48 = v74[6];
    v5[6] = v74[5];
    v5[7] = v48;
    v49 = v74[8];
    v5[8] = v74[7];
    v5[9] = v49;
    v50 = v74[2];
    v5[2] = v74[1];
    v5[3] = v50;
    v51 = v74[4];
    v5[4] = v74[3];
    v5[5] = v51;
    v52 = v74[0];
    *v5 = v73;
    v5[1] = v52;
    sub_2303BA6F8((uint64_t)&v73);
    sub_2303BB5B4((uint64_t)v46, &qword_255E73740);
    sub_2303BB5B4(v44, &qword_255E73760);
    sub_2303BA740((uint64_t)v69);
    LODWORD(v45) = sub_2303C07C4();
    v53 = v58;
    sub_2303BB570((uint64_t)v5, v58, &qword_255E73748);
    *(_DWORD *)(v53 + *(int *)(v67 + 36)) = v45;
    sub_2303BB5B4((uint64_t)v5, &qword_255E73748);
    v54 = (uint64_t)v60;
    sub_2303BB52C(v53, (uint64_t)v60, &qword_255E73750);
    sub_2303BB570(v54, v66, &qword_255E73750);
    swift_storeEnumTagMultiPayload();
    sub_2303BB2A0(&qword_255E73790, &qword_255E73788, (uint64_t (*)(void))sub_2303BA784, MEMORY[0x24BDF0910]);
    sub_2303BA910();
    sub_2303C07B8();
    v40 = v54;
    v41 = &qword_255E73750;
  }
  return sub_2303BB5B4(v40, v41);
}

uint64_t sub_2303B8A48@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  _OWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
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
  id v55;
  char *v56;
  char *v57;
  uint64_t v58;
  id v59;
  unsigned int *v60;
  void *v61;
  _QWORD *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char v90;
  uint64_t v91;
  unsigned __int8 v92;
  unsigned __int8 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  unsigned __int8 v104;
  unsigned __int8 v105;
  uint64_t v106;
  int *v107;
  uint64_t *v108;
  uint64_t v109;
  char *v110;
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
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t KeyPath;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char v171;
  unsigned __int8 v172;
  unsigned __int8 v173;
  unsigned __int8 v174;
  unsigned __int8 v175;
  unsigned __int8 v176;
  unsigned __int8 v177;
  unsigned __int8 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  char v189;
  __int128 v190;
  char v191;
  id v192;
  char v193;
  uint64_t v194;
  char v195;
  uint64_t v196;
  char v197;
  uint64_t v198;
  char v199;
  uint64_t v200;
  char v201;
  char *v202;
  uint64_t v203;
  char v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char v209;
  uint64_t v210;
  char v211;
  uint64_t v212;
  char v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  unsigned __int8 v217;
  void *v218;
  char v219;
  uint64_t v220;
  char v221;
  uint64_t v222;
  char v223;
  uint64_t v224;
  unsigned __int8 v225;
  uint64_t v226;
  char v227;
  char *v228;
  uint64_t v229;

  v145 = a3;
  v169 = sub_2303C083C();
  v162 = *(_QWORD *)(v169 - 8);
  MEMORY[0x24BDAC7A8](v169);
  v161 = (char *)&v134 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73810);
  MEMORY[0x24BDAC7A8](v160);
  v167 = (uint64_t)&v134 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = sub_2303C0644();
  MEMORY[0x24BDAC7A8](v158);
  v163 = (char *)&v134 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2303C0938();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v134 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73848);
  MEMORY[0x24BDAC7A8](v157);
  v13 = (char *)&v134 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73850);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v159 = (uint64_t)&v134 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v168 = (uint64_t)&v134 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73858);
  MEMORY[0x24BDAC7A8](v18);
  v170 = (uint64_t)&v134 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73860);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v165 = (uint64_t)&v134 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v134 - v23;
  v164 = a1;
  v190 = *(_OWORD *)(a1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73840);
  sub_2303C095C();
  v166 = v24;
  if ((_QWORD)v179)
  {
    v155 = (id)v179;
    sub_2303C0920();
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF3FD0], v8);
    v25 = sub_2303C0944();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_2303C09A4();
    sub_2303C0620();
    v26 = v211;
    v152 = v212;
    v153 = v210;
    v156 = a2;
    v27 = v213;
    v154 = v14;
    v28 = v214;
    v151 = v215;
    v29 = v163;
    v30 = &v163[*(int *)(v158 + 20)];
    v31 = *MEMORY[0x24BDEEB68];
    v32 = sub_2303C0704();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v30, v31, v32);
    __asm { FMOV            V0.2D, #18.0 }
    *v29 = _Q0;
    v38 = v167;
    sub_2303BB050((uint64_t)v29, v167);
    *(_WORD *)(v38 + *(int *)(v160 + 36)) = 256;
    sub_2303BB570(v38, (uint64_t)&v13[*(int *)(v157 + 36)], &qword_255E73810);
    *(_QWORD *)v13 = v25;
    *((_QWORD *)v13 + 1) = 0;
    *((_WORD *)v13 + 8) = 1;
    *((_QWORD *)v13 + 3) = v153;
    v160 = v18;
    v13[32] = v26;
    *((_QWORD *)v13 + 5) = v152;
    v13[48] = v27;
    a2 = v156;
    v39 = v151;
    *((_QWORD *)v13 + 7) = v28;
    *((_QWORD *)v13 + 8) = v39;
    swift_retain();
    sub_2303BB5B4(v38, &qword_255E73810);
    sub_2303BB094((uint64_t)v29);
    swift_release();
    LOBYTE(v25) = sub_2303C07E8();
    sub_2303C0608();
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v48 = v159;
    sub_2303BB570((uint64_t)v13, v159, &qword_255E73848);
    v49 = v48 + *(int *)(v154 + 36);
    *(_BYTE *)v49 = v25;
    *(_QWORD *)(v49 + 8) = v41;
    *(_QWORD *)(v49 + 16) = v43;
    *(_QWORD *)(v49 + 24) = v45;
    *(_QWORD *)(v49 + 32) = v47;
    *(_BYTE *)(v49 + 40) = 0;
    sub_2303BB5B4((uint64_t)v13, &qword_255E73848);
    v50 = v48;
    v51 = v168;
    sub_2303BB52C(v50, v168, &qword_255E73850);
    sub_2303BB570(v51, v170, &qword_255E73850);
    swift_storeEnumTagMultiPayload();
    sub_2303BB2A0(&qword_255E73868, &qword_255E73850, (uint64_t (*)(void))sub_2303BB308, MEMORY[0x24BDECC60]);
    sub_2303BB410();
    sub_2303C07B8();

    sub_2303BB5B4(v51, &qword_255E73850);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_2303BB2A0(&qword_255E73868, &qword_255E73850, (uint64_t (*)(void))sub_2303BB308, MEMORY[0x24BDECC60]);
    sub_2303BB410();
    sub_2303C07B8();
  }
  v52 = sub_2303B7B18();
  v54 = v53;
  if (objc_msgSend(a2, sel_isRCSChatBot))
  {
    v55 = objc_msgSend(a2, sel_brandURI);
    v143 = sub_2303C09EC();
    v57 = v56;

  }
  else
  {
    v143 = 0;
    v57 = 0;
  }
  v58 = v169;
  v59 = objc_msgSend(a2, sel_categories);
  v60 = (unsigned int *)MEMORY[0x24BDF17C8];
  v170 = v54;
  v163 = v57;
  v144 = v52;
  if (!v59)
    goto LABEL_14;
  v61 = v59;
  v62 = (_QWORD *)sub_2303C0A4C();

  if (!v62[2])
    goto LABEL_13;
  v64 = v62[4];
  v63 = v62[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v65 = HIBYTE(v63) & 0xF;
  if ((v63 & 0x2000000000000000) == 0)
    v65 = v64 & 0xFFFFFFFFFFFFLL;
  if (!v65)
  {
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    v149 = 0;
    v150 = 0;
    v168 = 0;
    v169 = 0;
    KeyPath = 0;
    v148 = 0;
    v146 = 0;
    v167 = 0;
    goto LABEL_15;
  }
  *(_QWORD *)&v190 = v64;
  *((_QWORD *)&v190 + 1) = v63;
  sub_2303B7484();
  v66 = sub_2303C0890();
  v68 = v67;
  v70 = v69 & 1;
  sub_2303C0800();
  v71 = *v60;
  v72 = v161;
  v73 = v162;
  (*(void (**)(char *, uint64_t, uint64_t))(v162 + 104))(v161, v71, v58);
  sub_2303C0848();
  swift_release();
  v74 = v72;
  v60 = (unsigned int *)MEMORY[0x24BDF17C8];
  (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v58);
  v75 = sub_2303C0878();
  v149 = v76;
  v150 = v75;
  v78 = v77;
  v148 = v79;
  swift_release();
  v169 = v78 & 1;
  sub_2303BAF98(v66, v68, v70);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  LOBYTE(v146) = sub_2303C07DC();
  v146 = v146;
  v167 = 0x4000000000000000;
  v168 = 1;
LABEL_15:
  v80 = sub_2303B7DE8();
  v82 = v81;
  v84 = v83 & 1;
  sub_2303C07F4();
  v86 = v161;
  v85 = v162;
  (*(void (**)(char *, _QWORD, uint64_t))(v162 + 104))(v161, *v60, v58);
  sub_2303C0848();
  swift_release();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v58);
  v87 = sub_2303C0878();
  v140 = v88;
  v141 = v87;
  v90 = v89;
  v154 = v91;
  swift_release();
  sub_2303BAF98(v80, v82, v84);
  swift_bridgeObjectRelease();
  v139 = sub_2303C07DC();
  v142 = sub_2303C08F0();
  sub_2303C09A4();
  sub_2303C0650();
  v92 = v217;
  v155 = v218;
  v156 = v216;
  LOBYTE(v85) = v219;
  LOBYTE(v80) = v221;
  v157 = v222;
  v158 = v220;
  LOBYTE(v82) = v223;
  v164 = v224;
  v93 = v225;
  LOBYTE(v86) = v227;
  v161 = v228;
  v162 = v226;
  v160 = v229;
  LODWORD(v159) = sub_2303C07DC();
  sub_2303C0608();
  v95 = v94;
  v97 = v96;
  v99 = v98;
  v101 = v100;
  v178 = v92;
  v177 = v85;
  v176 = v80;
  v175 = v82;
  v174 = v93;
  v173 = v86;
  v172 = 0;
  v102 = v165;
  sub_2303BB570((uint64_t)v166, v165, &qword_255E73860);
  v103 = v90 & 1;
  v171 = v90 & 1;
  v104 = v178;
  v134 = v90 & 1;
  v135 = v178;
  LOBYTE(v85) = v177;
  LOBYTE(v86) = v176;
  v136 = v177;
  v137 = v176;
  v105 = v175;
  v138 = v175;
  LODWORD(v152) = v174;
  LODWORD(v153) = v173;
  LODWORD(v151) = v172;
  v106 = v145;
  sub_2303BB570(v102, v145, &qword_255E73860);
  v107 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_255E738A8);
  v108 = (uint64_t *)(v106 + v107[12]);
  v109 = v170;
  *v108 = v144;
  v108[1] = v109;
  v110 = v163;
  v108[2] = v143;
  v108[3] = (uint64_t)v110;
  v111 = v106 + v107[16];
  v112 = v149;
  *(_QWORD *)v111 = v150;
  *(_QWORD *)(v111 + 8) = v112;
  v113 = v148;
  *(_QWORD *)(v111 + 16) = v169;
  *(_QWORD *)(v111 + 24) = v113;
  v115 = v167;
  v114 = v168;
  *(_QWORD *)(v111 + 32) = KeyPath;
  *(_QWORD *)(v111 + 40) = v114;
  v116 = v146;
  *(_QWORD *)(v111 + 48) = 0;
  *(_QWORD *)(v111 + 56) = v116;
  *(_QWORD *)(v111 + 64) = v115;
  *(_QWORD *)(v111 + 72) = 0;
  v167 = v115;
  *(_QWORD *)(v111 + 80) = 0;
  *(_QWORD *)(v111 + 88) = 0;
  *(_BYTE *)(v111 + 96) = 0;
  v117 = v106 + v107[20];
  *(_BYTE *)(v117 + 32) = v139;
  *(_QWORD *)(v117 + 40) = 0x4010000000000000;
  *(_QWORD *)(v117 + 48) = 0;
  v119 = v140;
  v118 = v141;
  *(_QWORD *)v117 = v141;
  *(_QWORD *)(v117 + 8) = v119;
  *(_BYTE *)(v117 + 16) = v103;
  *(_QWORD *)(v117 + 24) = v154;
  *(_QWORD *)(v117 + 56) = 0;
  *(_QWORD *)(v117 + 64) = 0;
  *(_BYTE *)(v117 + 72) = 0;
  v120 = v106 + v107[24];
  *((_QWORD *)&v179 + 1) = v156;
  LOBYTE(v180) = v104;
  *((_QWORD *)&v180 + 1) = v155;
  LOBYTE(v181) = v85;
  *((_QWORD *)&v181 + 1) = v158;
  LOBYTE(v182) = (_BYTE)v86;
  *((_QWORD *)&v182 + 1) = v157;
  LOBYTE(v183) = v105;
  *((_QWORD *)&v183 + 1) = v164;
  LOBYTE(v184) = v152;
  *((_QWORD *)&v184 + 1) = v162;
  LOBYTE(v185) = v153;
  *((_QWORD *)&v185 + 1) = v161;
  *(_QWORD *)&v186 = v160;
  BYTE8(v186) = v159;
  *(_QWORD *)&v187 = v95;
  *((_QWORD *)&v187 + 1) = v97;
  *(_QWORD *)&v188 = v99;
  *((_QWORD *)&v188 + 1) = v101;
  v121 = v184;
  v122 = v185;
  v123 = v186;
  v124 = v187;
  v125 = v188;
  v126 = v142;
  *(_QWORD *)&v179 = v142;
  *(_OWORD *)(v120 + 64) = v183;
  *(_OWORD *)(v120 + 80) = v121;
  LOBYTE(v116) = v151;
  *(_BYTE *)(v120 + 160) = v151;
  *(_OWORD *)(v120 + 128) = v124;
  *(_OWORD *)(v120 + 144) = v125;
  *(_OWORD *)(v120 + 96) = v122;
  *(_OWORD *)(v120 + 112) = v123;
  v127 = v179;
  v128 = v180;
  v129 = v182;
  *(_OWORD *)(v120 + 32) = v181;
  *(_OWORD *)(v120 + 48) = v129;
  *(_OWORD *)v120 = v127;
  *(_OWORD *)(v120 + 16) = v128;
  v189 = v116;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v131 = v149;
  v130 = v150;
  v132 = v148;
  sub_2303BB454(v150, v149, v169, v148);
  sub_2303BB490(v118, v119, v134);
  swift_bridgeObjectRetain();
  sub_2303BB4A0((uint64_t)&v179);
  sub_2303BB5B4((uint64_t)v166, &qword_255E73860);
  *(_QWORD *)&v190 = v126;
  *((_QWORD *)&v190 + 1) = v156;
  v191 = v135;
  v192 = v155;
  v193 = v136;
  v194 = v158;
  v195 = v137;
  v196 = v157;
  v197 = v138;
  v198 = v164;
  v199 = v152;
  v200 = v162;
  v201 = v153;
  v202 = v161;
  v203 = v160;
  v204 = v159;
  v205 = v95;
  v206 = v97;
  v207 = v99;
  v208 = v101;
  v209 = v151;
  sub_2303BB4C8((uint64_t)&v190);
  sub_2303BAF98(v118, v119, v171);
  swift_bridgeObjectRelease();
  sub_2303BB4F0(v130, v131, v169, v132);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_2303BB5B4(v165, &qword_255E73860);
}

__n128 sub_2303B96EC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2303C0A7C();
    v23 = (void *)sub_2303C07D0();
    sub_2303C05D8();

  }
  sub_2303C0650();
  sub_2303BB570(v13, a9, &qword_255E73768);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255E73770) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

id sub_2303B98A8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2303C0A7C();
    v25 = (void *)sub_2303C07D0();
    sub_2303C05D8();

  }
  sub_2303C0650();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(_QWORD *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;
  return a16;
}

void sub_2303B9A5C(void *a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  void *v6;
  _QWORD v7[6];

  v4 = swift_allocObject();
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 48) = *(_QWORD *)(a2 + 32);
  v7[4] = sub_2303BB184;
  v7[5] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2303B9C08;
  v7[3] = &block_descriptor_0;
  v6 = _Block_copy(v7);
  sub_2303BAA80(a2);
  swift_release();
  objc_msgSend(a1, sel_squareLogoDataForDesiredSize_completion_, v6, 86.0, 86.0);
  _Block_release(v6);
}

uint64_t sub_2303B9B34(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  void *v8;

  if (a2 >> 60 != 15)
  {
    v6 = result;
    v7 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_2303BB1FC(v6, a2);
    sub_2303BAA80(a4);
    v8 = (void *)sub_2303C04C4();
    objc_msgSend(v7, sel_initWithData_, v8);

    __swift_instantiateConcreteTypeFromMangledName(&qword_255E73840);
    sub_2303C0968();
    sub_2303BB1A4(v6, a2);
    return sub_2303BB254(a4);
  }
  return result;
}

uint64_t sub_2303B9C08(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_2303C04D0();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_2303BB1A4((uint64_t)v4, v8);
  return swift_release();
}

uint64_t sub_2303B9C9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  _QWORD v49[2];
  char v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;

  v4 = sub_2303B7B18();
  v30 = *(_QWORD *)(a1 + 8);
  v31 = v4;
  v28 = *(_QWORD *)(a1 + 16);
  v29 = v5;
  swift_bridgeObjectRetain();
  v27 = sub_2303C08F0();
  sub_2303C09A4();
  sub_2303C0650();
  v6 = v69;
  v7 = v73;
  v25 = v75;
  v26 = v71;
  v23 = v79;
  v24 = v77;
  v21 = v82;
  v22 = v81;
  LOBYTE(a1) = sub_2303C07DC();
  sub_2303C0608();
  v37 = v70;
  v36 = v72;
  v35 = v74;
  v34 = v76;
  v33 = v78;
  v32 = v80;
  *(_QWORD *)&v38 = v27;
  *((_QWORD *)&v38 + 1) = v69;
  LOBYTE(v39) = v70;
  *((_QWORD *)&v39 + 1) = v71;
  LOBYTE(v40) = v72;
  *((_QWORD *)&v40 + 1) = v73;
  LOBYTE(v41) = v74;
  *((_QWORD *)&v41 + 1) = v75;
  LOBYTE(v42) = v76;
  *((_QWORD *)&v42 + 1) = v77;
  LOBYTE(v43) = v78;
  *((_QWORD *)&v43 + 1) = v79;
  LOBYTE(v44) = v80;
  *((_QWORD *)&v44 + 1) = v81;
  *(_QWORD *)&v45 = v82;
  BYTE8(v45) = a1;
  *(_QWORD *)&v46 = v8;
  *((_QWORD *)&v46 + 1) = v9;
  *(_QWORD *)&v47 = v10;
  *((_QWORD *)&v47 + 1) = v11;
  v48 = 0;
  v12 = v43;
  v13 = v44;
  *(_OWORD *)(a2 + 96) = v42;
  *(_OWORD *)(a2 + 112) = v12;
  v14 = v45;
  v15 = v46;
  v16 = v47;
  *(_BYTE *)(a2 + 192) = 0;
  *(_OWORD *)(a2 + 160) = v15;
  *(_OWORD *)(a2 + 176) = v16;
  *(_OWORD *)(a2 + 128) = v13;
  *(_OWORD *)(a2 + 144) = v14;
  v17 = v38;
  v18 = v39;
  v19 = v41;
  *(_OWORD *)(a2 + 64) = v40;
  *(_OWORD *)(a2 + 80) = v19;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v18;
  *(_QWORD *)a2 = v31;
  *(_QWORD *)(a2 + 8) = v29;
  *(_QWORD *)(a2 + 16) = v30;
  *(_QWORD *)(a2 + 24) = v28;
  v49[0] = v27;
  v49[1] = v6;
  v50 = v37;
  v51 = v26;
  v52 = v36;
  v53 = v7;
  v54 = v35;
  v55 = v25;
  v56 = v34;
  v57 = v24;
  v58 = v33;
  v59 = v23;
  v60 = v32;
  v61 = v22;
  v62 = v21;
  v63 = a1;
  v64 = v8;
  v65 = v9;
  v66 = v10;
  v67 = v11;
  v68 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2303BB4A0((uint64_t)&v38);
  sub_2303BB4C8((uint64_t)v49);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2303B9EE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t KeyPath;
  uint64_t *v43;
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
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;

  v62 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73808);
  MEMORY[0x24BDAC7A8](v1);
  v61 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73810);
  MEMORY[0x24BDAC7A8](v59);
  v4 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_2303C0644();
  MEMORY[0x24BDAC7A8](v57);
  v6 = (__int128 *)((char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_2303C08E4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73818);
  MEMORY[0x24BDAC7A8](v56);
  v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73820);
  MEMORY[0x24BDAC7A8](v58);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73828);
  MEMORY[0x24BDAC7A8](v60);
  v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73830);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2303C1AB0;
  v18 = *MEMORY[0x24BDF3C28];
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v19(v10, v18, v7);
  *(_QWORD *)(v17 + 32) = MEMORY[0x2348B83B0](v10, 0.6392, 0.6627, 0.7176, 1.0);
  v19(v10, v18, v7);
  *(_QWORD *)(v17 + 40) = MEMORY[0x2348B83B0](v10, 0.5215, 0.5411, 0.5843, 1.0);
  *(_QWORD *)&v67 = v17;
  sub_2303C0A58();
  sub_2303C09C8();
  sub_2303C09D4();
  v20 = swift_bridgeObjectRetain();
  MEMORY[0x2348B8434](v20);
  sub_2303C062C();
  v21 = v63;
  v55 = v64;
  v22 = v65;
  v23 = v66;
  swift_bridgeObjectRelease();
  v24 = (char *)v6 + *(int *)(v57 + 20);
  v25 = *MEMORY[0x24BDEEB68];
  v26 = sub_2303C0704();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v24, v25, v26);
  __asm { FMOV            V0.2D, #18.0 }
  *v6 = _Q0;
  sub_2303BB050((uint64_t)v6, (uint64_t)v4);
  *(_WORD *)&v4[*(int *)(v59 + 36)] = 256;
  sub_2303BB570((uint64_t)v4, (uint64_t)&v12[*(int *)(v56 + 36)], &qword_255E73810);
  *(_QWORD *)v12 = v21;
  *(_OWORD *)(v12 + 8) = v55;
  *((_QWORD *)v12 + 3) = v22;
  *((_QWORD *)v12 + 4) = v23;
  swift_bridgeObjectRetain();
  sub_2303BB5B4((uint64_t)v4, &qword_255E73810);
  sub_2303BB094((uint64_t)v6);
  sub_2303BB0D0((uint64_t)&v63);
  sub_2303C09A4();
  sub_2303C0620();
  sub_2303BB570((uint64_t)v12, (uint64_t)v14, &qword_255E73818);
  v32 = &v14[*(int *)(v58 + 36)];
  v33 = v68;
  *(_OWORD *)v32 = v67;
  *((_OWORD *)v32 + 1) = v33;
  *((_OWORD *)v32 + 2) = v69;
  sub_2303BB5B4((uint64_t)v12, &qword_255E73818);
  v34 = sub_2303C09A4();
  v36 = v35;
  v37 = sub_2303C092C();
  v38 = sub_2303C08FC();
  v39 = sub_2303C0824();
  v40 = (uint64_t)v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v61, 1, 1, v39);
  v41 = sub_2303C0830();
  sub_2303BB5B4(v40, &qword_255E73808);
  KeyPath = swift_getKeyPath();
  sub_2303BB570((uint64_t)v14, (uint64_t)v16, &qword_255E73820);
  v43 = (uint64_t *)&v16[*(int *)(v60 + 36)];
  *v43 = v37;
  v43[1] = v38;
  v43[2] = KeyPath;
  v43[3] = v41;
  v43[4] = v34;
  v43[5] = v36;
  sub_2303BB5B4((uint64_t)v14, &qword_255E73820);
  LOBYTE(v34) = sub_2303C07E8();
  sub_2303C0608();
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = v62;
  sub_2303BB570((uint64_t)v16, v62, &qword_255E73828);
  v53 = v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255E73838) + 36);
  *(_BYTE *)v53 = v34;
  *(_QWORD *)(v53 + 8) = v45;
  *(_QWORD *)(v53 + 16) = v47;
  *(_QWORD *)(v53 + 24) = v49;
  *(_QWORD *)(v53 + 32) = v51;
  *(_BYTE *)(v53 + 40) = 0;
  return sub_2303BB5B4((uint64_t)v16, &qword_255E73828);
}

uint64_t sub_2303BA458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  sub_2303B7484();
  swift_bridgeObjectRetain();
  v9 = sub_2303C0890();
  v11 = v10;
  v13 = v12 & 1;
  sub_2303C0818();
  sub_2303C080C();
  swift_release();
  v14 = sub_2303C0878();
  v38 = v15;
  v39 = v14;
  v36 = v16;
  v37 = v17;
  swift_release();
  sub_2303BAF98(v9, v11, v13);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v19 = swift_getKeyPath();
  v20 = sub_2303C07DC();
  sub_2303C0608();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  result = sub_2303C09A4();
  v30 = result;
  v32 = v31;
  if (a4)
  {
    v33 = HIBYTE(a4) & 0xF;
    v34 = a3;
    if ((a4 & 0x2000000000000000) == 0)
      v33 = a3 & 0xFFFFFFFFFFFFLL;
    if (v33)
    {
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
    }
    else
    {
      a1 = 0;
      a2 = 0;
      v34 = 0;
      a4 = 0;
    }
  }
  else
  {
    a1 = 0;
    a2 = 0;
    v34 = 0;
  }
  *(_QWORD *)a5 = v39;
  *(_QWORD *)(a5 + 8) = v38;
  *(_BYTE *)(a5 + 16) = v36 & 1;
  *(_QWORD *)(a5 + 24) = v37;
  *(_QWORD *)(a5 + 32) = KeyPath;
  *(_QWORD *)(a5 + 40) = 0;
  *(_BYTE *)(a5 + 48) = 1;
  *(_QWORD *)(a5 + 56) = v19;
  *(_WORD *)(a5 + 64) = 1;
  *(_BYTE *)(a5 + 66) = 1;
  *(_BYTE *)(a5 + 72) = v20;
  *(_QWORD *)(a5 + 80) = v22;
  *(_QWORD *)(a5 + 88) = v24;
  *(_QWORD *)(a5 + 96) = v26;
  *(_QWORD *)(a5 + 104) = v28;
  *(_BYTE *)(a5 + 112) = 0;
  *(_QWORD *)(a5 + 120) = a1;
  *(_QWORD *)(a5 + 128) = a2;
  *(_QWORD *)(a5 + 136) = v34;
  *(_QWORD *)(a5 + 144) = a4;
  *(_QWORD *)(a5 + 152) = v30;
  *(_QWORD *)(a5 + 160) = v32;
  return result;
}

uint64_t sub_2303BA648@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2303BA458(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2303BA654()
{
  return sub_2303C068C();
}

uint64_t sub_2303BA674(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73760);
  MEMORY[0x24BDAC7A8](v2);
  sub_2303BB570(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_255E73760);
  return sub_2303C0698();
}

uint64_t sub_2303BA6F8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2303BA740(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_2303BA784()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73798;
  if (!qword_255E73798)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73780);
    v2[0] = sub_2303BA808();
    v2[1] = sub_2303BBA2C(&qword_255E737C0, &qword_255E737C8, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73798);
  }
  return result;
}

unint64_t sub_2303BA808()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E737A0;
  if (!qword_255E737A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73778);
    v2[0] = sub_2303BA88C();
    v2[1] = sub_2303BBA2C(&qword_255E737B8, &qword_255E73740, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E737A0);
  }
  return result;
}

unint64_t sub_2303BA88C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E737A8;
  if (!qword_255E737A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73770);
    v2[0] = sub_2303BBA2C(&qword_255E737B0, &qword_255E73768, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E737A8);
  }
  return result;
}

unint64_t sub_2303BA910()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E737D0;
  if (!qword_255E737D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73750);
    v2[0] = sub_2303BA994();
    v2[1] = sub_2303BBA2C(&qword_255E737C0, &qword_255E737C8, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E737D0);
  }
  return result;
}

unint64_t sub_2303BA994()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E737D8;
  if (!qword_255E737D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73748);
    v2[0] = sub_2303BBA2C(&qword_255E737E0, &qword_255E737E8, MEMORY[0x24BDF4700]);
    v2[1] = sub_2303BBA2C(&qword_255E737B8, &qword_255E73740, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E737D8);
  }
  return result;
}

uint64_t sub_2303BAA30()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2303BAA74()
{
  uint64_t v0;

  sub_2303B9A5C(*(void **)(v0 + 16), v0 + 24);
}

uint64_t sub_2303BAA80(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 24);
  swift_retain();
  v4 = v2;
  swift_bridgeObjectRetain();
  v5 = v3;
  return a1;
}

uint64_t sub_2303BAAC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for BrandHeaderView(id *a1)
{

  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for BrandHeaderView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  a1[4] = *(_QWORD *)(a2 + 32);
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = v5;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BrandHeaderView(uint64_t a1, uint64_t a2)
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

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 24);
  v8 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BrandHeaderView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BrandHeaderView(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BrandHeaderView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for BrandHeaderView()
{
  return &type metadata for BrandHeaderView;
}

unint64_t sub_2303BAD24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E737F8;
  if (!qword_255E737F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73800);
    v2[0] = sub_2303BB2A0(&qword_255E73790, &qword_255E73788, (uint64_t (*)(void))sub_2303BA784, MEMORY[0x24BDF0910]);
    v2[1] = sub_2303BA910();
    result = MEMORY[0x2348B8974](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E737F8);
  }
  return result;
}

uint64_t destroy for CopyableTitle()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CopyableTitle(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for CopyableTitle(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for CopyableTitle(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for CopyableTitle(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CopyableTitle(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CopyableTitle()
{
  return &type metadata for CopyableTitle;
}

ValueMetadata *type metadata accessor for PlaceholderLogo()
{
  return &type metadata for PlaceholderLogo;
}

uint64_t sub_2303BAF78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2303BAF88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2303BAF98(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_2303BAFA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2303C06A4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2303BAFD8()
{
  return sub_2303C06B0();
}

uint64_t sub_2303BB004@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2303C065C();
  *a1 = result;
  return result;
}

uint64_t sub_2303BB02C()
{
  return sub_2303C0668();
}

uint64_t sub_2303BB050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2303C0644();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2303BB094(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2303C0644();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2303BB0D0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2303BB0F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2303C0674();
  *a1 = result;
  return result;
}

uint64_t sub_2303BB120()
{
  swift_retain();
  return sub_2303C0680();
}

uint64_t sub_2303BB148()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2303BB184(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2303B9B34(a1, a2, a3, v3 + 16);
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

uint64_t sub_2303BB1A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2303BB1B8(a1, a2);
  return a1;
}

uint64_t sub_2303BB1B8(uint64_t a1, unint64_t a2)
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

uint64_t sub_2303BB1FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2303BB210(a1, a2);
  return a1;
}

uint64_t sub_2303BB210(uint64_t a1, unint64_t a2)
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

uint64_t sub_2303BB254(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_2303BB2A0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2303BB308()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73870;
  if (!qword_255E73870)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73848);
    v2[0] = sub_2303BB2A0(&qword_255E73878, &qword_255E73880, (uint64_t (*)(void))sub_2303BB3AC, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_2303BBA2C(&qword_255E73898, &qword_255E73810, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73870);
  }
  return result;
}

unint64_t sub_2303BB3AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73888;
  if (!qword_255E73888)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73890);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73888);
  }
  return result;
}

unint64_t sub_2303BB410()
{
  unint64_t result;

  result = qword_255E738A0;
  if (!qword_255E738A0)
  {
    result = MEMORY[0x2348B8974](&unk_2303C1BB4, &type metadata for PlaceholderLogo);
    atomic_store(result, (unint64_t *)&qword_255E738A0);
  }
  return result;
}

uint64_t sub_2303BB454(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2303BB490(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2303BB490(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_2303BB4A0(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_2303BB4C8(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_2303BB4F0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2303BAF98(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2303BB52C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2303BB570(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2303BB5B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2303BB5F0()
{
  unint64_t result;

  result = qword_255E738B0;
  if (!qword_255E738B0)
  {
    result = MEMORY[0x2348B8974](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255E738B0);
  }
  return result;
}

unint64_t sub_2303BB638()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E738B8;
  if (!qword_255E738B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E738C0);
    v2[0] = sub_2303BB2A0(&qword_255E738C8, &qword_255E738D0, sub_2303BB6DC, MEMORY[0x24BDECC60]);
    v2[1] = sub_2303BBA2C(&qword_255E73928, &qword_255E73930, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E738B8);
  }
  return result;
}

uint64_t sub_2303BB6DC()
{
  return sub_2303BB2A0(&qword_255E738D8, &qword_255E738E0, (uint64_t (*)(void))sub_2303BB700, MEMORY[0x24BDEDB80]);
}

unint64_t sub_2303BB700()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E738E8;
  if (!qword_255E738E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E738F0);
    v2[0] = sub_2303BB784();
    v2[1] = sub_2303BBA2C(&qword_255E73918, &qword_255E73920, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E738E8);
  }
  return result;
}

unint64_t sub_2303BB784()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255E738F8;
  if (!qword_255E738F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73900);
    v2 = sub_2303BBA2C(&qword_255E73908, &qword_255E73910, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255E738F8);
  }
  return result;
}

uint64_t sub_2303BB808()
{
  return sub_2303BB2A0(&qword_255E73938, &qword_255E73838, (uint64_t (*)(void))sub_2303BB83C, MEMORY[0x24BDECC60]);
}

unint64_t sub_2303BB83C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73940;
  if (!qword_255E73940)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73828);
    v2[0] = sub_2303BB2A0(&qword_255E73948, &qword_255E73820, (uint64_t (*)(void))sub_2303BB8E0, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_2303BBA2C(&qword_255E73980, &qword_255E73988, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73940);
  }
  return result;
}

unint64_t sub_2303BB8E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73950;
  if (!qword_255E73950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73818);
    v2[0] = sub_2303BB964();
    v2[1] = sub_2303BBA2C(&qword_255E73898, &qword_255E73810, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73950);
  }
  return result;
}

unint64_t sub_2303BB964()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73958;
  if (!qword_255E73958)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73960);
    v2[0] = sub_2303BB9E8();
    v2[1] = sub_2303BBA2C(&qword_255E73970, &qword_255E73978, MEMORY[0x24BDF0710]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73958);
  }
  return result;
}

unint64_t sub_2303BB9E8()
{
  unint64_t result;

  result = qword_255E73968;
  if (!qword_255E73968)
  {
    result = MEMORY[0x2348B8974](MEMORY[0x24BDF52D0], MEMORY[0x24BDF52F8]);
    atomic_store(result, (unint64_t *)&qword_255E73968);
  }
  return result;
}

uint64_t sub_2303BBA2C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348B8974](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2303BBA74(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  objc_class *v5;
  id v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v13;

  *(_QWORD *)&v1[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction] = 0;
  v3 = &v1[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v1[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip];
  v5 = (objc_class *)type metadata accessor for BrandCardCopyMenu();
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v13.receiver = v1;
  v13.super_class = v5;
  v6 = objc_msgSendSuper2(&v13, sel_initWithCoder_, a1);
  if (!v6)
    goto LABEL_4;
  v7 = objc_allocWithZone(MEMORY[0x24BEBD5B0]);
  v8 = (char *)v6;
  v9 = objc_msgSend(v7, sel_initWithDelegate_, v8);
  v10 = OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction;
  v11 = *(void **)&v8[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction];
  *(_QWORD *)&v8[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction] = v9;

  if (*(_QWORD *)&v8[v10])
  {
    objc_msgSend(v8, sel_addInteraction_);
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD740]), sel_initWithTarget_action_, v8, sel_handleLongPress_);
    objc_msgSend(v12, sel_setMinimumPressDuration_, 0.3);
    objc_msgSend(v8, sel_addGestureRecognizer_, v12);

    a1 = v12;
LABEL_4:

    return;
  }
  __break(1u);
}

void sub_2303BBC8C()
{
  char *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD5B0]), sel_initWithDelegate_, v0);
  v2 = OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction;
  v3 = *(void **)&v0[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction];
  *(_QWORD *)&v0[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction] = v1;

  if (*(_QWORD *)&v0[v2])
  {
    objc_msgSend(v0, sel_addInteraction_);
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD740]), sel_initWithTarget_action_, v0, sel_handleLongPress_);
    objc_msgSend(v4, sel_setMinimumPressDuration_, 0.3);
    objc_msgSend(v0, sel_addGestureRecognizer_, v4);

  }
  else
  {
    __break(1u);
  }
}

void sub_2303BBDA0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  id v6;

  v5 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
  if (*(_QWORD *)(a2 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v6 = (id)sub_2303C09E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, sel_setString_, v6);

}

id sub_2303BBEA4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BrandCardCopyMenu();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BrandCardCopyMenu()
{
  return objc_opt_self();
}

char *sub_2303BBF44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v9;
  char *v10;
  char *v11;

  type metadata accessor for BrandCardCopyMenu();
  v9 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v10 = &v9[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name];
  *(_QWORD *)v10 = a2;
  *((_QWORD *)v10 + 1) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = &v9[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip];
  *(_QWORD *)v11 = a4;
  *((_QWORD *)v11 + 1) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v9;
}

char *sub_2303BBFE4(uint64_t a1)
{
  uint64_t *v1;

  return sub_2303BBF44(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_2303BC004()
{
  return sub_2303C0740();
}

uint64_t sub_2303BC044()
{
  sub_2303BC5A0();
  return sub_2303C07A0();
}

uint64_t sub_2303BC094()
{
  sub_2303BC5A0();
  return sub_2303C074C();
}

void sub_2303BC0E4()
{
  sub_2303BC5A0();
  sub_2303C0794();
  __break(1u);
}

void sub_2303BC108()
{
  char *v0;
  double MidX;
  double MinY;
  id v3;
  id v4;
  CGRect v5;
  CGRect v6;

  objc_msgSend(v0, sel_bounds);
  MidX = CGRectGetMidX(v5);
  objc_msgSend(v0, sel_bounds);
  MinY = CGRectGetMinY(v6);
  CGPointMake(MidX, MinY);
  sub_2303BC504(0, &qword_255E73A48);
  v4 = (id)sub_2303C0A94();
  v3 = *(id *)&v0[OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction];
  objc_msgSend(v3, sel_presentEditMenuWithConfiguration_, v4);

}

uint64_t sub_2303BC1D8()
{
  void *v0;
  objc_class *v1;
  id v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  sub_2303BC504(0, &qword_255E73A30);
  v1 = (objc_class *)type metadata accessor for FrameworkBundleAnchor();
  v2 = objc_msgSend(objc_allocWithZone(v1), sel_init);
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);

  sub_2303C047C();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v0;
  v7 = v0;
  v8 = sub_2303C0AAC();
  v9 = objc_msgSend(objc_allocWithZone(v1), sel_init, 0, 0, 0, sub_2303BC4C4, v6);
  swift_getObjectType();
  v10 = objc_msgSend(v4, sel_bundleForClass_, swift_getObjCClassFromMetadata());

  sub_2303C047C();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v11 = v7;
  v12 = sub_2303C0AAC();
  sub_2303BC504(0, &qword_255E73A38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73A40);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2303C1CF0;
  *(_QWORD *)(v13 + 32) = v8;
  *(_QWORD *)(v13 + 40) = v12;
  sub_2303C0A58();
  return sub_2303C0AA0();
}

uint64_t sub_2303BC4A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2303BC4C4(uint64_t a1)
{
  uint64_t v1;

  sub_2303BBDA0(a1, *(_QWORD *)(v1 + 16), &OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name);
}

void sub_2303BC4E4(uint64_t a1)
{
  uint64_t v1;

  sub_2303BBDA0(a1, *(_QWORD *)(v1 + 16), &OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip);
}

uint64_t sub_2303BC504(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for BrandCardCopyMenuViewRepresentable()
{
  return &type metadata for BrandCardCopyMenuViewRepresentable;
}

uint64_t sub_2303BC54C()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_2303BC55C()
{
  unint64_t result;

  result = qword_255E73A50;
  if (!qword_255E73A50)
  {
    result = MEMORY[0x2348B8974](&unk_2303C1D44, &type metadata for BrandCardCopyMenuViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_255E73A50);
  }
  return result;
}

unint64_t sub_2303BC5A0()
{
  unint64_t result;

  result = qword_255E73A58;
  if (!qword_255E73A58)
  {
    result = MEMORY[0x2348B8974](&unk_2303C1D94, &type metadata for BrandCardCopyMenuViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_255E73A58);
  }
  return result;
}

id sub_2303BC624()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FrameworkBundleAnchor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FrameworkBundleAnchor()
{
  return objc_opt_self();
}

uint64_t sub_2303BC674(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t String;
  void *v16;
  uint64_t v18;

  v2 = sub_2303C050C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73AE8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2303C0500();
  sub_2303C04F4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = sub_2303C04E8();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2303BC864((uint64_t)v8);
  }
  else
  {
    sub_2303C04DC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    sub_2303C0A10();
    swift_bridgeObjectRelease();
  }
  v11 = (void *)sub_2303C09E0();
  v12 = (void *)sub_2303C09E0();
  swift_bridgeObjectRelease();
  v13 = (void *)CFPhoneNumberCreate();

  if (!v13)
    goto LABEL_8;
  v14 = v13;
  String = CFPhoneNumberCreateString();
  if (!String)
  {

LABEL_8:
    swift_bridgeObjectRetain();
    return a1;
  }
  v16 = (void *)String;
  a1 = sub_2303C09EC();

  return a1;
}

uint64_t sub_2303BC864(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73AE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2303BC8A4()
{
  uint64_t v0;

  v0 = sub_2303C05FC();
  __swift_allocate_value_buffer(v0, qword_255E742D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_255E742D0);
  return sub_2303C05F0();
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

uint64_t BrandCardDetailView.init(brand:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2303BC96C(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
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

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
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
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_2303C09BC();
  }
  MEMORY[0x24BDAC7A8](a1);
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
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_2303C09BC();
}

id sub_2303BCB20(int a1, id a2)
{
  id result;
  id v3;
  double v4;
  void *v5;
  __int128 v6;
  __int128 v7;

  result = objc_msgSend(a2, sel_hoursConfig);
  if (result)
  {
    sub_2303C0AE8();
    swift_unknownObjectRelease();
    sub_2303BF8B0(&v6, &v7);
    sub_2303BF8C0();
    swift_dynamicCast();
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63FD0]), sel_initWithBusinessHoursConfiguration_, v5);

    LODWORD(v4) = 1144750080;
    objc_msgSend(v3, sel_setContentHuggingPriority_forAxis_, 1, v4);
    objc_msgSend(v3, sel_setDirectionalLayoutMargins_, *MEMORY[0x24BEBD250], *(double *)(MEMORY[0x24BEBD250] + 8), *(double *)(MEMORY[0x24BEBD250] + 16), *(double *)(MEMORY[0x24BEBD250] + 24));
    objc_msgSend(v3, sel_setBottomHairlineHidden_, 1);
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2303BCC28(int a1)
{
  id *v1;

  return sub_2303BCB20(a1, *v1);
}

uint64_t sub_2303BCC30(uint64_t a1, char a2, int a3, int a4, id a5)
{
  uint64_t v7;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(a5, sel_intrinsicContentSize);
    a1 = v7;
  }
  objc_msgSend(a5, sel_intrinsicContentSize);
  return a1;
}

uint64_t sub_2303BCC88()
{
  sub_2303BF8FC();
  return sub_2303C07A0();
}

uint64_t sub_2303BCCD8()
{
  sub_2303BF8FC();
  return sub_2303C074C();
}

void sub_2303BCD28()
{
  sub_2303BF8FC();
  sub_2303C0794();
  __break(1u);
}

uint64_t BrandCardRowView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  void (*v24)(char *, uint64_t);
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
  __int128 v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];
  __int128 v41;
  __int128 v42;
  char v43;

  v29 = a1;
  v33 = a2;
  v28 = *(_QWORD *)(a1 + 16);
  swift_getTupleTypeMetadata2();
  v27 = sub_2303C09B0();
  v26 = MEMORY[0x2348B8974](MEMORY[0x24BDF5428], v27);
  v3 = sub_2303C0980();
  v30 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v26 - v4;
  v6 = sub_2303C0638();
  v32 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73AF0);
  v9 = sub_2303C0638();
  v31 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - v13;
  v15 = *v2;
  v16 = v2[3];
  sub_2303C071C();
  v17 = *(_QWORD *)(v29 + 24);
  v34 = v28;
  v35 = v17;
  v36 = v15;
  v37 = *(_OWORD *)(v2 + 1);
  v38 = v16;
  sub_2303C0974();
  v18 = MEMORY[0x2348B8974](MEMORY[0x24BDF4700], v3);
  sub_2303C08D8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v3);
  v41 = xmmword_2303C1E50;
  v42 = xmmword_2303C1E50;
  v43 = 0;
  v40[0] = v18;
  v40[1] = MEMORY[0x24BDECC60];
  v19 = MEMORY[0x24BDED308];
  v20 = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v6, v40);
  sub_2303C08B4();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v6);
  v21 = sub_2303BBA2C(&qword_255E73AF8, &qword_255E73AF0, MEMORY[0x24BDEFB48]);
  v39[0] = v20;
  v39[1] = v21;
  MEMORY[0x2348B8974](v19, v9, v39);
  v22 = v31;
  v23 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v23(v14, v12, v9);
  v24 = *(void (**)(char *, uint64_t))(v22 + 8);
  v24(v12, v9);
  v23(v33, v14, v9);
  return ((uint64_t (*)(char *, uint64_t))v24)(v14, v9);
}

uint64_t sub_2303BD054@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51[5];

  v41 = a4;
  v42 = a5;
  v39 = a3;
  v40 = a2;
  v43 = a6;
  v38 = *(_QWORD *)(a4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v37 - v10;
  v47 = v9;
  v48 = v11;
  sub_2303B7484();
  swift_bridgeObjectRetain();
  v12 = sub_2303C0890();
  v14 = v13;
  v16 = v15 & 1;
  sub_2303C0908();
  v17 = sub_2303C0860();
  v19 = v18;
  v21 = v20;
  swift_release();
  v22 = v21 & 1;
  sub_2303BAF98(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_2303C07F4();
  v23 = sub_2303C0878();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  swift_release();
  LOBYTE(v12) = v27 & 1;
  sub_2303BAF98(v17, v19, v22);
  v30 = swift_bridgeObjectRelease();
  v40(v30);
  v32 = v37;
  v31 = v38;
  v33 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v34 = v41;
  v33(v37, v8, v41);
  v35 = *(void (**)(char *, uint64_t))(v31 + 8);
  v35(v8, v34);
  v47 = v23;
  v48 = v25;
  v49 = v12;
  v50 = v29;
  v51[0] = (uint64_t)&v47;
  v33(v8, v32, v34);
  v51[1] = (uint64_t)v8;
  sub_2303BB490(v23, v25, v12);
  swift_bridgeObjectRetain();
  v46[0] = MEMORY[0x24BDF1FA8];
  v46[1] = v34;
  v44 = MEMORY[0x24BDF1F80];
  v45 = v42;
  sub_2303BC96C(v51, 2uLL, (uint64_t)v46);
  v35(v32, v34);
  sub_2303BAF98(v23, v25, v12);
  swift_bridgeObjectRelease();
  v35(v8, v34);
  sub_2303BAF98(v47, v48, v49);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2303BD2BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2303BD054(*(_QWORD *)(v1 + 32), *(void (**)(uint64_t))(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t BrandCardDetailView.body.getter@<X0>(uint64_t a1@<X8>)
{
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
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
  char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  id v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  v53 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B08);
  MEMORY[0x24BDAC7A8](v5);
  v52 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B10);
  MEMORY[0x24BDAC7A8](v49);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B18);
  v50 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)&v42 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B20);
  MEMORY[0x24BDAC7A8](v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B28);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v42 - v18;
  v20 = *v1;
  if (*v1)
  {
    v45 = v2;
    v46 = v5;
    v47 = v4;
    v44 = v20;
    v21 = objc_msgSend(v44, sel_localizedDescription);
    v43 = v9;
    if (v21)
    {
      v22 = v21;
      v23 = sub_2303C09EC();
      v25 = v24;

      MEMORY[0x24BDAC7A8](v26);
      *(&v42 - 2) = v23;
      *(&v42 - 1) = v25;
      sub_2303BD8D8();
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B60);
      v28 = sub_2303BF4A8();
      v54 = v27;
      v55 = v28;
      swift_getOpaqueTypeConformance2();
      sub_2303C098C();
      swift_bridgeObjectRelease();
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B38);
      v30 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v19, 0, 1, v29);
    }
    else
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B38);
      v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v19, 1, 1, v32);
    }
    MEMORY[0x24BDAC7A8](v30);
    v33 = v44;
    *(&v42 - 2) = (uint64_t)v44;
    sub_2303BF1C4((uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B40);
    sub_2303BF3F8();
    sub_2303BBA2C(&qword_255E73B50, &qword_255E73B40, MEMORY[0x24BDF5428]);
    v34 = v51;
    sub_2303C098C();
    sub_2303BB570((uint64_t)v19, (uint64_t)v17, &qword_255E73B28);
    v35 = v50;
    v36 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
    v37 = v48;
    v38 = v43;
    v36(v48, v34, v43);
    v39 = v52;
    sub_2303BB570((uint64_t)v17, v52, &qword_255E73B28);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B58);
    v36((char *)(v39 + *(int *)(v40 + 48)), v37, v38);
    v41 = *(void (**)(char *, uint64_t))(v35 + 8);
    v41(v37, v38);
    sub_2303BB5B4((uint64_t)v17, &qword_255E73B28);
    sub_2303BB570(v39, (uint64_t)v47, &qword_255E73B08);
    swift_storeEnumTagMultiPayload();
    sub_2303BBA2C(&qword_255E73B30, &qword_255E73B08, MEMORY[0x24BDF5428]);
    sub_2303C07B8();

    sub_2303BB5B4(v39, &qword_255E73B08);
    v41(v34, v38);
    return sub_2303BB5B4((uint64_t)v19, &qword_255E73B28);
  }
  else
  {
    *v4 = sub_2303C08F0();
    swift_storeEnumTagMultiPayload();
    sub_2303BBA2C(&qword_255E73B30, &qword_255E73B08, MEMORY[0x24BDF5428]);
    return sub_2303C07B8();
  }
}

__n128 sub_2303BD7F0@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  __n128 result;

  sub_2303B7484();
  swift_bridgeObjectRetain();
  v2 = sub_2303C0890();
  v4 = v3;
  v6 = v5 & 1;
  sub_2303C0800();
  v7 = sub_2303C0878();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_2303BAF98(v2, v4, v6);
  swift_bridgeObjectRelease();
  a1->n128_u64[0] = v7;
  a1->n128_u64[1] = v9;
  a1[1].n128_u8[0] = v11 & 1;
  a1[1].n128_u64[1] = v13;
  __asm { FMOV            V0.2D, #16.0 }
  a1[2] = result;
  a1[3] = result;
  a1[4].n128_u8[0] = 0;
  return result;
}

uint64_t sub_2303BD8D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  char v21;

  v0 = sub_2303C0614();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);

  v7 = sub_2303C047C();
  v9 = v8;

  v15 = v7;
  v16 = v9;
  sub_2303B7484();
  v15 = sub_2303C0890();
  v16 = v10;
  v17 = v11 & 1;
  v18 = v12;
  v19 = xmmword_2303C1E60;
  v20 = xmmword_2303C1E70;
  v21 = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDEB1C0], v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E73B60);
  sub_2303BF4A8();
  sub_2303C08CC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2303BAF98(v15, v16, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2303BDAA4@<X0>(char *a1@<X0>, _QWORD *a2@<X8>)
{
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
  char *v14;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  id v38;
  uint64_t ObjCClassFromMetadata;
  id v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, char *, uint64_t);
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  char *v89;
  void (*v90)(char *, char *, uint64_t);
  char *v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  void *v114;
  void (*v115)(uint64_t, uint64_t, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t (*v124)();
  id v125;
  void *v126;
  char *v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  void *v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  double (*v144)@<D0>(uint64_t@<X8>);
  uint64_t v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t (*v150)();
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  _QWORD v172[2];
  uint64_t (*v173)@<X0>(uint64_t@<X8>);
  uint64_t v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t (*v181)@<X0>(uint64_t@<X8>);
  uint64_t (*v182)();
  uint64_t (*v183)();
  uint64_t v184;
  uint64_t (*v185)();
  uint64_t v186;
  uint64_t v187;
  uint64_t (*v188)();
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  _OWORD v207[2];

  v175 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E736B8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v180 = (char *)v172 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v172 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v172 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v172 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v172 - v15;
  v17 = sub_2303C04B8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v179 = (uint64_t)v172 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v197 = (char *)v172 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v199 = (uint64_t)v172 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v200 = (uint64_t)v172 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v172 - v28;
  v192 = v30;
  MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)v172 - v31;
  v33 = objc_msgSend(a1, sel_website);
  v196 = v29;
  if (!v33)
  {
    v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v37(v16, 1, 1, v17);
    goto LABEL_5;
  }
  v34 = v33;
  v201 = v11;
  v202 = (uint64_t)v8;
  sub_2303C0494();

  v35 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v35(v16, v29, v17);
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v36(v16, 0, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    v37 = v36;
    v11 = v201;
    v8 = (char *)v202;
LABEL_5:
    sub_2303BB5B4((uint64_t)v16, &qword_255E736B8);
    v191 = 0;
    v190 = 0;
    v188 = 0;
    v189 = 0;
    goto LABEL_7;
  }
  v35(v32, v16, v17);
  v38 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v40 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);

  v191 = sub_2303C047C();
  v190 = v41;

  v35(v29, v32, v17);
  v42 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v189 = swift_allocObject();
  v35((char *)(v189 + v42), v29, v17);
  v188 = sub_2303BFA08;
  v37 = v36;
  v11 = v201;
  v8 = (char *)v202;
LABEL_7:
  v43 = objc_msgSend(a1, sel_primaryPhoneNumber);
  v193 = v18;
  if (!v43)
  {
LABEL_14:
    v187 = 0;
    v185 = 0;
    v186 = 0;
    v202 = 1;
    v54 = (uint64_t)v196;
    goto LABEL_17;
  }
  v44 = v43;
  v45 = sub_2303C09EC();
  v47 = v46;

  v48 = HIBYTE(v47) & 0xF;
  if ((v47 & 0x2000000000000000) == 0)
    v48 = v45 & 0xFFFFFFFFFFFFLL;
  if (!v48)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v198 = (uint64_t)v37;
  v49 = v11;
  v201 = a1;
  *(_QWORD *)&v207[0] = v45;
  *((_QWORD *)&v207[0] + 1) = v47;
  v205 = 980182388;
  v206 = 0xE400000000000000;
  v203 = 0;
  v204 = 0xE000000000000000;
  sub_2303B7484();
  v50 = sub_2303C0ADC();
  swift_bridgeObjectRelease();
  v195 = sub_2303BC674(v50);
  v52 = v51;
  *(_QWORD *)&v207[0] = 980182388;
  *((_QWORD *)&v207[0] + 1) = 0xE400000000000000;
  sub_2303C0A28();
  swift_bridgeObjectRelease();
  sub_2303C04AC();
  swift_bridgeObjectRelease();
  v53 = v193;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v193 + 48))(v14, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2303BB5B4((uint64_t)v14, &qword_255E736B8);
    v187 = 0;
    v202 = 0;
    v185 = 0;
    v186 = 0;
    a1 = v201;
    v54 = (uint64_t)v196;
  }
  else
  {
    v55 = *(void (**)(uint64_t, char *, uint64_t))(v53 + 32);
    v56 = v200;
    v55(v200, v14, v17);
    v57 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    v58 = swift_getObjCClassFromMetadata();
    v59 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v58);

    v187 = sub_2303C047C();
    v202 = v60;

    v54 = (uint64_t)v196;
    v55((uint64_t)v196, (char *)v56, v17);
    v61 = (*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
    v62 = swift_allocObject();
    *(_QWORD *)(v62 + 16) = v195;
    *(_QWORD *)(v62 + 24) = v52;
    v186 = v62;
    v55(v62 + v61, (char *)v54, v17);
    v185 = sub_2303BFA4C;
    a1 = v201;
  }
  v11 = v49;
  v37 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v198;
LABEL_17:
  v63 = objc_msgSend(a1, sel_messageNumber);
  if (!v63)
  {
LABEL_24:
    v200 = 0;
    v201 = 0;
    v183 = 0;
    v184 = 0;
    v69 = v193;
    goto LABEL_26;
  }
  v64 = v63;
  v65 = sub_2303C09EC();
  v67 = v66;

  v68 = HIBYTE(v67) & 0xF;
  if ((v67 & 0x2000000000000000) == 0)
    v68 = v65 & 0xFFFFFFFFFFFFLL;
  if (!v68)
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  sub_2303C04AC();
  v69 = v193;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v193 + 48))(v11, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2303BB5B4((uint64_t)v11, &qword_255E736B8);
    v200 = 0;
    v201 = 0;
    v183 = 0;
    v184 = 0;
  }
  else
  {
    v70 = *(void (**)(uint64_t, char *, uint64_t))(v69 + 32);
    v71 = v199;
    v70(v199, v11, v17);
    *(_QWORD *)&v207[0] = v65;
    *((_QWORD *)&v207[0] + 1) = v67;
    v205 = 980643187;
    v206 = 0xE400000000000000;
    v203 = 0;
    v204 = 0xE000000000000000;
    sub_2303B7484();
    v72 = sub_2303C0ADC();
    swift_bridgeObjectRelease();
    v73 = sub_2303BC674(v72);
    v75 = v74;
    swift_bridgeObjectRelease();
    v76 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    v77 = swift_getObjCClassFromMetadata();
    v78 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v77);

    v79 = sub_2303C047C();
    v200 = v80;
    v201 = (char *)v79;

    v69 = v193;
    v70((uint64_t)v196, (char *)v71, v17);
    v81 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
    v82 = swift_allocObject();
    *(_QWORD *)(v82 + 16) = v73;
    *(_QWORD *)(v82 + 24) = v75;
    v184 = v82;
    v70(v82 + v81, v196, v17);
    v54 = (uint64_t)v196;
    v183 = sub_2303BFA4C;
  }
LABEL_26:
  v83 = objc_msgSend(a1, sel_emailAddress);
  if (!v83)
  {
LABEL_33:
    v199 = 0;
    v182 = 0;
    v197 = 0;
    v198 = 1;
    goto LABEL_35;
  }
  v84 = v83;
  v85 = sub_2303C09EC();
  v87 = v86;

  v88 = HIBYTE(v87) & 0xF;
  if ((v87 & 0x2000000000000000) == 0)
    v88 = v85 & 0xFFFFFFFFFFFFLL;
  if (!v88)
  {
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  v89 = a1;
  *(_QWORD *)&v207[0] = v85;
  *((_QWORD *)&v207[0] + 1) = v87;
  v205 = 0x3A6F746C69616DLL;
  v206 = 0xE700000000000000;
  v203 = 0;
  v204 = 0xE000000000000000;
  sub_2303B7484();
  sub_2303C0ADC();
  *(_QWORD *)&v207[0] = 0x3A6F746C69616DLL;
  *((_QWORD *)&v207[0] + 1) = 0xE700000000000000;
  sub_2303C0A28();
  v69 = v193;
  swift_bridgeObjectRelease();
  sub_2303C04AC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v8, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2303BB5B4((uint64_t)v8, &qword_255E736B8);
    v198 = 0;
    v199 = 0;
    v182 = 0;
    v197 = 0;
    v54 = (uint64_t)v196;
  }
  else
  {
    v90 = *(void (**)(char *, char *, uint64_t))(v69 + 32);
    v91 = v197;
    v90(v197, v8, v17);
    v92 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    v93 = swift_getObjCClassFromMetadata();
    v94 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v93);

    v95 = sub_2303C047C();
    v198 = v96;
    v199 = v95;

    v69 = v193;
    v97 = v37;
    v98 = (uint64_t)v196;
    v90(v196, v91, v17);
    v99 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
    v100 = swift_allocObject();
    *(_QWORD *)(v100 + 16) = v85;
    *(_QWORD *)(v100 + 24) = v87;
    v197 = (char *)v100;
    v90((char *)(v100 + v99), (char *)v98, v17);
    v182 = sub_2303BFA4C;
    a1 = v89;
    v54 = v98;
    v37 = v97;
  }
LABEL_35:
  v101 = objc_msgSend(a1, sel_address);
  if (v101)
  {
    v102 = v101;
    v103 = sub_2303C09EC();
    v105 = v104;

    v106 = HIBYTE(v105) & 0xF;
    if ((v105 & 0x2000000000000000) == 0)
      v106 = v103 & 0xFFFFFFFFFFFFLL;
    if (v106)
    {
      v107 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
      swift_getObjectType();
      v108 = swift_getObjCClassFromMetadata();
      v109 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v108);

      v110 = sub_2303C047C();
      v195 = v111;
      v196 = (char *)v110;

      v69 = v193;
      v112 = swift_allocObject();
      *(_QWORD *)(v112 + 16) = v103;
      *(_QWORD *)(v112 + 24) = v105;
      v194 = v112;
      v181 = sub_2303BFA30;
      goto LABEL_42;
    }
    swift_bridgeObjectRelease();
  }
  v195 = 0;
  v196 = 0;
  v181 = 0;
  v194 = 0;
LABEL_42:
  v113 = objc_msgSend(a1, sel_termsAndConditionsURL);
  if (v113)
  {
    v114 = v113;
    sub_2303C0494();

    v115 = *(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32);
    v116 = (uint64_t)v180;
    v115((uint64_t)v180, v54, v17);
    v37((char *)v116, 0, 1, v17);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v116, 1, v17) != 1)
    {
      v117 = v54;
      v118 = v179;
      v115(v179, v116, v17);
      v119 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
      swift_getObjectType();
      v120 = swift_getObjCClassFromMetadata();
      v121 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v120);

      v180 = (char *)sub_2303C047C();
      v193 = v122;

      v115(v117, v118, v17);
      v123 = (*(unsigned __int8 *)(v69 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
      v192 = swift_allocObject();
      v115(v192 + v123, v117, v17);
      v124 = sub_2303BFA08;
      goto LABEL_47;
    }
  }
  else
  {
    v116 = (uint64_t)v180;
    v37(v180, 1, 1, v17);
  }
  sub_2303BB5B4(v116, &qword_255E736B8);
  v180 = 0;
  v192 = 0;
  v193 = 0;
  v124 = 0;
LABEL_47:
  v125 = objc_msgSend(a1, sel_localizedResponseTime);
  if (v125)
  {
    v126 = v125;
    v127 = a1;
    v128 = sub_2303C09EC();
    v130 = v129;

    v131 = HIBYTE(v130) & 0xF;
    if ((v130 & 0x2000000000000000) == 0)
      v131 = v128 & 0xFFFFFFFFFFFFLL;
    if (v131)
    {
      v132 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
      swift_getObjectType();
      v133 = swift_getObjCClassFromMetadata();
      v134 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v133);

      v179 = sub_2303C047C();
      v178 = v135;

      v136 = swift_allocObject();
      *(_QWORD *)(v136 + 16) = v128;
      *(_QWORD *)(v136 + 24) = v130;
      v177 = v136;
      v173 = sub_2303BFBE4;
    }
    else
    {
      swift_bridgeObjectRelease();
      v179 = 0;
      v178 = 0;
      v173 = 0;
      v177 = 0;
    }
    a1 = v127;
  }
  else
  {
    v179 = 0;
    v178 = 0;
    v173 = 0;
    v177 = 0;
  }
  if (objc_msgSend(a1, sel_hoursConfig))
  {
    sub_2303C0AE8();
    swift_unknownObjectRelease();
    sub_2303BB5B4((uint64_t)v207, &qword_255E73C20);
    v137 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
    swift_getObjectType();
    v138 = a1;
    v139 = swift_getObjCClassFromMetadata();
    v140 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v139);

    v174 = sub_2303C047C();
    v176 = v141;

    v142 = swift_allocObject();
    *(_QWORD *)(v142 + 16) = v138;
    v143 = v138;
    v144 = sub_2303BF9FC;
  }
  else
  {
    memset(v207, 0, sizeof(v207));
    sub_2303BB5B4((uint64_t)v207, &qword_255E73C20);
    v174 = 0;
    v176 = 0;
    v144 = 0;
    v142 = 0;
  }
  v145 = v191;
  v146 = v175;
  *v175 = v191;
  v147 = v145;
  v191 = v145;
  v148 = v190;
  v146[1] = v190;
  v149 = v148;
  v190 = v148;
  v150 = v188;
  v146[2] = v188;
  v188 = v150;
  v151 = v189;
  v146[3] = v189;
  v189 = v151;
  v152 = v187;
  v153 = v202;
  v146[4] = v187;
  v146[5] = v153;
  v154 = v186;
  v146[6] = v185;
  v146[7] = v154;
  v186 = v154;
  v155 = v200;
  v146[8] = v201;
  v146[9] = v155;
  v156 = v184;
  v146[10] = v183;
  v146[11] = v156;
  v184 = v156;
  v157 = v198;
  v146[12] = v199;
  v146[13] = v157;
  v158 = v197;
  v146[14] = v182;
  v146[15] = v158;
  v159 = v195;
  v146[16] = v196;
  v146[17] = v159;
  v160 = v194;
  v146[18] = v181;
  v146[19] = v160;
  v161 = v193;
  v146[20] = v180;
  v146[21] = v161;
  v172[0] = v124;
  v162 = v192;
  v146[22] = v124;
  v146[23] = v162;
  v163 = v178;
  v146[24] = v179;
  v146[25] = v163;
  v164 = v177;
  v146[26] = v173;
  v146[27] = v164;
  v165 = v174;
  v166 = v176;
  v146[28] = v174;
  v146[29] = v166;
  v146[30] = v144;
  v146[31] = v142;
  v172[1] = v142;
  sub_2303BF95C(v147, v149);
  sub_2303BF940(v152, v202);
  sub_2303BF95C((uint64_t)v201, v200);
  sub_2303BF940(v199, v198);
  sub_2303BF95C((uint64_t)v196, v195);
  v167 = (uint64_t)v180;
  sub_2303BF95C((uint64_t)v180, v193);
  v168 = v179;
  v169 = v178;
  sub_2303BF95C(v179, v178);
  v170 = v176;
  sub_2303BF95C(v165, v176);
  sub_2303BF98C(v165, v170);
  sub_2303BF98C(v168, v169);
  sub_2303BF98C(v167, v193);
  sub_2303BF98C((uint64_t)v196, v195);
  sub_2303BF9BC(v199, v198);
  sub_2303BF98C((uint64_t)v201, v200);
  sub_2303BF9BC(v187, v202);
  return sub_2303BF98C(v191, v190);
}

uint64_t sub_2303BEEA4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_2303BDAA4(*(char **)(v1 + 16), a1);
}

uint64_t sub_2303BEEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v6 = sub_2303C04B8();
  MEMORY[0x24BDAC7A8](v6);
  v10[0] = a1;
  v10[1] = a2;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  sub_2303B7484();
  swift_bridgeObjectRetain();
  return sub_2303C0854();
}

uint64_t sub_2303BEF64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[2];

  v4 = sub_2303C04B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73C28);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2303C04A0();
  if (v13)
    v14 = v12;
  else
    v14 = 0;
  v15 = 0xE000000000000000;
  if (v13)
    v15 = v13;
  v17[0] = v14;
  v17[1] = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_2303B7484();
  sub_2303C0854();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v11, v8);
}

uint64_t sub_2303BF07C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_2303B7484();
  swift_bridgeObjectRetain();
  result = sub_2303C0890();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

__n128 sub_2303BF0E4@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  __n128 result;
  _QWORD v19[2];
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  __n128 v31;

  v3 = a1;
  v4 = sub_2303C09A4();
  sub_2303B98A8(0.0, 0, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v19, 0.0, 1, 0.0, 1, v4, v5, v3);

  v6 = v19[1];
  v7 = v20;
  v8 = v21;
  v9 = v22;
  v10 = v23;
  v11 = v24;
  v12 = v25;
  v13 = v26;
  v14 = v27;
  v15 = v28;
  v16 = v29;
  v17 = v30;
  result = v31;
  *(_QWORD *)a2 = v19[0];
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7;
  *(_QWORD *)(a2 + 24) = v8;
  *(_BYTE *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 40) = v10;
  *(_BYTE *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 56) = v12;
  *(_BYTE *)(a2 + 64) = v13;
  *(_QWORD *)(a2 + 72) = v14;
  *(_BYTE *)(a2 + 80) = v15;
  *(_QWORD *)(a2 + 88) = v16;
  *(_BYTE *)(a2 + 96) = v17;
  *(__n128 *)(a2 + 104) = result;
  return result;
}

uint64_t sub_2303BF1C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v2 = sub_2303C0614();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E73C18);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FrameworkBundleAnchor()), sel_init);
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);

  v13 = sub_2303C047C();
  v15 = v14;

  v21 = v13;
  v22 = v15;
  sub_2303B7484();
  v21 = sub_2303C0890();
  v22 = v16;
  v23 = v17 & 1;
  v24 = v18;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDEB1C0], v2);
  sub_2303C08CC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2303BAF98(v21, v22, v23);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  v19 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255E73B10) + 36);
  *(_OWORD *)v19 = xmmword_2303C1E60;
  *(_OWORD *)(v19 + 16) = xmmword_2303C1E70;
  *(_BYTE *)(v19 + 32) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_2303BF3F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_255E73B48;
  if (!qword_255E73B48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73B10);
    v2[2] = MEMORY[0x24BDF1FA8];
    v2[3] = MEMORY[0x24BDF1F80];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_2303BBA2C(&qword_255E73AF8, &qword_255E73AF0, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73B48);
  }
  return result;
}

double sub_2303BF4A0@<D0>(__n128 *a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_2303BD7F0(a1).n128_u64[0];
  return result;
}

unint64_t sub_2303BF4A8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255E73B68[0];
  if (!qword_255E73B68[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73B60);
    v2 = sub_2303BBA2C(&qword_255E73AF8, &qword_255E73AF0, MEMORY[0x24BDEFB48]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, qword_255E73B68);
  }
  return result;
}

uint64_t sub_2303BF52C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2303BF560()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2303BF574()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2303BF57C()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2303BF5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_2303BF5EC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2303BF650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for BrandCardRowView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BrandCardRowView);
}

ValueMetadata *type metadata accessor for BrandCardDetailView()
{
  return &type metadata for BrandCardDetailView;
}

uint64_t sub_2303BF6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[2];

  swift_getTupleTypeMetadata2();
  v0 = sub_2303C09B0();
  MEMORY[0x2348B8974](MEMORY[0x24BDF5428], v0);
  v1 = sub_2303C0980();
  v2 = sub_2303C0638();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73AF0);
  v3 = sub_2303C0638();
  v7[0] = MEMORY[0x2348B8974](MEMORY[0x24BDF4700], v1);
  v7[1] = MEMORY[0x24BDECC60];
  v4 = MEMORY[0x24BDED308];
  v6[0] = MEMORY[0x2348B8974](MEMORY[0x24BDED308], v2, v7);
  v6[1] = sub_2303BBA2C(&qword_255E73AF8, &qword_255E73AF0, MEMORY[0x24BDEFB48]);
  return MEMORY[0x2348B8974](v4, v3, v6);
}

unint64_t sub_2303BF7D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E73BF0;
  if (!qword_255E73BF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E73BF8);
    v2[0] = sub_2303BBA2C(&qword_255E73B30, &qword_255E73B08, MEMORY[0x24BDF5428]);
    v2[1] = MEMORY[0x24BDF3E20];
    result = MEMORY[0x2348B8974](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E73BF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HoursView()
{
  return &type metadata for HoursView;
}

unint64_t sub_2303BF86C()
{
  unint64_t result;

  result = qword_255E73C00;
  if (!qword_255E73C00)
  {
    result = MEMORY[0x2348B8974](&unk_2303C1F80, &type metadata for HoursView);
    atomic_store(result, (unint64_t *)&qword_255E73C00);
  }
  return result;
}

_OWORD *sub_2303BF8B0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2303BF8C0()
{
  unint64_t result;

  result = qword_255E73C08;
  if (!qword_255E73C08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E73C08);
  }
  return result;
}

unint64_t sub_2303BF8FC()
{
  unint64_t result;

  result = qword_255E73C10;
  if (!qword_255E73C10)
  {
    result = MEMORY[0x2348B8974](&unk_2303C1FD0, &type metadata for HoursView);
    atomic_store(result, (unint64_t *)&qword_255E73C10);
  }
  return result;
}

uint64_t sub_2303BF940(uint64_t result, uint64_t a2)
{
  if (a2 != 1)
    return sub_2303BF95C(result, a2);
  return result;
}

uint64_t sub_2303BF95C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2303BF98C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_2303BF9BC(uint64_t result, uint64_t a2)
{
  if (a2 != 1)
    return sub_2303BF98C(result, a2);
  return result;
}

uint64_t sub_2303BF9D8()
{
  uint64_t v0;

  return swift_deallocObject();
}

double sub_2303BF9FC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_2303BF0E4((void *)*(_QWORD *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_2303BFA0C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2303BFA30@<X0>(uint64_t a1@<X8>)
{
  return sub_2303BF07C(a1);
}

uint64_t sub_2303BFA54()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_2303C04B8() - 8) + 80);
  return sub_2303BEEAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t objectdestroy_13Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2303C04B8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2303C04B8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2303BFB74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_2303C04B8() - 8) + 80);
  return sub_2303BEF64(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2348B88FC](a1, v6, a5);
}

uint64_t sub_2303C0464()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_2303C0470()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2303C047C()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2303C0488()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2303C0494()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2303C04A0()
{
  return MEMORY[0x24BDCD9D0]();
}

uint64_t sub_2303C04AC()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2303C04B8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2303C04C4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2303C04D0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2303C04DC()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_2303C04E8()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_2303C04F4()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_2303C0500()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2303C050C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2303C0518()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2303C0524()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_2303C0530()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2303C053C()
{
  return MEMORY[0x24BDCF558]();
}

uint64_t sub_2303C0548()
{
  return MEMORY[0x24BDCF5B8]();
}

uint64_t sub_2303C0554()
{
  return MEMORY[0x24BDCF5D8]();
}

uint64_t sub_2303C0560()
{
  return MEMORY[0x24BE0FF28]();
}

uint64_t sub_2303C056C()
{
  return MEMORY[0x24BE0FF38]();
}

uint64_t sub_2303C0578()
{
  return MEMORY[0x24BE0FF48]();
}

uint64_t sub_2303C0584()
{
  return MEMORY[0x24BE0FF50]();
}

uint64_t sub_2303C0590()
{
  return MEMORY[0x24BE0FF68]();
}

uint64_t sub_2303C059C()
{
  return MEMORY[0x24BE0FF80]();
}

uint64_t sub_2303C05A8()
{
  return MEMORY[0x24BE0FF90]();
}

uint64_t sub_2303C05B4()
{
  return MEMORY[0x24BE0FFA0]();
}

uint64_t sub_2303C05C0()
{
  return MEMORY[0x24BE0FFA8]();
}

uint64_t sub_2303C05CC()
{
  return MEMORY[0x24BE0FFB0]();
}

uint64_t sub_2303C05D8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2303C05E4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2303C05F0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2303C05FC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2303C0608()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2303C0614()
{
  return MEMORY[0x24BDEB1C8]();
}

uint64_t sub_2303C0620()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2303C062C()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_2303C0638()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_2303C0644()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_2303C0650()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2303C065C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_2303C0668()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_2303C0674()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2303C0680()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2303C068C()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_2303C0698()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_2303C06A4()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2303C06B0()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2303C06BC()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_2303C06C8()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_2303C06D4()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_2303C06E0()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_2303C06EC()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_2303C06F8()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_2303C0704()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_2303C0710()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2303C071C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2303C0728()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_2303C0734()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_2303C0740()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_2303C074C()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_2303C0758()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_2303C0764()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_2303C0770()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_2303C077C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_2303C0788()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_2303C0794()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_2303C07A0()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_2303C07AC()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_2303C07B8()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2303C07C4()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_2303C07D0()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2303C07DC()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2303C07E8()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2303C07F4()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2303C0800()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2303C080C()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_2303C0818()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_2303C0824()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_2303C0830()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_2303C083C()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_2303C0848()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_2303C0854()
{
  return MEMORY[0x24BDF19C8]();
}

uint64_t sub_2303C0860()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_2303C086C()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_2303C0878()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2303C0884()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_2303C0890()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2303C089C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2303C08A8()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2303C08B4()
{
  return MEMORY[0x24BDF2628]();
}

uint64_t sub_2303C08C0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2303C08CC()
{
  return MEMORY[0x24BDF2948]();
}

uint64_t sub_2303C08D8()
{
  return MEMORY[0x24BDF37D0]();
}

uint64_t sub_2303C08E4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_2303C08F0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2303C08FC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2303C0908()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2303C0914()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_2303C0920()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_2303C092C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2303C0938()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_2303C0944()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2303C0950()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2303C095C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2303C0968()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2303C0974()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_2303C0980()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_2303C098C()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_2303C0998()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_2303C09A4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2303C09B0()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_2303C09BC()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_2303C09C8()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_2303C09D4()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_2303C09E0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2303C09EC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2303C09F8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2303C0A04()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2303C0A10()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2303C0A1C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2303C0A28()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2303C0A34()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2303C0A40()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2303C0A4C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2303C0A58()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2303C0A64()
{
  return MEMORY[0x24BDBD758]();
}

uint64_t sub_2303C0A70()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2303C0A7C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2303C0A88()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2303C0A94()
{
  return MEMORY[0x24BEBCD90]();
}

uint64_t sub_2303C0AA0()
{
  return MEMORY[0x24BEBCFA0]();
}

uint64_t sub_2303C0AAC()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_2303C0AB8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2303C0AC4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2303C0AD0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2303C0ADC()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2303C0AE8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2303C0AF4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2303C0B00()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2303C0B0C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2303C0B18()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2303C0B24()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2303C0B30()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2303C0B3C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2303C0B48()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2303C0B54()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE1FA98]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x24BE1FAA0]();
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x24BE3C9F8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x24BDAEB18](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

