uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
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

uint64_t HealthPluginAdvertisableFeatureSourceProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HealthPluginAdvertisableFeatureSourceProvider.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1BC0A4454(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[2];

  v3 = *v1;
  v4 = sub_1BC0C6C4C();
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BC0C691C();
  v40 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6B80();
  sub_1BC0C6B74();
  v10 = sub_1BC0C6ACC();
  swift_release();
  v41 = a1;
  v42 = v3;
  v36[1] = v3;
  v11 = sub_1BC0A63A0(v10, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BC0A50E0);
  swift_bridgeObjectRelease();
  v44[0] = MEMORY[0x1E0DEE9D8];
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v12; ++i)
    {
      v14 = swift_bridgeObjectRetain();
      sub_1BC0A5B4C(v14);
    }
    swift_bridgeObjectRelease_n();
    v15 = v44[0];
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x1E0DEE9D8];
  }
  v16 = *(_QWORD *)(v15 + 16);
  v17 = MEMORY[0x1E0DEE9D8];
  v37 = v15;
  if (v16)
  {
    v36[0] = v6;
    v44[0] = MEMORY[0x1E0DEE9D8];
    sub_1BC0A5CA8(0, v16, 0);
    v18 = v15 + 40;
    do
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1BC0C69B8();
      v19 = sub_1BC0C6910();
      v21 = v20;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v7);
      swift_unknownObjectRelease();
      v17 = v44[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BC0A5CA8(0, *(_QWORD *)(v17 + 16) + 1, 1);
        v17 = v44[0];
      }
      v23 = *(_QWORD *)(v17 + 16);
      v22 = *(_QWORD *)(v17 + 24);
      if (v23 >= v22 >> 1)
      {
        sub_1BC0A5CA8(v22 > 1, v23 + 1, 1);
        v17 = v44[0];
      }
      *(_QWORD *)(v17 + 16) = v23 + 1;
      v24 = v17 + 16 * v23;
      *(_QWORD *)(v24 + 32) = v19;
      *(_QWORD *)(v24 + 40) = v21;
      v18 += 16;
      --v16;
    }
    while (v16);
    v6 = (char *)v36[0];
  }
  v44[0] = v17;
  sub_1BC0A68DC(0, (unint64_t *)&qword_1ED6A7A60, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0A65E4();
  v25 = sub_1BC0C6EA4();
  v27 = v26;
  swift_bridgeObjectRelease();
  sub_1BC0C6C10();
  swift_bridgeObjectRetain();
  v28 = sub_1BC0C6C40();
  v29 = sub_1BC0C6FD0();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    v31 = v6;
    v32 = swift_slowAlloc();
    v44[0] = v32;
    *(_DWORD *)v30 = 136315394;
    v33 = sub_1BC0C72AC();
    v43 = sub_1BC0A54E4(v33, v34, v44);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    swift_bridgeObjectRetain();
    v43 = sub_1BC0A54E4(v25, v27, v44);
    sub_1BC0C709C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BC0A2000, v28, v29, "%s: retrieved available advertisable feature sources with identifiers: %{public}s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v32, -1, -1);
    MEMORY[0x1BCCEAE98](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v39);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
  }
  return v37;
}

uint64_t sub_1BC0A48AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSString *v22;
  Class v23;
  uint64_t ObjCClassMetadata;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  id v42;
  void *v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v0 = sub_1BC0C6C4C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v4 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x1E0C80A78](v2);
  v7 = (char *)&v62 - v6;
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v62 - v8;
  v10 = (void *)sub_1BC0C6AB4();
  v11 = objc_msgSend(v10, sel_infoDictionary);

  if (!v11)
  {
    v67 = 0u;
    v68 = 0u;
    goto LABEL_18;
  }
  v12 = sub_1BC0C6E80();

  v13 = sub_1BC0C6928();
  if (!*(_QWORD *)(v12 + 16) || (v15 = sub_1BC0B7EFC(v13, v14), (v16 & 1) == 0))
  {
    v67 = 0u;
    v68 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_1BC0A6848(*(_QWORD *)(v12 + 56) + 32 * v15, (uint64_t)&v67);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v68 + 1))
  {
LABEL_18:
    sub_1BC0A6884((uint64_t)&v67);
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    sub_1BC0C6C10();
    swift_retain_n();
    v29 = sub_1BC0C6C40();
    v30 = sub_1BC0C6FAC();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      *(_QWORD *)&v67 = v32;
      *(_DWORD *)v31 = 136315650;
      v33 = sub_1BC0C72AC();
      v64 = v1;
      v65 = sub_1BC0A54E4(v33, v34, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      v63 = v0;
      *(_WORD *)(v31 + 12) = 2082;
      v35 = sub_1BC0C6AA8();
      v65 = sub_1BC0A54E4(v35, v36, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 22) = 2082;
      v37 = sub_1BC0C6928();
      v65 = sub_1BC0A54E4(v37, v38, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v29, v30, "%s: %{public}s plugin does not support %{public}s", (uint8_t *)v31, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v32, -1, -1);
      MEMORY[0x1BCCEAE98](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v9, v63);
      return 0;
    }

    swift_release_n();
    v39 = *(void (**)(char *, uint64_t))(v1 + 8);
    v40 = v9;
LABEL_22:
    v39(v40, v0);
    return 0;
  }
  v64 = v1;
  v18 = v65;
  v17 = v66;
  v19 = (void *)sub_1BC0C6AB4();
  *(_QWORD *)&v67 = 0;
  v20 = objc_msgSend(v19, sel_loadAndReturnError_, &v67);

  if (!v20)
  {
    v42 = (id)v67;
    swift_bridgeObjectRelease();
    v43 = (void *)sub_1BC0C661C();

    swift_willThrow();
    sub_1BC0C6C10();
    swift_retain();
    v44 = v43;
    swift_retain();
    v45 = v43;
    v46 = sub_1BC0C6C40();
    v47 = sub_1BC0C6FB8();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = swift_slowAlloc();
      v63 = swift_slowAlloc();
      *(_QWORD *)&v67 = v63;
      *(_DWORD *)v48 = 136315650;
      v49 = sub_1BC0C72AC();
      v65 = sub_1BC0A54E4(v49, v50, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2082;
      v51 = sub_1BC0C6AA8();
      v65 = sub_1BC0A54E4(v51, v52, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 22) = 2080;
      swift_getErrorValue();
      v53 = sub_1BC0C724C();
      v65 = sub_1BC0A54E4(v53, v54, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1BC0A2000, v46, v47, "%s: %{public}s unable to load bundle with error: %s", (uint8_t *)v48, 0x20u);
      v55 = v63;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v55, -1, -1);
      MEMORY[0x1BCCEAE98](v48, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v39 = *(void (**)(char *, uint64_t))(v64 + 8);
    v40 = v4;
    goto LABEL_22;
  }
  v21 = (id)v67;
  v22 = (NSString *)sub_1BC0C6EBC();
  v23 = NSClassFromString(v22);

  if (!v23
    || ((ObjCClassMetadata = swift_getObjCClassMetadata(), (v25 = swift_conformsToProtocol2()) != 0)
      ? (v26 = v25)
      : (v26 = 0),
        v25 ? (v27 = ObjCClassMetadata) : (v27 = 0),
        !v27))
  {
    sub_1BC0C6C10();
    swift_bridgeObjectRetain();
    v56 = sub_1BC0C6C40();
    v57 = sub_1BC0C6FB8();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = swift_slowAlloc();
      v63 = swift_slowAlloc();
      *(_QWORD *)&v67 = v63;
      *(_DWORD *)v58 = 136315394;
      v59 = sub_1BC0C72AC();
      v65 = sub_1BC0A54E4(v59, v60, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v58 + 12) = 2080;
      swift_bridgeObjectRetain();
      v65 = sub_1BC0A54E4(v18, v17, (uint64_t *)&v67);
      sub_1BC0C709C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BC0A2000, v56, v57, "%s: %s does not conform to AdvertisableFeaturePluginProviding", (uint8_t *)v58, 0x16u);
      v61 = v63;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v61, -1, -1);
      MEMORY[0x1BCCEAE98](v58, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v39 = *(void (**)(char *, uint64_t))(v64 + 8);
    v40 = v7;
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  *((_QWORD *)&v68 + 1) = v27;
  v69 = v26;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v67);
  sub_1BC0C6A48();
  v28 = sub_1BC0C6A3C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v67);
  return v28;
}

uint64_t sub_1BC0A50E0()
{
  return sub_1BC0A48AC();
}

uint64_t HealthPluginAdvertisableFeatureSourceProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HealthPluginAdvertisableFeatureSourceProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1BC0A5100@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for HealthPluginAdvertisableFeatureSourceProvider();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_1BC0A5130(uint64_t a1)
{
  return sub_1BC0A4454(a1);
}

uint64_t sub_1BC0A5150(uint64_t a1, uint64_t a2)
{
  return sub_1BC0A5370(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1BC0A515C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1BC0C6EC8();
  *a2 = 0;
  return result;
}

uint64_t sub_1BC0A51D0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1BC0C6ED4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BC0A524C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1BC0C6EE0();
  v2 = sub_1BC0C6EBC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BC0A528C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BC0C6EBC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BC0A52D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1BC0C6EE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BC0A52F8()
{
  sub_1BC0A66C4(&qword_1EF3EF170, (uint64_t)&unk_1BC0C79A0);
  sub_1BC0A66C4(&qword_1EF3EF178, (uint64_t)"!\n>+|/");
  return sub_1BC0C721C();
}

uint64_t sub_1BC0A5364(uint64_t a1, uint64_t a2)
{
  return sub_1BC0A5370(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1BC0A5370(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BC0C6EE0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BC0A53AC()
{
  sub_1BC0C6EE0();
  sub_1BC0C6F04();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0A53EC()
{
  uint64_t v0;

  sub_1BC0C6EE0();
  sub_1BC0C7288();
  sub_1BC0C6F04();
  v0 = sub_1BC0C7294();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BC0A545C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1BC0C6EE0();
  v2 = v1;
  if (v0 == sub_1BC0C6EE0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1BC0C7234();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BC0A54E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1BC0A55B4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BC0A6848((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1BC0A6848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1BC0A55B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BC0C70A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1BC0A576C(a5, a6);
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
  v8 = sub_1BC0C7168();
  if (!v8)
  {
    sub_1BC0C71BC();
    __break(1u);
LABEL_17:
    result = sub_1BC0C7210();
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

uint64_t sub_1BC0A576C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BC0A5800(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BC0A59EC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1BC0A59EC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BC0A5800(uint64_t a1, unint64_t a2)
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
      v3 = sub_1BC0A5974(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1BC0C7150();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1BC0C71BC();
      __break(1u);
LABEL_10:
      v2 = sub_1BC0C6F1C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1BC0C7210();
    __break(1u);
LABEL_14:
    result = sub_1BC0C71BC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1BC0A5974(uint64_t a1, uint64_t a2)
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
  sub_1BC0A68DC(0, &qword_1ED6A8628, MEMORY[0x1E0DEDE70], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BC0A59EC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1BC0A68DC(0, &qword_1ED6A8628, MEMORY[0x1E0DEDE70], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0A5B4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1BC0C37A0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  sub_1BC0A67F8();
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0A5CA8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1BC0A5D18(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1BC0A5CC4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1BC0A5E94(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1BC0A5CE0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1BC0A6024(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1BC0A5CFC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1BC0A6210(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1BC0A5D18(char a1, int64_t a2, char a3, char *a4)
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
    sub_1BC0A68DC(0, (unint64_t *)&unk_1ED6A7A70, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0A5E94(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_1BC0A67AC(0, &qword_1EF3EF188, (void (*)(uint64_t))sub_1BC0A67F8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_1BC0A67F8();
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0A6024(char a1, int64_t a2, char a3, _QWORD *a4)
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  sub_1BC0A67AC(0, &qword_1EF3EF180, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  v10 = *(_QWORD *)(sub_1BC0C6634() - 8);
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
  v16 = *(_QWORD *)(sub_1BC0C6634() - 8);
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
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0A6210(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    sub_1BC0A67AC(0, &qword_1ED6A8208, (void (*)(uint64_t))sub_1BC0A674C);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8)
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    sub_1BC0A674C();
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0A63A0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t i;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v22 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (!v6)
    goto LABEL_7;
LABEL_4:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v10 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_retain();
    v16 = a2(v13, v14, v15);
    swift_release();
    result = swift_bridgeObjectRelease();
    if (v16)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1BC0C38C0(0, v22[2] + 1, 1, v22);
        v22 = (_QWORD *)result;
      }
      v21 = v22[2];
      v20 = v22[3];
      if (v21 >= v20 >> 1)
      {
        result = (uint64_t)sub_1BC0C38C0((_QWORD *)(v20 > 1), v21 + 1, 1, v22);
        v22 = (_QWORD *)result;
      }
      v22[2] = v21 + 1;
      v22[v21 + 4] = v16;
      if (v6)
        goto LABEL_4;
    }
    else if (v6)
    {
      goto LABEL_4;
    }
LABEL_7:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v17 >= v7)
      goto LABEL_29;
    v18 = *(_QWORD *)(v23 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v7)
        goto LABEL_29;
      v18 = *(_QWORD *)(v23 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v7)
          goto LABEL_29;
        v18 = *(_QWORD *)(v23 + 8 * v9);
        if (!v18)
        {
          v9 = v17 + 3;
          if (v17 + 3 >= v7)
            goto LABEL_29;
          v18 = *(_QWORD *)(v23 + 8 * v9);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v18 - 1) & v18;
  }
  v19 = v17 + 4;
  if (v19 >= v7)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v22;
  }
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v7)
      goto LABEL_29;
    v18 = *(_QWORD *)(v23 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_1BC0A65E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF3EF048;
  if (!qword_1EF3EF048)
  {
    sub_1BC0A68DC(255, (unint64_t *)&qword_1ED6A7A60, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EF3EF048);
  }
  return result;
}

uint64_t type metadata accessor for HealthPluginAdvertisableFeatureSourceProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthPluginAdvertisableFeatureSourceProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthPluginAdvertisableFeatureSourceProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of HealthPluginAdvertisableFeatureSourceProvider.determineAdvertisableFeatures(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

void type metadata accessor for Name(uint64_t a1)
{
  sub_1BC0A68DC(a1, &qword_1EF3EF150, (uint64_t)&unk_1E74A8300, MEMORY[0x1E0DEEC78]);
}

uint64_t sub_1BC0A66A0()
{
  return sub_1BC0A66C4(&qword_1EF3EF158, (uint64_t)&unk_1BC0C7904);
}

uint64_t sub_1BC0A66C4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Name(255);
    result = MEMORY[0x1BCCEADF0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0A6704()
{
  return sub_1BC0A66C4(&qword_1EF3EF160, (uint64_t)&unk_1BC0C78D8);
}

uint64_t sub_1BC0A6728()
{
  return sub_1BC0A66C4(&qword_1EF3EF168, (uint64_t)&unk_1BC0C7974);
}

void sub_1BC0A674C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED6A81C0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6A81C0);
  }
}

void sub_1BC0A67AC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1BC0C7228();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_1BC0A67F8()
{
  unint64_t result;

  result = qword_1EF3EF190;
  if (!qword_1EF3EF190)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF3EF190);
  }
  return result;
}

uint64_t sub_1BC0A6848(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BC0A6884(uint64_t a1)
{
  uint64_t v2;

  sub_1BC0A68DC(0, &qword_1ED6A7C38, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BC0A68DC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
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

uint64_t HealthPluginAdvertisableFeatureManagerFactory.__allocating_init(healthStore:countryProvider:activeDeviceSource:queue:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v8 = sub_1BC0C703C();
  v20 = *(_QWORD *)(v8 - 8);
  v21 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BC0C6E68();
  MEMORY[0x1E0C80A78](v11);
  v12 = sub_1BC0C700C();
  MEMORY[0x1E0C80A78](v12);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  v22 = a2;
  sub_1BC0A6D20(a2, v13 + 24);
  v14 = v13 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_activeDeviceSource;
  v15 = sub_1BC0C6A0C();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, a3, v15);
  if (!a4)
  {
    sub_1BC0A6D64();
    v17 = a1;
    sub_1BC0C7000();
    sub_1BC0C6E5C();
    (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v10, *MEMORY[0x1E0DEF8D0], v21);
    a4 = sub_1BC0C7054();

  }
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  __swift_destroy_boxed_opaque_existential_0Tm(v22);
  *(_QWORD *)(v13 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_queue) = a4;
  return v13;
}

uint64_t HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = v4;
  v10 = sub_1BC0C703C();
  v21 = *(_QWORD *)(v10 - 8);
  v22 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BC0C6E68();
  MEMORY[0x1E0C80A78](v13);
  v14 = sub_1BC0C700C();
  MEMORY[0x1E0C80A78](v14);
  *(_QWORD *)(v5 + 16) = a1;
  v23 = a2;
  sub_1BC0A6D20(a2, v5 + 24);
  v15 = v5 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_activeDeviceSource;
  v16 = sub_1BC0C6A0C();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, a3, v16);
  if (!a4)
  {
    sub_1BC0A6D64();
    v18 = a1;
    sub_1BC0C7000();
    sub_1BC0C6E5C();
    (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v12, *MEMORY[0x1E0DEF8D0], v22);
    a4 = sub_1BC0C7054();

  }
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, v16);
  __swift_destroy_boxed_opaque_existential_0Tm(v23);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_queue) = a4;
  return v5;
}

uint64_t sub_1BC0A6D20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1BC0A6D64()
{
  unint64_t result;

  result = qword_1ED6A85F0;
  if (!qword_1ED6A85F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A85F0);
  }
  return result;
}

uint64_t sub_1BC0A6DA0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t inited;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31[40];

  v26 = a3;
  v27 = a2;
  v30 = a1;
  v4 = sub_1BC0C6934();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&inited - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC0C6A0C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&inited - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC0C6A30();
  v28 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&inited - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HealthPluginAdvertisableFeatureSourceProvider();
  inited = swift_initStackObject();
  v15 = *(void **)(v3 + 16);
  v16 = *(void **)(v3 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_queue);
  sub_1BC0A6D20(v3 + 24, (uint64_t)v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v3 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_activeDeviceSource, v8);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v17(v7, v30, v4);
  v18 = v15;
  v19 = v16;
  sub_1BC0C6A18();
  v20 = sub_1BC0A4454((uint64_t)v14);
  v21 = v27;
  swift_bridgeObjectRetain();
  sub_1BC0A7120(v20, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = (id)HKLogAnalytics();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB62B8]), sel_initWithLoggingCategory_healthDataSource_, v22, v18);

  v17(v7, v30, v4);
  sub_1BC0C6A24();
  sub_1BC0C69DC();
  sub_1BC0C69E8();
  swift_allocObject();
  v23 = sub_1BC0C69D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v29);
  return v23;
}

uint64_t HealthPluginAdvertisableFeatureManagerFactory.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_activeDeviceSource;
  v2 = sub_1BC0C6A0C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t HealthPluginAdvertisableFeatureManagerFactory.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  v1 = v0 + OBJC_IVAR____TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory_activeDeviceSource;
  v2 = sub_1BC0C6A0C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1BC0A70F8(uint64_t a1, uint64_t a2, int a3)
{
  return sub_1BC0A6DA0(a1, a2, a3);
}

uint64_t sub_1BC0A7120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  __int128 v39;
  void (*v40)(uint64_t, unint64_t, uint64_t);
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;

  v4 = sub_1BC0C691C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  result = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v30 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = 0;
    v36 = a1 + 32;
    v32 = a2;
    v33 = MEMORY[0x1E0DEE9D8];
    v31 = v5;
    v41 = v8;
    v35 = v11;
    while (1)
    {
      if (v12 <= v11)
        v13 = v11;
      else
        v13 = v12;
      v34 = v13;
      while (1)
      {
        if (v12 == v13)
          goto LABEL_31;
        v39 = *(_OWORD *)(v36 + 16 * v12++);
        v14 = v39;
        swift_getObjectType();
        swift_unknownObjectRetain();
        v38 = v14;
        sub_1BC0C69B8();
        v43 = *(_QWORD *)(a2 + 16);
        if (!v43)
        {
          (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
          goto LABEL_8;
        }
        v37 = v12;
        v15 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        v16 = v41;
        v40 = *(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16);
        v40(v41, a2 + v15, v4);
        sub_1BC0A7560();
        swift_bridgeObjectRetain();
        v17 = sub_1BC0C6EB0();
        v42 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
        v42(v16, v4);
        if ((v17 & 1) != 0)
          break;
        if (v43 != 1)
        {
          v18 = *(_QWORD *)(v5 + 72);
          v19 = a2 + v18 + v15;
          v20 = 1;
          while (1)
          {
            v21 = v41;
            result = ((uint64_t (*)(uint64_t, unint64_t, uint64_t))v40)(v41, v19, v4);
            v22 = v20 + 1;
            if (__OFADD__(v20, 1))
              break;
            v23 = v10;
            v24 = v21;
            v25 = sub_1BC0C6EB0();
            v42(v24, v4);
            if ((v25 & 1) != 0)
            {
              a2 = v32;
              swift_bridgeObjectRelease();
              v5 = v31;
              v10 = v23;
              goto LABEL_21;
            }
            ++v20;
            v19 += v18;
            v10 = v23;
            if (v22 == v43)
            {
              a2 = v32;
              swift_bridgeObjectRelease();
              v5 = v31;
              goto LABEL_19;
            }
          }
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
        swift_bridgeObjectRelease();
LABEL_19:
        v13 = v34;
        v11 = v35;
        v12 = v37;
        v42((uint64_t)v10, v4);
LABEL_8:
        result = swift_unknownObjectRelease();
        if (v12 == v11)
          return v33;
      }
      swift_bridgeObjectRelease();
LABEL_21:
      v11 = v35;
      v12 = v37;
      v42((uint64_t)v10, v4);
      v26 = v33;
      result = swift_isUniquelyReferenced_nonNull_native();
      v44 = v26;
      if ((result & 1) == 0)
      {
        result = sub_1BC0A5CC4(0, *(_QWORD *)(v26 + 16) + 1, 1);
        v26 = v44;
      }
      v28 = *(_QWORD *)(v26 + 16);
      v27 = *(_QWORD *)(v26 + 24);
      v29 = v26;
      if (v28 >= v27 >> 1)
      {
        result = sub_1BC0A5CC4(v27 > 1, v28 + 1, 1);
        v29 = v44;
      }
      *(_QWORD *)(v29 + 16) = v28 + 1;
      v33 = v29;
      *(_OWORD *)(v29 + 16 * v28 + 32) = v39;
      if (v12 == v11)
        return v33;
    }
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t dispatch thunk of HealthPluginAdvertisableFeatureManagerProviding.makeAdvertisableFeatureManager(location:featureIdentifiers:includeFeaturesMadeAvailableByBuddy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_1BC0A7478()
{
  return type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory();
}

uint64_t type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory()
{
  uint64_t result;

  result = qword_1ED6A7F98;
  if (!qword_1ED6A7F98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC0A74BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC0C6A0C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for HealthPluginAdvertisableFeatureManagerFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthPluginAdvertisableFeatureManagerFactory.__allocating_init(healthStore:countryProvider:activeDeviceSource:queue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of HealthPluginAdvertisableFeatureManagerFactory.makeAdvertisableFeatureManager(location:featureIdentifiers:includeFeaturesMadeAvailableByBuddy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

unint64_t sub_1BC0A7560()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF3EF260;
  if (!qword_1EF3EF260)
  {
    v1 = sub_1BC0C691C();
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0D29D78], v1);
    atomic_store(result, (unint64_t *)&qword_1EF3EF260);
  }
  return result;
}

uint64_t sub_1BC0A75A8(unint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5;

  v5 = sub_1BC0B0080(a1, a2, a3, a4);
  swift_release();

  return v5;
}

uint64_t GeneratorPipelineGenerationOperation.feedItemManager.getter()
{
  return swift_retain();
}

uint64_t GeneratorPipelineGenerationOperation.sharableModelManager.getter()
{
  return swift_retain();
}

uint64_t sub_1BC0A7624()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + qword_1ED6A78F0);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1BC0A7668(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + qword_1ED6A78F0);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1BC0A76B0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t GeneratorPipelineGenerationOperation.environment.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + qword_1ED6A85C8);
}

uint64_t GeneratorPipelineGenerationOperation.isLaunchGeneration.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + qword_1ED6A8068);
}

uint64_t GeneratorPipelineGenerationOperation.OperationError.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v9;
  _QWORD v11[2];

  v1 = sub_1BC0C6E38();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for GeneratorPipelineGenerationOperation.OperationError(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0A7D18(v0, (uint64_t)v7, v8);
  sub_1BC0A78C8();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_1BC0C7144();
  sub_1BC0C6F10();
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  sub_1BC0C6F10();
  sub_1BC0C71B0();
  v9 = v11[0];
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v9;
}

uint64_t type metadata accessor for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1)
{
  return sub_1BC0A8114(a1, (uint64_t *)&unk_1ED6A8070);
}

void sub_1BC0A78C8()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED6A81A8)
  {
    sub_1BC0C6E38();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6A81A8);
  }
}

id GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, char a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;

  v27 = a4;
  v28 = a8;
  v31 = a6;
  v29 = a3;
  v30 = a5;
  sub_1BC0A7B14();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BC0C6E38();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x1E0C80A78](v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a8, v15);
  v18 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v19 + v18, (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  v20 = v19 + ((v17 + v18 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v20 = a1;
  *(_BYTE *)(v20 + 8) = a7;
  v21 = v27;
  sub_1BC0A7D18(v27, (uint64_t)v14, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  v22 = objc_allocWithZone((Class)type metadata accessor for GeneratorPipelineGenerationOperation(0));
  v23 = swift_retain();
  v24 = sub_1BC0B01EC(v23, a2, (uint64_t)sub_1BC0A7CC0, v19, v29, (uint64_t)v14, v30, v31, a7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v28, v15);
  sub_1BC0B2704(v21, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  return v24;
}

void sub_1BC0A7B14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7A80)
  {
    sub_1BC0C6844();
    sub_1BC0C6820();
    sub_1BC0B2A9C((unint64_t *)&qword_1ED6A7758, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2E150], MEMORY[0x1E0D2E160]);
    v0 = sub_1BC0C72A0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7A80);
  }
}

uint64_t sub_1BC0A7BA4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v7;
  uint64_t v8;

  v7 = (void *)sub_1BC0C6B50();
  sub_1BC0A7D5C(a2, (uint64_t)v7, a4, a1);

  sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC0B04F4();
  v8 = sub_1BC0C6D78();
  swift_release();
  return v8;
}

uint64_t sub_1BC0A7C4C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1BC0C6E38();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0A7CC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(sub_1BC0C6E38() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1BC0A7BA4(a1, v1 + v4, *(_QWORD *)v5, *(unsigned __int8 *)(v5 + 8));
}

uint64_t sub_1BC0A7D18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BC0A7D5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v27 = a3;
  v26 = a2;
  sub_1BC0B2858(0, &qword_1ED6A7690, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v25 - v7;
  v9 = sub_1BC0C6E38();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  v12 = sub_1BC0C7024();
  v28 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B28B0();
  v16 = v15;
  v30 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a4;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v19((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  sub_1BC0C7030();
  v31 = v26;
  v20 = sub_1BC0C7018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v8, 1, 1, v20);
  v19((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v21 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v22 + v21, (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  *(_BYTE *)(v22 + v21 + v11) = v27;
  sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC0B2960(0, (unint64_t *)&qword_1ED6A85F0);
  sub_1BC0B04F4();
  sub_1BC0B2998();
  sub_1BC0C6DFC();
  swift_release();
  sub_1BC0B0688((uint64_t)v8, &qword_1ED6A7690, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF868]);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v29);
  sub_1BC0B2A9C(&qword_1ED6A7980, (uint64_t (*)(uint64_t))sub_1BC0B28B0, MEMORY[0x1E0C95B90]);
  v23 = sub_1BC0C6D78();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v16);
  return v23;
}

id GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:timeoutProvider:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  objc_class *v9;
  id v18;
  id v19;

  v18 = objc_allocWithZone(v9);
  v19 = sub_1BC0B01EC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v19;
}

uint64_t type metadata accessor for GeneratorPipelineGenerationOperation(uint64_t a1)
{
  return sub_1BC0A8114(a1, (uint64_t *)&unk_1ED6A85D8);
}

uint64_t sub_1BC0A8114(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

id GeneratorPipelineGenerationOperation.init(feedItemManager:sharableModelManager:timeoutProvider:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  id v9;

  v9 = sub_1BC0B01EC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_1BC0A81BC()
{
  void *v0;
  void *v1;
  uint64_t ObjectType;
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
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  os_log_type_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  unint64_t v35;
  void (*v36)(char *, unint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[4];
  uint64_t v78[2];

  v1 = v0;
  ObjectType = swift_getObjectType();
  sub_1BC0B2858(0, &qword_1ED6A86A0, (uint64_t (*)(uint64_t))sub_1BC0B0378, MEMORY[0x1E0D2ED18]);
  v4 = *(_QWORD *)(v3 - 8);
  v75 = v3;
  v76 = v4;
  MEMORY[0x1E0C80A78](v3);
  v74 = (char *)v61 - v5;
  sub_1BC0B2858(0, &qword_1ED6A80F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v7 = MEMORY[0x1E0C80A78](v6);
  v65 = (uint64_t)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v64 = (char *)v61 - v9;
  sub_1BC0B1F88(0, &qword_1ED6A8118, MEMORY[0x1E0D2E7E8]);
  v67 = *(_QWORD *)(v10 - 8);
  v68 = v10;
  MEMORY[0x1E0C80A78](v10);
  v66 = (char *)v61 - v11;
  sub_1BC0B0554();
  v70 = *(_QWORD *)(v12 - 8);
  v71 = v12;
  MEMORY[0x1E0C80A78](v12);
  v69 = (char *)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BC0C6C4C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v18 = v1;
  v19 = sub_1BC0C6C40();
  v20 = sub_1BC0C6FD0();
  v21 = os_log_type_enabled(v19, v20);
  v72 = ObjectType;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v63 = swift_slowAlloc();
    v78[0] = v63;
    *(_DWORD *)v22 = 136446466;
    v73 = v15;
    v77[0] = ObjectType;
    swift_getMetatypeMetadata();
    v23 = sub_1BC0C6EEC();
    v77[0] = sub_1BC0A54E4(v23, v24, v78);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2082;
    v62 = v22 + 14;
    v25 = objc_msgSend(v18, sel_debugDescription);
    v26 = v20;
    v27 = sub_1BC0C6EE0();
    v29 = v28;

    v77[0] = sub_1BC0A54E4(v27, v29, v78);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v19, v26, "[%{public}s]: Beginning generation pipeline with configuration: %{public}s", (uint8_t *)v22, 0x16u);
    v30 = v63;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v30, -1, -1);
    MEMORY[0x1BCCEAE98](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v73 + 8))(v17, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  v31 = sub_1BC0A9218();
  v32 = sub_1BC0C6B68();
  v33 = *(_QWORD *)(v32 + 16);
  if (v33)
  {
    v62 = v31;
    v63 = (uint64_t)v18;
    v78[0] = MEMORY[0x1E0DEE9D8];
    sub_1BC0A5CA8(0, v33, 0);
    v34 = (*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
    v61[1] = v32;
    v35 = v32 + v34;
    v73 = *(_QWORD *)(v76 + 72);
    v36 = *(void (**)(char *, unint64_t, uint64_t))(v76 + 16);
    v37 = v74;
    do
    {
      v38 = v75;
      v36(v37, v35, v75);
      sub_1BC0C6B8C();
      __swift_project_boxed_opaque_existential_1(v77, v77[3]);
      v39 = sub_1BC0C6718();
      v41 = v40;
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v77);
      (*(void (**)(char *, uint64_t))(v76 + 8))(v37, v38);
      v42 = v78[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1BC0A5CA8(0, *(_QWORD *)(v42 + 16) + 1, 1);
        v42 = v78[0];
      }
      v44 = *(_QWORD *)(v42 + 16);
      v43 = *(_QWORD *)(v42 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_1BC0A5CA8(v43 > 1, v44 + 1, 1);
        v42 = v78[0];
      }
      *(_QWORD *)(v42 + 16) = v44 + 1;
      v45 = v42 + 16 * v44;
      *(_QWORD *)(v45 + 32) = v39;
      *(_QWORD *)(v45 + 40) = v41;
      v35 += v73;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
    v31 = v62;
  }
  else
  {
    swift_bridgeObjectRelease();
    v42 = MEMORY[0x1E0DEE9D8];
  }
  v77[0] = 0;
  v77[1] = 0xE000000000000000;
  sub_1BC0C7144();
  swift_bridgeObjectRelease();
  strcpy((char *)v77, "Environment=");
  BYTE5(v77[1]) = 0;
  HIWORD(v77[1]) = -5120;
  sub_1BC0C6850();
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  sub_1BC0C6F10();
  MEMORY[0x1BCCEA6C4](v42, MEMORY[0x1E0DEA968]);
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC0C6F10();
  v46 = sub_1BC0C67CC();
  v47 = swift_bridgeObjectRetain();
  MEMORY[0x1BCCEA6C4](v47, v46);
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v48 = (id)_HKLogPersistedSignposts();
  v49 = sub_1BC0C6BEC();
  v50 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118];
  v51 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v64, 1, 1, v49);
  v77[0] = v31;
  sub_1BC0B062C(v51, v65);
  sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC0B04F4();
  swift_retain();
  v52 = v66;
  sub_1BC0C6C64();
  sub_1BC0B0688(v51, &qword_1ED6A80F8, v50);
  sub_1BC0B05EC(&qword_1ED6A8110, &qword_1ED6A8118, MEMORY[0x1E0D2E7E8], MEMORY[0x1E0D2E7F8]);
  v53 = v68;
  v54 = v69;
  sub_1BC0C6D6C();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v52, v53);
  v55 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v56 = swift_allocObject();
  v57 = v72;
  *(_QWORD *)(v56 + 16) = v55;
  *(_QWORD *)(v56 + 24) = v57;
  sub_1BC0B2A9C(&qword_1ED6A8128, (uint64_t (*)(uint64_t))sub_1BC0B0554, MEMORY[0x1E0D2A5C0]);
  v58 = v71;
  v59 = sub_1BC0C6DA8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v54, v58);
  v77[0] = v59;
  sub_1BC0C6D0C();
  sub_1BC0C6CDC();
  swift_release();
  return swift_release();
}

void sub_1BC0A8A04(void **a1, uint64_t a2, uint64_t a3)
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
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  NSObject *v54;
  unsigned __int8 *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  NSObject *v68;
  id v69;
  _QWORD v70[3];
  int v71;
  char *v72;
  char *v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;

  v6 = sub_1BC0C6C4C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)v70 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v70 - v14;
  v16 = *a1;
  swift_beginAccess();
  v17 = MEMORY[0x1BCCEAEE0](a2 + 16);
  if (v17)
  {
    v18 = (void *)v17;
    v19 = qword_1ED6A85C8;
    if ((sub_1BC0C685C() & 1) != 0)
    {
      v73 = v10;
      v20 = a3;
      sub_1BC0C6BF8();
      v21 = v18;
      v22 = sub_1BC0C6C40();
      v23 = sub_1BC0C6FD0();
      v74 = v22;
      v71 = v23;
      if (os_log_type_enabled(v22, v23))
      {
        v24 = swift_slowAlloc();
        v75 = v7;
        v25 = v24;
        v70[0] = swift_slowAlloc();
        v78 = v70[0];
        *(_DWORD *)v25 = 136446466;
        v70[1] = v19;
        v26 = sub_1BC0C72AC();
        v72 = v13;
        v28 = sub_1BC0A54E4(v26, v27, (uint64_t *)&v78);
        v76 = v6;
        v77 = v28;
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2082;
        v29 = objc_msgSend(v21, sel_debugDescription);
        v30 = sub_1BC0C6EE0();
        v70[2] = v20;
        v32 = v31;

        v13 = v72;
        v77 = sub_1BC0A54E4(v30, v32, (uint64_t *)&v78);
        v6 = v76;
        sub_1BC0C709C();

        swift_bridgeObjectRelease();
        v33 = v74;
        _os_log_impl(&dword_1BC0A2000, v74, (os_log_type_t)v71, "[%{public}s] UserInteractive mode pipeline completed; no longer listening for events. %{public}s",
          (uint8_t *)v25,
          0x16u);
        v34 = v70[0];
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v34, -1, -1);
        v35 = v25;
        v7 = v75;
        MEMORY[0x1BCCEAE98](v35, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
      v10 = v73;
    }
    if (v16)
    {
      v36 = v16;
      sub_1BC0C6BF8();
      v37 = v18;
      v38 = v16;
      v39 = v37;
      v40 = v16;
      v41 = sub_1BC0C6C40();
      v42 = sub_1BC0C6FB8();
      v43 = v42;
      if (os_log_type_enabled(v41, v42))
      {
        v44 = swift_slowAlloc();
        v74 = swift_slowAlloc();
        v78 = v74;
        *(_DWORD *)v44 = 136446722;
        LODWORD(v73) = v43;
        v45 = sub_1BC0C72AC();
        v76 = v6;
        v77 = sub_1BC0A54E4(v45, v46, (uint64_t *)&v78);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 12) = 2082;
        v77 = (uint64_t)v16;
        v47 = v16;
        sub_1BC0B04A0();
        v48 = sub_1BC0C6EEC();
        v77 = sub_1BC0A54E4(v48, v49, (uint64_t *)&v78);
        v75 = v7;
        sub_1BC0C709C();
        swift_bridgeObjectRelease();

        *(_WORD *)(v44 + 22) = 2082;
        v50 = objc_msgSend(v39, sel_debugDescription);
        v51 = sub_1BC0C6EE0();
        v53 = v52;

        v77 = sub_1BC0A54E4(v51, v53, (uint64_t *)&v78);
        sub_1BC0C709C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC0A2000, v41, (os_log_type_t)v73, "[%{public}s] Error in generation pipeline: %{public}s. %{public}s", (uint8_t *)v44, 0x20u);
        v54 = v74;
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v54, -1, -1);
        MEMORY[0x1BCCEAE98](v44, -1, -1);

        (*(void (**)(char *, uint64_t))(v75 + 8))(v10, v76);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      }
      v69 = v16;
      sub_1BC0A9A48((uint64_t)v16);

    }
    else
    {
      sub_1BC0C6BF8();
      v55 = v18;
      v56 = sub_1BC0C6C40();
      v57 = sub_1BC0C6FD0();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = swift_slowAlloc();
        v74 = swift_slowAlloc();
        v78 = v74;
        *(_DWORD *)v58 = 136446978;
        v72 = v13;
        v59 = sub_1BC0C72AC();
        v76 = v6;
        v77 = sub_1BC0A54E4(v59, v60, (uint64_t *)&v78);
        v75 = v7;
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 12) = 2080;
        v61 = sub_1BC0C6850();
        v77 = sub_1BC0A54E4(v61, v62, (uint64_t *)&v78);
        sub_1BC0C709C();

        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 22) = 1024;
        v63 = v55[qword_1ED6A8068];

        LODWORD(v77) = v63;
        sub_1BC0C709C();

        *(_WORD *)(v58 + 28) = 2082;
        v64 = objc_msgSend(v55, sel_debugDescription);
        v65 = sub_1BC0C6EE0();
        v67 = v66;

        v77 = sub_1BC0A54E4(v65, v67, (uint64_t *)&v78);
        sub_1BC0C709C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC0A2000, v56, v57, "[%{public}s] Generation pipeline complete for environment %s with isLaunchGeneration=%{BOOL}d; %{public}s",
          (uint8_t *)v58,
          0x26u);
        v68 = v74;
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v68, -1, -1);
        MEMORY[0x1BCCEAE98](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v75 + 8))(v72, v76);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
      }
      sub_1BC0A9A48(0);

    }
  }
}

void sub_1BC0A91E4(void *a1)
{
  id v1;

  v1 = a1;
  sub_1BC0A81BC();

}

uint64_t sub_1BC0A9218()
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
  uint64_t (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  _QWORD v43[2];
  uint64_t (*v44)(void);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  sub_1BC0B1F88(0, &qword_1ED6A79A8, MEMORY[0x1E0C95C60]);
  v49 = *(_QWORD *)(v1 - 8);
  v50 = v1;
  MEMORY[0x1E0C80A78](v1);
  v48 = (char *)v43 - v2;
  sub_1BC0B2004();
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  MEMORY[0x1E0C80A78](v3);
  v51 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B20C4(0, &qword_1ED6A7920, MEMORY[0x1E0C95778]);
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  MEMORY[0x1E0C80A78](v5);
  v45 = (char *)v43 - v6;
  sub_1BC0B20C4(0, &qword_1ED6A7960, (uint64_t (*)(uint64_t, _QWORD *))MEMORY[0x1E0C959E8]);
  v57 = v7;
  v55 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v43 - v8;
  v10 = sub_1BC0AB9C0();
  v11 = *(uint64_t (**)(void))(v0 + qword_1ED6A8B60);
  v12 = *(_QWORD *)(v0 + qword_1ED6A8B60 + 8);
  v56 = v0;
  v13 = *(unsigned __int8 *)(v0 + qword_1ED6A85C8);
  v59 = v10;
  v14 = sub_1BC0C685C();
  sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  sub_1BC0B04F4();
  v15 = sub_1BC0C6D78();
  v16 = v15;
  v43[1] = v12;
  v44 = v11;
  if ((v14 & 1) != 0)
  {
    v17 = ((uint64_t (*)(uint64_t))v11)(v15);
    swift_release();
    v16 = v17;
  }
  swift_release();
  v18 = sub_1BC0A9890(1, v13, v16);
  swift_release();
  v59 = v18;
  sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
  swift_retain();
  sub_1BC0C6DB4();
  swift_release();
  v19 = sub_1BC0B21A0();
  v20 = v57;
  v54 = v19;
  v21 = sub_1BC0C6D78();
  v22 = v20;
  v23 = *(void (**)(char *, uint64_t))(v55 + 8);
  v23(v9, v22);
  swift_release();
  v59 = v21;
  v24 = sub_1BC0C6D78();
  swift_release();
  LOBYTE(v18) = sub_1BC0C685C();
  v25 = sub_1BC0ABF90();
  if ((v18 & 1) != 0)
  {
    if (v25)
    {
      v59 = v25;
      swift_retain();
      swift_retain();
      sub_1BC0C6DB4();
      swift_release();
      v26 = v57;
      v27 = sub_1BC0C6D78();
      v23(v9, v26);
      swift_release();
      v59 = v27;
      v28 = v24;
      v29 = sub_1BC0C6D78();
      swift_release();
      swift_release();
      sub_1BC0B22A4(0, &qword_1ED6A7A68, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_1BC0C7B20;
      *(_QWORD *)(v30 + 32) = v29;
      *(_QWORD *)(v30 + 40) = v28;
      v59 = v30;
      sub_1BC0C6F58();
      sub_1BC0B22A4(0, &qword_1ED6A7A48, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
      sub_1BC0B2314();
      swift_retain();
      swift_retain();
      v31 = v48;
      sub_1BC0C6CD0();
      sub_1BC0B04A0();
      sub_1BC0B05EC(&qword_1ED6A79A0, &qword_1ED6A79A8, MEMORY[0x1E0C95C60], MEMORY[0x1E0C95C80]);
      v32 = v50;
      v33 = v51;
      sub_1BC0C6E08();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v31, v32);
      sub_1BC0B2A9C(&qword_1ED6A7990, (uint64_t (*)(uint64_t))sub_1BC0B2004, MEMORY[0x1E0C95BC8]);
      v34 = v53;
      v35 = sub_1BC0C6D78();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v34);
      return v35;
    }
    else
    {
      v59 = v24;
      v24 = sub_1BC0C6D78();
      swift_release();
    }
  }
  else if (v25)
  {
    v59 = v25;
    sub_1BC0C6D78();
    v36 = v44();
    swift_release();
    v37 = sub_1BC0A9890(0, v13, v36);
    swift_release();
    v59 = v37;
    swift_retain();
    sub_1BC0C6DB4();
    swift_release();
    v38 = v57;
    v39 = sub_1BC0C6D78();
    v23(v9, v38);
    swift_release();
    v58 = v24;
    v59 = v39;
    v40 = v45;
    sub_1BC0C6DCC();
    swift_release();
    sub_1BC0B224C();
    v41 = v47;
    v24 = sub_1BC0C6D78();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v40, v41);
  }
  return v24;
}

uint64_t sub_1BC0A9890(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[2];

  sub_1BC0B1F88(0, &qword_1ED6A7930, MEMORY[0x1E0C957B0]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v12 - v8;
  v12[1] = a3;
  if ((sub_1BC0C685C() & 1) != 0)
  {
    *(_BYTE *)(swift_allocObject() + 16) = a1 & 1;
    sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B04F4();
    sub_1BC0C6D84();
    swift_release();
    sub_1BC0B05EC(&qword_1ED6A7928, &qword_1ED6A7930, MEMORY[0x1E0C957B0], MEMORY[0x1E0C957C0]);
    v10 = sub_1BC0C6D78();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B04F4();
    return sub_1BC0C6D78();
  }
  return v10;
}

id sub_1BC0A9A3C@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_1BC0A9A48(uint64_t a1)
{
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  ObjectType = swift_getObjectType();
  sub_1BC0B255C(0, &qword_1ED6A7970, (uint64_t (*)(uint64_t))sub_1BC0B1BDC, sub_1BC0B1C58, MEMORY[0x1E0C95B50]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v22 - v6;
  sub_1BC0B1C74();
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 || (sub_1BC0C6B14(), (sub_1BC0C685C() & 1) == 0))
  {
    sub_1BC0C68E0();
    swift_bridgeObjectRelease();
    return sub_1BC0C6970();
  }
  else
  {
    sub_1BC0C6AE4();
    v13 = sub_1BC0C670C();
    v24 = v10;
    v14 = v13;
    swift_release();
    v25 = v14;
    sub_1BC0B1BDC();
    sub_1BC0B1C58();
    sub_1BC0C6DD8();
    swift_release();
    v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    *(_QWORD *)(v16 + 24) = ObjectType;
    v22 = sub_1BC0C6CE8();
    v23 = ObjectType;
    sub_1BC0B236C(0, &qword_1ED6A86B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B102C(&qword_1ED6A7968, &qword_1ED6A7970, (uint64_t (*)(uint64_t))sub_1BC0B1BDC, sub_1BC0B1C58);
    sub_1BC0B1D68();
    sub_1BC0C6DF0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v18 = swift_allocObject();
    v19 = v23;
    *(_QWORD *)(v18 + 16) = v17;
    *(_QWORD *)(v18 + 24) = v19;
    sub_1BC0B2A9C(&qword_1ED6A7978, (uint64_t (*)(uint64_t))sub_1BC0B1C74, MEMORY[0x1E0C95B78]);
    v20 = sub_1BC0C6DA8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v9);
    v25 = v20;
    sub_1BC0C6D0C();
    sub_1BC0C6CDC();
    return swift_release();
  }
}

uint64_t sub_1BC0A9D98@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  char v58;
  char *v59;
  uint64_t v60;
  uint64_t *v61;
  char *v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  id v69;
  id v70;
  id v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;

  v90 = a3;
  v95 = a4;
  v6 = MEMORY[0x1E0DEE9C0] + 8;
  sub_1BC0B236C(0, &qword_1ED6A7A28, MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0C960C0]);
  v88 = *(_QWORD *)(v7 - 8);
  v89 = v7;
  MEMORY[0x1E0C80A78](v7);
  v87 = (char *)&v80 - v8;
  v9 = sub_1BC0C66C4();
  v84 = *(_QWORD *)(v9 - 8);
  v85 = v9;
  MEMORY[0x1E0C80A78](v9);
  v83 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B1DDC();
  v82 = v11;
  v81 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v80 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = sub_1BC0C6C4C();
  v92 = *(_QWORD *)(v96 - 8);
  v13 = MEMORY[0x1E0C80A78](v96);
  v93 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v91 = (char *)&v80 - v15;
  sub_1BC0A68DC(0, &qword_1ED6A81A0, v6, MEMORY[0x1E0C96098]);
  v17 = v16;
  v18 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v80 - v19;
  sub_1BC0B236C(0, qword_1ED6A8210, v6, MEMORY[0x1E0C964B8]);
  v22 = v21;
  v23 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v80 - v24;
  v26 = *a1;
  swift_beginAccess();
  v94 = MEMORY[0x1BCCEAEE0](a2 + 16);
  if (!v94)
  {
    sub_1BC0C6D3C();
    sub_1BC0B04A0();
    sub_1BC0C6D30();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    sub_1BC0B1EC0();
    v51 = sub_1BC0C6D78();
    result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v25, v22);
LABEL_23:
    v61 = v95;
LABEL_28:
    *v61 = v51;
    return result;
  }
  if (v26 >> 62)
  {
    swift_bridgeObjectRetain();
    v27 = sub_1BC0C71D4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v97 = v27;
  v86 = v26 >> 62;
  if (!v27)
  {
LABEL_13:
    v40 = v91;
    sub_1BC0C6BF8();
    swift_bridgeObjectRetain();
    v41 = sub_1BC0C6C40();
    v42 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v91 = (char *)swift_slowAlloc();
      v99 = v91;
      *(_DWORD *)v43 = 136315394;
      v44 = sub_1BC0C72AC();
      v98 = sub_1BC0A54E4(v44, v45, (uint64_t *)&v99);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v46 = swift_bridgeObjectRetain();
      v47 = MEMORY[0x1BCCEA6C4](v46, MEMORY[0x1E0DEA968]);
      v49 = v48;
      swift_bridgeObjectRelease();
      v98 = sub_1BC0A54E4(v47, v49, (uint64_t *)&v99);
      sub_1BC0C709C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v41, v42, "[%s] Successfully scheduled all coalesced notifications: %s", (uint8_t *)v43, 0x16u);
      v50 = v91;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v50, -1, -1);
      MEMORY[0x1BCCEAE98](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v52 = *(void (**)(char *, uint64_t))(v92 + 8);
    v52(v40, v96);
    v53 = (void *)v94;
    v54 = (void *)sub_1BC0C6B20();
    if (v86)
    {
      swift_bridgeObjectRetain();
      v55 = sub_1BC0C71D4();
      swift_bridgeObjectRelease();
      if (!v55)
        goto LABEL_24;
    }
    else if (!*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_24;
    }
    v56 = (void *)sub_1BC0C6FA0();
    v57 = (void *)sub_1BC0C67C0();
    v58 = sub_1BC0C67B4();

    if ((v58 & 1) != 0)
    {
      v99 = (char *)sub_1BC0AD660(v54);
      sub_1BC0B236C(0, &qword_1ED6A79D8, MEMORY[0x1E0DEAFA0], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
      sub_1BC0B1E60();
      v59 = v80;
      sub_1BC0C6D9C();
      swift_release();
      sub_1BC0B2A9C(&qword_1EF3EF298, (uint64_t (*)(uint64_t))sub_1BC0B1DDC, MEMORY[0x1E0C95950]);
      v60 = v82;
      v51 = sub_1BC0C6D78();

      result = (*(uint64_t (**)(char *, uint64_t))(v81 + 8))(v59, v60);
      goto LABEL_23;
    }
LABEL_24:
    v62 = v93;
    sub_1BC0C6BF8();
    swift_bridgeObjectRetain_n();
    v63 = v54;
    v64 = sub_1BC0C6C40();
    v65 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = swift_slowAlloc();
      v92 = swift_slowAlloc();
      v99 = (char *)v92;
      *(_DWORD *)v66 = 136315651;
      v67 = sub_1BC0C72AC();
      v98 = sub_1BC0A54E4(v67, v68, (uint64_t *)&v99);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 12) = 2081;
      v69 = objc_msgSend(v63, sel_profileIdentifier);
      v70 = objc_msgSend(v69, sel_identifier);
      v91 = (char *)v52;
      v71 = v70;

      v72 = v83;
      sub_1BC0C66B8();

      v73 = sub_1BC0C66AC();
      v75 = v74;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v72, v85);
      v98 = sub_1BC0A54E4(v73, v75, (uint64_t *)&v99);
      v53 = (void *)v94;
      sub_1BC0C709C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 22) = 2049;
      swift_bridgeObjectRelease();
      v98 = v97;
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v64, v65, "[%s] No content to push for health store %{private}s where number of requests is %{private}ld", (uint8_t *)v66, 0x20u);
      v76 = v92;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v76, -1, -1);
      MEMORY[0x1BCCEAE98](v66, -1, -1);

      ((void (*)(char *, uint64_t))v91)(v93, v96);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v52(v62, v96);
    }
    v61 = v95;
    v78 = v88;
    v77 = v89;
    v79 = v87;
    sub_1BC0B04A0();
    sub_1BC0C6D48();
    sub_1BC0B1F24();
    v51 = sub_1BC0C6D78();

    result = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v79, v77);
    goto LABEL_28;
  }
  v99 = (char *)MEMORY[0x1E0DEE9D8];
  result = sub_1BC0A5CA8(0, v27 & ~(v27 >> 63), 0);
  if ((v27 & 0x8000000000000000) == 0)
  {
    v29 = 0;
    v30 = (uint64_t)v99;
    do
    {
      if ((v26 & 0xC000000000000001) != 0)
        v31 = (id)MEMORY[0x1BCCEA8D4](v29, v26);
      else
        v31 = *(id *)(v26 + 8 * v29 + 32);
      v32 = v31;
      v33 = objc_msgSend(v31, sel_identifier);
      v34 = sub_1BC0C6EE0();
      v36 = v35;

      v99 = (char *)v30;
      v38 = *(_QWORD *)(v30 + 16);
      v37 = *(_QWORD *)(v30 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_1BC0A5CA8(v37 > 1, v38 + 1, 1);
        v30 = (uint64_t)v99;
      }
      ++v29;
      *(_QWORD *)(v30 + 16) = v38 + 1;
      v39 = v30 + 16 * v38;
      *(_QWORD *)(v39 + 32) = v34;
      *(_QWORD *)(v39 + 40) = v36;
    }
    while (v97 != v29);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_1BC0AA718(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = sub_1BC0C6C4C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v35 - v9;
  v11 = *a1;
  swift_beginAccess();
  v12 = MEMORY[0x1BCCEAEE0](a2 + 16);
  if (v12)
  {
    v13 = (void *)v12;
    if (v11)
    {
      v14 = v11;
      sub_1BC0C6BF8();
      v15 = v11;
      v16 = v11;
      v17 = sub_1BC0C6C40();
      v18 = sub_1BC0C6FB8();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc();
        v20 = swift_slowAlloc();
        v35 = v4;
        v21 = v20;
        v37 = v20;
        *(_DWORD *)v19 = 136315394;
        v22 = sub_1BC0C72AC();
        v36 = sub_1BC0A54E4(v22, v23, &v37);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 12) = 2080;
        v36 = (uint64_t)v11;
        v24 = v11;
        sub_1BC0B04A0();
        v25 = sub_1BC0C6EF8();
        v36 = sub_1BC0A54E4(v25, v26, &v37);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1BC0A2000, v17, v18, "[%s] Generation Stream Did Finish with error: %s", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v21, -1, -1);
        MEMORY[0x1BCCEAE98](v19, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v35);
LABEL_10:
        swift_retain();
        sub_1BC0C68E0();
        swift_bridgeObjectRelease();
        swift_release();
        sub_1BC0C6970();

        return;
      }

      v33 = *(void (**)(char *, uint64_t))(v5 + 8);
      v34 = v10;
    }
    else
    {
      sub_1BC0C6BF8();
      v27 = sub_1BC0C6C40();
      v28 = sub_1BC0C6FD0();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v37 = v30;
        v35 = v4;
        *(_DWORD *)v29 = 136315138;
        v31 = sub_1BC0C72AC();
        v36 = sub_1BC0A54E4(v31, v32, &v37);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC0A2000, v27, v28, "[%s] combinedGenerationStreamDidFinish successfully", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v30, -1, -1);
        MEMORY[0x1BCCEAE98](v29, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v35);
        goto LABEL_10;
      }

      v33 = *(void (**)(char *, uint64_t))(v5 + 8);
      v34 = v8;
    }
    v33(v34, v4);
    goto LABEL_10;
  }
}

uint64_t sub_1BC0AAB04()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  swift_getObjectType();
  v2 = sub_1BC0C6C4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v6 = v1;
  v7 = sub_1BC0C6C40();
  v8 = sub_1BC0C6FD0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v22 = v2;
    v10 = v9;
    v11 = swift_slowAlloc();
    v24 = v11;
    *(_DWORD *)v10 = 136446466;
    v12 = sub_1BC0C72AC();
    v23 = sub_1BC0A54E4(v12, v13, &v24);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    v23 = *(_QWORD *)&v6[qword_1ED6A8B88];
    sub_1BC0C68F8();
    v21 = v3;
    swift_retain();
    v14 = sub_1BC0C6EEC();
    v23 = sub_1BC0A54E4(v14, v15, &v24);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v7, v8, "[%{public}s] Sending cancellation events to generation pipeline cancellables: %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v11, -1, -1);
    MEMORY[0x1BCCEAE98](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  v16 = sub_1BC0C68E0();
  v17 = v16;
  if (!(v16 >> 62))
  {
    v18 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v18)
      goto LABEL_6;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  result = sub_1BC0C71D4();
  v18 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_6:
  if (v18 >= 1)
  {
    for (i = 0; i != v18; ++i)
    {
      if ((v17 & 0xC000000000000001) != 0)
        MEMORY[0x1BCCEA8D4](i, v17);
      else
        swift_retain();
      sub_1BC0C6D00();
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC0AADF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_1BC0B24B0(0, &qword_1ED6A76B8, sub_1BC0B2524);
  v3 = v2;
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v22 - v4;
  v6 = *(_QWORD *)(a1 + 64);
  v23 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v6;
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v10)
        return swift_release();
      v20 = *(_QWORD *)(v23 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v10)
          return swift_release();
        v20 = *(_QWORD *)(v23 + 8 * v12);
        if (!v20)
        {
          v12 = v19 + 3;
          if (v19 + 3 >= v10)
            return swift_release();
          v20 = *(_QWORD *)(v23 + 8 * v12);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_5:
    v15 = *(_QWORD *)(a1 + 48);
    v16 = sub_1BC0C66C4();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v5, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v16);
    v17 = *(_QWORD *)(a1 + 56);
    sub_1BC0B2524(0);
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(&v5[*(int *)(v3 + 48)], v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v14, v18);
    sub_1BC0AF23C((uint64_t)v5, (uint64_t)&v5[*(int *)(v3 + 48)], (uint64_t (*)(_QWORD))sub_1BC0B1130, (uint64_t (*)(_QWORD))sub_1BC0B2524, (uint64_t)&unk_1BC0C7C58, "Outstanding pipeline: %s | %s | %{public}s");
    result = sub_1BC0B2640((uint64_t)v5, &qword_1ED6A76B8, sub_1BC0B2524);
  }
  v21 = v19 + 4;
  if (v21 >= v10)
    return swift_release();
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v12 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BC0AB048(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_1BC0B24B0(0, &qword_1ED6A76A8, sub_1BC0B2478);
  v3 = v2;
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v22 - v4;
  v6 = *(_QWORD *)(a1 + 64);
  v23 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v6;
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v10)
        return swift_release();
      v20 = *(_QWORD *)(v23 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v10)
          return swift_release();
        v20 = *(_QWORD *)(v23 + 8 * v12);
        if (!v20)
        {
          v12 = v19 + 3;
          if (v19 + 3 >= v10)
            return swift_release();
          v20 = *(_QWORD *)(v23 + 8 * v12);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_5:
    v15 = *(_QWORD *)(a1 + 48);
    v16 = sub_1BC0C66C4();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v5, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v16);
    v17 = *(_QWORD *)(a1 + 56);
    sub_1BC0B2478(0);
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(&v5[*(int *)(v3 + 48)], v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v14, v18);
    sub_1BC0AF23C((uint64_t)v5, (uint64_t)&v5[*(int *)(v3 + 48)], (uint64_t (*)(_QWORD))sub_1BC0B1154, (uint64_t (*)(_QWORD))sub_1BC0B2478, (uint64_t)&unk_1BC0C7C28, "Outstanding generator: %s | %s | %{public}s");
    result = sub_1BC0B2640((uint64_t)v5, &qword_1ED6A76A8, sub_1BC0B2478);
  }
  v21 = v19 + 4;
  if (v21 >= v10)
    return swift_release();
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v12 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BC0AB29C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;

  sub_1BC0B267C();
  v3 = v2;
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v10)
        return swift_release();
      v20 = *(_QWORD *)(v6 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v10)
          return swift_release();
        v20 = *(_QWORD *)(v6 + 8 * v12);
        if (!v20)
        {
          v12 = v19 + 3;
          if (v19 + 3 >= v10)
            return swift_release();
          v20 = *(_QWORD *)(v6 + 8 * v12);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_5:
    v15 = *(_QWORD *)(a1 + 48);
    v16 = sub_1BC0C66C4();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v5, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v16);
    v17 = *(_QWORD *)(a1 + 56);
    sub_1BC0B2858(0, &qword_1ED6A76F0, (uint64_t (*)(uint64_t))sub_1BC0B039C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(&v5[*(int *)(v3 + 48)], v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v14, v18);
    sub_1BC0AECD8((uint64_t)v5, (uint64_t)&v5[*(int *)(v3 + 48)]);
    result = sub_1BC0B2704((uint64_t)v5, (uint64_t (*)(_QWORD))sub_1BC0B267C);
  }
  v21 = v19 + 4;
  if (v21 >= v10)
    return swift_release();
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v12 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v6 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BC0AB4B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;

  sub_1BC0B24B0(0, &qword_1ED6A76A0, (void (*)(uint64_t))sub_1BC0B25CC);
  v3 = v2;
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v22 - v4;
  v6 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v10)
        return swift_release();
      v20 = *(_QWORD *)(v6 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v10)
          return swift_release();
        v20 = *(_QWORD *)(v6 + 8 * v12);
        if (!v20)
        {
          v12 = v19 + 3;
          if (v19 + 3 >= v10)
            return swift_release();
          v20 = *(_QWORD *)(v6 + 8 * v12);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_5:
    v15 = *(_QWORD *)(a1 + 48);
    v16 = sub_1BC0C66C4();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v5, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v16);
    v17 = *(_QWORD *)(a1 + 56);
    sub_1BC0B25CC();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(&v5[*(int *)(v3 + 48)], v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v14, v18);
    sub_1BC0AF700((uint64_t)v5, (uint64_t)&v5[*(int *)(v3 + 48)]);
    result = sub_1BC0B2640((uint64_t)v5, &qword_1ED6A76A0, (void (*)(uint64_t))sub_1BC0B25CC);
  }
  v21 = v19 + 4;
  if (v21 >= v10)
    return swift_release();
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v12 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v10)
      return swift_release();
    v20 = *(_QWORD *)(v6 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_1BC0AB6D0(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  sub_1BC0AB724();

  v2 = (void *)sub_1BC0C6EBC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1BC0AB724()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  swift_getObjectType();
  v1 = sub_1BC0C6964();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_1BC0C7144();
  sub_1BC0C6F10();
  sub_1BC0C72AC();
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  sub_1BC0C6F10();
  v7 = v0;
  sub_1BC0C71B0();
  sub_1BC0C6F10();
  sub_1BC0C6850();
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  sub_1BC0C6F10();
  sub_1BC0C6F10();
  swift_bridgeObjectRelease();
  sub_1BC0C6F10();
  sub_1BC0C697C();
  sub_1BC0C71B0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_1BC0C6F10();
  v7 = *(_QWORD *)(v0 + qword_1ED6A8638);
  sub_1BC0C6BE0();
  sub_1BC0C71B0();
  sub_1BC0C6F10();
  v7 = *(_QWORD *)(v0 + qword_1ED6A8630);
  sub_1BC0C6BBC();
  sub_1BC0C71B0();
  return v8;
}

uint64_t sub_1BC0AB9C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  char v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, unint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;

  sub_1BC0A68DC(0, &qword_1ED6A7710, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96098]);
  v51 = v1;
  v57 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v56 = (char *)&v44 - v2;
  sub_1BC0B18E4();
  v55 = v3;
  v53 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v50 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B195C(0, &qword_1ED6A8120, v5, (void (*)(void))sub_1BC0B19E8);
  v54 = v6;
  v52 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v44 - v7;
  sub_1BC0B255C(0, &qword_1ED6A7940, (uint64_t (*)(uint64_t))sub_1BC0B1A04, sub_1BC0B1ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C957C8]);
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v44 - v12;
  sub_1BC0A7B14();
  MEMORY[0x1E0C80A78](v14);
  v48 = (uint64_t)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BC0C67CC();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v44 - v21;
  v23 = *(_QWORD *)(v0 + qword_1ED6A8B80);
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))((char *)&v44 - v21, *MEMORY[0x1E0D2D9B8], v16);
  v61 = *(_QWORD *)(v23 + 16);
  v58 = v8;
  if (!v61)
  {
    v26 = *(void (**)(char *, uint64_t))(v17 + 8);
    swift_bridgeObjectRetain();
    v31 = v53;
    v30 = v54;
    v32 = v51;
    v33 = v52;
    v34 = v50;
    v35 = v55;
LABEL_11:
    v26(v22, v16);
    swift_bridgeObjectRelease();
    LOBYTE(v62) = 1;
    v42 = v56;
    sub_1BC0C6D3C();
    sub_1BC0B14B0();
    sub_1BC0C6D90();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v32);
    sub_1BC0B04A0();
    sub_1BC0B19E8();
    v43 = v58;
    sub_1BC0C6E14();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v34, v35);
    sub_1BC0B1AF8();
    v29 = sub_1BC0C6D78();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v43, v30);
    return v29;
  }
  v44 = v13;
  v45 = v11;
  v46 = v10;
  v47 = v0;
  v24 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v60 = *(void (**)(char *, unint64_t, uint64_t))(v17 + 16);
  v60(v20, v23 + v24, v16);
  v25 = sub_1BC0B2A9C(&qword_1ED6A7BB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D9C0], MEMORY[0x1E0D2D9D0]);
  v49 = v23;
  swift_bridgeObjectRetain();
  v59 = v25;
  LOBYTE(v25) = sub_1BC0C6EB0();
  v26 = *(void (**)(char *, uint64_t))(v17 + 8);
  v26(v20, v16);
  if ((v25 & 1) != 0)
  {
LABEL_3:
    v26(v22, v16);
    swift_bridgeObjectRelease();
    sub_1BC0A7D18(v47 + qword_1ED6A8B68, v48, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
    swift_retain();
    v62 = sub_1BC0C6BD4();
    sub_1BC0B1090();
    sub_1BC0B2A9C(&qword_1ED6A7A08, (uint64_t (*)(uint64_t))sub_1BC0B1090, MEMORY[0x1E0C95F48]);
    sub_1BC0C6D78();
    swift_release();
    sub_1BC0B255C(0, &qword_1ED6A7908, (uint64_t (*)(uint64_t))sub_1BC0B0378, sub_1BC0B1B58, MEMORY[0x1E0D2EC68]);
    swift_allocObject();
    sub_1BC0C6B08();
    v62 = sub_1BC0C6B5C();
    sub_1BC0B1A04();
    sub_1BC0B1ADC();
    v27 = v44;
    sub_1BC0C6D90();
    swift_release();
    sub_1BC0B1B74();
    v28 = v46;
    v29 = sub_1BC0C6D78();
    swift_release();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v27, v28);
    return v29;
  }
  if (v61 == 1)
  {
LABEL_10:
    v30 = v54;
    v35 = v55;
    v33 = v52;
    v31 = v53;
    v34 = v50;
    v32 = v51;
    goto LABEL_11;
  }
  v36 = *(_QWORD *)(v17 + 72);
  v37 = v49 + v36 + v24;
  v38 = 1;
  while (1)
  {
    result = ((uint64_t (*)(char *, unint64_t, uint64_t))v60)(v20, v37, v16);
    v40 = v38 + 1;
    if (__OFADD__(v38, 1))
      break;
    v41 = sub_1BC0C6EB0();
    v26(v20, v16);
    if ((v41 & 1) != 0)
      goto LABEL_3;
    ++v38;
    v37 += v36;
    if (v40 == v61)
      goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC0ABF90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
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
  char *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t result;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ObjectType;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, unint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;

  v1 = v0;
  ObjectType = swift_getObjectType();
  sub_1BC0B0D1C();
  v55 = *(_QWORD *)(v2 - 8);
  v56 = v2;
  MEMORY[0x1E0C80A78](v2);
  v54 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B255C(0, &qword_1ED6A7C18, v4, sub_1BC0B0E40, MEMORY[0x1E0C95B50]);
  v62 = v5;
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v61 = (char *)&v48 - v7;
  sub_1BC0B0E5C();
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v60 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B255C(0, &qword_1ED6A7BF8, v12, sub_1BC0B1074, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C957C8]);
  v14 = v13;
  v15 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v59 = (char *)&v48 - v16;
  sub_1BC0A7B14();
  MEMORY[0x1E0C80A78](v17);
  v53 = (uint64_t)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BC0C67CC();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v48 - v24;
  v57 = v1;
  v26 = *(_QWORD *)(v1 + qword_1ED6A8B80);
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))((char *)&v48 - v24, *MEMORY[0x1E0D2D9B0], v19);
  v65 = *(_QWORD *)(v26 + 16);
  if (!v65)
  {
    v29 = *(void (**)(char *, uint64_t))(v20 + 8);
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  v48 = v15;
  v49 = v10;
  v50 = v6;
  v51 = v14;
  v52 = v9;
  v27 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v64 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 16);
  v64(v23, v26 + v27, v19);
  sub_1BC0B2A9C(&qword_1ED6A7BB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2D9C0], MEMORY[0x1E0D2D9D0]);
  v63 = v26;
  swift_bridgeObjectRetain();
  v28 = sub_1BC0C6EB0();
  v29 = *(void (**)(char *, uint64_t))(v20 + 8);
  v29(v23, v19);
  if ((v28 & 1) != 0)
  {
LABEL_3:
    v29(v25, v19);
    swift_bridgeObjectRelease();
    sub_1BC0A7D18(v57 + qword_1ED6A8B68, v53, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
    swift_retain();
    v66 = sub_1BC0C6BD4();
    sub_1BC0B1090();
    sub_1BC0B2A9C(&qword_1ED6A7A08, (uint64_t (*)(uint64_t))sub_1BC0B1090, MEMORY[0x1E0C95F48]);
    sub_1BC0C6D78();
    swift_release();
    sub_1BC0B255C(0, &qword_1ED6A7910, (uint64_t (*)(uint64_t))sub_1BC0B110C, sub_1BC0B11F0, MEMORY[0x1E0D2EC68]);
    swift_allocObject();
    sub_1BC0C6B08();
    v66 = sub_1BC0C6B5C();
    sub_1BC0B0DA0();
    sub_1BC0B2A9C(&qword_1ED6A79C0, (uint64_t (*)(uint64_t))sub_1BC0B0DA0, MEMORY[0x1E0C95D90]);
    v30 = v54;
    sub_1BC0C6D9C();
    swift_release();
    sub_1BC0B0E40();
    v31 = v61;
    v32 = v56;
    sub_1BC0C6DD8();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v30, v32);
    v33 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v34 = swift_allocObject();
    v35 = ObjectType;
    *(_QWORD *)(v34 + 16) = v33;
    *(_QWORD *)(v34 + 24) = v35;
    sub_1BC0C6CE8();
    sub_1BC0B0F4C();
    sub_1BC0B102C(&qword_1ED6A7C10, &qword_1ED6A7C18, (uint64_t (*)(uint64_t))sub_1BC0B0D1C, sub_1BC0B0E40);
    sub_1BC0B0FB0();
    v36 = v60;
    v37 = v62;
    sub_1BC0C6DE4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v31, v37);
    sub_1BC0B1074();
    v38 = v59;
    v39 = v52;
    sub_1BC0C6D90();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v36, v39);
    sub_1BC0B1238();
    v40 = v51;
    v41 = sub_1BC0C6D78();
    swift_release();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v38, v40);
    return v41;
  }
  if (v65 == 1)
  {
LABEL_10:
    v29(v25, v19);
    swift_bridgeObjectRelease();
    return 0;
  }
  v42 = *(_QWORD *)(v20 + 72);
  v43 = v63 + v42 + v27;
  v44 = 1;
  while (1)
  {
    result = ((uint64_t (*)(char *, unint64_t, uint64_t))v64)(v23, v43, v19);
    v46 = v44 + 1;
    if (__OFADD__(v44, 1))
      break;
    v47 = sub_1BC0C6EB0();
    v29(v23, v19);
    if ((v47 & 1) != 0)
      goto LABEL_3;
    ++v44;
    v43 += v42;
    if (v46 == v65)
      goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BC0AC5F8@<X0>(uint64_t a1@<X1>, char *a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v4;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;

  v25 = a2;
  v26 = a3;
  sub_1BC0B12A0();
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B1404();
  v10 = v9;
  v11 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0A68DC(0, &qword_1ED6A7710, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96098]);
  v15 = v14;
  v16 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v25 - v17;
  swift_beginAccess();
  v19 = MEMORY[0x1BCCEAEE0](a1 + 16);
  if (v19)
  {
    v20 = (char *)v19;
    if ((sub_1BC0C685C() & 1) != 0 && (v20[qword_1ED6A8068] & 1) == 0)
    {
      v27 = *(_QWORD *)&v20[qword_1ED6A8B58];
      sub_1BC0B1320(0, &qword_1ED6A8190, &qword_1ED6A81C8, MEMORY[0x1E0D2D700], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
      sub_1BC0B139C();
      sub_1BC0C6DC0();
      v23 = swift_allocObject();
      swift_weakInit();
      v24 = (_QWORD *)swift_allocObject();
      v24[2] = v23;
      v24[3] = v20;
      v24[4] = v25;
      v25 = v20;
      sub_1BC0C6CE8();
      sub_1BC0B0F4C();
      sub_1BC0B2A9C(&qword_1ED6A8148, (uint64_t (*)(uint64_t))sub_1BC0B12A0, MEMORY[0x1E0C95A38]);
      sub_1BC0B0FB0();
      sub_1BC0C6E2C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_1BC0B2A9C(&qword_1ED6A8168, (uint64_t (*)(uint64_t))sub_1BC0B1404, MEMORY[0x1E0C95B78]);
      v21 = sub_1BC0C6D78();

      result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      goto LABEL_7;
    }
    LOBYTE(v27) = 1;
    sub_1BC0C6D3C();
    sub_1BC0B14B0();
    v21 = sub_1BC0C6D78();

  }
  else
  {
    LOBYTE(v27) = 1;
    sub_1BC0C6D3C();
    sub_1BC0B14B0();
    v21 = sub_1BC0C6D78();
  }
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
LABEL_7:
  *v26 = v21;
  return result;
}

uint64_t sub_1BC0AC93C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v33 = a2;
  v34 = a4;
  v32 = a3;
  sub_1BC0B156C(0);
  v39 = v7;
  v37 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B255C(0, &qword_1ED6A8160, v10, sub_1BC0B1590, MEMORY[0x1E0C95B50]);
  v12 = v11;
  v35 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v31 - v13;
  sub_1BC0B15AC();
  v38 = v15;
  v36 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v19 = MEMORY[0x1E0DEE9D8];
  v40 = MEMORY[0x1E0DEE9D8];
  v20 = *(_QWORD *)(v18 + 16);
  if (v20)
  {
    v31 = a5;
    swift_bridgeObjectRetain();
    for (i = 0; i != v20; ++i)
    {
      v22 = *(id *)(v18 + 8 * i + 32);
      v23 = sub_1BC0C679C();

      if (v23)
      {
        MEMORY[0x1BCCEA6A0]();
        if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1BC0C6F64();
        sub_1BC0C6F70();
        sub_1BC0C6F58();
      }
    }
    swift_bridgeObjectRelease();
    v19 = v40;
    a5 = v31;
  }
  v24 = v33;
  swift_retain();
  v25 = v32;
  v26 = sub_1BC0A75A8(v19, v24, v25, v34);
  swift_bridgeObjectRelease();
  v40 = v26;
  sub_1BC0B0F4C();
  sub_1BC0B2858(0, &qword_1ED6A81D8, (uint64_t (*)(uint64_t))sub_1BC0B0F4C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0B0FB0();
  sub_1BC0B169C();
  sub_1BC0C6CD0();
  sub_1BC0B1590();
  v27 = v39;
  sub_1BC0C6DD8();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v27);
  sub_1BC0B1634();
  sub_1BC0C6D9C();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v12);
  sub_1BC0B2A9C(&qword_1ED6A8138, (uint64_t (*)(uint64_t))sub_1BC0B15AC, MEMORY[0x1E0C95950]);
  v28 = v38;
  v29 = sub_1BC0C6D78();
  result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v28);
  *a5 = v29;
  return result;
}

uint64_t sub_1BC0ACC60@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  id v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  char v43;

  v36 = a4;
  v34[1] = a3;
  v42 = a5;
  sub_1BC0B16FC(0, a2);
  v7 = v6;
  v35 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B1754(0, v10);
  v37 = *(_QWORD *)(v11 - 8);
  v38 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B17C8(0, v14);
  v39 = *(_QWORD *)(v15 - 8);
  v40 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0A68DC(0, &qword_1ED6A7710, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96098]);
  v41 = v18;
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)v34 - v20;
  v22 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v34[0] = (id)sub_1BC0C6AFC();
    swift_retain();
    sub_1BC0C6AF0();
    swift_release();
    swift_beginAccess();
    sub_1BC0C6868();
    swift_release();
    v23 = swift_allocObject();
    v24 = v36;
    *(_QWORD *)(v23 + 16) = v22;
    *(_QWORD *)(v23 + 24) = v24;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_1BC0B18A8;
    *(_QWORD *)(v25 + 24) = v23;
    v26 = v22;
    swift_getOpaqueTypeConformance2();
    sub_1BC0C6D9C();
    swift_release();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v7);
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v26;
    *(_QWORD *)(v27 + 24) = v24;
    sub_1BC0B2A9C(&qword_1ED6A8300, (uint64_t (*)(uint64_t))sub_1BC0B1754, MEMORY[0x1E0C95950]);
    sub_1BC0B14B0();
    v28 = v26;
    v29 = v38;
    sub_1BC0C6DB4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v29);
    sub_1BC0B2A9C(&qword_1ED6A8310, (uint64_t (*)(uint64_t))sub_1BC0B17C8, MEMORY[0x1E0C959F8]);
    v30 = v40;
    v31 = sub_1BC0C6D78();
    swift_release();

    result = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v17, v30);
  }
  else
  {
    v43 = 0;
    sub_1BC0C6D3C();
    sub_1BC0B14B0();
    v33 = v41;
    v31 = sub_1BC0C6D78();
    result = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v33);
  }
  *v42 = v31;
  return result;
}

uint64_t sub_1BC0AD018(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v27 = a2;
  v3 = sub_1BC0C66C4();
  v28 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BC0C6C4C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C34();
  v10 = a1;
  v11 = sub_1BC0C6C40();
  v12 = sub_1BC0C6FD0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v26 = v7;
    v14 = v13;
    v25 = swift_slowAlloc();
    v30 = v25;
    *(_DWORD *)v14 = 136446466;
    v15 = sub_1BC0C72AC();
    v24 = v3;
    v29 = sub_1BC0A54E4(v15, v16, &v30);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    v17 = objc_msgSend(v10, sel_identifier);
    sub_1BC0C66B8();

    v18 = sub_1BC0C66AC();
    v27 = v6;
    v20 = v19;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v24);
    v29 = sub_1BC0A54E4(v18, v20, &v30);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v11, v12, "[%{public}s] Successfully committed transaction for %{public}s", (uint8_t *)v14, 0x16u);
    v21 = v25;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v21, -1, -1);
    MEMORY[0x1BCCEAE98](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return 1;
}

uint64_t sub_1BC0AD2B0@<X0>(void **a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = sub_1BC0C66C4();
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC0C6C4C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  sub_1BC0C6C34();
  v14 = a2;
  v15 = v13;
  v16 = v14;
  v17 = v13;
  v18 = sub_1BC0C6C40();
  v19 = sub_1BC0C6FB8();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v39 = a3;
    v22 = v21;
    v37 = swift_slowAlloc();
    v43 = v37;
    *(_DWORD *)v22 = 136446722;
    v36 = v20;
    v23 = sub_1BC0C72AC();
    v38 = v9;
    v42 = sub_1BC0A54E4(v23, v24, &v43);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2082;
    v25 = objc_msgSend(v16, sel_identifier);
    sub_1BC0C66B8();

    v26 = sub_1BC0C66AC();
    v35 = v10;
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v41);
    v42 = sub_1BC0A54E4(v26, v28, &v43);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 22) = 2082;
    v42 = (uint64_t)v13;
    v29 = v13;
    sub_1BC0B04A0();
    v30 = sub_1BC0C6EEC();
    v42 = sub_1BC0A54E4(v30, v31, &v43);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC0A2000, v18, (os_log_type_t)v36, "[%{public}s] Unable to commit transaction for %{public}s: %{public}s", (uint8_t *)v22, 0x20u);
    v32 = v37;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v32, -1, -1);
    MEMORY[0x1BCCEAE98](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v38);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  LOBYTE(v43) = 0;
  return sub_1BC0C6D3C();
}

uint64_t *sub_1BC0AD5FC@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v2 = *result;
  v3 = *(_QWORD *)(*result + 16);
  if (!v3)
    goto LABEL_4;
  if (*(_BYTE *)(v2 + 32) == 1)
  {
    if (v3 == 1)
    {
LABEL_4:
      *a2 = 1;
      return result;
    }
    v4 = 33;
    while (1)
    {
      v5 = v4 - 31;
      if (__OFADD__(v4 - 32, 1))
        break;
      v6 = *(unsigned __int8 *)(v2 + v4++);
      if (v6 != 1 || v5 == v3)
      {
        *a2 = v6;
        return result;
      }
    }
    __break(1u);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

uint64_t sub_1BC0AD660(void *a1)
{
  uint64_t ObjectType;
  uint64_t v3;
  id v4;
  uint64_t v5;

  ObjectType = swift_getObjectType();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = ObjectType;
  sub_1BC0B236C(0, (unint64_t *)&qword_1EF3EF280, MEMORY[0x1E0DEAFA0], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960D8]);
  swift_allocObject();
  v4 = a1;
  sub_1BC0C6D60();
  sub_1BC0B0C20();
  v5 = sub_1BC0C6D78();
  swift_release();
  return v5;
}

void sub_1BC0AD728(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
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

  v8 = sub_1BC0C6C4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain();
  sub_1BC0C6C34();
  v13 = a3;
  v14 = sub_1BC0C6C40();
  v15 = sub_1BC0C6FD0();
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
    v19 = sub_1BC0C72AC();
    v36 = v8;
    v38 = sub_1BC0A54E4(v19, v20, aBlock);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2081;
    v32[1] = v18 + 14;
    v21 = objc_msgSend(v13, sel_profileIdentifier);
    v22 = objc_msgSend(v21, sel_description);
    v23 = sub_1BC0C6EE0();
    v33 = v9;
    v24 = a4;
    v26 = v25;

    v12 = v37;
    v38 = sub_1BC0A54E4(v23, v26, aBlock);
    sub_1BC0C709C();

    a4 = v24;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v14, (os_log_type_t)v34, "[%s] Pushing shared summaries for %{private}s", (uint8_t *)v18, 0x16u);
    v27 = v35;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v27, -1, -1);
    MEMORY[0x1BCCEAE98](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6B60]), sel_initWithHealthStore_, v13);
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = sub_1BC0B0CA4;
  v29[3] = v12;
  v29[4] = v13;
  v29[5] = a4;
  aBlock[4] = (uint64_t)sub_1BC0B0D08;
  aBlock[5] = (uint64_t)v29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0ADF64;
  aBlock[3] = (uint64_t)&block_descriptor;
  v30 = _Block_copy(aBlock);
  v31 = v13;
  swift_release();
  objc_msgSend(v28, sel_pushWithCompletion_, v30);
  _Block_release(v30);

}

uint64_t sub_1BC0ADA74(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v4;
  char v5;

  v4 = a1;
  v5 = a2 & 1;
  return a3(&v4);
}

void sub_1BC0ADAAC(char a1, void *a2, void (*a3)(void *, uint64_t), uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  _QWORD v44[2];
  uint64_t v45;
  int v46;
  uint64_t v47;
  void (*v48)(void *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v50 = a4;
  v9 = sub_1BC0C6C4C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v44 - v14;
  if (a2)
  {
    v16 = a2;
    sub_1BC0C6C34();
    v17 = a2;
    v18 = a2;
    v19 = sub_1BC0C6C40();
    v20 = sub_1BC0C6FB8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v22 = v9;
      v23 = swift_slowAlloc();
      v52 = v23;
      *(_DWORD *)v21 = 136315394;
      v49 = v10;
      v24 = sub_1BC0C72AC();
      v51 = sub_1BC0A54E4(v24, v25, &v52);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      v51 = (uint64_t)a2;
      v26 = a2;
      sub_1BC0B04A0();
      v27 = sub_1BC0C6EF8();
      v51 = sub_1BC0A54E4(v27, v28, &v52);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1BC0A2000, v19, v20, "[%s] Shared Summaries Push Error: %{public}s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v23, -1, -1);
      MEMORY[0x1BCCEAE98](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v13, v22);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    v43 = a2;
    a3(a2, 1);

  }
  else
  {
    v49 = v10;
    sub_1BC0C6C34();
    v29 = a5;
    v30 = sub_1BC0C6C40();
    v31 = sub_1BC0C6FD0();
    v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      v33 = swift_slowAlloc();
      v47 = swift_slowAlloc();
      v52 = v47;
      *(_DWORD *)v33 = 136315651;
      v48 = a3;
      v34 = sub_1BC0C72AC();
      v46 = v32;
      v51 = sub_1BC0A54E4(v34, v35, &v52);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2081;
      v44[1] = v33 + 14;
      v36 = objc_msgSend(v29, sel_profileIdentifier);
      v37 = objc_msgSend(v36, sel_description);
      v38 = sub_1BC0C6EE0();
      v45 = v9;
      v39 = v38;
      v41 = v40;

      a3 = v48;
      v51 = sub_1BC0A54E4(v39, v41, &v52);
      sub_1BC0C709C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 22) = 1024;
      LODWORD(v51) = a1 & 1;
      sub_1BC0C709C();
      _os_log_impl(&dword_1BC0A2000, v30, (os_log_type_t)v46, "[%s] Successfully pushed shared summaries for %{private}s. Success: %{BOOL}d", (uint8_t *)v33, 0x1Cu);
      v42 = v47;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v42, -1, -1);
      MEMORY[0x1BCCEAE98](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v15, v45);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v49 + 8))(v15, v9);
    }
    a3((void *)(a1 & 1), 0);
  }
}

void sub_1BC0ADF64(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id GeneratorPipelineGenerationOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void GeneratorPipelineGenerationOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0AE010()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0AE03C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_1BC0B2704(v0 + qword_1ED6A8B68, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

id GeneratorPipelineGenerationOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GeneratorPipelineGenerationOperation(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0AE0F8(uint64_t a1)
{
  swift_release();
  swift_release();
  sub_1BC0B2704(a1 + qword_1ED6A8B68, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1BC0AE18C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + qword_1ED6A85C8);
}

uint64_t sub_1BC0AE19C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  type metadata accessor for GeneratorPipelineGenerationOperation.OperationError(0);
  sub_1BC0B2A9C(&qword_1ED6A85D0, type metadata accessor for GeneratorPipelineGenerationOperation.OperationError, (uint64_t)&protocol conformance descriptor for GeneratorPipelineGenerationOperation.OperationError);
  v6 = swift_allocError();
  v8 = v7;
  *a3 = v6;
  sub_1BC0A78C8();
  v10 = *(int *)(v9 + 48);
  v11 = sub_1BC0C6E38();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, a1, v11);
  *(_BYTE *)(v8 + v10) = a2;
  return result;
}

uint64_t sub_1BC0AE23C(void *a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), void (*a6)(uint64_t), void (*a7)(uint64_t))
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  void *v41;
  id v42;
  int v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  char *v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  char *v55;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  int v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  void (*v71)(char *, uint64_t);
  void (*v72)(uint64_t);
  char *v73;
  id v74;
  id v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  void (*v84)(char *, char *, uint64_t);
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  int v88;
  BOOL v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  void (*v100)(char *, uint64_t);
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  void (*v113)(uint64_t);
  void (*v114)(uint64_t);
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128[2];

  v113 = a6;
  v114 = a7;
  v125 = a2;
  sub_1BC0B236C(0, &qword_1ED6A7A18, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0C960C0]);
  v118 = v11;
  v122 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v121 = (char *)&v105 - v12;
  v13 = sub_1BC0C6C4C();
  v119 = *(_QWORD *)(v13 - 8);
  v120 = v13;
  v14 = MEMORY[0x1E0C80A78](v13);
  v115 = (char *)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v109 = (char *)&v105 - v17;
  MEMORY[0x1E0C80A78](v16);
  v117 = (char *)&v105 - v18;
  sub_1BC0B255C(0, a3, a4, a5, MEMORY[0x1E0D2EC90]);
  v112 = v19;
  v110 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v111 = (char *)&v105 - v20;
  v116 = sub_1BC0C6E38();
  v124 = *(_QWORD *)(v116 - 8);
  v21 = MEMORY[0x1E0C80A78](v116);
  v23 = (char *)&v105 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v21);
  v26 = (char *)&v105 - v25;
  v27 = MEMORY[0x1E0C80A78](v24);
  v29 = (char *)&v105 - v28;
  MEMORY[0x1E0C80A78](v27);
  v126 = (char *)&v105 - v30;
  sub_1BC0B2858(0, &qword_1ED6A8080, type metadata accessor for GeneratorPipelineGenerationOperation.OperationError, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v31);
  v33 = (char *)&v105 - v32;
  v34 = type metadata accessor for GeneratorPipelineGenerationOperation.OperationError(0);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = MEMORY[0x1E0C80A78](v34);
  v38 = (char *)&v105 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v36);
  v40 = (char *)&v105 - v39;
  v128[0] = (uint64_t)a1;
  v41 = a1;
  v42 = a1;
  v123 = sub_1BC0B04A0();
  v43 = swift_dynamicCast();
  v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  if (v43)
  {
    v107 = v29;
    v106 = v26;
    v115 = v23;
    v45 = v117;
    v44(v33, 0, 1, v34);
    sub_1BC0B2434((uint64_t)v33, (uint64_t)v40);
    v108 = v40;
    sub_1BC0A7D18((uint64_t)v40, (uint64_t)v38, type metadata accessor for GeneratorPipelineGenerationOperation.OperationError);
    sub_1BC0A78C8();
    v47 = v38[*(int *)(v46 + 48)];
    v48 = v38;
    v49 = v116;
    (*(void (**)(char *, char *, uint64_t))(v124 + 32))(v126, v48, v116);
    sub_1BC0C6B44();
    v50 = v111;
    sub_1BC0C6D24();
    swift_release();
    v51 = v112;
    v52 = sub_1BC0C6B2C();
    v53 = *(void (**)(char *, uint64_t))(v110 + 8);
    v53(v50, v51);
    v113(v52);
    swift_bridgeObjectRelease();
    sub_1BC0C6B44();
    sub_1BC0C6D24();
    swift_release();
    v54 = sub_1BC0C6B38();
    v53(v50, v51);
    v114(v54);
    swift_bridgeObjectRelease();
    if ((v47 & 1) != 0)
    {
      v55 = v45;
      sub_1BC0C6BF8();
      v56 = *(void (**)(char *, char *, uint64_t))(v124 + 16);
      v57 = v107;
      v56(v107, v126, v49);
      swift_retain_n();
      v58 = sub_1BC0C6C40();
      v59 = sub_1BC0C6FC4();
      v60 = v59;
      v61 = os_log_type_enabled(v58, v59);
      v62 = v118;
      v63 = (uint64_t)v108;
      if (!v61)
      {

        v98 = *(void (**)(char *, uint64_t))(v124 + 8);
        v98(v57, v49);
        swift_release_n();
        (*(void (**)(char *, uint64_t))(v119 + 8))(v55, v120);
        v98(v126, v49);
        v99 = v63;
LABEL_14:
        sub_1BC0B2704(v99, type metadata accessor for GeneratorPipelineGenerationOperation.OperationError);
        goto LABEL_15;
      }
      v64 = swift_slowAlloc();
      v114 = (void (*)(uint64_t))swift_slowAlloc();
      v128[0] = (uint64_t)v114;
      *(_DWORD *)v64 = 136315394;
      v65 = v49;
      v66 = sub_1BC0C72AC();
      v127 = sub_1BC0A54E4(v66, v67, v128);
      sub_1BC0C709C();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v64 + 12) = 2080;
      LODWORD(v125) = v60;
      v68 = v107;
      v56(v115, v107, v49);
      v69 = sub_1BC0C6EEC();
      v127 = sub_1BC0A54E4(v69, v70, v128);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      v71 = *(void (**)(char *, uint64_t))(v124 + 8);
      v71(v68, v65);
      _os_log_impl(&dword_1BC0A2000, v58, (os_log_type_t)v125, "[%s] Launch generation has failed to complete within %s", (uint8_t *)v64, 0x16u);
      v72 = v114;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v72, -1, -1);
      MEMORY[0x1BCCEAE98](v64, -1, -1);

      (*(void (**)(char *, uint64_t))(v119 + 8))(v117, v120);
      v71(v126, v65);
    }
    else
    {
      v83 = v109;
      sub_1BC0C6BF8();
      v84 = *(void (**)(char *, char *, uint64_t))(v124 + 16);
      v85 = v106;
      v84(v106, v126, v49);
      swift_retain_n();
      v86 = sub_1BC0C6C40();
      v87 = sub_1BC0C6FC4();
      v88 = v87;
      v89 = os_log_type_enabled(v86, v87);
      v62 = v118;
      if (v89)
      {
        v90 = swift_slowAlloc();
        LODWORD(v114) = v88;
        v91 = v90;
        v117 = (char *)swift_slowAlloc();
        v128[0] = (uint64_t)v117;
        *(_DWORD *)v91 = 136315394;
        v92 = sub_1BC0C72AC();
        v127 = sub_1BC0A54E4(v92, v93, v128);
        sub_1BC0C709C();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v91 + 12) = 2080;
        v84(v115, v85, v49);
        v94 = sub_1BC0C6EEC();
        v127 = sub_1BC0A54E4(v94, v95, v128);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        v96 = *(void (**)(char *, uint64_t))(v124 + 8);
        v96(v85, v49);
        _os_log_impl(&dword_1BC0A2000, v86, (os_log_type_t)v114, "[%s] Background generation has failed to complete within %s", (uint8_t *)v91, 0x16u);
        v97 = v117;
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v97, -1, -1);
        MEMORY[0x1BCCEAE98](v91, -1, -1);

        (*(void (**)(char *, uint64_t))(v119 + 8))(v109, v120);
        v96(v126, v49);
      }
      else
      {

        v100 = *(void (**)(char *, uint64_t))(v124 + 8);
        v100(v85, v49);
        swift_release_n();
        (*(void (**)(char *, uint64_t))(v119 + 8))(v83, v120);
        v100(v126, v49);
      }
    }
    v99 = (uint64_t)v108;
    goto LABEL_14;
  }
  v44(v33, 1, 1, v34);
  sub_1BC0B0688((uint64_t)v33, &qword_1ED6A8080, type metadata accessor for GeneratorPipelineGenerationOperation.OperationError);
  v73 = v115;
  sub_1BC0C6BF8();
  v74 = v41;
  v75 = v41;
  v76 = sub_1BC0C6C40();
  v77 = sub_1BC0C6FB8();
  if (os_log_type_enabled(v76, v77))
  {
    v78 = swift_slowAlloc();
    v79 = swift_slowAlloc();
    v128[0] = v79;
    *(_DWORD *)v78 = 136315394;
    v127 = sub_1BC0A54E4(0xD00000000000001ALL, 0x80000001BC0C8A70, v128);
    sub_1BC0C709C();
    *(_WORD *)(v78 + 12) = 2080;
    v127 = (uint64_t)v41;
    v80 = v41;
    v81 = sub_1BC0C6EF8();
    v127 = sub_1BC0A54E4(v81, v82, v128);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC0A2000, v76, v77, "[%s] logGenerationError: %s", (uint8_t *)v78, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v79, -1, -1);
    MEMORY[0x1BCCEAE98](v78, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v119 + 8))(v73, v120);
  v62 = v118;
LABEL_15:
  v101 = v121;
  v102 = v122;
  sub_1BC0C6D48();
  sub_1BC0B23D4();
  v103 = sub_1BC0C6D78();
  (*(void (**)(char *, uint64_t))(v102 + 8))(v101, v62);
  return v103;
}

uint64_t sub_1BC0AECD8(uint64_t a1, uint64_t a2)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  os_log_t v43;
  uint64_t v44;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  os_log_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  _QWORD v59[4];
  uint64_t v60;

  sub_1BC0B039C();
  v57 = v3;
  MEMORY[0x1E0C80A78](v3);
  v56 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BC0C67E4();
  v54 = *(_QWORD *)(v5 - 8);
  v55 = v5;
  MEMORY[0x1E0C80A78](v5);
  v53 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B2858(0, &qword_1ED6A76F0, (uint64_t (*)(uint64_t))sub_1BC0B039C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v47 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v47 - v16;
  v18 = sub_1BC0C6C4C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v22(v17, a2, v8);
  v22(v15, a2, v8);
  v58 = v12;
  v22(v12, a2, v8);
  v23 = sub_1BC0C6C40();
  v24 = sub_1BC0C6FB8();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v26 = swift_slowAlloc();
    v49 = v25;
    v27 = v26;
    v50 = swift_slowAlloc();
    v60 = v50;
    *(_DWORD *)v27 = 136315650;
    v48 = v23;
    sub_1BC0C6B8C();
    v51 = v19;
    v52 = v18;
    __swift_project_boxed_opaque_existential_1(v59, v59[3]);
    v28 = sub_1BC0C6718();
    v30 = v29;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
    v59[0] = sub_1BC0A54E4(v28, v30, &v60);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v31 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    v32 = v31(v17, v8);
    *(_WORD *)(v27 + 12) = 2080;
    MEMORY[0x1E0C80A78](v32);
    sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    *(&v47 - 4) = v33;
    sub_1BC0B0378(0);
    *(&v47 - 3) = v34;
    *(&v47 - 2) = sub_1BC0B04F4();
    *(&v47 - 1) = sub_1BC0B1B58();
    swift_getKeyPath();
    v35 = v53;
    sub_1BC0C6B98();
    swift_release();
    v36 = (void *)sub_1BC0C67D8();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v35, v55);
    v37 = sub_1BC0C67A8();
    v39 = v38;

    v59[0] = sub_1BC0A54E4(v37, v39, &v60);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v31(v15, v8);
    *(_WORD *)(v27 + 22) = 2082;
    v40 = v58;
    sub_1BC0C6BA4();
    v41 = sub_1BC0C6EEC();
    v59[0] = sub_1BC0A54E4(v41, v42, &v60);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v31(v40, v8);
    v43 = v48;
    _os_log_impl(&dword_1BC0A2000, v48, (os_log_type_t)v49, "Outstanding pipeline: %s | %s | %{public}s", (uint8_t *)v27, 0x20u);
    v44 = v50;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v44, -1, -1);
    MEMORY[0x1BCCEAE98](v27, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v21, v52);
  }
  else
  {
    v46 = *(void (**)(char *, uint64_t))(v9 + 8);
    v46(v17, v8);
    v46(v15, v8);
    v46(v58, v8);

    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
}

uint64_t sub_1BC0AF1AC()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_1BC0C6A78();
}

uint64_t sub_1BC0AF23C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(_QWORD), uint64_t a5, const char *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  void (*v24)(_BYTE *, uint64_t, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t (*v32)(_BYTE *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  unint64_t v43;
  os_log_t v44;
  uint64_t v45;
  void (*v47)(_BYTE *, uint64_t);
  _BYTE v48[4];
  int v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  const char *v59;
  uint64_t v60;
  _BYTE *v61;
  _QWORD v62[4];
  uint64_t v63[2];

  v59 = a6;
  v56 = a5;
  v60 = a3(0);
  MEMORY[0x1E0C80A78](v60);
  v58 = &v48[-v8];
  v57 = sub_1BC0C67E4();
  v55 = *(_QWORD *)(v57 - 8);
  MEMORY[0x1E0C80A78](v57);
  v54 = &v48[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = a4(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = &v48[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = &v48[-v16];
  MEMORY[0x1E0C80A78](v15);
  v19 = &v48[-v18];
  v20 = sub_1BC0C6C4C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = &v48[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BC0C6BF8();
  v24 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16);
  v24(v19, a2, v10);
  v24(v17, a2, v10);
  v61 = v14;
  v24(v14, a2, v10);
  v25 = sub_1BC0C6C40();
  v26 = sub_1BC0C6FB8();
  v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    v28 = swift_slowAlloc();
    v51 = swift_slowAlloc();
    v63[0] = v51;
    *(_DWORD *)v28 = 136315650;
    v53 = v21;
    v50 = v25;
    sub_1BC0C6B8C();
    v49 = v27;
    v52 = v20;
    __swift_project_boxed_opaque_existential_1(v62, v62[3]);
    v29 = sub_1BC0C6718();
    v31 = v30;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v62);
    v62[0] = sub_1BC0A54E4(v29, v31, v63);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v32 = *(uint64_t (**)(_BYTE *, uint64_t))(v11 + 8);
    v33 = v32(v19, v10);
    *(_WORD *)(v28 + 12) = 2080;
    MEMORY[0x1E0C80A78](v33);
    sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    *(_QWORD *)&v48[-32] = v34;
    sub_1BC0B110C(0);
    *(_QWORD *)&v48[-24] = v35;
    *(_QWORD *)&v48[-16] = sub_1BC0B04F4();
    *(_QWORD *)&v48[-8] = sub_1BC0B11F0();
    swift_getKeyPath();
    v36 = v54;
    sub_1BC0C6B98();
    swift_release();
    v37 = (void *)sub_1BC0C67D8();
    (*(void (**)(_BYTE *, uint64_t))(v55 + 8))(v36, v57);
    v38 = sub_1BC0C67A8();
    v40 = v39;

    v62[0] = sub_1BC0A54E4(v38, v40, v63);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v32(v17, v10);
    *(_WORD *)(v28 + 22) = 2082;
    v41 = v61;
    sub_1BC0C6BA4();
    v42 = sub_1BC0C6EEC();
    v62[0] = sub_1BC0A54E4(v42, v43, v63);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v32(v41, v10);
    v44 = v50;
    _os_log_impl(&dword_1BC0A2000, v50, (os_log_type_t)v49, v59, (uint8_t *)v28, 0x20u);
    v45 = v51;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v45, -1, -1);
    MEMORY[0x1BCCEAE98](v28, -1, -1);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v53 + 8))(v23, v52);
  }
  else
  {
    v47 = *(void (**)(_BYTE *, uint64_t))(v11 + 8);
    v47(v19, v10);
    v47(v17, v10);
    v47(v61, v10);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v21 + 8))(v23, v20);
  }
}

uint64_t sub_1BC0AF700(uint64_t a1, uint64_t a2)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t (*v31)(char *, uint64_t);
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  char *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  os_log_t v43;
  uint64_t v44;
  void (*v46)(char *, uint64_t);
  os_log_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  _QWORD v59[4];
  uint64_t v60;

  sub_1BC0B1320(0, &qword_1ED6A8668, &qword_1ED6A85E8, MEMORY[0x1E0D2E1B0], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0D2EA90]);
  v56 = v3;
  MEMORY[0x1E0C80A78](v3);
  v55 = (char *)&v47 - v4;
  v5 = sub_1BC0C67E4();
  v53 = *(_QWORD *)(v5 - 8);
  v54 = v5;
  MEMORY[0x1E0C80A78](v5);
  v52 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B25CC();
  v8 = v7;
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v47 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v47 - v16;
  v18 = sub_1BC0C6C4C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v22(v17, a2, v8);
  v22(v15, a2, v8);
  v58 = v12;
  v22(v12, a2, v8);
  v57 = v21;
  v23 = sub_1BC0C6C40();
  v24 = sub_1BC0C6FB8();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v26 = swift_slowAlloc();
    v48 = v25;
    v27 = v26;
    v49 = swift_slowAlloc();
    v60 = v49;
    *(_DWORD *)v27 = 136315650;
    v47 = v23;
    sub_1BC0C6B8C();
    v50 = v19;
    v51 = v18;
    __swift_project_boxed_opaque_existential_1(v59, v59[3]);
    v28 = sub_1BC0C6718();
    v30 = v29;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
    v59[0] = sub_1BC0A54E4(v28, v30, &v60);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v31 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    v32 = v31(v17, v8);
    *(_WORD *)(v27 + 12) = 2080;
    MEMORY[0x1E0C80A78](v32);
    sub_1BC0B236C(0, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    *(&v47 - 4) = v33;
    sub_1BC0B0378(0);
    *(&v47 - 3) = v34;
    *(&v47 - 2) = (os_log_t)sub_1BC0B04F4();
    *(&v47 - 1) = (os_log_t)sub_1BC0B1B58();
    swift_getKeyPath();
    v35 = v52;
    sub_1BC0C6B98();
    swift_release();
    v36 = (void *)sub_1BC0C67D8();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v35, v54);
    v37 = sub_1BC0C67A8();
    v39 = v38;

    v59[0] = sub_1BC0A54E4(v37, v39, &v60);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v31(v15, v8);
    *(_WORD *)(v27 + 22) = 2082;
    v40 = v58;
    sub_1BC0C6BA4();
    v41 = sub_1BC0C6EEC();
    v59[0] = sub_1BC0A54E4(v41, v42, &v60);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    v31(v40, v8);
    v43 = v47;
    _os_log_impl(&dword_1BC0A2000, v47, (os_log_type_t)v48, "Outstanding generator: %s | %s | %{public}s", (uint8_t *)v27, 0x20u);
    v44 = v49;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v44, -1, -1);
    MEMORY[0x1BCCEAE98](v27, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v57, v51);
  }
  else
  {
    v46 = *(void (**)(char *, uint64_t))(v9 + 8);
    v46(v17, v8);
    v46(v15, v8);
    v46(v58, v8);

    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v57, v18);
  }
}

uint64_t sub_1BC0AFBD4()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_1BC0C6A84();
}

void sub_1BC0AFCAC(void *a1, char a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = a2 & 1;
  v4 = sub_1BC0C6C4C();
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  MEMORY[0x1E0C80A78](v4);
  v28 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BC0C66A0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v10 = a1;
    sub_1BC0C6694();
    sub_1BC0BBB38(v3, a1, &v36);
    v11 = v36;
    v12 = v37;
    v13 = v38;
    v14 = v39;
    v15 = v40;
    v16 = v41;

  }
  else
  {
    sub_1BC0C6694();
    sub_1BC0BB88C(v3, (uint64_t)v9, &v36);
    v11 = v36;
    v12 = v37;
    v13 = v38;
    v14 = v39;
    v15 = v40;
    v16 = v41;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = v28;
  sub_1BC0C6C34();
  sub_1BC0B275C(v11, v12, v13, v14, v15, v16);
  sub_1BC0B275C(v11, v12, v13, v14, v15, v16);
  v18 = sub_1BC0C6C40();
  v19 = sub_1BC0C6FD0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v29 = v25;
    *(_DWORD *)v20 = 136315394;
    v30 = sub_1BC0A54E4(0xD00000000000001ALL, 0x80000001BC0C8A70, &v29);
    sub_1BC0C709C();
    *(_WORD *)(v20 + 12) = 2080;
    v24 = v20 + 14;
    v30 = (uint64_t)v11;
    v31 = v12;
    v32 = v13;
    v33 = v14;
    v34 = v15;
    v35 = v16;
    sub_1BC0B275C(v11, v12, v13, v14, v15, v16);
    sub_1BC0A68DC(0, &qword_1ED6A78E8, (uint64_t)&type metadata for BackgroundGenerationAnalyticsEvent, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
    v21 = sub_1BC0C6EEC();
    v30 = sub_1BC0A54E4(v21, v22, &v29);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    sub_1BC0B27B8(v11, v12, v13, v14, v15, v16);
    sub_1BC0B27B8(v11, v12, v13, v14, v15, v16);
    _os_log_impl(&dword_1BC0A2000, v18, v19, "[%s] Submitting background generation analytics: %s", (uint8_t *)v20, 0x16u);
    v23 = v25;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v23, -1, -1);
    MEMORY[0x1BCCEAE98](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {
    sub_1BC0B27B8(v11, v12, v13, v14, v15, v16);
    sub_1BC0B27B8(v11, v12, v13, v14, v15, v16);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
  }
  v30 = (uint64_t)v11;
  v31 = v12;
  v32 = v13;
  v33 = v14;
  v34 = v15;
  v35 = v16;
  sub_1BC0B2814();
  sub_1BC0C6940();
  sub_1BC0B27B8(v11, v12, v13, v14, v15, v16);
}

uint64_t sub_1BC0B0080(unint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  void *v11;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v7)
      break;
    v16 = MEMORY[0x1E0DEE9D8];
    result = sub_1BC0C718C();
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }
    v9 = 0;
    while (v7 != v9)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x1BCCEA8D4](v9, a1);
      else
        v10 = *(id *)(a1 + 8 * v9 + 32);
      v11 = v10;
      v14 = v10;
      sub_1BC0ACC60(&v14, a2, a3, a4, &v15);

      if (v4)
        return swift_release();
      ++v9;
      sub_1BC0C7174();
      sub_1BC0C7198();
      sub_1BC0C71A4();
      sub_1BC0C7180();
      if (v7 == v9)
        return v16;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v7 = sub_1BC0C71D4();
    swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1BC0B01EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  char *v9;
  uint64_t v16;
  char *v17;
  char *v18;
  id v19;
  objc_super v23;

  v16 = qword_1ED6A8B88;
  sub_1BC0C68F8();
  swift_allocObject();
  v17 = v9;
  *(_QWORD *)&v9[v16] = sub_1BC0C68EC();
  *(_QWORD *)&v17[qword_1ED6A8630] = a1;
  *(_QWORD *)&v17[qword_1ED6A8638] = a2;
  *(_QWORD *)&v17[qword_1ED6A8B58] = a5;
  v18 = &v17[qword_1ED6A8B60];
  *(_QWORD *)v18 = a3;
  *((_QWORD *)v18 + 1) = a4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v17[qword_1ED6A85C8] = sub_1BC0C6B14() & 1;
  sub_1BC0A7D18(a6, (uint64_t)&v17[qword_1ED6A8B68], (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  *(_QWORD *)&v17[qword_1ED6A8B80] = a7;
  v17[qword_1ED6A78F0] = a8;
  v17[qword_1ED6A8068] = a9;

  v23.receiver = v17;
  v23.super_class = (Class)type metadata accessor for GeneratorPipelineGenerationOperation(0);
  v19 = objc_msgSendSuper2(&v23, sel_init);
  sub_1BC0B2704(a6, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  return v19;
}

void sub_1BC0B0378(uint64_t a1)
{
  sub_1BC0B255C(a1, &qword_1ED6A8680, (uint64_t (*)(uint64_t))sub_1BC0B039C, sub_1BC0B0484, MEMORY[0x1E0D2EB50]);
}

void sub_1BC0B039C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8648)
  {
    sub_1BC0B1320(255, &qword_1ED6A8668, &qword_1ED6A85E8, MEMORY[0x1E0D2E1B0], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0D2EA90]);
    sub_1BC0B041C();
    v0 = sub_1BC0C6A90();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8648);
  }
}

unint64_t sub_1BC0B041C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A8660;
  if (!qword_1ED6A8660)
  {
    sub_1BC0B1320(255, &qword_1ED6A8668, &qword_1ED6A85E8, MEMORY[0x1E0D2E1B0], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0D2EA90]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0D2EA98], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A8660);
  }
  return result;
}

uint64_t sub_1BC0B0484()
{
  return sub_1BC0B2A9C(&qword_1ED6A8640, (uint64_t (*)(uint64_t))sub_1BC0B039C, MEMORY[0x1E0D2EA88]);
}

unint64_t sub_1BC0B04A0()
{
  unint64_t result;

  result = qword_1ED6A86C0;
  if (!qword_1ED6A86C0)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A86C0);
  }
  return result;
}

unint64_t sub_1BC0B04F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A79F8;
  if (!qword_1ED6A79F8)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95D90], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A79F8);
  }
  return result;
}

void sub_1BC0B0554()
{
  uint64_t (*v0)(uint64_t, uint64_t, unint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED6A8130)
  {
    v0 = (uint64_t (*)(uint64_t, uint64_t, unint64_t))MEMORY[0x1E0D2E7E8];
    sub_1BC0B1F88(255, &qword_1ED6A8118, MEMORY[0x1E0D2E7E8]);
    sub_1BC0B05EC(&qword_1ED6A8110, &qword_1ED6A8118, v0, MEMORY[0x1E0D2E7F8]);
    v1 = sub_1BC0C6C7C();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED6A8130);
  }
}

uint64_t sub_1BC0B05EC(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_1BC0B1F88(255, a2, a3);
    result = MEMORY[0x1BCCEADF0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0B062C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0B2858(0, &qword_1ED6A80F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF2118], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC0B0688(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1BC0B2858(0, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_1BC0B06CC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1BC0B06F0(void **a1)
{
  uint64_t v1;

  sub_1BC0A8A04(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1BC0B06F8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + qword_1ED6A78F0);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1BC0B0748(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + qword_1ED6A78F0);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

void sub_1BC0B0794()
{
  unint64_t v0;

  sub_1BC0A7B14();
  if (v0 <= 0x3F)
    swift_initClassMetadata2();
}

uint64_t method lookup function for GeneratorPipelineGenerationOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GeneratorPipelineGenerationOperation.commitAsUrgent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for GeneratorPipelineGenerationOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 80))();
}

uint64_t dispatch thunk of GeneratorPipelineGenerationOperation.commitAsUrgent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for GeneratorPipelineGenerationOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 88))();
}

uint64_t dispatch thunk of GeneratorPipelineGenerationOperation.commitAsUrgent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for GeneratorPipelineGenerationOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 96))();
}

uint64_t dispatch thunk of GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:timeoutProvider:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for GeneratorPipelineGenerationOperation + v0 + 104))();
}

uint64_t sub_1BC0B08F0()
{
  return type metadata accessor for GeneratorPipelineGenerationOperation(0);
}

_QWORD *initializeBufferWithCopyOfBuffer for GeneratorPipelineGenerationOperation.OperationError(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_1BC0C6E38();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    sub_1BC0A78C8();
    *((_BYTE *)a1 + *(int *)(v7 + 48)) = *((_BYTE *)a2 + *(int *)(v7 + 48));
  }
  return a1;
}

uint64_t destroy for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BC0C6E38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BC0C6E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  sub_1BC0A78C8();
  *(_BYTE *)(a1 + *(int *)(v5 + 48)) = *(_BYTE *)(a2 + *(int *)(v5 + 48));
  return a1;
}

uint64_t assignWithCopy for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BC0C6E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  sub_1BC0A78C8();
  *(_BYTE *)(a1 + *(int *)(v5 + 48)) = *(_BYTE *)(a2 + *(int *)(v5 + 48));
  return a1;
}

uint64_t initializeWithTake for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BC0C6E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  sub_1BC0A78C8();
  *(_BYTE *)(a1 + *(int *)(v5 + 48)) = *(_BYTE *)(a2 + *(int *)(v5 + 48));
  return a1;
}

uint64_t assignWithTake for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BC0C6E38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  sub_1BC0A78C8();
  *(_BYTE *)(a1 + *(int *)(v5 + 48)) = *(_BYTE *)(a2 + *(int *)(v5 + 48));
  return a1;
}

uint64_t getEnumTagSinglePayload for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0A78C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for GeneratorPipelineGenerationOperation.OperationError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_1BC0A78C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_1BC0B0B98()
{
  return 0;
}

uint64_t sub_1BC0B0BA0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  int v4;

  result = sub_1BC0C6E38();
  if (v3 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = v4;
  }
  return result;
}

void sub_1BC0B0C18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BC0AD728(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

unint64_t sub_1BC0B0C20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF3EF288;
  if (!qword_1EF3EF288)
  {
    sub_1BC0B236C(255, (unint64_t *)&qword_1EF3EF280, MEMORY[0x1E0DEAFA0], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C960D8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C96108], v1);
    atomic_store(result, (unint64_t *)&qword_1EF3EF288);
  }
  return result;
}

uint64_t sub_1BC0B0C80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0B0CA4(uint64_t a1, char a2)
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

uint64_t sub_1BC0B0CDC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1BC0B0D08(char a1, void *a2)
{
  uint64_t v2;

  sub_1BC0ADAAC(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_1BC0B0D1C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7C08)
  {
    sub_1BC0B0DA0();
    sub_1BC0B2A9C(&qword_1ED6A79C0, (uint64_t (*)(uint64_t))sub_1BC0B0DA0, MEMORY[0x1E0C95D90]);
    v0 = sub_1BC0C6C88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7C08);
  }
}

void sub_1BC0B0DA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A79C8)
  {
    sub_1BC0B2858(255, &qword_1ED6A8698, (uint64_t (*)(uint64_t))sub_1BC0B0E24, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
    sub_1BC0B04A0();
    v0 = sub_1BC0C6CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A79C8);
  }
}

void sub_1BC0B0E24(uint64_t a1)
{
  sub_1BC0B2858(a1, &qword_1ED6A86B8, MEMORY[0x1E0D2E350], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

uint64_t sub_1BC0B0E40()
{
  return sub_1BC0B2A9C(&qword_1ED6A7C00, (uint64_t (*)(uint64_t))sub_1BC0B0D1C, MEMORY[0x1E0C95950]);
}

void sub_1BC0B0E5C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7C28)
  {
    sub_1BC0B195C(255, &qword_1ED6A7708, (void (*)(uint64_t))sub_1BC0B0F4C, (void (*)(void))sub_1BC0B0FB0);
    sub_1BC0B255C(255, &qword_1ED6A7C18, (uint64_t (*)(uint64_t))sub_1BC0B0D1C, sub_1BC0B0E40, MEMORY[0x1E0C95B50]);
    sub_1BC0B0FCC();
    sub_1BC0B102C(&qword_1ED6A7C10, &qword_1ED6A7C18, (uint64_t (*)(uint64_t))sub_1BC0B0D1C, sub_1BC0B0E40);
    v0 = sub_1BC0C6CAC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7C28);
  }
}

void sub_1BC0B0F4C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A79E8)
  {
    v0 = sub_1BC0C6CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A79E8);
  }
}

uint64_t sub_1BC0B0FB0()
{
  return sub_1BC0B2A9C(&qword_1ED6A79E0, (uint64_t (*)(uint64_t))sub_1BC0B0F4C, MEMORY[0x1E0C95D90]);
}

unint64_t sub_1BC0B0FCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7948;
  if (!qword_1ED6A7948)
  {
    sub_1BC0B195C(255, &qword_1ED6A7708, (void (*)(uint64_t))sub_1BC0B0F4C, (void (*)(void))sub_1BC0B0FB0);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95850], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7948);
  }
  return result;
}

uint64_t sub_1BC0B102C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    sub_1BC0B255C(255, a2, a3, a4, MEMORY[0x1E0C95B50]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95B60], v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0B1074()
{
  return sub_1BC0B2A9C(&qword_1ED6A7C20, (uint64_t (*)(uint64_t))sub_1BC0B0E5C, MEMORY[0x1E0C95B78]);
}

void sub_1BC0B1090()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7A10)
  {
    sub_1BC0B2858(255, &qword_1ED6A8698, (uint64_t (*)(uint64_t))sub_1BC0B0E24, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
    v0 = sub_1BC0C6D18();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7A10);
  }
}

void sub_1BC0B110C(uint64_t a1)
{
  sub_1BC0B255C(a1, &qword_1ED6A8688, (uint64_t (*)(uint64_t))sub_1BC0B1130, sub_1BC0B11D4, MEMORY[0x1E0D2EB50]);
}

void sub_1BC0B1130(uint64_t a1)
{
  sub_1BC0B255C(a1, &qword_1ED6A8658, (uint64_t (*)(uint64_t))sub_1BC0B1154, sub_1BC0B11B8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0D2EA80]);
}

void sub_1BC0B1154()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8678)
  {
    sub_1BC0B0E24(255);
    v0 = sub_1BC0C6A9C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8678);
  }
}

uint64_t sub_1BC0B11B8()
{
  return sub_1BC0B2A9C(&qword_1ED6A8670, (uint64_t (*)(uint64_t))sub_1BC0B1154, MEMORY[0x1E0D2EA98]);
}

uint64_t sub_1BC0B11D4()
{
  return sub_1BC0B2A9C(&qword_1ED6A8650, (uint64_t (*)(uint64_t))sub_1BC0B1130, MEMORY[0x1E0D2EA88]);
}

uint64_t sub_1BC0B11F0()
{
  return sub_1BC0B2A9C(&qword_1ED6A76C8, (uint64_t (*)(uint64_t))sub_1BC0B110C, MEMORY[0x1E0D2EB58]);
}

uint64_t sub_1BC0B120C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0B1230@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1BC0AC5F8(*(_QWORD *)(v1 + 16), *(char **)(v1 + 24), a1);
}

unint64_t sub_1BC0B1238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7BF0;
  if (!qword_1ED6A7BF0)
  {
    sub_1BC0B255C(255, &qword_1ED6A7BF8, (uint64_t (*)(uint64_t))sub_1BC0B0E5C, sub_1BC0B1074, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C957C8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C957D0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7BF0);
  }
  return result;
}

void sub_1BC0B12A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8150)
  {
    sub_1BC0B1320(255, &qword_1ED6A8190, &qword_1ED6A81C8, MEMORY[0x1E0D2D700], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B139C();
    v0 = sub_1BC0C6CA0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8150);
  }
}

void sub_1BC0B1320(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1BC0A68DC(255, a3, a4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v9 = a5(a1, v8, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

unint64_t sub_1BC0B139C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A8188;
  if (!qword_1ED6A8188)
  {
    sub_1BC0B1320(255, &qword_1ED6A8190, &qword_1ED6A81C8, MEMORY[0x1E0D2D700], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0C95D78]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95D90], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A8188);
  }
  return result;
}

void sub_1BC0B1404()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8170)
  {
    sub_1BC0B0F4C();
    sub_1BC0B12A0();
    sub_1BC0B0FB0();
    sub_1BC0B2A9C(&qword_1ED6A8148, (uint64_t (*)(uint64_t))sub_1BC0B12A0, MEMORY[0x1E0C95A38]);
    v0 = sub_1BC0C6CAC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8170);
  }
}

unint64_t sub_1BC0B14B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A8198;
  if (!qword_1ED6A8198)
  {
    sub_1BC0A68DC(255, &qword_1ED6A7710, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96098]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C960B0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A8198);
  }
  return result;
}

uint64_t sub_1BC0B1510()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC0B1534()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1BC0B1560@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC0AC93C(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

void sub_1BC0B156C(uint64_t a1)
{
  sub_1BC0B255C(a1, &qword_1ED6A8180, (uint64_t (*)(uint64_t))sub_1BC0B0F4C, sub_1BC0B0FB0, MEMORY[0x1E0C95C60]);
}

uint64_t sub_1BC0B1590()
{
  return sub_1BC0B2A9C(&qword_1ED6A8178, (uint64_t (*)(uint64_t))sub_1BC0B156C, MEMORY[0x1E0C95C80]);
}

void sub_1BC0B15AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8140)
  {
    sub_1BC0B255C(255, &qword_1ED6A8160, (uint64_t (*)(uint64_t))sub_1BC0B156C, sub_1BC0B1590, MEMORY[0x1E0C95B50]);
    sub_1BC0B1634();
    v0 = sub_1BC0C6C88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8140);
  }
}

unint64_t sub_1BC0B1634()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A8158;
  if (!qword_1ED6A8158)
  {
    sub_1BC0B255C(255, &qword_1ED6A8160, (uint64_t (*)(uint64_t))sub_1BC0B156C, sub_1BC0B1590, MEMORY[0x1E0C95B50]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95B60], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A8158);
  }
  return result;
}

unint64_t sub_1BC0B169C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A81E0;
  if (!qword_1ED6A81E0)
  {
    sub_1BC0B2858(255, &qword_1ED6A81D8, (uint64_t (*)(uint64_t))sub_1BC0B0F4C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A81E0);
  }
  return result;
}

void sub_1BC0B16FC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  if (!qword_1ED6A82F8)
  {
    v2 = MEMORY[0x1BCCEADC0](0, a2, MEMORY[0x1E0D2E478], 0);
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_1ED6A82F8);
  }
}

void sub_1BC0B1754(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  if (!qword_1ED6A8308)
  {
    sub_1BC0B16FC(255, a2);
    swift_getOpaqueTypeConformance2();
    v2 = sub_1BC0C6C88();
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_1ED6A8308);
  }
}

void sub_1BC0B17C8(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  if (!qword_1ED6A8318)
  {
    sub_1BC0B1754(255, a2);
    sub_1BC0A68DC(255, &qword_1ED6A7710, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96098]);
    sub_1BC0B2A9C(&qword_1ED6A8300, (uint64_t (*)(uint64_t))sub_1BC0B1754, MEMORY[0x1E0C95950]);
    sub_1BC0B14B0();
    v2 = sub_1BC0C6C94();
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_1ED6A8318);
  }
}

uint64_t sub_1BC0B1884()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0B18A8()
{
  uint64_t v0;

  return sub_1BC0AD018(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1BC0B18B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1BC0B18DC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1BC0AD2B0(a1, *(void **)(v2 + 16), a2);
}

void sub_1BC0B18E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8108)
  {
    sub_1BC0A68DC(255, &qword_1ED6A7710, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96098]);
    sub_1BC0B14B0();
    v0 = sub_1BC0C6C58();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8108);
  }
}

void sub_1BC0B195C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a3(255);
    sub_1BC0B04A0();
    a4();
    v6 = sub_1BC0C6C70();
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_1BC0B19E8()
{
  return sub_1BC0B2A9C(&qword_1ED6A8100, (uint64_t (*)(uint64_t))sub_1BC0B18E4, MEMORY[0x1E0C957D0]);
}

void sub_1BC0B1A04()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A79B8)
  {
    sub_1BC0B1A70();
    sub_1BC0B04A0();
    v0 = sub_1BC0C6CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A79B8);
  }
}

void sub_1BC0B1A70()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8690)
  {
    sub_1BC0A68DC(255, &qword_1ED6A85E8, MEMORY[0x1E0D2E1B0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v0 = sub_1BC0C6BB0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8690);
  }
}

uint64_t sub_1BC0B1ADC()
{
  return sub_1BC0B2A9C(&qword_1ED6A79B0, (uint64_t (*)(uint64_t))sub_1BC0B1A04, MEMORY[0x1E0C95D90]);
}

unint64_t sub_1BC0B1AF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7AF8[0];
  if (!qword_1ED6A7AF8[0])
  {
    sub_1BC0B195C(255, &qword_1ED6A8120, (void (*)(uint64_t))sub_1BC0B18E4, (void (*)(void))sub_1BC0B19E8);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95850], v1);
    atomic_store(result, qword_1ED6A7AF8);
  }
  return result;
}

uint64_t sub_1BC0B1B58()
{
  return sub_1BC0B2A9C(&qword_1ED6A76C0, (uint64_t (*)(uint64_t))sub_1BC0B0378, MEMORY[0x1E0D2EB58]);
}

unint64_t sub_1BC0B1B74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7938;
  if (!qword_1ED6A7938)
  {
    sub_1BC0B255C(255, &qword_1ED6A7940, (uint64_t (*)(uint64_t))sub_1BC0B1A04, sub_1BC0B1ADC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C957C8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C957D0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7938);
  }
  return result;
}

void sub_1BC0B1BDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7748)
  {
    sub_1BC0B2960(255, &qword_1ED6A7750);
    sub_1BC0B04A0();
    v0 = sub_1BC0C6CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7748);
  }
}

uint64_t sub_1BC0B1C58()
{
  return sub_1BC0B2A9C(&qword_1ED6A79F0, (uint64_t (*)(uint64_t))sub_1BC0B1BDC, MEMORY[0x1E0C95D90]);
}

void sub_1BC0B1C74()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7740)
  {
    sub_1BC0B236C(255, &qword_1ED6A86B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B255C(255, &qword_1ED6A7970, (uint64_t (*)(uint64_t))sub_1BC0B1BDC, sub_1BC0B1C58, MEMORY[0x1E0C95B50]);
    sub_1BC0B1D68();
    sub_1BC0B102C(&qword_1ED6A7968, &qword_1ED6A7970, (uint64_t (*)(uint64_t))sub_1BC0B1BDC, sub_1BC0B1C58);
    v0 = sub_1BC0C6CAC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7740);
  }
}

unint64_t sub_1BC0B1D68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A86A8;
  if (!qword_1ED6A86A8)
  {
    sub_1BC0B236C(255, &qword_1ED6A86B0, MEMORY[0x1E0DEE9C0] + 8, (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95D90], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A86A8);
  }
  return result;
}

uint64_t sub_1BC0B1DCC@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1BC0A9D98(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

void sub_1BC0B1DD4(void **a1)
{
  uint64_t v1;

  sub_1BC0AA718(a1, *(_QWORD *)(v1 + 16));
}

void sub_1BC0B1DDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7950)
  {
    sub_1BC0B236C(255, &qword_1ED6A79D8, MEMORY[0x1E0DEAFA0], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B1E60();
    v0 = sub_1BC0C6C88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7950);
  }
}

unint64_t sub_1BC0B1E60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A79D0;
  if (!qword_1ED6A79D0)
  {
    sub_1BC0B236C(255, &qword_1ED6A79D8, MEMORY[0x1E0DEAFA0], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95D90], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A79D0);
  }
  return result;
}

unint64_t sub_1BC0B1EC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF3EF290;
  if (!qword_1EF3EF290)
  {
    sub_1BC0B236C(255, qword_1ED6A8210, MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0C964B8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C964C8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF3EF290);
  }
  return result;
}

unint64_t sub_1BC0B1F24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7A20;
  if (!qword_1ED6A7A20)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A28, MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0C960C0]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C960D0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7A20);
  }
  return result;
}

void sub_1BC0B1F88(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    v7 = v6;
    v8 = sub_1BC0B04F4();
    v9 = a3(a1, v7, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_1BC0B2004()
{
  uint64_t (*v0)(uint64_t, uint64_t, unint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_1ED6A7998)
  {
    v0 = (uint64_t (*)(uint64_t, uint64_t, unint64_t))MEMORY[0x1E0C95C60];
    sub_1BC0B1F88(255, &qword_1ED6A79A8, MEMORY[0x1E0C95C60]);
    sub_1BC0B04A0();
    sub_1BC0B05EC(&qword_1ED6A79A0, &qword_1ED6A79A8, v0, MEMORY[0x1E0C95C80]);
    v1 = sub_1BC0C6CC4();
    if (!v2)
      atomic_store(v1, (unint64_t *)&qword_1ED6A7998);
  }
}

void sub_1BC0B20C4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD *))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  unint64_t v10;
  unint64_t v11;

  if (!*a2)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    v9[0] = v6;
    v9[1] = v6;
    v10 = sub_1BC0B04F4();
    v11 = v10;
    v7 = a3(a1, v9);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1BC0B214C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1BC0AE23C(*a1, v2, &qword_1ED6A76D0, (uint64_t (*)(uint64_t))sub_1BC0B0378, sub_1BC0B1B58, (void (*)(uint64_t))sub_1BC0AB29C, (void (*)(uint64_t))sub_1BC0AB4B8);
  *a2 = result;
  return result;
}

unint64_t sub_1BC0B21A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7958;
  if (!qword_1ED6A7958)
  {
    sub_1BC0B20C4(255, &qword_1ED6A7960, (uint64_t (*)(uint64_t, _QWORD *))MEMORY[0x1E0C959E8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C959F8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7958);
  }
  return result;
}

uint64_t sub_1BC0B21F8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1BC0AE23C(*a1, v2, &qword_1ED6A76D8, (uint64_t (*)(uint64_t))sub_1BC0B110C, sub_1BC0B11F0, (void (*)(uint64_t))sub_1BC0AADF4, (void (*)(uint64_t))sub_1BC0AB048);
  *a2 = result;
  return result;
}

unint64_t sub_1BC0B224C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7918;
  if (!qword_1ED6A7918)
  {
    sub_1BC0B20C4(255, &qword_1ED6A7920, MEMORY[0x1E0C95778]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95788], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7918);
  }
  return result;
}

void sub_1BC0B22A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1BC0B2314()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7A50;
  if (!qword_1ED6A7A50)
  {
    sub_1BC0B22A4(255, &qword_1ED6A7A48, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7A50);
  }
  return result;
}

void sub_1BC0B236C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, unint64_t, _QWORD))
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_1BC0B04A0();
    v9 = a4(a1, a3, v8, MEMORY[0x1E0DEDB38]);
    if (!v10)
      atomic_store(v9, a2);
  }
}

unint64_t sub_1BC0B23D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7718;
  if (!qword_1ED6A7718)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A18, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0C960C0]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C960D0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7718);
  }
  return result;
}

uint64_t sub_1BC0B2434(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GeneratorPipelineGenerationOperation.OperationError(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BC0B2478(uint64_t a1)
{
  sub_1BC0B2858(a1, &qword_1ED6A76E8, (uint64_t (*)(uint64_t))sub_1BC0B1154, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
}

uint64_t sub_1BC0B2498()
{
  return 32;
}

__n128 sub_1BC0B24A4(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

void sub_1BC0B24B0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t TupleTypeMetadata2;
  uint64_t v6;

  if (!*a2)
  {
    sub_1BC0C66C4();
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v6)
      atomic_store(TupleTypeMetadata2, a2);
  }
}

void sub_1BC0B2524(uint64_t a1)
{
  sub_1BC0B2858(a1, &qword_1ED6A76F8, (uint64_t (*)(uint64_t))sub_1BC0B1130, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
}

uint64_t sub_1BC0B2544()
{
  return 32;
}

__n128 sub_1BC0B2550(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

void sub_1BC0B255C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*a2)
  {
    v9 = a3(255);
    v10 = a4();
    v11 = a5(a1, v9, v10);
    if (!v12)
      atomic_store(v11, a2);
  }
}

void sub_1BC0B25CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A76E0)
  {
    sub_1BC0B1320(255, &qword_1ED6A8668, &qword_1ED6A85E8, MEMORY[0x1E0D2E1B0], (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x1E0D2EA90]);
    v0 = sub_1BC0C6BB0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A76E0);
  }
}

uint64_t sub_1BC0B2640(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1BC0B24B0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1BC0B267C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED6A76B0)
  {
    sub_1BC0C66C4();
    sub_1BC0B2858(255, &qword_1ED6A76F0, (uint64_t (*)(uint64_t))sub_1BC0B039C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2ECF8]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6A76B0);
  }
}

uint64_t sub_1BC0B2704(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BC0B2740()
{
  return swift_deallocObject();
}

void sub_1BC0B2750(void **a1)
{
  uint64_t v1;

  sub_1BC0AFCAC(*a1, *(_BYTE *)(v1 + 16));
}

id sub_1BC0B275C(id result, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (result)
  {
    v9 = result;
    v10 = a4;
    v11 = a5;
    v12 = a6;
    v13 = v9;
    v14 = a2;
    return a3;
  }
  return result;
}

void sub_1BC0B27B8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  if (a1)
  {

  }
}

unint64_t sub_1BC0B2814()
{
  unint64_t result;

  result = qword_1ED6A78C8;
  if (!qword_1ED6A78C8)
  {
    result = MEMORY[0x1BCCEADF0](&unk_1BC0C7F80, &type metadata for BackgroundGenerationAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1ED6A78C8);
  }
  return result;
}

void sub_1BC0B2858(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_1BC0B28B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7988)
  {
    sub_1BC0B236C(255, &qword_1ED6A7A00, MEMORY[0x1E0DEDCE8], (uint64_t (*)(uint64_t, uint64_t, unint64_t, _QWORD))MEMORY[0x1E0C95D78]);
    sub_1BC0B2960(255, (unint64_t *)&qword_1ED6A85F0);
    sub_1BC0B04F4();
    sub_1BC0B2998();
    v0 = sub_1BC0C6CB8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7988);
  }
}

uint64_t sub_1BC0B2960(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1BC0B2998()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7698;
  if (!qword_1ED6A7698)
  {
    v1 = sub_1BC0B2960(255, (unint64_t *)&qword_1ED6A85F0);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0DEF7F8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7698);
  }
  return result;
}

uint64_t sub_1BC0B29F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1BC0C6E38();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1BC0B2A54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_1BC0C6E38() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1BC0AE19C(v1 + v4, *(_BYTE *)(v1 + v4 + *(_QWORD *)(v3 + 64)), a1);
}

uint64_t sub_1BC0B2A9C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCEADF0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BC0B2AF8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1BC0BA378(a1);
}

_QWORD *HealthWelcomeFlowSignalManager.__allocating_init(advertisableFeatureManagerFactory:healthWelcomeFlowSignalProvider:currentOSUpdateDateProvider:currentDateGenerator:)(__int128 *a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t (*a5)(), uint64_t a6)
{
  _QWORD *v12;
  uint64_t (*v13)();
  uint64_t v14;

  v12 = (_QWORD *)swift_allocObject();
  sub_1BC0B2C1C(a1, (uint64_t)(v12 + 2));
  v12[12] = a2;
  v12[13] = a3;
  sub_1BC0B2C1C(a4, (uint64_t)(v12 + 7));
  v13 = sub_1BC0B2C34;
  if (a5)
  {
    v13 = a5;
    v14 = a6;
  }
  else
  {
    v14 = 0;
  }
  v12[14] = v13;
  v12[15] = v14;
  return v12;
}

_QWORD *HealthWelcomeFlowSignalManager.init(advertisableFeatureManagerFactory:healthWelcomeFlowSignalProvider:currentOSUpdateDateProvider:currentDateGenerator:)(__int128 *a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t (*a5)(), uint64_t a6)
{
  _QWORD *v6;
  uint64_t (*v12)();
  uint64_t v13;

  sub_1BC0B2C1C(a1, (uint64_t)(v6 + 2));
  v6[12] = a2;
  v6[13] = a3;
  sub_1BC0B2C1C(a4, (uint64_t)(v6 + 7));
  v12 = sub_1BC0B2C34;
  if (a5)
  {
    v12 = a5;
    v13 = a6;
  }
  else
  {
    v13 = 0;
  }
  v6[14] = v12;
  v6[15] = v13;
  return v6;
}

uint64_t sub_1BC0B2C1C(__int128 *a1, uint64_t a2)
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

uint64_t sub_1BC0B2C38(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  sub_1BC0B3748((uint64_t)a1);
  swift_retain();
  if ((sub_1BC0B2D80() & 1) != 0)
  {
    sub_1BC0B3758((uint64_t)sub_1BC0B2D20, (uint64_t)v5);
  }
  else
  {
    v6 = *(_QWORD *)(v2 + 104);
    ObjectType = swift_getObjectType();
    v8 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v6 + 40))(0, ObjectType, v6);
    if (a1)
      a1(v8);
  }
  return swift_release();
}

uint64_t sub_1BC0B2CEC()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0B2D20(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t result;

  v3 = *(uint64_t (**)(uint64_t))(v1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 104);
  ObjectType = swift_getObjectType();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 40))(a1, ObjectType, v4);
  if (v3)
    return v3(result);
  return result;
}

uint64_t sub_1BC0B2D80()
{
  uint64_t *v0;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v38)(void);
  uint64_t v39;
  uint64_t ObjectType;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void (*v58)(char *, uint64_t);
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void (*v74)(char *, uint64_t);
  void (*v75)(char *, uint64_t);
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v82 = *v0;
  v1 = sub_1BC0C6C4C();
  v84 = *(_QWORD *)(v1 - 8);
  v85 = v1;
  v2 = MEMORY[0x1E0C80A78](v1);
  v83 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x1E0C80A78](v2);
  v79 = (char *)&v76 - v5;
  v6 = MEMORY[0x1E0C80A78](v4);
  v77 = (char *)&v76 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v76 = (char *)&v76 - v9;
  MEMORY[0x1E0C80A78](v8);
  v78 = (char *)&v76 - v10;
  sub_1BC0B447C();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v76 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v76 - v18;
  v20 = sub_1BC0C66A0();
  v21 = *(char **)(v20 - 8);
  v22 = MEMORY[0x1E0C80A78](v20);
  v81 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v22);
  v80 = (char *)&v76 - v25;
  MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v76 - v26;
  __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
  sub_1BC0C69C4();
  v28 = (unsigned int (*)(char *, uint64_t, uint64_t))*((_QWORD *)v21 + 6);
  if (v28(v19, 1, v20) == 1)
  {
    sub_1BC0B4A64((uint64_t)v19);
    v29 = v83;
    sub_1BC0C6C10();
    v30 = sub_1BC0C6C40();
    v31 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v87 = v33;
      *(_DWORD *)v32 = 136315138;
      v34 = sub_1BC0C72AC();
      v86 = sub_1BC0A54E4(v34, v35, &v87);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v30, v31, "[%s] No current OS version major update date, skipping advertisable check", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v33, -1, -1);
      MEMORY[0x1BCCEAE98](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v84 + 8))(v29, v85);
    return 0;
  }
  v83 = v21;
  v38 = (void (*)(void))*((_QWORD *)v21 + 4);
  ((void (*)(char *, char *, uint64_t))v38)(v27, v19, v20);
  v39 = v0[13];
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v39 + 56))(ObjectType, v39);
  v41 = v20;
  if (v28(v17, 1, v20) == 1)
  {
    sub_1BC0B4A64((uint64_t)v17);
    v42 = v27;
  }
  else
  {
    v43 = v80;
    v38();
    v42 = v27;
    if ((sub_1BC0C6688() & 1) == 0)
    {
      v59 = v78;
      sub_1BC0C6C10();
      v60 = sub_1BC0C6C40();
      v61 = sub_1BC0C6FD0();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = (uint8_t *)swift_slowAlloc();
        v63 = swift_slowAlloc();
        v87 = v63;
        *(_DWORD *)v62 = 136315138;
        v64 = sub_1BC0C72AC();
        v86 = sub_1BC0A54E4(v64, v65, &v87);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC0A2000, v60, v61, "[%s] We already determined there were no advertisable features for this release, not checking again.", v62, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v63, -1, -1);
        MEMORY[0x1BCCEAE98](v62, -1, -1);

        (*(void (**)(char *, uint64_t))(v84 + 8))(v59, v85);
        v66 = (void (*)(char *, uint64_t))*((_QWORD *)v83 + 1);
        v66(v80, v41);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v84 + 8))(v59, v85);
        v66 = (void (*)(char *, uint64_t))*((_QWORD *)v83 + 1);
        v66(v43, v41);
      }
      v66(v42, v41);
      return 0;
    }
    (*((void (**)(char *, uint64_t))v83 + 1))(v43, v41);
  }
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(ObjectType, v39);
  if (v28(v14, 1, v41) == 1)
  {
    sub_1BC0B4A64((uint64_t)v14);
    v44 = v79;
    sub_1BC0C6C10();
    v45 = sub_1BC0C6C40();
    v46 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v87 = v48;
      *(_DWORD *)v47 = 136315138;
      v49 = sub_1BC0C72AC();
      v86 = sub_1BC0A54E4(v49, v50, &v87);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v45, v46, "[%s] No record of last health welcome flow completion date, will perform advertisable check", v47, 0xCu);
      v36 = 1;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v48, -1, -1);
      MEMORY[0x1BCCEAE98](v47, -1, -1);

      (*(void (**)(char *, uint64_t))(v84 + 8))(v44, v85);
      (*((void (**)(char *, uint64_t))v83 + 1))(v42, v41);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v84 + 8))(v44, v85);
      (*((void (**)(char *, uint64_t))v83 + 1))(v42, v41);
      return 1;
    }
  }
  else
  {
    ((void (*)(char *, char *, uint64_t))v38)(v81, v14, v41);
    if ((sub_1BC0C667C() & 1) == 0)
    {
      v67 = v77;
      sub_1BC0C6C10();
      v68 = sub_1BC0C6C40();
      v69 = sub_1BC0C6FAC();
      if (os_log_type_enabled(v68, v69))
      {
        v70 = (uint8_t *)swift_slowAlloc();
        v71 = swift_slowAlloc();
        v87 = v71;
        *(_DWORD *)v70 = 136315138;
        v72 = sub_1BC0C72AC();
        v86 = sub_1BC0A54E4(v72, v73, &v87);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC0A2000, v68, v69, "[%s] Major OS update date earlier than previous Health Welcome Flow completion date, will not perform advertisable check", v70, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v71, -1, -1);
        MEMORY[0x1BCCEAE98](v70, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v84 + 8))(v67, v85);
      v74 = (void (*)(char *, uint64_t))*((_QWORD *)v83 + 1);
      v74(v81, v41);
      v74(v42, v41);
      return 0;
    }
    v51 = v76;
    sub_1BC0C6C10();
    v52 = sub_1BC0C6C40();
    v53 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v87 = v55;
      *(_DWORD *)v54 = 136315138;
      v56 = sub_1BC0C72AC();
      v86 = sub_1BC0A54E4(v56, v57, &v87);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v52, v53, "[%s] Major OS update date later than previous Health Welcome Flow completion date, will perform advertisable check", v54, 0xCu);
      v36 = 1;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v55, -1, -1);
      MEMORY[0x1BCCEAE98](v54, -1, -1);

      (*(void (**)(char *, uint64_t))(v84 + 8))(v51, v85);
      v58 = (void (*)(char *, uint64_t))*((_QWORD *)v83 + 1);
      v58(v81, v41);
      v58(v42, v41);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v84 + 8))(v51, v85);
      v75 = (void (*)(char *, uint64_t))*((_QWORD *)v83 + 1);
      v75(v81, v41);
      v75(v42, v41);
      return 1;
    }
  }
  return v36;
}

uint64_t sub_1BC0B3748(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1BC0B3758(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v17 = *v2;
  v5 = sub_1BC0C6934();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2[5];
  v10 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0D29D90], v5);
  v11 = sub_1BC0C6904();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(v8, v11, 1, v9, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_getObjectType();
  v12 = swift_allocObject();
  swift_weakInit();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v14 = v17;
  v13[4] = a2;
  v13[5] = v14;
  swift_retain();
  swift_retain();
  sub_1BC0C69F4();
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_1BC0B38EC(uint64_t a1, NSObject *a2, void (*a3)(_QWORD), uint64_t a4, uint8_t *a5)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  void (*v30)(char *, char *, uint64_t);
  NSObject *v31;
  os_log_type_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(char *, uint64_t);
  os_log_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_t v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t result;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t (*v60)(_QWORD);
  char *v61;
  uint64_t Strong;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t ObjectType;
  char v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  void (*v91)(uint64_t *, _QWORD);
  uint8_t *v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  os_log_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  os_log_t v100;
  os_log_t v101;
  uint8_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(_QWORD);
  uint64_t v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  uint64_t v113[4];
  uint64_t v114;
  uint64_t v115[2];

  v102 = a5;
  v105 = a4;
  v106 = a3;
  v100 = a2;
  v6 = sub_1BC0C6994();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v108 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v98 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v98 - v13;
  v107 = sub_1BC0C691C();
  v109 = *(char **)(v107 - 8);
  MEMORY[0x1E0C80A78](v107);
  v16 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B447C();
  MEMORY[0x1E0C80A78](v17);
  v99 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BC0C6C4C();
  v103 = *(_QWORD *)(v19 - 8);
  v104 = v19;
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v20);
  v101 = (os_log_t)((char *)&v98 - v24);
  MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v98 - v25;
  sub_1BC0B44D0();
  MEMORY[0x1E0C80A78](v27);
  v29 = (uint64_t *)((char *)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1BC0B4570(a1, (uint64_t)v29);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v14, v29, v6);
    sub_1BC0C6C10();
    v30 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v30(v12, v14, v6);
    v31 = sub_1BC0C6C40();
    v32 = sub_1BC0C6FB8();
    v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      v34 = swift_slowAlloc();
      v109 = v14;
      v101 = v31;
      v35 = v34;
      v107 = swift_slowAlloc();
      v113[0] = v107;
      *(_DWORD *)v35 = 136315394;
      v36 = sub_1BC0C72AC();
      v110 = sub_1BC0A54E4(v36, v37, v113);
      LODWORD(v102) = v33;
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      v30(v108, v12, v6);
      v38 = sub_1BC0C6EEC();
      v110 = sub_1BC0A54E4(v38, v39, v113);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      v40 = *(void (**)(char *, uint64_t))(v7 + 8);
      v40(v12, v6);
      v41 = v101;
      _os_log_impl(&dword_1BC0A2000, v101, (os_log_type_t)v102, "[%s] Unable to determine current advertised features due to %s, assuming no advertisements", (uint8_t *)v35, 0x16u);
      v42 = v107;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v42, -1, -1);
      v14 = v109;
      MEMORY[0x1BCCEAE98](v35, -1, -1);

    }
    else
    {
      v40 = *(void (**)(char *, uint64_t))(v7 + 8);
      v40(v12, v6);

    }
    (*(void (**)(char *, uint64_t))(v103 + 8))(v22, v104);
    v106(0);
    return ((uint64_t (*)(char *, uint64_t))v40)(v14, v6);
  }
  v43 = *v29;
  v108 = (char *)(*v29 & 0xC000000000000001);
  if (!v108)
  {
    v45 = v107;
    if (*(_QWORD *)(v43 + 16))
      goto LABEL_6;
LABEL_12:
    swift_bridgeObjectRelease();
    sub_1BC0C6C10();
    v54 = sub_1BC0C6C40();
    v55 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      v57 = swift_slowAlloc();
      v113[0] = v57;
      *(_DWORD *)v56 = 136315138;
      v58 = sub_1BC0C72AC();
      v110 = sub_1BC0A54E4(v58, v59, v113);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v54, v55, "[%s]  No advertised features, will not advertise", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v57, -1, -1);
      MEMORY[0x1BCCEAE98](v56, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v103 + 8))(v26, v104);
    v60 = (uint64_t (*)(_QWORD))v106;
    v61 = v99;
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v63 = *(_QWORD *)(Strong + 104);
      swift_unknownObjectRetain();
      swift_release();
      swift_beginAccess();
      v64 = swift_weakLoadStrong();
      if (v64)
      {
        v65 = *(void (**)(uint64_t))(v64 + 112);
        swift_retain();
        v66 = swift_release();
        v65(v66);
        swift_release();
        v67 = sub_1BC0C66A0();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v61, 0, 1, v67);
      }
      else
      {
        v72 = sub_1BC0C66A0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v61, 1, 1, v72);
      }
      ObjectType = swift_getObjectType();
      (*(void (**)(char *, uint64_t, uint64_t))(v63 + 64))(v61, ObjectType, v63);
      swift_unknownObjectRelease();
    }
    return v60(0);
  }
  v44 = sub_1BC0C7108();
  v45 = v107;
  if (!v44)
    goto LABEL_12;
LABEL_6:
  v46 = v101;
  sub_1BC0C6C10();
  swift_bridgeObjectRetain();
  v47 = sub_1BC0C6C40();
  v48 = sub_1BC0C6FD0();
  if (!os_log_type_enabled(v47, (os_log_type_t)v48))
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(os_log_t, uint64_t))(v103 + 8))(v46, v104);
    return ((uint64_t (*)(uint64_t))v106)(1);
  }
  LODWORD(v99) = v48;
  v49 = swift_slowAlloc();
  v98 = swift_slowAlloc();
  v115[0] = v98;
  *(_DWORD *)v49 = 136315395;
  v50 = sub_1BC0C72AC();
  v113[0] = sub_1BC0A54E4(v50, v51, v115);
  sub_1BC0C709C();
  swift_bridgeObjectRelease();
  v102 = (uint8_t *)v49;
  *(_WORD *)(v49 + 12) = 2081;
  if (v108)
    v52 = sub_1BC0C7108();
  else
    v52 = *(_QWORD *)(v43 + 16);
  v68 = MEMORY[0x1E0DEE9D8];
  v100 = v47;
  if (!v52)
  {
LABEL_39:
    v113[0] = v68;
    v92 = v102;
    sub_1BC0B4988();
    sub_1BC0B2A9C((unint64_t *)&qword_1EF3EF048, (uint64_t (*)(uint64_t))sub_1BC0B4988, MEMORY[0x1E0DEAF20]);
    v93 = sub_1BC0C6EA4();
    v95 = v94;
    swift_bridgeObjectRelease();
    v113[0] = sub_1BC0A54E4(v93, v95, v115);
    sub_1BC0C709C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v96 = v100;
    _os_log_impl(&dword_1BC0A2000, v100, (os_log_type_t)v99, "[%s] Got advertised feature models, will advertise: %{private}s", v92, 0x16u);
    v97 = v98;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v97, -1, -1);
    MEMORY[0x1BCCEAE98](v92, -1, -1);

    (*(void (**)(os_log_t, uint64_t))(v103 + 8))(v101, v104);
    return ((uint64_t (*)(uint64_t))v106)(1);
  }
  v114 = MEMORY[0x1E0DEE9D8];
  sub_1BC0A5CA8(0, v52 & ~(v52 >> 63), 0);
  if (v108)
  {
    v69 = sub_1BC0C70D8();
    v71 = 1;
  }
  else
  {
    v69 = sub_1BC0B49DC(v43);
    v71 = v74 & 1;
  }
  v110 = v69;
  v111 = v70;
  v112 = v71;
  if ((v52 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        sub_1BC0B4698(v110, v111, v112, v43);
        sub_1BC0C69A0();
        v84 = sub_1BC0C6910();
        v86 = v85;
        (*((void (**)(char *, uint64_t))v109 + 1))(v16, v45);
        swift_release();
        v87 = v114;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1BC0A5CA8(0, *(_QWORD *)(v87 + 16) + 1, 1);
          v87 = v114;
        }
        v89 = *(_QWORD *)(v87 + 16);
        v88 = *(_QWORD *)(v87 + 24);
        if (v89 >= v88 >> 1)
        {
          sub_1BC0A5CA8(v88 > 1, v89 + 1, 1);
          v87 = v114;
        }
        *(_QWORD *)(v87 + 16) = v89 + 1;
        v90 = v87 + 16 * v89;
        *(_QWORD *)(v90 + 32) = v84;
        *(_QWORD *)(v90 + 40) = v86;
        if (v108)
          break;
        v75 = v110;
        v76 = v111;
        v77 = v112;
        v78 = sub_1BC0B45B4(v110, v111, v112, v43);
        v80 = v79;
        v82 = v81;
        sub_1BC0B497C(v75, v76, v77);
        v110 = v78;
        v111 = v80;
        v83 = v82 & 1;
        v45 = v107;
        v112 = v83;
        if (!--v52)
          goto LABEL_38;
      }
      if ((v112 & 1) == 0)
        goto LABEL_42;
      if (sub_1BC0C70E4())
        swift_isUniquelyReferenced_nonNull_native();
      sub_1BC0B4900(0, &qword_1EF3EF2C0, MEMORY[0x1E0DEB2B0]);
      v91 = (void (*)(uint64_t *, _QWORD))sub_1BC0C6F88();
      sub_1BC0C7120();
      v91(v113, 0);
      --v52;
    }
    while (v52);
LABEL_38:
    sub_1BC0B497C(v110, v111, v112);
    v68 = v114;
    goto LABEL_39;
  }
  __break(1u);
LABEL_42:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t HealthWelcomeFlowSignalManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t HealthWelcomeFlowSignalManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthWelcomeFlowSignalManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthWelcomeFlowSignalManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalManager.__allocating_init(advertisableFeatureManagerFactory:healthWelcomeFlowSignalProvider:currentOSUpdateDateProvider:currentDateGenerator:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalManager.determineIfHealthWelcomeFlowShouldShowOnNextAppOpen(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t sub_1BC0B4420()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC0B4444()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0B4470(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC0B38EC(a1, *(NSObject **)(v1 + 16), *(void (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32), *(uint8_t **)(v1 + 40));
}

void sub_1BC0B447C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8550)
  {
    sub_1BC0C66A0();
    v0 = sub_1BC0C7090();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8550);
  }
}

void sub_1BC0B44D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF3EF2A0)
  {
    sub_1BC0B4900(255, &qword_1EF3EF2A8, MEMORY[0x1E0DEB388]);
    sub_1BC0C6994();
    sub_1BC0B2A9C(&qword_1EF3EF2B8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A090], MEMORY[0x1E0D2A0A0]);
    v0 = sub_1BC0C72A0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF3EF2A0);
  }
}

uint64_t sub_1BC0B4570(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0B44D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

int64_t sub_1BC0B45B4(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_1BC0B4698(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) == 0)
    {
      if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
      {
        __break(1u);
      }
      else if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) != 0)
      {
        if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        {
LABEL_20:
          v7 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v5);
          swift_retain();
          return v7;
        }
        __break(1u);
        goto LABEL_13;
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_13:
    result = sub_1BC0C70F0();
    if ((_DWORD)result == *(_DWORD *)(a4 + 36))
    {
      sub_1BC0C70FC();
      sub_1BC0C69AC();
      v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A0D8];
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_1BC0B2A9C(&qword_1EF3EF2B0, v8, MEMORY[0x1E0D2A0E8]);
      v9 = sub_1BC0C6E98();
      v10 = -1 << *(_BYTE *)(a4 + 32);
      v5 = v9 & ~v10;
      if (((*(_QWORD *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        v11 = ~v10;
        sub_1BC0B2A9C((unint64_t *)&unk_1EF3EF2C8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A0D8], MEMORY[0x1E0D2A0F0]);
        while ((sub_1BC0C6EB0() & 1) == 0)
        {
          v5 = (v5 + 1) & v11;
          if (((*(_QWORD *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
            goto LABEL_18;
        }
      }
      else
      {
LABEL_18:
        swift_release();
        __break(1u);
      }
      swift_release();
      goto LABEL_20;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((a3 & 1) != 0)
  {
    if (a4 < 0)
      v6 = a4;
    else
      v6 = a4 & 0xFFFFFFFFFFFFFF8;
    MEMORY[0x1BCCEA88C](result, a2, v6);
    sub_1BC0C69AC();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v7 = v12;
    swift_unknownObjectRelease();
    return v7;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_1BC0B4900(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = sub_1BC0C69AC();
    v7 = sub_1BC0B2A9C(&qword_1EF3EF2B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2A0D8], MEMORY[0x1E0D2A0E8]);
    v8 = a3(a1, v6, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_1BC0B497C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_1BC0B4988()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7A60)
  {
    v0 = sub_1BC0C6F7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7A60);
  }
}

uint64_t sub_1BC0B49DC(uint64_t a1)
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

uint64_t sub_1BC0B4A64(uint64_t a1)
{
  uint64_t v2;

  sub_1BC0B447C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id PostNotificationOperation.__allocating_init(name:userInfo:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[qword_1ED6A8430] = a1;
  *(_QWORD *)&v5[qword_1ED6A8438] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id PostNotificationOperation.init(name:userInfo:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[qword_1ED6A8430] = a1;
  *(_QWORD *)&v2[qword_1ED6A8438] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for PostNotificationOperation();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for PostNotificationOperation()
{
  uint64_t result;

  result = qword_1ED6A8440;
  if (!qword_1ED6A8440)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC0B4B8C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void **p_vtable;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[3];
  uint64_t v24;

  v3 = sub_1BC0C6C4C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v7 = v1;
  v8 = sub_1BC0C6C40();
  v9 = sub_1BC0C6FD0();
  p_vtable = _TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory.vtable;
  if (os_log_type_enabled(v8, v9))
  {
    v23[1] = a1;
    v11 = swift_slowAlloc();
    v23[0] = v3;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    *(_DWORD *)v12 = 136380675;
    v24 = v13;
    v14 = sub_1BC0C6EE0();
    v23[2] = sub_1BC0A54E4(v14, v15, &v24);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v8, v9, "PostNotificationOperation: Posting notification named %{private}s.", v12, 0xCu);
    swift_arrayDestroy();
    v16 = v13;
    p_vtable = (void **)(_TtC16HealthPluginHost45HealthPluginAdvertisableFeatureManagerFactory + 24);
    MEMORY[0x1BCCEAE98](v16, -1, -1);
    MEMORY[0x1BCCEAE98](v12, -1, -1);

    (*(void (**)(char *, _QWORD))(v4 + 8))(v6, v23[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v7;
  v18 = (char *)v7;
  v19 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0B5214, v17);
  swift_release();
  v20 = *(_QWORD *)((char *)p_vtable[134] + (_QWORD)v18);
  if (*(_QWORD *)&v18[qword_1ED6A8438])
    v21 = (void *)sub_1BC0C6E74();
  else
    v21 = 0;
  objc_msgSend(v19, sel_postNotificationWith_userInfo_, v20, v21);
  swift_unknownObjectRelease();

  return sub_1BC0C6988();
}

uint64_t sub_1BC0B4E18(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = sub_1BC0C6C4C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v8 = a2;
  v9 = a1;
  v10 = v8;
  v11 = a1;
  v12 = sub_1BC0C6C40();
  v13 = sub_1BC0C6FB8();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v24 = v4;
    v15 = v14;
    v16 = swift_slowAlloc();
    v26 = v16;
    *(_DWORD *)v15 = 136380931;
    v17 = sub_1BC0C6EE0();
    v25 = sub_1BC0A54E4(v17, v18, &v26);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v25 = (uint64_t)a1;
    v19 = a1;
    sub_1BC0B04A0();
    v20 = sub_1BC0C6EEC();
    v25 = sub_1BC0A54E4(v20, v21, &v26);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC0A2000, v12, v13, "Failed to post notification named %{private}s: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v16, -1, -1);
    MEMORY[0x1BCCEAE98](v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v24);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id PostNotificationOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PostNotificationOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0B50B4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0B50E0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease();
}

id PostNotificationOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PostNotificationOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0B5140()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PostNotificationOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PostNotificationOperation.__allocating_init(name:userInfo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for PostNotificationOperation + v0 + 16))();
}

uint64_t sub_1BC0B51B0(uint64_t a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0B51E8()
{
  return type metadata accessor for PostNotificationOperation();
}

uint64_t sub_1BC0B51F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0B5214(void *a1)
{
  uint64_t v1;

  return sub_1BC0B4E18(a1, *(void **)(v1 + 16));
}

id FeedItemGenerationOperation.__allocating_init(dateRange:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[qword_1EF3EF8A0];
  v5 = sub_1BC0C6604();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

id FeedItemGenerationOperation.init(dateRange:)(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v3 = &v1[qword_1EF3EF8A0];
  v4 = sub_1BC0C6604();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for FeedItemGenerationOperation();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v6;
}

uint64_t type metadata accessor for FeedItemGenerationOperation()
{
  uint64_t result;

  result = qword_1EF3EF2E8;
  if (!qword_1EF3EF2E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC0B538C()
{
  void *v0;
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  ObjectType = swift_getObjectType();
  v2 = sub_1BC0C6C4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone((Class)sub_1BC0C6A6C()), sel_init);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v0;
  *(_QWORD *)(v7 + 24) = ObjectType;
  v8 = v0;
  sub_1BC0C6A54();
  swift_release();
  sub_1BC0C6C1C();
  v9 = sub_1BC0C6C40();
  v10 = sub_1BC0C6FAC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v2;
    v19 = v12;
    v13 = v12;
    *(_DWORD *)v11 = 136315138;
    v20 = ObjectType;
    swift_getMetatypeMetadata();
    v14 = sub_1BC0C6EEC();
    v20 = sub_1BC0A54E4(v14, v15, &v19);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v9, v10, "[%s]: beginning", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v13, -1, -1);
    MEMORY[0x1BCCEAE98](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1BC0B55B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v6 = sub_1BC0C6C4C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v35 - v11;
  if (!a1)
  {
    sub_1BC0C6C1C();
    v26 = sub_1BC0C6C40();
    v27 = sub_1BC0C6FAC();
    if (os_log_type_enabled(v26, v27))
    {
      v36 = v7;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v37 = v6;
      v38 = v29;
      *(_DWORD *)v28 = 136315138;
      v39 = a3;
      swift_getMetatypeMetadata();
      v30 = sub_1BC0C6EEC();
      v39 = sub_1BC0A54E4(v30, v31, &v38);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v26, v27, "[%s]: completed", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v29, -1, -1);
      MEMORY[0x1BCCEAE98](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
      return sub_1BC0C6970();
    }

    v32 = *(void (**)(char *, uint64_t))(v7 + 8);
    v33 = v12;
LABEL_8:
    v32(v33, v6);
    return sub_1BC0C6970();
  }
  v13 = a1;
  sub_1BC0C6C1C();
  v14 = a1;
  v15 = a1;
  v16 = sub_1BC0C6C40();
  v17 = sub_1BC0C6FB8();
  if (!os_log_type_enabled(v16, v17))
  {

    v32 = *(void (**)(char *, uint64_t))(v7 + 8);
    v33 = v10;
    goto LABEL_8;
  }
  v18 = swift_slowAlloc();
  v19 = swift_slowAlloc();
  v35[1] = a2;
  v20 = (_QWORD *)v19;
  v21 = swift_slowAlloc();
  *(_DWORD *)v18 = 136315394;
  v37 = v6;
  v38 = v21;
  v39 = a3;
  swift_getMetatypeMetadata();
  v36 = v7;
  v22 = sub_1BC0C6EEC();
  v39 = sub_1BC0A54E4(v22, v23, &v38);
  sub_1BC0C709C();
  swift_bridgeObjectRelease();
  *(_WORD *)(v18 + 12) = 2112;
  v24 = a1;
  v25 = _swift_stdlib_bridgeErrorToNSError();
  v39 = v25;
  sub_1BC0C709C();
  *v20 = v25;

  _os_log_impl(&dword_1BC0A2000, v16, v17, "[%s]: Failed: %@", (uint8_t *)v18, 0x16u);
  sub_1BC0B5B74();
  swift_arrayDestroy();
  MEMORY[0x1BCCEAE98](v20, -1, -1);
  swift_arrayDestroy();
  MEMORY[0x1BCCEAE98](v21, -1, -1);
  MEMORY[0x1BCCEAE98](v18, -1, -1);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v37);
  return sub_1BC0C6970();
}

id FeedItemGenerationOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FeedItemGenerationOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0B59D4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0B5A00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_1EF3EF8A0;
  v2 = sub_1BC0C6604();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

id FeedItemGenerationOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeedItemGenerationOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0B5A70()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BC0C6604();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FeedItemGenerationOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeedItemGenerationOperation.__allocating_init(dateRange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for FeedItemGenerationOperation + v0 + 8))();
}

uint64_t sub_1BC0B5B04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + qword_1EF3EF8A0;
  v2 = sub_1BC0C6604();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t sub_1BC0B5B40()
{
  return type metadata accessor for FeedItemGenerationOperation();
}

uint64_t sub_1BC0B5B48()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0B5B6C(void *a1)
{
  uint64_t v1;

  return sub_1BC0B55B4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_1BC0B5B74()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A85C0)
  {
    sub_1BC0B5BC8();
    v0 = sub_1BC0C7090();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A85C0);
  }
}

unint64_t sub_1BC0B5BC8()
{
  unint64_t result;

  result = qword_1ED6A8620;
  if (!qword_1ED6A8620)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A8620);
  }
  return result;
}

id SubmitTrainingOperation.__allocating_init(trainingEvents:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[qword_1ED6A8418] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id SubmitTrainingOperation.init(trainingEvents:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[qword_1ED6A8418] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SubmitTrainingOperation();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SubmitTrainingOperation()
{
  uint64_t result;

  result = qword_1ED6A8420;
  if (!qword_1ED6A8420)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC0B5CCC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  sub_1BC0C65D4();
  swift_allocObject();
  sub_1BC0C65C8();
  v1 = swift_bridgeObjectRetain();
  sub_1BC0B6218(v1);
  swift_bridgeObjectRelease();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = v0;
  v4 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0B6410, v2);
  swift_release();
  sub_1BC0B2960(0, &qword_1ED6A8478);
  v5 = (void *)sub_1BC0C6F34();
  swift_bridgeObjectRelease();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v3;
  v9[4] = sub_1BC0B64E0;
  v9[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1BC0BFFB0;
  v9[3] = &block_descriptor_0;
  v7 = _Block_copy(v9);
  v8 = v3;
  swift_release();
  objc_msgSend(v4, sel_submitTrainingFor_completion_, v5, v7);
  _Block_release(v7);
  swift_release();
  swift_unknownObjectRelease();

}

uint64_t sub_1BC0B5E68(uint64_t a1, void *a2)
{
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
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v3 = sub_1BC0C6E44();
  v20 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BC0C6E68();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC0C6E50();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B2960(0, (unint64_t *)&qword_1ED6A85F0);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF540], v9);
  v13 = (void *)sub_1BC0C7060();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  aBlock[4] = sub_1BC0B6420;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC0BFFB0;
  aBlock[3] = &block_descriptor_9;
  v15 = _Block_copy(aBlock);
  v16 = a2;
  sub_1BC0C6E5C();
  v21 = MEMORY[0x1E0DEE9D8];
  sub_1BC0B2A9C(&qword_1ED6A8540, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0B6440();
  sub_1BC0B2A9C(&qword_1ED6A8548, (uint64_t (*)(uint64_t))sub_1BC0B6440, MEMORY[0x1E0DEAF38]);
  sub_1BC0C70C0();
  MEMORY[0x1BCCEA7C0](0, v8, v5, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  return swift_release();
}

id SubmitTrainingOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SubmitTrainingOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0B6124()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0B6150()
{
  return swift_bridgeObjectRelease();
}

id SubmitTrainingOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SubmitTrainingOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0B6194()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for SubmitTrainingOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SubmitTrainingOperation.__allocating_init(trainingEvents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for SubmitTrainingOperation + v0 + 8))();
}

uint64_t sub_1BC0B6200()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0B6210()
{
  return type metadata accessor for SubmitTrainingOperation();
}

uint64_t sub_1BC0B6218(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1BC0C718C();
    v5 = *(_QWORD *)(sub_1BC0C6AC0() - 8);
    v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v7 = *(_QWORD *)(v5 + 72);
    sub_1BC0B2A9C(&qword_1ED6A8468, (uint64_t (*)(uint64_t))MEMORY[0x1E0D2EB28], MEMORY[0x1E0D2EB38]);
    while (1)
    {
      v8 = sub_1BC0C65BC();
      if (v1)
        break;
      v10 = v8;
      v11 = v9;
      sub_1BC0C6640();
      sub_1BC0B6494(v10, v11);
      sub_1BC0C7174();
      sub_1BC0C7198();
      sub_1BC0C71A4();
      sub_1BC0C7180();
      v6 += v7;
      if (!--v3)
        return v12;
    }
    sub_1BC0C7144();
    sub_1BC0C6F10();
    sub_1BC0B04A0();
    sub_1BC0C71B0();
    result = sub_1BC0C71C8();
    __break(1u);
  }
  return result;
}

uint64_t sub_1BC0B63EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0B6410(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC0B5E68(a1, *(void **)(v1 + 16));
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1BC0B6420()
{
  return sub_1BC0C6970();
}

void sub_1BC0B6440()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8538)
  {
    sub_1BC0C6E44();
    v0 = sub_1BC0C6F7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8538);
  }
}

uint64_t sub_1BC0B6494(uint64_t a1, unint64_t a2)
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

uint64_t PinnedContentStateFeedItemCacheObserver.__allocating_init(pinnedContentManager:storeOracle:)(_QWORD *a1, void *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  PinnedContentStateFeedItemCacheObserver.init(pinnedContentManager:storeOracle:)(a1, a2);
  return v4;
}

uint64_t *PinnedContentStateFeedItemCacheObserver.init(pinnedContentManager:storeOracle:)(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;

  v3 = v2;
  v6 = *v3;
  v3[2] = (uint64_t)a2;
  v3[3] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v7 = a2;
  sub_1BC0C682C();
  v8 = swift_allocObject();
  swift_weakInit();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v7;
  v9[4] = v6;
  sub_1BC0B6BC4();
  sub_1BC0B6C7C();
  v10 = v7;
  v11 = sub_1BC0C6E20();

  swift_release();
  swift_release();
  v3[3] = v11;
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return v3;
}

uint64_t sub_1BC0B665C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1BC0B6680(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 aBlock;
  uint64_t (*v52)(uint64_t);
  void *v53;
  id (*v54)();
  _QWORD *v55;
  __int128 v56[2];
  _QWORD v57[4];

  v7 = sub_1BC0C6C4C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v45 - v12;
  v14 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v16 = result;
    v50 = a3;
    sub_1BC0C6C28();
    v17 = v14;
    v18 = sub_1BC0C6C40();
    v19 = sub_1BC0C6FD0();
    v20 = os_log_type_enabled(v18, v19);
    v49 = a4;
    v48 = v14;
    if (v20)
    {
      v21 = swift_slowAlloc();
      v47 = v17;
      v22 = v21;
      v45 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v45;
      *(_DWORD *)v22 = 136315394;
      v46 = v11;
      v23 = sub_1BC0C72AC();
      v57[0] = sub_1BC0A54E4(v23, v24, (uint64_t *)&aBlock);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2080;
      v57[0] = v14;
      sub_1BC0B6C28();
      v25 = v7;
      v26 = v47;
      v27 = sub_1BC0C6EEC();
      v57[0] = sub_1BC0A54E4(v27, v28, (uint64_t *)&aBlock);
      sub_1BC0C709C();

      v7 = v25;
      v11 = v46;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1BC0A2000, v18, v19, "[%s]: Updating feed items with identifiers %s", (uint8_t *)v22, 0x16u);
      v29 = v45;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v29, -1, -1);
      v30 = v22;
      v17 = v47;
      MEMORY[0x1BCCEAE98](v30, -1, -1);

    }
    else
    {

    }
    v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v13, v7);
    sub_1BC0C6700();
    if (v53)
    {
      sub_1BC0B2C1C(&aBlock, (uint64_t)v57);
      __swift_project_boxed_opaque_existential_1(v57, v57[3]);
      v32 = (void *)sub_1BC0C66F4();
      sub_1BC0A6D20((uint64_t)v57, (uint64_t)v56);
      v33 = (_QWORD *)swift_allocObject();
      v33[2] = v16;
      sub_1BC0B2C1C(v56, (uint64_t)(v33 + 3));
      v34 = v49;
      v33[8] = v48;
      v33[9] = v34;
      v54 = sub_1BC0B9404;
      v55 = v33;
      *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
      *((_QWORD *)&aBlock + 1) = 1107296256;
      v52 = sub_1BC0BFFB0;
      v53 = &block_descriptor_1;
      v35 = _Block_copy(&aBlock);
      v36 = v17;
      swift_retain();
      swift_release();
      objc_msgSend(v32, sel_performBlock_, v35);
      swift_release();
      _Block_release(v35);

      return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v57);
    }
    else
    {
      sub_1BC0B9328((uint64_t)&aBlock);
      sub_1BC0C6C28();
      v37 = sub_1BC0C6C40();
      v38 = sub_1BC0C6FB8();
      if (os_log_type_enabled(v37, v38))
      {
        v50 = v16;
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = swift_slowAlloc();
        v46 = v11;
        v41 = v40;
        *(_QWORD *)&aBlock = v40;
        *(_DWORD *)v39 = 136315138;
        v42 = sub_1BC0C72AC();
        v57[0] = sub_1BC0A54E4(v42, v43, (uint64_t *)&aBlock);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1BC0A2000, v37, v38, "[%s]: Early return due to missing HealthExperienceStore", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v41, -1, -1);
        MEMORY[0x1BCCEAE98](v39, -1, -1);
        swift_release();

        v44 = v46;
      }
      else
      {

        swift_release();
        v44 = v11;
      }
      return ((uint64_t (*)(char *, uint64_t))v31)(v44, v7);
    }
  }
  return result;
}

uint64_t sub_1BC0B6B8C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1BC0B6BB8(void **a1)
{
  uint64_t *v1;

  return sub_1BC0B6680(a1, v1[2], v1[3], v1[4]);
}

void sub_1BC0B6BC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8328)
  {
    sub_1BC0B6C28();
    v0 = sub_1BC0C6CF4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8328);
  }
}

void sub_1BC0B6C28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A82F0)
  {
    sub_1BC0C65B0();
    v0 = sub_1BC0C7090();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A82F0);
  }
}

unint64_t sub_1BC0B6C7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A8320;
  if (!qword_1ED6A8320)
  {
    sub_1BC0B6BC4();
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0C95D90], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A8320);
  }
  return result;
}

id sub_1BC0B6CC4(uint64_t a1, _QWORD *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  id v24[2];

  v21[1] = a4;
  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  v22 = sub_1BC0C6C4C();
  v6 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v9 = (void *)sub_1BC0C66F4();
  v10 = sub_1BC0B7A58();

  sub_1BC0B6F74(v10, a3);
  swift_bridgeObjectRelease();
  v11 = (void *)sub_1BC0C66F4();
  v24[0] = 0;
  LODWORD(a3) = objc_msgSend(v11, sel_save_, v24);

  if ((_DWORD)a3)
    return v24[0];
  v21[2] = v24[0];
  v13 = v24[0];
  v14 = (void *)sub_1BC0C661C();

  swift_willThrow();
  sub_1BC0C6C28();
  v15 = sub_1BC0C6C40();
  v16 = sub_1BC0C6FB8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = (void *)swift_slowAlloc();
    v24[0] = v18;
    *(_DWORD *)v17 = 136315138;
    v19 = sub_1BC0C72AC();
    v23 = sub_1BC0A54E4(v19, v20, (uint64_t *)v24);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v15, v16, "[%s]: Failed to update pinnable feed items", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v18, -1, -1);
    MEMORY[0x1BCCEAE98](v17, -1, -1);
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v22);
}

void sub_1BC0B6F74(unint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  char v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  os_log_type_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  __int128 v67;
  uint64_t *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84[2];

  v78 = a2;
  v76 = *v2;
  v4 = sub_1BC0C6C4C();
  v79 = *(_QWORD *)(v4 - 8);
  v80 = v4;
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v9 = (uint64_t)&v67 - v8;
  if (v78)
  {
    v10 = a1 >> 62;
    if (a1 >> 62)
      goto LABEL_49;
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v12 = v78;
    if (v11 < 1)
    {
LABEL_50:

      return;
    }
LABEL_4:
    v82 = v10;
    v73 = v9;
    v77 = v7;
    v75 = a1;
    v13 = (uint64_t *)sub_1BC0B793C(MEMORY[0x1E0DEE9D8]);
    v14 = sub_1BC0C6598();
    v15 = *(_QWORD *)(v14 + 16);
    v81 = v14;
    if (v15)
    {
      v16 = 0;
      a1 = v14 + 40;
      do
      {
        v9 = *(_QWORD *)(a1 - 8);
        v17 = *(_QWORD *)a1;
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v84[0] = (uint64_t)v13;
        v7 = v13;
        v10 = sub_1BC0B7EFC(v9, v17);
        v20 = v13[2];
        v21 = (v19 & 1) == 0;
        v22 = v20 + v21;
        if (__OFADD__(v20, v21))
        {
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          v65 = v78;
          swift_bridgeObjectRetain();
          v66 = sub_1BC0C71D4();
          swift_bridgeObjectRelease();
          if (v66 < 1)
            goto LABEL_50;
          goto LABEL_4;
        }
        v23 = v19;
        if (v13[3] >= v22)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v13 = (uint64_t *)v84[0];
            if ((v19 & 1) != 0)
              goto LABEL_6;
          }
          else
          {
            v7 = v84;
            sub_1BC0B8F5C();
            v13 = (uint64_t *)v84[0];
            if ((v23 & 1) != 0)
              goto LABEL_6;
          }
        }
        else
        {
          sub_1BC0B83A4(v22, isUniquelyReferenced_nonNull_native);
          v7 = (uint64_t *)v84[0];
          v24 = sub_1BC0B7EFC(v9, v17);
          if ((v23 & 1) != (v25 & 1))
          {
            sub_1BC0C7240();
            __break(1u);
            return;
          }
          v10 = v24;
          v13 = (uint64_t *)v84[0];
          if ((v23 & 1) != 0)
          {
LABEL_6:
            *(_QWORD *)(v13[7] + 8 * v10) = v16;
            goto LABEL_7;
          }
        }
        v13[(v10 >> 6) + 8] |= 1 << v10;
        v26 = (uint64_t *)(v13[6] + 16 * v10);
        *v26 = v9;
        v26[1] = v17;
        *(_QWORD *)(v13[7] + 8 * v10) = v16;
        v27 = v13[2];
        v28 = __OFADD__(v27, 1);
        v29 = v27 + 1;
        if (v28)
          goto LABEL_48;
        v13[2] = v29;
        swift_bridgeObjectRetain();
LABEL_7:
        ++v16;
        a1 += 16;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v15 != v16);
    }
    swift_bridgeObjectRelease();
    v30 = v75;
    if (v82)
    {
      swift_bridgeObjectRetain();
      v82 = sub_1BC0C71D4();
    }
    else
    {
      v82 = *(_QWORD *)((v75 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v10 = (unint64_t)v77;
    if (v82)
    {
      v81 = v30 & 0xC000000000000001;
      v68 = v84;
      v32 = 4;
      *(_QWORD *)&v31 = 136315394;
      v72 = v31;
      v71 = MEMORY[0x1E0DEE9B8] + 8;
      *(_QWORD *)&v31 = 136315906;
      v67 = v31;
      do
      {
        v7 = (uint64_t *)(v32 - 4);
        if (v81)
          v33 = (id)MEMORY[0x1BCCEA8D4](v32 - 4, v30);
        else
          v33 = *(id *)(v30 + 8 * v32);
        v34 = v33;
        v35 = v32 - 3;
        if (__OFADD__(v7, 1))
          goto LABEL_47;
        objc_msgSend(v33, sel_setSortOrder_, 0);
        v36 = objc_msgSend(v34, sel_pinnedContentIdentifier);
        if (v36)
        {
          v37 = v36;
          v9 = sub_1BC0C6EE0();
          v39 = v38;

          if (v13[2])
          {
            swift_bridgeObjectRetain();
            v40 = sub_1BC0B7EFC(v9, v39);
            if ((v41 & 1) != 0)
            {
              v42 = *(_QWORD *)(v13[7] + 8 * v40);
              swift_bridgeObjectRelease();
              if ((sub_1BC0C65A4() & 1) != 0)
                objc_msgSend(v34, sel_setSortOrder_, v42);
              sub_1BC0C68BC();
              v43 = v73;
              sub_1BC0C6C28();
              v44 = v34;
              swift_bridgeObjectRetain();
              v45 = v44;
              a1 = sub_1BC0C6C40();
              v46 = sub_1BC0C6FAC();
              v47 = v46;
              if (os_log_type_enabled((os_log_t)a1, v46))
              {
                v48 = swift_slowAlloc();
                v70 = swift_slowAlloc();
                v84[0] = v70;
                *(_DWORD *)v48 = v67;
                v69 = v47;
                v49 = sub_1BC0C72AC();
                v74 = v32 - 3;
                v83 = sub_1BC0A54E4(v49, v50, v84);
                sub_1BC0C709C();
                swift_bridgeObjectRelease();
                *(_WORD *)(v48 + 12) = 2080;
                swift_bridgeObjectRetain();
                v83 = sub_1BC0A54E4(v9, v39, v84);
                sub_1BC0C709C();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v48 + 22) = 2080;
                v35 = v74;
                sub_1BC0C68B0();
                v51 = sub_1BC0C68A4();
                v83 = sub_1BC0A54E4(v51, v52, v84);
                sub_1BC0C709C();

                swift_bridgeObjectRelease();
                *(_WORD *)(v48 + 32) = 2048;
                v9 = (uint64_t)objc_msgSend(v45, sel_sortOrder);

                v83 = v9;
                sub_1BC0C709C();

                _os_log_impl(&dword_1BC0A2000, (os_log_t)a1, (os_log_type_t)v69, "[%s]: Set %s favoriteStatus %s sortOrder: %lld", (uint8_t *)v48, 0x2Au);
                v53 = v70;
                swift_arrayDestroy();
                MEMORY[0x1BCCEAE98](v53, -1, -1);
                v54 = v48;
                v30 = v75;
                MEMORY[0x1BCCEAE98](v54, -1, -1);

                (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v73, v80);
              }
              else
              {

                swift_bridgeObjectRelease_n();
                (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v43, v80);
              }
              v10 = (unint64_t)v77;
              goto LABEL_26;
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          sub_1BC0C68BC();

        }
        else
        {
          sub_1BC0C6C28();
          a1 = v34;
          v55 = sub_1BC0C6C40();
          v56 = sub_1BC0C6FB8();
          v9 = v56;
          if (os_log_type_enabled(v55, v56))
          {
            v57 = swift_slowAlloc();
            v74 = swift_slowAlloc();
            v84[0] = v74;
            *(_DWORD *)v57 = v72;
            v58 = sub_1BC0C72AC();
            *(_QWORD *)(v57 + 4) = sub_1BC0A54E4(v58, v59, v84);
            swift_bridgeObjectRelease();
            *(_WORD *)(v57 + 12) = 2080;
            v60 = objc_msgSend((id)a1, sel_debugDescription);
            v61 = sub_1BC0C6EE0();
            v63 = v62;

            v30 = v75;
            v64 = v61;
            v35 = v32 - 3;
            *(_QWORD *)(v57 + 14) = sub_1BC0A54E4(v64, v63, v84);

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1BC0A2000, v55, (os_log_type_t)v9, "[%s]: Fetched unpinnable feed item %s", (uint8_t *)v57, 0x16u);
            v9 = v74;
            swift_arrayDestroy();
            v10 = (unint64_t)v77;
            MEMORY[0x1BCCEAE98](v9, -1, -1);
            MEMORY[0x1BCCEAE98](v57, -1, -1);

          }
          else
          {

          }
          (*(void (**)(unint64_t, uint64_t))(v79 + 8))(v10, v80);
          sub_1BC0C68BC();

        }
LABEL_26:
        ++v32;
      }
      while (v35 != v82);
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_1BC0B77AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  char v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[2];

  sub_1BC0B9480();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (_QWORD *)((char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC0B941C();
  v7 = sub_1BC0C71F8();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = (char *)v6 + *(int *)(v3 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v26[1] = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v4 + 72);
  swift_retain();
  while (1)
  {
    sub_1BC0B94E4(v13, (uint64_t)v6);
    v15 = *v6;
    v16 = v6[1];
    result = sub_1BC0B7EFC(*v6, v16);
    if ((v18 & 1) != 0)
      break;
    v19 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    *v20 = v15;
    v20[1] = v16;
    v21 = v8[7];
    v22 = sub_1BC0C66A0();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v19, v10, v22);
    v23 = v8[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_11;
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
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

unint64_t sub_1BC0B793C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  sub_1BC0B9114(0, (unint64_t *)&unk_1ED6A7720);
  v2 = (_QWORD *)sub_1BC0C71F8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1BC0B7EFC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

uint64_t sub_1BC0B7A58()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v0 = sub_1BC0C6C4C();
  MEMORY[0x1E0C80A78](v0);
  sub_1BC0C68D4();
  v1 = (void *)MEMORY[0x1BCCEA010]();
  sub_1BC0B7E1C();
  sub_1BC0B7E58(0, &qword_1ED6A8480, &qword_1ED6A8488, MEMORY[0x1E0DEE208], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1BC0C7DB0;
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v2 + 64) = sub_1BC0B7EB8();
  *(_QWORD *)(v2 + 32) = 0xD000000000000017;
  *(_QWORD *)(v2 + 40) = 0x80000001BC0C8DD0;
  v3 = (void *)sub_1BC0C6F94();
  objc_msgSend(v1, sel_setPredicate_, v3);

  v4 = sub_1BC0C7084();
  return v4;
}

uint64_t PinnedContentStateFeedItemCacheObserver.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PinnedContentStateFeedItemCacheObserver.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PinnedContentStateFeedItemCacheObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for PinnedContentStateFeedItemCacheObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PinnedContentStateFeedItemCacheObserver.__allocating_init(pinnedContentManager:storeOracle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_1BC0B7E1C()
{
  unint64_t result;

  result = qword_1ED6A7C30;
  if (!qword_1ED6A7C30)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A7C30);
  }
  return result;
}

void sub_1BC0B7E58(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_1BC0B9384(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

unint64_t sub_1BC0B7EB8()
{
  unint64_t result;

  result = qword_1ED6A8470;
  if (!qword_1ED6A8470)
  {
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED6A8470);
  }
  return result;
}

unint64_t sub_1BC0B7EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0C7288();
  sub_1BC0C6F04();
  v4 = sub_1BC0C7294();
  return sub_1BC0B7F60(a1, a2, v4);
}

unint64_t sub_1BC0B7F60(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1BC0C7234() & 1) == 0)
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
      while (!v14 && (sub_1BC0C7234() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1BC0B8040(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_1BC0C66A0();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  sub_1BC0B941C();
  v43 = a2;
  v8 = sub_1BC0C71EC();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_1BC0C7288();
      sub_1BC0C6F04();
      result = sub_1BC0C7294();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_1BC0B83A4(uint64_t a1, char a2)
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
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  sub_1BC0B9114(0, (unint64_t *)&unk_1ED6A7720);
  v37 = a2;
  v6 = sub_1BC0C71EC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1BC0C7288();
    sub_1BC0C6F04();
    result = sub_1BC0C7294();
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
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BC0B86B8(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  sub_1BC0B9114(0, &qword_1ED6A81F0);
  v42 = a2;
  v6 = sub_1BC0C71EC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BC0C7288();
    sub_1BC0C6F04();
    result = sub_1BC0C7294();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1BC0B89E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1BC0B7EFC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = sub_1BC0C66A0();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1BC0B8D04();
      goto LABEL_7;
    }
    sub_1BC0B8040(v15, a4 & 1);
    v22 = sub_1BC0B7EFC(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1BC0B8C74(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1BC0C7240();
  __break(1u);
  return result;
}

uint64_t sub_1BC0B8B24(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1BC0B7EFC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1BC0B8F5C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1BC0B83A4(result, a4 & 1);
  result = sub_1BC0B7EFC(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1BC0C7240();
  __break(1u);
  return result;
}

uint64_t sub_1BC0B8C74(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_1BC0C66A0();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_1BC0B8D04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_1BC0C66A0();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0B941C();
  v31 = v0;
  v4 = *v0;
  v5 = sub_1BC0C71E0();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1BC0B8F5C()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_1BC0B9114(0, (unint64_t *)&unk_1ED6A7720);
  v2 = *v0;
  v3 = sub_1BC0C71E0();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1BC0B9114(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1BC0C7204();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void *sub_1BC0B9164()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_1BC0B9114(0, &qword_1ED6A81F0);
  v2 = *v0;
  v3 = sub_1BC0C71E0();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BC0B9328(uint64_t a1)
{
  uint64_t v2;

  sub_1BC0B7E58(0, &qword_1EF3EF350, &qword_1EF3EF358, MEMORY[0x1E0D2D368], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BC0B9384(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1BC0B93D0()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);

  return swift_deallocObject();
}

id sub_1BC0B9404()
{
  uint64_t v0;

  return sub_1BC0B6CC4(*(_QWORD *)(v0 + 16), (_QWORD *)(v0 + 24), *(void **)(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_1BC0B941C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF3EF360)
  {
    sub_1BC0C66A0();
    v0 = sub_1BC0C7204();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF3EF360);
  }
}

void sub_1BC0B9480()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED6A7A40)
  {
    sub_1BC0C66A0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED6A7A40);
  }
}

uint64_t sub_1BC0B94E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0B9480();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id ForegroundFeedPopulationListeningOperation.__allocating_init(healthExperienceStore:listener:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;
  objc_super v8;

  v5 = objc_allocWithZone(v2);
  sub_1BC0A6D20(a1, (uint64_t)v5 + qword_1ED6A7AF0);
  sub_1BC0A6D20(a2, (uint64_t)v5 + qword_1ED6A7700);
  v8.receiver = v5;
  v8.super_class = v2;
  v6 = objc_msgSendSuper2(&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return v6;
}

id ForegroundFeedPopulationListeningOperation.init(healthExperienceStore:listener:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  objc_super v7;

  sub_1BC0A6D20(a1, (uint64_t)v2 + qword_1ED6A7AF0);
  sub_1BC0A6D20(a2, (uint64_t)v2 + qword_1ED6A7700);
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ForegroundFeedPopulationListeningOperation();
  v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return v5;
}

uint64_t type metadata accessor for ForegroundFeedPopulationListeningOperation()
{
  uint64_t result;

  result = qword_1ED6A78F8;
  if (!qword_1ED6A78F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC0B967C(char *a1)
{
  char *v2;

  __swift_project_boxed_opaque_existential_1(&a1[qword_1ED6A7700], *(_QWORD *)&a1[qword_1ED6A7700 + 24]);
  v2 = a1;
  sub_1BC0C6AD8();

}

uint64_t sub_1BC0B96DC()
{
  return sub_1BC0B96E8(MEMORY[0x1E0D2EC38]);
}

uint64_t sub_1BC0B96E8(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + qword_1ED6A7700 + 24);
  v4 = *(_QWORD *)(v1 + qword_1ED6A7700 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + qword_1ED6A7700), v3);
  return a1(v3, v4);
}

id ForegroundFeedPopulationListeningOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ForegroundFeedPopulationListeningOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0B9780()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0B97AC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + qword_1ED6A7AF0);
  return __swift_destroy_boxed_opaque_existential_0Tm(v0 + qword_1ED6A7700);
}

id ForegroundFeedPopulationListeningOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ForegroundFeedPopulationListeningOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0B980C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ForegroundFeedPopulationListeningOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ForegroundFeedPopulationListeningOperation.__allocating_init(healthExperienceStore:listener:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for ForegroundFeedPopulationListeningOperation + v0 + 16))();
}

uint64_t sub_1BC0B9874(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0Tm(a1 + qword_1ED6A7AF0);
  return __swift_destroy_boxed_opaque_existential_0Tm(a1 + qword_1ED6A7700);
}

uint64_t sub_1BC0B98AC()
{
  return type metadata accessor for ForegroundFeedPopulationListeningOperation();
}

_QWORD *CountryOracle.__allocating_init(mobileCountryCodeManagerProvider:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = (_QWORD *)swift_allocObject();
  sub_1BC0C6754();
  swift_allocObject();
  v4[2] = sub_1BC0C6748();
  v5 = (char *)v4 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_unittest_currentDate;
  v6 = sub_1BC0C66A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_1BC0C664C();
  v7 = (char *)v4 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryResult;
  sub_1BC0A7B14();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v4[3] = a1;
  v4[4] = a2;
  return v4;
}

uint64_t CountryOracle.init(mobileCountryCodeManagerProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = v2;
  sub_1BC0C6754();
  swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_1BC0C6748();
  v6 = v2 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_unittest_currentDate;
  v7 = sub_1BC0C66A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_1BC0C664C();
  v8 = v3 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryResult;
  sub_1BC0A7B14();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  return v3;
}

unint64_t sub_1BC0B9A4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED6A7758;
  if (!qword_1ED6A7758)
  {
    v1 = sub_1BC0C6820();
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0D2E160], v1);
    atomic_store(result, (unint64_t *)&qword_1ED6A7758);
  }
  return result;
}

uint64_t sub_1BC0B9A94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  double v15;
  double v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  uint64_t v20;
  _BYTE v21[24];

  v2 = v1;
  sub_1BC0BA540(0, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v21[-v5];
  v7 = sub_1BC0C66A0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v9);
  v13 = &v21[-v12];
  sub_1BC0C6724();
  if (objc_msgSend((id)objc_opt_self(), sel_isOverridePresent))
    goto LABEL_7;
  v14 = v1 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryCheckAttempt;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v13, v14, v7);
  sub_1BC0BAAF4(v2 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_unittest_currentDate, (uint64_t)v6, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1BC0C6694();
    sub_1BC0BA504((uint64_t)v6, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v11, v6, v7);
  }
  sub_1BC0C6664();
  v16 = v15;
  v17 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
  v17(v11, v7);
  v17(v13, v7);
  if (v16 >= 14400.0)
  {
LABEL_7:
    sub_1BC0A7B14();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a1, 1, 1, v20);
  }
  else
  {
    v18 = v2 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryResult;
    swift_beginAccess();
    return sub_1BC0BAAF4(v18, a1, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
  }
}

uint64_t sub_1BC0B9D24@<X0>(uint64_t *a1@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ObjectType;
  void (*v31)();
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  unsigned int (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int (*v61)(char *, uint64_t, uint64_t);
  uint64_t *v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  id v67;

  v2 = v1;
  v62 = a1;
  sub_1BC0BA540(0, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
  MEMORY[0x1E0C80A78](v3);
  v63 = (char *)&v55 - v4;
  v5 = sub_1BC0C6820();
  v56 = *(_QWORD *)(v5 - 8);
  v57 = v5;
  MEMORY[0x1E0C80A78](v5);
  v58 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0BA540(0, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  v8 = MEMORY[0x1E0C80A78](v7);
  v64 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v55 - v10;
  v12 = sub_1BC0C66A0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v65 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v55 - v16;
  sub_1BC0BA76C();
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = (char *)&v55 - v23;
  MEMORY[0x1E0C80A78](v22);
  v26 = (id *)((char *)&v55 - v25);
  v27 = sub_1BC0C6724();
  v28 = (*(uint64_t (**)(uint64_t))(v1 + 24))(v27);
  v59 = v2;
  v29 = v2 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_unittest_currentDate;
  sub_1BC0BAAF4(v29, (uint64_t)v11, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  v61 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v61(v11, 1, v12) == 1)
  {
    sub_1BC0C6694();
    sub_1BC0BA504((uint64_t)v11, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v11, v12);
  }
  ObjectType = swift_getObjectType();
  v66 = v28;
  v31 = sub_1BC0BA2A0((uint64_t)v17, ObjectType);
  v60 = v13;
  v32 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  ((void (*)(uint64_t))v31)(v32);
  swift_storeEnumTagMultiPayload();
  sub_1BC0BA7D8((uint64_t)v21, (uint64_t)v24, (uint64_t (*)(_QWORD))sub_1BC0BA76C);
  v33 = (uint64_t)v64;
  v34 = v62;
  v35 = v29;
  v37 = v58;
  v36 = v59;
  sub_1BC0BA7D8((uint64_t)v24, (uint64_t)v26, (uint64_t (*)(_QWORD))sub_1BC0BA76C);
  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v64 = (char *)v35;
    v67 = *v26;
    v38 = v67;
    v39 = v67;
    sub_1BC0B04A0();
    v40 = v37;
    v41 = v57;
    v42 = swift_dynamicCast();
    v43 = (uint64_t)v63;
    v44 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v61;
    v45 = v56;
    if (v42)
    {
      (*(void (**)(uint64_t *, char *, uint64_t))(v56 + 32))(v34, v40, v41);

    }
    else
    {

      *v34 = sub_1BC0C6610();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v45 + 104))(v34, *MEMORY[0x1E0D2E148], v41);
    }

    v35 = (uint64_t)v64;
    sub_1BC0A7B14();
    v48 = v49;
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    v46 = sub_1BC0C6844();
    (*(void (**)(uint64_t *, id *, uint64_t))(*(_QWORD *)(v46 - 8) + 32))(v34, v26, v46);
    sub_1BC0A7B14();
    v48 = v47;
    swift_storeEnumTagMultiPayload();
    v43 = (uint64_t)v63;
    v44 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v61;
  }
  sub_1BC0BA81C((uint64_t)v34, v43);
  sub_1BC0A7B14();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v43, 0, 1, v48);
  v50 = v36 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryResult;
  swift_beginAccess();
  sub_1BC0BA860(v43, v50);
  swift_endAccess();
  sub_1BC0BAAF4(v35, v33, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  if (v44(v33, 1, v12) == 1)
  {
    v51 = v65;
    sub_1BC0C6694();
    sub_1BC0BA504(v33, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    v52 = v60;
  }
  else
  {
    v52 = v60;
    v51 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 32))(v65, v33, v12);
  }
  v53 = v36 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryCheckAttempt;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v52 + 40))(v53, v51, v12);
  swift_endAccess();
  return swift_unknownObjectRelease();
}

void (*sub_1BC0BA2A0(uint64_t a1, uint64_t a2))()
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = sub_1BC0C66A0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = v2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_unknownObjectRetain();
  return sub_1BC0BAA98;
}

uint64_t sub_1BC0BA378@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  sub_1BC0BA540(0, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v7 - v3;
  sub_1BC0C6730();
  sub_1BC0B9A94((uint64_t)v4);
  sub_1BC0A7B14();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5) == 1)
  {
    sub_1BC0BA504((uint64_t)v4, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
    sub_1BC0B9D24(a1);
  }
  else
  {
    sub_1BC0BA7D8((uint64_t)v4, (uint64_t)a1, (uint64_t (*)(_QWORD))sub_1BC0A7B14);
  }
  return sub_1BC0C673C();
}

uint64_t CountryOracle.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  sub_1BC0BA504(v0 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_unittest_currentDate, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  v1 = v0 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryCheckAttempt;
  v2 = sub_1BC0C66A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1BC0BA504(v0 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryResult, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
  return v0;
}

uint64_t sub_1BC0BA504(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  sub_1BC0BA540(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1BC0BA540(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1BC0C7090();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t CountryOracle.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  sub_1BC0BA504(v0 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_unittest_currentDate, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  v1 = v0 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryCheckAttempt;
  v2 = sub_1BC0C66A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1BC0BA504(v0 + OBJC_IVAR____TtC16HealthPluginHost13CountryOracle_lock_lastCountryResult, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
  return swift_deallocClassInstance();
}

uint64_t sub_1BC0BA62C()
{
  return type metadata accessor for CountryOracle();
}

uint64_t type metadata accessor for CountryOracle()
{
  uint64_t result;

  result = qword_1ED6A7778;
  if (!qword_1ED6A7778)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC0BA670()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1BC0BA540(319, (unint64_t *)&qword_1ED6A8550, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  if (v0 <= 0x3F)
  {
    sub_1BC0C66A0();
    if (v1 <= 0x3F)
    {
      sub_1BC0BA540(319, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for CountryOracle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CountryOracle.__allocating_init(mobileCountryCodeManagerProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of CountryOracle.currentCountry()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

void sub_1BC0BA76C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7A98)
  {
    sub_1BC0C6844();
    sub_1BC0B04A0();
    v0 = sub_1BC0C72A0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7A98);
  }
}

uint64_t sub_1BC0BA7D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BC0BA81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0A7B14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BC0BA860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0BA540(0, &qword_1ED6A7A90, (void (*)(uint64_t))sub_1BC0A7B14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1BC0BA8B4(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v5 = sub_1BC0C66A0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a1, sel_currentEstimate);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, sel_ISOCode);
    v15[1] = v2;
    v12 = v11;
    sub_1BC0C6EE0();

    objc_msgSend(v10, sel_provenance);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    sub_1BC0C6838();

  }
  else
  {
    v13 = sub_1BC0C6820();
    sub_1BC0B9A4C();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v14, *MEMORY[0x1E0D2E140], v13);
    swift_willThrow();
  }
}

uint64_t sub_1BC0BAA24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1BC0C66A0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_1BC0BAA98()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BC0C66A0() - 8) + 80);
  sub_1BC0BA8B4(*(void **)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_1BC0BAAF4(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1BC0BA540(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

id sub_1BC0BAB40()
{
  uint64_t v0;
  id result;

  type metadata accessor for HealthPluginHostConnection();
  v0 = swift_allocObject();
  result = sub_1BC0BAD00();
  *(_QWORD *)(v0 + 16) = result;
  qword_1ED6A8330 = v0;
  return result;
}

uint64_t HealthPluginHostConnection.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_1BC0BAD00();
  return v0;
}

uint64_t static HealthPluginHostConnection.sharedConnection.getter()
{
  if (qword_1ED6A8530 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static HealthPluginHostConnection.sharedConnection.setter(uint64_t a1)
{
  if (qword_1ED6A8530 != -1)
    swift_once();
  swift_beginAccess();
  qword_1ED6A8330 = a1;
  return swift_release();
}

uint64_t (*static HealthPluginHostConnection.sharedConnection.modify())()
{
  if (qword_1ED6A8530 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1BC0BAD00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t aBlock;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t (*v24)();
  uint64_t v25;

  v0 = sub_1BC0C6C4C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C1C();
  v4 = sub_1BC0C6C40();
  v5 = sub_1BC0C6FAC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BC0A2000, v4, v5, "healthappd connection starting", v6, 2u);
    MEMORY[0x1BCCEAE98](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  aBlock = type metadata accessor for HealthPluginHostConnection();
  sub_1BC0BB7D0();
  v7 = sub_1BC0C6EEC();
  v9 = v8;
  v10 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
  v11 = (void *)sub_1BC0C6EBC();
  v12 = objc_msgSend(v10, sel_initWithMachServiceName_options_, v11, 0);

  v13 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EF3F16A0);
  objc_msgSend(v12, sel_setRemoteObjectInterface_, v13);

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v7;
  *(_QWORD *)(v14 + 24) = v9;
  v24 = sub_1BC0BB828;
  v25 = v14;
  v15 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v21 = 1107296256;
  v22 = sub_1BC0BFFB0;
  v23 = &block_descriptor_6;
  v16 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v12, sel_setInvalidationHandler_, v16);
  _Block_release(v16);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v7;
  *(_QWORD *)(v17 + 24) = v9;
  v24 = sub_1BC0BB850;
  v25 = v17;
  aBlock = v15;
  v21 = 1107296256;
  v22 = sub_1BC0BFFB0;
  v23 = &block_descriptor_12;
  v18 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_setInterruptionHandler_, v18);
  _Block_release(v18);
  objc_msgSend(v12, sel_resume);
  return v12;
}

uint64_t sub_1BC0BAFC0(uint64_t a1, unint64_t a2, uint64_t (*a3)(void), const char *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v8 = sub_1BC0C6C4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C1C();
  swift_bridgeObjectRetain_n();
  v12 = sub_1BC0C6C40();
  v13 = a3();
  if (os_log_type_enabled(v12, v13))
  {
    v19 = a4;
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v20 = v8;
    v16 = a1;
    v17 = v15;
    v22 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v21 = sub_1BC0A54E4(v16, a2, &v22);
    sub_1BC0C709C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BC0A2000, v12, v13, v19, v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v17, -1, -1);
    MEMORY[0x1BCCEAE98](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t HealthPluginHostConnection.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_1BC0BAD00();
  return v0;
}

uint64_t sub_1BC0BB1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  _BYTE v13[32];
  _QWORD aBlock[6];

  v3 = v2;
  v6 = *(void **)(v3 + 16);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  aBlock[4] = sub_1BC0BB698;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC0BB6A4;
  aBlock[3] = &block_descriptor_2;
  v8 = _Block_copy(aBlock);
  v9 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v9, sel_remoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);

  sub_1BC0C70B4();
  swift_unknownObjectRelease();
  sub_1BC0A6848((uint64_t)aBlock, (uint64_t)v13);
  sub_1BC0BB6FC();
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)aBlock);
    return v12;
  }
  else
  {
    sub_1BC0A6848((uint64_t)aBlock, (uint64_t)v13);
    sub_1BC0C7144();
    type metadata accessor for HealthPluginHostConnection();
    sub_1BC0C71B0();
    sub_1BC0C6F10();
    sub_1BC0C71B0();
    sub_1BC0C6F10();
    result = sub_1BC0C71C8();
    __break(1u);
  }
  return result;
}

uint64_t sub_1BC0BB3E8(void *a1, uint64_t *a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD);
  uint64_t v29;
  uint64_t v30;

  v8 = sub_1BC0C6C4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C1C();
  swift_retain();
  v12 = a1;
  swift_retain();
  v13 = a1;
  v14 = sub_1BC0C6C40();
  v15 = sub_1BC0C6FB8();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v26 = v8;
    v17 = v16;
    v18 = swift_slowAlloc();
    *(_DWORD *)v17 = 136315394;
    v28 = a3;
    v29 = *a2;
    v30 = v18;
    sub_1BC0BB7D0();
    v19 = sub_1BC0C6EEC();
    v27 = a4;
    v29 = sub_1BC0A54E4(v19, v20, &v30);
    sub_1BC0C709C();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v29 = (uint64_t)a1;
    v21 = a1;
    sub_1BC0B04A0();
    v22 = sub_1BC0C6EEC();
    v29 = sub_1BC0A54E4(v22, v23, &v30);
    a3 = v28;
    sub_1BC0C709C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC0A2000, v14, v15, "%s: remoteObjectProxyWithErrorHandler error: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v18, -1, -1);
    MEMORY[0x1BCCEAE98](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v26);
  }
  else
  {
    swift_release_n();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return a3(a1);
}

uint64_t sub_1BC0BB66C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0BB698(void *a1)
{
  uint64_t v1;

  return sub_1BC0BB3E8(a1, *(uint64_t **)(v1 + 16), *(uint64_t (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_1BC0BB6A4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_1BC0BB6FC()
{
  unint64_t result;

  result = qword_1ED6A82E8;
  if (!qword_1ED6A82E8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A82E8);
  }
  return result;
}

uint64_t type metadata accessor for HealthPluginHostConnection()
{
  return objc_opt_self();
}

uint64_t HealthPluginHostConnection.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HealthPluginHostConnection.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t method lookup function for HealthPluginHostConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthPluginHostConnection.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of HealthPluginHostConnection.pluginHostProxyWithErrorHandler(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

unint64_t sub_1BC0BB7D0()
{
  unint64_t result;

  result = qword_1ED6A83F8;
  if (!qword_1ED6A83F8)
  {
    type metadata accessor for HealthPluginHostConnection();
    result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A83F8);
  }
  return result;
}

uint64_t sub_1BC0BB804()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BC0BB828()
{
  uint64_t v0;

  return sub_1BC0BAFC0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x1E0DF2280], "%s: connection invalidated");
}

uint64_t sub_1BC0BB850()
{
  uint64_t v0;

  return sub_1BC0BAFC0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x1E0DF2290], "%s: connection interrupted");
}

id sub_1BC0BB88C@<X0>(char a1@<W0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id result;
  _BYTE v24[32];

  v5 = a1 & 1;
  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = &v24[-v7 - 8];
  v9 = sub_1BC0BBEB8(v5);
  v10 = sub_1BC0C66A0();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v8, a2, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_1BC0BCA4C((uint64_t)v8, v5);
  sub_1BC0B4A64((uint64_t)v8);
  if (qword_1ED6A7738 != -1)
    swift_once();
  sub_1BC0C6730();
  if (qword_1ED6A78B8 != -1)
    swift_once();
  v12 = v5 == 0;
  if (v5)
    v13 = 0x80000001BC0C90E0;
  else
    v13 = 0x80000001BC0C9100;
  if (v12)
    v14 = 0xD000000000000010;
  else
    v14 = 0xD000000000000014;
  sub_1BC0B2858(0, &qword_1ED6A7BB0, (uint64_t (*)(uint64_t))sub_1BC0BCBF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED6A7BD8);
  swift_beginAccess();
  v16 = (void (*)(_BYTE *, _QWORD))sub_1BC0C6760();
  sub_1BC0BC5A0(v14, v13);
  v16(v24, 0);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1BC0C673C();
  v17 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
  v18 = (void *)sub_1BC0C6EBC();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithString_, v18);

  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, 1);
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v9);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, -1);
  *a3 = v19;
  a3[1] = v20;
  a3[2] = 0;
  a3[3] = 0;
  a3[4] = v21;
  a3[5] = result;
  return result;
}

void sub_1BC0BBB38(char a1@<W0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a1 & 1;
  v6 = sub_1BC0BBEB8(a1 & 1);
  v7 = sub_1BC0BCD9C(v5);
  if ((v8 & 1) != 0)
    v9 = 0;
  else
    v9 = v7;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
  }
  else
  {
    sub_1BC0BCF64(v9 + 1, 0, v5);
    v10 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
    v11 = (void *)sub_1BC0C6EBC();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, sel_initWithString_, v11);

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, 0);
    v14 = (void *)sub_1BC0C6610();
    v15 = objc_msgSend(v14, sel_domain);

    if (v15)
    {
      v16 = a2;
      sub_1BC0B04A0();
      sub_1BC0C6EF8();
      v17 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
      v18 = (void *)sub_1BC0C6EBC();
      swift_bridgeObjectRelease();
      v19 = objc_msgSend(v17, sel_initWithString_, v18);

      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v6);
      sub_1BC0BCD58();
      v21 = sub_1BC0C6958();
      *a3 = v12;
      a3[1] = v13;
      a3[2] = v15;
      a3[3] = v19;
      a3[4] = v20;
      a3[5] = v21;
      return;
    }
  }
  __break(1u);
}

uint64_t sub_1BC0BBD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - v9;
  v11 = sub_1BC0C66A0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_1BC0B4A64(a1);
    sub_1BC0BC470(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1BC0B4A64((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_1BC0B89E8((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1BC0BBEB8(char a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  double v9;
  double v10;
  uint64_t result;
  uint64_t v12;

  v1 = a1 & 1;
  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v12 - v3;
  v5 = sub_1BC0C66A0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0BC168(v1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1BC0B4A64((uint64_t)v4);
LABEL_6:
    sub_1BC0BCD58();
    return sub_1BC0C694C();
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_1BC0C6664();
  v10 = v9;
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v10 < 9.22337204e18)
    goto LABEL_6;
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1BC0BC05C()
{
  uint64_t result;

  sub_1BC0C6754();
  swift_allocObject();
  result = sub_1BC0C6748();
  qword_1ED6A78C0 = result;
  return result;
}

uint64_t sub_1BC0BC098()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  sub_1BC0B2858(0, &qword_1ED6A7BA8, (uint64_t (*)(uint64_t))sub_1BC0BCCF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v1 = v0;
  __swift_allocate_value_buffer(v0, qword_1ED6A7BC0);
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED6A7BC0);
  v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  sub_1BC0B77AC(MEMORY[0x1E0DEE9D8]);
  sub_1BC0BCCF4();
  return sub_1BC0C6784();
}

uint64_t sub_1BC0BC168@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  sub_1BC0B2858(0, &qword_1ED6A7BA8, (uint64_t (*)(uint64_t))sub_1BC0BCCF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v21 - v7;
  if (qword_1ED6A7738 != -1)
    swift_once();
  sub_1BC0C6730();
  if ((a1 & 1) != 0)
    v9 = 0xD000000000000014;
  else
    v9 = 0xD000000000000010;
  if ((a1 & 1) != 0)
    v10 = 0x80000001BC0C90E0;
  else
    v10 = 0x80000001BC0C9100;
  if (qword_1ED6A7730 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED6A7BC0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
  sub_1BC0C676C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v21;
  if (*(_QWORD *)(v21 + 16) && (v13 = sub_1BC0B7EFC(v9, v10), (v14 & 1) != 0))
  {
    v15 = v13;
    v16 = *(_QWORD *)(v12 + 56);
    v17 = sub_1BC0C66A0();
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 16))(a2, v16 + *(_QWORD *)(v18 + 72) * v15, v17);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a2, 0, 1, v17);
  }
  else
  {
    v19 = sub_1BC0C66A0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a2, 1, 1, v19);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BC0C673C();
}

uint64_t sub_1BC0BC380()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  sub_1BC0B2858(0, &qword_1ED6A7BB0, (uint64_t (*)(uint64_t))sub_1BC0BCBF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v1 = v0;
  __swift_allocate_value_buffer(v0, qword_1ED6A7BD8);
  __swift_project_value_buffer(v1, (uint64_t)qword_1ED6A7BD8);
  v2 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  sub_1BC0B793C(MEMORY[0x1E0DEE9D8]);
  sub_1BC0BCBF4();
  return sub_1BC0C6784();
}

unint64_t sub_1BC0BC454()
{
  return 0xD000000000000038;
}

uint64_t sub_1BC0BC470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1BC0B7EFC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BC0B8D04();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_1BC0C66A0();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_1BC0BC67C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_1BC0C66A0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_1BC0BC5A0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1BC0B7EFC(a1, a2);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1BC0B8F5C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1BC0BC878(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1BC0BC67C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BC0C70CC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_1BC0C7288();
        swift_bridgeObjectRetain();
        sub_1BC0C6F04();
        v9 = sub_1BC0C7294();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_1BC0C66A0() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1BC0BC878(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1BC0C70CC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BC0C7288();
        swift_bridgeObjectRetain();
        sub_1BC0C6F04();
        v9 = sub_1BC0C7294();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1BC0BCA4C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_BYTE *, _QWORD);
  _BYTE v14[32];

  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = &v14[-v5 - 8];
  if (qword_1ED6A7738 != -1)
    swift_once();
  sub_1BC0C6730();
  sub_1BC0BCC98(a1, (uint64_t)v6);
  if (qword_1ED6A7730 != -1)
    swift_once();
  v7 = (a2 & 1) == 0;
  if ((a2 & 1) != 0)
    v8 = 0x80000001BC0C90E0;
  else
    v8 = 0x80000001BC0C9100;
  if (v7)
    v9 = 0xD000000000000010;
  else
    v9 = 0xD000000000000014;
  sub_1BC0B2858(0, &qword_1ED6A7BA8, (uint64_t (*)(uint64_t))sub_1BC0BCCF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED6A7BC0);
  swift_beginAccess();
  v11 = (void (*)(_BYTE *, _QWORD))sub_1BC0C6760();
  sub_1BC0BBD44((uint64_t)v6, v9, v8);
  v11(v14, 0);
  swift_endAccess();
  return sub_1BC0C673C();
}

void sub_1BC0BCBF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7A38)
  {
    v0 = sub_1BC0C6E8C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7A38);
  }
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

uint64_t sub_1BC0BCC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1BC0BCCF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A7A30)
  {
    sub_1BC0C66A0();
    v0 = sub_1BC0C6E8C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A7A30);
  }
}

unint64_t sub_1BC0BCD58()
{
  unint64_t result;

  result = qword_1ED6A78D0;
  if (!qword_1ED6A78D0)
  {
    result = MEMORY[0x1BCCEADF0](&unk_1BC0C7F64, &type metadata for BackgroundGenerationAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1ED6A78D0);
  }
  return result;
}

uint64_t sub_1BC0BCD9C(char a1)
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
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v15;

  sub_1BC0B2858(0, &qword_1ED6A7BB0, (uint64_t (*)(uint64_t))sub_1BC0BCBF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v15 - v5;
  if (qword_1ED6A7738 != -1)
    swift_once();
  sub_1BC0C6730();
  if ((a1 & 1) != 0)
    v7 = 0xD000000000000014;
  else
    v7 = 0xD000000000000010;
  if ((a1 & 1) != 0)
    v8 = 0x80000001BC0C90E0;
  else
    v8 = 0x80000001BC0C9100;
  if (qword_1ED6A78B8 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED6A7BD8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_1BC0C676C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v10 = v15;
  if (*(_QWORD *)(v15 + 16) && (v11 = sub_1BC0B7EFC(v7, v8), (v12 & 1) != 0))
    v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
  else
    v13 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC0C673C();
  return v13;
}

uint64_t sub_1BC0BCF64(uint64_t a1, char a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_BYTE *, _QWORD);
  uint64_t *v10;
  uint64_t *v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  _BYTE v15[32];

  if (qword_1ED6A7738 != -1)
    swift_once();
  sub_1BC0C6730();
  if ((a3 & 1) != 0)
    v6 = 0xD000000000000014;
  else
    v6 = 0xD000000000000010;
  if ((a3 & 1) != 0)
    v7 = 0x80000001BC0C90E0;
  else
    v7 = 0x80000001BC0C9100;
  if (qword_1ED6A78B8 != -1)
    swift_once();
  sub_1BC0B2858(0, &qword_1ED6A7BB0, (uint64_t (*)(uint64_t))sub_1BC0BCBF4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED6A7BD8);
  swift_beginAccess();
  v9 = (void (*)(_BYTE *, _QWORD))sub_1BC0C6760();
  v11 = v10;
  if ((a2 & 1) != 0)
  {
    sub_1BC0BC5A0(v6, v7);
  }
  else
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v11;
    *v11 = 0x8000000000000000;
    sub_1BC0B8B24(a1, v6, v7, isUniquelyReferenced_nonNull_native);
    *v11 = v14;
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v9(v15, 0);
  swift_endAccess();
  return sub_1BC0C673C();
}

uint64_t initializeBufferWithCopyOfBuffer for BackgroundGenerationAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for BackgroundGenerationAnalyticsEvent(id *a1)
{

}

_QWORD *initializeWithCopy for BackgroundGenerationAnalyticsEvent(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

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
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  return a1;
}

uint64_t assignWithCopy for BackgroundGenerationAnalyticsEvent(uint64_t a1, uint64_t a2)
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

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v14;

  v16 = *(void **)(a2 + 32);
  v17 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v16;
  v18 = v16;

  v19 = *(void **)(a2 + 40);
  v20 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v19;
  v21 = v19;

  return a1;
}

uint64_t assignWithTake for BackgroundGenerationAnalyticsEvent(uint64_t a1, _OWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundGenerationAnalyticsEvent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundGenerationAnalyticsEvent(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundGenerationAnalyticsEvent()
{
  return &type metadata for BackgroundGenerationAnalyticsEvent;
}

unint64_t sub_1BC0BD3AC()
{
  unint64_t result;

  result = qword_1ED6A78D8;
  if (!qword_1ED6A78D8)
  {
    result = MEMORY[0x1BCCEADF0](&unk_1BC0C7F3C, &type metadata for BackgroundGenerationAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1ED6A78D8);
  }
  return result;
}

unint64_t sub_1BC0BD3F4()
{
  unint64_t result;

  result = qword_1ED6A78E0;
  if (!qword_1ED6A78E0)
  {
    result = MEMORY[0x1BCCEADF0](&unk_1BC0C7F14, &type metadata for BackgroundGenerationAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_1ED6A78E0);
  }
  return result;
}

id PopulateDiscoverFeedOperation.__allocating_init(feedKinds:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[qword_1EF3EF380] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id PopulateDiscoverFeedOperation.init(feedKinds:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[qword_1EF3EF380] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for PopulateDiscoverFeedOperation();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for PopulateDiscoverFeedOperation()
{
  uint64_t result;

  result = qword_1EF3EF388;
  if (!qword_1EF3EF388)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC0BD500()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char *v33;
  _QWORD aBlock[6];

  v1 = sub_1BC0C6604();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = MEMORY[0x1E0C80A78](v1);
  v33 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v28 - v5;
  sub_1BC0C65EC();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v0;
  v8 = v0;
  v9 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0BE170, v7);
  swift_release();
  v32 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)&v8[qword_1EF3EF380] + 16);
  if (v10)
  {
    v29 = v9;
    v30 = v2;
    v31 = v1;
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1BC0A5CA8(0, v10, 0);
    v11 = 0;
    v12 = aBlock[0];
    do
    {
      v13 = sub_1BC0C6874();
      v15 = v14;
      aBlock[0] = v12;
      v17 = *(_QWORD *)(v12 + 16);
      v16 = *(_QWORD *)(v12 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_1BC0A5CA8(v16 > 1, v17 + 1, 1);
        v12 = aBlock[0];
      }
      ++v11;
      *(_QWORD *)(v12 + 16) = v17 + 1;
      v18 = v12 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v13;
      *(_QWORD *)(v18 + 40) = v15;
    }
    while (v10 != v11);
    swift_bridgeObjectRelease();
    v2 = v30;
    v1 = v31;
    v9 = v29;
  }
  v19 = (void *)sub_1BC0C6F34();
  swift_bridgeObjectRelease();
  v20 = (void *)sub_1BC0C65F8();
  v21 = v33;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v33, v6, v1);
  v22 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v23 = swift_allocObject();
  v24 = v32;
  *(_QWORD *)(v23 + 16) = v32;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v23 + v22, v21, v1);
  aBlock[4] = sub_1BC0BE1EC;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC0BFFB0;
  aBlock[3] = &block_descriptor_3;
  v25 = _Block_copy(aBlock);
  v26 = v24;
  swift_release();
  objc_msgSend(v9, sel_populateFeedWithFeedKinds_for_completion_, v19, v20, v25);
  _Block_release(v25);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v6, v1);
}

uint64_t sub_1BC0BD7C4(void *a1, void *a2)
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
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  char *v42;
  uint64_t v44;
  os_log_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  id v56;
  char *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t aBlock[7];

  v4 = sub_1BC0C6E44();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_1BC0C6E68();
  v58 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v57 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1BC0C6E50();
  v9 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC0C6C4C();
  v55 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C04();
  v15 = a2;
  v16 = a1;
  v59 = v15;
  v56 = a1;
  v17 = a1;
  v54 = v14;
  v18 = sub_1BC0C6C40();
  v19 = sub_1BC0C6FB8();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v46 = v20;
    v22 = v21;
    v23 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v47 = v24;
    *(_DWORD *)v22 = 138412546;
    v50 = v5;
    v45 = v18;
    v48 = v12;
    v25 = v59;
    v60 = (uint64_t)v59;
    aBlock[0] = v24;
    v51 = v4;
    v26 = v59;
    v49 = v7;
    v27 = v26;
    sub_1BC0C709C();
    *v23 = v25;

    *(_WORD *)(v22 + 12) = 2080;
    v28 = v56;
    v60 = (uint64_t)v56;
    v29 = v56;
    sub_1BC0B04A0();
    v30 = sub_1BC0C6EEC();
    v60 = sub_1BC0A54E4(v30, v31, aBlock);
    v7 = v49;
    v4 = v51;
    sub_1BC0C709C();
    v5 = v50;
    swift_bridgeObjectRelease();

    v32 = v45;
    _os_log_impl(&dword_1BC0A2000, v45, (os_log_type_t)v46, "%@: failed to generated Discover feed: %s", (uint8_t *)v22, 0x16u);
    sub_1BC0B5B74();
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v23, -1, -1);
    v33 = v47;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v33, -1, -1);
    MEMORY[0x1BCCEAE98](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v48);
  }
  else
  {
    v34 = v59;

    v35 = v56;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v12);
  }
  sub_1BC0B2960(0, (unint64_t *)&qword_1ED6A85F0);
  v36 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF540], v52);
  v37 = (void *)sub_1BC0C7060();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v36);
  v38 = swift_allocObject();
  v39 = v59;
  *(_QWORD *)(v38 + 16) = v59;
  aBlock[4] = (uint64_t)sub_1BC0B6420;
  aBlock[5] = v38;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0BFFB0;
  aBlock[3] = (uint64_t)&block_descriptor_9_0;
  v40 = _Block_copy(aBlock);
  v41 = v39;
  v42 = v57;
  sub_1BC0C6E5C();
  v60 = MEMORY[0x1E0DEE9D8];
  sub_1BC0B2A9C(&qword_1ED6A8540, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0B6440();
  sub_1BC0B2A9C(&qword_1ED6A8548, (uint64_t (*)(uint64_t))sub_1BC0B6440, MEMORY[0x1E0DEAF38]);
  sub_1BC0C70C0();
  MEMORY[0x1BCCEA7C0](0, v42, v7, v40);
  _Block_release(v40);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v53);
  return swift_release();
}

uint64_t sub_1BC0BDCCC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  os_log_t v33;
  int v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_1BC0C6604();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC0C6C4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C04();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v12 = a1;
  v13 = sub_1BC0C6C40();
  v14 = sub_1BC0C6FAC();
  v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    v16 = swift_slowAlloc();
    v38 = v9;
    v17 = v16;
    v18 = swift_slowAlloc();
    v35 = v11;
    v19 = (_QWORD *)v18;
    v32 = v18;
    v36 = swift_slowAlloc();
    v39 = (uint64_t)v12;
    v40 = v36;
    *(_DWORD *)v17 = 138412802;
    v34 = v15;
    v37 = v8;
    v33 = v13;
    v20 = v12;
    sub_1BC0C709C();
    *v19 = v12;

    *(_WORD *)(v17 + 12) = 2080;
    v21 = MEMORY[0x1BCCE9D58]();
    v39 = sub_1BC0A54E4(v21, v22, &v40);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_WORD *)(v17 + 22) = 2080;
    v23 = swift_bridgeObjectRetain();
    v24 = MEMORY[0x1BCCEA6C4](v23, MEMORY[0x1E0D2E570]);
    v26 = v25;
    swift_bridgeObjectRelease();
    v39 = sub_1BC0A54E4(v24, v26, &v40);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    v27 = v33;
    _os_log_impl(&dword_1BC0A2000, v33, (os_log_type_t)v34, "%@: generated Discover feed for date range %s and kinds %s", (uint8_t *)v17, 0x20u);
    sub_1BC0B5B74();
    v28 = v32;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v28, -1, -1);
    v29 = v36;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v29, -1, -1);
    MEMORY[0x1BCCEAE98](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v37);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return sub_1BC0C6970();
}

id PopulateDiscoverFeedOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PopulateDiscoverFeedOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0BE058()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0BE084()
{
  return swift_bridgeObjectRelease();
}

id PopulateDiscoverFeedOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PopulateDiscoverFeedOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0BE0C8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PopulateDiscoverFeedOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PopulateDiscoverFeedOperation.__allocating_init(feedKinds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for PopulateDiscoverFeedOperation + v0 + 8))();
}

uint64_t sub_1BC0BE134()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0BE144()
{
  return type metadata accessor for PopulateDiscoverFeedOperation();
}

uint64_t sub_1BC0BE14C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0BE170(void *a1)
{
  uint64_t v1;

  return sub_1BC0BD7C4(a1, *(void **)(v1 + 16));
}

uint64_t sub_1BC0BE178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1BC0C6604();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1BC0BE1EC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BC0C6604() - 8) + 80);
  return sub_1BC0BDCCC(*(void **)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_1BC0BE230()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  _QWORD *v10;
  NSObject *v11;
  uint8_t *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v1 = sub_1BC0C6C4C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v5 = v0;
  v6 = sub_1BC0C6C40();
  v7 = sub_1BC0C6FD0();
  if (os_log_type_enabled(v6, v7))
  {
    v19 = v1;
    v8 = swift_slowAlloc();
    v18 = v2;
    v9 = (uint8_t *)v8;
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v20 = v5;
    v11 = v5;
    sub_1BC0C709C();
    *v10 = v5;

    v1 = v19;
    _os_log_impl(&dword_1BC0A2000, v6, v7, "%@: starting", v9, 0xCu);
    sub_1BC0B5B74();
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v10, -1, -1);
    v12 = v9;
    v2 = v18;
    MEMORY[0x1BCCEAE98](v12, -1, -1);
  }
  else
  {

    v6 = v5;
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v13 = objc_msgSend(objc_allocWithZone((Class)sub_1BC0C6A6C()), sel_init);
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v14 = v5;
  v15 = sub_1BC0C6A60();
  swift_release();
  v16 = *(Class *)((char *)&v14->isa + qword_1ED6A8450);
  *(Class *)((char *)&v14->isa + qword_1ED6A8450) = (Class)v15;

}

uint64_t sub_1BC0BE450(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  char *v32;
  uint64_t (*v33)(uint64_t);
  char *v34;
  uint64_t v36;
  os_log_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t aBlock[6];

  v4 = sub_1BC0C6E44();
  v46 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v45 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BC0C6E68();
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x1E0C80A78](v6);
  v42 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC0C6C4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6BF8();
  v12 = a2;
  v13 = a1;
  v14 = v12;
  v15 = a1;
  v16 = sub_1BC0C6C40();
  v17 = sub_1BC0C6FB8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v41 = v4;
    v19 = v18;
    v20 = (_QWORD *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v47 = (uint64_t)v14;
    aBlock[0] = v38;
    *(_DWORD *)v19 = 138412546;
    v39 = v9;
    v40 = v8;
    v21 = v14;
    v37 = v16;
    v22 = v21;
    sub_1BC0C709C();
    *v20 = v14;

    *(_WORD *)(v19 + 12) = 2080;
    v47 = (uint64_t)a1;
    v23 = a1;
    sub_1BC0B2858(0, &qword_1EF3EF410, (uint64_t (*)(uint64_t))sub_1BC0B04A0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    v24 = sub_1BC0C6EEC();
    v47 = sub_1BC0A54E4(v24, v25, aBlock);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();

    v26 = v37;
    _os_log_impl(&dword_1BC0A2000, v37, v17, "%@: completed with error: %s", (uint8_t *)v19, 0x16u);
    sub_1BC0B5B74();
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v20, -1, -1);
    v27 = v38;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v27, -1, -1);
    v28 = v19;
    v4 = v41;
    MEMORY[0x1BCCEAE98](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v40);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v14;
  aBlock[4] = (uint64_t)sub_1BC0B6420;
  aBlock[5] = v29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0BFFB0;
  aBlock[3] = (uint64_t)&block_descriptor_4;
  v30 = _Block_copy(aBlock);
  v31 = v14;
  v32 = v42;
  sub_1BC0C6E5C();
  v47 = MEMORY[0x1E0DEE9D8];
  v33 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1BC0B2A9C(&qword_1ED6A8540, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8538, v33, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0BEFE8(&qword_1ED6A8548, (unint64_t *)&qword_1ED6A8538, v33);
  v34 = v45;
  sub_1BC0C70C0();
  MEMORY[0x1BCCEA7C0](0, v32, v34, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v4);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v44);
  return swift_release();
}

void sub_1BC0BE8BC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  NSObject *v23;
  _QWORD *v24;
  uint8_t *v25;
  void *v26;
  uint8_t *v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;

  v1 = sub_1BC0C6C4C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v31 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v27 - v5;
  sub_1BC0C6BF8();
  v7 = v0;
  v8 = sub_1BC0C6C40();
  v9 = sub_1BC0C6FD0();
  if (os_log_type_enabled(v8, v9))
  {
    v30 = v2;
    v10 = (uint8_t *)swift_slowAlloc();
    v29 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v32 = v7;
    v11 = v1;
    v12 = v7;
    v2 = v30;
    sub_1BC0C709C();
    v13 = v29;
    *v29 = v7;

    v1 = v11;
    _os_log_impl(&dword_1BC0A2000, v8, v9, "%@: cancelling", v10, 0xCu);
    sub_1BC0B5B74();
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v13, -1, -1);
    MEMORY[0x1BCCEAE98](v10, -1, -1);
  }
  else
  {

    v8 = v7;
  }

  v14 = *(void (**)(char *, uint64_t))(v2 + 8);
  v14(v6, v1);
  v15 = qword_1ED6A8450;
  v16 = *(Class *)((char *)&v7->isa + qword_1ED6A8450);
  if (v16)
  {
    v17 = v16;
    sub_1BC0C6BF8();
    v18 = v7;
    v19 = sub_1BC0C6C40();
    v20 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v19, v20))
    {
      v28 = v17;
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      v29 = v14;
      v30 = v1;
      v27 = v21;
      *(_DWORD *)v21 = 138412290;
      v32 = v18;
      v23 = v18;
      v14 = (void (*)(char *, uint64_t))v29;
      v1 = v30;
      sub_1BC0C709C();
      *v22 = v18;
      v24 = v22;

      v25 = v27;
      v17 = v28;
      _os_log_impl(&dword_1BC0A2000, v19, v20, "%@: ongoingProgress.cancel()", v27, 0xCu);
      sub_1BC0B5B74();
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v24, -1, -1);
      MEMORY[0x1BCCEAE98](v25, -1, -1);
    }
    else
    {

      v19 = v18;
    }

    v14(v31, v1);
    objc_msgSend(v17, sel_cancel);
    v26 = *(Class *)((char *)&v7->isa + v15);
    *(Class *)((char *)&v7->isa + v15) = 0;

  }
}

id InteractiveFeedItemGenerationOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id InteractiveFeedItemGenerationOperation.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  objc_class *v7;
  _QWORD v9[2];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;

  v12 = sub_1BC0C703C();
  v10 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v2 = (char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1BC0C700C();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v3);
  v5 = sub_1BC0C6E68();
  MEMORY[0x1E0C80A78](v5);
  *(_QWORD *)&v0[qword_1ED6A8450] = 0;
  v11 = qword_1EF3EF3D8;
  v9[1] = sub_1BC0B2960(0, (unint64_t *)&qword_1ED6A85F0);
  v6 = v0;
  sub_1BC0C6E5C();
  v14 = MEMORY[0x1E0DEE9D8];
  sub_1BC0B2A9C(&qword_1EF3EF3E0, v4, MEMORY[0x1E0DEF828]);
  sub_1BC0B2858(0, &qword_1EF3EF3E8, v4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0BEFE8((unint64_t *)&unk_1EF3EF3F0, &qword_1EF3EF3E8, v4);
  sub_1BC0C70C0();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v2, *MEMORY[0x1E0DEF8D0], v12);
  *(_QWORD *)&v0[v11] = sub_1BC0C7054();

  v7 = (objc_class *)type metadata accessor for InteractiveFeedItemGenerationOperation();
  v13.receiver = v6;
  v13.super_class = v7;
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_1BC0BEE58()
{
  return InteractiveFeedItemGenerationOperation.init()();
}

void sub_1BC0BEE78()
{
  uint64_t v0;

}

id InteractiveFeedItemGenerationOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InteractiveFeedItemGenerationOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1BC0BEED8(uint64_t a1)
{

}

uint64_t type metadata accessor for InteractiveFeedItemGenerationOperation()
{
  uint64_t result;

  result = qword_1ED6A8458;
  if (!qword_1ED6A8458)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC0BEF4C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for InteractiveFeedItemGenerationOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1BC0BEFAC()
{
  return type metadata accessor for InteractiveFeedItemGenerationOperation();
}

uint64_t sub_1BC0BEFB4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0BEFD8(void *a1)
{
  uint64_t v1;

  return sub_1BC0BE450(a1, *(void **)(v1 + 16));
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_1BC0BEFE8(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1BC0B2858(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCEADF0](MEMORY[0x1E0DEAF38], v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t HealthWelcomeFlowSignalProvider.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  HealthWelcomeFlowSignalProvider.init()();
  return v0;
}

uint64_t sub_1BC0BF068()
{
  return sub_1BC0BF5BC(&OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__healthWelcomeFlowCompletionDate);
}

uint64_t sub_1BC0BF074(uint64_t a1)
{
  return sub_1BC0BF69C(a1);
}

uint64_t (*sub_1BC0BF080(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  swift_beginAccess();
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v2[7] = sub_1BC0C6760();
  return sub_1BC0BF10C;
}

uint64_t sub_1BC0BF110@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[8];

  sub_1BC0BF994();
  v5 = v4;
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *a1
     + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__shouldShowHealthWelcomeFlowOnNextLaunch;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_1BC0C676C();
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v11[7];
  return result;
}

uint64_t sub_1BC0BF1DC()
{
  swift_beginAccess();
  sub_1BC0BF994();
  sub_1BC0C6778();
  return swift_endAccess();
}

uint64_t sub_1BC0BF244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[8];

  sub_1BC0BF994();
  v2 = v1;
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__shouldShowHealthWelcomeFlowOnNextLaunch;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_1BC0C676C();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  return v8[7];
}

uint64_t sub_1BC0BF2FC()
{
  swift_beginAccess();
  sub_1BC0BF994();
  sub_1BC0C6778();
  return swift_endAccess();
}

uint64_t (*sub_1BC0BF35C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  swift_beginAccess();
  sub_1BC0BF994();
  v2[7] = sub_1BC0C6760();
  return sub_1BC0BF10C;
}

uint64_t sub_1BC0BF3D0(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v13 - v9;
  v11 = *a1 + *a4;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  sub_1BC0C676C();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1BC0BF4AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  sub_1BC0B447C();
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v9 - v6;
  sub_1BC0BCC98(a1, (uint64_t)&v9 - v6);
  sub_1BC0BCC98((uint64_t)v7, (uint64_t)v5);
  swift_beginAccess();
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  sub_1BC0C6778();
  swift_endAccess();
  return sub_1BC0B4A64((uint64_t)v7);
}

uint64_t sub_1BC0BF5B0()
{
  return sub_1BC0BF5BC(&OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__noAdvertisableFeaturesFoundDate);
}

uint64_t sub_1BC0BF5BC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v4 = v3;
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v10 - v6;
  v8 = v1 + *a1;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  sub_1BC0C676C();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1BC0BF690(uint64_t a1)
{
  return sub_1BC0BF69C(a1);
}

uint64_t sub_1BC0BF69C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_1BC0B447C();
  MEMORY[0x1E0C80A78](v2);
  sub_1BC0BCC98(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  sub_1BC0C6778();
  swift_endAccess();
  return sub_1BC0B4A64(a1);
}

uint64_t (*sub_1BC0BF770(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  swift_beginAccess();
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v2[7] = sub_1BC0C6760();
  return sub_1BC0BF10C;
}

uint64_t HealthWelcomeFlowSignalProvider.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void (*v5)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE v7[16];

  sub_1BC0B447C();
  MEMORY[0x1E0C80A78](v1);
  v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1BC0BF9E8();
  sub_1BC0C6FDC();
  v4 = sub_1BC0C66A0();
  v5 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  sub_1BC0C6784();
  sub_1BC0C6FDC();
  v7[15] = 0;
  sub_1BC0C6784();
  sub_1BC0C6FDC();
  v5(v3, 1, 1, v4);
  sub_1BC0C6784();
  return v0;
}

void sub_1BC0BF994()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A8568)
  {
    v0 = sub_1BC0C6790();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A8568);
  }
}

unint64_t sub_1BC0BF9E8()
{
  unint64_t result;

  result = qword_1ED6A8558;
  if (!qword_1ED6A8558)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED6A8558);
  }
  return result;
}

uint64_t HealthWelcomeFlowSignalProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__healthWelcomeFlowCompletionDate;
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v3 = v2;
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v4(v1, v2);
  v5 = v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__shouldShowHealthWelcomeFlowOnNextLaunch;
  sub_1BC0BF994();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v4(v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__noAdvertisableFeaturesFoundDate, v3);
  return v0;
}

uint64_t HealthWelcomeFlowSignalProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__healthWelcomeFlowCompletionDate;
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v3 = v2;
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v4(v1, v2);
  v5 = v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__shouldShowHealthWelcomeFlowOnNextLaunch;
  sub_1BC0BF994();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v4(v0 + OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__noAdvertisableFeaturesFoundDate, v3);
  return swift_deallocClassInstance();
}

uint64_t sub_1BC0BFB78(uint64_t a1, uint64_t a2)
{
  return sub_1BC0BFB9C(a1, a2, &OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__healthWelcomeFlowCompletionDate);
}

uint64_t sub_1BC0BFB84(uint64_t a1)
{
  return sub_1BC0BFC7C(a1);
}

uint64_t sub_1BC0BFB90(uint64_t a1, uint64_t a2)
{
  return sub_1BC0BFB9C(a1, a2, &OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__noAdvertisableFeaturesFoundDate);
}

uint64_t sub_1BC0BFB9C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v12 - v8;
  v10 = v3 + *a3;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  sub_1BC0C676C();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1BC0BFC70(uint64_t a1)
{
  return sub_1BC0BFC7C(a1);
}

uint64_t sub_1BC0BFC7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_1BC0B447C();
  MEMORY[0x1E0C80A78](v2);
  sub_1BC0BCC98(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  sub_1BC0B2858(0, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  sub_1BC0C6778();
  swift_endAccess();
  return sub_1BC0B4A64(a1);
}

void sub_1BC0BFD50(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  swift_endAccess();
  free(v1);
}

uint64_t sub_1BC0BFD8C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BC0BF3D0(a1, a2, a3, &OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__healthWelcomeFlowCompletionDate);
}

uint64_t sub_1BC0BFDA8(uint64_t a1)
{
  return sub_1BC0BF4AC(a1);
}

uint64_t sub_1BC0BFDCC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1BC0BF3D0(a1, a2, a3, &OBJC_IVAR____TtC16HealthPluginHost31HealthWelcomeFlowSignalProvider__noAdvertisableFeaturesFoundDate);
}

uint64_t sub_1BC0BFDE8(uint64_t a1)
{
  return sub_1BC0BF4AC(a1);
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.healthWelcomeFlowCompletionDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.healthWelcomeFlowCompletionDate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.healthWelcomeFlowCompletionDate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.shouldShowHealthWelcomeFlowOnNextLaunch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.shouldShowHealthWelcomeFlowOnNextLaunch.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.shouldShowHealthWelcomeFlowOnNextLaunch.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.noAdvertisableFeaturesFoundDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.noAdvertisableFeaturesFoundDate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProviding.noAdvertisableFeaturesFoundDate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_1BC0BFE4C()
{
  return type metadata accessor for HealthWelcomeFlowSignalProvider();
}

uint64_t type metadata accessor for HealthWelcomeFlowSignalProvider()
{
  uint64_t result;

  result = qword_1ED6A8588;
  if (!qword_1ED6A8588)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC0BFE90()
{
  unint64_t v0;
  unint64_t v1;

  sub_1BC0B2858(319, &qword_1ED6A8560, (uint64_t (*)(uint64_t))sub_1BC0B447C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0D2D650]);
  if (v0 <= 0x3F)
  {
    sub_1BC0BF994();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for HealthWelcomeFlowSignalProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.healthWelcomeFlowCompletionDate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.healthWelcomeFlowCompletionDate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.healthWelcomeFlowCompletionDate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.shouldShowHealthWelcomeFlowOnNextLaunch.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.shouldShowHealthWelcomeFlowOnNextLaunch.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.shouldShowHealthWelcomeFlowOnNextLaunch.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.noAdvertisableFeaturesFoundDate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.noAdvertisableFeaturesFoundDate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.noAdvertisableFeaturesFoundDate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_1BC0BFFB0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id DeleteFeedOperation.__allocating_init(feedKinds:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[qword_1EF3EF418] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id DeleteFeedOperation.init(feedKinds:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[qword_1EF3EF418] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for DeleteFeedOperation();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for DeleteFeedOperation()
{
  uint64_t result;

  result = qword_1EF3EF420;
  if (!qword_1EF3EF420)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1BC0C00A4()
{
  void *v0;
  uint64_t v1;
  char *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  _QWORD v17[6];

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v0;
  v2 = v0;
  v3 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0C0B7C, v1);
  swift_release();
  v4 = *(_QWORD *)(*(_QWORD *)&v2[qword_1EF3EF418] + 16);
  if (v4)
  {
    v17[0] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1BC0A5CA8(0, v4, 0);
    v5 = 0;
    v6 = v17[0];
    do
    {
      v7 = sub_1BC0C6874();
      v9 = v8;
      v17[0] = v6;
      v11 = *(_QWORD *)(v6 + 16);
      v10 = *(_QWORD *)(v6 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_1BC0A5CA8(v10 > 1, v11 + 1, 1);
        v6 = v17[0];
      }
      ++v5;
      *(_QWORD *)(v6 + 16) = v11 + 1;
      v12 = v6 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
  }
  v13 = (void *)sub_1BC0C6F34();
  swift_bridgeObjectRelease();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v2;
  v17[4] = sub_1BC0C0B84;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1BC0BFFB0;
  v17[3] = &block_descriptor_5;
  v15 = _Block_copy(v17);
  v16 = v2;
  swift_release();
  objc_msgSend(v3, sel_deleteFeedWithFeedKinds_completion_, v13, v15);
  _Block_release(v15);
  swift_unknownObjectRelease();

}

uint64_t sub_1BC0C0290(void *a1, void *a2)
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
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  char *v42;
  uint64_t v44;
  os_log_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  id v56;
  char *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t aBlock[7];

  v4 = sub_1BC0C6E44();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_1BC0C6E68();
  v58 = *(_QWORD *)(v53 - 8);
  MEMORY[0x1E0C80A78](v53);
  v57 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_1BC0C6E50();
  v9 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BC0C6C4C();
  v55 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C04();
  v15 = a2;
  v16 = a1;
  v59 = v15;
  v56 = a1;
  v17 = a1;
  v54 = v14;
  v18 = sub_1BC0C6C40();
  v19 = sub_1BC0C6FB8();
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v21 = swift_slowAlloc();
    v46 = v20;
    v22 = v21;
    v23 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v47 = v24;
    *(_DWORD *)v22 = 138412546;
    v50 = v5;
    v45 = v18;
    v48 = v12;
    v25 = v59;
    v60 = (uint64_t)v59;
    aBlock[0] = v24;
    v51 = v4;
    v26 = v59;
    v49 = v7;
    v27 = v26;
    sub_1BC0C709C();
    *v23 = v25;

    *(_WORD *)(v22 + 12) = 2080;
    v28 = v56;
    v60 = (uint64_t)v56;
    v29 = v56;
    sub_1BC0B04A0();
    v30 = sub_1BC0C6EEC();
    v60 = sub_1BC0A54E4(v30, v31, aBlock);
    v7 = v49;
    v4 = v51;
    sub_1BC0C709C();
    v5 = v50;
    swift_bridgeObjectRelease();

    v32 = v45;
    _os_log_impl(&dword_1BC0A2000, v45, (os_log_type_t)v46, "%@: failed to delete Discover feed: %s", (uint8_t *)v22, 0x16u);
    sub_1BC0B5B74();
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v23, -1, -1);
    v33 = v47;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v33, -1, -1);
    MEMORY[0x1BCCEAE98](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v48);
  }
  else
  {
    v34 = v59;

    v35 = v56;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v12);
  }
  sub_1BC0B2960(0, (unint64_t *)&qword_1ED6A85F0);
  v36 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF540], v52);
  v37 = (void *)sub_1BC0C7060();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v36);
  v38 = swift_allocObject();
  v39 = v59;
  *(_QWORD *)(v38 + 16) = v59;
  aBlock[4] = (uint64_t)sub_1BC0B6420;
  aBlock[5] = v38;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0BFFB0;
  aBlock[3] = (uint64_t)&block_descriptor_9_1;
  v40 = _Block_copy(aBlock);
  v41 = v39;
  v42 = v57;
  sub_1BC0C6E5C();
  v60 = MEMORY[0x1E0DEE9D8];
  sub_1BC0B2A9C(&qword_1ED6A8540, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0B6440();
  sub_1BC0B2A9C(&qword_1ED6A8548, (uint64_t (*)(uint64_t))sub_1BC0B6440, MEMORY[0x1E0DEAF38]);
  sub_1BC0C70C0();
  MEMORY[0x1BCCEA7C0](0, v42, v7, v40);
  _Block_release(v40);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v53);
  return swift_release();
}

uint64_t sub_1BC0C0798(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[2];
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_1BC0C6C4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C04();
  v6 = a1;
  v7 = sub_1BC0C6C40();
  v8 = sub_1BC0C6FAC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v24 = v3;
    v10 = v9;
    v11 = (_QWORD *)swift_slowAlloc();
    v21 = v11;
    v22 = swift_slowAlloc();
    v25 = (uint64_t)v6;
    v26 = v22;
    *(_DWORD *)v10 = 138412546;
    v23 = v2;
    v12 = v6;
    sub_1BC0C709C();
    *v11 = v6;

    *(_WORD *)(v10 + 12) = 2080;
    v20[1] = v10 + 14;
    v13 = swift_bridgeObjectRetain();
    v14 = MEMORY[0x1BCCEA6C4](v13, MEMORY[0x1E0D2E570]);
    v16 = v15;
    swift_bridgeObjectRelease();
    v25 = sub_1BC0A54E4(v14, v16, &v26);
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v7, v8, "%@: deleted Discover feed for kinds %s", (uint8_t *)v10, 0x16u);
    sub_1BC0B5B74();
    v17 = v21;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v17, -1, -1);
    v18 = v22;
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v18, -1, -1);
    MEMORY[0x1BCCEAE98](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_1BC0C6970();
}

id DeleteFeedOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DeleteFeedOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0C0A64()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1BC0C0A90()
{
  return swift_bridgeObjectRelease();
}

id DeleteFeedOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeleteFeedOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0C0AD4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for DeleteFeedOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeleteFeedOperation.__allocating_init(feedKinds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for DeleteFeedOperation + v0 + 8))();
}

uint64_t sub_1BC0C0B40()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0C0B50()
{
  return type metadata accessor for DeleteFeedOperation();
}

uint64_t sub_1BC0C0B58()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0C0B7C(void *a1)
{
  uint64_t v1;

  return sub_1BC0C0290(a1, *(void **)(v1 + 16));
}

uint64_t sub_1BC0C0B84()
{
  uint64_t v0;

  return sub_1BC0C0798(*(void **)(v0 + 16));
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_1BC0C0BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = qword_1ED6A8400;
  if (*(_QWORD *)(v0 + qword_1ED6A8400))
  {
    v2 = *(_QWORD *)(v0 + qword_1ED6A8400);
  }
  else
  {
    if (qword_1ED6A8530 != -1)
      swift_once();
    swift_beginAccess();
    v2 = qword_1ED6A8330;
    *(_QWORD *)(v0 + v1) = qword_1ED6A8330;
    swift_retain_n();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_1BC0C0C54(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + qword_1ED6A8400) = a1;
  return swift_release();
}

uint64_t (*sub_1BC0C0C6C(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1BC0C0BA4();
  return sub_1BC0C0CA0;
}

uint64_t sub_1BC0C0CA0(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + qword_1ED6A8400) = *a1;
  return swift_release();
}

uint64_t sub_1BC0C0CB8(void *a1)
{
  _QWORD *v1;

  v1 = a1;
  sub_1BC0C0BA4();
  (*(void (**)(void))(class metadata base offset for HealthPluginHostOperation + (*MEMORY[0x1E0DEEDD8] & *v1) + 32))();

  return swift_release();
}

void sub_1BC0C0D10()
{
  sub_1BC0C71C8();
  __break(1u);
}

id HealthPluginHostOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HealthPluginHostOperation.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[qword_1ED6A8400] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthPluginHostOperation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HealthPluginHostOperation()
{
  uint64_t result;

  result = qword_1ED6A8408;
  if (!qword_1ED6A8408)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1BC0C0E04(char *a1)
{
  objc_super v2;

  *(_QWORD *)&a1[qword_1ED6A8400] = 0;
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for HealthPluginHostOperation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t sub_1BC0C0E50()
{
  return swift_release();
}

id HealthPluginHostOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthPluginHostOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0C0E94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1BC0C0BA4();
  *a1 = result;
  return result;
}

uint64_t sub_1BC0C0EBC(_QWORD *a1, _QWORD *a2)
{
  *(_QWORD *)(*a2 + qword_1ED6A8400) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_1BC0C0EF4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for HealthPluginHostOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthPluginHostOperation.connection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for HealthPluginHostOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 8))();
}

uint64_t dispatch thunk of HealthPluginHostOperation.connection.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for HealthPluginHostOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 16))();
}

uint64_t dispatch thunk of HealthPluginHostOperation.connection.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for HealthPluginHostOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 24))();
}

uint64_t sub_1BC0C0FC0()
{
  return swift_release();
}

uint64_t sub_1BC0C0FD0()
{
  return type metadata accessor for HealthPluginHostOperation();
}

uint64_t sub_1BC0C0FD8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + qword_1EF3EF488);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0C1040()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BC0C1088(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + qword_1EF3EF488);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BC0C10D8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1BC0C111C()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v0;
  v2 = v0;
  v3 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0C18D8, v1);
  swift_release();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  v8[4] = sub_1BC0C18E0;
  v8[5] = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1BC0C15F4;
  v8[3] = &block_descriptor_6;
  v5 = _Block_copy(v8);
  v6 = v2;
  swift_release();
  objc_msgSend(v3, sel_collectFeedItemCacheDiagnosticsWithCompletion_, v5);
  _Block_release(v5);
  return swift_unknownObjectRelease();
}

uint64_t sub_1BC0C121C(uint64_t a1, void *a2)
{
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
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v3 = sub_1BC0C6E44();
  v20 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BC0C6E68();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BC0C6E50();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0A6D64();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF540], v9);
  v13 = (void *)sub_1BC0C7060();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  aBlock[4] = sub_1BC0B6420;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BC0BFFB0;
  aBlock[3] = &block_descriptor_9_2;
  v15 = _Block_copy(aBlock);
  v16 = a2;
  sub_1BC0C6E5C();
  v21 = MEMORY[0x1E0DEE9D8];
  sub_1BC0B2A9C(&qword_1ED6A8540, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0B6440();
  sub_1BC0B2A9C(&qword_1ED6A8548, (uint64_t (*)(uint64_t))sub_1BC0B6440, MEMORY[0x1E0DEAF38]);
  sub_1BC0C70C0();
  MEMORY[0x1BCCEA7C0](0, v8, v5, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  return swift_release();
}

uint64_t sub_1BC0C147C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_1BC0C6634();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x1E0DEE9D8];
  if (v8)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_1BC0A5CE0(0, v8, 0);
    v9 = v16;
    v10 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_1BC0C6628();
      swift_bridgeObjectRelease();
      v16 = v9;
      v12 = *(_QWORD *)(v9 + 16);
      v11 = *(_QWORD *)(v9 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_1BC0A5CE0(v11 > 1, v12 + 1, 1);
        v9 = v16;
      }
      v10 += 16;
      *(_QWORD *)(v9 + 16) = v12 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v12, v7, v4);
      --v8;
    }
    while (v8);
  }
  v13 = (_QWORD *)(a2 + qword_1EF3EF488);
  swift_beginAccess();
  *v13 = v9;
  swift_bridgeObjectRelease();
  return sub_1BC0C6970();
}

uint64_t sub_1BC0C15F4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_1BC0C6F40();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id CollectFeedItemCacheDiagnosticsOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CollectFeedItemCacheDiagnosticsOperation.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[qword_1EF3EF488] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollectFeedItemCacheDiagnosticsOperation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CollectFeedItemCacheDiagnosticsOperation()
{
  uint64_t result;

  result = qword_1EF3EF490;
  if (!qword_1EF3EF490)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1BC0C16E8(char *a1)
{
  objc_super v2;

  *(_QWORD *)&a1[qword_1EF3EF488] = 0;
  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for CollectFeedItemCacheDiagnosticsOperation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t sub_1BC0C1734()
{
  return swift_bridgeObjectRelease();
}

id CollectFeedItemCacheDiagnosticsOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CollectFeedItemCacheDiagnosticsOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BC0C1778@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + qword_1EF3EF488);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BC0C17D0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for CollectFeedItemCacheDiagnosticsOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CollectFeedItemCacheDiagnosticsOperation.logURLs.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CollectFeedItemCacheDiagnosticsOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 8))();
}

uint64_t dispatch thunk of CollectFeedItemCacheDiagnosticsOperation.logURLs.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CollectFeedItemCacheDiagnosticsOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 16))();
}

uint64_t dispatch thunk of CollectFeedItemCacheDiagnosticsOperation.logURLs.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CollectFeedItemCacheDiagnosticsOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 24))();
}

uint64_t sub_1BC0C189C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BC0C18AC()
{
  return type metadata accessor for CollectFeedItemCacheDiagnosticsOperation();
}

uint64_t sub_1BC0C18B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0C18D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC0C121C(a1, *(void **)(v1 + 16));
}

uint64_t sub_1BC0C18E0(uint64_t a1)
{
  uint64_t v1;

  return sub_1BC0C147C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

HealthPluginHost::HealthChecklistFeatureStatusFeedItemMetadata __swiftcall HealthChecklistFeatureStatusFeedItemMetadata.init(uniqueIdentifier:featureStatus:)(Swift::String uniqueIdentifier, Swift::String featureStatus)
{
  Swift::String *v2;
  HealthPluginHost::HealthChecklistFeatureStatusFeedItemMetadata result;

  *v2 = uniqueIdentifier;
  v2[1] = featureStatus;
  result.featureStatus = featureStatus;
  result.uniqueIdentifier = uniqueIdentifier;
  return result;
}

uint64_t HealthChecklistFeatureStatusSnapshotProviding.evaluateFeatureSnapshot(date:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 8))(a1, 1, a2) & 1;
}

uint64_t sub_1BC0C1934(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_1BC0A68DC(0, (unint64_t *)&unk_1ED6A7A70, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BC0C8150;
  *(_QWORD *)(inited + 32) = sub_1BC0C67FC();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 48) = sub_1BC0C67F0();
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = sub_1BC0C6814();
  *(_QWORD *)(inited + 72) = v7;
  *(_QWORD *)(inited + 80) = sub_1BC0C6808();
  *(_QWORD *)(inited + 88) = v8;
  v9 = sub_1BC0C441C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 8))(v9, a1, a2);
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *HealthChecklistFeatureStatusSnapshotManager.__allocating_init(healthStore:healthExperienceStore:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *result;
  __int128 v10[2];

  sub_1BC0A6D20(a2, (uint64_t)v10);
  v4 = type metadata accessor for HealthChecklistFeatureStatusFeedItemProvider();
  v5 = swift_allocObject();
  sub_1BC0B2C1C(v10, v5 + 16);
  v6 = type metadata accessor for HealthChecklistFeatureStatusSnapshotStore();
  v7 = swift_allocObject();
  v8 = objc_msgSend((id)objc_opt_self(), sel_safetyDefaultsLocalDomainWithHealthStore_, a1);

  *(_QWORD *)(v7 + 16) = v8;
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  type metadata accessor for HealthChecklistFeatureStatusSnapshotManager();
  result = (_QWORD *)swift_allocObject();
  result[5] = v4;
  result[6] = &off_1E74A90D0;
  result[2] = v5;
  result[10] = v6;
  result[11] = &off_1E74A9088;
  result[7] = v7;
  return result;
}

uint64_t type metadata accessor for HealthChecklistFeatureStatusFeedItemProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HealthChecklistFeatureStatusSnapshotStore()
{
  return objc_opt_self();
}

uint64_t *HealthChecklistFeatureStatusSnapshotManager.__allocating_init(featureStatusFeedItemProvider:featureStatusSnapshotStore:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = __swift_mutable_project_boxed_opaque_existential_1(a2, v8);
  v11 = sub_1BC0C49EC(v7, v10, v2, v5, v8, v6, v9);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return v11;
}

uint64_t type metadata accessor for HealthChecklistFeatureStatusSnapshotManager()
{
  return objc_opt_self();
}

uint64_t *HealthChecklistFeatureStatusSnapshotManager.init(featureStatusFeedItemProvider:featureStatusSnapshotStore:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v20;

  v3 = v2;
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = __swift_mutable_project_boxed_opaque_existential_1(a1, v6);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v10);
  v12 = *(_QWORD *)(a2 + 24);
  v13 = *(_QWORD *)(a2 + 32);
  v14 = __swift_mutable_project_boxed_opaque_existential_1(a2, v12);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  v18 = sub_1BC0C3B00((uint64_t)v10, (uint64_t)v16, v3, v6, v12, v7, v13);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return v18;
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

uint64_t sub_1BC0C1D5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[10];
  v2 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
}

uint64_t sub_1BC0C1DB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[10];
  v2 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_1BC0C1E04()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v0 + 2;
  v4 = v0[5];
  v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  v5 = sub_1BC0C1934(v4, v3);
  if (!v1)
  {
    v4 = sub_1BC0C4870(v5);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_1BC0C1E80(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  if (a1)
  {
    v2 = a1;
  }
  else
  {
    sub_1BC0A68DC(0, (unint64_t *)&unk_1ED6A7A70, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BC0C8150;
    *(_QWORD *)(inited + 32) = sub_1BC0C67FC();
    *(_QWORD *)(inited + 40) = v4;
    *(_QWORD *)(inited + 48) = sub_1BC0C67F0();
    *(_QWORD *)(inited + 56) = v5;
    *(_QWORD *)(inited + 64) = sub_1BC0C6814();
    *(_QWORD *)(inited + 72) = v6;
    *(_QWORD *)(inited + 80) = sub_1BC0C6808();
    *(_QWORD *)(inited + 88) = v7;
    v2 = sub_1BC0C441C(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  v8 = v1[5];
  v9 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v8);
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  swift_bridgeObjectRetain();
  v11 = v10(v2, v8, v9);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1BC0C1F9C(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = v2;
  v7 = v2 + 7;
  v8 = v2[10];
  v9 = v2[11];
  __swift_project_boxed_opaque_existential_1(v2 + 7, v8);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
  if (!v3)
  {
    v11 = v10;
    v12 = v2[5];
    v13 = v4[6];
    __swift_project_boxed_opaque_existential_1(v4 + 2, v4[5]);
    v14 = sub_1BC0C1934(v12, v13);
    v15 = sub_1BC0C4870(v14);
    swift_bridgeObjectRelease();
    v16 = sub_1BC0C26AC(v11, v15, a1);
    LOBYTE(v9) = v16;
    if ((a2 & 1) != 0)
    {
      v18 = v4[10];
      v23 = v4[11];
      __swift_project_boxed_opaque_existential_1(v7, v18);
      (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v15, v18);
      swift_bridgeObjectRelease();
      v19 = v4[10];
      v20 = v4[11];
      __swift_project_boxed_opaque_existential_1(v7, v19);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(a1, v19, v20);
      if (v11)
      {
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
        {
          v22 = v4[10];
          v21 = v4[11];
          __swift_project_boxed_opaque_existential_1(v7, v22);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(a1, v22, v21);
          LOBYTE(v9) = 1;
        }
        else
        {
          LOBYTE(v9) = 0;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v9 & 1;
}

uint64_t sub_1BC0C2188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;

  v55 = a7;
  v60 = a1;
  v58 = sub_1BC0C66A0();
  v56 = *(_QWORD *)(v58 - 8);
  v13 = MEMORY[0x1E0C80A78](v58);
  v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v57 = (char *)&v54 - v16;
  sub_1BC0B2858(0, (unint64_t *)&qword_1ED6A8550, v17, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v54 - v22;
  if (!a4)
  {
    v26 = sub_1BC0C6814();
    v28 = v60;
    v29 = v59;
    if (v26 != a5 || v27 != a6)
    {
      v34 = sub_1BC0C7234();
      swift_bridgeObjectRelease();
      if ((v34 & 1) != 0)
      {
LABEL_16:
        v35 = v29[10];
        v36 = v29[11];
        __swift_project_boxed_opaque_existential_1(v29 + 7, v35);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 56))(v28, a2, v35, v36);
        if (v7)
          return v36 & 1;
        v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v56 + 48))(v23, 1, v58);
        sub_1BC0C4EF0((uint64_t)v23, (uint64_t)&qword_1ED6A8550, (uint64_t)MEMORY[0x1E0CB0870], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC0B2858);
        if (v37 == 1)
        {
          v38 = v59[10];
          v36 = v59[11];
          __swift_project_boxed_opaque_existential_1(v29 + 7, v38);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 64))(v60, a2, v55, v38, v36);
          LOBYTE(v36) = 1;
          return v36 & 1;
        }
        goto LABEL_36;
      }
      if (sub_1BC0C67F0() != a5 || v51 != a6)
      {
        v52 = sub_1BC0C7234();
        swift_bridgeObjectRelease();
        if ((v52 & 1) == 0)
        {
          sub_1BC0C67FC();
          swift_bridgeObjectRelease();
          sub_1BC0C67FC();
          swift_bridgeObjectRelease();
          goto LABEL_36;
        }
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v24 = sub_1BC0C67FC();
  v54 = a2;
  if (v24 == a3 && v25 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v30 = sub_1BC0C7234();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
      goto LABEL_12;
  }
  if (sub_1BC0C6814() == a5 && v31 == a6)
    goto LABEL_22;
  v32 = sub_1BC0C7234();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_23;
LABEL_12:
  if (sub_1BC0C67FC() == a3 && v33 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v39 = sub_1BC0C7234();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
      goto LABEL_36;
  }
  if (sub_1BC0C67F0() == a5 && v40 == a6)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  v46 = sub_1BC0C7234();
  swift_bridgeObjectRelease();
  if ((v46 & 1) == 0)
  {
LABEL_36:
    LOBYTE(v36) = 0;
    return v36 & 1;
  }
LABEL_23:
  v41 = v59 + 7;
  v36 = v59[10];
  v42 = v59[11];
  __swift_project_boxed_opaque_existential_1(v59 + 7, v36);
  v43 = v54;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v60, v54, v36, v42);
  if (!v7)
  {
    v44 = v56;
    v45 = v58;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v21, 1, v58) == 1)
    {
      sub_1BC0C664C();
      sub_1BC0C4EF0((uint64_t)v21, (uint64_t)&qword_1ED6A8550, (uint64_t)MEMORY[0x1E0CB0870], (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC0B2858);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v57, v21, v45);
    }
    v47 = v55;
    sub_1BC0C6658();
    LOBYTE(v36) = sub_1BC0C667C();
    v48 = *(void (**)(char *, uint64_t))(v44 + 8);
    v48(v15, v45);
    if ((v36 & 1) != 0)
    {
      v49 = v59[10];
      v50 = v59[11];
      __swift_project_boxed_opaque_existential_1(v41, v49);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 64))(v60, v43, v47, v49, v50);
      v45 = v58;
    }
    v48(v57, v45);
  }
  return v36 & 1;
}

uint64_t sub_1BC0C26AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  unint64_t i;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  os_log_t v50;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  os_log_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v5 = v4;
  v6 = v3;
  v58 = a3;
  v59 = v3;
  v51[1] = v6->isa;
  v9 = sub_1BC0C6C4C();
  v52 = *(_QWORD *)(v9 - 8);
  v53 = v9;
  MEMORY[0x1E0C80A78](v9);
  v54 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 64);
  v55 = a2 + 64;
  v12 = 1 << *(_BYTE *)(a2 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v56 = (uint64_t *)((unint64_t)(v12 + 63) >> 6);
  v60 = a2;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  v57 = a1;
  if (!v14)
    goto LABEL_5;
LABEL_4:
  v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v17 | (v16 << 6); ; i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    v22 = 16 * i;
    v23 = (uint64_t *)(*(_QWORD *)(v60 + 48) + v22);
    v24 = *v23;
    v25 = v23[1];
    v26 = (uint64_t *)(*(_QWORD *)(v60 + 56) + v22);
    v28 = *v26;
    v27 = v26[1];
    if (a1)
    {
      v29 = *(_QWORD *)(a1 + 16);
      swift_bridgeObjectRetain();
      if (v29)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v30 = sub_1BC0B7EFC(v24, v25);
        if ((v31 & 1) != 0)
        {
          v32 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v30);
          a1 = *v32;
          v33 = v32[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      a1 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v33 = 0;
LABEL_25:
    v34 = sub_1BC0C2188(v24, v25, a1, v33, v28, v27, v58);
    if (v5)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v36 & 1;
    }
    v35 = v34;
    swift_bridgeObjectRelease();
    if ((v35 & 1) != 0)
    {
      v37 = v54;
      sub_1BC0C6C34();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v38 = v57;
      swift_bridgeObjectRetain_n();
      v39 = sub_1BC0C6C40();
      v40 = sub_1BC0C6FD0();
      if (os_log_type_enabled(v39, (os_log_type_t)v40))
      {
        LODWORD(v58) = v40;
        v59 = v39;
        v41 = swift_slowAlloc();
        v55 = swift_slowAlloc();
        v63 = v55;
        *(_DWORD *)v41 = 136315906;
        v56 = (uint64_t *)(v41 + 4);
        v42 = sub_1BC0C72AC();
        v61 = sub_1BC0A54E4(v42, v43, &v63);
        sub_1BC0C709C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 12) = 2080;
        swift_bridgeObjectRetain();
        v61 = sub_1BC0A54E4(v24, v25, &v63);
        v56 = &v62;
        sub_1BC0C709C();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v41 + 22) = 2080;
        if (v38)
        {
          v44 = 7104878;
          if (*(_QWORD *)(v38 + 16))
          {
            swift_bridgeObjectRetain();
            v45 = sub_1BC0B7EFC(v24, v25);
            if ((v46 & 1) != 0)
            {
              v47 = (uint64_t *)(*(_QWORD *)(v38 + 56) + 16 * v45);
              v44 = *v47;
              v48 = v47[1];
              swift_bridgeObjectRetain();
            }
            else
            {
              v48 = 0xE300000000000000;
            }
            v49 = v55;
            swift_bridgeObjectRelease();
          }
          else
          {
            v48 = 0xE300000000000000;
            v49 = v55;
          }
        }
        else
        {
          v48 = 0xE300000000000000;
          v49 = v55;
          v44 = 7104878;
        }
        v61 = sub_1BC0A54E4(v44, v48, &v63);
        sub_1BC0C709C();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 32) = 2080;
        swift_bridgeObjectRetain();
        v61 = sub_1BC0A54E4(v28, v27, &v63);
        sub_1BC0C709C();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        v50 = v59;
        _os_log_impl(&dword_1BC0A2000, v59, (os_log_type_t)v58, "[%s] Checklist tile needs showing for new transition for %s going from: %s to: %s", (uint8_t *)v41, 0x2Au);
        swift_arrayDestroy();
        MEMORY[0x1BCCEAE98](v49, -1, -1);
        MEMORY[0x1BCCEAE98](v41, -1, -1);

        (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v53);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v53);
      }
      swift_release();
      v36 = 1;
      return v36 & 1;
    }
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    a1 = v57;
    if (v14)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v16++, 1))
      break;
    if (v16 >= (uint64_t)v56)
      goto LABEL_39;
    v20 = *(_QWORD *)(v55 + 8 * v16);
    if (!v20)
    {
      v21 = v16 + 1;
      if (v16 + 1 >= (uint64_t)v56)
        goto LABEL_39;
      v20 = *(_QWORD *)(v55 + 8 * v21);
      if (v20)
        goto LABEL_14;
      v21 = v16 + 2;
      if (v16 + 2 >= (uint64_t)v56)
        goto LABEL_39;
      v20 = *(_QWORD *)(v55 + 8 * v21);
      if (v20)
      {
LABEL_14:
        v16 = v21;
        goto LABEL_15;
      }
      v21 = v16 + 3;
      if (v16 + 3 < (uint64_t)v56)
      {
        v20 = *(_QWORD *)(v55 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v16 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_49;
            if (v16 >= (uint64_t)v56)
              goto LABEL_39;
            v20 = *(_QWORD *)(v55 + 8 * v16);
            ++v21;
            if (v20)
              goto LABEL_15;
          }
        }
        goto LABEL_14;
      }
LABEL_39:
      swift_release();
      v36 = 0;
      return v36 & 1;
    }
LABEL_15:
    v14 = (v20 - 1) & v20;
  }
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

uint64_t HealthChecklistFeatureStatusSnapshotManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  return v0;
}

uint64_t HealthChecklistFeatureStatusSnapshotManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t sub_1BC0C2D0C(uint64_t a1, char a2)
{
  return sub_1BC0C1F9C(a1, a2) & 1;
}

uint64_t sub_1BC0C2D30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
}

uint64_t sub_1BC0C2D90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 56), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_1BC0C2DE0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v0;
  v3 = (_QWORD *)(*v0 + 16);
  v4 = *(_QWORD *)(*v0 + 40);
  v5 = *(_QWORD *)(v2 + 48);
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = sub_1BC0C1934(v4, v5);
  if (!v1)
  {
    v5 = sub_1BC0C4870(v6);
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_1BC0C2E60(uint64_t a1)
{
  return sub_1BC0C1E80(a1);
}

void sub_1BC0C2E80(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD *v8;

  sub_1BC0C68D4();
  v5 = (void *)sub_1BC0C6880();
  v6 = (void *)sub_1BC0C688C();

  v7 = sub_1BC0C7084();
  if (!v2)
  {
    swift_bridgeObjectRetain();
    v8 = sub_1BC0C4134(v7, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a2 = v8;
  }
}

void sub_1BC0C2F44(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;

  sub_1BC0C68D4();
  v3 = (void *)sub_1BC0C6880();
  v4 = (void *)sub_1BC0C688C();

  v5 = sub_1BC0C7078();
  if (!v1)
    *a1 = v5;
}

uint64_t sub_1BC0C2FD0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  return swift_deallocClassInstance();
}

void sub_1BC0C2FF4()
{
  uint64_t v0;
  void *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 16), *(_QWORD *)(*(_QWORD *)v0 + 40));
  v1 = (void *)sub_1BC0C66F4();
  sub_1BC0A68DC(0, &qword_1ED6A81D0, (uint64_t)&type metadata for HealthChecklistFeatureStatusFeedItemMetadata, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1BC0C706C();

}

void sub_1BC0C30AC()
{
  void *v0;

  sub_1BC0C66E8();
  sub_1BC0C66DC();
  v0 = (void *)sub_1BC0C66D0();
  swift_release();
  sub_1BC0C706C();

}

uint64_t sub_1BC0C3140()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  _BYTE v3[24];
  uint64_t v4;

  result = sub_1BC0C6FE8();
  if (!v0)
  {
    if (v4)
    {
      sub_1BC0C4F94(0, (unint64_t *)&unk_1ED6A81B0, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEA048]);
      if (swift_dynamicCast())
        return v2;
      else
        return 0;
    }
    else
    {
      sub_1BC0C4EF0((uint64_t)v3, (uint64_t)&qword_1ED6A7C38, MEMORY[0x1E0DEE9B8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_1BC0A68DC);
      return 0;
    }
  }
  return result;
}

id sub_1BC0C320C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  unsigned int v4;
  id v6;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_1BC0C6E74();
  v3 = (void *)sub_1BC0C6EBC();
  v7[0] = 0;
  v4 = objc_msgSend(v1, sel_setPropertyListValue_forKey_error_, v2, v3, v7);

  if (v4)
    return v7[0];
  v6 = v7[0];
  sub_1BC0C661C();

  return (id)swift_willThrow();
}

id sub_1BC0C330C()
{
  return sub_1BC0C33CC();
}

id sub_1BC0C336C()
{
  return sub_1BC0C33CC();
}

id sub_1BC0C33CC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  unsigned int v4;
  id v6;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_1BC0C6670();
  v3 = (void *)sub_1BC0C6EBC();
  v7[0] = 0;
  v4 = objc_msgSend(v1, sel_setDate_forKey_error_, v2, v3, v7);

  if (v4)
    return v7[0];
  v6 = v7[0];
  sub_1BC0C661C();

  return (id)swift_willThrow();
}

id sub_1BC0C34B4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v9;
  id v10[3];

  v10[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = *(void **)(v2 + 16);
  v5 = (void *)sub_1BC0C6670();
  v10[1] = a2;
  swift_bridgeObjectRetain();
  sub_1BC0C6F10();
  v6 = (void *)sub_1BC0C6EBC();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v7 = objc_msgSend(v4, sel_setDate_forKey_error_, v5, v6, v10);

  if (v7)
    return v10[0];
  v9 = v10[0];
  sub_1BC0C661C();

  return (id)swift_willThrow();
}

uint64_t sub_1BC0C35D0()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_1BC0C35F4()
{
  return sub_1BC0C3140();
}

id sub_1BC0C3614()
{
  return sub_1BC0C320C();
}

uint64_t sub_1BC0C3634()
{
  return sub_1BC0C6FF4();
}

id sub_1BC0C3670()
{
  return sub_1BC0C330C();
}

uint64_t sub_1BC0C3690()
{
  return sub_1BC0C6FF4();
}

id sub_1BC0C36CC()
{
  return sub_1BC0C336C();
}

uint64_t sub_1BC0C36EC()
{
  swift_bridgeObjectRetain();
  sub_1BC0C6F10();
  sub_1BC0C6FF4();
  return swift_bridgeObjectRelease();
}

id sub_1BC0C3780(uint64_t a1, void *a2)
{
  return sub_1BC0C34B4(a1, a2);
}

_QWORD *sub_1BC0C37A0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_1BC0B2858(0, &qword_1EF3EF188, (uint64_t (*)(uint64_t))sub_1BC0A67F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1BC0C3C88(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1BC0C38C0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_1BC0B2858(0, &qword_1EF3EF4E0, (uint64_t (*)(uint64_t))sub_1BC0C4FEC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1BC0C3B84(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1BC0C39E0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_1BC0A68DC(0, (unint64_t *)&unk_1ED6A81F8, (uint64_t)&type metadata for HealthChecklistFeatureStatusFeedItemMetadata, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
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
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1BC0C4044(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_1BC0C3B00(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v14;

  a3[5] = a4;
  a3[6] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  a3[10] = a5;
  a3[11] = a7;
  v14 = __swift_allocate_boxed_opaque_existential_1(a3 + 7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(v14, a2, a5);
  return a3;
}

uint64_t sub_1BC0C3B84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_1BC0C4FEC(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0C3C88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_1BC0A67F8();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

uint64_t sub_1BC0C3D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  unint64_t i;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v31;

  v2 = a2;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v29 = (unint64_t)(v3 + 63) >> 6;
  v31 = a2 + 56;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    while (v5)
    {
      v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v9 = v8 | (v7 << 6);
      if (*(_QWORD *)(v2 + 16))
        goto LABEL_24;
    }
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_42;
    }
    if (v10 >= v29)
      goto LABEL_40;
    v11 = *(_QWORD *)(v28 + 8 * v10);
    ++v7;
    if (!v11)
    {
      v7 = v10 + 1;
      if (v10 + 1 >= v29)
        goto LABEL_40;
      v11 = *(_QWORD *)(v28 + 8 * v7);
      if (!v11)
      {
        v7 = v10 + 2;
        if (v10 + 2 >= v29)
          goto LABEL_40;
        v11 = *(_QWORD *)(v28 + 8 * v7);
        if (!v11)
        {
          v7 = v10 + 3;
          if (v10 + 3 >= v29)
            goto LABEL_40;
          v11 = *(_QWORD *)(v28 + 8 * v7);
          if (!v11)
          {
            v12 = v10 + 4;
            if (v12 >= v29)
            {
LABEL_40:
              swift_release();
              return 0;
            }
            v11 = *(_QWORD *)(v28 + 8 * v12);
            v7 = v12;
            if (!v11)
              break;
          }
        }
      }
    }
LABEL_23:
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v7 << 6);
    if (*(_QWORD *)(v2 + 16))
    {
LABEL_24:
      v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
      v14 = *v13;
      v15 = v13[1];
      sub_1BC0C7288();
      swift_bridgeObjectRetain();
      sub_1BC0C6F04();
      v16 = sub_1BC0C7294();
      v17 = v2;
      v18 = -1 << *(_BYTE *)(v2 + 32);
      v19 = v16 & ~v18;
      if (((*(_QWORD *)(v31 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
      {
        v20 = *(_QWORD *)(v17 + 48);
        v21 = (_QWORD *)(v20 + 16 * v19);
        v22 = *v21 == v14 && v21[1] == v15;
        if (v22 || (sub_1BC0C7234() & 1) != 0)
        {
LABEL_38:
          swift_release();
          return v14;
        }
        v23 = ~v18;
        for (i = v19 + 1; ; i = v25 + 1)
        {
          v25 = i & v23;
          if (((*(_QWORD *)(v31 + (((i & v23) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v23)) & 1) == 0)
            break;
          v26 = (_QWORD *)(v20 + 16 * v25);
          v27 = *v26 == v14 && v26[1] == v15;
          if (v27 || (sub_1BC0C7234() & 1) != 0)
            goto LABEL_38;
        }
      }
      result = swift_bridgeObjectRelease();
      v2 = v17;
    }
  }
  while (1)
  {
    v7 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v7 >= v29)
      goto LABEL_40;
    v11 = *(_QWORD *)(v28 + 8 * v7);
    ++v12;
    if (v11)
      goto LABEL_23;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1BC0C4044(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1BC0C7210();
  __break(1u);
  return result;
}

_QWORD *sub_1BC0C4134(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;

  v3 = v2;
  v37 = a2;
  v5 = sub_1BC0C6C4C();
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_20;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; v8 = sub_1BC0C71D4())
  {
    v31 = v7;
    v36 = a1 & 0xC000000000000001;
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v7 = 4;
    v34 = a1;
    v35 = v8;
    while (1)
    {
      v10 = v36 ? (id)MEMORY[0x1BCCEA8D4](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      v11 = v10;
      v12 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v39 = v9;
      v13 = a1;
      v14 = sub_1BC0C68C8();
      v15 = v37;
      swift_bridgeObjectRetain();
      v16 = sub_1BC0C3D8C(v14, v15);
      v18 = v17;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18)
      {
        v38 = v3;
        v19 = objc_msgSend(v11, sel_uniqueIdentifier);
        v20 = sub_1BC0C6EE0();
        v22 = v21;

        v9 = v39;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = sub_1BC0C39E0(0, v9[2] + 1, 1, v9);
        v24 = v9[2];
        v23 = v9[3];
        if (v24 >= v23 >> 1)
          v9 = sub_1BC0C39E0((_QWORD *)(v23 > 1), v24 + 1, 1, v9);
        v9[2] = v24 + 1;
        v25 = &v9[4 * v24];
        v25[4] = v20;
        v25[5] = v22;
        v25[6] = v16;
        v25[7] = v18;
        v3 = v38;
        a1 = v34;
      }
      else
      {
        v26 = v31;
        sub_1BC0C6C34();
        v27 = sub_1BC0C6C40();
        v28 = sub_1BC0C6FB8();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1BC0A2000, v27, v28, "HealthChecklistFeatureStatusSnapshot encountered feed item missing feature status identifier", v29, 2u);
          MEMORY[0x1BCCEAE98](v29, -1, -1);
        }

        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v26, v33);
        a1 = v13;
        v9 = v39;
      }
      ++v7;
      if (v12 == v35)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (_QWORD *)MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1BC0C441C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_1BC0C4F38();
    v3 = sub_1BC0C712C();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_1BC0C7288();
      swift_bridgeObjectRetain();
      sub_1BC0C6F04();
      result = sub_1BC0C7294();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_1BC0C7234(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_1BC0C7234();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_1BC0C45B8(uint64_t result, char a2, uint64_t *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *i;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t *v50;

  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = (_QWORD *)swift_bridgeObjectRetain();
    v8 = v6[4];
    v7 = v6[5];
    v9 = v6[6];
    v10 = v6[7];
    v49 = v6;
    v50 = a3;
    v11 = *a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = sub_1BC0B7EFC(v8, v7);
    v14 = *(_QWORD *)(v11 + 16);
    v15 = (v12 & 1) == 0;
    v16 = v14 + v15;
    if (__OFADD__(v14, v15))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v17 = v12;
    if (*(_QWORD *)(v11 + 24) >= v16)
    {
      if ((a2 & 1) == 0)
      {
        sub_1BC0B9164();
        v20 = v50;
        v21 = (_QWORD *)*v50;
        if ((v17 & 1) != 0)
        {
LABEL_8:
          swift_bridgeObjectRelease();
          v22 = (_QWORD *)(v21[7] + 16 * v13);
          swift_bridgeObjectRelease();
          v20 = v50;
          *v22 = v9;
          v22[1] = v10;
          v23 = v3 - 1;
          if (v3 != 1)
          {
LABEL_15:
            for (i = v49 + 11; ; i += 4)
            {
              v32 = *(i - 3);
              v31 = *(i - 2);
              v33 = *(i - 1);
              v34 = *i;
              v35 = *v20;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v37 = sub_1BC0B7EFC(v32, v31);
              v38 = *(_QWORD *)(v35 + 16);
              v39 = (v36 & 1) == 0;
              v40 = v38 + v39;
              if (__OFADD__(v38, v39))
                break;
              v41 = v36;
              if (*(_QWORD *)(v35 + 24) < v40)
              {
                sub_1BC0B86B8(v40, 1);
                v42 = sub_1BC0B7EFC(v32, v31);
                if ((v41 & 1) != (v43 & 1))
                  goto LABEL_27;
                v37 = v42;
              }
              v20 = v50;
              v44 = (_QWORD *)*v50;
              if ((v41 & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v30 = (_QWORD *)(v44[7] + 16 * v37);
                swift_bridgeObjectRelease();
                v20 = v50;
                *v30 = v33;
                v30[1] = v34;
              }
              else
              {
                v44[(v37 >> 6) + 8] |= 1 << v37;
                v45 = (uint64_t *)(v44[6] + 16 * v37);
                *v45 = v32;
                v45[1] = v31;
                v46 = (_QWORD *)(v44[7] + 16 * v37);
                *v46 = v33;
                v46[1] = v34;
                v47 = v44[2];
                v27 = __OFADD__(v47, 1);
                v48 = v47 + 1;
                if (v27)
                  goto LABEL_26;
                v44[2] = v48;
              }
              if (!--v23)
                return swift_bridgeObjectRelease();
            }
            goto LABEL_25;
          }
          return swift_bridgeObjectRelease();
        }
LABEL_11:
        v21[(v13 >> 6) + 8] |= 1 << v13;
        v24 = (uint64_t *)(v21[6] + 16 * v13);
        *v24 = v8;
        v24[1] = v7;
        v25 = (_QWORD *)(v21[7] + 16 * v13);
        *v25 = v9;
        v25[1] = v10;
        v26 = v21[2];
        v27 = __OFADD__(v26, 1);
        v28 = v26 + 1;
        if (v27)
        {
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        v21[2] = v28;
        v23 = v3 - 1;
        if (v3 != 1)
          goto LABEL_15;
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_1BC0B86B8(v16, a2 & 1);
      v18 = sub_1BC0B7EFC(v8, v7);
      if ((v17 & 1) != (v19 & 1))
      {
LABEL_27:
        result = sub_1BC0C7240();
        __break(1u);
        return result;
      }
      v13 = v18;
    }
    v20 = v50;
    v21 = (_QWORD *)*v50;
    if ((v17 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_1BC0C4870(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v17 = v1;
    v18 = MEMORY[0x1E0DEE9D8];
    sub_1BC0A5CFC(0, v3, 0);
    v5 = v18;
    v6 = (uint64_t *)(a1 + 56);
    do
    {
      v8 = *(v6 - 3);
      v7 = *(v6 - 2);
      v9 = *(v6 - 1);
      v10 = *v6;
      v18 = v5;
      v12 = *(_QWORD *)(v5 + 16);
      v11 = *(_QWORD *)(v5 + 24);
      v13 = v12 + 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v12 >= v11 >> 1)
      {
        sub_1BC0A5CFC(v11 > 1, v12 + 1, 1);
        v13 = v12 + 1;
        v5 = v18;
      }
      v6 += 4;
      *(_QWORD *)(v5 + 16) = v13;
      v14 = (_QWORD *)(v5 + 32 * v12);
      v14[4] = v8;
      v14[5] = v7;
      v14[6] = v9;
      v14[7] = v10;
      --v3;
    }
    while (v3);
    v2 = v17;
    goto LABEL_8;
  }
  v5 = MEMORY[0x1E0DEE9D8];
  if (*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16))
  {
LABEL_8:
    sub_1BC0C4F94(0, &qword_1ED6A81F0, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1E0DECD58]);
    v15 = sub_1BC0C71F8();
    goto LABEL_9;
  }
  v15 = MEMORY[0x1E0DEE9E0];
LABEL_9:
  v18 = v15;
  sub_1BC0C45B8(v5, 1, &v18);
  swift_bridgeObjectRelease();
  if (!v2)
    return v18;
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t *sub_1BC0C49EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v22;
  uint64_t v23;

  v23 = a7;
  v12 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x1E0C80A78](a1);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v13);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HealthChecklistFeatureStatusSnapshotManager();
  v20 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, a5);
  return sub_1BC0C3B00((uint64_t)v19, (uint64_t)v15, v20, a4, a5, a6, v23);
}

uint64_t destroy for HealthChecklistFeatureStatusFeedItemMetadata()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for HealthChecklistFeatureStatusFeedItemMetadata(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for HealthChecklistFeatureStatusFeedItemMetadata(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for HealthChecklistFeatureStatusFeedItemMetadata(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for HealthChecklistFeatureStatusFeedItemMetadata(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HealthChecklistFeatureStatusFeedItemMetadata(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HealthChecklistFeatureStatusFeedItemMetadata()
{
  return &type metadata for HealthChecklistFeatureStatusFeedItemMetadata;
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotProviding.evaluateFeatureSnapshot(date:saveUpdatedSnapshot:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))() & 1;
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotProviding.featureStatusSnapshotNewFeatureSupportedDate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotProviding.lastFeatureStatusSnapshot()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotProviding.currentFeatureStatusSnapshot()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotProviding.currentFeatureStatusSnapshotCount(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.featureStatusSnapshot()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.saveFeatureStatusSnapshot(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.featureStatusSnapshotLastUpdatedDate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.saveFeatureStatusSnapshotLastUpdatedDate(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.featureStatusSnapshotNewFeatureSupportedDate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.saveFeatureStatusSnapshotNewFeatureSupportedDate(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.featureStatusAvailabilityTransitionDate(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotStoreProviding.saveFeatureStatusAvailabilityTransitionDate(identifier:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusFeedItemProviding.featureStatusItems(featureStatusIdentifiers:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusFeedItemProviding.featureStatusItemCount(featureStatusIdentifiers:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t method lookup function for HealthChecklistFeatureStatusSnapshotManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotManager.__allocating_init(featureStatusFeedItemProvider:featureStatusSnapshotStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotManager.featureStatusSnapshotNewFeatureSupportedDate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotManager.lastFeatureStatusSnapshot()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotManager.currentFeatureStatusSnapshot()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotManager.currentFeatureStatusSnapshotCount(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of HealthChecklistFeatureStatusSnapshotManager.evaluateFeatureSnapshot(date:saveUpdatedSnapshot:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))() & 1;
}

void sub_1BC0C4EC0(uint64_t *a1@<X8>)
{
  sub_1BC0C2F44(a1);
}

void sub_1BC0C4ED8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1BC0C2E80(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1BC0C4EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;

  v5 = a4(0, a2, a3, MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return a1;
}

void sub_1BC0C4F38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED6A81E8)
  {
    v0 = sub_1BC0C7138();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED6A81E8);
  }
}

void sub_1BC0C4F94(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEA968], MEMORY[0x1E0DEA978]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1BC0C4FEC(uint64_t a1)
{
  sub_1BC0B2858(a1, &qword_1EF3EF4E8, (uint64_t (*)(uint64_t))sub_1BC0A67F8, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

uint64_t sub_1BC0C5008()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + qword_1EF3EF4F0);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1BC0C504C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + qword_1EF3EF4F0);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1BC0C5094())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id CommitTransactionOperation.__allocating_init(asUrgent:)(char a1)
{
  objc_class *v1;
  _BYTE *v3;
  objc_super v5;

  v3 = objc_allocWithZone(v1);
  v3[qword_1EF3EF4F0] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id CommitTransactionOperation.init(asUrgent:)(char a1)
{
  _BYTE *v1;
  objc_super v3;

  v1[qword_1EF3EF4F0] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for CommitTransactionOperation();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for CommitTransactionOperation()
{
  uint64_t result;

  result = qword_1EF3EF4F8;
  if (!qword_1EF3EF4F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BC0C51A0(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock[6];
  uint64_t v36;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v5 = sub_1BC0C6C4C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C34();
  v9 = v2;
  v10 = sub_1BC0C6C40();
  v11 = sub_1BC0C6FD0();
  v12 = &unk_1EF3EF000;
  if (os_log_type_enabled(v10, v11))
  {
    v13 = swift_slowAlloc();
    v33 = a1;
    v14 = v13;
    v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136446466;
    v16 = sub_1BC0C72AC();
    v34 = ObjectType;
    v36 = sub_1BC0A54E4(v16, v17, aBlock);
    v32 = v5;
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    v18 = &v9[qword_1EF3EF4F0];
    swift_beginAccess();
    if (*v18)
      v19 = 0x6E65677275207361;
    else
      v19 = 0;
    if (*v18)
      v20 = 0xE900000000000074;
    else
      v20 = 0xE000000000000000;
    v36 = sub_1BC0A54E4(v19, v20, aBlock);
    sub_1BC0C709C();

    ObjectType = v34;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v10, v11, "%{public}s: Attempting to commit transaction %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    v21 = v15;
    v12 = (_QWORD *)&unk_1EF3EF000;
    MEMORY[0x1BCCEAE98](v21, -1, -1);
    MEMORY[0x1BCCEAE98](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v9;
  *(_QWORD *)(v22 + 24) = ObjectType;
  v23 = v9;
  v24 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0C64E0, v22);
  swift_release();
  v25 = &v23[v12[158]];
  swift_beginAccess();
  v26 = *v25;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v23;
  *(_QWORD *)(v27 + 24) = ObjectType;
  aBlock[4] = (uint64_t)sub_1BC0C64E8;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0ADF64;
  aBlock[3] = (uint64_t)&block_descriptor_7;
  v28 = _Block_copy(aBlock);
  v29 = v23;
  swift_release();
  objc_msgSend(v24, sel_commitSharedSummaryTransactionAsUrgent_completion_, v26, v28);
  _Block_release(v28);
  return swift_unknownObjectRelease();
}

uint64_t sub_1BC0C5500(void *a1, void *a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t aBlock[6];

  v43 = a3;
  v46 = a2;
  v4 = sub_1BC0C6E44();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BC0C6E68();
  v48 = *(_QWORD *)(v8 - 8);
  v49 = v8;
  MEMORY[0x1E0C80A78](v8);
  v47 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BC0C6E50();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BC0C6C4C();
  v44 = *(_QWORD *)(v14 - 8);
  v45 = v14;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BC0C6C34();
  v17 = a1;
  v18 = a1;
  v19 = sub_1BC0C6C40();
  v20 = sub_1BC0C6FB8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v41 = v5;
    v22 = v21;
    v23 = swift_slowAlloc();
    v40 = v10;
    v24 = v23;
    aBlock[0] = v23;
    *(_DWORD *)v22 = 136446466;
    v42 = v4;
    v25 = sub_1BC0C72AC();
    v43 = v7;
    v50 = sub_1BC0A54E4(v25, v26, aBlock);
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v50 = (uint64_t)a1;
    v27 = a1;
    sub_1BC0B04A0();
    v28 = sub_1BC0C6EEC();
    v50 = sub_1BC0A54E4(v28, v29, aBlock);
    v4 = v42;
    sub_1BC0C709C();
    v7 = v43;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BC0A2000, v19, v20, "%{public}s: Failed to commit transaction. Error: %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    v30 = v24;
    v10 = v40;
    MEMORY[0x1BCCEAE98](v30, -1, -1);
    v31 = v22;
    v5 = v41;
    MEMORY[0x1BCCEAE98](v31, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v45);
  sub_1BC0A6D64();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E0DEF540], v10);
  v32 = (void *)sub_1BC0C7060();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v33 = swift_allocObject();
  v34 = v46;
  *(_QWORD *)(v33 + 16) = v46;
  aBlock[4] = (uint64_t)sub_1BC0B6420;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0BFFB0;
  aBlock[3] = (uint64_t)&block_descriptor_12_0;
  v35 = _Block_copy(aBlock);
  v36 = v34;
  v37 = v47;
  sub_1BC0C6E5C();
  v50 = MEMORY[0x1E0DEE9D8];
  sub_1BC0B2A9C(&qword_1ED6A8540, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1BC0B6440();
  sub_1BC0B2A9C(&qword_1ED6A8548, (uint64_t (*)(uint64_t))sub_1BC0B6440, MEMORY[0x1E0DEAF38]);
  sub_1BC0C70C0();
  MEMORY[0x1BCCEA7C0](0, v37, v7, v35);
  _Block_release(v35);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v37, v49);
  return swift_release();
}

uint64_t sub_1BC0C595C(char a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[3];
  uint64_t v44;

  v6 = sub_1BC0C6C4C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v39 - v11;
  if (!a2)
  {
    sub_1BC0C6C34();
    v25 = a3;
    v26 = sub_1BC0C6C40();
    v27 = sub_1BC0C6FD0();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v44 = v39;
      *(_DWORD *)v28 = 136446722;
      v40 = a3;
      v29 = sub_1BC0C72AC();
      v43[0] = sub_1BC0A54E4(v29, v30, &v44);
      sub_1BC0C709C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2082;
      v31 = &v25[qword_1EF3EF4F0];
      swift_beginAccess();
      if (*v31)
        v32 = 0x6E65677275207361;
      else
        v32 = 0;
      if (*v31)
        v33 = 0xE900000000000074;
      else
        v33 = 0xE000000000000000;
      v34 = sub_1BC0A54E4(v32, v33, &v44);
      v41 = v7;
      v42 = v34;
      sub_1BC0C709C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 22) = 1026;
      LODWORD(v42) = a1 & 1;
      sub_1BC0C709C();
      _os_log_impl(&dword_1BC0A2000, v26, v27, "%{public}s: Committed transaction %{public}s. Success: %{BOOL,public}d", (uint8_t *)v28, 0x1Cu);
      v35 = v39;
      swift_arrayDestroy();
      MEMORY[0x1BCCEAE98](v35, -1, -1);
      MEMORY[0x1BCCEAE98](v28, -1, -1);

      v36 = *(void (**)(char *, uint64_t))(v41 + 8);
    }
    else
    {

      v36 = *(void (**)(char *, uint64_t))(v7 + 8);
    }
    v37 = v12;
    goto LABEL_15;
  }
  v13 = a2;
  sub_1BC0C6C34();
  v14 = a2;
  v15 = a2;
  v16 = sub_1BC0C6C40();
  v17 = sub_1BC0C6FB8();
  if (!os_log_type_enabled(v16, v17))
  {

    v36 = *(void (**)(char *, uint64_t))(v7 + 8);
    v37 = v10;
LABEL_15:
    v36(v37, v6);
    return sub_1BC0C6970();
  }
  v18 = swift_slowAlloc();
  v19 = swift_slowAlloc();
  v43[0] = v19;
  *(_DWORD *)v18 = 136446466;
  v41 = v7;
  v20 = sub_1BC0C72AC();
  v44 = sub_1BC0A54E4(v20, v21, v43);
  sub_1BC0C709C();
  swift_bridgeObjectRelease();
  *(_WORD *)(v18 + 12) = 2082;
  v44 = (uint64_t)a2;
  v22 = a2;
  sub_1BC0B04A0();
  v40 = (void *)v6;
  v23 = sub_1BC0C6EF8();
  v44 = sub_1BC0A54E4(v23, v24, v43);
  sub_1BC0C709C();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_1BC0A2000, v16, v17, "%{public}s: Failed to commit transaction. Error: %{public}s", (uint8_t *)v18, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x1BCCEAE98](v19, -1, -1);
  MEMORY[0x1BCCEAE98](v18, -1, -1);

  (*(void (**)(char *, void *))(v41 + 8))(v10, v40);
  return sub_1BC0C6970();
}

id CommitTransactionOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CommitTransactionOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1BC0C5E0C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CommitTransactionOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CommitTransactionOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CommitTransactionOperation.createFuture()()
{
  void *v0;
  uint64_t ObjectType;
  uint64_t v2;
  id v3;

  ObjectType = swift_getObjectType();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = ObjectType;
  sub_1BC0C6298();
  swift_allocObject();
  v3 = v0;
  return sub_1BC0C6D60();
}

uint64_t sub_1BC0C5EE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t aBlock[6];
  uint64_t v33;

  v6 = sub_1BC0C6C4C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  swift_retain();
  sub_1BC0C6C34();
  v11 = a3;
  v12 = sub_1BC0C6C40();
  v13 = sub_1BC0C6FD0();
  v14 = &unk_1EF3EF000;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v31 = v7;
    v17 = v16;
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136446466;
    v18 = sub_1BC0C72AC();
    v33 = sub_1BC0A54E4(v18, v19, aBlock);
    v30 = v6;
    sub_1BC0C709C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    v20 = &v11[qword_1EF3EF4F0];
    swift_beginAccess();
    if (*v20)
      v21 = 0x6E65677275207361;
    else
      v21 = 0;
    if (*v20)
      v22 = 0xE900000000000074;
    else
      v22 = 0xE000000000000000;
    v33 = sub_1BC0A54E4(v21, v22, aBlock);
    v14 = (_QWORD *)&unk_1EF3EF000;
    sub_1BC0C709C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BC0A2000, v12, v13, "%{public}s: Attempting to commit transaction %{public}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BCCEAE98](v17, -1, -1);
    MEMORY[0x1BCCEAE98](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_1BC0C0BA4();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_1BC0C6540;
  *(_QWORD *)(v23 + 24) = v10;
  swift_retain();
  v24 = (void *)sub_1BC0BB1AC((uint64_t)sub_1BC0C654C, v23);
  swift_release();
  swift_release();
  v25 = &v11[v14[158]];
  swift_beginAccess();
  v26 = *v25;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = sub_1BC0C6540;
  *(_QWORD *)(v27 + 24) = v10;
  aBlock[4] = (uint64_t)sub_1BC0C6570;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BC0ADF64;
  aBlock[3] = (uint64_t)&block_descriptor_24;
  v28 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v24, sel_commitSharedSummaryTransactionAsUrgent_completion_, v26, v28);
  _Block_release(v28);
  return swift_unknownObjectRelease();
}

uint64_t sub_1BC0C626C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0C6290(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1BC0C5EE4(a1, a2, *(void **)(v2 + 16));
}

void sub_1BC0C6298()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF3EF280)
  {
    sub_1BC0B04A0();
    v0 = sub_1BC0C6D54();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF3EF280);
  }
}

uint64_t sub_1BC0C62FC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + qword_1EF3EF4F0);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1BC0C634C(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + qword_1EF3EF4F0);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_1BC0C6398()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for CommitTransactionOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CommitTransactionOperation.commitAsUrgent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CommitTransactionOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 8))();
}

uint64_t dispatch thunk of CommitTransactionOperation.commitAsUrgent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CommitTransactionOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 16))();
}

uint64_t dispatch thunk of CommitTransactionOperation.commitAsUrgent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CommitTransactionOperation
                              + (*MEMORY[0x1E0DEEDD8] & *v0)
                              + 24))();
}

uint64_t dispatch thunk of CommitTransactionOperation.__allocating_init(asUrgent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for CommitTransactionOperation + v0 + 32))();
}

uint64_t sub_1BC0C6478()
{
  return type metadata accessor for CommitTransactionOperation();
}

void sub_1BC0C6480(char a1, id a2, void (*a3)(id, uint64_t))
{
  id v5;

  if (a2)
  {
    v5 = a2;
    a3(a2, 1);

  }
  else
  {
    ((void (*)(_QWORD))a3)(a1 & 1);
  }
}

uint64_t sub_1BC0C64E0(void *a1)
{
  uint64_t v1;

  return sub_1BC0C5500(a1, *(void **)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_1BC0C64E8(char a1, void *a2)
{
  uint64_t v2;

  return sub_1BC0C595C(a1, a2, *(void **)(v2 + 16));
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_1BC0C64F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1BC0C651C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BC0C6540(uint64_t a1, char a2)
{
  uint64_t v2;

  return sub_1BC0ADA74(a1, a2 & 1, *(uint64_t (**)(uint64_t *))(v2 + 16));
}

uint64_t sub_1BC0C654C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(a1, 1);
}

void sub_1BC0C6570(char a1, void *a2)
{
  uint64_t v2;

  sub_1BC0C6480(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t sub_1BC0C6598()
{
  return MEMORY[0x1E0D289E8]();
}

uint64_t sub_1BC0C65A4()
{
  return MEMORY[0x1E0D289F0]();
}

uint64_t sub_1BC0C65B0()
{
  return MEMORY[0x1E0D289F8]();
}

uint64_t sub_1BC0C65BC()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1BC0C65C8()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1BC0C65D4()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1BC0C65E0()
{
  return MEMORY[0x1E0CAE550]();
}

uint64_t sub_1BC0C65EC()
{
  return MEMORY[0x1E0D29970]();
}

uint64_t sub_1BC0C65F8()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_1BC0C6604()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1BC0C6610()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BC0C661C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BC0C6628()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1BC0C6634()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BC0C6640()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BC0C664C()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1BC0C6658()
{
  return MEMORY[0x1E0D29980]();
}

uint64_t sub_1BC0C6664()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1BC0C6670()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1BC0C667C()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1BC0C6688()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1BC0C6694()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1BC0C66A0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1BC0C66AC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1BC0C66B8()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1BC0C66C4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1BC0C66D0()
{
  return MEMORY[0x1E0D2D2B0]();
}

uint64_t sub_1BC0C66DC()
{
  return MEMORY[0x1E0D2D2C0]();
}

uint64_t sub_1BC0C66E8()
{
  return MEMORY[0x1E0D2D2D0]();
}

uint64_t sub_1BC0C66F4()
{
  return MEMORY[0x1E0D2D390]();
}

uint64_t sub_1BC0C6700()
{
  return MEMORY[0x1E0D2D3A8]();
}

uint64_t sub_1BC0C670C()
{
  return MEMORY[0x1E0D2D3D8]();
}

uint64_t sub_1BC0C6718()
{
  return MEMORY[0x1E0D2D468]();
}

uint64_t sub_1BC0C6724()
{
  return MEMORY[0x1E0D2D488]();
}

uint64_t sub_1BC0C6730()
{
  return MEMORY[0x1E0D2D490]();
}

uint64_t sub_1BC0C673C()
{
  return MEMORY[0x1E0D2D498]();
}

uint64_t sub_1BC0C6748()
{
  return MEMORY[0x1E0D2D4A0]();
}

uint64_t sub_1BC0C6754()
{
  return MEMORY[0x1E0D2D4A8]();
}

uint64_t sub_1BC0C6760()
{
  return MEMORY[0x1E0D2D628]();
}

uint64_t sub_1BC0C676C()
{
  return MEMORY[0x1E0D2D630]();
}

uint64_t sub_1BC0C6778()
{
  return MEMORY[0x1E0D2D638]();
}

uint64_t sub_1BC0C6784()
{
  return MEMORY[0x1E0D2D640]();
}

uint64_t sub_1BC0C6790()
{
  return MEMORY[0x1E0D2D650]();
}

uint64_t sub_1BC0C679C()
{
  return MEMORY[0x1E0D2D6B8]();
}

uint64_t sub_1BC0C67A8()
{
  return MEMORY[0x1E0D2D6C8]();
}

uint64_t sub_1BC0C67B4()
{
  return MEMORY[0x1E0D2D6E0]();
}

uint64_t sub_1BC0C67C0()
{
  return MEMORY[0x1E0D2D6F0]();
}

uint64_t sub_1BC0C67CC()
{
  return MEMORY[0x1E0D2D9C0]();
}

uint64_t sub_1BC0C67D8()
{
  return MEMORY[0x1E0D2DA20]();
}

uint64_t sub_1BC0C67E4()
{
  return MEMORY[0x1E0D2DA30]();
}

uint64_t sub_1BC0C67F0()
{
  return MEMORY[0x1E0D2DC00]();
}

uint64_t sub_1BC0C67FC()
{
  return MEMORY[0x1E0D2DC08]();
}

uint64_t sub_1BC0C6808()
{
  return MEMORY[0x1E0D2DC10]();
}

uint64_t sub_1BC0C6814()
{
  return MEMORY[0x1E0D2DC18]();
}

uint64_t sub_1BC0C6820()
{
  return MEMORY[0x1E0D2E150]();
}

uint64_t sub_1BC0C682C()
{
  return MEMORY[0x1E0D2E1F0]();
}

uint64_t sub_1BC0C6838()
{
  return MEMORY[0x1E0D2E240]();
}

uint64_t sub_1BC0C6844()
{
  return MEMORY[0x1E0D2E258]();
}

uint64_t sub_1BC0C6850()
{
  return MEMORY[0x1E0D2E3B0]();
}

uint64_t sub_1BC0C685C()
{
  return MEMORY[0x1E0D2E3B8]();
}

uint64_t sub_1BC0C6868()
{
  return MEMORY[0x1E0D2E470]();
}

uint64_t sub_1BC0C6874()
{
  return MEMORY[0x1E0D2E558]();
}

uint64_t sub_1BC0C6880()
{
  return MEMORY[0x1E0D2E9E8]();
}

uint64_t sub_1BC0C688C()
{
  return MEMORY[0x1E0D2E668]();
}

uint64_t sub_1BC0C6898()
{
  return MEMORY[0x1E0D2E670]();
}

uint64_t sub_1BC0C68A4()
{
  return MEMORY[0x1E0D2E6A0]();
}

uint64_t sub_1BC0C68B0()
{
  return MEMORY[0x1E0D2E6A8]();
}

uint64_t sub_1BC0C68BC()
{
  return MEMORY[0x1E0D2E6B0]();
}

uint64_t sub_1BC0C68C8()
{
  return MEMORY[0x1E0D2E6D0]();
}

uint64_t sub_1BC0C68D4()
{
  return MEMORY[0x1E0D2E718]();
}

uint64_t sub_1BC0C68E0()
{
  return MEMORY[0x1E0D29CB0]();
}

uint64_t sub_1BC0C68EC()
{
  return MEMORY[0x1E0D29CB8]();
}

uint64_t sub_1BC0C68F8()
{
  return MEMORY[0x1E0D29CC0]();
}

uint64_t sub_1BC0C6904()
{
  return MEMORY[0x1E0D29D40]();
}

uint64_t sub_1BC0C6910()
{
  return MEMORY[0x1E0D29D60]();
}

uint64_t sub_1BC0C691C()
{
  return MEMORY[0x1E0D29D68]();
}

uint64_t sub_1BC0C6928()
{
  return MEMORY[0x1E0D29D88]();
}

uint64_t sub_1BC0C6934()
{
  return MEMORY[0x1E0D29D98]();
}

uint64_t sub_1BC0C6940()
{
  return MEMORY[0x1E0D29DA0]();
}

uint64_t sub_1BC0C694C()
{
  return MEMORY[0x1E0D29EA0]();
}

uint64_t sub_1BC0C6958()
{
  return MEMORY[0x1E0D29EE0]();
}

uint64_t sub_1BC0C6964()
{
  return MEMORY[0x1E0D29EF8]();
}

uint64_t sub_1BC0C6970()
{
  return MEMORY[0x1E0D29F00]();
}

uint64_t sub_1BC0C697C()
{
  return MEMORY[0x1E0D29F10]();
}

uint64_t sub_1BC0C6988()
{
  return MEMORY[0x1E0D29F18]();
}

uint64_t sub_1BC0C6994()
{
  return MEMORY[0x1E0D2A090]();
}

uint64_t sub_1BC0C69A0()
{
  return MEMORY[0x1E0D2A0A8]();
}

uint64_t sub_1BC0C69AC()
{
  return MEMORY[0x1E0D2A0D8]();
}

uint64_t sub_1BC0C69B8()
{
  return MEMORY[0x1E0D2A168]();
}

uint64_t sub_1BC0C69C4()
{
  return MEMORY[0x1E0D2A178]();
}

uint64_t sub_1BC0C69D0()
{
  return MEMORY[0x1E0D2A1A0]();
}

uint64_t sub_1BC0C69DC()
{
  return MEMORY[0x1E0D2A1A8]();
}

uint64_t sub_1BC0C69E8()
{
  return MEMORY[0x1E0D2A1B8]();
}

uint64_t sub_1BC0C69F4()
{
  return MEMORY[0x1E0D2A278]();
}

uint64_t sub_1BC0C6A00()
{
  return MEMORY[0x1E0D2A2C0]();
}

uint64_t sub_1BC0C6A0C()
{
  return MEMORY[0x1E0D2A538]();
}

uint64_t sub_1BC0C6A18()
{
  return MEMORY[0x1E0D2A548]();
}

uint64_t sub_1BC0C6A24()
{
  return MEMORY[0x1E0D2A558]();
}

uint64_t sub_1BC0C6A30()
{
  return MEMORY[0x1E0D2A560]();
}

uint64_t sub_1BC0C6A3C()
{
  return MEMORY[0x1E0D2A580]();
}

uint64_t sub_1BC0C6A48()
{
  return MEMORY[0x1E0D2A588]();
}

uint64_t sub_1BC0C6A54()
{
  return MEMORY[0x1E0D28A98]();
}

uint64_t sub_1BC0C6A60()
{
  return MEMORY[0x1E0D28AA0]();
}

uint64_t sub_1BC0C6A6C()
{
  return MEMORY[0x1E0D28AA8]();
}

uint64_t sub_1BC0C6A78()
{
  return MEMORY[0x1E0D2EA18]();
}

uint64_t sub_1BC0C6A84()
{
  return MEMORY[0x1E0D2EA30]();
}

uint64_t sub_1BC0C6A90()
{
  return MEMORY[0x1E0D2EA80]();
}

uint64_t sub_1BC0C6A9C()
{
  return MEMORY[0x1E0D2EA90]();
}

uint64_t sub_1BC0C6AA8()
{
  return MEMORY[0x1E0D2EAA8]();
}

uint64_t sub_1BC0C6AB4()
{
  return MEMORY[0x1E0D2EAB8]();
}

uint64_t sub_1BC0C6AC0()
{
  return MEMORY[0x1E0D2EB28]();
}

uint64_t sub_1BC0C6ACC()
{
  return MEMORY[0x1E0D2EB88]();
}

uint64_t sub_1BC0C6AD8()
{
  return MEMORY[0x1E0D2EC40]();
}

uint64_t sub_1BC0C6AE4()
{
  return MEMORY[0x1E0D2EC48]();
}

uint64_t sub_1BC0C6AF0()
{
  return MEMORY[0x1E0D2EC50]();
}

uint64_t sub_1BC0C6AFC()
{
  return MEMORY[0x1E0D2EC58]();
}

uint64_t sub_1BC0C6B08()
{
  return MEMORY[0x1E0D2EC60]();
}

uint64_t sub_1BC0C6B14()
{
  return MEMORY[0x1E0D2EC70]();
}

uint64_t sub_1BC0C6B20()
{
  return MEMORY[0x1E0D2EC78]();
}

uint64_t sub_1BC0C6B2C()
{
  return MEMORY[0x1E0D2EC80]();
}

uint64_t sub_1BC0C6B38()
{
  return MEMORY[0x1E0D2EC88]();
}

uint64_t sub_1BC0C6B44()
{
  return MEMORY[0x1E0D2EC98]();
}

uint64_t sub_1BC0C6B50()
{
  return MEMORY[0x1E0D2ECA0]();
}

uint64_t sub_1BC0C6B5C()
{
  return MEMORY[0x1E0D2ECA8]();
}

uint64_t sub_1BC0C6B68()
{
  return MEMORY[0x1E0D2ECB0]();
}

uint64_t sub_1BC0C6B74()
{
  return MEMORY[0x1E0D2ECB8]();
}

uint64_t sub_1BC0C6B80()
{
  return MEMORY[0x1E0D2ECC0]();
}

uint64_t sub_1BC0C6B8C()
{
  return MEMORY[0x1E0D2ECE0]();
}

uint64_t sub_1BC0C6B98()
{
  return MEMORY[0x1E0D2ECE8]();
}

uint64_t sub_1BC0C6BA4()
{
  return MEMORY[0x1E0D2ECF0]();
}

uint64_t sub_1BC0C6BB0()
{
  return MEMORY[0x1E0D2ECF8]();
}

uint64_t sub_1BC0C6BBC()
{
  return MEMORY[0x1E0D2ED00]();
}

uint64_t sub_1BC0C6BC8()
{
  return MEMORY[0x1E0D2ED10]();
}

uint64_t sub_1BC0C6BD4()
{
  return MEMORY[0x1E0D2ED20]();
}

uint64_t sub_1BC0C6BE0()
{
  return MEMORY[0x1E0D2ED28]();
}

uint64_t sub_1BC0C6BEC()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1BC0C6BF8()
{
  return MEMORY[0x1E0D2E748]();
}

uint64_t sub_1BC0C6C04()
{
  return MEMORY[0x1E0D2E770]();
}

uint64_t sub_1BC0C6C10()
{
  return MEMORY[0x1E0D2E778]();
}

uint64_t sub_1BC0C6C1C()
{
  return MEMORY[0x1E0D2E780]();
}

uint64_t sub_1BC0C6C28()
{
  return MEMORY[0x1E0D2E7A0]();
}

uint64_t sub_1BC0C6C34()
{
  return MEMORY[0x1E0D2E7B8]();
}

uint64_t sub_1BC0C6C40()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BC0C6C4C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BC0C6C58()
{
  return MEMORY[0x1E0C957C8]();
}

uint64_t sub_1BC0C6C64()
{
  return MEMORY[0x1E0D2E7F0]();
}

uint64_t sub_1BC0C6C70()
{
  return MEMORY[0x1E0C95840]();
}

uint64_t sub_1BC0C6C7C()
{
  return MEMORY[0x1E0D2A5B8]();
}

uint64_t sub_1BC0C6C88()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1BC0C6C94()
{
  return MEMORY[0x1E0C959E8]();
}

uint64_t sub_1BC0C6CA0()
{
  return MEMORY[0x1E0C95A28]();
}

uint64_t sub_1BC0C6CAC()
{
  return MEMORY[0x1E0C95B68]();
}

uint64_t sub_1BC0C6CB8()
{
  return MEMORY[0x1E0C95B80]();
}

uint64_t sub_1BC0C6CC4()
{
  return MEMORY[0x1E0C95BB8]();
}

uint64_t sub_1BC0C6CD0()
{
  return MEMORY[0x1E0C95C70]();
}

uint64_t sub_1BC0C6CDC()
{
  return MEMORY[0x1E0D2A5D8]();
}

uint64_t sub_1BC0C6CE8()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t sub_1BC0C6CF4()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1BC0C6D00()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1BC0C6D0C()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t sub_1BC0C6D18()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t sub_1BC0C6D24()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1BC0C6D30()
{
  return MEMORY[0x1E0C96078]();
}

uint64_t sub_1BC0C6D3C()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1BC0C6D48()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1BC0C6D54()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1BC0C6D60()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1BC0C6D6C()
{
  return MEMORY[0x1E0D2A5E0]();
}

uint64_t sub_1BC0C6D78()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1BC0C6D84()
{
  return MEMORY[0x1E0C961E0]();
}

uint64_t sub_1BC0C6D90()
{
  return MEMORY[0x1E0C961E8]();
}

uint64_t sub_1BC0C6D9C()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1BC0C6DA8()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1BC0C6DB4()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t sub_1BC0C6DC0()
{
  return MEMORY[0x1E0C962B8]();
}

uint64_t sub_1BC0C6DCC()
{
  return MEMORY[0x1E0C962F8]();
}

uint64_t sub_1BC0C6DD8()
{
  return MEMORY[0x1E0C96338]();
}

uint64_t sub_1BC0C6DE4()
{
  return MEMORY[0x1E0C96350]();
}

uint64_t sub_1BC0C6DF0()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t sub_1BC0C6DFC()
{
  return MEMORY[0x1E0C96380]();
}

uint64_t sub_1BC0C6E08()
{
  return MEMORY[0x1E0C96390]();
}

uint64_t sub_1BC0C6E14()
{
  return MEMORY[0x1E0C96400]();
}

uint64_t sub_1BC0C6E20()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1BC0C6E2C()
{
  return MEMORY[0x1E0C96438]();
}

uint64_t sub_1BC0C6E38()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1BC0C6E44()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BC0C6E50()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1BC0C6E5C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BC0C6E68()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BC0C6E74()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BC0C6E80()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1BC0C6E8C()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BC0C6E98()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1BC0C6EA4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1BC0C6EB0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1BC0C6EBC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BC0C6EC8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BC0C6ED4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BC0C6EE0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BC0C6EEC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BC0C6EF8()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1BC0C6F04()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BC0C6F10()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BC0C6F1C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BC0C6F28()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BC0C6F34()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BC0C6F40()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BC0C6F4C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1BC0C6F58()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BC0C6F64()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BC0C6F70()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BC0C6F7C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1BC0C6F88()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1BC0C6F94()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1BC0C6FA0()
{
  return MEMORY[0x1E0D2E8F0]();
}

uint64_t sub_1BC0C6FAC()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BC0C6FB8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BC0C6FC4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1BC0C6FD0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BC0C6FDC()
{
  return MEMORY[0x1E0D2E8F8]();
}

uint64_t sub_1BC0C6FE8()
{
  return MEMORY[0x1E0CB4560]();
}

uint64_t sub_1BC0C6FF4()
{
  return MEMORY[0x1E0CB4588]();
}

uint64_t sub_1BC0C7000()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1BC0C700C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BC0C7018()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1BC0C7024()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1BC0C7030()
{
  return MEMORY[0x1E0DEF8C0]();
}

uint64_t sub_1BC0C703C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BC0C7048()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BC0C7054()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BC0C7060()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1BC0C706C()
{
  return MEMORY[0x1E0C977B8]();
}

uint64_t sub_1BC0C7078()
{
  return MEMORY[0x1E0C977D0]();
}

uint64_t sub_1BC0C7084()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1BC0C7090()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BC0C709C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BC0C70A8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BC0C70B4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BC0C70C0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BC0C70CC()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BC0C70D8()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1BC0C70E4()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1BC0C70F0()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1BC0C70FC()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1BC0C7108()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1BC0C7114()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1BC0C7120()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1BC0C712C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1BC0C7138()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1BC0C7144()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BC0C7150()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BC0C715C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BC0C7168()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BC0C7174()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1BC0C7180()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1BC0C718C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1BC0C7198()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1BC0C71A4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1BC0C71B0()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BC0C71BC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BC0C71C8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BC0C71D4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BC0C71E0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BC0C71EC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BC0C71F8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BC0C7204()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BC0C7210()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BC0C721C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BC0C7228()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BC0C7234()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BC0C7240()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BC0C724C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1BC0C7258()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BC0C7264()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BC0C7270()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BC0C727C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BC0C7288()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BC0C7294()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1BC0C72A0()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1BC0C72AC()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t HKLogAnalytics()
{
  return MEMORY[0x1E0CB5270]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1E0DEED68]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
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

