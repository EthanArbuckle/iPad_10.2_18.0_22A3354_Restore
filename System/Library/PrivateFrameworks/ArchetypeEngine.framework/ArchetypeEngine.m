uint64_t ATBiomeMediaType.description.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236A4D4F0 + 4 * byte_236A6E730[a1]))(1735290739, 0xE400000000000000);
}

uint64_t sub_236A4D4F0()
{
  return 0x74736163646F70;
}

uint64_t sub_236A4D508()
{
  return 0x6F6F626F69647561;
}

unint64_t sub_236A4D524()
{
  return 0xD000000000000010;
}

uint64_t sub_236A4D540()
{
  return 0x6E776F6E6B6E75;
}

BOOL static ATBiomeMediaType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t ATBiomeMediaType.hash(into:)()
{
  return sub_236A6E174();
}

uint64_t ATBiomeMediaType.hashValue.getter()
{
  sub_236A6E168();
  sub_236A6E174();
  return sub_236A6E18C();
}

BOOL sub_236A4D5D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_236A4D5E4()
{
  sub_236A6E168();
  sub_236A6E174();
  return sub_236A6E18C();
}

uint64_t sub_236A4D628()
{
  return sub_236A6E174();
}

uint64_t sub_236A4D650()
{
  sub_236A6E168();
  sub_236A6E174();
  return sub_236A6E18C();
}

uint64_t sub_236A4D690()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_236A4D6B8 + 4 * byte_236A6E735[*v0]))(1735290739, 0xE400000000000000);
}

uint64_t sub_236A4D6B8()
{
  return 0x74736163646F70;
}

uint64_t sub_236A4D6D0()
{
  return 0x6F6F626F69647561;
}

unint64_t sub_236A4D6EC()
{
  return 0xD000000000000010;
}

uint64_t sub_236A4D708()
{
  return 0x6E776F6E6B6E75;
}

uint64_t ATBiomeMediaItem.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.artist.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.album.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.iTunesStoreIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t variable initialization expression of ATBiomeMediaItem.link()
{
  return 0;
}

uint64_t ATBiomeMediaItem.link.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.link.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*ATBiomeMediaItem.link.modify())()
{
  return nullsub_1;
}

uint64_t ATBiomeMediaItem.bundleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.mediaType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 96);
}

void ATBiomeMediaItem.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_236A4D8BC()
{
  uint64_t v0;

  sub_236A6DFDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  if (!*(_QWORD *)(v0 + 8))
  {
    __break(1u);
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  if (!*(_QWORD *)(v0 + 24))
  {
LABEL_5:
    __break(1u);
    JUMPOUT(0x236A4DD10);
  }
  swift_bridgeObjectRetain();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  return 0x2820676E6F735BLL;
}

uint64_t sub_236A4DD34()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[41] = v0;
  v2 = sub_236A6DDF0();
  v1[42] = v2;
  v1[43] = *(_QWORD *)(v2 - 8);
  v1[44] = swift_task_alloc();
  return swift_task_switch();
}

id sub_236A4DD94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  id result;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v1 + 56);
  if (!v2)
    goto LABEL_5;
  v3 = *(_QWORD *)(v1 + 48);
  v4 = *(unsigned __int8 *)(v1 + 96);
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = 301;
      goto LABEL_7;
    }
LABEL_5:
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = 203;
LABEL_7:
  v7 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  result = objc_msgSend(v7, sel_createBagForSubProfile);
  if (result)
  {
    v8 = result;
    v9 = objc_allocWithZone(MEMORY[0x24BE08238]);
    v10 = (void *)sub_236A6DE2C();
    v11 = (void *)sub_236A6DE2C();
    v12 = objc_msgSend(v9, sel_initWithType_clientIdentifier_clientVersion_bag_, v5, v10, v11, v8);
    *(_QWORD *)(v0 + 360) = v12;

    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_236A6E990;
    *(_QWORD *)(v13 + 32) = v3;
    *(_QWORD *)(v13 + 40) = v2;
    v14 = (void *)sub_236A6DE98();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setItemIdentifiers_, v14);

    v15 = objc_msgSend(v12, sel_perform);
    *(_QWORD *)(v0 + 368) = v15;
    *(_QWORD *)(v0 + 56) = v0 + 320;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_236A4DFC4;
    v16 = swift_continuation_init();
    *(_QWORD *)(v0 + 120) = MEMORY[0x24BDAC760];
    v17 = (_QWORD *)(v0 + 120);
    v17[1] = 0x40000000;
    v17[2] = sub_236A4E398;
    v17[3] = &block_descriptor_8;
    v17[4] = v16;
    objc_msgSend(v15, sel_resultWithCompletion_, v17);
    return (id)swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_236A4DFC4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 376) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

void sub_236A4E024()
{
  uint64_t v0;
  _OWORD *v1;
  _OWORD *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  v1 = (_OWORD *)(v0 + 200);
  v2 = (_OWORD *)(v0 + 232);
  v3 = *(void **)(v0 + 320);

  v4 = objc_msgSend(v3, sel_responseDataItems);
  if (!v4)
  {
    *v2 = 0u;
    *(_OWORD *)(v0 + 248) = 0u;
    goto LABEL_13;
  }
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433310);
  v6 = sub_236A6DEA4();

  if (*(_QWORD *)(v6 + 16))
  {
    v7 = *(_QWORD *)(v6 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 264) = 0x7475626972747461;
    *(_QWORD *)(v0 + 272) = 0xEA00000000007365;
    sub_236A6DFB8();
    if (*(_QWORD *)(v7 + 16) && (v8 = sub_236A51398(v0 + 80), (v9 & 1) != 0))
    {
      sub_236A550F0(*(_QWORD *)(v7 + 56) + 32 * v8, v0 + 232);
    }
    else
    {
      *v2 = 0u;
      *(_OWORD *)(v0 + 248) = 0u;
    }
    swift_bridgeObjectRelease();
    sub_236A550BC(v0 + 80);
    if (*(_QWORD *)(v0 + 256))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v10 = *(_QWORD *)(v0 + 312);
        *(_QWORD *)(v0 + 296) = 7107189;
        *(_QWORD *)(v0 + 304) = 0xE300000000000000;
        sub_236A6DFB8();
        if (*(_QWORD *)(v10 + 16) && (v11 = sub_236A51398(v0 + 160), (v12 & 1) != 0))
        {
          sub_236A550F0(*(_QWORD *)(v10 + 56) + 32 * v11, v0 + 200);
        }
        else
        {
          *v1 = 0u;
          *(_OWORD *)(v0 + 216) = 0u;
        }

        swift_bridgeObjectRelease();
        sub_236A550BC(v0 + 160);
        if (*(_QWORD *)(v0 + 224))
        {
          v18 = swift_dynamicCast();
          if (v18)
            v15 = *(_QWORD *)(v0 + 280);
          else
            v15 = 0;
          if (v18)
            v16 = *(_QWORD *)(v0 + 288);
          else
            v16 = 0;
          goto LABEL_17;
        }
LABEL_16:
        sub_236A55170(v0 + 200, &qword_256433308);
        v15 = 0;
        v16 = 0;
LABEL_17:
        v17 = *(_QWORD *)(v0 + 328);
        swift_bridgeObjectRelease();
        *(_QWORD *)(v17 + 64) = v15;
        *(_QWORD *)(v17 + 72) = v16;
        swift_task_dealloc();
        (*(void (**)(void))(v0 + 8))();
        return;
      }
      v14 = *(void **)(v0 + 360);

LABEL_15:
      *v1 = 0u;
      *(_OWORD *)(v0 + 216) = 0u;
      goto LABEL_16;
    }
LABEL_13:
    v13 = *(void **)(v0 + 360);

    sub_236A55170(v0 + 232, &qword_256433308);
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_236A4E2AC()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 368);
  swift_willThrow();

  sub_236A6DDE4();
  v2 = sub_236A6DDD8();
  v3 = sub_236A6DF1C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_236A4B000, v2, v3, "Failed to query the media server for the link.", v4, 2u);
    MEMORY[0x23B7FA5E0](v4, -1, -1);
  }
  v5 = *(void **)(v0 + 376);
  v6 = *(_QWORD *)(v0 + 352);
  v7 = *(_QWORD *)(v0 + 336);
  v8 = *(_QWORD *)(v0 + 344);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236A4E398(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433318);
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

uint64_t ATBiomeMediaItem.hash(into:)()
{
  _QWORD *v0;

  if (v0[1])
  {
    sub_236A6E180();
    swift_bridgeObjectRetain();
    sub_236A6DE5C();
    swift_bridgeObjectRelease();
    if (v0[3])
      goto LABEL_3;
  }
  else
  {
    sub_236A6E180();
    if (v0[3])
    {
LABEL_3:
      sub_236A6E180();
      swift_bridgeObjectRetain();
      sub_236A6DE5C();
      swift_bridgeObjectRelease();
      if (v0[5])
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  sub_236A6E180();
  if (v0[5])
  {
LABEL_4:
    sub_236A6E180();
    swift_bridgeObjectRetain();
    sub_236A6DE5C();
    swift_bridgeObjectRelease();
    if (v0[7])
      goto LABEL_5;
LABEL_10:
    sub_236A6E180();
    if (v0[9])
      goto LABEL_6;
LABEL_11:
    sub_236A6E180();
    goto LABEL_12;
  }
LABEL_9:
  sub_236A6E180();
  if (!v0[7])
    goto LABEL_10;
LABEL_5:
  sub_236A6E180();
  swift_bridgeObjectRetain();
  sub_236A6DE5C();
  swift_bridgeObjectRelease();
  if (!v0[9])
    goto LABEL_11;
LABEL_6:
  sub_236A6E180();
  swift_bridgeObjectRetain();
  sub_236A6DE5C();
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRetain();
  sub_236A6DE5C();
  swift_bridgeObjectRelease();
  return sub_236A6E174();
}

uint64_t ATBiomeMediaItem.hashValue.getter()
{
  sub_236A6E168();
  ATBiomeMediaItem.hash(into:)();
  return sub_236A6E18C();
}

BOOL sub_236A4E608(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[6];
  char v12;
  _OWORD v13[6];
  char v14;

  v2 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v2;
  v12 = *(_BYTE *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v3;
  v4 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v4;
  v5 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v5;
  v6 = *(_OWORD *)(a2 + 32);
  v7 = *(_OWORD *)(a2 + 48);
  v8 = *(_OWORD *)(a2 + 64);
  v9 = *(_OWORD *)(a2 + 80);
  v14 = *(_BYTE *)(a2 + 96);
  v13[4] = v8;
  v13[5] = v9;
  v13[2] = v6;
  v13[3] = v7;
  return _s15ArchetypeEngine16ATBiomeMediaItemV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v11, (uint64_t)v13);
}

uint64_t sub_236A4E670()
{
  sub_236A6E168();
  ATBiomeMediaItem.hash(into:)();
  return sub_236A6E18C();
}

uint64_t sub_236A4E6B0()
{
  sub_236A6E168();
  ATBiomeMediaItem.hash(into:)();
  return sub_236A6E18C();
}

uint64_t ATBiomeDataRetriever.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ATBiomeDataRetriever.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t ATBiomeDataRetriever.getTopPlayedMedia(k:start:end:mediaTypesOfInterest:maxNumRecordsToFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[33] = a4;
  v5[34] = a5;
  v5[31] = a2;
  v5[32] = a3;
  v5[30] = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331D8);
  v5[35] = v6;
  v5[36] = *(_QWORD *)(v6 - 8);
  v5[37] = swift_task_alloc();
  v5[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  v7 = sub_236A6DC64();
  v5[41] = v7;
  v5[42] = *(_QWORD *)(v7 - 8);
  v5[43] = swift_task_alloc();
  v5[44] = swift_task_alloc();
  v5[45] = swift_task_alloc();
  return swift_task_switch();
}

int64_t sub_236A4E7F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void (*v16)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  unint64_t i;
  uint64_t v51;
  int *v52;
  int v53;
  uint64_t v54;
  int *v55;
  int v56;
  uint64_t v57;
  int *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  _QWORD *v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  char v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  unint64_t v79;
  double v80;
  char v81;
  char isUniquelyReferenced_nonNull_native;
  char v83;
  unint64_t v84;
  uint64_t v85;
  _BOOL8 v86;
  uint64_t v87;
  char v88;
  unint64_t v89;
  char v90;
  double v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  BOOL v99;
  uint64_t v100;
  _QWORD *v101;
  int64_t v102;
  int64_t result;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  int64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  int64_t v117;
  int64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  char v129;
  uint64_t v130;
  unint64_t v131;
  _QWORD *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(char *, uint64_t);
  _QWORD *v142;
  _QWORD *v143;

  v1 = v0[31];
  sub_236A6DC58();
  if ((unsigned __int128)(v1 * (__int128)86400) >> 64 != (86400 * v1) >> 63)
    goto LABEL_61;
  v2 = v0[44];
  v132 = v0;
  v3 = v0[42];
  v4 = v0[41];
  v5 = v0[32];
  sub_236A6DC04();
  v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[46] = v6;
  v6(v2, v4);
  sub_236A6DC58();
  if ((unsigned __int128)(v5 * (__int128)86400) >> 64 != (86400 * v5) >> 63)
  {
LABEL_62:
    __break(1u);
    return sub_236A6E06C();
  }
  v8 = v0[44];
  v7 = v0[45];
  v10 = v0[42];
  v9 = v0[43];
  v12 = v0[40];
  v11 = v0[41];
  v13 = v0[39];
  v14 = v0[34];
  sub_236A6DC04();
  v6(v8, v11);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v15(v12, v7, v11);
  v16 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56);
  v16(v12, 0, 1, v11);
  v15(v13, v9, v11);
  v16(v13, 0, 1, v11);
  if (v14 < 0)
    return sub_236A6E06C();
  v141 = (void (*)(char *, uint64_t))v6;
  v18 = v0[39];
  v17 = v0[40];
  v19 = v0[33];
  v20 = v0[34];
  sub_236A54D8C(0, &qword_2564331E8);
  v21 = sub_236A4F91C(v17, v18, v20, v20, 0);
  v0[47] = v21;
  v22 = objc_msgSend((id)BiomeLibrary(), sel_Media);
  swift_unknownObjectRelease();
  v23 = objc_msgSend(v22, sel_NowPlaying);
  swift_unknownObjectRelease();
  v24 = objc_msgSend(v23, sel_publisherWithOptions_, v21);
  v0[48] = v24;

  v25 = swift_allocObject();
  v0[49] = v25;
  v26 = (_QWORD *)MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v25 + 16) = MEMORY[0x24BEE4AF8];
  v0[19] = sub_236A4FA2C;
  v0[20] = 0;
  v27 = MEMORY[0x24BDAC760];
  v0[15] = MEMORY[0x24BDAC760];
  v0[16] = 1107296256;
  v0[17] = sub_236A4FBFC;
  v0[18] = &block_descriptor;
  v28 = _Block_copy(v0 + 15);
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v19;
  *(_QWORD *)(v29 + 24) = v25;
  v0[25] = sub_236A54164;
  v0[26] = v29;
  v0[21] = v27;
  v0[22] = 1107296256;
  v0[23] = sub_236A50554;
  v0[24] = &block_descriptor_6;
  v30 = _Block_copy(v0 + 21);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  v31 = objc_msgSend(v24, sel_sinkWithCompletion_shouldContinue_, v28, v30);
  _Block_release(v30);
  _Block_release(v28);

  swift_beginAccess();
  v32 = *(_QWORD *)(v25 + 16);
  v126 = *(_QWORD *)(v32 + 16);
  if (v126)
  {
    v33 = v0[35];
    v124 = v0[36];
    v125 = v32 + 32;
    swift_bridgeObjectRetain();
    v34 = 0;
    v123 = v32;
    while (1)
    {
      if (v34 >= *(_QWORD *)(v32 + 16))
        goto LABEL_58;
      v35 = (uint64_t *)(v125 + 112 * v34);
      v130 = *v35;
      v131 = v34;
      v36 = v35[11];
      v129 = *((_BYTE *)v35 + 96);
      v37 = v35[13];
      v136 = *(_OWORD *)(v35 + 7);
      v137 = *(_OWORD *)(v35 + 9);
      v134 = *(_OWORD *)(v35 + 3);
      v135 = *(_OWORD *)(v35 + 5);
      v133 = *(_OWORD *)(v35 + 1);
      if (*(_QWORD *)(v37 + 16))
        break;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v46 = v36;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v44 = 0.0;
      v45 = v132;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        goto LABEL_17;
LABEL_12:
      v48 = v26[2];
      v47 = v26[3];
      if (v48 >= v47 >> 1)
        v26 = sub_236A50AEC((_QWORD *)(v47 > 1), v48 + 1, 1, v26);
      v26[2] = v48 + 1;
      v49 = &v26[14 * v48];
      v49[4] = v130;
      v34 = v131 + 1;
      *(_OWORD *)(v49 + 5) = v133;
      *(_OWORD *)(v49 + 7) = v134;
      *(_OWORD *)(v49 + 9) = v135;
      *(_OWORD *)(v49 + 11) = v136;
      *(_OWORD *)(v49 + 13) = v137;
      v49[15] = v46;
      *((_BYTE *)v49 + 128) = v129;
      *((double *)v49 + 17) = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v131 + 1 == v126)
      {
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
    v139 = *(_QWORD *)(v37 + 16);
    v127 = v132[41];
    v128 = v26;
    v38 = (int *)v132[38];
    v39 = v37 + ((*(unsigned __int8 *)(v124 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v124 + 80));
    v40 = *(_QWORD *)(v124 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v138 = v37;
    swift_bridgeObjectRetain();
    sub_236A5416C(v39, (uint64_t)v38);
    v41 = *v38;
    v141((char *)v38 + *(int *)(v33 + 48), v127);
    if (v41 != 2)
    {
      v42 = v132[41];
      v43 = v132[38];
      sub_236A5416C(v39, v43);
      v141((char *)(v43 + *(int *)(v33 + 48)), v42);
    }
    v44 = 0.0;
    v140 = v139 - 1;
    v45 = v132;
    if (v140)
    {
      for (i = 0; v140 != i; ++i)
      {
        v51 = v132[41];
        v52 = (int *)v132[38];
        sub_236A5416C(v39 + v40, (uint64_t)v52);
        v53 = *v52;
        v141((char *)v52 + *(int *)(v33 + 48), v51);
        if (v53 == 2
          || (v54 = v132[41],
              v55 = (int *)v132[38],
              sub_236A5416C(v39 + v40, (uint64_t)v55),
              v56 = *v55,
              v141((char *)v55 + *(int *)(v33 + 48), v54),
              v56 == 3))
        {
          if (i >= *(_QWORD *)(v138 + 16))
          {
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
LABEL_61:
            __break(1u);
            goto LABEL_62;
          }
          v57 = v132[41];
          v58 = (int *)v132[38];
          sub_236A5416C(v39, (uint64_t)v58);
          v59 = *v58;
          v141((char *)v58 + *(int *)(v33 + 48), v57);
          if (v59 == 1)
          {
            v60 = v132[41];
            v62 = v132[37];
            v61 = v132[38];
            sub_236A5416C(v39 + v40, v61);
            v63 = v61 + *(int *)(v33 + 48);
            sub_236A5416C(v39, v62);
            v64 = v62 + *(int *)(v33 + 48);
            sub_236A6DBF8();
            v66 = v65;
            v141((char *)v64, v60);
            v141((char *)v63, v60);
            v44 = v44 + v66;
          }
        }
        v39 += v40;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v46 = v36;
    swift_bridgeObjectRetain();
    v26 = v128;
    v32 = v123;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_12;
LABEL_17:
    v26 = sub_236A50AEC(0, v26[2] + 1, 1, v26);
    goto LABEL_12;
  }
  v45 = v0;
LABEL_26:
  v45[50] = v26;
  v67 = (_QWORD *)sub_236A505A4(MEMORY[0x24BEE4AF8]);
  v68 = v26[2];
  if (v68)
  {
    v142 = v45 + 2;
    swift_bridgeObjectRetain();
    v69 = (double *)(v26 + 17);
    while (1)
    {
      v70 = *((_QWORD *)v69 - 2);
      v71 = *((_BYTE *)v69 - 8);
      v72 = *v69;
      v73 = *((_OWORD *)v69 - 6);
      v74 = *((_OWORD *)v69 - 5);
      v75 = *((_OWORD *)v69 - 4);
      v76 = *((_OWORD *)v69 - 3);
      v77 = *((_OWORD *)v69 - 2);
      v132[2] = *((_QWORD *)v69 - 13);
      *(_OWORD *)(v132 + 3) = v73;
      *(_OWORD *)(v132 + 5) = v74;
      *(_OWORD *)(v132 + 7) = v75;
      *(_OWORD *)(v132 + 9) = v76;
      *(_OWORD *)(v132 + 11) = v77;
      v132[13] = v70;
      *((_BYTE *)v132 + 112) = v71;
      v78 = v67[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v78)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v79 = sub_236A513C8(v142);
        v80 = 0.0;
        if ((v81 & 1) != 0)
          v80 = *(double *)(v67[7] + 8 * v79);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v80 = 0.0;
      }
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v143 = v67;
      v84 = sub_236A513C8(v142);
      v85 = v67[2];
      v86 = (v83 & 1) == 0;
      v87 = v85 + v86;
      if (__OFADD__(v85, v86))
        goto LABEL_59;
      v88 = v83;
      if (v67[3] >= v87)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_236A52D28();
          v67 = v143;
        }
      }
      else
      {
        sub_236A526B4(v87, isUniquelyReferenced_nonNull_native);
        v67 = v143;
        v89 = sub_236A513C8(v142);
        if ((v88 & 1) != (v90 & 1))
          return sub_236A6E114();
        v84 = v89;
      }
      v91 = v72 + v80;
      if ((v88 & 1) != 0)
      {
        *(double *)(v67[7] + 8 * v84) = v91;
      }
      else
      {
        v67[(v84 >> 6) + 8] |= 1 << v84;
        v92 = v67[6] + 104 * v84;
        v94 = *((_OWORD *)v142 + 1);
        v93 = *((_OWORD *)v142 + 2);
        *(_OWORD *)v92 = *(_OWORD *)v142;
        *(_OWORD *)(v92 + 16) = v94;
        *(_OWORD *)(v92 + 32) = v93;
        v95 = *((_OWORD *)v142 + 3);
        v96 = *((_OWORD *)v142 + 4);
        v97 = *((_OWORD *)v142 + 5);
        *(_BYTE *)(v92 + 96) = *((_BYTE *)v142 + 96);
        *(_OWORD *)(v92 + 64) = v96;
        *(_OWORD *)(v92 + 80) = v97;
        *(_OWORD *)(v92 + 48) = v95;
        *(double *)(v67[7] + 8 * v84) = v91;
        v98 = v67[2];
        v99 = __OFADD__(v98, 1);
        v100 = v98 + 1;
        if (v99)
          goto LABEL_60;
        v67[2] = v100;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v69 += 14;
      if (!--v68)
      {
        swift_bridgeObjectRelease();
        v45 = v132;
        break;
      }
    }
  }
  v45[51] = v67;
  swift_bridgeObjectRetain_n();
  v101 = sub_236A51924((uint64_t)v67);
  swift_bridgeObjectRelease();
  v143 = v101;
  sub_236A509E4(&v143);
  v102 = v45[30];
  swift_bridgeObjectRelease();
  result = sub_236A50870(v102, (uint64_t)v143);
  v45[52] = v106;
  v107 = v106 >> 1;
  if ((uint64_t)(v106 >> 1) < v105)
  {
    __break(1u);
  }
  else
  {
    v108 = result;
    v109 = v105;
    if (v105 == v107)
    {
      v110 = (void *)v132[47];

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v111 = v132[41];
      v113 = v132[45];
      v112 = (void (*)(uint64_t, uint64_t))v132[46];
      v112(v132[43], v111);
      v112(v113, v111);
      swift_bridgeObjectRelease();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return ((uint64_t (*)(_QWORD))v132[1])(MEMORY[0x24BEE4AF8]);
    }
    if (v105 < v107)
    {
      v114 = v104;
      v115 = v106;
      v132[53] = v105;
      if ((v106 & 1) != 0 && (result = swift_isUniquelyReferenced_nonNull(), (result & 1) != 0))
      {
        v116 = v109;
      }
      else
      {
        sub_236A542C0(v114, v109, v115);
        v118 = v117;
        v114 = v119;
        v116 = v120;
        v115 = v121;
        result = swift_unknownObjectRelease();
        v107 = v115 >> 1;
        v108 = v118;
      }
      v132[56] = v114;
      v132[57] = v108;
      v132[54] = v115;
      v132[55] = v116;
      if (v109 >= v116 && v109 < v107)
      {
        v122 = (_QWORD *)swift_task_alloc();
        v132[58] = v122;
        *v122 = v132;
        v122[1] = sub_236A4F558;
        return sub_236A4DD34();
      }
      goto LABEL_66;
    }
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_236A4F558()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_236A4F5AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v26;
  void *v27;
  void *v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
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

  v1 = *(_QWORD *)(v0 + 424) + 1;
  v2 = *(_QWORD *)(v0 + 448);
  v3 = *(_QWORD *)(v0 + 456);
  v4 = *(_QWORD *)(v0 + 432);
  v5 = *(_QWORD *)(v0 + 440);
  if (v1 != *(_QWORD *)(v0 + 416) >> 1)
  {
    *(_QWORD *)(v0 + 424) = v1;
    if ((v4 & 1) == 0 || (swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      sub_236A542C0(v2, v5, v4);
      v21 = v20;
      v2 = v22;
      v5 = v23;
      v4 = v24;
      swift_unknownObjectRelease();
      v3 = v21;
    }
    *(_QWORD *)(v0 + 448) = v2;
    *(_QWORD *)(v0 + 456) = v3;
    *(_QWORD *)(v0 + 432) = v4;
    *(_QWORD *)(v0 + 440) = v5;
    if (v1 >= v5 && v1 < (uint64_t)(v4 >> 1))
    {
      v26 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 464) = v26;
      *v26 = v0;
      v26[1] = sub_236A4F558;
      sub_236A4DD34();
      return;
    }
    goto LABEL_27;
  }
  v6 = (v4 >> 1) - v5;
  if (__OFSUB__(v4 >> 1, v5))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v6)
  {
    v43 = MEMORY[0x24BEE4AF8];
    swift_unknownObjectRetain();
    sub_236A53120(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
    {
LABEL_28:
      __break(1u);
      return;
    }
    v32 = v0;
    v7 = v43;
    if (v5 <= (uint64_t)(v4 >> 1))
      v8 = v4 >> 1;
    else
      v8 = v5;
    v9 = v8 - v5;
    v10 = (_QWORD *)(v2 + 112 * v5 + 104);
    while (v9)
    {
      v11 = *(v10 - 10);
      v39 = *(v10 - 11);
      v40 = *(v10 - 13);
      v12 = *(v10 - 8);
      v13 = *(v10 - 6);
      v37 = *(v10 - 7);
      v38 = *(v10 - 9);
      v14 = *(v10 - 4);
      v15 = *(v10 - 2);
      v35 = *(v10 - 3);
      v36 = *(v10 - 5);
      v34 = *((_BYTE *)v10 - 8);
      v16 = *v10;
      v17 = *(_QWORD *)(v7 + 16);
      v33 = *(_QWORD *)(v7 + 24);
      v44 = v7;
      v18 = v7;
      v41 = *(v10 - 12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v7 = v18;
      if (v17 >= v33 >> 1)
      {
        sub_236A53120(v33 > 1, v17 + 1, 1);
        v7 = v44;
      }
      *(_QWORD *)(v7 + 16) = v17 + 1;
      v19 = v7 + 112 * v17;
      *(_QWORD *)(v19 + 32) = v40;
      *(_QWORD *)(v19 + 40) = v41;
      *(_QWORD *)(v19 + 48) = v39;
      *(_QWORD *)(v19 + 56) = v11;
      *(_QWORD *)(v19 + 64) = v38;
      *(_QWORD *)(v19 + 72) = v12;
      *(_QWORD *)(v19 + 80) = v37;
      *(_QWORD *)(v19 + 88) = v13;
      *(_QWORD *)(v19 + 96) = v36;
      *(_QWORD *)(v19 + 104) = v14;
      *(_QWORD *)(v19 + 112) = v35;
      *(_QWORD *)(v19 + 120) = v15;
      *(_BYTE *)(v19 + 128) = v34;
      --v9;
      v10 += 14;
      *(_QWORD *)(v19 + 136) = v16;
      if (!--v6)
      {
        v0 = v32;
        v27 = *(void **)(v32 + 376);
        v42 = v7;

        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_24;
      }
    }
    __break(1u);
    goto LABEL_26;
  }
  v28 = *(void **)(v0 + 376);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v42 = MEMORY[0x24BEE4AF8];
LABEL_24:
  v30 = *(_QWORD *)(v0 + 360);
  v29 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  v31 = *(_QWORD *)(v0 + 328);
  v29(*(_QWORD *)(v0 + 344), v31);
  v29(v30, v31);
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t))(v0 + 8))(v42);
}

id sub_236A4F91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  id v15;

  v10 = sub_236A6DC64();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v10) != 1)
  {
    v13 = (void *)sub_236A6DC10();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_236A6DC10();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

id sub_236A4FA2C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id result;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint8_t *v15;
  _QWORD v16[2];

  v2 = sub_236A6DDF0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_error);
  if (result)
  {
    v7 = result;
    sub_236A6DDE4();
    v8 = v7;
    v9 = sub_236A6DDD8();
    v10 = sub_236A6DF1C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v16[0] = v2;
      v12 = (uint8_t *)v11;
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412290;
      v8 = v8;
      v14 = _swift_stdlib_bridgeErrorToNSError();
      v16[1] = v14;
      sub_236A6DF70();
      *v13 = v14;

      _os_log_impl(&dword_236A4B000, v9, v10, "Failed to access Now Playing Biome stream with error: \"%@\"", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433330);
      swift_arrayDestroy();
      MEMORY[0x23B7FA5E0](v13, -1, -1);
      v15 = v12;
      v2 = v16[0];
      MEMORY[0x23B7FA5E0](v15, -1, -1);
    }
    else
    {

      v9 = v8;
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

void sub_236A4FBFC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_236A4FC4C(void *a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned __int8 v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v76;
  unint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  _QWORD *v88;
  char v89;
  char *v90;
  _QWORD *v91;
  _QWORD *v92;
  char v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  _QWORD v112[12];
  unsigned __int8 v113;
  _OWORD v114[6];
  char v115;

  v107 = a3;
  v109 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331D8);
  v108 = *(_QWORD *)(v4 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v106 = (unsigned int *)((char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v96 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v96 - v13;
  v111 = sub_236A6DC64();
  v15 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  v110 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(a1, sel_eventBody);
  if (!v17)
    return 1;
  v18 = v17;
  v19 = objc_msgSend(v17, sel_bundleID);

  if (!v19)
    return 1;
  v104 = sub_236A6DE38();
  v21 = v20;

  v22 = objc_msgSend(a1, sel_eventBody);
  if (!v22 || (v23 = v22, v105 = v21, v24 = objc_msgSend(v22, sel_duration), v23, !v24))
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 1;
  }
  v25 = objc_msgSend(a1, sel_eventBody);
  if (!v25)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v14, 1, 1, v111);
LABEL_12:
    swift_bridgeObjectRelease();
    sub_236A55170((uint64_t)v14, &qword_2564331E0);
    return 1;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, sel_absoluteTimestamp);

  if (v27)
  {
    sub_236A6DC40();

    v28 = 0;
  }
  else
  {
    v28 = 1;
  }
  v29 = v111;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v12, v28, 1, v111);
  sub_236A55220((uint64_t)v12, (uint64_t)v14, &qword_2564331E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v29) == 1)
    goto LABEL_12;
  v30 = v110;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v110, v14, v29);
  v31 = objc_msgSend(a1, sel_eventBody);
  if (!v31)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v30, v29);
    goto LABEL_18;
  }
  v32 = v31;
  v99 = objc_msgSend(v31, sel_playbackState);

  v33 = objc_msgSend(a1, sel_eventBody);
  if (v33)
  {
    v34 = v33;
    v35 = objc_msgSend(v33, sel_title);

    v36 = v105;
    if (v35)
    {
      v37 = sub_236A6DE38();
      v102 = v38;
      v103 = v37;

    }
    else
    {
      v102 = 0;
      v103 = 0;
    }
  }
  else
  {
    v102 = 0;
    v103 = 0;
    v36 = v105;
  }
  v40 = objc_msgSend(a1, sel_eventBody);
  if (v40
    && (v41 = v40, v42 = objc_msgSend(v40, sel_artist), v41, v42))
  {
    v105 = sub_236A6DE38();
    v101 = v43;

  }
  else
  {
    v105 = 0;
    v101 = 0;
  }
  v44 = objc_msgSend(a1, sel_eventBody);
  if (v44
    && (v45 = v44, v46 = objc_msgSend(v44, sel_album), v45, v46))
  {
    v100 = sub_236A6DE38();
    v48 = v47;

  }
  else
  {
    v100 = 0;
    v48 = 0;
  }
  v49 = objc_msgSend(a1, sel_eventBody);
  v50 = v49;
  if (v49)
  {
    v51 = objc_msgSend(v49, sel_iTunesStoreIdentifier);

    if (v51)
    {
      v52 = sub_236A6DE38();
      v50 = v53;

    }
    else
    {
      v52 = 0;
      v50 = 0;
    }
  }
  else
  {
    v52 = 0;
  }
  sub_236A53988(v103, v102, v105, v101, v100, v48, v52, (uint64_t)v50, (uint64_t)v112, 0, 0, v104, v36);
  v54 = v112[0];
  v55 = v112[1];
  v57 = v112[2];
  v56 = v112[3];
  v58 = v112[4];
  v104 = v112[6];
  v105 = v112[5];
  v102 = v112[8];
  v103 = v112[7];
  v100 = v112[10];
  v101 = v112[9];
  v98 = v112[11];
  v59 = v113;
  if (!sub_236A504F4(v113, v109))
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v110, v111);
    sub_236A551AC((uint64_t)v112);
    return 1;
  }
  v96 = v58;
  v97 = v56;
  v109 = v54;
  v60 = (uint64_t *)(v107 + 16);
  swift_beginAccess();
  v61 = *v60;
  v62 = *(_QWORD *)(*v60 + 16);
  if (!v62)
    goto LABEL_41;
  v63 = v61 + 32 + 112 * v62;
  v64 = *(_OWORD *)(v63 - 32);
  v114[4] = *(_OWORD *)(v63 - 48);
  v114[5] = v64;
  v115 = *(_BYTE *)(v63 - 16);
  v65 = *(_OWORD *)(v63 - 96);
  v114[0] = *(_OWORD *)(v63 - 112);
  v114[1] = v65;
  v66 = *(_OWORD *)(v63 - 64);
  v114[2] = *(_OWORD *)(v63 - 80);
  v114[3] = v66;
  if (!_s15ArchetypeEngine16ATBiomeMediaItemV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v114, (uint64_t)v112)
    || (v67 = *(_QWORD *)(v61 + 16)) != 0
    && (v68 = *(_QWORD *)(v61 + 32 + 112 * v67 - 8), (v69 = *(_QWORD *)(v68 + 16)) != 0)
    && (sub_236A5416C(v68+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(_QWORD *)(v108 + 72) * (v69 - 1), (uint64_t)v8), v70 = *(_DWORD *)v8, (*(void (**)(char *, uint64_t))(v15 + 8))(&v8[*(int *)(v4 + 48)], v111), v70 == 3))
  {
LABEL_41:
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433320);
    v71 = (*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
    v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_236A6E990;
    v73 = v72 + v71 + *(int *)(v4 + 48);
    *(_DWORD *)(v72 + v71) = v99;
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 16))(v73, v110, v111);
    swift_beginAccess();
    v74 = (_QWORD *)*v60;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v60 = (uint64_t)v74;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v74 = sub_236A50E24(0, v74[2] + 1, 1, v74);
      *v60 = (uint64_t)v74;
    }
    v77 = v74[2];
    v76 = v74[3];
    if (v77 >= v76 >> 1)
    {
      v74 = sub_236A50E24((_QWORD *)(v76 > 1), v77 + 1, 1, v74);
      *v60 = (uint64_t)v74;
    }
    v74[2] = v77 + 1;
    v78 = &v74[14 * v77];
    v78[4] = v109;
    v78[5] = v55;
    v79 = v97;
    v78[6] = v57;
    v78[7] = v79;
    v80 = v105;
    v78[8] = v96;
    v78[9] = v80;
    v81 = v103;
    v78[10] = v104;
    v78[11] = v81;
    v82 = v101;
    v78[12] = v102;
    v78[13] = v82;
    v83 = v98;
    v78[14] = v100;
    v78[15] = v83;
    *((_BYTE *)v78 + 128) = v59;
    v78[17] = v72;
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v110, v111);
    return 1;
  }
  sub_236A551AC((uint64_t)v112);
  swift_beginAccess();
  v84 = *(_QWORD **)(*v60 + 16);
  v85 = (uint64_t)v106;
  v86 = (char *)v106 + *(int *)(v4 + 48);
  *v106 = v99;
  v87 = v111;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v86, v110, v111);
  swift_beginAccess();
  v88 = (_QWORD *)*v60;
  v89 = swift_isUniquelyReferenced_nonNull_native();
  *v60 = (uint64_t)v88;
  if ((v89 & 1) != 0)
  {
    v90 = v110;
    if (v84)
      goto LABEL_49;
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  v88 = sub_236A6501C(v88);
  *v60 = (uint64_t)v88;
  v90 = v110;
  if (!v84)
    goto LABEL_55;
LABEL_49:
  if ((unint64_t)v84 > v88[2])
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v91 = &v88[14 * ((_QWORD)v84 - 1)];
  v92 = (_QWORD *)v91[17];
  v84 = v91 + 17;
  v88 = v92;
  v93 = swift_isUniquelyReferenced_nonNull_native();
  *v84 = v92;
  if ((v93 & 1) == 0)
  {
LABEL_57:
    v88 = (_QWORD *)sub_236A50C14(0, v88[2] + 1, 1, (unint64_t)v88);
    *v84 = v88;
  }
  v95 = v88[2];
  v94 = v88[3];
  if (v95 >= v94 >> 1)
  {
    v88 = (_QWORD *)sub_236A50C14(v94 > 1, v95 + 1, 1, (unint64_t)v88);
    *v84 = v88;
  }
  v88[2] = v95 + 1;
  sub_236A55220(v85, (uint64_t)v88+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(_QWORD *)(v108 + 72) * v95, &qword_2564331D8);
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v90, v87);
  return 1;
}

BOOL sub_236A504F4(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_236A50554(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

unint64_t sub_236A505A4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _BYTE v19[96];
  char v20;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332E0);
  v2 = (_QWORD *)sub_236A6E0A8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 136);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *((_BYTE *)v4 - 8);
    v7 = *v4;
    *(_QWORD *)v19 = *(v4 - 13);
    v8 = *((_OWORD *)v4 - 5);
    *(_OWORD *)&v19[8] = *((_OWORD *)v4 - 6);
    *(_OWORD *)&v19[24] = v8;
    v9 = *((_OWORD *)v4 - 3);
    *(_OWORD *)&v19[40] = *((_OWORD *)v4 - 4);
    *(_OWORD *)&v19[56] = v9;
    *(_OWORD *)&v19[72] = *((_OWORD *)v4 - 2);
    v20 = v6;
    *(_QWORD *)&v19[88] = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_236A513C8(v19);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = v2[6] + 104 * result;
    v13 = *(_OWORD *)&v19[80];
    *(_OWORD *)(v12 + 64) = *(_OWORD *)&v19[64];
    *(_OWORD *)(v12 + 80) = v13;
    *(_BYTE *)(v12 + 96) = v20;
    v14 = *(_OWORD *)&v19[16];
    *(_OWORD *)v12 = *(_OWORD *)v19;
    *(_OWORD *)(v12 + 16) = v14;
    v15 = *(_OWORD *)&v19[48];
    *(_OWORD *)(v12 + 32) = *(_OWORD *)&v19[32];
    *(_OWORD *)(v12 + 48) = v15;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v16 = v2[2];
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (v17)
      goto LABEL_11;
    v2[2] = v18;
    v4 += 14;
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

unint64_t sub_236A50758(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D8);
  v2 = (_QWORD *)sub_236A6E0A8();
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
    swift_bridgeObjectRetain();
    result = sub_236A51420(v5, v6);
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
    v2[2] = v13;
    v4 += 3;
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

int64_t sub_236A50870(int64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (!result)
      v3 = 0;
    if (v2 >= v3)
      return a2;
  }
  __break(1u);
  return result;
}

uint64_t ATBiomeDataRetriever.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ATBiomeDataRetriever.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of ATSpotlightDataRecord.extendedContent()
{
  return 0;
}

id variable initialization expression of ATLocationRetriever.locationManager()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA88]), sel_init);
}

dispatch_semaphore_t variable initialization expression of ATLocationRetriever.semaphore()
{
  return dispatch_semaphore_create(0);
}

unint64_t variable initialization expression of ATSpotlightCalendarRetriever.bundleID()
{
  return 0xD000000000000013;
}

uint64_t variable initialization expression of ATSpotlightCalendarRetriever.timestampSearchPaddingInSeconds()
{
  return 30;
}

id variable initialization expression of ATMegadomeLifeEvent.dateFormatter()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
}

uint64_t variable initialization expression of ATSpotlightDataRetriever.oneYearBack()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_236A6DC64();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DC58();
  sub_236A6DC04();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t variable initialization expression of ATSpotlightDataRetriever.records()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_236A509E4(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_236A65044(v2);
  v3 = v2[2];
  v5[0] = v2 + 4;
  v5[1] = v3;
  result = sub_236A51BE4(v5);
  *a1 = v2;
  return result;
}

unint64_t variable initialization expression of ATSpotlightMailRetriever.bundleId()
{
  return 0xD000000000000014;
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.mailUniqueRecordIdentifier()
{
  return sub_236A6DE38();
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.mailConversationId()
{
  return sub_236A6DE38();
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.mailReceivedDate()
{
  return sub_236A6DE38();
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.longestChain()
{
  return 100;
}

uint64_t variable initialization expression of ATAccessibility._cachedSystemWideElement()
{
  return 0;
}

BOOL sub_236A50AA8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_236A50ABC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_236A50ACC(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void sub_236A50AD8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_236A50AE0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_236A50AEC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2564332E8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 112);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[14 * v8 + 4])
          memmove(v12, a4 + 4, 112 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_236A541B4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_236A50C14(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433320);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2564331D8) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_236A6E06C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2564331D8) - 8);
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
    sub_236A54AC8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_236A50E24(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433328);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 112);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[14 * v8 + 4])
          memmove(v12, a4 + 4, 112 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_236A549D4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_236A50F4C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_236A54DC4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_236A51058(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_236A5118C(a1, a2, a3, a4, &qword_2564332B0, (uint64_t (*)(_QWORD))type metadata accessor for ATSpotlightDataRecord);
}

_QWORD *sub_236A5106C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2564332C8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 95;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 7);
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
        if (v10 != a4 || v13 >= &a4[16 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 7);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_236A54EB4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_236A51178(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_236A5118C(a1, a2, a3, a4, &qword_2564332C0, (uint64_t (*)(_QWORD))type metadata accessor for ATMegadomeLifeEvent);
}

uint64_t sub_236A5118C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_236A6E06C();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_236A54FA4(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

unint64_t sub_236A51398(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_236A6DFA0();
  return sub_236A51484(a1, v2);
}

unint64_t sub_236A513C8(_QWORD *a1)
{
  uint64_t v2;

  sub_236A6E168();
  ATBiomeMediaItem.hash(into:)();
  v2 = sub_236A6E18C();
  return sub_236A51548(a1, v2);
}

unint64_t sub_236A51420(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_236A6E168();
  sub_236A6DE5C();
  v4 = sub_236A6E18C();
  return sub_236A51844(a1, a2, v4);
}

unint64_t sub_236A51484(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_236A5512C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7F9FD4](v9, a1);
      sub_236A550BC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_236A51548(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
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
  int v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  int v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  int v41;
  char v42;
  uint64_t v43;
  int v45;
  char v46;
  uint64_t v47;
  int v48;
  char v49;
  int v50;
  char v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = a1;
    v7 = ~v4;
    v8 = *(_QWORD *)(v2 + 48);
    v9 = a1[1];
    v61 = *a1;
    v55 = v2 + 64;
    v53 = v8;
    v54 = ~v4;
    do
    {
      v10 = v8 + 104 * v5;
      v11 = *(_QWORD *)(v10 + 8);
      v12 = *(_QWORD *)(v10 + 16);
      v14 = *(_QWORD *)(v10 + 24);
      v13 = *(_QWORD *)(v10 + 32);
      v15 = *(_QWORD *)(v10 + 40);
      v16 = *(_QWORD *)(v10 + 48);
      v17 = *(_QWORD *)(v10 + 56);
      v18 = *(_QWORD *)(v10 + 64);
      v20 = *(_QWORD *)(v10 + 72);
      v19 = *(_QWORD *)(v10 + 80);
      v21 = *(_QWORD *)(v10 + 88);
      v22 = *(unsigned __int8 *)(v10 + 96);
      if (v11)
      {
        if (!v9)
          goto LABEL_4;
        if (*(_QWORD *)v10 != v61 || v11 != v9)
        {
          v58 = *(_QWORD *)(v10 + 56);
          v59 = *(_QWORD *)(v10 + 48);
          v57 = *(_QWORD *)(v10 + 64);
          v24 = *(_QWORD *)(v10 + 72);
          v25 = v9;
          v26 = *(_QWORD *)(v10 + 88);
          v27 = *(_QWORD *)(v10 + 80);
          v28 = *(unsigned __int8 *)(v10 + 96);
          v29 = *(_QWORD *)(v10 + 40);
          v30 = *(_QWORD *)(v10 + 32);
          v31 = sub_236A6E0F0();
          v13 = v30;
          v15 = v29;
          v22 = v28;
          v19 = v27;
          v21 = v26;
          v9 = v25;
          v20 = v24;
          v18 = v57;
          v17 = v58;
          v16 = v59;
          v8 = v53;
          v7 = v54;
          v3 = v55;
          v6 = a1;
          if ((v31 & 1) == 0)
            goto LABEL_4;
        }
      }
      else if (v9)
      {
        goto LABEL_4;
      }
      v32 = v6[3];
      if (v14)
      {
        if (!v32)
          goto LABEL_4;
        if (v12 != v6[2] || v14 != v32)
        {
          v34 = v22;
          v60 = v15;
          v35 = v13;
          v36 = sub_236A6E0F0();
          v13 = v35;
          v15 = v60;
          v22 = v34;
          v8 = v53;
          v7 = v54;
          v3 = v55;
          v6 = a1;
          if ((v36 & 1) == 0)
            goto LABEL_4;
        }
      }
      else if (v32)
      {
        goto LABEL_4;
      }
      v37 = v6[5];
      if (v15)
      {
        if (!v37)
          goto LABEL_4;
        if (v13 != v6[4] || v15 != v37)
        {
          v39 = v16;
          v40 = v17;
          v41 = v22;
          v42 = sub_236A6E0F0();
          v22 = v41;
          v17 = v40;
          v16 = v39;
          v8 = v53;
          v7 = v54;
          v3 = v55;
          v6 = a1;
          if ((v42 & 1) == 0)
            goto LABEL_4;
        }
      }
      else if (v37)
      {
        goto LABEL_4;
      }
      v43 = v6[7];
      if (v17)
      {
        if (!v43)
          goto LABEL_4;
        if (v16 != v6[6] || v17 != v43)
        {
          v45 = v22;
          v46 = sub_236A6E0F0();
          v22 = v45;
          v8 = v53;
          v7 = v54;
          v3 = v55;
          v6 = a1;
          if ((v46 & 1) == 0)
            goto LABEL_4;
        }
      }
      else if (v43)
      {
        goto LABEL_4;
      }
      v47 = v6[9];
      if (v20)
      {
        if (!v47)
          goto LABEL_4;
        if (v18 != v6[8] || v20 != v47)
        {
          v48 = v22;
          v49 = sub_236A6E0F0();
          v22 = v48;
          v8 = v53;
          v7 = v54;
          v3 = v55;
          v6 = a1;
          if ((v49 & 1) == 0)
            goto LABEL_4;
        }
      }
      else if (v47)
      {
        goto LABEL_4;
      }
      if (v19 == v6[10] && v21 == v6[11]
        || (v50 = v22, v51 = sub_236A6E0F0(), v22 = v50, v8 = v53, v7 = v54, v3 = v55, v6 = a1, (v51 & 1) != 0))
      {
        if (v22 == *((unsigned __int8 *)v6 + 96))
          return v5;
      }
LABEL_4:
      v5 = (v5 + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_236A51844(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_236A6E0F0() & 1) == 0)
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
      while (!v14 && (sub_236A6E0F0() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *sub_236A51924(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332F8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 112);
  v5 = sub_236A5368C(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_236A55168();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_236A51A1C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_21;
  if (!v5)
    return MEMORY[0x24BEE4AF8];
  if (v5 <= 0)
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0)
        goto LABEL_24;
      v14 = *(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8);
      v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      v16 = *(_QWORD *)(v14 + 72);
      v17 = a2 + v16 * a3;
      v18 = v16 * v5;
      v19 = &v15[v18];
      v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20)
        goto LABEL_24;
      swift_arrayInitWithCopy();
      return (uint64_t)v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332B0);
  v8 = *(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = (_QWORD *)swift_allocObject();
  v12 = _swift_stdlib_malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1)
      goto LABEL_23;
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A51BE4(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
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
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  unint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  char v132;
  double *v133;
  char *v134;

  v2 = a1;
  v3 = a1[1];
  result = sub_236A6E0CC();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_139;
    if ((unint64_t)v3 >= 2)
    {
      v94 = *v2;
      v95 = *v2 + 104;
      v96 = -1;
      for (i = 1; i != v3; ++i)
      {
        v98 = *(double *)(v94 + 112 * i + 104);
        v99 = v96;
        v100 = v95;
        do
        {
          if (*(double *)v100 >= v98)
            break;
          if (!v94)
            goto LABEL_143;
          v101 = v100 + 8;
          v102 = *(_QWORD *)(v100 + 88);
          v103 = *(_QWORD *)(v100 + 96);
          result = *(unsigned __int8 *)(v100 + 104);
          v104 = *(_OWORD *)(v100 + 8);
          v105 = *(_OWORD *)(v100 + 24);
          v106 = *(_OWORD *)(v100 + 40);
          v107 = *(_OWORD *)(v100 + 56);
          v108 = *(_OWORD *)(v100 + 72);
          v109 = *(_OWORD *)(v100 - 24);
          *(_OWORD *)(v100 + 72) = *(_OWORD *)(v100 - 40);
          *(_OWORD *)(v100 + 88) = v109;
          *(_OWORD *)(v100 + 104) = *(_OWORD *)(v100 - 8);
          v110 = *(_OWORD *)(v100 - 88);
          *(_OWORD *)(v100 + 8) = *(_OWORD *)(v100 - 104);
          *(_OWORD *)(v100 + 24) = v110;
          v112 = *(_OWORD *)(v100 - 72);
          v111 = *(_OWORD *)(v100 - 56);
          *(_OWORD *)(v100 - 104) = v104;
          *(_OWORD *)(v100 - 88) = v105;
          *(_OWORD *)(v100 - 72) = v106;
          *(_OWORD *)(v100 - 56) = v107;
          *(_OWORD *)(v100 - 40) = v108;
          *(_QWORD *)(v100 - 24) = v102;
          *(_QWORD *)(v100 - 16) = v103;
          *(_BYTE *)(v100 - 8) = result;
          *(double *)v100 = v98;
          v100 -= 112;
          *(_OWORD *)(v101 + 32) = v112;
          *(_OWORD *)(v101 + 48) = v111;
        }
        while (!__CFADD__(v99++, 1));
        v95 += 112;
        --v96;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_148;
  v125 = result;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    v133 = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v114 = (char *)MEMORY[0x24BEE4AF8];
LABEL_105:
      v124 = v8;
      if (v11 >= 2)
      {
        v115 = *v2;
        do
        {
          v116 = v11 - 2;
          if (v11 < 2)
            goto LABEL_134;
          if (!v115)
            goto LABEL_147;
          v117 = v114;
          v118 = *(_QWORD *)&v114[16 * v116 + 32];
          v119 = *(_QWORD *)&v114[16 * v11 + 24];
          sub_236A523F8((double *)(v115 + 112 * v118), (double *)(v115 + 112 * *(_QWORD *)&v114[16 * v11 + 16]), v115 + 112 * v119, v133);
          if (v1)
            break;
          if (v119 < v118)
            goto LABEL_135;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v117 = sub_236A65008((uint64_t)v117);
          if (v116 >= *((_QWORD *)v117 + 2))
            goto LABEL_136;
          v120 = &v117[16 * v116 + 32];
          *(_QWORD *)v120 = v118;
          *((_QWORD *)v120 + 1) = v119;
          v121 = *((_QWORD *)v117 + 2);
          if (v11 > v121)
            goto LABEL_137;
          memmove(&v117[16 * v11 + 16], &v117[16 * v11 + 32], 16 * (v121 - v11));
          v114 = v117;
          *((_QWORD *)v117 + 2) = v121 - 1;
          v11 = v121 - 1;
        }
        while (v121 > 2);
      }
LABEL_95:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v124 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433300);
    v7 = sub_236A6DEBC();
    *(_QWORD *)(v7 + 16) = v6;
    v124 = v7;
    v133 = (double *)(v7 + 32);
  }
  v9 = 0;
  v123 = v2;
  v10 = *v2;
  v134 = (char *)MEMORY[0x24BEE4AF8];
  v126 = v3;
  while (1)
  {
    v12 = v9++;
    if (v9 < v3)
    {
      v13 = *(double *)(v10 + 112 * v9 + 104);
      v14 = *(double *)(v10 + 112 * v12 + 104);
      v9 = v12 + 2;
      if (v12 + 2 < v3)
      {
        v15 = (double *)(v10 + 328 + 112 * v12);
        v16 = v13;
        while (1)
        {
          v17 = v16;
          v16 = *v15;
          if (v14 < v13 == v17 >= *v15)
            break;
          ++v9;
          v15 += 14;
          if (v3 == v9)
          {
            v9 = v3;
            break;
          }
        }
      }
      if (v14 < v13)
      {
        if (v9 < v12)
          goto LABEL_140;
        if (v12 < v9)
        {
          v18 = 112 * v9;
          v19 = v9;
          v20 = v12;
          v122 = v12;
          v21 = 112 * v12;
          do
          {
            if (v20 != --v19)
            {
              if (!v10)
                goto LABEL_146;
              v22 = v10 + v18;
              v23 = *(_QWORD *)(v10 + v21 + 80);
              v24 = *(_QWORD *)(v10 + v21 + 88);
              v132 = *(_BYTE *)(v10 + v21 + 96);
              v25 = *(_QWORD *)(v10 + v21 + 104);
              v130 = *(_OWORD *)(v10 + v21 + 16);
              v131 = *(_OWORD *)(v10 + v21);
              v128 = *(_OWORD *)(v10 + v21 + 48);
              v129 = *(_OWORD *)(v10 + v21 + 32);
              v127 = *(_OWORD *)(v10 + v21 + 64);
              memmove((void *)(v10 + v21), (const void *)(v10 + v18 - 112), 0x70uLL);
              *(_OWORD *)(v22 - 112) = v131;
              *(_OWORD *)(v22 - 96) = v130;
              *(_OWORD *)(v22 - 80) = v129;
              *(_OWORD *)(v22 - 64) = v128;
              *(_OWORD *)(v22 - 48) = v127;
              *(_QWORD *)(v22 - 32) = v23;
              *(_QWORD *)(v22 - 24) = v24;
              *(_BYTE *)(v22 - 16) = v132;
              *(_QWORD *)(v22 - 8) = v25;
            }
            ++v20;
            v18 -= 112;
            v21 += 112;
          }
          while (v20 < v19);
          v3 = v126;
          v12 = v122;
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_39;
    if (__OFSUB__(v9, v12))
      goto LABEL_138;
    if (v9 - v12 >= v125)
      goto LABEL_39;
    v26 = v12 + v125;
    if (__OFADD__(v12, v125))
      goto LABEL_141;
    if (v26 >= v3)
      v26 = v3;
    if (v26 < v12)
      break;
    if (v9 != v26)
    {
      v77 = v10 - 8 + 112 * v9;
      v27 = v134;
      do
      {
        v78 = *(double *)(v10 + 112 * v9 + 104);
        v79 = v12;
        v80 = v77;
        do
        {
          if (*(double *)v80 >= v78)
            break;
          if (!v10)
            goto LABEL_144;
          v81 = v80 + 8;
          v82 = *(_QWORD *)(v80 + 88);
          v83 = *(_QWORD *)(v80 + 96);
          v84 = *(_BYTE *)(v80 + 104);
          v85 = *(_OWORD *)(v80 + 8);
          v86 = *(_OWORD *)(v80 + 24);
          v87 = *(_OWORD *)(v80 + 40);
          v88 = *(_OWORD *)(v80 + 56);
          v89 = *(_OWORD *)(v80 + 72);
          v90 = *(_OWORD *)(v80 - 24);
          *(_OWORD *)(v80 + 72) = *(_OWORD *)(v80 - 40);
          *(_OWORD *)(v80 + 88) = v90;
          *(_OWORD *)(v80 + 104) = *(_OWORD *)(v80 - 8);
          v91 = *(_OWORD *)(v80 - 88);
          *(_OWORD *)(v80 + 8) = *(_OWORD *)(v80 - 104);
          *(_OWORD *)(v80 + 24) = v91;
          v93 = *(_OWORD *)(v80 - 72);
          v92 = *(_OWORD *)(v80 - 56);
          *(_OWORD *)(v80 - 104) = v85;
          *(_OWORD *)(v80 - 88) = v86;
          *(_OWORD *)(v80 - 72) = v87;
          *(_OWORD *)(v80 - 56) = v88;
          *(_OWORD *)(v80 - 40) = v89;
          *(_QWORD *)(v80 - 24) = v82;
          *(_QWORD *)(v80 - 16) = v83;
          *(_BYTE *)(v80 - 8) = v84;
          *(double *)v80 = v78;
          v80 -= 112;
          ++v79;
          *(_OWORD *)(v81 + 32) = v93;
          *(_OWORD *)(v81 + 48) = v92;
        }
        while (v9 != v79);
        ++v9;
        v77 += 112;
      }
      while (v9 != v26);
      v9 = v26;
      if (v26 < v12)
        goto LABEL_133;
      goto LABEL_40;
    }
LABEL_39:
    v27 = v134;
    if (v9 < v12)
      goto LABEL_133;
LABEL_40:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v27 = sub_236A64D44(0, *((_QWORD *)v27 + 2) + 1, 1, v27);
    v29 = *((_QWORD *)v27 + 2);
    v28 = *((_QWORD *)v27 + 3);
    v11 = v29 + 1;
    if (v29 >= v28 >> 1)
      v27 = sub_236A64D44((char *)(v28 > 1), v29 + 1, 1, v27);
    *((_QWORD *)v27 + 2) = v11;
    v30 = v27 + 32;
    v31 = &v27[16 * v29 + 32];
    *(_QWORD *)v31 = v12;
    *((_QWORD *)v31 + 1) = v9;
    v134 = v27;
    if (v29)
    {
      while (1)
      {
        v32 = v11 - 1;
        if (v11 >= 4)
        {
          v37 = &v30[16 * v11];
          v38 = *((_QWORD *)v37 - 8);
          v39 = *((_QWORD *)v37 - 7);
          v43 = __OFSUB__(v39, v38);
          v40 = v39 - v38;
          if (v43)
            goto LABEL_122;
          v42 = *((_QWORD *)v37 - 6);
          v41 = *((_QWORD *)v37 - 5);
          v43 = __OFSUB__(v41, v42);
          v35 = v41 - v42;
          v36 = v43;
          if (v43)
            goto LABEL_123;
          v44 = v11 - 2;
          v45 = &v30[16 * v11 - 32];
          v47 = *(_QWORD *)v45;
          v46 = *((_QWORD *)v45 + 1);
          v43 = __OFSUB__(v46, v47);
          v48 = v46 - v47;
          if (v43)
            goto LABEL_125;
          v43 = __OFADD__(v35, v48);
          v49 = v35 + v48;
          if (v43)
            goto LABEL_128;
          if (v49 >= v40)
          {
            v67 = &v30[16 * v32];
            v69 = *(_QWORD *)v67;
            v68 = *((_QWORD *)v67 + 1);
            v43 = __OFSUB__(v68, v69);
            v70 = v68 - v69;
            if (v43)
              goto LABEL_132;
            v60 = v35 < v70;
            goto LABEL_76;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v61 = *((_QWORD *)v27 + 4);
            v62 = *((_QWORD *)v27 + 5);
            v43 = __OFSUB__(v62, v61);
            v54 = v62 - v61;
            v55 = v43;
            goto LABEL_70;
          }
          v34 = *((_QWORD *)v27 + 4);
          v33 = *((_QWORD *)v27 + 5);
          v43 = __OFSUB__(v33, v34);
          v35 = v33 - v34;
          v36 = v43;
        }
        if ((v36 & 1) != 0)
          goto LABEL_124;
        v44 = v11 - 2;
        v50 = &v30[16 * v11 - 32];
        v52 = *(_QWORD *)v50;
        v51 = *((_QWORD *)v50 + 1);
        v53 = __OFSUB__(v51, v52);
        v54 = v51 - v52;
        v55 = v53;
        if (v53)
          goto LABEL_127;
        v56 = &v30[16 * v32];
        v58 = *(_QWORD *)v56;
        v57 = *((_QWORD *)v56 + 1);
        v43 = __OFSUB__(v57, v58);
        v59 = v57 - v58;
        if (v43)
          goto LABEL_130;
        if (__OFADD__(v54, v59))
          goto LABEL_131;
        if (v54 + v59 >= v35)
        {
          v60 = v35 < v59;
LABEL_76:
          if (v60)
            v32 = v44;
          goto LABEL_78;
        }
LABEL_70:
        if ((v55 & 1) != 0)
          goto LABEL_126;
        v63 = &v30[16 * v32];
        v65 = *(_QWORD *)v63;
        v64 = *((_QWORD *)v63 + 1);
        v43 = __OFSUB__(v64, v65);
        v66 = v64 - v65;
        if (v43)
          goto LABEL_129;
        if (v66 < v54)
          goto LABEL_15;
LABEL_78:
        v71 = v32 - 1;
        if (v32 - 1 >= v11)
        {
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (!v10)
          goto LABEL_145;
        v72 = &v30[16 * v71];
        v73 = *(_QWORD *)v72;
        v74 = &v30[16 * v32];
        v75 = *((_QWORD *)v74 + 1);
        sub_236A523F8((double *)(v10 + 112 * *(_QWORD *)v72), (double *)(v10 + 112 * *(_QWORD *)v74), v10 + 112 * v75, v133);
        if (v1)
          goto LABEL_95;
        if (v75 < v73)
          goto LABEL_119;
        if (v32 > *((_QWORD *)v134 + 2))
          goto LABEL_120;
        *(_QWORD *)v72 = v73;
        *(_QWORD *)&v30[16 * v71 + 8] = v75;
        v76 = *((_QWORD *)v134 + 2);
        if (v32 >= v76)
          goto LABEL_121;
        v27 = v134;
        v11 = v76 - 1;
        memmove(&v30[16 * v32], v74 + 16, 16 * (v76 - 1 - v32));
        *((_QWORD *)v134 + 2) = v76 - 1;
        if (v76 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v126;
    if (v9 >= v126)
    {
      v8 = v124;
      v114 = v134;
      v2 = v123;
      goto LABEL_105;
    }
  }
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  result = sub_236A6E06C();
  __break(1u);
  return result;
}

uint64_t sub_236A523F8(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double *v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  uint64_t result;
  char *v21;
  double *v22;
  double *v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = (char *)__src - (char *)__dst;
  v9 = ((char *)__src - (char *)__dst) / 112;
  v10 = a3 - (_QWORD)__src;
  v11 = (uint64_t)(a3 - (_QWORD)__src) / 112;
  v23 = __dst;
  v22 = a4;
  if (v9 >= v11)
  {
    if (v10 >= -111)
    {
      if (a4 != __src || &__src[14 * v11] <= a4)
        memmove(a4, __src, 112 * v11);
      v16 = &v4[14 * v11];
      v21 = (char *)v16;
      v23 = v6;
      if (v7 < v6 && v10 >= 112)
      {
        v17 = (double *)(a3 - 112);
        do
        {
          v18 = v17 + 14;
          if (*(v6 - 1) >= *(v16 - 1))
          {
            v21 = (char *)(v16 - 14);
            if (v18 < v16 || v17 >= v16 || v18 != v16)
              memmove(v17, v16 - 14, 0x70uLL);
            v19 = v6;
            v16 -= 14;
            if (v6 <= v7)
              break;
          }
          else
          {
            v19 = v6 - 14;
            if (v18 != v6 || v17 >= v6)
              memmove(v17, v6 - 14, 0x70uLL);
            v23 = v6 - 14;
            if (v19 <= v7)
              break;
          }
          v17 -= 14;
          v6 = v19;
        }
        while (v16 > v4);
      }
LABEL_40:
      sub_236A64E3C((void **)&v23, (const void **)&v22, &v21);
      return 1;
    }
  }
  else if (v8 >= -111)
  {
    if (a4 != __dst || &__dst[14 * v9] <= a4)
      memmove(a4, __dst, 112 * v9);
    v12 = &v4[14 * v9];
    v21 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 112)
    {
      v13 = v4;
      while (1)
      {
        if (v13[13] >= v6[13])
        {
          v4 = v13 + 14;
          v15 = v13;
          v14 = v6;
          if (v7 == v13)
          {
            v13 += 14;
            if (v7 < v4)
              goto LABEL_18;
          }
          else
          {
            v13 += 14;
          }
        }
        else
        {
          v14 = v6 + 14;
          v15 = v6;
          if (v7 == v6 && v7 < v14)
            goto LABEL_18;
        }
        memmove(v7, v15, 0x70uLL);
LABEL_18:
        v7 += 14;
        if (v13 < v12)
        {
          v6 = v14;
          if ((unint64_t)v14 < a3)
            continue;
        }
        v22 = v4;
        v23 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

unint64_t sub_236A526B4(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;
  int64_t i;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  int64_t v32;
  _QWORD *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  int64_t v40;
  _BYTE v41[96];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332E0);
  v6 = sub_236A6E09C();
  v7 = (_QWORD *)v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v33 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v8 + 63) >> 6;
    v39 = v6 + 64;
    result = swift_retain();
    for (i = 0; ; i = v40)
    {
      if (v10)
      {
        v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v40 = i;
        v15 = v14 | (i << 6);
      }
      else
      {
        v16 = i + 1;
        if (__OFADD__(i, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v16 >= v32)
          goto LABEL_23;
        v17 = v33[v16];
        v18 = i + 1;
        if (!v17)
        {
          v18 = i + 2;
          if (i + 2 >= v32)
            goto LABEL_23;
          v17 = v33[v18];
          if (!v17)
          {
            v19 = i + 3;
            if (i + 3 >= v32)
            {
LABEL_23:
              swift_release();
              v3 = v31;
              if ((a2 & 1) != 0)
              {
                v30 = 1 << *(_BYTE *)(v5 + 32);
                if (v30 > 63)
                  bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v30;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v17 = v33[v19];
            if (!v17)
            {
              while (1)
              {
                v18 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_30;
                if (v18 >= v32)
                  goto LABEL_23;
                v17 = v33[v18];
                ++v19;
                if (v17)
                  goto LABEL_20;
              }
            }
            v18 = i + 3;
          }
        }
LABEL_20:
        v10 = (v17 - 1) & v17;
        v40 = v18;
        v15 = __clz(__rbit64(v17)) + (v18 << 6);
      }
      v20 = *(_QWORD *)(v5 + 48) + 104 * v15;
      v21 = *(_QWORD *)v20;
      v22 = *(_OWORD *)(v20 + 8);
      v23 = *(_OWORD *)(v20 + 24);
      v24 = *(_OWORD *)(v20 + 40);
      v25 = *(_OWORD *)(v20 + 56);
      v26 = *(_OWORD *)(v20 + 72);
      v27 = *(_QWORD *)(v20 + 88);
      v28 = *(_BYTE *)(v20 + 96);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v15);
      if ((a2 & 1) == 0)
      {
        v37 = *(_OWORD *)(v20 + 56);
        v38 = *(_OWORD *)(v20 + 72);
        v35 = *(_OWORD *)(v20 + 24);
        v36 = *(_OWORD *)(v20 + 40);
        v34 = *(_OWORD *)(v20 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v22 = v34;
        v23 = v35;
        v24 = v36;
        v25 = v37;
        v26 = v38;
      }
      *(_QWORD *)v41 = v21;
      *(_OWORD *)&v41[8] = v22;
      *(_OWORD *)&v41[24] = v23;
      *(_OWORD *)&v41[40] = v24;
      *(_OWORD *)&v41[56] = v25;
      *(_OWORD *)&v41[72] = v26;
      *(_QWORD *)&v41[88] = v27;
      sub_236A6E168();
      ATBiomeMediaItem.hash(into:)();
      sub_236A6E18C();
      result = sub_236A6DF94();
      *(_QWORD *)(v39 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      v13 = v7[6] + 104 * result;
      *(_OWORD *)(v13 + 64) = *(_OWORD *)&v41[64];
      *(_OWORD *)(v13 + 80) = *(_OWORD *)&v41[80];
      *(_BYTE *)(v13 + 96) = v28;
      *(_OWORD *)v13 = *(_OWORD *)v41;
      *(_OWORD *)(v13 + 16) = *(_OWORD *)&v41[16];
      *(_OWORD *)(v13 + 32) = *(_OWORD *)&v41[32];
      *(_OWORD *)(v13 + 48) = *(_OWORD *)&v41[48];
      *(_QWORD *)(v7[7] + 8 * result) = v29;
      ++v7[2];
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_236A52A14(uint64_t a1, char a2)
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
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D8);
  v36 = a2;
  v6 = sub_236A6E09C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
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
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_236A6E168();
    sub_236A6DE5C();
    result = sub_236A6E18C();
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
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
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

void *sub_236A52D28()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332E0);
  v29 = v0;
  v1 = *v0;
  v2 = sub_236A6E090();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v29 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v30 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    v26 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v11)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v26);
    ++v7;
    if (!v27)
    {
      v7 = v26 + 1;
      if (v26 + 1 >= v11)
        goto LABEL_26;
      v27 = *(_QWORD *)(v30 + 8 * v7);
      if (!v27)
        break;
    }
LABEL_25:
    v10 = (v27 - 1) & v27;
    v13 = __clz(__rbit64(v27)) + (v7 << 6);
LABEL_12:
    v14 = 104 * v13;
    v15 = *(_QWORD *)(v1 + 48) + 104 * v13;
    v16 = *(_QWORD *)(v15 + 88);
    v17 = *(_BYTE *)(v15 + 96);
    v18 = 8 * v13;
    v19 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + v18);
    v20 = *(_QWORD *)(v3 + 48) + v14;
    v21 = *(_OWORD *)(v15 + 8);
    v22 = *(_OWORD *)(v15 + 24);
    v23 = *(_OWORD *)(v15 + 40);
    v24 = *(_OWORD *)(v15 + 56);
    v25 = *(_OWORD *)(v15 + 72);
    *(_QWORD *)v20 = *(_QWORD *)v15;
    *(_OWORD *)(v20 + 8) = v21;
    *(_OWORD *)(v20 + 24) = v22;
    *(_OWORD *)(v20 + 40) = v23;
    *(_OWORD *)(v20 + 56) = v24;
    *(_OWORD *)(v20 + 72) = v25;
    *(_QWORD *)(v20 + 88) = v16;
    *(_BYTE *)(v20 + 96) = v17;
    *(_QWORD *)(*(_QWORD *)(v3 + 56) + v18) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v11)
    goto LABEL_26;
  v27 = *(_QWORD *)(v30 + 8 * v28);
  if (v27)
  {
    v7 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v7 >= v11)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v7);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_236A52F6C()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D8);
  v2 = *v0;
  v3 = sub_236A6E090();
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
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_236A53120(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_236A53198(a1, a2, a3, (_QWORD *)*v3, &qword_2564332E8, &qword_2564332F0);
  *v3 = result;
  return result;
}

uint64_t sub_236A5314C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_236A53344(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_236A53168(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_236A534AC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_236A53184(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_236A53198(a1, a2, a3, a4, &qword_2564332F8, &qword_256433300);
}

uint64_t sub_236A53198(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 112);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v15 = (unint64_t)(v13 + 4);
  v16 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v15 >= v16 + 112 * v11)
      memmove(v13 + 4, a4 + 4, 112 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 112 * v11 || v15 >= v16 + 112 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A53344(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
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
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A534AC(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332B0);
  v10 = *(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8);
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
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

_QWORD *sub_236A5368C(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD *v26;
  int64_t v27;
  uint64_t v28;

  v28 = a4 + 64;
  v4 = -1 << *(_BYTE *)(a4 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v9 = 0;
    v7 = 0;
LABEL_39:
    *result = a4;
    result[1] = v28;
    result[2] = ~v4;
    result[3] = v9;
    result[4] = v6;
    return (_QWORD *)v7;
  }
  v7 = a3;
  if (!a3)
  {
    v9 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v8 = a2;
  v25 = -1 << *(_BYTE *)(a4 + 32);
  v26 = result;
  v9 = 0;
  v10 = 0;
  v27 = (unint64_t)(63 - v4) >> 6;
  if (!v6)
    goto LABEL_9;
LABEL_8:
  v11 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v12 = v11 | (v9 << 6);
  while (1)
  {
    ++v10;
    v16 = *(_QWORD *)(a4 + 48) + 104 * v12;
    v17 = *(_QWORD *)(v16 + 88);
    v18 = *(_BYTE *)(v16 + 96);
    v19 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v12);
    v20 = *(_OWORD *)(v16 + 8);
    v21 = *(_OWORD *)(v16 + 24);
    v22 = *(_OWORD *)(v16 + 40);
    v23 = *(_OWORD *)(v16 + 56);
    v24 = *(_OWORD *)(v16 + 72);
    *(_QWORD *)v8 = *(_QWORD *)v16;
    *(_OWORD *)(v8 + 8) = v20;
    *(_OWORD *)(v8 + 24) = v21;
    *(_OWORD *)(v8 + 40) = v22;
    *(_OWORD *)(v8 + 56) = v23;
    *(_OWORD *)(v8 + 72) = v24;
    *(_QWORD *)(v8 + 88) = v17;
    *(_BYTE *)(v8 + 96) = v18;
    *(_QWORD *)(v8 + 104) = v19;
    if (v10 == v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v8 += 112;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_8;
LABEL_9:
    v13 = v9 + 1;
    if (__OFADD__(v9, 1))
      break;
    if (v13 >= v27)
      goto LABEL_33;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    if (!v14)
    {
      v9 += 2;
      if (v13 + 1 >= v27)
      {
        v6 = 0;
        v9 = v13;
      }
      else
      {
        v14 = *(_QWORD *)(v28 + 8 * v9);
        if (v14)
          goto LABEL_14;
        v15 = v13 + 2;
        if (v13 + 2 >= v27)
          goto LABEL_33;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (v14)
        {
LABEL_17:
          v13 = v15;
          goto LABEL_18;
        }
        v9 = v13 + 3;
        if (v13 + 3 < v27)
        {
          v14 = *(_QWORD *)(v28 + 8 * v9);
          if (v14)
          {
LABEL_14:
            v13 = v9;
            goto LABEL_18;
          }
          v15 = v13 + 4;
          if (v13 + 4 >= v27)
          {
LABEL_33:
            v6 = 0;
            goto LABEL_37;
          }
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
          {
            while (1)
            {
              v13 = v15 + 1;
              if (__OFADD__(v15, 1))
                goto LABEL_42;
              if (v13 >= v27)
              {
                v6 = 0;
                v9 = v27 - 1;
                goto LABEL_37;
              }
              v14 = *(_QWORD *)(v28 + 8 * v13);
              ++v15;
              if (v14)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v6 = 0;
        v9 = v13 + 2;
      }
LABEL_37:
      v7 = v10;
LABEL_38:
      v4 = v25;
      result = v26;
      goto LABEL_39;
    }
LABEL_18:
    v6 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v13 << 6);
    v9 = v13;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_236A53988@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v18;
  BOOL v20;
  char v21;

  v18 = result;
  v20 = a12 == 0x6C7070612E6D6F63 && a13 == 0xEF636973754D2E65;
  if (v20
    || (result = sub_236A6E0F0(), (result & 1) != 0)
    || a12 == 0xD000000000000029 && a13 == 0x8000000236A6F310)
  {
    if (!a2)
    {
      if (a12 != 0xD000000000000012 || a13 != 0x8000000236A6F340)
      {
        sub_236A6E0F0();
        if (a12 != 0xD000000000000010 || a13 != 0x8000000236A6F360)
        {
          result = sub_236A6E0F0();
          if (a12 == 0x6C7070612E6D6F63 && a13 == 0xEC00000076742E65)
            goto LABEL_72;
        }
        goto LABEL_52;
      }
      goto LABEL_36;
    }
  }
  else
  {
    result = sub_236A6E0F0();
    if ((result & 1) == 0 || !a2)
    {
LABEL_33:
      if (a12 != 0xD000000000000012 || a13 != 0x8000000236A6F340)
      {
LABEL_37:
        result = sub_236A6E0F0();
        if ((result & 1) == 0 || !a2)
        {
LABEL_49:
          if (a12 != 0xD000000000000010 || a13 != 0x8000000236A6F360)
          {
LABEL_53:
            result = sub_236A6E0F0();
            if ((result & 1) == 0 || !a2)
              goto LABEL_65;
            goto LABEL_55;
          }
          if (a2)
          {
LABEL_55:
            if (!v18 && a2 == 0xE000000000000000)
            {
              if (a12 == 0x6C7070612E6D6F63 && a13 == 0xEC00000076742E65)
                goto LABEL_69;
              goto LABEL_67;
            }
            result = sub_236A6E0F0();
            if ((result & 1) == 0 && a4 && (a3 || a4 != 0xE000000000000000))
            {
              result = sub_236A6E0F0();
              if ((result & 1) == 0)
              {
                v21 = 2;
                goto LABEL_73;
              }
            }
LABEL_65:
            if (a12 == 0x6C7070612E6D6F63 && a13 == 0xEC00000076742E65)
            {
LABEL_68:
              if (a2)
              {
LABEL_69:
                if (v18 || a2 != 0xE000000000000000)
                {
                  result = sub_236A6E0F0();
                  if ((result & 1) == 0)
                  {
                    v21 = 3;
                    goto LABEL_73;
                  }
                }
              }
LABEL_72:
              v21 = 4;
              goto LABEL_73;
            }
LABEL_67:
            result = sub_236A6E0F0();
            if ((result & 1) == 0)
              goto LABEL_72;
            goto LABEL_68;
          }
LABEL_52:
          result = sub_236A6E0F0();
          goto LABEL_72;
        }
LABEL_39:
        if (!v18 && a2 == 0xE000000000000000)
        {
          if (a12 != 0xD000000000000010 || a13 != 0x8000000236A6F360)
            goto LABEL_53;
          goto LABEL_55;
        }
        result = sub_236A6E0F0();
        if ((result & 1) == 0 && a4 && (a3 || a4 != 0xE000000000000000))
        {
          result = sub_236A6E0F0();
          if ((result & 1) == 0)
          {
            v21 = 1;
            goto LABEL_73;
          }
        }
        goto LABEL_49;
      }
      if (a2)
        goto LABEL_39;
LABEL_36:
      sub_236A6E0F0();
      goto LABEL_52;
    }
  }
  if (!v18 && a2 == 0xE000000000000000)
  {
    if (a12 == 0xD000000000000012 && a13 == 0x8000000236A6F340)
      goto LABEL_39;
    goto LABEL_37;
  }
  result = sub_236A6E0F0();
  if ((result & 1) != 0 || !a4 || !a3 && a4 == 0xE000000000000000)
    goto LABEL_33;
  result = sub_236A6E0F0();
  if ((result & 1) != 0 || !a6 || !a5 && a6 == 0xE000000000000000)
    goto LABEL_33;
  result = sub_236A6E0F0();
  v21 = 0;
  if ((result & 1) != 0)
    goto LABEL_33;
LABEL_73:
  *(_QWORD *)a9 = v18;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_QWORD *)(a9 + 64) = a10;
  *(_QWORD *)(a9 + 72) = a11;
  *(_QWORD *)(a9 + 80) = a12;
  *(_QWORD *)(a9 + 88) = a13;
  *(_BYTE *)(a9 + 96) = v21;
  return result;
}

BOOL _s15ArchetypeEngine16ATBiomeMediaItemV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5)
      return 0;
    if (*(_QWORD *)a1 != *(_QWORD *)a2 || v4 != v5)
    {
      v7 = sub_236A6E0F0();
      result = 0;
      if ((v7 & 1) == 0)
        return result;
    }
  }
  else if (v5)
  {
    return 0;
  }
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a2 + 24);
  if (v9)
  {
    if (!v10)
      return 0;
    if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16) || v9 != v10)
    {
      v11 = sub_236A6E0F0();
      result = 0;
      if ((v11 & 1) == 0)
        return result;
    }
  }
  else if (v10)
  {
    return 0;
  }
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a2 + 40);
  if (v12)
  {
    if (!v13)
      return 0;
    if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32) || v12 != v13)
    {
      v14 = sub_236A6E0F0();
      result = 0;
      if ((v14 & 1) == 0)
        return result;
    }
  }
  else if (v13)
  {
    return 0;
  }
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a2 + 56);
  if (v15)
  {
    if (!v16)
      return 0;
    if (*(_QWORD *)(a1 + 48) != *(_QWORD *)(a2 + 48) || v15 != v16)
    {
      v17 = sub_236A6E0F0();
      result = 0;
      if ((v17 & 1) == 0)
        return result;
    }
  }
  else if (v16)
  {
    return 0;
  }
  v18 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a2 + 72);
  if (v18)
  {
    if (v19)
    {
      if (*(_QWORD *)(a1 + 64) != *(_QWORD *)(a2 + 64) || v18 != v19)
      {
        v20 = sub_236A6E0F0();
        result = 0;
        if ((v20 & 1) == 0)
          return result;
      }
      goto LABEL_40;
    }
    return 0;
  }
  if (v19)
    return 0;
LABEL_40:
  if (*(_QWORD *)(a1 + 80) == *(_QWORD *)(a2 + 80) && *(_QWORD *)(a1 + 88) == *(_QWORD *)(a2 + 88))
    return *(unsigned __int8 *)(a1 + 96) == *(unsigned __int8 *)(a2 + 96);
  v21 = sub_236A6E0F0();
  result = 0;
  if ((v21 & 1) != 0)
    return *(unsigned __int8 *)(a1 + 96) == *(unsigned __int8 *)(a2 + 96);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FA55C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_236A540FC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t sub_236A54138()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236A54164(void *a1)
{
  uint64_t v1;

  return sub_236A4FC4C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_236A5416C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236A541B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 112 * a1 + 32;
    v6 = a3 + 112 * v4;
    if (v5 >= v6 || v5 + 112 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2564332F0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

void sub_236A542C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  _QWORD *v6;
  size_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v3 = a3 >> 1;
  v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
    goto LABEL_11;
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332F8);
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v4;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 112);
    if (v3 >= a2)
      goto LABEL_4;
    goto LABEL_10;
  }
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v3 < a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433300);
  swift_arrayInitWithCopy();
  if (__OFSUB__(0, a2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = v6[2];
  v9 = __OFADD__(a2, v8);
  v10 = a2 + v8;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
LABEL_15:
    __break(1u);
}

unint64_t sub_236A543E8()
{
  unint64_t result;

  result = qword_2564331F8;
  if (!qword_2564331F8)
  {
    result = MEMORY[0x23B7FA574](&protocol conformance descriptor for ATBiomeMediaType, &type metadata for ATBiomeMediaType);
    atomic_store(result, (unint64_t *)&qword_2564331F8);
  }
  return result;
}

unint64_t sub_236A54430()
{
  unint64_t result;

  result = qword_256433200;
  if (!qword_256433200)
  {
    result = MEMORY[0x23B7FA574](&protocol conformance descriptor for ATBiomeMediaItem, &type metadata for ATBiomeMediaItem);
    atomic_store(result, (unint64_t *)&qword_256433200);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ATBiomeMediaType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ATBiomeMediaType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_236A54560 + 4 * byte_236A6E73F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_236A54594 + 4 * byte_236A6E73A[v4]))();
}

uint64_t sub_236A54594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236A5459C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236A545A4);
  return result;
}

uint64_t sub_236A545B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236A545B8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_236A545BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236A545C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236A545D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_236A545D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATBiomeMediaType()
{
  return &type metadata for ATBiomeMediaType;
}

uint64_t initializeBufferWithCopyOfBuffer for ATBiomeMediaItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ATBiomeMediaItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATBiomeMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATBiomeMediaItem(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, __int128 *a2)
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
  v6 = a2[5];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ATBiomeMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for ATBiomeMediaItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 97))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ATBiomeMediaItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 97) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ATBiomeMediaItem()
{
  return &type metadata for ATBiomeMediaItem;
}

uint64_t type metadata accessor for ATBiomeDataRetriever()
{
  return objc_opt_self();
}

void type metadata accessor for BMMediaNowPlayingPlaybackState()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2564332A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2564332A8);
  }
}

uint64_t sub_236A549D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 112 * a1 + 32;
    v6 = a3 + 112 * v4;
    if (v5 >= v6 || v5 + 112 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A54AC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2564331D8) - 8);
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
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A54BE4(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = sub_236A6E078();
  result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    swift_bridgeObjectRetain();
    v9 = sub_236A6E078();
    result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v8 = sub_236A6E078();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_236A54D8C(0, &qword_2564332B8);
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      sub_236A6DFF4();
      v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v12 = sub_236A6E084();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_236A54D8C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_236A54DC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A54EB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 7) + 32;
    v6 = a3 + (v4 << 7);
    if (v5 >= v6 || v5 + (v4 << 7) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A54FA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A550BC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_236A550F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_236A5512C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_236A55168()
{
  return swift_release();
}

uint64_t sub_236A55170(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236A551AC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_236A55220(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t destroy for ATBiomeMediaRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATBiomeMediaRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATBiomeMediaRecord(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for ATBiomeMediaRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ATBiomeMediaRecord(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ATBiomeMediaRecord(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ATBiomeMediaRecord()
{
  return &type metadata for ATBiomeMediaRecord;
}

void ATAccessibilityError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

unint64_t sub_236A55624()
{
  sub_236A6DFDC();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  return 0xD00000000000002BLL;
}

void sub_236A5584C()
{
  swift_bridgeObjectRetain();
  JUMPOUT(0x236A55834);
}

uint64_t sub_236A5585C()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t))((char *)&loc_236A55834 + 4 * byte_236A6E9C8[v0]))(0xD000000000000023);
}

void sub_236A55890()
{
  JUMPOUT(0x236A55834);
}

unint64_t sub_236A55934()
{
  unint64_t result;

  result = qword_256433340;
  if (!qword_256433340)
  {
    result = MEMORY[0x23B7FA574](&protocol conformance descriptor for ATAccessibilityError, &type metadata for ATAccessibilityError);
    atomic_store(result, (unint64_t *)&qword_256433340);
  }
  return result;
}

void sub_236A55978()
{
  uint64_t v0;

  ATAccessibilityError.errorDescription.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_236A559A4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 6u && ((1 << a3) & 0x61) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for ATAccessibilityError(uint64_t a1)
{
  return sub_236A559E0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_236A559E0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 6u && ((1 << a3) & 0x61) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s15ArchetypeEngine20ATAccessibilityErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_236A559A4(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ATAccessibilityError(uint64_t a1, uint64_t a2)
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
  sub_236A559A4(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_236A559E0(v6, v7, v8);
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

uint64_t assignWithTake for ATAccessibilityError(uint64_t a1, uint64_t a2)
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
  sub_236A559E0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ATAccessibilityError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ATAccessibilityError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 249;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_236A55B8C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_236A55BA4(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(_QWORD *)result = a2 - 7;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATAccessibilityError()
{
  return &type metadata for ATAccessibilityError;
}

BOOL static ATSpotlightDataRecordType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t ATSpotlightDataRecordType.hash(into:)()
{
  return sub_236A6E174();
}

uint64_t ATSpotlightDataRecordType.hashValue.getter()
{
  sub_236A6E168();
  sub_236A6E174();
  return sub_236A6E18C();
}

uint64_t ATSpotlightDataRecord.recordType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ATSpotlightDataRecord.uniqueIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.content.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.content.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*ATSpotlightDataRecord.content.modify())()
{
  return nullsub_1;
}

uint64_t ATSpotlightDataRecord.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 28);
  v4 = sub_236A6DC64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for ATSpotlightDataRecord()
{
  uint64_t result;

  result = qword_2564333D8;
  if (!qword_2564333D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ATSpotlightDataRecord.lastUsedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 32);
  return sub_236A55D9C(v3, a1);
}

uint64_t sub_236A55D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ATSpotlightDataRecord.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 36);
  return sub_236A55D9C(v3, a1);
}

uint64_t ATSpotlightDataRecord.mailMessageID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.authors.getter()
{
  type metadata accessor for ATSpotlightDataRecord();
  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRecord.recipients.getter()
{
  type metadata accessor for ATSpotlightDataRecord();
  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRecord.additionalRecipients.getter()
{
  type metadata accessor for ATSpotlightDataRecord();
  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRecord.subject.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.mailLastViewedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 60);
  return sub_236A55D9C(v3, a1);
}

uint64_t ATSpotlightDataRecord.mailReceivedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 64);
  return sub_236A55D9C(v3, a1);
}

uint64_t ATSpotlightDataRecord.mailConversationId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 68));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.likelyJunk.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 72));
}

uint64_t ATSpotlightDataRecord.extendedContent.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.extendedContent.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ATSpotlightDataRecord.extendedContent.modify())()
{
  type metadata accessor for ATSpotlightDataRecord();
  return nullsub_1;
}

uint64_t ATSpotlightDataRecord.isGroupChat.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 80));
}

uint64_t ATSpotlightDataRecord.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 84));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 88));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.calendarType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 92));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.eventStart.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 96);
  return sub_236A55D9C(v3, a1);
}

uint64_t ATSpotlightDataRecord.eventEnd.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 100);
  return sub_236A55D9C(v3, a1);
}

uint64_t ATSpotlightDataRecord.isAllDayEvent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 104));
}

uint64_t ATSpotlightDataRecord.eventLocation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 108));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.comment.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 112));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.eventHasNavigationInfo.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 116));
}

uint64_t ATSpotlightDataRecord.genre.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 120));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.artist.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 124));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.composer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 128));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.album.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 132));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.init(item:bundleID:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t *v41;
  Swift::String v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(void);
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  int v62;
  uint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t, uint64_t);
  int v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t result;
  char v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  unsigned __int8 v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  int v89;
  id v90;
  void *v91;
  id v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  id v102;
  int v103;
  uint64_t v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int *v127;
  uint64_t *v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  uint64_t *v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  void *v139;
  id v140;
  char v141;
  id v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t *v147;
  id v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  id v155;
  id v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  id v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  id v166;
  id v167;
  uint64_t v168;
  id v169;
  id v170;
  unsigned __int8 v171;
  id v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  id v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t *v183;
  id v184;
  id v185;
  id v186;
  id v187;
  unsigned __int8 v188;
  id v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t *v195;
  id v196;
  id v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t *v201;
  id v202;
  id v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t *v207;
  id v208;
  id v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t *v213;
  uint64_t v214;
  int v215;
  char *v216;
  char *v217;
  uint64_t *v218;
  char *v219;
  char *v220;
  char *v221;
  char *v222;
  uint64_t v223;
  char *v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  void (*v228)(char *, uint64_t, uint64_t, uint64_t);
  int *v229;
  uint64_t v230;
  uint64_t v231;
  __int128 v232;
  __int128 v233;
  _BYTE v234[24];
  uint64_t v235;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v220 = (char *)&v214 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v219 = (char *)&v214 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v217 = (char *)&v214 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v216 = (char *)&v214 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v222 = (char *)&v214 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v214 = (uint64_t)&v214 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v221 = (char *)&v214 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v225 = (char *)&v214 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v214 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v214 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v214 - v31;
  v33 = sub_236A6DC64();
  v226 = *(_QWORD *)(v33 - 8);
  v227 = v33;
  v34 = MEMORY[0x24BDAC7A8](v33);
  v224 = (char *)&v214 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v214 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v214 - v39;
  v229 = (int *)type metadata accessor for ATSpotlightDataRecord();
  v41 = (uint64_t *)(a4 + v229[19]);
  *v41 = 0;
  v41[1] = 0;
  v218 = v41;
  v42._countAndFlagsBits = a2;
  v42._object = a3;
  LODWORD(a2) = bundleIDToRecordType(bundleID:)(v42);
  swift_bridgeObjectRelease();
  v215 = a2;
  *(_BYTE *)a4 = a2;
  v43 = objc_msgSend(a1, sel_attributeSet);
  v44 = objc_msgSend(v43, sel_uniqueIdentifier);

  if (v44)
  {
    v45 = sub_236A6DE38();
    v47 = v46;

  }
  else
  {
    v45 = 0;
    v47 = 0xE000000000000000;
  }
  *(_QWORD *)(a4 + 8) = v45;
  *(_QWORD *)(a4 + 16) = v47;
  v48 = objc_msgSend(a1, sel_attributeSet);
  v49 = objc_msgSend(v48, sel_contentSnippet);

  if (v49)
  {
    v50 = sub_236A6DE38();
    v52 = v51;

  }
  else
  {
    v50 = 0;
    v52 = 0xE000000000000000;
  }
  *(_QWORD *)(a4 + 24) = v50;
  *(_QWORD *)(a4 + 32) = v52;
  v53 = objc_msgSend(a1, sel_attributeSet);
  v54 = objc_msgSend(v53, sel_contentCreationDate);

  if (!v54)
  {
    v58 = v226;
    v55 = v227;
    v228 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v226 + 56);
    v228(v32, 1, 1, v227);
    goto LABEL_11;
  }
  sub_236A6DC40();

  v56 = v226;
  v55 = v227;
  v57 = *(void (**)(void))(v226 + 32);
  ((void (*)(char *, char *, uint64_t))v57)(v32, v38, v227);
  v228 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
  v228(v32, 0, 1, v55);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v32, 1, v55) == 1)
  {
    v58 = v226;
LABEL_11:
    sub_236A6DC58();
    sub_236A6DC04();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v38, v55);
    sub_236A55170((uint64_t)v32, &qword_2564331E0);
    v57 = *(void (**)(void))(v58 + 32);
    goto LABEL_13;
  }
  ((void (*)(char *, char *, uint64_t))v57)(v40, v32, v55);
LABEL_13:
  v223 = a4 + v229[7];
  v57();
  v59 = objc_msgSend(a1, sel_attributeSet);
  v60 = v55;
  v61 = objc_msgSend(v59, sel_lastUsedDate);

  if (v61)
  {
    sub_236A6DC40();

    ((void (*)(char *, char *, uint64_t))v57)(v27, v38, v60);
    v228(v27, 0, 1, v60);
    v62 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v226 + 48))(v27, 1, v60);
    v63 = (uint64_t)v225;
    if (v62 != 1)
    {
      ((void (*)(char *, char *, uint64_t))v57)(v30, v27, v60);
      goto LABEL_18;
    }
  }
  else
  {
    v228(v27, 1, 1, v60);
    v63 = (uint64_t)v225;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v226 + 16))(v30, v223, v60);
  sub_236A55170((uint64_t)v27, &qword_2564331E0);
LABEL_18:
  v228(v30, 0, 1, v60);
  sub_236A55220((uint64_t)v30, a4 + v229[8], &qword_2564331E0);
  v64 = objc_msgSend(a1, sel_attributeSet);
  v65 = objc_msgSend(v64, sel_attributeForKey_, *MEMORY[0x24BDC1A98]);

  if (v65)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  v66 = v227;
  if (v235)
  {
    v67 = swift_dynamicCast() ^ 1;
    v68 = v63;
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v68 = v63;
    v67 = 1;
  }
  v228((char *)v68, v67, 1, v66);
  v69 = objc_msgSend(a1, sel_attributeSet);
  v70 = objc_msgSend(v69, sel_contentModificationDate);

  v71 = (uint64_t)v221;
  if (!v70)
  {
    v72 = v227;
    v228(v221, 1, 1, v227);
    v75 = v224;
    v76 = (uint64_t)v222;
    goto LABEL_28;
  }
  sub_236A6DC40();

  v72 = v227;
  ((void (*)(uint64_t, char *, uint64_t))v57)(v71, v38, v227);
  v228((char *)v71, 0, 1, v72);
  v73 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v226 + 48);
  v74 = v73(v71, 1, v72);
  v75 = v224;
  v76 = (uint64_t)v222;
  if (v74 == 1)
  {
LABEL_28:
    v77 = v226;
    (*(void (**)(char *, uint64_t, uint64_t))(v226 + 16))(v75, v223, v72);
    sub_236A55170(v71, &qword_2564331E0);
    v73 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v77 + 48);
    goto LABEL_29;
  }
  ((void (*)(char *, uint64_t, uint64_t))v57)(v224, v71, v72);
  v77 = v226;
LABEL_29:
  if (v73(v63, 1, v72) == 1)
    goto LABEL_33;
  sub_236A55D9C(v63, v76);
  result = v73(v76, 1, v72);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    return result;
  }
  v79 = sub_236A6DC28();
  (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v72);
  if ((v79 & 1) == 0)
  {
LABEL_33:
    v80 = v214;
    (*(void (**)(uint64_t, char *, uint64_t))(v77 + 16))(v214, v75, v72);
    v228((char *)v80, 0, 1, v72);
  }
  else
  {
    v80 = v214;
    sub_236A55D9C(v63, v214);
  }
  sub_236A55220(v80, a4 + v229[9], &qword_2564331E0);
  v81 = objc_msgSend(a1, sel_attributeSet);
  v82 = (void *)sub_236A6DE2C();
  v83 = objc_msgSend(v81, sel_attributeForKey_, v82);

  if (v83)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  v84 = v215;
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    v85 = swift_dynamicCast();
    v86 = v230;
    v87 = v231;
    if (!v85)
    {
      v86 = 0;
      v87 = 0;
    }
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v86 = 0;
    v87 = 0;
  }
  v88 = (uint64_t *)(a4 + v229[10]);
  *v88 = v86;
  v88[1] = v87;
  v89 = v84;
  v90 = objc_msgSend(a1, sel_attributeSet);
  v91 = v90;
  if (v89 != 5)
  {
    v94 = objc_msgSend(v90, sel_authorNames);

    if (v94)
    {
      v95 = sub_236A6DEA4();

    }
    else
    {
      v95 = 0;
    }
    *(_QWORD *)(a4 + v229[11]) = v95;
    v98 = objc_msgSend(a1, sel_attributeSet);
    v99 = objc_msgSend(v98, sel_recipientNames);

    if (v99)
    {
      v100 = sub_236A6DEA4();

      goto LABEL_59;
    }
LABEL_58:
    v100 = 0;
    goto LABEL_59;
  }
  v92 = objc_msgSend(v90, sel_authorEmailAddresses);

  if (v92)
  {
    v93 = sub_236A6DEA4();

  }
  else
  {
    v93 = 0;
  }
  *(_QWORD *)(a4 + v229[11]) = v93;
  v96 = objc_msgSend(a1, sel_attributeSet);
  v97 = objc_msgSend(v96, sel_attributeForKey_, *MEMORY[0x24BDC20E8]);

  if (v97)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (!v235)
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    goto LABEL_58;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
  if (swift_dynamicCast())
    v100 = v230;
  else
    v100 = 0;
LABEL_59:
  *(_QWORD *)(a4 + v229[12]) = v100;
  v101 = objc_msgSend(a1, sel_attributeSet);
  v102 = objc_msgSend(v101, sel_attributeForKey_, *MEMORY[0x24BDC19F8]);

  if (v102)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
    v103 = swift_dynamicCast();
    v104 = v230;
    if (!v103)
      v104 = 0;
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v104 = 0;
  }
  *(_QWORD *)(a4 + v229[13]) = v104;
  v105 = objc_msgSend(a1, sel_attributeSet);
  v106 = objc_msgSend(v105, sel_subject);

  if (v106)
  {
    v107 = sub_236A6DE38();
    v109 = v108;

  }
  else
  {
    v107 = 0;
    v109 = 0;
  }
  v110 = v227;
  v111 = (uint64_t *)(a4 + v229[14]);
  *v111 = v107;
  v111[1] = v109;
  v112 = objc_msgSend(a1, sel_attributeSet);
  v113 = objc_msgSend(v112, sel_attributeForKey_, *MEMORY[0x24BDC2330]);

  if (v113)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  v114 = (uint64_t)v216;
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    v115 = swift_dynamicCast() ^ 1;
    v116 = v114;
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v116 = v114;
    v115 = 1;
  }
  v228((char *)v116, v115, 1, v110);
  sub_236A55220(v114, a4 + v229[15], &qword_2564331E0);
  v117 = objc_msgSend(a1, sel_attributeSet);
  v118 = objc_msgSend(v117, sel_attributeForKey_, *MEMORY[0x24BDC2338]);

  if (v118)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  v119 = (uint64_t)v217;
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    v120 = swift_dynamicCast() ^ 1;
    v121 = v119;
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v121 = v119;
    v120 = 1;
  }
  v228((char *)v121, v120, 1, v110);
  sub_236A55220(v119, a4 + v229[16], &qword_2564331E0);
  v122 = objc_msgSend(a1, sel_attributeSet);
  v123 = objc_msgSend(v122, sel_mailConversationID);

  if (v123)
  {
    v124 = sub_236A6DE38();
    v126 = v125;

  }
  else
  {
    v124 = 0;
    v126 = 0;
  }
  v127 = v229;
  v128 = (uint64_t *)(a4 + v229[17]);
  *v128 = v124;
  v128[1] = v126;
  v129 = objc_msgSend(a1, sel_attributeSet);
  v130 = objc_msgSend(v129, sel_isLikelyJunk);

  LOBYTE(v129) = objc_msgSend(v130, sel_BOOLValue);
  *(_BYTE *)(a4 + v127[18]) = (_BYTE)v129;
  v131 = objc_msgSend(a1, sel_attributeSet);
  v132 = (void *)sub_236A6DE2C();
  v133 = objc_msgSend(v131, sel_attributeForKey_, v132);

  if (v133)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  v134 = v218;
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    v135 = swift_dynamicCast();
    if (v135)
      v136 = v230;
    else
      v136 = 0;
    if (v135)
      v137 = v231;
    else
      v137 = 0;
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v136 = 0;
    v137 = 0;
  }
  swift_bridgeObjectRelease();
  *v134 = v136;
  v134[1] = v137;
  v138 = objc_msgSend(a1, sel_attributeSet);
  v139 = (void *)sub_236A6DE2C();
  v140 = objc_msgSend(v138, sel_attributeForKey_, v139);

  if (v140)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    if (swift_dynamicCast())
      v141 = v230;
    else
      v141 = 2;
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v141 = 2;
  }
  *(_BYTE *)(a4 + v229[20]) = v141;
  v142 = objc_msgSend(a1, sel_attributeSet);
  v143 = objc_msgSend(v142, sel_title);

  if (v143)
  {
    v144 = sub_236A6DE38();
    v146 = v145;

  }
  else
  {
    v144 = 0;
    v146 = 0;
  }
  v147 = (uint64_t *)(a4 + v229[21]);
  *v147 = v144;
  v147[1] = v146;
  v148 = objc_msgSend(a1, sel_attributeSet);
  v149 = objc_msgSend(v148, sel_displayName);

  if (v149)
  {
    v150 = sub_236A6DE38();
    v152 = v151;

  }
  else
  {
    v150 = 0;
    v152 = 0;
  }
  v153 = v227;
  v154 = (uint64_t *)(a4 + v229[22]);
  *v154 = v150;
  v154[1] = v152;
  v155 = objc_msgSend(a1, sel_attributeSet);
  v156 = objc_msgSend(v155, sel_attributeForKey_, *MEMORY[0x24BDC1B48]);

  if (v156)
  {
    sub_236A6DF88();
    swift_unknownObjectRelease();
  }
  else
  {
    v232 = 0u;
    v233 = 0u;
  }
  sub_236A55220((uint64_t)&v232, (uint64_t)v234, &qword_256433308);
  if (v235)
  {
    v157 = swift_dynamicCast();
    v158 = v230;
    v159 = v231;
    if (!v157)
    {
      v158 = 0;
      v159 = 0;
    }
  }
  else
  {
    sub_236A55170((uint64_t)v234, &qword_256433308);
    v158 = 0;
    v159 = 0;
  }
  v160 = (uint64_t *)(a4 + v229[23]);
  *v160 = v158;
  v160[1] = v159;
  v161 = objc_msgSend(a1, sel_attributeSet);
  v162 = objc_msgSend(v161, sel_startDate);

  if (v162)
  {
    v163 = (uint64_t)v219;
    sub_236A6DC40();

    v164 = 0;
  }
  else
  {
    v164 = 1;
    v163 = (uint64_t)v219;
  }
  v165 = 1;
  v228((char *)v163, v164, 1, v153);
  sub_236A55220(v163, a4 + v229[24], &qword_2564331E0);
  v166 = objc_msgSend(a1, sel_attributeSet);
  v167 = objc_msgSend(v166, sel_endDate);

  v168 = (uint64_t)v220;
  if (v167)
  {
    sub_236A6DC40();

    v165 = 0;
  }
  v228((char *)v168, v165, 1, v227);
  sub_236A55220(v168, a4 + v229[25], &qword_2564331E0);
  v169 = objc_msgSend(a1, sel_attributeSet);
  v170 = objc_msgSend(v169, sel_allDay);

  if (v170)
  {
    v171 = objc_msgSend(v170, sel_BOOLValue);

  }
  else
  {
    v171 = 2;
  }
  *(_BYTE *)(a4 + v229[26]) = v171;
  v172 = objc_msgSend(a1, sel_attributeSet);
  v173 = objc_msgSend(v172, sel_namedLocation);

  if (v173)
  {
    v174 = sub_236A6DE38();
    v176 = v175;

  }
  else
  {
    v174 = 0;
    v176 = 0;
  }
  v177 = (uint64_t *)(a4 + v229[27]);
  *v177 = v174;
  v177[1] = v176;
  v178 = objc_msgSend(a1, sel_attributeSet);
  v179 = objc_msgSend(v178, sel_comment);

  if (v179)
  {
    v180 = sub_236A6DE38();
    v182 = v181;

  }
  else
  {
    v180 = 0;
    v182 = 0;
  }
  v183 = (uint64_t *)(a4 + v229[28]);
  *v183 = v180;
  v183[1] = v182;
  v184 = objc_msgSend(a1, sel_attributeSet);
  v185 = objc_msgSend(v184, sel_supportsNavigation);

  if (v185
    && (v186 = objc_msgSend(a1, sel_attributeSet),
        v187 = objc_msgSend(v186, sel_supportsNavigation),
        v186,
        v187))
  {
    v188 = objc_msgSend(v187, sel_BOOLValue);

  }
  else
  {
    v188 = 2;
  }
  *(_BYTE *)(a4 + v229[29]) = v188;
  v189 = objc_msgSend(a1, sel_attributeSet);
  v190 = objc_msgSend(v189, sel_genre);

  v191 = (uint64_t)v225;
  if (v190)
  {
    v192 = sub_236A6DE38();
    v194 = v193;

  }
  else
  {
    v192 = 0;
    v194 = 0;
  }
  v195 = (uint64_t *)(a4 + v229[30]);
  *v195 = v192;
  v195[1] = v194;
  v196 = objc_msgSend(a1, sel_attributeSet);
  v197 = objc_msgSend(v196, sel_artist);

  if (v197)
  {
    v198 = sub_236A6DE38();
    v200 = v199;

  }
  else
  {
    v198 = 0;
    v200 = 0;
  }
  v201 = (uint64_t *)(a4 + v229[31]);
  *v201 = v198;
  v201[1] = v200;
  v202 = objc_msgSend(a1, sel_attributeSet);
  v203 = objc_msgSend(v202, sel_composer);

  if (v203)
  {
    v204 = sub_236A6DE38();
    v206 = v205;

  }
  else
  {
    v204 = 0;
    v206 = 0;
  }
  v207 = (uint64_t *)(a4 + v229[32]);
  *v207 = v204;
  v207[1] = v206;
  v208 = objc_msgSend(a1, sel_attributeSet);
  v209 = objc_msgSend(v208, sel_composer);

  if (v209)
  {
    v210 = sub_236A6DE38();
    v212 = v211;

  }
  else
  {

    v210 = 0;
    v212 = 0;
  }
  (*(void (**)(char *, uint64_t))(v77 + 8))(v224, v227);
  v213 = (uint64_t *)(a4 + v229[33]);
  *v213 = v210;
  v213[1] = v212;
  return sub_236A55170(v191, &qword_2564331E0);
}

ArchetypeEngine::ATSpotlightDataRecordType __swiftcall bundleIDToRecordType(bundleID:)(Swift::String bundleID)
{
  void *object;
  uint64_t countAndFlagsBits;
  ArchetypeEngine::ATSpotlightDataRecordType v3;

  object = bundleID._object;
  countAndFlagsBits = bundleID._countAndFlagsBits;
  if (bundleID._countAndFlagsBits == 0xD000000000000013 && bundleID._object == (void *)0x8000000236A6F650
    || (sub_236A6E0F0() & 1) != 0)
  {
    return 4;
  }
  if (countAndFlagsBits == 0xD000000000000014 && object == (void *)0x8000000236A6F0E0 || (sub_236A6E0F0() & 1) != 0)
    return 5;
  if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x8000000236A6F670 || (sub_236A6E0F0() & 1) != 0)
    return 3;
  if (countAndFlagsBits == 0xD000000000000015 && object == (void *)0x8000000236A6F690 || (sub_236A6E0F0() & 1) != 0)
    return 1;
  if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x8000000236A6F0C0)
    return 0;
  v3 = ArchetypeEngine_ATSpotlightDataRecordType_SpotlightCalendarRecord;
  if ((sub_236A6E0F0() & 1) == 0)
  {
    v3 = ArchetypeEngine_ATSpotlightDataRecordType_SpotlightMusicRecord;
    if (countAndFlagsBits != 0x6C7070612E6D6F63 || object != (void *)0xEF636973754D2E65)
    {
      if ((sub_236A6E0F0() & 1) != 0)
        return 2;
      else
        return 6;
    }
  }
  return v3;
}

uint64_t static ATSpotlightDataRecord.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
    return 1;
  else
    return sub_236A6E0F0();
}

uint64_t ATSpotlightDataRecord.description.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  int v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _OWORD v25[3];
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_236A6DC64();
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v20 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_236A6E1B0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = 0xD00000000000003DLL;
  v31 = 0x8000000236A6F710;
  v26 = 0;
  v27 = 0xE000000000000000;
  sub_236A6DE74();
  LOBYTE(v25[0]) = *v0;
  sub_236A6E060();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  *((_QWORD *)&v28 + 1) = type metadata accessor for ATSpotlightDataRecord();
  v10 = __swift_allocate_boxed_opaque_existential_0(&v26);
  sub_236A5945C((uint64_t)v0, (uint64_t)v10);
  sub_236A6E198();
  sub_236A6E1A4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_236A6E054();
  swift_release();
  swift_retain();
  sub_236A6E0C0();
  sub_236A55220((uint64_t)v25, (uint64_t)&v26, &qword_256433350);
  if (!v29)
  {
LABEL_19:
    swift_release_n();
    sub_236A6DE74();
    return v30;
  }
  while (1)
  {
    v11 = v27;
    sub_236A594A0(&v28, v25);
    sub_236A550F0((uint64_t)v25, (uint64_t)&v23);
    if (swift_dynamicCast())
      break;
    sub_236A550F0((uint64_t)v25, (uint64_t)&v23);
    if (swift_dynamicCast())
    {
      v23 = 0;
      v24 = 0xE000000000000000;
      if (!v11)
        goto LABEL_21;
      goto LABEL_4;
    }
    sub_236A550F0((uint64_t)v25, (uint64_t)&v23);
    v12 = swift_dynamicCast();
    v13 = v21;
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    if (!v12)
    {
      v14(v3, 1, 1, v4);
LABEL_13:
      sub_236A55170((uint64_t)v3, &qword_2564331E0);
      sub_236A550F0((uint64_t)v25, (uint64_t)&v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v17 = v22;
        v23 = 0;
        v24 = 0xE000000000000000;
        if (!v11)
          goto LABEL_22;
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        sub_236A6DE74();
        MEMORY[0x23B7F9ED8](v17, MEMORY[0x24BEE0D00]);
        sub_236A6DE74();
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        sub_236A6DE74();
        sub_236A6DE74();
      }
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    v14(v3, 0, 1, v4);
    v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v3, 1, v4);
    v16 = v20;
    if (v15 == 1)
      goto LABEL_13;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v3, v4);
    v23 = 0;
    v24 = 0xE000000000000000;
    if (!v11)
      goto LABEL_23;
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    sub_236A5B8A4(&qword_256433358, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    sub_236A6E0D8();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v4);
LABEL_18:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
    sub_236A6E0C0();
    sub_236A55220((uint64_t)v25, (uint64_t)&v26, &qword_256433350);
    if (!v29)
      goto LABEL_19;
  }
  v23 = 0;
  v24 = 0xE000000000000000;
  if (v11)
  {
LABEL_4:
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    sub_236A6DE74();
    goto LABEL_16;
  }
  swift_release();
  __break(1u);
LABEL_21:
  swift_release();
  __break(1u);
LABEL_22:
  swift_release();
  __break(1u);
LABEL_23:
  result = swift_release();
  __break(1u);
  return result;
}

BOOL sub_236A582F0(uint64_t a1, uint64_t a2)
{
  return (_s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(a2, a1) & 1) == 0;
}

BOOL sub_236A58318(uint64_t a1, uint64_t a2)
{
  return (_s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(a1, a2) & 1) == 0;
}

uint64_t sub_236A58334(uint64_t a1, uint64_t a2)
{
  return _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(a2, a1);
}

uint64_t sub_236A58348(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
    return 1;
  else
    return sub_236A6E0F0();
}

void *ATBundleID.messages.unsafeMutableAddressor()
{
  return &static ATBundleID.messages;
}

unint64_t static ATBundleID.messages.getter()
{
  return 0xD000000000000013;
}

void *ATBundleID.mail.unsafeMutableAddressor()
{
  return &static ATBundleID.mail;
}

unint64_t static ATBundleID.mail.getter()
{
  return 0xD000000000000014;
}

void *ATBundleID.reminders.unsafeMutableAddressor()
{
  return &static ATBundleID.reminders;
}

unint64_t static ATBundleID.reminders.getter()
{
  return 0xD000000000000013;
}

void *ATBundleID.notes.unsafeMutableAddressor()
{
  return &static ATBundleID.notes;
}

unint64_t static ATBundleID.notes.getter()
{
  return 0xD000000000000015;
}

void *ATBundleID.calendar.unsafeMutableAddressor()
{
  return &static ATBundleID.calendar;
}

unint64_t static ATBundleID.calendar.getter()
{
  return 0xD000000000000013;
}

void *ATBundleID.music.unsafeMutableAddressor()
{
  return &static ATBundleID.music;
}

uint64_t static ATBundleID.music.getter()
{
  return 0x6C7070612E6D6F63;
}

uint64_t ATBundleID.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ATBundleID.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_236A58488(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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

  if (a1 == 0xD000000000000013 && a2 == 0x8000000236A6F650 || (sub_236A6E0F0() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_236A6EAC0;
    *(_QWORD *)(v5 + 32) = sub_236A6DE38();
    *(_QWORD *)(v5 + 40) = v6;
    *(_QWORD *)(v5 + 48) = sub_236A6DE38();
    *(_QWORD *)(v5 + 56) = v7;
    *(_QWORD *)(v5 + 64) = 0xD00000000000001FLL;
    *(_QWORD *)(v5 + 72) = 0x8000000236A6F6F0;
LABEL_5:
    v30 = *(_QWORD *)(v2 + 16);
    swift_bridgeObjectRetain();
    sub_236A58B10(v5);
    return v30;
  }
  if (a1 == 0xD000000000000014 && a2 == 0x8000000236A6F0E0 || (sub_236A6E0F0() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_236A6EAB0;
    *(_QWORD *)(v5 + 32) = sub_236A6DE38();
    *(_QWORD *)(v5 + 40) = v9;
    *(_QWORD *)(v5 + 48) = sub_236A6DE38();
    *(_QWORD *)(v5 + 56) = v10;
    *(_QWORD *)(v5 + 64) = sub_236A6DE38();
    *(_QWORD *)(v5 + 72) = v11;
    *(_QWORD *)(v5 + 80) = sub_236A6DE38();
    *(_QWORD *)(v5 + 88) = v12;
    *(_QWORD *)(v5 + 96) = sub_236A6DE38();
    *(_QWORD *)(v5 + 104) = v13;
    *(_QWORD *)(v5 + 112) = sub_236A6DE38();
    *(_QWORD *)(v5 + 120) = v14;
    *(_QWORD *)(v5 + 128) = sub_236A6DE38();
    *(_QWORD *)(v5 + 136) = v15;
    *(_QWORD *)(v5 + 144) = sub_236A6DE38();
    *(_QWORD *)(v5 + 152) = v16;
    *(_QWORD *)(v5 + 160) = sub_236A6DE38();
    *(_QWORD *)(v5 + 168) = v17;
    *(_QWORD *)(v5 + 176) = sub_236A6DE38();
    *(_QWORD *)(v5 + 184) = v18;
    *(_QWORD *)(v5 + 192) = 0xD000000000000019;
    *(_QWORD *)(v5 + 200) = 0x8000000236A6F6D0;
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x8000000236A6F670 || (sub_236A6E0F0() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_236A6E990;
    *(_QWORD *)(v5 + 32) = sub_236A6DE38();
    *(_QWORD *)(v5 + 40) = v19;
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x8000000236A6F690 || (sub_236A6E0F0() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_236A6EAA0;
    *(_QWORD *)(v5 + 32) = sub_236A6DE38();
    *(_QWORD *)(v5 + 40) = v20;
    *(_QWORD *)(v5 + 48) = sub_236A6DE38();
    *(_QWORD *)(v5 + 56) = v21;
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x8000000236A6F0C0
    || (sub_236A6E0F0() & 1) != 0
    || a1 == 0x6C7070612E6D6F63 && a2 == 0xEF636973754D2E65
    || (sub_236A6E0F0() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_236A6EA90;
    *(_QWORD *)(v5 + 32) = sub_236A6DE38();
    *(_QWORD *)(v5 + 40) = v22;
    *(_QWORD *)(v5 + 48) = sub_236A6DE38();
    *(_QWORD *)(v5 + 56) = v23;
    *(_QWORD *)(v5 + 64) = sub_236A6DE38();
    *(_QWORD *)(v5 + 72) = v24;
    *(_QWORD *)(v5 + 80) = sub_236A6DE38();
    *(_QWORD *)(v5 + 88) = v25;
    *(_QWORD *)(v5 + 96) = sub_236A6DE38();
    *(_QWORD *)(v5 + 104) = v26;
    *(_QWORD *)(v5 + 112) = sub_236A6DE38();
    *(_QWORD *)(v5 + 120) = v27;
    *(_QWORD *)(v5 + 128) = sub_236A6DE38();
    *(_QWORD *)(v5 + 136) = v28;
    *(_QWORD *)(v5 + 144) = sub_236A6DE38();
    *(_QWORD *)(v5 + 152) = v29;
    goto LABEL_5;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_236A58A2C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_236A58A50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_236A6EAD0;
  *(_QWORD *)(v1 + 32) = sub_236A6DE38();
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = sub_236A6DE38();
  *(_QWORD *)(v1 + 56) = v3;
  *(_QWORD *)(v1 + 64) = sub_236A6DE38();
  *(_QWORD *)(v1 + 72) = v4;
  *(_QWORD *)(v1 + 80) = sub_236A6DE38();
  *(_QWORD *)(v1 + 88) = v5;
  *(_QWORD *)(v1 + 96) = sub_236A6DE38();
  *(_QWORD *)(v1 + 104) = v6;
  *(_QWORD *)(v1 + 112) = sub_236A6DE38();
  *(_QWORD *)(v1 + 120) = v7;
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t sub_236A58B10(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_236A50F4C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A58C64(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_236A51058(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = type metadata accessor for ATSpotlightDataRecord();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v24;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unsigned __int8 *v40;
  uint64_t v41;
  char *v42;
  int v43;
  unsigned int (*v44)(char *, uint64_t, uint64_t);
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  unsigned int (*v48)(char *, uint64_t, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  unsigned __int8 *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;

  v78 = a2;
  v2 = (int *)type metadata accessor for ATSpotlightDataRecord();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v74 = (char *)&v67 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v73 = (uint64_t)&v67 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v67 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v69 = (uint64_t)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v67 = (uint64_t)&v67 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v72 = (uint64_t)&v67 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v67 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v67 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v67 - v25;
  v27 = sub_236A6DC64();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v68 = (char *)&v67 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v75 = (char *)&v67 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v76 = (char *)&v67 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v77 = (char *)&v67 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v67 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v42 = (char *)&v67 - v41;
  v43 = *v40;
  v70 = v5;
  v71 = v40;
  if (v43 == 5)
  {
    sub_236A55D9C((uint64_t)&v40[v2[16]], (uint64_t)v26);
    v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
    if (v44(v26, 1, v27) == 1)
    {
      v24 = v26;
    }
    else
    {
      v45 = v26;
      v46 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
      v46(v42, v45, v27);
      sub_236A55D9C(v78 + v2[16], (uint64_t)v24);
      if (v44(v24, 1, v27) != 1)
      {
        v46(v39, v24, v27);
        v57 = sub_236A6DC28();
        v66 = *(void (**)(char *, uint64_t))(v28 + 8);
        v66(v39, v27);
        v66(v42, v27);
        return v57 & 1;
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v42, v27);
    }
    sub_236A55170((uint64_t)v24, &qword_2564331E0);
    v40 = v71;
  }
  v47 = (uint64_t)v40;
  sub_236A55D9C((uint64_t)&v40[v2[9]], (uint64_t)v21);
  sub_236A5945C(v47, (uint64_t)v11);
  v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v48(v21, 1, v27) == 1)
  {
    v49 = v77;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v77, &v11[v2[7]], v27);
    sub_236A5B868((uint64_t)v11);
    sub_236A55170((uint64_t)v21, &qword_2564331E0);
  }
  else
  {
    sub_236A5B868((uint64_t)v11);
    v49 = v77;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v77, v21, v27);
  }
  v50 = v78;
  v51 = v76;
  v52 = (uint64_t)v74;
  v53 = v72;
  sub_236A55D9C(v78 + v2[9], v72);
  v54 = v73;
  sub_236A5945C(v50, v73);
  if (v48((char *)v53, 1, v27) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v51, v54 + v2[7], v27);
    sub_236A5B868(v54);
    sub_236A55170(v53, &qword_2564331E0);
  }
  else
  {
    sub_236A5B868(v54);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v51, v53, v27);
  }
  sub_236A5B8A4(&qword_2564335C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  if ((sub_236A6DE20() & 1) != 0)
  {
    v55 = (uint64_t)v71;
    v56 = v67;
    sub_236A55D9C((uint64_t)&v71[v2[8]], v67);
    sub_236A5945C(v55, v52);
    if (v48((char *)v56, 1, v27) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v75, v52 + v2[7], v27);
      sub_236A5B868(v52);
      sub_236A55170(v56, &qword_2564331E0);
    }
    else
    {
      sub_236A5B868(v52);
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v75, v56, v27);
    }
    v60 = v69;
    v59 = (uint64_t)v70;
    sub_236A55D9C(v50 + v2[8], v69);
    v61 = v50;
    v62 = v60;
    sub_236A5945C(v61, v59);
    if (v48((char *)v60, 1, v27) == 1)
    {
      v63 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v68, v59 + v2[7], v27);
      sub_236A5B868(v59);
      sub_236A55170(v62, &qword_2564331E0);
    }
    else
    {
      sub_236A5B868(v59);
      v63 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v68, v62, v27);
    }
    v64 = v75;
    v57 = sub_236A6DC28();
    v58 = *(void (**)(char *, uint64_t))(v28 + 8);
    v58(v63, v27);
    v58(v64, v27);
    v58(v51, v27);
  }
  else
  {
    v57 = sub_236A6DC28();
    v58 = *(void (**)(char *, uint64_t))(v28 + 8);
    v58(v51, v27);
  }
  v58(v49, v27);
  return v57 & 1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_236A5945C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_236A594A0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

unint64_t sub_236A594D4()
{
  unint64_t result;

  result = qword_256433360;
  if (!qword_256433360)
  {
    result = MEMORY[0x23B7FA574](&protocol conformance descriptor for ATSpotlightDataRecordType, &type metadata for ATSpotlightDataRecordType);
    atomic_store(result, (unint64_t *)&qword_256433360);
  }
  return result;
}

uint64_t sub_236A59518(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_236A5B8A4(&qword_256433368, (uint64_t (*)(uint64_t))type metadata accessor for ATSpotlightDataRecord, (uint64_t)&protocol conformance descriptor for ATSpotlightDataRecord);
  result = sub_236A5B8A4(&qword_256433370, (uint64_t (*)(uint64_t))type metadata accessor for ATSpotlightDataRecord, (uint64_t)&protocol conformance descriptor for ATSpotlightDataRecord);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_236A59574()
{
  return sub_236A5B8A4(&qword_256433378, (uint64_t (*)(uint64_t))type metadata accessor for ATSpotlightDataRecord, (uint64_t)&protocol conformance descriptor for ATSpotlightDataRecord);
}

uint64_t getEnumTagSinglePayload for ATSpotlightDataRecordType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ATSpotlightDataRecordType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_236A5967C + 4 * byte_236A6EAE5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_236A596B0 + 4 * byte_236A6EAE0[v4]))();
}

uint64_t sub_236A596B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_236A596B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x236A596C0);
  return result;
}

uint64_t sub_236A596CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x236A596D4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_236A596D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_236A596E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ATSpotlightDataRecordType()
{
  return &type metadata for ATSpotlightDataRecordType;
}

_QWORD *initializeBufferWithCopyOfBuffer for ATSpotlightDataRecord(_QWORD *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, char *, uint64_t);
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  char *v88;
  uint64_t v89;
  _QWORD *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  char *v96;
  uint64_t v97;
  _QWORD *v98;
  char *v99;
  uint64_t v100;
  void (*v102)(char *, char *, uint64_t);
  uint64_t v103;
  unsigned int (*v104)(char *, uint64_t, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *a2;
    v7 = *((_QWORD *)a2 + 2);
    a1[1] = *((_QWORD *)a2 + 1);
    a1[2] = v7;
    v8 = *((_QWORD *)a2 + 4);
    v9 = a3[7];
    v10 = (char *)a1 + v9;
    v11 = &a2[v9];
    a1[3] = *((_QWORD *)a2 + 3);
    a1[4] = v8;
    v12 = sub_236A6DC64();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v10, v11, v12);
    v15 = a3[8];
    v16 = (char *)v4 + v15;
    v17 = &a2[v15];
    v104 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    if (v104(&a2[v15], 1, v12))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v14(v16, v17, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
    }
    v20 = a3[9];
    v21 = (char *)v4 + v20;
    v22 = &a2[v20];
    v102 = v14;
    v103 = v13;
    if (v104(&a2[v20], 1, v12))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v14(v21, v22, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
    }
    v24 = a3[10];
    v25 = a3[11];
    v26 = (_QWORD *)((char *)v4 + v24);
    v27 = &a2[v24];
    v28 = *((_QWORD *)v27 + 1);
    *v26 = *(_QWORD *)v27;
    v26[1] = v28;
    *(_QWORD *)((char *)v4 + v25) = *(_QWORD *)&a2[v25];
    v29 = a3[13];
    *(_QWORD *)((char *)v4 + a3[12]) = *(_QWORD *)&a2[a3[12]];
    *(_QWORD *)((char *)v4 + v29) = *(_QWORD *)&a2[v29];
    v30 = a3[14];
    v31 = a3[15];
    v32 = (_QWORD *)((char *)v4 + v30);
    v33 = &a2[v30];
    v34 = *((_QWORD *)v33 + 1);
    *v32 = *(_QWORD *)v33;
    v32[1] = v34;
    v35 = (char *)v4 + v31;
    v36 = &a2[v31];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v104(v36, 1, v12))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      v39 = v102;
      v38 = v13;
    }
    else
    {
      v39 = v102;
      v102(v35, v36, v12);
      v38 = v13;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v35, 0, 1, v12);
    }
    v40 = a3[16];
    v41 = (char *)v4 + v40;
    v42 = &a2[v40];
    if (v104(&a2[v40], 1, v12))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      v39(v41, v42, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v41, 0, 1, v12);
    }
    v44 = a3[17];
    v45 = a3[18];
    v46 = (_QWORD *)((char *)v4 + v44);
    v47 = &a2[v44];
    v48 = *((_QWORD *)v47 + 1);
    *v46 = *(_QWORD *)v47;
    v46[1] = v48;
    *((_BYTE *)v4 + v45) = a2[v45];
    v49 = a3[19];
    v50 = a3[20];
    v51 = (_QWORD *)((char *)v4 + v49);
    v52 = &a2[v49];
    v53 = *((_QWORD *)v52 + 1);
    *v51 = *(_QWORD *)v52;
    v51[1] = v53;
    *((_BYTE *)v4 + v50) = a2[v50];
    v54 = a3[21];
    v55 = a3[22];
    v56 = (_QWORD *)((char *)v4 + v54);
    v57 = &a2[v54];
    v58 = *((_QWORD *)v57 + 1);
    *v56 = *(_QWORD *)v57;
    v56[1] = v58;
    v59 = (_QWORD *)((char *)v4 + v55);
    v60 = &a2[v55];
    v61 = *((_QWORD *)v60 + 1);
    *v59 = *(_QWORD *)v60;
    v59[1] = v61;
    v62 = a3[23];
    v63 = a3[24];
    v64 = (_QWORD *)((char *)v4 + v62);
    v65 = &a2[v62];
    v66 = *((_QWORD *)v65 + 1);
    *v64 = *(_QWORD *)v65;
    v64[1] = v66;
    v67 = (char *)v4 + v63;
    v68 = &a2[v63];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v104(v68, 1, v12))
    {
      v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v67, v68, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
      v71 = v102;
      v70 = v103;
    }
    else
    {
      v71 = v102;
      v102(v67, v68, v12);
      v70 = v103;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v103 + 56))(v67, 0, 1, v12);
    }
    v72 = a3[25];
    v73 = (char *)v4 + v72;
    v74 = &a2[v72];
    if (v104(&a2[v72], 1, v12))
    {
      v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v73, v74, *(_QWORD *)(*(_QWORD *)(v75 - 8) + 64));
    }
    else
    {
      v71(v73, v74, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v70 + 56))(v73, 0, 1, v12);
    }
    v76 = a3[27];
    *((_BYTE *)v4 + a3[26]) = a2[a3[26]];
    v77 = (_QWORD *)((char *)v4 + v76);
    v78 = &a2[v76];
    v79 = *((_QWORD *)v78 + 1);
    *v77 = *(_QWORD *)v78;
    v77[1] = v79;
    v80 = a3[28];
    v81 = a3[29];
    v82 = (_QWORD *)((char *)v4 + v80);
    v83 = &a2[v80];
    v84 = *((_QWORD *)v83 + 1);
    *v82 = *(_QWORD *)v83;
    v82[1] = v84;
    *((_BYTE *)v4 + v81) = a2[v81];
    v85 = a3[30];
    v86 = a3[31];
    v87 = (_QWORD *)((char *)v4 + v85);
    v88 = &a2[v85];
    v89 = *((_QWORD *)v88 + 1);
    *v87 = *(_QWORD *)v88;
    v87[1] = v89;
    v90 = (_QWORD *)((char *)v4 + v86);
    v91 = &a2[v86];
    v92 = *((_QWORD *)v91 + 1);
    *v90 = *(_QWORD *)v91;
    v90[1] = v92;
    v93 = a3[32];
    v94 = a3[33];
    v95 = (_QWORD *)((char *)v4 + v93);
    v96 = &a2[v93];
    v97 = *((_QWORD *)v96 + 1);
    *v95 = *(_QWORD *)v96;
    v95[1] = v97;
    v98 = (_QWORD *)((char *)v4 + v94);
    v99 = &a2[v94];
    v100 = *((_QWORD *)v99 + 1);
    *v98 = *(_QWORD *)v99;
    v98[1] = v100;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ATSpotlightDataRecord(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_236A6DC64();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v4, v5);
  v8 = a1 + a2[8];
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v9(v8, 1, v5))
    v7(v8, v5);
  v10 = a1 + a2[9];
  if (!v9(v10, 1, v5))
    v7(v10, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = a1 + a2[15];
  if (!v9(v11, 1, v5))
    v7(v11, v5);
  v12 = a1 + a2[16];
  if (!v9(v12, 1, v5))
    v7(v12, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = a1 + a2[24];
  if (!v9(v13, 1, v5))
    v7(v13, v5);
  v14 = a1 + a2[25];
  if (!v9(v14, 1, v5))
    v7(v14, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void *, const void *, uint64_t);
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(void *, const void *, uint64_t);
  uint64_t v38;
  void *v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  const void *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(void *, const void *, uint64_t);
  uint64_t v70;
  void *v71;
  const void *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  uint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;
  void (*v100)(void *, const void *, uint64_t);
  uint64_t v101;
  unsigned int (*v102)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  v8 = a3[7];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_236A6DC64();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(void *, const void *, uint64_t))(v12 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v9, v10, v11);
  v14 = a3[8];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v102 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (v102(a2 + v14, 1, v11))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v13(v15, v16, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
  }
  v18 = a3[9];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  v100 = v13;
  v101 = v12;
  if (v102(a2 + v18, 1, v11))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v13(v19, v20, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
  }
  v22 = a3[10];
  v23 = a3[11];
  v24 = (_QWORD *)(a1 + v22);
  v25 = (_QWORD *)(a2 + v22);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  *(_QWORD *)(a1 + v23) = *(_QWORD *)(a2 + v23);
  v27 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v27) = *(_QWORD *)(a2 + v27);
  v28 = a3[14];
  v29 = a3[15];
  v30 = (_QWORD *)(a1 + v28);
  v31 = (_QWORD *)(a2 + v28);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = (void *)(a1 + v29);
  v34 = (const void *)(a2 + v29);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v102((uint64_t)v34, 1, v11))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    v37 = v100;
    v36 = v12;
  }
  else
  {
    v37 = v100;
    v100(v33, v34, v11);
    v36 = v12;
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v33, 0, 1, v11);
  }
  v38 = a3[16];
  v39 = (void *)(a1 + v38);
  v40 = (const void *)(a2 + v38);
  if (v102(a2 + v38, 1, v11))
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    v37(v39, v40, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v39, 0, 1, v11);
  }
  v42 = a3[17];
  v43 = a3[18];
  v44 = (_QWORD *)(a1 + v42);
  v45 = (_QWORD *)(a2 + v42);
  v46 = v45[1];
  *v44 = *v45;
  v44[1] = v46;
  *(_BYTE *)(a1 + v43) = *(_BYTE *)(a2 + v43);
  v47 = a3[19];
  v48 = a3[20];
  v49 = (_QWORD *)(a1 + v47);
  v50 = (_QWORD *)(a2 + v47);
  v51 = v50[1];
  *v49 = *v50;
  v49[1] = v51;
  *(_BYTE *)(a1 + v48) = *(_BYTE *)(a2 + v48);
  v52 = a3[21];
  v53 = a3[22];
  v54 = (_QWORD *)(a1 + v52);
  v55 = (_QWORD *)(a2 + v52);
  v56 = v55[1];
  *v54 = *v55;
  v54[1] = v56;
  v57 = (_QWORD *)(a1 + v53);
  v58 = (_QWORD *)(a2 + v53);
  v59 = v58[1];
  *v57 = *v58;
  v57[1] = v59;
  v60 = a3[23];
  v61 = a3[24];
  v62 = (_QWORD *)(a1 + v60);
  v63 = (_QWORD *)(a2 + v60);
  v64 = v63[1];
  *v62 = *v63;
  v62[1] = v64;
  v65 = (void *)(a1 + v61);
  v66 = (const void *)(a2 + v61);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v102((uint64_t)v66, 1, v11))
  {
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
    v69 = v100;
    v68 = v101;
  }
  else
  {
    v69 = v100;
    v100(v65, v66, v11);
    v68 = v101;
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v101 + 56))(v65, 0, 1, v11);
  }
  v70 = a3[25];
  v71 = (void *)(a1 + v70);
  v72 = (const void *)(a2 + v70);
  if (v102(a2 + v70, 1, v11))
  {
    v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v71, v72, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
  }
  else
  {
    v69(v71, v72, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v68 + 56))(v71, 0, 1, v11);
  }
  v74 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  v75 = (_QWORD *)(a1 + v74);
  v76 = (_QWORD *)(a2 + v74);
  v77 = v76[1];
  *v75 = *v76;
  v75[1] = v77;
  v78 = a3[28];
  v79 = a3[29];
  v80 = (_QWORD *)(a1 + v78);
  v81 = (_QWORD *)(a2 + v78);
  v82 = v81[1];
  *v80 = *v81;
  v80[1] = v82;
  *(_BYTE *)(a1 + v79) = *(_BYTE *)(a2 + v79);
  v83 = a3[30];
  v84 = a3[31];
  v85 = (_QWORD *)(a1 + v83);
  v86 = (_QWORD *)(a2 + v83);
  v87 = v86[1];
  *v85 = *v86;
  v85[1] = v87;
  v88 = (_QWORD *)(a1 + v84);
  v89 = (_QWORD *)(a2 + v84);
  v90 = v89[1];
  *v88 = *v89;
  v88[1] = v90;
  v91 = a3[32];
  v92 = a3[33];
  v93 = (_QWORD *)(a1 + v91);
  v94 = (_QWORD *)(a2 + v91);
  v95 = v94[1];
  *v93 = *v94;
  v93[1] = v95;
  v96 = (_QWORD *)(a1 + v92);
  v97 = (_QWORD *)(a2 + v92);
  v98 = v97[1];
  *v96 = *v97;
  v96[1] = v98;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, const void *, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t (*v15)(const void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  void *v59;
  const void *v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const void *v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_236A6DC64();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = a3[8];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  v16 = v15((const void *)(a1 + v12), 1, v9);
  v17 = v15(v14, 1, v9);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v13, v14, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v13, v9);
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  v11(v13, v14, v9);
LABEL_7:
  v19 = a3[9];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = v15((const void *)(a1 + v19), 1, v9);
  v23 = v15(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  v11(v20, v21, v9);
LABEL_13:
  v25 = a3[10];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (_QWORD *)(a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = a3[14];
  v29 = (_QWORD *)(a1 + v28);
  v30 = (_QWORD *)(a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v31 = a3[15];
  v32 = (void *)(a1 + v31);
  v33 = (const void *)(a2 + v31);
  v34 = v15((const void *)(a1 + v31), 1, v9);
  v35 = v15(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v32, v33, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_18:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_19;
  }
  v11(v32, v33, v9);
LABEL_19:
  v37 = a3[16];
  v38 = (void *)(a1 + v37);
  v39 = (const void *)(a2 + v37);
  v40 = v15((const void *)(a1 + v37), 1, v9);
  v41 = v15(v39, 1, v9);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v38, v39, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v38, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v41)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v38, v9);
LABEL_24:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_25;
  }
  v11(v38, v39, v9);
LABEL_25:
  v43 = a3[17];
  v44 = (_QWORD *)(a1 + v43);
  v45 = (_QWORD *)(a2 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[18]) = *(_BYTE *)(a2 + a3[18]);
  v46 = a3[19];
  v47 = (_QWORD *)(a1 + v46);
  v48 = (_QWORD *)(a2 + v46);
  *v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[20]) = *(_BYTE *)(a2 + a3[20]);
  v49 = a3[21];
  v50 = (_QWORD *)(a1 + v49);
  v51 = (_QWORD *)(a2 + v49);
  *v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52 = a3[22];
  v53 = (_QWORD *)(a1 + v52);
  v54 = (_QWORD *)(a2 + v52);
  *v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v55 = a3[23];
  v56 = (_QWORD *)(a1 + v55);
  v57 = (_QWORD *)(a2 + v55);
  *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v58 = a3[24];
  v59 = (void *)(a1 + v58);
  v60 = (const void *)(a2 + v58);
  v61 = v15((const void *)(a1 + v58), 1, v9);
  v62 = v15(v60, 1, v9);
  if (v61)
  {
    if (!v62)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v59, v60, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v59, 0, 1, v9);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v62)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v59, v9);
LABEL_30:
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_31;
  }
  v11(v59, v60, v9);
LABEL_31:
  v64 = a3[25];
  v65 = (void *)(a1 + v64);
  v66 = (const void *)(a2 + v64);
  v67 = v15((const void *)(a1 + v64), 1, v9);
  v68 = v15(v66, 1, v9);
  if (!v67)
  {
    if (!v68)
    {
      v11(v65, v66, v9);
      goto LABEL_37;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v65, v9);
    goto LABEL_36;
  }
  if (v68)
  {
LABEL_36:
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v65, v66, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v65, 0, 1, v9);
LABEL_37:
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  v70 = a3[27];
  v71 = (_QWORD *)(a1 + v70);
  v72 = (_QWORD *)(a2 + v70);
  *v71 = *v72;
  v71[1] = v72[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v73 = a3[28];
  v74 = (_QWORD *)(a1 + v73);
  v75 = (_QWORD *)(a2 + v73);
  *v74 = *v75;
  v74[1] = v75[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[29]) = *(_BYTE *)(a2 + a3[29]);
  v76 = a3[30];
  v77 = (_QWORD *)(a1 + v76);
  v78 = (_QWORD *)(a2 + v76);
  *v77 = *v78;
  v77[1] = v78[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v79 = a3[31];
  v80 = (_QWORD *)(a1 + v79);
  v81 = (_QWORD *)(a2 + v79);
  *v80 = *v81;
  v80[1] = v81[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v82 = a3[32];
  v83 = (_QWORD *)(a1 + v82);
  v84 = (_QWORD *)(a2 + v82);
  *v83 = *v84;
  v83[1] = v84[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v85 = a3[33];
  v86 = (_QWORD *)(a1 + v85);
  v87 = (_QWORD *)(a2 + v85);
  *v86 = *v87;
  v86[1] = v87[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, const void *, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = a3[7];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_236A6DC64();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  v12 = a3[8];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v15(a2 + v12, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  v17 = a3[9];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  if (v15(a2 + v17, 1, v9))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v11(v18, v19, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  v21 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  v22 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  v23 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  v24 = (void *)(a1 + v23);
  v25 = (const void *)(a2 + v23);
  if (v15(a2 + v23, 1, v9))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v11(v24, v25, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v24, 0, 1, v9);
  }
  v27 = a3[16];
  v28 = (void *)(a1 + v27);
  v29 = (const void *)(a2 + v27);
  if (v15(a2 + v27, 1, v9))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    v11(v28, v29, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v28, 0, 1, v9);
  }
  v31 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v31) = *(_BYTE *)(a2 + v31);
  v32 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  *(_BYTE *)(a1 + v32) = *(_BYTE *)(a2 + v32);
  v33 = a3[22];
  *(_OWORD *)(a1 + a3[21]) = *(_OWORD *)(a2 + a3[21]);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  v34 = a3[24];
  *(_OWORD *)(a1 + a3[23]) = *(_OWORD *)(a2 + a3[23]);
  v35 = (void *)(a1 + v34);
  v36 = (const void *)(a2 + v34);
  if (v15(a2 + v34, 1, v9))
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  else
  {
    v11(v35, v36, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v35, 0, 1, v9);
  }
  v38 = a3[25];
  v39 = (void *)(a1 + v38);
  v40 = (const void *)(a2 + v38);
  if (v15(a2 + v38, 1, v9))
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    v11(v39, v40, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v39, 0, 1, v9);
  }
  v42 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_OWORD *)(a1 + v42) = *(_OWORD *)(a2 + v42);
  v43 = a3[29];
  *(_OWORD *)(a1 + a3[28]) = *(_OWORD *)(a2 + a3[28]);
  *(_BYTE *)(a1 + v43) = *(_BYTE *)(a2 + v43);
  v44 = a3[31];
  *(_OWORD *)(a1 + a3[30]) = *(_OWORD *)(a2 + a3[30]);
  *(_OWORD *)(a1 + v44) = *(_OWORD *)(a2 + v44);
  v45 = a3[33];
  *(_OWORD *)(a1 + a3[32]) = *(_OWORD *)(a2 + a3[32]);
  *(_OWORD *)(a1 + v45) = *(_OWORD *)(a2 + v45);
  return a1;
}

uint64_t assignWithTake for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void *, const void *, uint64_t);
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t (*v17)(const void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const void *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const void *v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const void *v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const void *v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = a3[7];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_236A6DC64();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(void *, const void *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  v14 = a3[8];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  v18 = v17((const void *)(a1 + v14), 1, v11);
  v19 = v17(v16, 1, v11);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v15, v16, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v15, v11);
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  v13(v15, v16, v11);
LABEL_7:
  v21 = a3[9];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  v24 = v17((const void *)(a1 + v21), 1, v11);
  v25 = v17(v23, 1, v11);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v22, v23, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v22, v11);
LABEL_12:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  v13(v22, v23, v11);
LABEL_13:
  v27 = a3[10];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (uint64_t *)(a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRelease();
  v32 = a3[14];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (uint64_t *)(a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = a3[15];
  v38 = (void *)(a1 + v37);
  v39 = (const void *)(a2 + v37);
  v40 = v17((const void *)(a1 + v37), 1, v11);
  v41 = v17(v39, 1, v11);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v38, v39, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v38, 0, 1, v11);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v41)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v38, v11);
LABEL_18:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_19;
  }
  v13(v38, v39, v11);
LABEL_19:
  v43 = a3[16];
  v44 = (void *)(a1 + v43);
  v45 = (const void *)(a2 + v43);
  v46 = v17((const void *)(a1 + v43), 1, v11);
  v47 = v17(v45, 1, v11);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v44, v45, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v44, 0, 1, v11);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v47)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v44, v11);
LABEL_24:
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    goto LABEL_25;
  }
  v13(v44, v45, v11);
LABEL_25:
  v49 = a3[17];
  v50 = (_QWORD *)(a1 + v49);
  v51 = (uint64_t *)(a2 + v49);
  v53 = *v51;
  v52 = v51[1];
  *v50 = v53;
  v50[1] = v52;
  swift_bridgeObjectRelease();
  v54 = a3[19];
  *(_BYTE *)(a1 + a3[18]) = *(_BYTE *)(a2 + a3[18]);
  v55 = (_QWORD *)(a1 + v54);
  v56 = (uint64_t *)(a2 + v54);
  v58 = *v56;
  v57 = v56[1];
  *v55 = v58;
  v55[1] = v57;
  swift_bridgeObjectRelease();
  v59 = a3[21];
  *(_BYTE *)(a1 + a3[20]) = *(_BYTE *)(a2 + a3[20]);
  v60 = (_QWORD *)(a1 + v59);
  v61 = (uint64_t *)(a2 + v59);
  v63 = *v61;
  v62 = v61[1];
  *v60 = v63;
  v60[1] = v62;
  swift_bridgeObjectRelease();
  v64 = a3[22];
  v65 = (_QWORD *)(a1 + v64);
  v66 = (uint64_t *)(a2 + v64);
  v68 = *v66;
  v67 = v66[1];
  *v65 = v68;
  v65[1] = v67;
  swift_bridgeObjectRelease();
  v69 = a3[23];
  v70 = (_QWORD *)(a1 + v69);
  v71 = (uint64_t *)(a2 + v69);
  v73 = *v71;
  v72 = v71[1];
  *v70 = v73;
  v70[1] = v72;
  swift_bridgeObjectRelease();
  v74 = a3[24];
  v75 = (void *)(a1 + v74);
  v76 = (const void *)(a2 + v74);
  v77 = v17((const void *)(a1 + v74), 1, v11);
  v78 = v17(v76, 1, v11);
  if (v77)
  {
    if (!v78)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v75, v76, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v75, 0, 1, v11);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v78)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v75, v11);
LABEL_30:
    v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v75, v76, *(_QWORD *)(*(_QWORD *)(v79 - 8) + 64));
    goto LABEL_31;
  }
  v13(v75, v76, v11);
LABEL_31:
  v80 = a3[25];
  v81 = (void *)(a1 + v80);
  v82 = (const void *)(a2 + v80);
  v83 = v17((const void *)(a1 + v80), 1, v11);
  v84 = v17(v82, 1, v11);
  if (!v83)
  {
    if (!v84)
    {
      v13(v81, v82, v11);
      goto LABEL_37;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v81, v11);
    goto LABEL_36;
  }
  if (v84)
  {
LABEL_36:
    v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v81, v82, *(_QWORD *)(*(_QWORD *)(v85 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v81, v82, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v81, 0, 1, v11);
LABEL_37:
  v86 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  v87 = (_QWORD *)(a1 + v86);
  v88 = (uint64_t *)(a2 + v86);
  v90 = *v88;
  v89 = v88[1];
  *v87 = v90;
  v87[1] = v89;
  swift_bridgeObjectRelease();
  v91 = a3[28];
  v92 = (_QWORD *)(a1 + v91);
  v93 = (uint64_t *)(a2 + v91);
  v95 = *v93;
  v94 = v93[1];
  *v92 = v95;
  v92[1] = v94;
  swift_bridgeObjectRelease();
  v96 = a3[30];
  *(_BYTE *)(a1 + a3[29]) = *(_BYTE *)(a2 + a3[29]);
  v97 = (_QWORD *)(a1 + v96);
  v98 = (uint64_t *)(a2 + v96);
  v100 = *v98;
  v99 = v98[1];
  *v97 = v100;
  v97[1] = v99;
  swift_bridgeObjectRelease();
  v101 = a3[31];
  v102 = (_QWORD *)(a1 + v101);
  v103 = (uint64_t *)(a2 + v101);
  v105 = *v103;
  v104 = v103[1];
  *v102 = v105;
  v102[1] = v104;
  swift_bridgeObjectRelease();
  v106 = a3[32];
  v107 = (_QWORD *)(a1 + v106);
  v108 = (uint64_t *)(a2 + v106);
  v110 = *v108;
  v109 = v108[1];
  *v107 = v110;
  v107[1] = v109;
  swift_bridgeObjectRelease();
  v111 = a3[33];
  v112 = (_QWORD *)(a1 + v111);
  v113 = (uint64_t *)(a2 + v111);
  v115 = *v113;
  v114 = v113[1];
  *v112 = v115;
  v112[1] = v114;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ATSpotlightDataRecord()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_236A5B5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_236A6DC64();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 28);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ATSpotlightDataRecord()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_236A5B650(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v8 = sub_236A6DC64();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 28);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_236A5B6F0()
{
  unint64_t v0;
  unint64_t v1;

  sub_236A6DC64();
  if (v0 <= 0x3F)
  {
    sub_236A5B7D4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_236A5B7D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2564333E8[0])
  {
    sub_236A6DC64();
    v0 = sub_236A6DF64();
    if (!v1)
      atomic_store(v0, qword_2564333E8);
  }
}

uint64_t type metadata accessor for ATBundleID()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ATSpolightAttributes()
{
  return objc_opt_self();
}

uint64_t sub_236A5B868(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236A5B8A4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7FA574](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void ATLocationRetriever.__allocating_init(effectiveBundleIdentifier:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  ATLocationRetriever.init(effectiveBundleIdentifier:)();
}

void ATLocationRetriever.init(effectiveBundleIdentifier:)()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v12;

  v1 = OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager;
  v2 = objc_allocWithZone(MEMORY[0x24BDBFA88]);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);
  v4 = OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_semaphore;
  *(_QWORD *)&v3[v4] = dispatch_semaphore_create(0);

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for ATLocationRetriever();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  sub_236A54D8C(0, &qword_2564335E0);
  v6 = (char *)v5;
  v7 = (void *)sub_236A6DF28();
  v8 = objc_allocWithZone(MEMORY[0x24BDBFA88]);
  v9 = (void *)sub_236A6DE2C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v9, v6, v7);

  if (v10)
  {

    v11 = *(void **)&v6[OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager];
    *(_QWORD *)&v6[OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager] = v10;

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for ATLocationRetriever()
{
  return objc_opt_self();
}

Swift::Void __swiftcall ATLocationRetriever.requestLocation()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager), sel_requestLocation);
  sub_236A6DF34();
}

uint64_t sub_236A5BAD4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[17] = v0;
  v2 = sub_236A6DDF0();
  v1[18] = v2;
  v1[19] = *(_QWORD *)(v2 - 8);
  v1[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236A5BB34()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 136) + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager), sel_location);
  *(_QWORD *)(v0 + 168) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA68]), sel_init);
    *(_QWORD *)(v0 + 176) = v3;
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_236A5BC44;
    v4 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v5 = (_QWORD *)(v0 + 80);
    v5[1] = 0x40000000;
    v5[2] = sub_236A5BF0C;
    v5[3] = &block_descriptor_0;
    v5[4] = v4;
    objc_msgSend(v3, sel_reverseGeocodeLocation_completionHandler_, v2, v5);
    return swift_continuation_await();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_236A5BC44()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

void sub_236A5BCA4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 120);
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x23B7FA028](0, *(_QWORD *)(v0 + 120));
    goto LABEL_4;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(v1 + 32);
LABEL_4:
    v3 = v2;
    v4 = *(void **)(v0 + 176);

    swift_bridgeObjectRelease();
    swift_task_dealloc();
    (*(void (**)(id))(v0 + 8))(v3);
    return;
  }
  __break(1u);
}

uint64_t sub_236A5BD30()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  v1 = *(void **)(v0 + 184);
  swift_willThrow();
  sub_236A6DDE4();
  v2 = v1;
  v3 = v1;
  v4 = sub_236A6DDD8();
  v5 = sub_236A6DF1C();
  if (os_log_type_enabled(v4, v5))
  {
    v7 = *(void **)(v0 + 176);
    v6 = *(void **)(v0 + 184);
    v15 = *(void **)(v0 + 168);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v6;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 128) = v11;
    sub_236A6DF70();
    *v9 = v11;

    _os_log_impl(&dword_236A4B000, v4, v5, "Failed to retrieve a placemark for the last location with error: \"%@\".", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433330);
    swift_arrayDestroy();
    MEMORY[0x23B7FA5E0](v9, -1, -1);
    MEMORY[0x23B7FA5E0](v8, -1, -1);

  }
  else
  {
    v12 = *(void **)(v0 + 184);
    v13 = *(void **)(v0 + 168);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_236A5BF0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433318);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_236A54D8C(0, (unint64_t *)&unk_256433690);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_236A6DEA4();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_236A5BFB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_236A5BFCC()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager), sel_location);
  *(_QWORD *)(v0 + 32) = v1;
  if (!v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  v2 = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564336A0);
  *v4 = v0;
  v4[1] = sub_236A5C0C4;
  return sub_236A6E0E4();
}

uint64_t sub_236A5C0C4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A5C120()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 16);
  if (!v1)
  {

LABEL_6:
    v5 = 0;
    v7 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v5, v7);
  }
  v2 = objc_msgSend(*(id *)(v0 + 16), sel_preferredName);
  v3 = *(void **)(v0 + 32);
  if (!v2)
  {

    goto LABEL_6;
  }
  v4 = v2;
  v5 = sub_236A6DE38();
  v7 = v6;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v5, v7);
}

void sub_236A5C1C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564336A8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_236A5CCA4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236A5C560;
  aBlock[3] = &block_descriptor_5;
  v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v7, sel_fetchLocationOfInterestAtLocation_withHandler_, a2, v10);
  _Block_release(v10);

}

uint64_t sub_236A5C320(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = sub_236A6DDF0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v20 = (uint64_t)a1;
    v8 = a1;
  }
  else
  {
    sub_236A6DDE4();
    v9 = a2;
    v10 = a2;
    v11 = sub_236A6DDD8();
    v12 = sub_236A6DF1C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v13 = 138412290;
      if (a2)
      {
        v14 = a2;
        v15 = _swift_stdlib_bridgeErrorToNSError();
        v20 = v15;
        sub_236A6DF70();
      }
      else
      {
        v20 = 0;
        sub_236A6DF70();
        v15 = 0;
      }
      v16 = v19;
      *v19 = v15;

      _os_log_impl(&dword_236A4B000, v11, v12, "Failed to fetch locations of interest with error: \"%@\".", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433330);
      swift_arrayDestroy();
      MEMORY[0x23B7FA5E0](v16, -1, -1);
      MEMORY[0x23B7FA5E0](v13, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v20 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564336A8);
  return sub_236A6DED4();
}

void sub_236A5C560(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t ATLocationRetriever.currentLocationName()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = v0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_236A5C634;
  v2[3] = v0;
  return swift_task_switch();
}

uint64_t sub_236A5C634(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;

  v5 = *v2;
  v6 = *v2;
  swift_task_dealloc();
  if (a2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 32) = v8;
  *v8 = v6;
  v8[1] = sub_236A5C6CC;
  return sub_236A5BAD4();
}

uint64_t sub_236A5C6CC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A5C728()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 40);
  if (!v1)
    goto LABEL_5;
  v2 = objc_msgSend(*(id *)(v0 + 40), sel_name);

  if (!v2)
  {
    v1 = 0;
LABEL_5:
    v4 = 0;
    return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, v4);
  }
  v1 = (void *)sub_236A6DE38();
  v4 = v3;

  return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, v4);
}

Swift::Void __swiftcall ATLocationRetriever.locationManager(_:didUpdateLocations:)(CLLocationManager _, Swift::OpaquePointer didUpdateLocations)
{
  sub_236A6DF40();
}

uint64_t ATLocationRetriever.locationManager(_:didFailWithError:)(uint64_t a1, void *a2)
{
  return sub_236A5CA5C(a2);
}

id ATLocationRetriever.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATLocationRetriever.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATLocationRetriever.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATLocationRetriever();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_236A5C96C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_236A5C98C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_236A5C9AC(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_236A6DF70();
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

uint64_t sub_236A5CA5C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = sub_236A6DDF0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DDE4();
  v8 = a1;
  v9 = a1;
  v10 = sub_236A6DDD8();
  v11 = sub_236A6DF1C();
  if (os_log_type_enabled(v10, v11))
  {
    v21 = v2;
    v12 = swift_slowAlloc();
    v20 = v4;
    v13 = (uint8_t *)v12;
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v15 = a1;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    v22 = v16;
    sub_236A6DF70();
    *v14 = v16;

    _os_log_impl(&dword_236A4B000, v10, v11, "Failed to fetch the current location from CoreLocation with error: \"%@\".", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433330);
    swift_arrayDestroy();
    MEMORY[0x23B7FA5E0](v14, -1, -1);
    v17 = v13;
    v4 = v20;
    MEMORY[0x23B7FA5E0](v17, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_236A6DF40();
}

void sub_236A5CC38(uint64_t a1)
{
  uint64_t v1;

  sub_236A5C1C4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_236A5CC40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564336A8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_236A5CCA4(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564336A8);
  return sub_236A5C320(a1, a2);
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

uint64_t ATSpotlightCalendarRetriever.getRecentRecordsAsync(maxNumRecordsToFetch:addendum:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_236A5CD28()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (uint64_t *)(v0[5] + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  v3 = *v1;
  v2 = v1[1];
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_236A5EB44;
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v3, v2, v0[2], v0[3], v0[4]);
}

uint64_t ATSpotlightCalendarRetriever.getRecentRecords(maxNumRecordsToFetch:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v14;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433718);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID + 8);
  v9 = dispatch_semaphore_create(0);
  v10 = sub_236A6DEEC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = v8;
  v11[6] = v7;
  v11[7] = a1;
  v11[8] = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  v12 = v9;
  sub_236A5E6E0((uint64_t)v6, (uint64_t)&unk_256433720, (uint64_t)v11);
  swift_release();
  sub_236A6DF34();

  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightCalendarRetriever.getCalendarEvents(startOffsetInSeconds:endOffsetInSeconds:excludeAllDayEvents:maxNumRecordsToFetch:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 48) = a4;
  *(_QWORD *)(v5 + 56) = v4;
  *(_BYTE *)(v5 + 88) = a3;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_236A5CEE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[7];
  v3 = v0[4];
  v2 = v0[5];
  sub_236A6DFDC();
  sub_236A6DE74();
  v0[2] = v2;
  sub_236A6E0D8();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  v0[3] = v3;
  sub_236A6E0D8();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  swift_bridgeObjectRetain();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[8] = 0xE000000000000000;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID + 8);
  v6 = (_QWORD *)swift_task_alloc();
  v0[9] = v6;
  *v6 = v0;
  v6[1] = sub_236A5D09C;
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v4, v5, v0[6], 0, 0xE000000000000000);
}

uint64_t sub_236A5D09C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A5D0F8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

uint64_t ATSpotlightCalendarRetriever.getCalendarEvents(startOffsetInDays:endOffsetInDays:excludeAllDayEvents:maxNumRecordsToFetch:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 56) = a3;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

void sub_236A5D14C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = 86400 * v1;
  if ((unsigned __int128)(v1 * (__int128)86400) >> 64 == (86400 * v1) >> 63)
  {
    v3 = *(_QWORD *)(v0 + 24);
    v4 = 86400 * v3;
    if ((unsigned __int128)(v3 * (__int128)86400) >> 64 == (86400 * v3) >> 63)
    {
      v5 = swift_task_alloc();
      *(_QWORD *)(v0 + 48) = v5;
      *(_QWORD *)v5 = v0;
      *(_QWORD *)(v5 + 8) = sub_236A5D1F0;
      v6 = *(_QWORD *)(v0 + 40);
      v7 = *(_BYTE *)(v0 + 56);
      *(_QWORD *)(v5 + 48) = *(_QWORD *)(v0 + 32);
      *(_QWORD *)(v5 + 56) = v6;
      *(_BYTE *)(v5 + 88) = v7;
      *(_QWORD *)(v5 + 32) = v2;
      *(_QWORD *)(v5 + 40) = v4;
      swift_task_switch();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_236A5D1F0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t ATSpotlightCalendarRetriever.parseCalendarEventRecords(eventRecords:)(uint64_t a1)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t *v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void (*v33)(_QWORD *@<X8>);
  unint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  char v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  _QWORD *v52;
  char v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  void (*v57)(_QWORD *@<X8>);
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  void (*v60)(_QWORD *@<X8>);
  uint64_t result;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  void (*v72)(_QWORD *@<X8>);
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v62 - v6;
  v67 = sub_236A6DC64();
  v8 = *(_QWORD *)(v67 - 8);
  v9 = MEMORY[0x24BDAC7A8](v67);
  v71 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v62 - v11;
  v73 = type metadata accessor for ATSpotlightDataRecord();
  v13 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_236A50758(MEMORY[0x24BEE4AF8]);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v16, sel_setDateStyle_, 1);
  objc_msgSend(v16, sel_setTimeStyle_, 1);
  v17 = *(_QWORD *)(a1 + 16);
  if (!v17)
  {

    v60 = 0;
LABEL_29:
    sub_236A5E82C((uint64_t)v60);
    return v74;
  }
  v70 = v5;
  v66 = v16;
  v18 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v76 = *(_QWORD *)(v13 + 72);
  v62 = a1;
  swift_bridgeObjectRetain();
  v72 = 0;
  v19 = v67;
  v20 = (int *)v73;
  v63 = v8;
  v64 = v7;
  v69 = v12;
  v65 = v15;
  while (1)
  {
    sub_236A5945C(v18, (uint64_t)v15);
    v21 = (uint64_t *)&v15[v20[23]];
    if (!v21[1])
    {
      sub_236A5B868((uint64_t)v15);
      goto LABEL_4;
    }
    v77 = v21[1];
    v75 = *v21;
    sub_236A5EA6C((uint64_t)&v15[v20[24]], (uint64_t)v7, &qword_2564331E0);
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    if (v22(v7, 1, v19) == 1)
    {
      sub_236A5B868((uint64_t)v15);
      sub_236A55170((uint64_t)v7, &qword_2564331E0);
      goto LABEL_4;
    }
    v23 = v12;
    v24 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v24(v23, v7, v19);
    v25 = (uint64_t)&v15[v20[25]];
    v26 = (uint64_t)v70;
    sub_236A5EA6C(v25, (uint64_t)v70, &qword_2564331E0);
    if (v22((char *)v26, 1, v19) == 1)
    {
      v12 = v69;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v69, v19);
      sub_236A5B868((uint64_t)v15);
      sub_236A55170(v26, &qword_2564331E0);
      v20 = (int *)v73;
      goto LABEL_4;
    }
    v24(v71, (char *)v26, v19);
    v78 = 0;
    v79 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_236A6DFDC();
    swift_bridgeObjectRelease();
    v78 = 0x2074612079737542;
    v79 = 0xE90000000000005BLL;
    v12 = v69;
    v27 = (void *)sub_236A6DC10();
    v28 = v66;
    v29 = objc_msgSend(v66, sel_stringFromDate_, v27);

    sub_236A6DE38();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    v30 = (void *)sub_236A6DC10();
    v31 = objc_msgSend(v28, sel_stringFromDate_, v30);

    sub_236A6DE38();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    v32 = v78;
    v33 = (void (*)(_QWORD *@<X8>))v79;
    sub_236A5E82C((uint64_t)v72);
    v34 = v74;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v78 = v34;
    v37 = sub_236A51420(v75, v77);
    v38 = *(_QWORD *)(v34 + 16);
    v39 = (v36 & 1) == 0;
    v40 = v38 + v39;
    if (__OFADD__(v38, v39))
      break;
    v41 = v36;
    v72 = v33;
    v42 = *(_QWORD *)(v34 + 24);
    v68 = v32;
    if (v42 >= v40)
    {
      v15 = v65;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_236A52F6C();
    }
    else
    {
      sub_236A52A14(v40, isUniquelyReferenced_nonNull_native);
      v43 = sub_236A51420(v75, v77);
      v15 = v65;
      if ((v41 & 1) != (v44 & 1))
        goto LABEL_32;
      v37 = v43;
    }
    v45 = (_QWORD *)v78;
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
    {
      v45[(v37 >> 6) + 8] |= 1 << v37;
      v46 = (_QWORD *)(v45[6] + 16 * v37);
      v47 = v77;
      *v46 = v75;
      v46[1] = v47;
      *(_QWORD *)(v45[7] + 8 * v37) = MEMORY[0x24BEE4AF8];
      v48 = v45[2];
      v49 = v48 + 1;
      v50 = __OFADD__(v48, 1);
      swift_bridgeObjectRetain();
      if (v50)
        goto LABEL_31;
      v45[2] = v49;
    }
    swift_bridgeObjectRetain();
    v51 = v45[7];
    v74 = (unint64_t)v45;
    swift_bridgeObjectRelease();
    v52 = *(_QWORD **)(v51 + 8 * v37);
    v53 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v51 + 8 * v37) = v52;
    if ((v53 & 1) == 0)
    {
      v52 = sub_236A50F4C(0, v52[2] + 1, 1, v52);
      *(_QWORD *)(v51 + 8 * v37) = v52;
    }
    v55 = v52[2];
    v54 = v52[3];
    if (v55 >= v54 >> 1)
    {
      v52 = sub_236A50F4C((_QWORD *)(v54 > 1), v55 + 1, 1, v52);
      *(_QWORD *)(v51 + 8 * v37) = v52;
    }
    v52[2] = v55 + 1;
    v56 = &v52[2 * v55];
    v57 = v72;
    v56[4] = v68;
    v56[5] = v57;
    swift_bridgeObjectRelease();
    v8 = v63;
    v58 = *(void (**)(char *, uint64_t))(v63 + 8);
    v59 = v67;
    v58(v71, v67);
    v58(v12, v59);
    v19 = v59;
    sub_236A5B868((uint64_t)v15);
    v72 = sub_236A5D890;
    v7 = v64;
    v20 = (int *)v73;
LABEL_4:
    v18 += v76;
    if (!--v17)
    {

      swift_bridgeObjectRelease();
      v60 = v72;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  result = sub_236A6E114();
  __break(1u);
  return result;
}

void sub_236A5D890(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t ATSpotlightCalendarRetriever.getCalendarEvents(atTime:excludeAllDayEvents:maxNumRecordsToFetch:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 56) = a2;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_236A5D8C0()
{
  uint64_t v0;
  uint64_t result;
  double v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  result = sub_236A6DC34();
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v3 = (uint64_t)v2 - 30;
  if (__OFSUB__((uint64_t)v2, 30))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  result = sub_236A6DC34();
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v5 = (uint64_t)v4 + 30;
  if (!__OFADD__((uint64_t)v4, 30))
  {
    v6 = swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v6;
    *(_QWORD *)v6 = v0;
    *(_QWORD *)(v6 + 8) = sub_236A5D9DC;
    v7 = *(_QWORD *)(v0 + 32);
    v8 = *(_BYTE *)(v0 + 56);
    *(_QWORD *)(v6 + 48) = *(_QWORD *)(v0 + 24);
    *(_QWORD *)(v6 + 56) = v7;
    *(_BYTE *)(v6 + 88) = v8;
    *(_QWORD *)(v6 + 32) = v3;
    *(_QWORD *)(v6 + 40) = v5;
    return swift_task_switch();
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_236A5D9DC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A5DA38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  v4 = sub_236A5E0E4((uint64_t (*)(char *))sub_236A5E8EC, v3, v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_236A5DAA8(uint64_t a1, unint64_t a2)
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t (*v35)(char *, uint64_t, uint64_t);
  int v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, unint64_t, uint64_t);
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  char *v44;
  char *v45;
  char v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  char *v55;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;

  v79 = a2;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433870);
  v3 = MEMORY[0x24BDAC7A8](v68);
  v69 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v66 = (char *)&v64 - v5;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433878);
  v6 = MEMORY[0x24BDAC7A8](v71);
  v72 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v67 = (char *)&v64 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v75 = (uint64_t)&v64 - v10;
  v11 = sub_236A6DC64();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v70 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v74 = (char *)&v64 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v73 = (char *)&v64 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v81 = (char *)&v64 - v19;
  v20 = type metadata accessor for ATSpotlightDataRecord();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v80 = (uint64_t)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v64 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v76 = (char *)&v64 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v77 = (char *)&v64 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v64 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v64 - v33;
  sub_236A5EA6C(a1 + *(int *)(v20 + 96), (uint64_t)&v64 - v33, &qword_2564331E0);
  v78 = v12;
  v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v36 = v35(v34, 1, v11);
  sub_236A55170((uint64_t)v34, &qword_2564331E0);
  sub_236A5945C(a1, (uint64_t)v24);
  if (v36 == 1)
  {
    sub_236A5B868((uint64_t)v24);
    v37 = 0;
  }
  else
  {
    sub_236A5EA6C((uint64_t)&v24[*(int *)(v20 + 100)], (uint64_t)v32, &qword_2564331E0);
    sub_236A5B868((uint64_t)v24);
    v37 = v35(v32, 1, v11) != 1;
    sub_236A55170((uint64_t)v32, &qword_2564331E0);
  }
  v38 = v80;
  sub_236A5945C(a1, v80);
  v39 = v78;
  v40 = *(void (**)(char *, unint64_t, uint64_t))(v78 + 16);
  v40(v81, v79, v11);
  if (!v37)
  {
    v63 = 0;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v81, v11);
LABEL_13:
    sub_236A5B868(v38);
    return v63 & 1;
  }
  v41 = (uint64_t)v77;
  sub_236A5EA6C(v38 + *(int *)(v20 + 96), (uint64_t)v77, &qword_2564331E0);
  result = v35((char *)v41, 1, v11);
  if ((_DWORD)result == 1)
    goto LABEL_15;
  v43 = (uint64_t)v76;
  sub_236A5EA6C(v38 + *(int *)(v20 + 100), (uint64_t)v76, &qword_2564331E0);
  result = v35((char *)v43, 1, v11);
  if ((_DWORD)result != 1)
  {
    v44 = v73;
    v40(v73, v41, v11);
    v45 = v74;
    v40(v74, v43, v11);
    v79 = sub_236A5E9DC();
    v46 = sub_236A6DE14();
    v47 = *(void (**)(char *, uint64_t))(v39 + 8);
    v47(v45, v11);
    result = ((uint64_t (*)(char *, uint64_t))v47)(v44, v11);
    if ((v46 & 1) != 0)
    {
      v48 = v68;
      v49 = v41;
      v50 = v66;
      v51 = &v66[*(int *)(v68 + 48)];
      v40(v66, v49, v11);
      v40(v51, v43, v11);
      v52 = *(int *)(v48 + 48);
      v53 = (void (*)(char *, char *, uint64_t))v40;
      v65 = (void (*)(char *, char *, uint64_t))v40;
      v54 = v69;
      v55 = &v69[v52];
      v53(v69, v50, v11);
      v53(v55, v51, v11);
      v56 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
      v57 = (uint64_t)v67;
      v56(v67, v54, v11);
      v47(v55, v11);
      v58 = &v54[*(int *)(v48 + 48)];
      v56(v54, v50, v11);
      v56(v58, v51, v11);
      v56((char *)(v57 + *(int *)(v71 + 36)), v58, v11);
      v47(v54, v11);
      v59 = v75;
      sub_236A5EA24(v57, v75);
      v47(v76, v11);
      v47(v77, v11);
      v60 = v81;
      LOBYTE(v56) = sub_236A6DE08();
      v61 = v70;
      v65(v70, v60, v11);
      v62 = v72;
      sub_236A5EA6C(v59, v72, &qword_256433878);
      if ((v56 & 1) != 0)
        v63 = sub_236A6DE14();
      else
        v63 = 0;
      sub_236A55170(v62, &qword_256433878);
      v47(v61, v11);
      sub_236A55170(v75, &qword_256433878);
      v38 = v80;
      v47(v81, v11);
      goto LABEL_13;
    }
    __break(1u);
LABEL_15:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_236A5E0E4(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = type metadata accessor for ATSpotlightDataRecord();
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(a3 + 16);
  if (v22)
  {
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    v20[1] = a2;
    v21 = a3;
    v20[0] = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v13 = *(_QWORD *)(v24 + 72);
      sub_236A5945C(a3 + v16 + v13 * v14, (uint64_t)v12);
      v17 = a1(v12);
      if (v3)
      {
        sub_236A5B868((uint64_t)v12);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        sub_236A5E998((uint64_t)v12, v23);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_236A53168(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_236A53168(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_236A5E998(v23, v15 + v16 + v19 * v13);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = sub_236A5B868((uint64_t)v12);
      }
      if (v22 == ++v14)
      {
        v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t ATSpotlightCalendarRetriever.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v0 = sub_236A6DC64();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = swift_allocObject();
  v5 = (_QWORD *)(v4 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  *v5 = 0xD000000000000013;
  v5[1] = 0x8000000236A6F0C0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_timestampSearchPaddingInSeconds) = 30;
  sub_236A6DC58();
  sub_236A6DC04();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x24BEE4AF8];
  return v4;
}

uint64_t ATSpotlightCalendarRetriever.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = v0;
  v2 = sub_236A6DC64();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  *v6 = 0xD000000000000013;
  v6[1] = 0x8000000236A6F0C0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_timestampSearchPaddingInSeconds) = 30;
  sub_236A6DC58();
  sub_236A6DC04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x24BEE4AF8];
  return v1;
}

uint64_t sub_236A5E4D0()
{
  return swift_bridgeObjectRelease();
}

uint64_t ATSpotlightCalendarRetriever.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  v2 = sub_236A6DC64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ATSpotlightCalendarRetriever.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  v2 = sub_236A6DC64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_236A5E5C8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_236A5E604(uint64_t a1)
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
  v11[1] = sub_236A5E698;
  return sub_236A62DBC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_236A5E698()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236A5E6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_236A6DEEC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_236A6DEE0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_236A55170(a1, &qword_256433718);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236A6DEC8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_236A5E82C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_236A5E83C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_236A5E8A0;
  return v6(a1);
}

uint64_t sub_236A5E8A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236A5E8EC(uint64_t a1)
{
  uint64_t v1;

  return sub_236A5DAA8(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_236A5E908()
{
  return type metadata accessor for ATSpotlightCalendarRetriever();
}

uint64_t type metadata accessor for ATSpotlightCalendarRetriever()
{
  uint64_t result;

  result = qword_256433768;
  if (!qword_256433768)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_236A5E94C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_236A5E998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_236A5E9DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256433880;
  if (!qword_256433880)
  {
    v1 = sub_236A6DC64();
    result = MEMORY[0x23B7FA574](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_256433880);
  }
  return result;
}

uint64_t sub_236A5EA24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236A5EA6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236A5EAB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236A5EAD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_236A5E698;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256433888 + dword_256433888))(a1, v4);
}

uint64_t sub_236A5EB48()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;

  v1 = v0;
  v2 = *(_BYTE *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 24);
  if ((v2 & 1) != 0)
  {
    if ((v3 & 1) != 0)
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_236A6DEF8();
  if ((v3 & 1) == 0)
LABEL_3:
    sub_236A6DEF8();
LABEL_5:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_236A6DFDC();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v1 + 120))
  {
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
  }
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  return 40;
}

uint64_t sub_236A5EF28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  id v11;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v68;
  unint64_t v69;
  _OWORD *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  void *v77;
  _QWORD v79[2];
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, unint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  _QWORD *v93;
  _QWORD *v94;
  uint64_t v95;
  _QWORD *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  _OWORD v100[8];

  v85 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v98 = (char *)v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v97 = (char *)v79 - v8;
  v9 = (int *)type metadata accessor for ATMegadomeLifeEvent();
  v10 = v9[9];
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v81 = v10;
  *(uint64_t *)((char *)a3 + v10) = (uint64_t)v11;
  *a3 = sub_236A6DD0C();
  a3[1] = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A08);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_236A6DD24();
  v18 = sub_236A5B8A4(&qword_256433A10, (uint64_t (*)(uint64_t))MEMORY[0x24BE58388], MEMORY[0x24BE58380]);
  v80 = v17;
  MEMORY[0x23B7F9CB0](v17, v18);
  v19 = sub_236A6DCA0();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v79 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DCDC();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v79 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DC94();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  v26 = v9[5];
  v84 = a3;
  sub_236A55220((uint64_t)v25, (uint64_t)a3 + v26, &qword_256433898);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A18);
  v28 = *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64);
  MEMORY[0x24BDAC7A8](v27);
  v82 = a1;
  sub_236A6DD00();
  v29 = sub_236A6DD48();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
  if (v31((char *)v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v29) == 1)
  {
    sub_236A55170((uint64_t)v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A18);
    v32 = sub_236A6DC64();
    v33 = (uint64_t)v97;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v97, 1, 1, v32);
  }
  else
  {
    v33 = (uint64_t)v97;
    sub_236A6DD3C();
    (*(void (**)(char *, uint64_t))(v30 + 8))((char *)v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
  }
  v34 = sub_236A55220(v33, (uint64_t)v84 + v9[6], &qword_2564331E0);
  MEMORY[0x24BDAC7A8](v34);
  v35 = (char *)v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DD00();
  if (v31(v35, 1, v29) == 1)
  {
    sub_236A55170((uint64_t)v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A18);
    v36 = sub_236A6DC64();
    v37 = (uint64_t)v98;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v98, 1, 1, v36);
  }
  else
  {
    v37 = (uint64_t)v98;
    sub_236A6DD30();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v35, v29);
  }
  v38 = v84;
  sub_236A55220(v37, (uint64_t)v84 + v9[7], &qword_2564331E0);
  v83 = v9[8];
  *(uint64_t *)((char *)v38 + v83) = MEMORY[0x24BEE4AF8];
  v39 = sub_236A6DD18();
  v40 = v39;
  if (*(_QWORD *)(v39 + 16))
  {
    v41 = *(_QWORD *)(v39 + 16);
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A20);
    v43 = v42;
    v44 = *(_QWORD *)(v42 - 8);
    v45 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    v79[1] = v40;
    v46 = v40 + v45;
    v89 = *(_QWORD *)(v44 + 72);
    v88 = *(_QWORD *)(v44 + 64);
    v90 = v44;
    v87 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
    v47 = (uint64_t *)&unk_256433A30;
    v48 = v41;
    v91 = v42;
    do
    {
      v97 = (char *)v79;
      MEMORY[0x24BDAC7A8](v42);
      v50 = (char *)v79 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
      v87(v50, v46, v43);
      v51 = sub_236A6DCC4();
      v96 = v79;
      v95 = v51;
      v98 = *(char **)(v51 - 8);
      v52 = *((_QWORD *)v98 + 8);
      MEMORY[0x24BDAC7A8](v51);
      v92 = (char *)v79 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A28);
      v94 = v79;
      MEMORY[0x24BDAC7A8](v53);
      v55 = (char *)v79 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
      v56 = __swift_instantiateConcreteTypeFromMangledName(v47);
      v93 = v79;
      MEMORY[0x24BDAC7A8](v56);
      v58 = (char *)v79 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_236A6DD54();
      v59 = v47;
      v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A38);
      v61 = *(_QWORD *)(v60 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48))(v58, 1, v60) == 1)
      {
        sub_236A55170((uint64_t)v58, v59);
        v47 = v59;
        (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v98 + 7))(v55, 1, 1, v95);
        v43 = v91;
      }
      else
      {
        v86 = v48;
        v99 = v85;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2564338A8);
        sub_236A61BF4();
        sub_236A5B8A4(&qword_2564338B8, MEMORY[0x24BE581E0], MEMORY[0x24BE581D8]);
        sub_236A6DCD0();
        (*(void (**)(char *, uint64_t))(v61 + 8))(v58, v60);
        v62 = v98;
        v63 = v95;
        if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v98 + 6))(v55, 1, v95) != 1)
        {
          v64 = v92;
          v65 = (*((uint64_t (**)(char *, char *, uint64_t))v62 + 4))(v92, v55, v63);
          MEMORY[0x24BDAC7A8](v65);
          (*((void (**)(char *, char *, uint64_t))v62 + 2))((char *)v79 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0), v64, v63);
          sub_236A61C40((uint64_t)v79 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v100);
          v66 = *(_QWORD **)((char *)v84 + v83);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v43 = v91;
          v47 = (uint64_t *)&unk_256433A30;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            v66 = sub_236A5106C(0, v66[2] + 1, 1, v66);
          v69 = v66[2];
          v68 = v66[3];
          if (v69 >= v68 >> 1)
            v66 = sub_236A5106C((_QWORD *)(v68 > 1), v69 + 1, 1, v66);
          v66[2] = v69 + 1;
          v70 = &v66[16 * v69];
          v71 = v100[0];
          v72 = v100[1];
          v73 = v100[3];
          v70[4] = v100[2];
          v70[5] = v73;
          v70[2] = v71;
          v70[3] = v72;
          v74 = v100[4];
          v75 = v100[5];
          v76 = v100[7];
          v70[8] = v100[6];
          v70[9] = v76;
          v70[6] = v74;
          v70[7] = v75;
          *(uint64_t *)((char *)v84 + v83) = (uint64_t)v66;
          (*((void (**)(char *, uint64_t))v98 + 1))(v92, v63);
          v42 = (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v50, v43);
          v48 = v86;
          goto LABEL_13;
        }
        v48 = v86;
        v43 = v91;
        v47 = (uint64_t *)&unk_256433A30;
      }
      (*(void (**)(char *, uint64_t))(v90 + 8))(v50, v43);
      v42 = sub_236A55170((uint64_t)v55, &qword_256433A28);
LABEL_13:
      v46 += v89;
      --v48;
    }
    while (v48);
  }
  swift_bridgeObjectRelease();
  v77 = *(void **)((char *)v84 + v81);
  objc_msgSend(v77, sel_setDateStyle_, 1);
  objc_msgSend(v77, sel_setTimeStyle_, 1);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v80 - 8) + 8))(v82);
}

uint64_t ATMegadomeLifeEvent.description.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t result;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _OWORD v66[9];

  v1 = v0;
  v63 = 0x6E776F6E6B6E755BLL;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v59[0] = (uint64_t)v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v62 = (uint64_t)v59 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v59 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v59 - v10;
  v12 = v0[1];
  if (v12)
  {
    v61[0] = *v1;
    v61[1] = v12;
  }
  else
  {
    HIBYTE(v61[1]) = -18;
    strcpy((char *)v61, "[unknown name]");
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (int *)type metadata accessor for ATMegadomeLifeEvent();
  sub_236A5EA6C((uint64_t)v1 + v16[5], (uint64_t)v15, &qword_256433898);
  v17 = sub_236A6DC7C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17);
  swift_bridgeObjectRetain();
  if (v19 == 1)
  {
    sub_236A55170((uint64_t)v15, &qword_256433898);
    HIBYTE(v60[1]) = -18;
    strcpy((char *)v60, "[unknown type]");
  }
  else
  {
    v60[0] = sub_236A6DC70();
    v60[1] = v20;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
  }
  v21 = (uint64_t)v1 + v16[6];
  sub_236A5EA6C(v21, (uint64_t)v11, &qword_2564331E0);
  v22 = sub_236A6DC64();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v11, 1, v22);
  sub_236A55170((uint64_t)v11, &qword_2564331E0);
  v26 = 0x6E776F6E6B6E755BLL;
  v27 = 0xEE005D6574616420;
  if (v25 != 1)
  {
    v28 = *(void **)((char *)v1 + v16[9]);
    sub_236A5EA6C(v21, (uint64_t)v9, &qword_2564331E0);
    result = v24(v9, 1, v22);
    if ((_DWORD)result == 1)
    {
      __break(1u);
      goto LABEL_22;
    }
    v30 = (void *)sub_236A6DC10();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v22);
    v31 = objc_msgSend(v28, sel_stringFromDate_, v30);

    v26 = sub_236A6DE38();
    v27 = v32;

  }
  v59[1] = v27;
  v33 = v23;
  v34 = (uint64_t)v1 + v16[7];
  v35 = v62;
  sub_236A5EA6C(v34, v62, &qword_2564331E0);
  v36 = v24((char *)v35, 1, v22);
  sub_236A55170(v35, &qword_2564331E0);
  if (v36 != 1)
  {
    v37 = *(void **)((char *)v1 + v16[9]);
    v38 = v59[0];
    sub_236A5EA6C(v34, v59[0], &qword_2564331E0);
    result = v24((char *)v38, 1, v22);
    if ((_DWORD)result != 1)
    {
      v39 = (void *)sub_236A6DC10();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v38, v22);
      v40 = objc_msgSend(v37, sel_stringFromDate_, v39);

      v41 = sub_236A6DE38();
      v62 = v42;
      v63 = v41;

      goto LABEL_14;
    }
LABEL_22:
    __break(1u);
    return result;
  }
  v62 = 0xEE005D6574616420;
LABEL_14:
  v43 = *(_QWORD *)((char *)v1 + v16[8]);
  v44 = *(_QWORD *)(v43 + 16);
  v45 = MEMORY[0x24BEE4AF8];
  if (v44)
  {
    v59[0] = v26;
    v64 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_236A5314C(0, v44, 0);
    v46 = 32;
    v45 = v64;
    do
    {
      v47 = *(_OWORD *)(v43 + v46);
      v48 = *(_OWORD *)(v43 + v46 + 16);
      v49 = *(_OWORD *)(v43 + v46 + 48);
      v66[2] = *(_OWORD *)(v43 + v46 + 32);
      v66[3] = v49;
      v66[0] = v47;
      v66[1] = v48;
      v50 = *(_OWORD *)(v43 + v46 + 64);
      v51 = *(_OWORD *)(v43 + v46 + 80);
      v52 = *(_OWORD *)(v43 + v46 + 112);
      v66[6] = *(_OWORD *)(v43 + v46 + 96);
      v66[7] = v52;
      v66[4] = v50;
      v66[5] = v51;
      sub_236A6076C((uint64_t)v66);
      v53 = sub_236A5EB48();
      v55 = v54;
      sub_236A607E0((uint64_t)v66);
      v64 = v45;
      v57 = *(_QWORD *)(v45 + 16);
      v56 = *(_QWORD *)(v45 + 24);
      if (v57 >= v56 >> 1)
      {
        sub_236A5314C(v56 > 1, v57 + 1, 1);
        v45 = v64;
      }
      *(_QWORD *)(v45 + 16) = v57 + 1;
      v58 = v45 + 16 * v57;
      *(_QWORD *)(v58 + 32) = v53;
      *(_QWORD *)(v58 + 40) = v55;
      v46 += 128;
      --v44;
    }
    while (v44);
    swift_bridgeObjectRelease();
  }
  v64 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
  sub_236A60854();
  sub_236A6DDFC();
  swift_bridgeObjectRelease();
  v64 = 0;
  v65 = 0xE000000000000000;
  sub_236A6DFDC();
  swift_bridgeObjectRelease();
  v64 = 10;
  v65 = 0xE100000000000000;
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  return v64;
}

uint64_t type metadata accessor for ATMegadomeLifeEvent()
{
  uint64_t result;

  result = qword_256433918;
  if (!qword_256433918)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ATMegadomeDataRetriever.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ATMegadomeDataRetriever.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t ATMegadomeDataRetriever.getLifeEvents(nRecords:start:end:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  char *v55;
  uint64_t (*v56)(char *, uint64_t);
  char *v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;

  v61 = MEMORY[0x24BEE4AF8];
  if (MEMORY[0x24BE58330])
    v3 = MEMORY[0x24BE58338] == 0;
  else
    v3 = 1;
  if (v3 || MEMORY[0x24BE58340] == 0 || MEMORY[0x24BE58320] == 0 || MEMORY[0x24BE58328] == 0)
    return v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564338A8);
  v10 = sub_236A6DCF4();
  v53 = a1;
  v11 = sub_236A6DC64();
  v54 = &v42;
  v12 = *(uint64_t **)(v11 - 8);
  v13 = v12[8];
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  v57 = (char *)&v42 - v15;
  MEMORY[0x24BDAC7A8](v14);
  result = sub_236A6DC58();
  if ((unsigned __int128)(a2 * (__int128)86400) >> 64 != (86400 * a2) >> 63)
  {
    __break(1u);
    goto LABEL_22;
  }
  sub_236A6DC04();
  v52 = v12;
  v56 = (uint64_t (*)(char *, uint64_t))v12[1];
  v17 = v56((char *)&v42 - v15, v11);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v55 = (char *)&v42 - v15;
  MEMORY[0x24BDAC7A8](v18);
  result = sub_236A6DC58();
  if ((unsigned __int128)(a3 * (__int128)86400) >> 64 != (86400 * a3) >> 63)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v49 = &v42;
  v50 = v10;
  v51 = 0;
  sub_236A6DC04();
  v56((char *)&v42 - v15, v11);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433878);
  v48 = &v42;
  v46 = v19;
  v20 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  v47 = (uint64_t)&v42 - v21;
  sub_236A5E9DC();
  result = sub_236A6DE14();
  if ((result & 1) != 0)
  {
    v45 = &v42;
    MEMORY[0x24BDAC7A8](result);
    v43 = (char *)&v42 - v21;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433870);
    v44 = &v42;
    v23 = (*(_QWORD *)(*(_QWORD *)(v22 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
    v24 = (char *)&v42 + *(int *)(MEMORY[0x24BDAC7A8](v22) + 48) - v23;
    v25 = v52;
    v26 = (void (*)(char *, char *, uint64_t))v52[2];
    v26((char *)&v42 - v23, v57, v11);
    v27 = ((uint64_t (*)(char *, char *, uint64_t))v26)(v24, v55, v11);
    v42 = (uint64_t)&v42;
    MEMORY[0x24BDAC7A8](v27);
    v28 = (char *)&v42 + *(int *)(v22 + 48) - v23;
    v26((char *)&v42 - v23, (char *)&v42 - v23, v11);
    v26(v28, v24, v11);
    v29 = (void (*)(char *, char *, uint64_t))v25[4];
    v30 = (uint64_t)v43;
    v29(v43, (char *)&v42 - v23, v11);
    v31 = (void (*)(char *, uint64_t))v56;
    v32 = v56(v28, v11);
    v52 = &v42;
    MEMORY[0x24BDAC7A8](v32);
    v33 = (char *)&v42 + *(int *)(v22 + 48) - v23;
    v29((char *)&v42 - v23, (char *)&v42 - v23, v11);
    v29(v33, v24, v11);
    v29((char *)(v30 + *(int *)(v46 + 36)), v33, v11);
    v31((char *)&v42 - v23, v11);
    v34 = v47;
    v35 = sub_236A55220(v30, v47, &qword_256433878);
    MEMORY[0x24BDAC7A8](v35);
    v36 = v50;
    *(&v42 - 4) = (uint64_t)&v61;
    *(&v42 - 3) = v36;
    *(&v42 - 2) = v53;
    sub_236A5B8A4(&qword_2564338B8, MEMORY[0x24BE581E0], MEMORY[0x24BE581D8]);
    v37 = v51;
    sub_236A6DCE8();
    sub_236A55170(v34, &qword_256433878);
    v38 = (void (*)(char *, uint64_t))v56;
    v56(v55, v11);
    v38(v57, v11);
    swift_release();
    if (v37)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2564338B0);
      v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_236A6E990;
      v59 = 0;
      v60 = 0xE000000000000000;
      sub_236A6DFDC();
      sub_236A6DE74();
      v58 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433318);
      sub_236A6E060();
      sub_236A6DE74();
      v40 = v59;
      v41 = v60;
      *(_QWORD *)(v39 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v39 + 32) = v40;
      *(_QWORD *)(v39 + 40) = v41;
      sub_236A6E15C();
      swift_bridgeObjectRelease();

    }
    return v61;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_236A605C4(uint64_t a1, BOOL *a2, unint64_t *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  _QWORD v23[2];

  v10 = type metadata accessor for ATMegadomeLifeEvent();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (_QWORD *)((char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_236A6DD24();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v17 + 16))(v16, a1);
  swift_retain();
  sub_236A5EF28((uint64_t)v16, a4, v13);
  v18 = *a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v18;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v18 = sub_236A51178(0, *(_QWORD *)(v18 + 16) + 1, 1, v18);
    *a3 = v18;
  }
  v21 = *(_QWORD *)(v18 + 16);
  v20 = *(_QWORD *)(v18 + 24);
  if (v21 >= v20 >> 1)
  {
    v18 = sub_236A51178(v20 > 1, v21 + 1, 1, v18);
    *a3 = v18;
  }
  *(_QWORD *)(v18 + 16) = v21 + 1;
  result = sub_236A61BB0((uint64_t)v13, v18+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v21);
  *a2 = *(_QWORD *)(*a3 + 16) >= a5;
  return result;
}

uint64_t ATMegadomeDataRetriever.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ATMegadomeDataRetriever.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_236A6076C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_236A607E0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_236A60854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2564338A0;
  if (!qword_2564338A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256433348);
    result = MEMORY[0x23B7FA574](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2564338A0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FA568](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_236A608E4(uint64_t a1, BOOL *a2)
{
  uint64_t v2;

  return sub_236A605C4(a1, a2, *(unint64_t **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t *initializeBufferWithCopyOfBuffer for ATMegadomeLifeEvent(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_236A6DC7C();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[6];
    v17 = (char *)v4 + v16;
    v18 = (char *)a2 + v16;
    v19 = sub_236A6DC64();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    if (v21(v18, 1, v19))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    v23 = a3[7];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    if (v21((char *)a2 + v23, 1, v19))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v25, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v19);
    }
    v27 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    v28 = *(void **)((char *)a2 + v27);
    *(uint64_t *)((char *)v4 + v27) = (uint64_t)v28;
    swift_bridgeObjectRetain();
    v29 = v28;
  }
  return v4;
}

void destroy for ATMegadomeLifeEvent(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_236A6DC7C();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + a2[6];
  v8 = sub_236A6DC64();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  v11 = a1 + a2[7];
  if (!v10(v11, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for ATMegadomeLifeEvent(_QWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v6 = *((_QWORD *)a2 + 1);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = &a2[v7];
  v10 = sub_236A6DC7C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[6];
  v15 = (char *)a1 + v14;
  v16 = &a2[v14];
  v17 = sub_236A6DC64();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = &a2[v21];
  if (v19(&a2[v21], 1, v17))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v22, v23, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  v25 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)&a2[a3[8]];
  v26 = *(void **)&a2[v25];
  *(_QWORD *)((char *)a1 + v25) = v26;
  swift_bridgeObjectRetain();
  v27 = v26;
  return a1;
}

char *assignWithCopy for ATMegadomeLifeEvent(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = (char *)a2 + v6;
  v9 = sub_236A6DC7C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = (char *)a2 + v15;
  v18 = sub_236A6DC64();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_13:
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = (char *)a2 + v24;
  v27 = v20(&a1[v24], 1, v18);
  v28 = v20(v26, 1, v18);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v25, v26, v18);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v18);
    goto LABEL_18;
  }
  if (v28)
  {
LABEL_18:
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v25, v26, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
LABEL_19:
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = a3[9];
  v31 = *(void **)((char *)a2 + v30);
  v32 = *(void **)&a1[v30];
  *(_QWORD *)&a1[v30] = v31;
  v33 = v31;

  return a1;
}

_OWORD *initializeWithTake for ATMegadomeLifeEvent(_OWORD *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = &a2[v6];
  v9 = sub_236A6DC7C();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = &a2[v12];
  v15 = sub_236A6DC64();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v15))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v19 = a3[7];
  v20 = (char *)a1 + v19;
  v21 = &a2[v19];
  if (v17(&a2[v19], 1, v15))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v21, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v20, 0, 1, v15);
  }
  v23 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)&a2[a3[8]];
  *(_QWORD *)((char *)a1 + v23) = *(_QWORD *)&a2[v23];
  return a1;
}

char *assignWithTake for ATMegadomeLifeEvent(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v6 = a2[1];
  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = (char *)a2 + v7;
  v10 = sub_236A6DC7C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = (char *)a2 + v16;
  v19 = sub_236A6DC64();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
LABEL_13:
  v25 = a3[7];
  v26 = &a1[v25];
  v27 = (char *)a2 + v25;
  v28 = v21(&a1[v25], 1, v19);
  v29 = v21(v27, 1, v19);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v26, v27, v19);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v26, v19);
    goto LABEL_18;
  }
  if (v29)
  {
LABEL_18:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v26, v27, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v26, 0, 1, v19);
LABEL_19:
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  v31 = a3[9];
  v32 = *(void **)&a1[v31];
  *(_QWORD *)&a1[v31] = *(_QWORD *)((char *)a2 + v31);

  return a1;
}

uint64_t getEnumTagSinglePayload for ATMegadomeLifeEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_236A61580(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v12 = *(_QWORD *)(a1 + a3[8]);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for ATMegadomeLifeEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_236A61638(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433898);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[8]) = (a2 - 1);
  return result;
}

void sub_236A616E0()
{
  unint64_t v0;
  unint64_t v1;

  sub_236A617AC(319, qword_256433928, (void (*)(uint64_t))MEMORY[0x24BE58070]);
  if (v0 <= 0x3F)
  {
    sub_236A617AC(319, qword_2564333E8, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_236A617AC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_236A6DF64();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t type metadata accessor for ATMegadomeDataRetriever()
{
  return objc_opt_self();
}

uint64_t destroy for ATLocation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  v8 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATLocation(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = a2[6];
  *(_QWORD *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = a2[8];
  *(_QWORD *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = a2[10];
  *(_QWORD *)(a1 + 88) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = a2[12];
  *(_QWORD *)(a1 + 104) = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = a2[14];
  *(_QWORD *)(a1 + 120) = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for ATLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ATLocation(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ATLocation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 128) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ATLocation()
{
  return &type metadata for ATLocation;
}

uint64_t sub_236A61BB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ATMegadomeLifeEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_236A61BF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256433A40;
  if (!qword_256433A40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2564338A8);
    result = MEMORY[0x23B7FA574](MEMORY[0x24BE58338], v1);
    atomic_store(result, (unint64_t *)&qword_256433A40);
  }
  return result;
}

uint64_t sub_236A61C40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  char v10;
  char v11;
  char *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
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
  char v62;
  char v63;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A48);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  MEMORY[0x24BDAC7A8](v4);
  sub_236A6DCB8();
  v6 = sub_236A6DDCC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8((char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v6) == 1)
  {
    v9 = sub_236A55170((uint64_t)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A48);
    v61 = 0;
    v10 = 1;
  }
  else
  {
    v61 = sub_236A6DDB4();
    v10 = v11 & 1;
    v9 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))((char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  }
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DCB8();
  if (v8(v12, 1, v6) == 1)
  {
    sub_236A55170((uint64_t)v12, &qword_256433A48);
    v60 = 0;
    v13 = 1;
  }
  else
  {
    v60 = sub_236A6DDC0();
    v13 = v14 & 1;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  v63 = v10;
  v62 = v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433A50);
  v16 = *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64);
  MEMORY[0x24BDAC7A8](v15);
  sub_236A6DCAC();
  v17 = sub_236A6DDA8();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    v20 = sub_236A55170((uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A50);
    v58 = 0;
    v59 = 0;
  }
  else
  {
    v21 = sub_236A6DD90();
    v58 = v22;
    v59 = v21;
    v20 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x24BDAC7A8](v20);
  sub_236A6DCAC();
  if (v19((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    v23 = sub_236A55170((uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A50);
    v55 = 0;
    v56 = 0;
  }
  else
  {
    v24 = sub_236A6DD78();
    v55 = v25;
    v56 = v24;
    v23 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x24BDAC7A8](v23);
  sub_236A6DCAC();
  if (v19((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    v26 = sub_236A55170((uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A50);
    v53 = 0;
    v54 = 0;
  }
  else
  {
    v27 = sub_236A6DD84();
    v53 = v28;
    v54 = v27;
    v26 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x24BDAC7A8](v26);
  sub_236A6DCAC();
  v29 = v19((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17);
  v57 = v18;
  if (v29 == 1)
  {
    v30 = sub_236A55170((uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A50);
    v51 = 0;
    v52 = 0;
  }
  else
  {
    v31 = sub_236A6DD60();
    v51 = v32;
    v52 = v31;
    v30 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x24BDAC7A8](v30);
  sub_236A6DCAC();
  if (v19((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    v33 = sub_236A55170((uint64_t)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256433A50);
    v34 = 0;
    v35 = 0;
  }
  else
  {
    v34 = sub_236A6DD9C();
    v35 = v36;
    v33 = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DCAC();
  if (v19(v37, 1, v17) == 1)
  {
    v38 = sub_236A6DCC4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 8))(a1, v38);
    result = sub_236A55170((uint64_t)v37, &qword_256433A50);
    v40 = 0;
    v41 = 0;
  }
  else
  {
    v40 = sub_236A6DD6C();
    v41 = v42;
    v43 = sub_236A6DCC4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 8))(a1, v43);
    result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v37, v17);
  }
  v44 = v63;
  v45 = v62;
  *(_QWORD *)a2 = v61;
  *(_BYTE *)(a2 + 8) = v44;
  *(_QWORD *)(a2 + 16) = v60;
  *(_BYTE *)(a2 + 24) = v45;
  v46 = v58;
  *(_QWORD *)(a2 + 32) = v59;
  *(_QWORD *)(a2 + 40) = v46;
  v47 = v55;
  *(_QWORD *)(a2 + 48) = v56;
  *(_QWORD *)(a2 + 56) = v47;
  v48 = v53;
  *(_QWORD *)(a2 + 64) = v54;
  *(_QWORD *)(a2 + 72) = v48;
  v49 = v51;
  *(_QWORD *)(a2 + 80) = v52;
  *(_QWORD *)(a2 + 88) = v49;
  *(_QWORD *)(a2 + 96) = v34;
  *(_QWORD *)(a2 + 104) = v35;
  *(_QWORD *)(a2 + 112) = v40;
  *(_QWORD *)(a2 + 120) = v41;
  return result;
}

uint64_t ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[8] = a5;
  v6[9] = v5;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  return swift_task_switch();
}

uint64_t sub_236A621DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = v0[9];
  v3 = v0[4];
  v2 = v0[5];
  v4 = sub_236A65378(v3, v2, v0[7], v0[8]);
  v0[10] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[11] = v5;
  v5[2] = v1;
  v5[3] = v3;
  v5[4] = v2;
  v5[5] = v4;
  v6 = (_QWORD *)swift_task_alloc();
  v0[12] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433A60);
  *v6 = v0;
  v6[1] = sub_236A622B4;
  return sub_236A6E0E4();
}

uint64_t sub_236A622B4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A62310()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
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
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 16);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = (void *)(v0 + 24);
    v3 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 48);
    swift_retain();
    v5 = swift_bridgeObjectRetain();
    sub_236A654F4(v5, v3);
    swift_release();
    swift_bridgeObjectRelease_n();
    swift_retain();
    v6 = swift_bridgeObjectRetain();
    v7 = sub_236A65058(v6, v3);
    swift_release();
    swift_bridgeObjectRelease_n();
    *(_QWORD *)(v0 + 16) = v7;
    sub_236A62D38((unint64_t *)(v0 + 16));
    v1 = *(_QWORD *)(v0 + 16);
    if (*(_QWORD *)(v1 + 16) > v4)
    {
      v8 = *(_QWORD *)(v0 + 48);
      if (v8 < 0)
      {
        __break(1u);
      }
      else
      {
        sub_236A6E0FC();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain_n();
        v9 = swift_dynamicCastClass();
        if (v9)
        {
          v10 = v8;
        }
        else
        {
          swift_bridgeObjectRelease();
          v10 = *(_QWORD *)(v0 + 48);
          v9 = MEMORY[0x24BEE4AF8];
        }
        v11 = *(_QWORD *)(v9 + 16);
        swift_release();
        v2 = *(void **)(v0 + 80);
        if (v11 == v10)
        {
          v12 = swift_dynamicCastClass();

          if (!v12)
          {
            swift_bridgeObjectRelease();
            v12 = MEMORY[0x24BEE4AF8];
          }
          goto LABEL_11;
        }
      }
      swift_bridgeObjectRelease();
      v14 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8) + 80);
      v12 = sub_236A51A1C(v1, v1 + ((v14 + 32) & ~v14), 0, (2 * v8) | 1);

LABEL_11:
      swift_bridgeObjectRelease_n();
      v1 = v12;
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
    }
  }

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t ATSpotlightDataRetriever.getRecentRecords(bundleId:nRecords:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v16;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433718);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = dispatch_semaphore_create(0);
  v12 = sub_236A6DEEC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  v14 = v11;
  sub_236A5E6E0((uint64_t)v10, (uint64_t)&unk_256433720, (uint64_t)v13);
  swift_release();
  sub_236A6DF34();

  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRetriever.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v1 = v0;
  v2 = sub_236A6DC64();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A6DC58();
  sub_236A6DC04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x24BEE4AF8];
  return v1;
}

uint64_t ATSpotlightDataRetriever.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  v2 = sub_236A6DC64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_236A6270C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236A5945C(a1, a2);
}

uint64_t sub_236A62714(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;

  swift_bridgeObjectRetain();
  sub_236A651B0(a1, a3, a4);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v7 = swift_bridgeObjectRetain();
  sub_236A58C64(v7);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236A627AC(void *a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint8_t *v28;
  uint8_t *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(_QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];

  v7 = sub_236A6DDF0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - v12;
  if (a1)
  {
    sub_236A6DDE4();
    v14 = a1;
    v15 = a1;
    v16 = sub_236A6DDD8();
    v17 = sub_236A6DF1C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v35 = v7;
      v19 = (uint8_t *)v18;
      v20 = swift_slowAlloc();
      v33 = a2;
      v21 = v20;
      v37[0] = v20;
      *(_DWORD *)v19 = 136315138;
      v34 = v8;
      swift_getErrorValue();
      v22 = sub_236A6E120();
      v36 = sub_236A62F84(v22, v23, v37);
      sub_236A6DF70();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_236A4B000, v16, v17, "Failed to fetch items with error %s", v19, 0xCu);
      swift_arrayDestroy();
      v24 = v21;
      a2 = v33;
      MEMORY[0x23B7FA5E0](v24, -1, -1);
      MEMORY[0x23B7FA5E0](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
    return a2(0);
  }
  else
  {
    sub_236A6DDE4();
    swift_retain();
    v25 = sub_236A6DDD8();
    v26 = sub_236A6DF10();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v35 = v7;
      v28 = v27;
      v34 = v8;
      *(_DWORD *)v27 = 134217984;
      swift_beginAccess();
      v37[0] = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 16);
      v8 = v34;
      sub_236A6DF70();
      swift_release();
      _os_log_impl(&dword_236A4B000, v25, v26, "Fetched %ld items from Spotlight", v28, 0xCu);
      v29 = v28;
      v7 = v35;
      MEMORY[0x23B7FA5E0](v29, -1, -1);

    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    swift_beginAccess();
    v31 = swift_bridgeObjectRetain();
    a2(v31);
    return swift_bridgeObjectRelease();
  }
}

uint64_t ATSpotlightDataRetriever.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_236A6DC64();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = swift_allocObject();
  sub_236A6DC58();
  sub_236A6DC04();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x24BEE4AF8];
  return v4;
}

uint64_t sub_236A62BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433BA8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_236A65A48(a3, a4, a5, (uint64_t)sub_236A65A08, v13);
  return swift_release();
}

uint64_t sub_236A62CE4()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433BA8);
  return sub_236A6DED4();
}

uint64_t sub_236A62D38(unint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_236A65030(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_236A635C4(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_236A62DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v13;

  v8[2] = a4;
  v8[3] = a8;
  v13 = (_QWORD *)swift_task_alloc();
  v8[4] = v13;
  *v13 = v8;
  v13[1] = sub_236A62E3C;
  v13[8] = 0;
  v13[9] = a4;
  v13[6] = a7;
  v13[7] = 0;
  v13[4] = a5;
  v13[5] = a6;
  return swift_task_switch();
}

uint64_t sub_236A62E3C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A62E98()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  sub_236A6DF40();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ATSpotlightDataRetriever.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  v2 = sub_236A6DC64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_236A62F40(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_236A62F74(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_236A62F84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_236A63054(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_236A550F0((uint64_t)v12, *a3);
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
      sub_236A550F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_236A63054(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_236A6DF7C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_236A6320C(a5, a6);
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
  v8 = sub_236A6E00C();
  if (!v8)
  {
    sub_236A6E06C();
    __break(1u);
LABEL_17:
    result = sub_236A6E0B4();
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

uint64_t sub_236A6320C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_236A632A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_236A63478(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_236A63478(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_236A632A0(uint64_t a1, unint64_t a2)
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
      v3 = sub_236A63414(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_236A6DFE8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_236A6E06C();
      __break(1u);
LABEL_10:
      v2 = sub_236A6DE80();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_236A6E0B4();
    __break(1u);
LABEL_14:
    result = sub_236A6E06C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_236A63414(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433BB0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_236A63478(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433BB0);
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
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

uint64_t sub_236A635C4(uint64_t *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  char *v37;
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
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  _BYTE *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int (*v96)(uint64_t, uint64_t, uint64_t);
  void (*v97)(char *, uint64_t, uint64_t);
  char *v98;
  uint64_t v99;
  int *v100;
  uint64_t v101;
  unsigned int (*v102)(uint64_t, uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  char *v107;
  int *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char v113;
  char *v114;
  void (*v115)(char *, uint64_t);
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  char v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  void (*v128)(char *, uint64_t);
  char *v129;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v131;
  unint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  BOOL v147;
  unint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  BOOL v157;
  uint64_t v158;
  char v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  BOOL v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char *v176;
  char *v177;
  char *v178;
  uint64_t v179;
  char *v180;
  unint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  unint64_t v192;
  char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  char *v201;
  unint64_t v202;
  uint64_t v203;
  char *v204;
  uint64_t v205;
  char *v206;
  char *v207;
  char *v208;
  char *v209;
  char *v210;
  uint64_t v211;
  char *v212;
  uint64_t v213;
  char *v214;
  char *v215;
  char *v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t *v229;
  char *v230;
  uint64_t v231;
  uint64_t v232;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v193 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v193 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v193 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v193 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v193 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v211 = (uint64_t)&v193 - v18;
  v19 = sub_236A6DC64();
  v231 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v209 = (char *)&v193 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v215 = (char *)&v193 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v221 = (char *)&v193 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v230 = (char *)&v193 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v201 = (char *)&v193 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v210 = (char *)&v193 - v30;
  v222 = type metadata accessor for ATSpotlightDataRecord();
  v203 = *(_QWORD *)(v222 - 8);
  v31 = MEMORY[0x24BDAC7A8](v222);
  v197 = (uint64_t)&v193 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v223 = (uint64_t)&v193 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v193 - v36;
  v38 = MEMORY[0x24BDAC7A8](v35);
  v214 = (char *)&v193 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v213 = (uint64_t)&v193 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v217 = (char *)&v193 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v216 = (char *)&v193 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v232 = (uint64_t)&v193 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v199 = (uint64_t)&v193 - v49;
  MEMORY[0x24BDAC7A8](v48);
  v198 = (uint64_t)&v193 - v50;
  v229 = a1;
  v51 = a1[1];
  result = sub_236A6E0CC();
  if (result >= v51)
  {
    if (v51 < 0)
      goto LABEL_166;
    if (v51)
      return sub_236A64700(0, v51, 1, v229);
    return result;
  }
  v195 = result;
  if (v51 >= 0)
    v53 = v51;
  else
    v53 = v51 + 1;
  if (v51 < -1)
    goto LABEL_174;
  v207 = v8;
  v208 = v5;
  v206 = v37;
  if (v51 < 2)
  {
    v58 = MEMORY[0x24BEE4AF8];
    v202 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v203 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v203 + 80));
    if (v51 != 1)
    {
      v61 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v60 = (char *)MEMORY[0x24BEE4AF8];
      goto LABEL_132;
    }
    v54 = 1;
    v194 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v54 = v51;
    v55 = v53 >> 1;
    v56 = sub_236A6DEBC();
    *(_QWORD *)(v56 + 16) = v55;
    v57 = *(unsigned __int8 *)(v203 + 80);
    v194 = v56;
    v202 = v56 + ((v57 + 32) & ~v57);
  }
  v59 = 0;
  v60 = (char *)MEMORY[0x24BEE4AF8];
  v220 = v11;
  v212 = v14;
  v204 = v17;
  do
  {
    v62 = v59 + 1;
    v200 = v59;
    if (v59 + 1 >= v54)
    {
      v71 = v59 + 1;
      v77 = v216;
      v78 = (uint64_t)v217;
      goto LABEL_40;
    }
    v63 = *v229;
    v64 = *(_QWORD *)(v203 + 72);
    v228 = v64;
    v65 = v198;
    sub_236A5945C(v63 + v64 * v62, v198);
    v66 = v63 + v64 * v200;
    v67 = v199;
    sub_236A5945C(v66, v199);
    v68 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v67, v65);
    v69 = v67;
    v70 = v63;
    sub_236A5B868(v69);
    sub_236A5B868(v65);
    v59 = v200;
    v71 = v200 + 2;
    v225 = v70;
    if (v200 + 2 >= v54)
    {
      v77 = v216;
      v78 = (uint64_t)v217;
      if ((v68 & 1) == 0)
        goto LABEL_40;
    }
    else
    {
      v226 = v228 * v71;
      v227 = v228 * v62;
      while (1)
      {
        v72 = v54;
        v73 = v71;
        v74 = v198;
        sub_236A5945C(v70 + v226, v198);
        v75 = v199;
        sub_236A5945C(v70 + v227, v199);
        v76 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v75, v74);
        sub_236A5B868(v75);
        sub_236A5B868(v74);
        if (((v68 ^ v76) & 1) != 0)
          break;
        v71 = v73 + 1;
        v70 += v228;
        v54 = v72;
        if (v72 == v73 + 1)
        {
          v71 = v72;
          v11 = v220;
          v77 = v216;
          v59 = v200;
          v78 = (uint64_t)v217;
          if ((v68 & 1) != 0)
            goto LABEL_27;
          goto LABEL_40;
        }
      }
      v11 = v220;
      v77 = v216;
      v71 = v73;
      v59 = v200;
      v54 = v72;
      v78 = (uint64_t)v217;
      if ((v68 & 1) == 0)
        goto LABEL_40;
    }
LABEL_27:
    if (v71 < v59)
      goto LABEL_167;
    if (v59 < v71)
    {
      v227 = v54;
      v193 = v60;
      v79 = 0;
      v80 = v228;
      v81 = v228 * (v71 - 1);
      v82 = v71 * v228;
      v83 = v59;
      v84 = v59 * v228;
      v219 = v71;
      do
      {
        if (v83 != v71 + v79 - 1)
        {
          v85 = v225;
          if (!v225)
            goto LABEL_172;
          v86 = v225 + v84;
          sub_236A5E998(v225 + v84, v197);
          if (v84 < v81 || v86 >= v85 + v82)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v84 != v81)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          sub_236A5E998(v197, v85 + v81);
          v71 = v219;
          v11 = v220;
          v80 = v228;
        }
        ++v83;
        --v79;
        v81 -= v80;
        v82 -= v80;
        v84 += v80;
      }
      while (v83 < v71 + v79);
      v60 = v193;
      v77 = v216;
      v78 = (uint64_t)v217;
      v59 = v200;
      v54 = v227;
    }
LABEL_40:
    if (v71 >= v54)
      goto LABEL_82;
    v147 = __OFSUB__(v71, v59);
    v87 = v71 - v59;
    if (v147)
      goto LABEL_165;
    if (v87 < v195)
    {
      if (__OFADD__(v200, v195))
        goto LABEL_168;
      if (v200 + v195 >= v54)
        v88 = v54;
      else
        v88 = v200 + v195;
      if (v88 >= v200)
      {
        if (v71 == v88)
        {
          v59 = v200;
          goto LABEL_82;
        }
        v193 = v60;
        v218 = *(_QWORD *)(v203 + 72);
        v227 = v71 * v218;
        v228 = v218 * (v71 - 1);
        v89 = (int *)v222;
        v196 = v88;
LABEL_53:
        v91 = 0;
        v92 = v200;
        v219 = v71;
        while (1)
        {
          v226 = v92;
          v93 = *v229;
          v225 = v227 + v91;
          sub_236A5945C(v227 + v91 + v93, v232);
          v224 = v228 + v91;
          sub_236A5945C(v228 + v91 + v93, (uint64_t)v77);
          if (*v77 == 5)
          {
            v94 = v211;
            sub_236A55D9C((uint64_t)&v77[v89[16]], v211);
            v95 = v231;
            v96 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v231 + 48);
            if (v96(v94, 1, v19) != 1)
            {
              v97 = *(void (**)(char *, uint64_t, uint64_t))(v95 + 32);
              v98 = v210;
              v97(v210, v211, v19);
              v94 = (uint64_t)v204;
              sub_236A55D9C(v232 + *(int *)(v222 + 64), (uint64_t)v204);
              if (v96(v94, 1, v19) != 1)
              {
                v127 = v201;
                v97(v201, v94, v19);
                v113 = sub_236A6DC28();
                v128 = *(void (**)(char *, uint64_t))(v95 + 8);
                v129 = v127;
                v78 = (uint64_t)v217;
                v128(v129, v19);
                v128(v210, v19);
                goto LABEL_76;
              }
              (*(void (**)(char *, uint64_t))(v95 + 8))(v98, v19);
              v11 = v220;
            }
            sub_236A65964(v94);
            v89 = (int *)v222;
          }
          v99 = (uint64_t)v212;
          sub_236A55D9C((uint64_t)&v77[v89[9]], (uint64_t)v212);
          sub_236A5945C((uint64_t)v77, v78);
          v100 = v89;
          v101 = v231;
          v102 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v231 + 48);
          if (v102(v99, 1, v19) == 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v230, v78 + v89[7], v19);
            sub_236A5B868(v78);
            sub_236A65964(v99);
          }
          else
          {
            sub_236A5B868(v78);
            (*(void (**)(char *, uint64_t, uint64_t))(v101 + 32))(v230, v99, v19);
          }
          v103 = v232;
          sub_236A55D9C(v232 + v89[9], (uint64_t)v11);
          v104 = v103;
          v105 = v213;
          sub_236A5945C(v104, v213);
          v106 = v102((uint64_t)v11, 1, v19);
          v107 = v221;
          v108 = v100;
          if (v106 == 1)
          {
            v109 = v231;
            (*(void (**)(char *, uint64_t, uint64_t))(v231 + 16))(v221, v105 + v100[7], v19);
            sub_236A5B868(v105);
            sub_236A65964((uint64_t)v11);
          }
          else
          {
            sub_236A5B868(v105);
            v109 = v231;
            (*(void (**)(char *, char *, uint64_t))(v231 + 32))(v107, v11, v19);
          }
          v110 = (uint64_t)v214;
          v77 = v216;
          sub_236A5B8A4(&qword_2564335C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
          v111 = v230;
          if ((sub_236A6DE20() & 1) != 0)
          {
            v112 = (uint64_t)v207;
            sub_236A55D9C((uint64_t)&v77[v108[8]], (uint64_t)v207);
            sub_236A5945C((uint64_t)v77, v110);
            if (v102(v112, 1, v19) == 1)
            {
              (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v215, v110 + v108[7], v19);
              sub_236A5B868(v110);
              sub_236A65964(v112);
            }
            else
            {
              sub_236A5B868(v110);
              (*(void (**)(char *, uint64_t, uint64_t))(v109 + 32))(v215, v112, v19);
            }
            v117 = v232;
            v118 = (uint64_t)v208;
            sub_236A55D9C(v232 + v108[8], (uint64_t)v208);
            v119 = v117;
            v120 = (uint64_t)v206;
            sub_236A5945C(v119, (uint64_t)v206);
            if (v102(v118, 1, v19) == 1)
            {
              v121 = v209;
              (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v209, v120 + v108[7], v19);
              sub_236A5B868(v120);
              sub_236A65964(v118);
            }
            else
            {
              sub_236A5B868(v120);
              v121 = v209;
              (*(void (**)(char *, uint64_t, uint64_t))(v109 + 32))(v209, v118, v19);
            }
            v122 = v215;
            v123 = sub_236A6DC28();
            v124 = v121;
            v113 = v123;
            v115 = *(void (**)(char *, uint64_t))(v109 + 8);
            v115(v124, v19);
            v115(v122, v19);
            v115(v221, v19);
            v116 = v230;
          }
          else
          {
            v113 = sub_236A6DC28();
            v114 = v111;
            v115 = *(void (**)(char *, uint64_t))(v109 + 8);
            v115(v107, v19);
            v116 = v114;
          }
          v115(v116, v19);
          v78 = (uint64_t)v217;
LABEL_76:
          sub_236A5B868((uint64_t)v77);
          sub_236A5B868(v232);
          if ((v113 & 1) == 0)
          {
            v90 = v219;
            v11 = v220;
            v89 = (int *)v222;
LABEL_52:
            v71 = v90 + 1;
            v228 += v218;
            v227 += v218;
            if (v71 == v196)
            {
              v71 = v196;
              v60 = v193;
              goto LABEL_81;
            }
            goto LABEL_53;
          }
          v125 = *v229;
          v89 = (int *)v222;
          if (!*v229)
            goto LABEL_170;
          v126 = v125 + v228 + v91;
          sub_236A5E998(v125 + v227 + v91, v223);
          swift_arrayInitWithTakeFrontToBack();
          sub_236A5E998(v223, v126);
          v90 = v219;
          v91 -= v218;
          v92 = v226 + 1;
          v11 = v220;
          if (v219 == v226 + 1)
            goto LABEL_52;
        }
      }
LABEL_169:
      __break(1u);
LABEL_170:
      __break(1u);
LABEL_171:
      __break(1u);
LABEL_172:
      __break(1u);
LABEL_173:
      __break(1u);
LABEL_174:
      result = sub_236A6E06C();
      __break(1u);
      return result;
    }
LABEL_81:
    v59 = v200;
LABEL_82:
    if (v71 < v59)
      goto LABEL_160;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v219 = v71;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v60 = sub_236A64D44(0, *((_QWORD *)v60 + 2) + 1, 1, v60);
    v132 = *((_QWORD *)v60 + 2);
    v131 = *((_QWORD *)v60 + 3);
    v61 = v132 + 1;
    if (v132 >= v131 >> 1)
      v60 = sub_236A64D44((char *)(v131 > 1), v132 + 1, 1, v60);
    *((_QWORD *)v60 + 2) = v61;
    v133 = v60 + 32;
    v134 = &v60[16 * v132 + 32];
    v135 = v219;
    *(_QWORD *)v134 = v200;
    *((_QWORD *)v134 + 1) = v135;
    if (v132)
    {
      while (1)
      {
        v136 = v61 - 1;
        if (v61 >= 4)
        {
          v141 = &v133[16 * v61];
          v142 = *((_QWORD *)v141 - 8);
          v143 = *((_QWORD *)v141 - 7);
          v147 = __OFSUB__(v143, v142);
          v144 = v143 - v142;
          if (v147)
            goto LABEL_149;
          v146 = *((_QWORD *)v141 - 6);
          v145 = *((_QWORD *)v141 - 5);
          v147 = __OFSUB__(v145, v146);
          v139 = v145 - v146;
          v140 = v147;
          if (v147)
            goto LABEL_150;
          v148 = v61 - 2;
          v149 = &v133[16 * v61 - 32];
          v151 = *(_QWORD *)v149;
          v150 = *((_QWORD *)v149 + 1);
          v147 = __OFSUB__(v150, v151);
          v152 = v150 - v151;
          if (v147)
            goto LABEL_152;
          v147 = __OFADD__(v139, v152);
          v153 = v139 + v152;
          if (v147)
            goto LABEL_155;
          if (v153 >= v144)
          {
            v171 = &v133[16 * v136];
            v173 = *(_QWORD *)v171;
            v172 = *((_QWORD *)v171 + 1);
            v147 = __OFSUB__(v172, v173);
            v174 = v172 - v173;
            if (v147)
              goto LABEL_159;
            v164 = v139 < v174;
            goto LABEL_119;
          }
        }
        else
        {
          if (v61 != 3)
          {
            v165 = *((_QWORD *)v60 + 4);
            v166 = *((_QWORD *)v60 + 5);
            v147 = __OFSUB__(v166, v165);
            v158 = v166 - v165;
            v159 = v147;
            goto LABEL_113;
          }
          v138 = *((_QWORD *)v60 + 4);
          v137 = *((_QWORD *)v60 + 5);
          v147 = __OFSUB__(v137, v138);
          v139 = v137 - v138;
          v140 = v147;
        }
        if ((v140 & 1) != 0)
          goto LABEL_151;
        v148 = v61 - 2;
        v154 = &v133[16 * v61 - 32];
        v156 = *(_QWORD *)v154;
        v155 = *((_QWORD *)v154 + 1);
        v157 = __OFSUB__(v155, v156);
        v158 = v155 - v156;
        v159 = v157;
        if (v157)
          goto LABEL_154;
        v160 = &v133[16 * v136];
        v162 = *(_QWORD *)v160;
        v161 = *((_QWORD *)v160 + 1);
        v147 = __OFSUB__(v161, v162);
        v163 = v161 - v162;
        if (v147)
          goto LABEL_157;
        if (__OFADD__(v158, v163))
          goto LABEL_158;
        if (v158 + v163 >= v139)
        {
          v164 = v139 < v163;
LABEL_119:
          if (v164)
            v136 = v148;
          goto LABEL_121;
        }
LABEL_113:
        if ((v159 & 1) != 0)
          goto LABEL_153;
        v167 = &v133[16 * v136];
        v169 = *(_QWORD *)v167;
        v168 = *((_QWORD *)v167 + 1);
        v147 = __OFSUB__(v168, v169);
        v170 = v168 - v169;
        if (v147)
          goto LABEL_156;
        if (v170 < v158)
          goto LABEL_15;
LABEL_121:
        v175 = v136 - 1;
        if (v136 - 1 >= v61)
        {
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
          goto LABEL_169;
        }
        if (!*v229)
          goto LABEL_171;
        v176 = v60;
        v177 = &v133[16 * v175];
        v178 = v133;
        v179 = *(_QWORD *)v177;
        v180 = v178;
        v181 = v136;
        v182 = &v178[16 * v136];
        v183 = *((_QWORD *)v182 + 1);
        v184 = v205;
        sub_236A64904(*v229 + *(_QWORD *)(v203 + 72) * *(_QWORD *)v177, *v229 + *(_QWORD *)(v203 + 72) * *(_QWORD *)v182, *v229 + *(_QWORD *)(v203 + 72) * v183, v202);
        v205 = v184;
        if (v184)
        {
          v58 = v194;
          goto LABEL_143;
        }
        if (v183 < v179)
          goto LABEL_146;
        if (v181 > *((_QWORD *)v176 + 2))
          goto LABEL_147;
        *(_QWORD *)v177 = v179;
        *(_QWORD *)&v180[16 * v175 + 8] = v183;
        v185 = *((_QWORD *)v176 + 2);
        if (v181 >= v185)
          goto LABEL_148;
        v133 = v180;
        v60 = v176;
        v61 = v185 - 1;
        memmove(v182, v182 + 16, 16 * (v185 - 1 - v181));
        *((_QWORD *)v176 + 2) = v185 - 1;
        v11 = v220;
        if (v185 <= 2)
          goto LABEL_15;
      }
    }
    v61 = 1;
LABEL_15:
    v54 = v229[1];
    v59 = v219;
  }
  while (v219 < v54);
  v58 = v194;
LABEL_132:
  v186 = v205;
  if (v61 >= 2)
  {
    v187 = *v229;
    do
    {
      v188 = v61 - 2;
      if (v61 < 2)
        goto LABEL_161;
      if (!v187)
        goto LABEL_173;
      v189 = *(_QWORD *)&v60[16 * v188 + 32];
      v190 = *(_QWORD *)&v60[16 * v61 + 24];
      sub_236A64904(v187 + *(_QWORD *)(v203 + 72) * v189, v187 + *(_QWORD *)(v203 + 72) * *(_QWORD *)&v60[16 * v61 + 16], v187 + *(_QWORD *)(v203 + 72) * v190, v202);
      if (v186)
        break;
      if (v190 < v189)
        goto LABEL_162;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v60 = sub_236A65008((uint64_t)v60);
      if (v188 >= *((_QWORD *)v60 + 2))
        goto LABEL_163;
      v191 = &v60[16 * v188 + 32];
      *(_QWORD *)v191 = v189;
      *((_QWORD *)v191 + 1) = v190;
      v192 = *((_QWORD *)v60 + 2);
      if (v61 > v192)
        goto LABEL_164;
      memmove(&v60[16 * v61 + 16], &v60[16 * v61 + 32], 16 * (v192 - v61));
      *((_QWORD *)v60 + 2) = v192 - 1;
      v61 = v192 - 1;
    }
    while (v192 > 2);
  }
LABEL_143:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v58 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_236A64700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v24 = a1;
  v25 = type metadata accessor for ATSpotlightDataRecord();
  v7 = MEMORY[0x24BDAC7A8](v25);
  v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v22 - v14;
  v27 = a3;
  v23 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v30 = v16 * (v27 - 1);
    v26 = v16;
    v29 = v16 * v27;
LABEL_5:
    v17 = 0;
    v18 = v24;
    while (1)
    {
      v19 = *a4;
      sub_236A5945C(v29 + v17 + *a4, (uint64_t)v15);
      sub_236A5945C(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0((uint64_t)v11, (uint64_t)v15);
      sub_236A5B868((uint64_t)v11);
      result = sub_236A5B868((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v26;
        v29 += v26;
        if (++v27 == v23)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = v20 + v30 + v17;
      sub_236A5E998(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_236A5E998(v28, v21);
      v17 -= v26;
      if (v27 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_236A64904(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t result;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v36 = type metadata accessor for ATSpotlightDataRecord();
  v8 = MEMORY[0x24BDAC7A8](v36);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_61;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_62;
  v16 = (uint64_t)(a2 - a1) / v14;
  v39 = a1;
  v38 = a4;
  v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v26 = a4 + v19;
      v37 = a4 + v19;
      v39 = a2;
      v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        v28 = -v14;
        do
        {
          v29 = a3 + v28;
          sub_236A5945C(v26 + v28, (uint64_t)v12);
          v30 = a2 + v28;
          sub_236A5945C(a2 + v28, (uint64_t)v10);
          v31 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v12);
          sub_236A5B868((uint64_t)v10);
          sub_236A5B868((uint64_t)v12);
          if ((v31 & 1) != 0)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v30 = a2;
          }
          v26 = v37;
          if (v37 <= a4)
            break;
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v20 = a4 + v18;
    v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_236A5945C(a2, (uint64_t)v12);
        sub_236A5945C(a4, (uint64_t)v10);
        v22 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v12);
        sub_236A5B868((uint64_t)v10);
        sub_236A5B868((uint64_t)v12);
        v23 = v39;
        if ((v22 & 1) != 0)
        {
          v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 = v25;
          v24 = a2;
        }
        v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20)
          break;
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_236A64EFC(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  result = sub_236A6E0B4();
  __break(1u);
  return result;
}

char *sub_236A64D44(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433BA0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_236A64E3C(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -112)
  {
    result = (char *)sub_236A6E0B4();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 112;
    if (result != v3 || result >= &v3[112 * v6])
      return (char *)memmove(result, v3, 112 * v6);
  }
  return result;
}

uint64_t sub_236A64EFC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for ATSpotlightDataRecord();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_236A6E0B4();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_236A65008(uint64_t a1)
{
  return sub_236A64D44(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_236A6501C(_QWORD *a1)
{
  return sub_236A50E24(0, a1[2], 0, a1);
}

uint64_t sub_236A65030(unint64_t a1)
{
  return sub_236A51058(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_236A65044(_QWORD *a1)
{
  return sub_236A53184(0, a1[2], 0, a1);
}

uint64_t sub_236A65058(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD v16[2];
  void (*v17)(uint64_t);
  unint64_t v18;
  uint64_t v19;

  v5 = type metadata accessor for ATSpotlightDataRecord();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v16[1] = v2;
    v19 = MEMORY[0x24BEE4AF8];
    sub_236A53168(0, v9, 0);
    v10 = v19;
    v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v11 = a1 + v18;
    v17 = *(void (**)(uint64_t))(*(_QWORD *)a2 + 152);
    v12 = *(_QWORD *)(v6 + 72);
    do
    {
      v17(v11);
      v19 = v10;
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_236A53168(v13 > 1, v14 + 1, 1);
        v10 = v19;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      sub_236A5E998((uint64_t)v8, v10 + v18 + v14 * v12);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_236A651B0(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[2];
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = v3;
  v21 = a2;
  v7 = type metadata accessor for ATSpotlightDataRecord();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    if (!v11)
      return v12;
    v22 = MEMORY[0x24BEE4AF8];
    result = sub_236A53168(0, v11 & ~(v11 >> 63), 0);
    if (v11 < 0)
      break;
    v14 = 0;
    v12 = v22;
    v19[1] = v4;
    v20 = a1 & 0xC000000000000001;
    v4 = a1;
    while (v11 != v14)
    {
      if (v20)
        v15 = (id)MEMORY[0x23B7FA028](v14, a1);
      else
        v15 = *(id *)(a1 + 8 * v14 + 32);
      v16 = v15;
      swift_bridgeObjectRetain();
      ATSpotlightDataRecord.init(item:bundleID:)(v16, v21, a3, (uint64_t)v10);
      v22 = v12;
      v18 = *(_QWORD *)(v12 + 16);
      v17 = *(_QWORD *)(v12 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_236A53168(v17 > 1, v18 + 1, 1);
        v12 = v22;
      }
      ++v14;
      *(_QWORD *)(v12 + 16) = v18 + 1;
      sub_236A5E998((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v18);
      a1 = v4;
      if (v11 == v14)
        return v12;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v11 = sub_236A6E078();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_236A65378(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  sub_236A6DE74();
  if (a4)
  {
    v8 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v8 = a3 & 0xFFFFFFFFFFFFLL;
    if (v8)
      sub_236A6DE74();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for ATSpolightAttributes();
  swift_initStackObject();
  sub_236A58A50();
  sub_236A58488(a1, a2);
  swift_release();
  v9 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v10 = (void *)sub_236A6DE2C();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_236A6DE98();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_initWithQueryString_attributes_, v10, v11);

  return v12;
}

uint64_t sub_236A654E8(uint64_t a1)
{
  uint64_t v1;

  return sub_236A62BEC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_236A654F4(uint64_t a1, uint64_t a2)
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
  char *v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(uint64_t, uint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[2];
  char *v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v45 = (uint64_t)v36 - v8;
  v46 = sub_236A6DC64();
  v40 = *(_QWORD *)(v46 - 8);
  v9 = MEMORY[0x24BDAC7A8](v46);
  v37 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)v36 - v11;
  v12 = type metadata accessor for ATSpotlightDataRecord();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v44 = (uint64_t)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v36 - v17;
  result = MEMORY[0x24BEE4AF8];
  v47 = MEMORY[0x24BEE4AF8];
  v20 = *(_QWORD *)(a1 + 16);
  if (v20)
  {
    v36[1] = v2;
    v42 = a2 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
    v43 = v16;
    v21 = *(_QWORD *)(v15 + 72);
    v38 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v22 = a1 + v38;
    v24 = v40;
    v23 = (uint64_t)v41;
    while (1)
    {
      sub_236A5945C(v22, (uint64_t)v18);
      v25 = *((_QWORD *)v18 + 2);
      v26 = *((_QWORD *)v18 + 1) & 0xFFFFFFFFFFFFLL;
      if ((v25 & 0x2000000000000000) != 0)
        v26 = HIBYTE(v25) & 0xF;
      if (!v26)
        goto LABEL_3;
      v27 = v43;
      v28 = v45;
      sub_236A55D9C((uint64_t)&v18[*(int *)(v43 + 36)], v45);
      v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
      if (v29(v28, 1, v46) == 1)
      {
        sub_236A65964(v45);
        sub_236A55D9C((uint64_t)&v18[*(int *)(v27 + 32)], v23);
        if (v29(v23, 1, v46) == 1)
        {
          sub_236A65964(v23);
          if ((sub_236A6DC1C() & 1) != 0)
            goto LABEL_15;
          goto LABEL_3;
        }
        v31 = v46;
        v30 = v37;
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v37, v23, v46);
      }
      else
      {
        v30 = v39;
        v31 = v46;
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v39, v45, v46);
      }
      v32 = sub_236A6DC1C();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v30, v31);
      if ((v32 & 1) != 0)
      {
LABEL_15:
        sub_236A5E998((uint64_t)v18, v44);
        v33 = v47;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_236A53168(0, *(_QWORD *)(v33 + 16) + 1, 1);
          v33 = v47;
        }
        v35 = *(_QWORD *)(v33 + 16);
        v34 = *(_QWORD *)(v33 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_236A53168(v34 > 1, v35 + 1, 1);
          v33 = v47;
        }
        *(_QWORD *)(v33 + 16) = v35 + 1;
        sub_236A5E998(v44, v33 + v38 + v35 * v21);
        v24 = v40;
        v23 = (uint64_t)v41;
        goto LABEL_4;
      }
LABEL_3:
      sub_236A5B868((uint64_t)v18);
LABEL_4:
      v22 += v21;
      if (!--v20)
        return v47;
    }
  }
  return result;
}

uint64_t sub_236A65840()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_236A6587C()
{
  return sub_236A5B8A4(qword_256433A78, (uint64_t (*)(uint64_t))type metadata accessor for ATSpotlightDataRecord, (uint64_t)&unk_236A6EB68);
}

uint64_t sub_236A658A8()
{
  return type metadata accessor for ATSpotlightDataRetriever();
}

uint64_t type metadata accessor for ATSpotlightDataRetriever()
{
  uint64_t result;

  result = qword_256433AD8;
  if (!qword_256433AD8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_236A658EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_236A6DC64();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_236A65964(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236A659A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433BA8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_236A65A08()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433BA8);
  return sub_236A62CE4();
}

uint64_t sub_236A65A48(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a1;
  v11[4] = a2;
  v21 = sub_236A65C48;
  v22 = v11;
  v12 = MEMORY[0x24BDAC760];
  v17 = MEMORY[0x24BDAC760];
  v18 = 1107296256;
  v19 = sub_236A65CAC;
  v20 = &block_descriptor_1;
  v13 = _Block_copy(&v17);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(a3, sel_setFoundItemsHandler_, v13);
  _Block_release(v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = v10;
  v21 = sub_236A65C98;
  v22 = v14;
  v17 = v12;
  v18 = 1107296256;
  v19 = sub_236A65D18;
  v20 = &block_descriptor_18;
  v15 = _Block_copy(&v17);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_setCompletionHandler_, v15);
  _Block_release(v15);
  objc_msgSend(a3, sel_start);
  return swift_release();
}

uint64_t sub_236A65BF8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_236A65C1C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_236A65C48(unint64_t a1)
{
  uint64_t v1;

  return sub_236A62714(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_236A65C6C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236A65C98(void *a1)
{
  uint64_t v1;

  return sub_236A627AC(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_236A65CAC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_236A54D8C(0, &qword_2564332B8);
  v2 = sub_236A6DEA4();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_236A65D18(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

Swift::Int __swiftcall ArchetypeRawAssortment.returnNumber()()
{
  return 42;
}

uint64_t sub_236A65D80(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  _QWORD **v14;
  id *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;

  swift_bridgeObjectRetain();
  sub_236A54BE4(a2, a1);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  result = swift_bridgeObjectRelease();
  v13 = (v11 >> 1) - v9;
  if (v11 >> 1 == v9)
    return swift_unknownObjectRelease();
  if ((uint64_t)(v11 >> 1) > v9)
  {
    v14 = (_QWORD **)(a3 + 16);
    v15 = (id *)(v7 + 8 * v9);
    do
    {
      v16 = *v15;
      v17 = objc_msgSend(v16, sel_attributeSet);
      v18 = objc_msgSend(v17, sel_title);

      if (v18)
      {
        v19 = sub_236A6DE38();
        v21 = v20;

      }
      else
      {
        v19 = 0;
        v21 = 0xE000000000000000;
      }
      swift_beginAccess();
      v22 = *v14;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v14 = v22;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v22 = sub_236A50F4C(0, v22[2] + 1, 1, v22);
        *v14 = v22;
      }
      v25 = v22[2];
      v24 = v22[3];
      if (v25 >= v24 >> 1)
      {
        v22 = sub_236A50F4C((_QWORD *)(v24 > 1), v25 + 1, 1, v22);
        *v14 = v22;
      }
      v22[2] = v25 + 1;
      v26 = &v22[2 * v25];
      v26[4] = v19;
      v26[5] = v21;
      swift_endAccess();

      ++v15;
      --v13;
    }
    while (v13);
    return swift_unknownObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_236A65F6C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  _QWORD *v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD **v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;

  swift_bridgeObjectRetain();
  sub_236A54BE4(a2, a1);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  result = swift_bridgeObjectRelease();
  v13 = (v11 >> 1) - v9;
  if (v11 >> 1 == v9)
    return swift_unknownObjectRelease();
  if ((uint64_t)(v11 >> 1) <= v9)
  {
    __break(1u);
  }
  else
  {
    v32 = (_QWORD **)(a3 + 16);
    v14 = (id *)(v7 + 8 * v9);
    v31 = *MEMORY[0x24BDC2210];
    do
    {
      v15 = *v14;
      v16 = objc_msgSend(v15, sel_attributeSet);
      v17 = objc_msgSend(v16, sel_authorEmailAddresses);

      if (v17)
      {
        v18 = sub_236A6DEA4();

      }
      else
      {
        v18 = MEMORY[0x24BEE4AF8];
      }
      *(_QWORD *)&v34 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
      sub_236A60854();
      sub_236A6DDFC();
      swift_bridgeObjectRelease();
      v19 = objc_msgSend(v15, sel_attributeSet);
      v20 = objc_msgSend(v19, sel_recipientEmailAddresses);

      if (v20)
      {
        v21 = sub_236A6DEA4();

      }
      else
      {
        v21 = MEMORY[0x24BEE4AF8];
      }
      *(_QWORD *)&v34 = v21;
      sub_236A6DDFC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v34 = 0;
      *((_QWORD *)&v34 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v36 = v34;
      sub_236A6DE74();
      v22 = objc_msgSend(v15, sel_attributeSet);
      v23 = objc_msgSend(v22, sel_subject);

      if (v23)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v24 = objc_msgSend(v15, sel_attributeSet);
      v25 = objc_msgSend(v24, sel_attributeForKey_, v31);

      if (v25)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v33, &v34);
      }
      else
      {
        v35 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v34 = 0;
        *((_QWORD *)&v34 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
      sub_236A6DE74();
      v26 = v36;
      swift_beginAccess();
      v27 = *v32;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v32 = v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v27 = sub_236A50F4C(0, v27[2] + 1, 1, v27);
        *v32 = v27;
      }
      v30 = v27[2];
      v29 = v27[3];
      if (v30 >= v29 >> 1)
      {
        v27 = sub_236A50F4C((_QWORD *)(v29 > 1), v30 + 1, 1, v27);
        *v32 = v27;
      }
      v27[2] = v30 + 1;
      *(_OWORD *)&v27[2 * v30 + 4] = v26;
      swift_endAccess();

      ++v14;
      --v13;
    }
    while (v13);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_236A66448(void *a1, int a2, uint64_t a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  void *v11;
  uint64_t v12;
  id v13;

  v11 = _Block_copy(aBlock);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a1;
  a7(a3, a6, v12);

  return swift_release();
}

uint64_t sub_236A66504(unint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  id v47;
  __int128 v48;
  unint64_t v49;
  unint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  unsigned int (*v57)(uint64_t, uint64_t, uint64_t);
  char *v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  __int128 v69;
  unint64_t v70;
  unint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  __int128 v79;
  unint64_t v80;
  unint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  __int128 v89;
  unint64_t v90;
  unint64_t v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  __int128 v99;
  unint64_t v100;
  unint64_t v101;
  id v102;
  id v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  __int128 v110;
  unint64_t v111;
  unint64_t v112;
  id v113;
  id v114;
  __int128 v115;
  unint64_t v116;
  unint64_t v117;
  id v118;
  id v119;
  __int128 v120;
  unint64_t v121;
  unint64_t v122;
  id v123;
  id v124;
  id v125;
  __int128 v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129;
  id v130;
  id v131;
  __int128 v132;
  unint64_t v133;
  unint64_t v134;
  id v135;
  id v136;
  __int128 v137;
  unint64_t v138;
  unint64_t v139;
  id v140;
  id v141;
  __int128 v142;
  unint64_t v143;
  unint64_t v144;
  id v145;
  id v146;
  __int128 v147;
  unint64_t v148;
  unint64_t v149;
  id v150;
  id v151;
  __int128 v152;
  unint64_t v153;
  unint64_t v154;
  id v155;
  id v156;
  __int128 v157;
  unint64_t v158;
  unint64_t v159;
  id v160;
  id v161;
  __int128 v162;
  unint64_t v163;
  unint64_t v164;
  id v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  __int128 v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  id v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  __int128 v177;
  unint64_t v178;
  unint64_t v179;
  id v180;
  id v181;
  uint64_t v182;
  uint64_t v183;
  __int128 v184;
  unint64_t v185;
  unint64_t v186;
  id v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  __int128 v191;
  unint64_t v192;
  unint64_t v193;
  id v194;
  id v195;
  __int128 v196;
  unint64_t v197;
  unint64_t v198;
  id v199;
  id v200;
  __int128 v201;
  unint64_t v202;
  unint64_t v203;
  id v204;
  id v205;
  __int128 v206;
  unint64_t v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  _QWORD **v212;
  _QWORD *v213;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v215;
  unint64_t v216;
  uint64_t v217;
  _QWORD *v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t v224;
  unint64_t v225;
  unint64_t v226;
  unint64_t v227;
  unint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  uint64_t v234;
  unint64_t v235;
  uint64_t v236;
  uint64_t v237;
  unint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unint64_t v241;
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  _QWORD *v245;
  char *v246;
  char *v247;
  char *v248;
  char *v249;
  char *v250;
  char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  unint64_t v258;
  uint64_t v259;
  char *v260;
  uint64_t v261;
  __int128 v262;
  __int128 v263;
  uint64_t v264;
  __int128 v265;

  v4 = sub_236A6DC64();
  v261 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v260 = (char *)&v219 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v251 = (char *)&v219 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v257 = (uint64_t)&v219 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v250 = (char *)&v219 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v256 = (uint64_t)&v219 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v249 = (char *)&v219 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v255 = (uint64_t)&v219 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v248 = (char *)&v219 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v254 = (uint64_t)&v219 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v247 = (char *)&v219 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v253 = (uint64_t)&v219 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v246 = (char *)&v219 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v252 = (uint64_t)&v219 - v29;
  if (!(a1 >> 62))
  {
    v30 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v30)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_236A6E078();
  v30 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v30 >= 1)
  {
    v32 = 0;
    v245 = (_QWORD *)(a2 + 16);
    v244 = a1 & 0xC000000000000001;
    v243 = *MEMORY[0x24BDC2210];
    v242 = *MEMORY[0x24BDC1E40];
    v241 = 0x8000000236A6FE40;
    v240 = *MEMORY[0x24BDC1FD8];
    v239 = *MEMORY[0x24BDC1E38];
    v238 = 0x8000000236A6FE60;
    v237 = *MEMORY[0x24BDC1FD0];
    v236 = *MEMORY[0x24BDC1BB0];
    v235 = 0x8000000236A6FE80;
    v234 = *MEMORY[0x24BDC22F8];
    v233 = 0x8000000236A6FEA0;
    v232 = 0x8000000236A6FEC0;
    v231 = 0x8000000236A6FEE0;
    v230 = 0x8000000236A6FF00;
    v229 = 0x8000000236A6FF20;
    v228 = 0x8000000236A6FF40;
    v227 = 0x8000000236A6FF60;
    v226 = 0x8000000236A6FF80;
    v225 = 0x8000000236A6FFA0;
    v224 = 0x8000000236A6FFC0;
    v223 = 0x8000000236A6FFE0;
    v222 = 0x8000000236A70000;
    v221 = MEMORY[0x24BEE4AD8] + 8;
    v220 = a1;
    v219 = v30;
    do
    {
      if (v244)
        v33 = (id)MEMORY[0x23B7FA028](v32, a1);
      else
        v33 = *(id *)(a1 + 8 * v32 + 32);
      v34 = v33;
      strcpy((char *)&v263, "title: [");
      BYTE9(v263) = 0;
      WORD5(v263) = 0;
      HIDWORD(v263) = -402653184;
      v35 = objc_msgSend(v33, sel_attributeSet, v219);
      v36 = objc_msgSend(v35, sel_title);

      v259 = v32;
      if (v36)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v37 = v263;
      v38 = sub_236A50F4C(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v40 = v38[2];
      v39 = v38[3];
      if (v40 >= v39 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
      v38[2] = v40 + 1;
      *(_OWORD *)&v38[2 * v40 + 4] = v37;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0x2079616C70736964;
      *((_QWORD *)&v263 + 1) = 0xEF5B203A656D616ELL;
      v41 = objc_msgSend(v34, sel_attributeSet);
      v42 = objc_msgSend(v41, sel_displayName);

      if (v42)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v43 = v263;
      v45 = v38[2];
      v44 = v38[3];
      if (v45 >= v44 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v44 > 1), v45 + 1, 1, v38);
      v38[2] = v45 + 1;
      *(_OWORD *)&v38[2 * v45 + 4] = v43;
      *(_QWORD *)&v265 = 0;
      *((_QWORD *)&v265 + 1) = 0xE000000000000000;
      sub_236A6DE74();
      v46 = objc_msgSend(v34, sel_attributeSet);
      v47 = objc_msgSend(v46, sel_attributeForKey_, v243);

      if (v47)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v48 = v265;
      v50 = v38[2];
      v49 = v38[3];
      if (v50 >= v49 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v49 > 1), v50 + 1, 1, v38);
      v38[2] = v50 + 1;
      *(_OWORD *)&v38[2 * v50 + 4] = v48;
      strcpy((char *)&v263, "due time: [");
      HIDWORD(v263) = -352321536;
      v51 = objc_msgSend(v34, sel_attributeSet);
      v52 = objc_msgSend(v51, sel_dueDate);

      if (v52)
      {
        v53 = (uint64_t)v246;
        sub_236A6DC40();

        v54 = v261;
        v55 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v261 + 56);
        v55(v53, 0, 1, v4);
      }
      else
      {
        v54 = v261;
        v55 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v261 + 56);
        v53 = (uint64_t)v246;
        v55((uint64_t)v246, 1, 1, v4);
      }
      v56 = v252;
      sub_236A6973C(v53, v252);
      v57 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
      if (v57(v56, 1, v4))
      {
        sub_236A65964(v56);
      }
      else
      {
        v58 = v260;
        (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v260, v56, v4);
        sub_236A65964(v56);
        sub_236A6DC4C();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v58, v4);
      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v59 = v263;
      v61 = v38[2];
      v60 = v38[3];
      if (v61 >= v60 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v60 > 1), v61 + 1, 1, v38);
      v38[2] = v61 + 1;
      *(_OWORD *)&v38[2 * v61 + 4] = v59;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000012;
      *((_QWORD *)&v263 + 1) = v241;
      v62 = objc_msgSend(v34, sel_attributeSet);
      v63 = objc_msgSend(v62, sel_completionDate);

      if (v63)
      {
        v64 = (uint64_t)v247;
        sub_236A6DC40();

        v65 = 0;
      }
      else
      {
        v65 = 1;
        v64 = (uint64_t)v247;
      }
      v55(v64, v65, 1, v4);
      v66 = v253;
      sub_236A6973C(v64, v253);
      if (v57(v66, 1, v4))
      {
        sub_236A65964(v66);
      }
      else
      {
        v67 = v260;
        v68 = v261;
        (*(void (**)(char *, uint64_t, uint64_t))(v261 + 16))(v260, v66, v4);
        sub_236A65964(v66);
        sub_236A6DC4C();
        (*(void (**)(char *, uint64_t))(v68 + 8))(v67, v4);
      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v69 = v263;
      v71 = v38[2];
      v70 = v38[3];
      if (v71 >= v70 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v70 > 1), v71 + 1, 1, v38);
      v38[2] = v71 + 1;
      *(_OWORD *)&v38[2 * v71 + 4] = v69;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000010;
      *((_QWORD *)&v263 + 1) = v238;
      v72 = objc_msgSend(v34, sel_attributeSet);
      v73 = objc_msgSend(v72, sel_contentCreationDate);

      if (v73)
      {
        v74 = (uint64_t)v248;
        sub_236A6DC40();

        v75 = 0;
      }
      else
      {
        v75 = 1;
        v74 = (uint64_t)v248;
      }
      v258 = 0xD000000000000010;
      v55(v74, v75, 1, v4);
      v76 = v254;
      sub_236A6973C(v74, v254);
      if (v57(v76, 1, v4))
      {
        sub_236A65964(v76);
      }
      else
      {
        v77 = v260;
        v78 = v261;
        (*(void (**)(char *, uint64_t, uint64_t))(v261 + 16))(v260, v76, v4);
        sub_236A65964(v76);
        sub_236A6DC4C();
        (*(void (**)(char *, uint64_t))(v78 + 8))(v77, v4);
      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v79 = v263;
      v81 = v38[2];
      v80 = v38[3];
      if (v81 >= v80 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v80 > 1), v81 + 1, 1, v38);
      v38[2] = v81 + 1;
      *(_OWORD *)&v38[2 * v81 + 4] = v79;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000014;
      *((_QWORD *)&v263 + 1) = v235;
      v82 = objc_msgSend(v34, sel_attributeSet);
      v83 = objc_msgSend(v82, sel_contentModificationDate);

      if (v83)
      {
        v84 = (uint64_t)v249;
        sub_236A6DC40();

        v85 = 0;
      }
      else
      {
        v85 = 1;
        v84 = (uint64_t)v249;
      }
      v55(v84, v85, 1, v4);
      v86 = v255;
      sub_236A6973C(v84, v255);
      if (v57(v86, 1, v4))
      {
        sub_236A65964(v86);
      }
      else
      {
        v87 = v260;
        v88 = v261;
        (*(void (**)(char *, uint64_t, uint64_t))(v261 + 16))(v260, v86, v4);
        sub_236A65964(v86);
        sub_236A6DC4C();
        (*(void (**)(char *, uint64_t))(v88 + 8))(v87, v4);
      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v89 = v263;
      v91 = v38[2];
      v90 = v38[3];
      if (v91 >= v90 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v90 > 1), v91 + 1, 1, v38);
      v38[2] = v91 + 1;
      *(_OWORD *)&v38[2 * v91 + 4] = v89;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      strcpy((char *)&v263, "start time: [");
      HIWORD(v263) = -4864;
      v92 = objc_msgSend(v34, sel_attributeSet);
      v93 = objc_msgSend(v92, sel_startDate);

      if (v93)
      {
        v94 = (uint64_t)v250;
        sub_236A6DC40();

        v95 = 0;
      }
      else
      {
        v95 = 1;
        v94 = (uint64_t)v250;
      }
      v55(v94, v95, 1, v4);
      v96 = v256;
      sub_236A6973C(v94, v256);
      if (v57(v96, 1, v4))
      {
        sub_236A65964(v96);
      }
      else
      {
        v97 = v260;
        v98 = v261;
        (*(void (**)(char *, uint64_t, uint64_t))(v261 + 16))(v260, v96, v4);
        sub_236A65964(v96);
        sub_236A6DC4C();
        (*(void (**)(char *, uint64_t))(v98 + 8))(v97, v4);
      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v99 = v263;
      v101 = v38[2];
      v100 = v38[3];
      if (v101 >= v100 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v100 > 1), v101 + 1, 1, v38);
      v38[2] = v101 + 1;
      *(_OWORD *)&v38[2 * v101 + 4] = v99;
      strcpy((char *)&v263, "end time: [");
      HIDWORD(v263) = -352321536;
      v102 = objc_msgSend(v34, sel_attributeSet);
      v103 = objc_msgSend(v102, sel_endDate);

      if (v103)
      {
        v104 = v251;
        sub_236A6DC40();

        v105 = 0;
      }
      else
      {
        v105 = 1;
        v104 = v251;
      }
      v55((uint64_t)v104, v105, 1, v4);
      v106 = (uint64_t)v104;
      v107 = v257;
      sub_236A6973C(v106, v257);
      if (v57(v107, 1, v4))
      {
        sub_236A65964(v107);
      }
      else
      {
        v109 = v260;
        v108 = v261;
        (*(void (**)(char *, uint64_t, uint64_t))(v261 + 16))(v260, v107, v4);
        sub_236A65964(v107);
        sub_236A6DC4C();
        (*(void (**)(char *, uint64_t))(v108 + 8))(v109, v4);
      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v110 = v263;
      v112 = v38[2];
      v111 = v38[3];
      if (v112 >= v111 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v111 > 1), v112 + 1, 1, v38);
      v38[2] = v112 + 1;
      *(_OWORD *)&v38[2 * v112 + 4] = v110;
      strcpy((char *)&v263, "location: [");
      HIDWORD(v263) = -352321536;
      v113 = objc_msgSend(v34, sel_attributeSet);
      v114 = objc_msgSend(v113, sel_namedLocation);

      if (v114)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v115 = v263;
      v117 = v38[2];
      v116 = v38[3];
      if (v117 >= v116 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v116 > 1), v117 + 1, 1, v38);
      v38[2] = v117 + 1;
      *(_OWORD *)&v38[2 * v117 + 4] = v115;
      strcpy((char *)&v263, "comment: [");
      BYTE11(v263) = 0;
      HIDWORD(v263) = -369098752;
      v118 = objc_msgSend(v34, sel_attributeSet);
      v119 = objc_msgSend(v118, sel_comment);

      if (v119)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v120 = v263;
      v122 = v38[2];
      v121 = v38[3];
      if (v122 >= v121 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v121 > 1), v122 + 1, 1, v38);
      v38[2] = v122 + 1;
      *(_OWORD *)&v38[2 * v122 + 4] = v120;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000013;
      *((_QWORD *)&v263 + 1) = v233;
      v123 = objc_msgSend(v34, sel_attributeSet);
      v124 = objc_msgSend(v123, sel_allDay);

      if (!v124)
      {
        sub_236A54D8C(0, &qword_256433BE0);
        v124 = (id)sub_236A6DF4C();
      }
      v125 = objc_msgSend(v124, sel_description);
      sub_236A6DE38();

      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v126 = v263;
      v128 = v38[2];
      v127 = v38[3];
      if (v128 >= v127 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v127 > 1), v128 + 1, 1, v38);
      v129 = v219;
      v38[2] = v128 + 1;
      *(_OWORD *)&v38[2 * v128 + 4] = v126;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD00000000000001ELL;
      *((_QWORD *)&v263 + 1) = v232;
      v130 = objc_msgSend(v34, sel_attributeSet);
      v131 = objc_msgSend(v130, sel_calendarHolidayIdentifier);

      if (v131)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v132 = v263;
      v134 = v38[2];
      v133 = v38[3];
      if (v134 >= v133 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v133 > 1), v134 + 1, 1, v38);
      v38[2] = v134 + 1;
      *(_OWORD *)&v38[2 * v134 + 4] = v132;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000015;
      *((_QWORD *)&v263 + 1) = v231;
      v135 = objc_msgSend(v34, sel_attributeSet);
      v136 = objc_msgSend(v135, sel_accountIdentifier);

      if (v136)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v137 = v263;
      v139 = v38[2];
      v138 = v38[3];
      if (v139 >= v138 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v138 > 1), v139 + 1, 1, v38);
      v38[2] = v139 + 1;
      *(_OWORD *)&v38[2 * v139 + 4] = v137;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v265 = v263;
      sub_236A6DE74();
      v140 = objc_msgSend(v34, sel_attributeSet);
      v141 = objc_msgSend(v140, sel_attributeForKey_, v242);

      if (v141)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v142 = v265;
      v144 = v38[2];
      v143 = v38[3];
      if (v144 >= v143 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v143 > 1), v144 + 1, 1, v38);
      v38[2] = v144 + 1;
      *(_OWORD *)&v38[2 * v144 + 4] = v142;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v265 = v263;
      sub_236A6DE74();
      v145 = objc_msgSend(v34, sel_attributeSet);
      v146 = objc_msgSend(v145, sel_attributeForKey_, v240);

      if (v146)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v147 = v265;
      v149 = v38[2];
      v148 = v38[3];
      if (v149 >= v148 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v148 > 1), v149 + 1, 1, v38);
      v38[2] = v149 + 1;
      *(_OWORD *)&v38[2 * v149 + 4] = v147;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v265 = v263;
      sub_236A6DE74();
      v150 = objc_msgSend(v34, sel_attributeSet);
      v151 = objc_msgSend(v150, sel_attributeForKey_, v239);

      if (v151)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v152 = v265;
      v154 = v38[2];
      v153 = v38[3];
      if (v154 >= v153 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v153 > 1), v154 + 1, 1, v38);
      v38[2] = v154 + 1;
      *(_OWORD *)&v38[2 * v154 + 4] = v152;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v265 = v263;
      sub_236A6DE74();
      v155 = objc_msgSend(v34, sel_attributeSet);
      v156 = objc_msgSend(v155, sel_attributeForKey_, v237);

      if (v156)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v157 = v265;
      v159 = v38[2];
      v158 = v38[3];
      if (v159 >= v158 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v158 > 1), v159 + 1, 1, v38);
      v38[2] = v159 + 1;
      *(_OWORD *)&v38[2 * v159 + 4] = v157;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v265 = v263;
      sub_236A6DE74();
      v160 = objc_msgSend(v34, sel_attributeSet);
      v161 = objc_msgSend(v160, sel_attributeForKey_, v236);

      if (v161)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v162 = v265;
      v164 = v38[2];
      v163 = v38[3];
      if (v164 >= v163 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v163 > 1), v164 + 1, 1, v38);
      v38[2] = v164 + 1;
      *(_OWORD *)&v38[2 * v164 + 4] = v162;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000012;
      *((_QWORD *)&v263 + 1) = v225;
      v165 = objc_msgSend(v34, sel_attributeSet);
      v166 = objc_msgSend(v165, sel_accountHandles);

      if (v166)
      {
        v167 = MEMORY[0x24BEE0D00];
        v168 = sub_236A6DEA4();

      }
      else
      {
        v168 = MEMORY[0x24BEE4AF8];
        v167 = MEMORY[0x24BEE0D00];
      }
      MEMORY[0x23B7F9ED8](v168, v167);
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v169 = v263;
      v171 = v38[2];
      v170 = v38[3];
      if (v171 >= v170 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v170 > 1), v171 + 1, 1, v38);
      v172 = v258;
      v38[2] = v171 + 1;
      *(_OWORD *)&v38[2 * v171 + 4] = v169;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = v172;
      *((_QWORD *)&v263 + 1) = v224;
      v173 = objc_msgSend(v34, sel_attributeSet);
      v174 = objc_msgSend(v173, sel_phoneNumbers);

      if (v174)
      {
        v175 = MEMORY[0x24BEE0D00];
        v176 = sub_236A6DEA4();

      }
      else
      {
        v176 = MEMORY[0x24BEE4AF8];
        v175 = MEMORY[0x24BEE0D00];
      }
      MEMORY[0x23B7F9ED8](v176, v175);
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v177 = v263;
      v179 = v38[2];
      v178 = v38[3];
      if (v179 >= v178 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v178 > 1), v179 + 1, 1, v38);
      v38[2] = v179 + 1;
      *(_OWORD *)&v38[2 * v179 + 4] = v177;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000012;
      *((_QWORD *)&v263 + 1) = v223;
      v180 = objc_msgSend(v34, sel_attributeSet);
      v181 = objc_msgSend(v180, sel_emailAddresses);

      if (v181)
      {
        v182 = MEMORY[0x24BEE0D00];
        v183 = sub_236A6DEA4();

      }
      else
      {
        v183 = MEMORY[0x24BEE4AF8];
        v182 = MEMORY[0x24BEE0D00];
      }
      MEMORY[0x23B7F9ED8](v183, v182);
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v184 = v263;
      v186 = v38[2];
      v185 = v38[3];
      if (v186 >= v185 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v185 > 1), v186 + 1, 1, v38);
      v38[2] = v186 + 1;
      *(_OWORD *)&v38[2 * v186 + 4] = v184;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v263 = 0xD000000000000012;
      *((_QWORD *)&v263 + 1) = v222;
      v187 = objc_msgSend(v34, sel_attributeSet);
      v188 = objc_msgSend(v187, sel_alternateNames);

      if (v188)
      {
        v189 = MEMORY[0x24BEE0D00];
        v190 = sub_236A6DEA4();

      }
      else
      {
        v190 = MEMORY[0x24BEE4AF8];
        v189 = MEMORY[0x24BEE0D00];
      }
      MEMORY[0x23B7F9ED8](v190, v189);
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v191 = v263;
      v193 = v38[2];
      v192 = v38[3];
      if (v193 >= v192 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v192 > 1), v193 + 1, 1, v38);
      v38[2] = v193 + 1;
      *(_OWORD *)&v38[2 * v193 + 4] = v191;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      v265 = v263;
      sub_236A6DE74();
      v194 = objc_msgSend(v34, sel_attributeSet);
      v195 = objc_msgSend(v194, sel_attributeForKey_, v234);

      if (v195)
      {
        sub_236A6DF88();
        swift_unknownObjectRelease();
        sub_236A594A0(&v262, &v263);
      }
      else
      {
        v264 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v263 = 0;
        *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      }
      sub_236A6E060();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v263);
      sub_236A6DE74();
      v196 = v265;
      v198 = v38[2];
      v197 = v38[3];
      if (v198 >= v197 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v197 > 1), v198 + 1, 1, v38);
      v38[2] = v198 + 1;
      *(_OWORD *)&v38[2 * v198 + 4] = v196;
      strcpy((char *)&v263, "bundleID: [");
      HIDWORD(v263) = -352321536;
      v199 = objc_msgSend(v34, sel_attributeSet);
      v200 = objc_msgSend(v199, sel_bundleID);

      if (v200)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v201 = v263;
      v203 = v38[2];
      v202 = v38[3];
      if (v203 >= v202 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v202 > 1), v203 + 1, 1, v38);
      v38[2] = v203 + 1;
      *(_OWORD *)&v38[2 * v203 + 4] = v201;
      *(_QWORD *)&v263 = 0;
      *((_QWORD *)&v263 + 1) = 0xE000000000000000;
      sub_236A6DFDC();
      swift_bridgeObjectRelease();
      strcpy((char *)&v263, "contentType: [");
      HIBYTE(v263) = -18;
      v204 = objc_msgSend(v34, sel_attributeSet);
      v205 = objc_msgSend(v204, sel_contentType);

      if (v205)
      {
        sub_236A6DE38();

      }
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      sub_236A6DE74();
      v206 = v263;
      v208 = v38[2];
      v207 = v38[3];
      if (v208 >= v207 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v207 > 1), v208 + 1, 1, v38);
      v38[2] = v208 + 1;
      *(_OWORD *)&v38[2 * v208 + 4] = v206;
      *(_QWORD *)&v263 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
      sub_236A60854();
      v209 = sub_236A6DDFC();
      v211 = v210;
      swift_bridgeObjectRelease();
      v212 = (_QWORD **)v245;
      swift_beginAccess();
      v213 = *v212;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v212 = v213;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v213 = sub_236A50F4C(0, v213[2] + 1, 1, v213);
        *v245 = v213;
      }
      a1 = v220;
      v216 = v213[2];
      v215 = v213[3];
      if (v216 >= v215 >> 1)
      {
        v213 = sub_236A50F4C((_QWORD *)(v215 > 1), v216 + 1, 1, v213);
        *v245 = v213;
      }
      v217 = v259 + 1;
      v213[2] = v216 + 1;
      v218 = &v213[2 * v216];
      v32 = v217;
      v218[4] = v209;
      v218[5] = v211;
      swift_endAccess();

    }
    while (v129 != v32);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_236A68910(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  swift_beginAccess();
  v3 = swift_bridgeObjectRetain();
  a2(v3);
  return swift_bridgeObjectRelease();
}

id ArchetypeRawAssortment.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ArchetypeRawAssortment.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ArchetypeRawAssortment();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ArchetypeRawAssortment.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ArchetypeRawAssortment();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s15ArchetypeEngine0A13RawAssortmentC19spotlightItemTitles01nG017completionHandlerySi_ySaySSGctF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t (*v20)(unint64_t);
  _QWORD *v21;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = MEMORY[0x24BEE4AF8];
  v7 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v8 = (void *)sub_236A6DE2C();
  v9 = (void *)sub_236A6DE98();
  v10 = objc_msgSend(v7, sel_initWithQueryString_attributes_, v8, v9);

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = v6;
  v20 = sub_236A697B4;
  v21 = (_QWORD *)v11;
  v12 = MEMORY[0x24BDAC760];
  v16 = MEMORY[0x24BDAC760];
  v17 = 1107296256;
  v18 = sub_236A65CAC;
  v19 = &block_descriptor_37;
  v13 = _Block_copy(&v16);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setFoundItemsHandler_, v13);
  _Block_release(v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = v6;
  v20 = (uint64_t (*)(unint64_t))sub_236A697EC;
  v21 = v14;
  v16 = v12;
  v17 = 1107296256;
  v18 = sub_236A65D18;
  v19 = &block_descriptor_43;
  v15 = _Block_copy(&v16);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setCompletionHandler_, v15);
  _Block_release(v15);
  objc_msgSend(v10, sel_start);
  swift_release();

}

void _s15ArchetypeEngine0A13RawAssortmentC24spotlightEmailAttributes7nEmails17completionHandlerySi_ySaySSGctF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(unint64_t);
  _QWORD *v26;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_236A6EF30;
  *(_QWORD *)(v7 + 32) = sub_236A6DE38();
  *(_QWORD *)(v7 + 40) = v8;
  *(_QWORD *)(v7 + 48) = sub_236A6DE38();
  *(_QWORD *)(v7 + 56) = v9;
  *(_QWORD *)(v7 + 64) = sub_236A6DE38();
  *(_QWORD *)(v7 + 72) = v10;
  *(_QWORD *)(v7 + 80) = sub_236A6DE38();
  *(_QWORD *)(v7 + 88) = v11;
  v12 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v13 = (void *)sub_236A6DE2C();
  v14 = (void *)sub_236A6DE98();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v12, sel_initWithQueryString_attributes_, v13, v14);

  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = v6;
  v25 = sub_236A697A8;
  v26 = (_QWORD *)v16;
  v17 = MEMORY[0x24BDAC760];
  v21 = MEMORY[0x24BDAC760];
  v22 = 1107296256;
  v23 = sub_236A65CAC;
  v24 = &block_descriptor_24;
  v18 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_setFoundItemsHandler_, v18);
  _Block_release(v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a2;
  v19[3] = a3;
  v19[4] = v6;
  v25 = (uint64_t (*)(unint64_t))sub_236A697EC;
  v26 = v19;
  v21 = v17;
  v22 = 1107296256;
  v23 = sub_236A65D18;
  v24 = &block_descriptor_30;
  v20 = _Block_copy(&v21);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_setCompletionHandler_, v20);
  _Block_release(v20);
  objc_msgSend(v15, sel_start);
  swift_release();

}

void _s15ArchetypeEngine0A13RawAssortmentC12textOnScreenSSyF_0()
{
  id v0;
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  void *v18;

  v0 = objc_msgSend((id)objc_opt_self(), sel_primaryApp);
  if (!v0)
    return;
  v1 = v0;
  v2 = objc_msgSend(v1, sel_visibleElements);
  if (v2)
  {
    v3 = v2;
    sub_236A54D8C(0, (unint64_t *)&qword_256433BE8);
    v4 = sub_236A6DEA4();

    if (!(v4 >> 62))
      goto LABEL_4;
LABEL_21:
    swift_bridgeObjectRetain();
    v5 = sub_236A6E078();
    swift_bridgeObjectRelease();
    v18 = v1;
    if (v5)
      goto LABEL_5;
LABEL_22:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
    sub_236A60854();
    sub_236A6DDFC();
    swift_bridgeObjectRelease();

    return;
  }
  v4 = MEMORY[0x24BEE4AF8];
  if (MEMORY[0x24BEE4AF8] >> 62)
    goto LABEL_21;
LABEL_4:
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v18 = v1;
  if (!v5)
    goto LABEL_22;
LABEL_5:
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x23B7FA028](v6, v4);
      else
        v8 = *(id *)(v4 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_label, v18);
      if (v10)
      {
        v11 = v10;
        v12 = sub_236A6DE38();
        v14 = v13;

      }
      else
      {
        v12 = 0;
        v14 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_236A50F4C(0, v7[2] + 1, 1, v7);
      v16 = v7[2];
      v15 = v7[3];
      if (v16 >= v15 >> 1)
        v7 = sub_236A50F4C((_QWORD *)(v15 > 1), v16 + 1, 1, v7);
      ++v6;
      v7[2] = v16 + 1;
      v17 = &v7[2 * v16];
      v17[4] = v12;
      v17[5] = v14;

    }
    while (v5 != v6);
    goto LABEL_22;
  }
  __break(1u);
}

void _s15ArchetypeEngine0A13RawAssortmentC14spotlightItems11contentType17completionHandlerySS_ySaySSGctF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD *v47;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = MEMORY[0x24BEE4AF8];
  sub_236A6DFDC();
  swift_bridgeObjectRelease();
  v42 = 0x54746E65746E6F63;
  v43 = 0xEF203D3D20657079;
  sub_236A6DE74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564332D0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_236A6EF40;
  *(_QWORD *)(v7 + 32) = sub_236A6DE38();
  *(_QWORD *)(v7 + 40) = v8;
  *(_QWORD *)(v7 + 48) = sub_236A6DE38();
  *(_QWORD *)(v7 + 56) = v9;
  *(_QWORD *)(v7 + 64) = sub_236A6DE38();
  *(_QWORD *)(v7 + 72) = v10;
  *(_QWORD *)(v7 + 80) = sub_236A6DE38();
  *(_QWORD *)(v7 + 88) = v11;
  *(_QWORD *)(v7 + 96) = sub_236A6DE38();
  *(_QWORD *)(v7 + 104) = v12;
  *(_QWORD *)(v7 + 112) = sub_236A6DE38();
  *(_QWORD *)(v7 + 120) = v13;
  *(_QWORD *)(v7 + 128) = sub_236A6DE38();
  *(_QWORD *)(v7 + 136) = v14;
  *(_QWORD *)(v7 + 144) = sub_236A6DE38();
  *(_QWORD *)(v7 + 152) = v15;
  *(_QWORD *)(v7 + 160) = sub_236A6DE38();
  *(_QWORD *)(v7 + 168) = v16;
  *(_QWORD *)(v7 + 176) = sub_236A6DE38();
  *(_QWORD *)(v7 + 184) = v17;
  *(_QWORD *)(v7 + 192) = sub_236A6DE38();
  *(_QWORD *)(v7 + 200) = v18;
  *(_QWORD *)(v7 + 208) = sub_236A6DE38();
  *(_QWORD *)(v7 + 216) = v19;
  *(_QWORD *)(v7 + 224) = sub_236A6DE38();
  *(_QWORD *)(v7 + 232) = v20;
  *(_QWORD *)(v7 + 240) = sub_236A6DE38();
  *(_QWORD *)(v7 + 248) = v21;
  *(_QWORD *)(v7 + 256) = sub_236A6DE38();
  *(_QWORD *)(v7 + 264) = v22;
  *(_QWORD *)(v7 + 272) = sub_236A6DE38();
  *(_QWORD *)(v7 + 280) = v23;
  *(_QWORD *)(v7 + 288) = sub_236A6DE38();
  *(_QWORD *)(v7 + 296) = v24;
  *(_QWORD *)(v7 + 304) = sub_236A6DE38();
  *(_QWORD *)(v7 + 312) = v25;
  *(_QWORD *)(v7 + 320) = sub_236A6DE38();
  *(_QWORD *)(v7 + 328) = v26;
  *(_QWORD *)(v7 + 336) = sub_236A6DE38();
  *(_QWORD *)(v7 + 344) = v27;
  *(_QWORD *)(v7 + 352) = sub_236A6DE38();
  *(_QWORD *)(v7 + 360) = v28;
  *(_QWORD *)(v7 + 368) = sub_236A6DE38();
  *(_QWORD *)(v7 + 376) = v29;
  *(_QWORD *)(v7 + 384) = sub_236A6DE38();
  *(_QWORD *)(v7 + 392) = v30;
  *(_QWORD *)(v7 + 400) = sub_236A6DE38();
  *(_QWORD *)(v7 + 408) = v31;
  *(_QWORD *)(v7 + 416) = sub_236A6DE38();
  *(_QWORD *)(v7 + 424) = v32;
  *(_QWORD *)(v7 + 432) = sub_236A6DE38();
  *(_QWORD *)(v7 + 440) = v33;
  v34 = objc_allocWithZone(MEMORY[0x24BDC2460]);
  v35 = (void *)sub_236A6DE2C();
  swift_bridgeObjectRelease();
  v36 = (void *)sub_236A6DE98();
  swift_bridgeObjectRelease();
  v37 = objc_msgSend(v34, sel_initWithQueryString_attributes_, v35, v36, v42, v43);

  v46 = sub_236A696FC;
  v47 = (_QWORD *)v6;
  v38 = MEMORY[0x24BDAC760];
  v42 = MEMORY[0x24BDAC760];
  v43 = 1107296256;
  v44 = sub_236A65CAC;
  v45 = &block_descriptor_2;
  v39 = _Block_copy(&v42);
  swift_retain();
  swift_release();
  objc_msgSend(v37, sel_setFoundItemsHandler_, v39);
  _Block_release(v39);
  v40 = (_QWORD *)swift_allocObject();
  v40[2] = a3;
  v40[3] = a4;
  v40[4] = v6;
  v46 = sub_236A69720;
  v47 = v40;
  v42 = v38;
  v43 = 1107296256;
  v44 = sub_236A65D18;
  v45 = &block_descriptor_17;
  v41 = _Block_copy(&v42);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v37, sel_setCompletionHandler_, v41);
  _Block_release(v41);
  objc_msgSend(v37, sel_start);
  swift_release();

}

uint64_t type metadata accessor for ArchetypeRawAssortment()
{
  return objc_opt_self();
}

uint64_t sub_236A69668()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_236A69690()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_236A6DE98();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t sub_236A696D8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_236A696FC(unint64_t a1)
{
  uint64_t v1;

  return sub_236A66504(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_236A69720(uint64_t a1)
{
  uint64_t v1;

  return sub_236A68910(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_236A6973C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236A69784()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236A697A8(unint64_t a1)
{
  uint64_t v1;

  return sub_236A65F6C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_236A697B4(unint64_t a1)
{
  uint64_t v1;

  return sub_236A65D80(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t objectdestroy_13Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t ATSpotlightMailRetriever.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ATSpotlightMailRetriever.init()();
  return v0;
}

uint64_t ATSpotlightMailRetriever.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  v2 = sub_236A6DC64();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  *v6 = 0xD000000000000014;
  v6[1] = 0x8000000236A6F0E0;
  v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailUniqueRecordIdentifier);
  *v7 = sub_236A6DE38();
  v7[1] = v8;
  v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailConversationId);
  *v9 = sub_236A6DE38();
  v9[1] = v10;
  v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailReceivedDate);
  *v11 = sub_236A6DE38();
  v11[1] = v12;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_longestChain) = 100;
  sub_236A6DC58();
  sub_236A6DC04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x24BEE4AF8];
  return v1;
}

uint64_t ATSpotlightMailRetriever.getRecentRecordsAsync(nRecords:addendum:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return swift_task_switch();
}

uint64_t sub_236A699C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = v0[6];
  sub_236A6DFDC();
  v2 = sub_236A6DE38();
  v4 = v3;
  swift_bridgeObjectRelease();
  sub_236A6DE74();
  v5 = v2;
  v0[2] = v2;
  v0[3] = v4;
  if (v1)
  {
    v6 = v0[6];
    v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v7 = v0[5] & 0xFFFFFFFFFFFFLL;
    if (v7)
      sub_236A6DE74();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v5 = v0[2];
    v4 = v0[3];
  }
  v0[8] = v4;
  v8 = (uint64_t *)(v0[7] + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  v9 = *v8;
  v10 = v8[1];
  v11 = (_QWORD *)swift_task_alloc();
  v0[9] = v11;
  *v11 = v0;
  v11[1] = sub_236A69B20;
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v9, v10, v0[4], v5, v4);
}

uint64_t sub_236A69B20(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_236A69B84()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 80));
}

uint64_t ATSpotlightMailRetriever.getRecentRecords(nRecords:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v14;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256433718);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId + 8);
  v9 = dispatch_semaphore_create(0);
  v10 = sub_236A6DEEC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = v8;
  v11[6] = v7;
  v11[7] = a1;
  v11[8] = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  v12 = v9;
  sub_236A5E6E0((uint64_t)v6, (uint64_t)&unk_256433720, (uint64_t)v11);
  swift_release();
  sub_236A6DF34();

  return swift_bridgeObjectRetain();
}

uint64_t sub_236A69CB8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t ATSpotlightMailRetriever.getEmailChain(uniqueIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  _QWORD *v7;

  v3[2] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433C00);
  v6 = swift_task_alloc();
  v3[3] = v6;
  v7 = (_QWORD *)swift_task_alloc();
  v3[4] = v7;
  *v7 = v3;
  v7[1] = sub_236A69D90;
  v7[4] = a2;
  v7[5] = v2;
  v7[2] = v6;
  v7[3] = a1;
  return swift_task_switch();
}

uint64_t sub_236A69D90()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 40) = v2;
  *v2 = v4;
  v2[1] = sub_236A69DF8;
  return sub_236A6AAD4(*(_QWORD *)(v1 + 24));
}

uint64_t sub_236A69DF8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A69E54()
{
  uint64_t v0;

  sub_236A55170(*(_QWORD *)(v0 + 24), &qword_256433C00);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 48));
}

uint64_t ATSpotlightMailRetriever.getPreviousEmailsInChain(uniqueIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3[2] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564331E0);
  v3[3] = swift_task_alloc();
  v3[4] = swift_task_alloc();
  v6 = sub_236A6DC64();
  v3[5] = v6;
  v3[6] = *(_QWORD *)(v6 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433C00);
  v3[9] = swift_task_alloc();
  v7 = swift_task_alloc();
  v3[10] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v3[11] = v8;
  *v8 = v3;
  v8[1] = sub_236A69FB4;
  v8[4] = a2;
  v8[5] = v2;
  v8[2] = v7;
  v8[3] = a1;
  return swift_task_switch();
}

uint64_t sub_236A69FB4()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 96) = v2;
  *v2 = v4;
  v2[1] = sub_236A6A020;
  return sub_236A6AAD4(*(_QWORD *)(v1 + 80));
}

uint64_t sub_236A6A020(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A6A07C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD, uint64_t);
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 104);
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_23:
    sub_236A55170(*(_QWORD *)(v0 + 80), &qword_256433C00);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  v2 = *(_QWORD *)(v0 + 72);
  sub_236A5EA6C(*(_QWORD *)(v0 + 80), v2, &qword_256433C00);
  v3 = type metadata accessor for ATSpotlightDataRecord();
  v31 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 40);
    v6 = *(_QWORD *)(v0 + 48);
    v8 = *(_QWORD *)(v0 + 32);
    sub_236A5EA6C(v5 + *(int *)(v3 + 64), v8, &qword_2564331E0);
    sub_236A5B868(v5);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    result = v9(v8, 1, v7);
    if ((_DWORD)result != 1)
    {
      v30 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 48) + 32);
      v30(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
      v10 = *(_QWORD *)(v1 + 16);
      if (v10)
      {
        v11 = 0;
        v28 = v9;
        v29 = *(_QWORD *)(v0 + 48);
        v12 = *(_QWORD *)(v0 + 104)
            + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
        v13 = &qword_2564331E0;
        while (v11 < *(_QWORD *)(v1 + 16))
        {
          v14 = *(_QWORD *)(v0 + 40);
          v15 = *(_QWORD *)(v0 + 24);
          sub_236A5EA6C(v12 + *(_QWORD *)(v31 + 72) * v11 + *(int *)(v3 + 64), v15, v13);
          if (v9(v15, 1, v14) == 1)
          {
            sub_236A55170(*(_QWORD *)(v0 + 24), v13);
          }
          else
          {
            v16 = *(_QWORD *)(v0 + 56);
            v17 = v13;
            v18 = v3;
            v19 = v12;
            v20 = v10;
            v21 = v1;
            v22 = *(_QWORD *)(v0 + 40);
            v30(v16, *(_QWORD *)(v0 + 24), v22);
            v23 = sub_236A6DC28();
            v24 = v22;
            v1 = v21;
            v10 = v20;
            v12 = v19;
            v3 = v18;
            v13 = v17;
            v9 = v28;
            (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v16, v24);
            if ((v23 & 1) != 0)
            {
              if (v11 >= v10)
                goto LABEL_20;
LABEL_14:
              v25 = *(_QWORD *)(v1 + 16);
              if (v25 >= v11 && v25 >= v10)
              {
                v13 = (uint64_t *)v12;
                sub_236A6E0FC();
                swift_unknownObjectRetain_n();
                v26 = swift_dynamicCastClass();
                if (!v26)
                {
                  swift_bridgeObjectRelease();
                  v26 = MEMORY[0x24BEE4AF8];
                }
                v27 = *(_QWORD *)(v26 + 16);
                swift_release();
                v3 = *(_QWORD *)(v0 + 104);
                if (v27 == v10 - v11)
                {
                  v1 = swift_dynamicCastClass();
                  swift_bridgeObjectRelease();
                  if (v1)
                    goto LABEL_22;
                  goto LABEL_20;
                }
LABEL_26:
                swift_bridgeObjectRelease();
                v1 = sub_236A51A1C(v3, (uint64_t)v13, v11, (2 * v10) | 1);
                goto LABEL_21;
              }
LABEL_25:
              __break(1u);
              goto LABEL_26;
            }
          }
          if (v10 == ++v11)
          {
            v11 = 0;
            goto LABEL_14;
          }
        }
        __break(1u);
        goto LABEL_25;
      }
LABEL_20:
      v1 = MEMORY[0x24BEE4AF8];
LABEL_21:
      swift_bridgeObjectRelease();
LABEL_22:
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 40));
      goto LABEL_23;
    }
  }
  __break(1u);
  return result;
}

uint64_t ATSpotlightMailRetriever.getRecentEmailsSubsetMatch(fromAuthor:toRecipients:withAdditionalRecipients:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  v5[9] = *(_QWORD *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236A6A434()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v2 = *(_QWORD *)(v0 + 32) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 48);
    v16 = sub_236A6DE38();
    v17 = v4;
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v16;
    *(_QWORD *)(v0 + 24) = v17;
    v5 = *(_QWORD *)(v3 + 16);
    if (v5)
    {
      v6 = swift_bridgeObjectRetain() + 40;
      do
      {
        sub_236A6DE38();
        swift_bridgeObjectRetain();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        v6 += 16;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
    }
    v7 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 16);
    if (v7)
    {
      v8 = swift_bridgeObjectRetain() + 40;
      do
      {
        sub_236A6DE38();
        swift_bridgeObjectRetain();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_236A6DE74();
        swift_bridgeObjectRelease();
        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    v9 = (uint64_t *)(*(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
    v11 = *v9;
    v10 = v9[1];
    v12 = *(_QWORD *)(v0 + 16);
    v13 = *(_QWORD *)(v0 + 24);
    *(_QWORD *)(v0 + 96) = v13;
    swift_bridgeObjectRetain();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v14;
    *v14 = v0;
    v14[1] = sub_236A6A77C;
    return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v11, v10, 100, v12, v13);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_236A6A77C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_236A6A7E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = MEMORY[0x24BEE4AF8];
  v16 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 72);
    v15 = *(_QWORD *)(v0 + 112);
    while (v4 < *(_QWORD *)(v1 + 16))
    {
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v8 = *(_QWORD *)(v6 + 72);
      sub_236A5945C(*(_QWORD *)(v0 + 112) + v7 + v8 * v4, *(_QWORD *)(v0 + 88));
      v9 = *(_QWORD *)(v5 + 32);
      v10 = *(_QWORD *)(v5 + 24) & 0xFFFFFFFFFFFFLL;
      if ((v9 & 0x2000000000000000) != 0)
        v10 = HIBYTE(v9) & 0xF;
      v11 = *(_QWORD *)(v0 + 88);
      if (v10)
      {
        sub_236A5E998(v11, *(_QWORD *)(v0 + 80));
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_236A53168(0, *(_QWORD *)(v2 + 16) + 1, 1);
          v2 = v16;
        }
        v13 = *(_QWORD *)(v2 + 16);
        v12 = *(_QWORD *)(v2 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_236A53168(v12 > 1, v13 + 1, 1);
          v2 = v16;
        }
        v14 = *(_QWORD *)(v0 + 80);
        *(_QWORD *)(v2 + 16) = v13 + 1;
        sub_236A5E998(v14, v2 + v7 + v13 * v8);
        v1 = v15;
      }
      else
      {
        sub_236A5B868(v11);
      }
      if (v3 == ++v4)
        goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(uint64_t))(v0 + 8))(v2);
  }
}

uint64_t ATSpotlightMailRetriever.getRecentEmails(fromAuthor:toRecipients:withAdditionalRecipients:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v9;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v9 = (_QWORD *)swift_task_alloc();
  v4[6] = v9;
  *v9 = v4;
  v9[1] = sub_236A6A9D8;
  return ATSpotlightMailRetriever.getRecentEmailsSubsetMatch(fromAuthor:toRecipients:withAdditionalRecipients:)(a1, a2, a3, a4);
}

uint64_t sub_236A6A9D8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236A6AA34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_236A6C530(v1, v4, v5, v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_236A6AAD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_236A6DDF0();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433C00);
  v2[7] = swift_task_alloc();
  v4 = type metadata accessor for ATSpotlightDataRecord();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_236A6AB9C()
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
  _QWORD *v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  sub_236A5EA6C(*(_QWORD *)(v0 + 16), v3, &qword_256433C00);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_236A55170(*(_QWORD *)(v0 + 56), &qword_256433C00);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 64);
    sub_236A5E998(*(_QWORD *)(v0 + 56), v4);
    if (*(_QWORD *)(v4 + *(int *)(v5 + 68) + 8))
    {
      v6 = *(_QWORD *)(v0 + 24);
      v17 = *(_QWORD *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailConversationId);
      v18 = *(_QWORD *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailConversationId + 8);
      swift_bridgeObjectRetain();
      sub_236A6DE74();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_236A6DE74();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 104) = v18;
      v7 = *(_QWORD *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
      v8 = *(_QWORD *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId + 8);
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v9;
      *v9 = v0;
      v9[1] = sub_236A6ADF4;
      return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v7, v8, 100, v17, v18);
    }
    sub_236A5B868(*(_QWORD *)(v0 + 96));
  }
  sub_236A6DDE4();
  v11 = sub_236A6DDD8();
  v12 = sub_236A6DF1C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_236A4B000, v11, v12, "No mail record found with given unique id or record does not have conversation id set - cannot build email chain", v13, 2u);
    MEMORY[0x23B7FA5E0](v13, -1, -1);
  }
  v15 = *(_QWORD *)(v0 + 40);
  v14 = *(_QWORD *)(v0 + 48);
  v16 = *(_QWORD *)(v0 + 32);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_236A6ADF4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_236A6AE58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = MEMORY[0x24BEE4AF8];
  v17 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 120);
    while (v4 < *(_QWORD *)(v1 + 16))
    {
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v8 = *(_QWORD *)(v6 + 72);
      sub_236A5945C(*(_QWORD *)(v0 + 120) + v7 + v8 * v4, *(_QWORD *)(v0 + 88));
      v9 = *(_QWORD *)(v5 + 32);
      v10 = *(_QWORD *)(v5 + 24) & 0xFFFFFFFFFFFFLL;
      if ((v9 & 0x2000000000000000) != 0)
        v10 = HIBYTE(v9) & 0xF;
      v11 = *(_QWORD *)(v0 + 88);
      if (v10)
      {
        sub_236A5E998(v11, *(_QWORD *)(v0 + 80));
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_236A53168(0, *(_QWORD *)(v2 + 16) + 1, 1);
          v2 = v17;
        }
        v13 = *(_QWORD *)(v2 + 16);
        v12 = *(_QWORD *)(v2 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_236A53168(v12 > 1, v13 + 1, 1);
          v2 = v17;
        }
        v14 = *(_QWORD *)(v0 + 80);
        *(_QWORD *)(v2 + 16) = v13 + 1;
        sub_236A5E998(v14, v2 + v7 + v13 * v8);
        v1 = v16;
      }
      else
      {
        sub_236A5B868(v11);
      }
      if (v3 == ++v4)
        goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
LABEL_14:
    v15 = *(_QWORD *)(v0 + 96);
    swift_bridgeObjectRelease();
    sub_236A5B868(v15);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(uint64_t))(v0 + 8))(v2);
  }
}

uint64_t sub_236A6AFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_236A6B010()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;

  v1 = v0[5];
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailUniqueRecordIdentifier);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailUniqueRecordIdentifier + 8);
  swift_bridgeObjectRetain();
  sub_236A6DE74();
  swift_bridgeObjectRetain();
  sub_236A6DE74();
  swift_bridgeObjectRelease();
  v0[6] = v7;
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId + 8);
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  *v4 = v0;
  v4[1] = sub_236A6B0FC;
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v2, v3, 1, v6, v7);
}

uint64_t sub_236A6B0FC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_236A6B160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 64);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(_QWORD *)(v0 + 16);
    v3 = type metadata accessor for ATSpotlightDataRecord();
    v4 = *(_QWORD *)(v3 - 8);
    sub_236A5945C(v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v2);
    swift_bridgeObjectRelease();
    v5 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = type metadata accessor for ATSpotlightDataRecord();
    v4 = *(_QWORD *)(v3 - 8);
    v5 = 1;
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v4 + 56))(*(_QWORD *)(v0 + 16), v5, 1, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_236A6B208(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;

  sub_236A5945C(a1, a2);
  v4 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  v5 = sub_236A6B72C(0xD0000000000000BELL, 0x8000000236A70110, 0);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 24);
    v7 = *(_QWORD *)(a1 + 32);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433D90);
    sub_236A6CA44();
    sub_236A6CA90();
    v8 = sub_236A6DF58();
    v10 = v9;
    v11 = (void *)sub_236A6DE2C();
    v12 = objc_msgSend(v5, sel_firstMatchInString_options_range_, v11, 0, v8, v10);

    if (v12)
    {
      objc_msgSend(v12, sel_range);
      sub_236A6DE68();
      v13 = sub_236A6DE8C();
      v14 = MEMORY[0x23B7F9E78](v13);
      v16 = v15;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a2 + 24) = v14;
      *(_QWORD *)(a2 + 32) = v16;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a2 + 24) = v6;
      *(_QWORD *)(a2 + 32) = v7;
    }
    v17 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
    v18 = v17[1];
    if (v18)
    {
      v19 = *v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20 = sub_236A6DF58();
      v22 = v21;
      v23 = (void *)sub_236A6DE2C();
      v24 = objc_msgSend(v5, sel_firstMatchInString_options_range_, v23, 0, v20, v22);

      if (v24)
      {
        objc_msgSend(v24, sel_range);
        sub_236A6DE68();
        v25 = sub_236A6DE8C();
        v26 = MEMORY[0x23B7F9E78](v25);
        v28 = v27;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v29 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
        *v29 = v26;
        v29[1] = v28;
      }
      else
      {

        swift_bridgeObjectRelease();
        v30 = (_QWORD *)(a2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
        *v30 = v19;
        v30[1] = v18;
      }
    }
    else
    {

    }
  }
}

uint64_t sub_236A6B574()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t ATSpotlightMailRetriever.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  v2 = sub_236A6DC64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ATSpotlightMailRetriever.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  v2 = sub_236A6DC64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_236A6B72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_236A6DE2C();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_236A6DBEC();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_236A6B804(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_236A6B814(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_236A6E168();
    swift_bridgeObjectRetain();
    sub_236A6DE5C();
    v18 = sub_236A6E18C();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_236A6E0F0() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_236A6E0F0() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_236A6BAB4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_236A6E168();
  swift_bridgeObjectRetain();
  sub_236A6DE5C();
  v8 = sub_236A6E18C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_236A6E0F0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_236A6E0F0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_236A6BF3C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_236A6BC60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433DA8);
  v3 = sub_236A6DFD0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_236A6E168();
      sub_236A6DE5C();
      result = sub_236A6E18C();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_236A6BF3C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_236A6BC60();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_236A6C0D4();
      goto LABEL_22;
    }
    sub_236A6C284();
  }
  v11 = *v4;
  sub_236A6E168();
  sub_236A6DE5C();
  result = sub_236A6E18C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_236A6E0F0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_236A6E108();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_236A6E0F0();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_236A6C0D4()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433DA8);
  v2 = *v0;
  v3 = sub_236A6DFC4();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_236A6C284()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256433DA8);
  v3 = sub_236A6DFD0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_236A6E168();
    swift_bridgeObjectRetain();
    sub_236A6DE5C();
    result = sub_236A6E18C();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_236A6C530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
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

  v58 = a3;
  v59 = a2;
  v9 = (int *)type metadata accessor for ATSpotlightDataRecord();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v56 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v50 - v13;
  result = MEMORY[0x24BEE4AF8];
  v65 = MEMORY[0x24BEE4AF8];
  v61 = *(_QWORD *)(a1 + 16);
  if (v61)
  {
    v50 = v5;
    v16 = 0;
    v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v62 = *(_QWORD *)(v12 + 72);
    v52 = v17;
    v60 = a1 + v17;
    v54 = (uint64_t *)(a4 + 40);
    v51 = (uint64_t *)(a5 + 40);
    v55 = MEMORY[0x24BEE4AF8];
    v53 = a5;
    v57 = a4;
    v18 = v58;
    do
    {
      sub_236A5945C(v60 + v62 * v16, (uint64_t)v14);
      v19 = *(_QWORD **)&v14[v9[11]];
      if (!v19 || v19[2] != 1)
        goto LABEL_35;
      v20 = v19[4] == v59 && v19[5] == v18;
      if (!v20 && (sub_236A6E0F0() & 1) == 0)
        goto LABEL_35;
      v21 = *(_QWORD *)(a4 + 16);
      if (v21)
      {
        v22 = *(_QWORD *)&v14[v9[12]];
        if (!v22)
          goto LABEL_35;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v64 = sub_236A6DF04();
        v23 = v54;
        do
        {
          v24 = *(v23 - 1);
          v25 = *v23;
          swift_bridgeObjectRetain();
          sub_236A6BAB4(&v63, v24, v25);
          swift_bridgeObjectRelease();
          v23 += 2;
          --v21;
        }
        while (v21);
        a4 = v57;
        swift_bridgeObjectRelease();
        v26 = v64;
        v27 = *(_QWORD *)(v22 + 16);
        v28 = sub_236A6DF04();
        v64 = v28;
        if (v27)
        {
          v29 = (uint64_t *)(v22 + 40);
          do
          {
            v30 = *(v29 - 1);
            v31 = *v29;
            swift_bridgeObjectRetain();
            sub_236A6BAB4(&v63, v30, v31);
            swift_bridgeObjectRelease();
            v29 += 2;
            --v27;
          }
          while (v27);
          swift_bridgeObjectRelease();
          v32 = v64;
          a5 = v53;
          a4 = v57;
        }
        else
        {
          v32 = v28;
          swift_bridgeObjectRelease();
        }
        v33 = sub_236A6B814(v26, v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v18 = v58;
        if ((v33 & 1) == 0)
          goto LABEL_35;
      }
      v34 = *(_QWORD *)(a5 + 16);
      if (!v34)
        goto LABEL_30;
      v35 = *(_QWORD *)&v14[v9[13]];
      if (!v35)
        goto LABEL_35;
      v36 = *(_QWORD *)(v35 + 16);
      swift_bridgeObjectRetain();
      v37 = sub_236A6DF04();
      v64 = v37;
      if (v36)
      {
        v38 = (uint64_t *)(v35 + 40);
        do
        {
          v39 = *(v38 - 1);
          v40 = *v38;
          swift_bridgeObjectRetain();
          sub_236A6BAB4(&v63, v39, v40);
          swift_bridgeObjectRelease();
          v38 += 2;
          --v36;
        }
        while (v36);
        swift_bridgeObjectRelease();
        v41 = v64;
        a5 = v53;
      }
      else
      {
        v41 = v37;
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      v64 = sub_236A6DF04();
      v42 = v51;
      do
      {
        v43 = *(v42 - 1);
        v44 = *v42;
        swift_bridgeObjectRetain();
        sub_236A6BAB4(&v63, v43, v44);
        swift_bridgeObjectRelease();
        v42 += 2;
        --v34;
      }
      while (v34);
      swift_bridgeObjectRelease();
      v45 = sub_236A6B814(v41, v64);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a4 = v57;
      v18 = v58;
      if ((v45 & 1) != 0)
      {
LABEL_30:
        sub_236A5E998((uint64_t)v14, v56);
        v46 = v55;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_236A53168(0, *(_QWORD *)(v46 + 16) + 1, 1);
          v18 = v58;
        }
        v47 = v65;
        v49 = *(_QWORD *)(v65 + 16);
        v48 = *(_QWORD *)(v65 + 24);
        if (v49 >= v48 >> 1)
        {
          sub_236A53168(v48 > 1, v49 + 1, 1);
          v18 = v58;
          v47 = v65;
        }
        *(_QWORD *)(v47 + 16) = v49 + 1;
        v55 = v47;
        sub_236A5E998(v56, v47 + v52 + v49 * v62);
      }
      else
      {
LABEL_35:
        sub_236A5B868((uint64_t)v14);
      }
      ++v16;
    }
    while (v16 != v61);
    return v65;
  }
  return result;
}

uint64_t sub_236A6C9AC()
{
  return type metadata accessor for ATSpotlightMailRetriever();
}

uint64_t type metadata accessor for ATSpotlightMailRetriever()
{
  uint64_t result;

  result = qword_256433C58;
  if (!qword_256433C58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_236A6C9F0()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_236A6CA44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256433D98;
  if (!qword_256433D98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256433D90);
    result = MEMORY[0x23B7FA574](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_256433D98);
  }
  return result;
}

unint64_t sub_236A6CA90()
{
  unint64_t result;

  result = qword_256433DA0;
  if (!qword_256433DA0)
  {
    result = MEMORY[0x23B7FA574](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256433DA0);
  }
  return result;
}

void ATAccessibility.systemAXApp.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v1 = OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_systemWideElement);
    if (!v4)
    {
      sub_236A55934();
      swift_allocError();
      *(_QWORD *)v10 = 0;
      *(_QWORD *)(v10 + 8) = 0;
      goto LABEL_9;
    }
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v6 = v4;

    v7 = *(void **)(v0 + v1);
    if (!v7)
    {
      __break(1u);
      return;
    }
    v3 = v7;

    v2 = 0;
  }
  v8 = v2;
  v9 = objc_msgSend(v3, sel_systemApplication);

  if (v9)
    return;
  sub_236A55934();
  swift_allocError();
  *(_OWORD *)v10 = xmmword_236A6EFD0;
LABEL_9:
  *(_BYTE *)(v10 + 16) = 7;
  swift_willThrow();
}

void *ATAccessibility.currentAXApps.getter()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  ATAccessibility.systemAXApp.getter();
  if (!v1)
  {
    v0 = v2;
    v3 = objc_msgSend(v2, sel_currentApplications);

    if (!v3
      || (v4 = sub_236A6DEA4(), v3, v0 = (void *)sub_236A6CCC8(v4), swift_bridgeObjectRelease(), !v0))
    {
      sub_236A55934();
      swift_allocError();
      *(_OWORD *)v5 = xmmword_236A6EFE0;
      *(_BYTE *)(v5 + 16) = 7;
      swift_willThrow();
    }
  }
  return v0;
}

uint64_t sub_236A6CCC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_236A6E030();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_236A550F0(i, (uint64_t)v5);
    sub_236A6DB6C();
    if (!swift_dynamicCast())
      break;
    sub_236A6E018();
    sub_236A6E03C();
    sub_236A6E048();
    sub_236A6E024();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

Swift::String __swiftcall ATAccessibility.onScreenText()()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  BOOL v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  id v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  id v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  id v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  Swift::String result;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;

  ATAccessibility.systemAXApp.getter();
  v3 = v2;
  v4 = objc_msgSend(v2, sel_currentApplications);

  if (!v4)
    goto LABEL_2;
  v5 = sub_236A6DEA4();

  v6 = sub_236A6CCC8(v5);
  swift_bridgeObjectRelease();
  v1 = (void *)0xE000000000000000;
  if (!v6)
  {
    v0 = 0;
    goto LABEL_108;
  }
  v83 = v6 & 0xFFFFFFFFFFFFFF8;
  v84 = v6;
  if (v6 >> 62)
  {
LABEL_103:
    swift_bridgeObjectRetain();
    v7 = sub_236A6E078();
    swift_bridgeObjectRelease();
    v8 = v84;
    if (v7)
      goto LABEL_7;
    goto LABEL_104;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8 = v6;
  if (!v7)
  {
LABEL_104:
    swift_bridgeObjectRelease();
LABEL_2:
    v0 = 0;
    v1 = (void *)0xE000000000000000;
    goto LABEL_108;
  }
LABEL_7:
  v9 = 0;
  v82 = v8 + 32;
  v86 = v8 & 0xC000000000000001;
  v85 = v7;
  while (1)
  {
    if (v86)
    {
      v10 = (id)MEMORY[0x23B7FA028](v9, v84);
    }
    else
    {
      if (v9 >= *(_QWORD *)(v83 + 16))
        goto LABEL_102;
      v10 = *(id *)(v82 + 8 * v9);
    }
    v11 = v10;
    v12 = __OFADD__(v9, 1);
    v13 = v9 + 1;
    if (v12)
    {
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
      goto LABEL_103;
    }
    v0 = objc_msgSend(v10, sel_label);
    if (!v0)
      break;
    v14 = v0;
    sub_236A6DE38();

    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v0 = objc_msgSend(v11, sel_bundleId);
    if (!v0)
      goto LABEL_107;
    v15 = v0;
    sub_236A6DE38();

    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v0 = objc_msgSend(v11, sel_processName);
    if (!v0)
      goto LABEL_106;
    v16 = v0;
    sub_236A6DE38();

    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v11, sel_visibleElements);
    if (v17)
    {
      v18 = v17;
      sub_236A6DB6C();
      v19 = sub_236A6DEA4();

      if (!(v19 >> 62))
        goto LABEL_19;
    }
    else
    {
      v19 = MEMORY[0x24BEE4AF8];
      if (!(MEMORY[0x24BEE4AF8] >> 62))
      {
LABEL_19:
        v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRetain();
    v20 = sub_236A6E078();
    swift_bridgeObjectRelease();
LABEL_20:
    v87 = v13;
    if (v20)
    {
      if (v20 < 1)
        goto LABEL_98;
      v21 = 0;
      v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        if ((v19 & 0xC000000000000001) != 0)
          v23 = (id)MEMORY[0x23B7FA028](v21, v19);
        else
          v23 = *(id *)(v19 + 8 * v21 + 32);
        v24 = v23;
        v25 = objc_msgSend(v23, sel_label, v82);
        if (v25)
        {
          v26 = v25;
          v27 = sub_236A6DE38();
          v29 = v28;

        }
        else
        {
          v27 = 0;
          v29 = 0xE000000000000000;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v22 = sub_236A50F4C(0, v22[2] + 1, 1, v22);
        v31 = v22[2];
        v30 = v22[3];
        if (v31 >= v30 >> 1)
          v22 = sub_236A50F4C((_QWORD *)(v30 > 1), v31 + 1, 1, v22);
        ++v21;
        v22[2] = v31 + 1;
        v32 = &v22[2 * v31];
        v32[4] = v27;
        v32[5] = v29;

      }
      while (v20 != v21);
    }
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256433348);
    sub_236A60854();
    sub_236A6DDFC();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v33 = objc_msgSend(v11, sel_explorerElements);
    if (v33)
    {
      v34 = v33;
      sub_236A6DB6C();
      v35 = sub_236A6DEA4();

      if (v35 >> 62)
        goto LABEL_55;
    }
    else
    {
      v35 = MEMORY[0x24BEE4AF8];
      if (MEMORY[0x24BEE4AF8] >> 62)
      {
LABEL_55:
        swift_bridgeObjectRetain();
        v36 = sub_236A6E078();
        swift_bridgeObjectRelease();
        if (!v36)
          goto LABEL_56;
        goto LABEL_40;
      }
    }
    v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v36)
      goto LABEL_56;
LABEL_40:
    if (v36 < 1)
      goto LABEL_99;
    v37 = 0;
    v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v35 & 0xC000000000000001) != 0)
        v39 = (id)MEMORY[0x23B7FA028](v37, v35);
      else
        v39 = *(id *)(v35 + 8 * v37 + 32);
      v40 = v39;
      v41 = objc_msgSend(v39, sel_label, v82);
      if (v41)
      {
        v42 = v41;
        v43 = sub_236A6DE38();
        v45 = v44;

      }
      else
      {
        v43 = 0;
        v45 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v38 = sub_236A50F4C(0, v38[2] + 1, 1, v38);
      v47 = v38[2];
      v46 = v38[3];
      if (v47 >= v46 >> 1)
        v38 = sub_236A50F4C((_QWORD *)(v46 > 1), v47 + 1, 1, v38);
      ++v37;
      v38[2] = v47 + 1;
      v48 = &v38[2 * v47];
      v48[4] = v43;
      v48[5] = v45;

    }
    while (v36 != v37);
LABEL_56:
    swift_bridgeObjectRelease();
    sub_236A6DDFC();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v49 = objc_msgSend(v11, sel_nativeFocusableElements);
    if (v49)
    {
      v50 = v49;
      sub_236A6DB6C();
      v51 = sub_236A6DEA4();

      if (v51 >> 62)
        goto LABEL_74;
    }
    else
    {
      v51 = MEMORY[0x24BEE4AF8];
      if (MEMORY[0x24BEE4AF8] >> 62)
      {
LABEL_74:
        swift_bridgeObjectRetain();
        v52 = sub_236A6E078();
        swift_bridgeObjectRelease();
        if (!v52)
          goto LABEL_75;
        goto LABEL_59;
      }
    }
    v52 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v52)
      goto LABEL_75;
LABEL_59:
    if (v52 < 1)
      goto LABEL_100;
    v53 = 0;
    v54 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v51 & 0xC000000000000001) != 0)
        v55 = (id)MEMORY[0x23B7FA028](v53, v51);
      else
        v55 = *(id *)(v51 + 8 * v53 + 32);
      v56 = v55;
      v57 = objc_msgSend(v55, sel_label, v82);
      if (v57)
      {
        v58 = v57;
        v59 = sub_236A6DE38();
        v61 = v60;

      }
      else
      {
        v59 = 0;
        v61 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v54 = sub_236A50F4C(0, v54[2] + 1, 1, v54);
      v63 = v54[2];
      v62 = v54[3];
      if (v63 >= v62 >> 1)
        v54 = sub_236A50F4C((_QWORD *)(v62 > 1), v63 + 1, 1, v54);
      ++v53;
      v54[2] = v63 + 1;
      v64 = &v54[2 * v63];
      v64[4] = v59;
      v64[5] = v61;

    }
    while (v52 != v53);
LABEL_75:
    swift_bridgeObjectRelease();
    sub_236A6DDFC();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    v65 = objc_msgSend(v11, sel_elementsWithSemanticContext);
    if (v65)
    {
      v66 = v65;
      sub_236A6DB6C();
      v67 = sub_236A6DEA4();

      if (!(v67 >> 62))
        goto LABEL_77;
    }
    else
    {
      v67 = MEMORY[0x24BEE4AF8];
      if (!(MEMORY[0x24BEE4AF8] >> 62))
      {
LABEL_77:
        v68 = *(_QWORD *)((v67 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v68)
          goto LABEL_8;
        goto LABEL_78;
      }
    }
    swift_bridgeObjectRetain();
    v68 = sub_236A6E078();
    swift_bridgeObjectRelease();
    if (!v68)
      goto LABEL_8;
LABEL_78:
    if (v68 < 1)
      goto LABEL_101;
    v69 = 0;
    v70 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v67 & 0xC000000000000001) != 0)
        v71 = (id)MEMORY[0x23B7FA028](v69, v67);
      else
        v71 = *(id *)(v67 + 8 * v69 + 32);
      v72 = v71;
      v73 = objc_msgSend(v71, sel_label, v82);
      if (v73)
      {
        v74 = v73;
        v75 = sub_236A6DE38();
        v77 = v76;

      }
      else
      {
        v75 = 0;
        v77 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v70 = sub_236A50F4C(0, v70[2] + 1, 1, v70);
      v79 = v70[2];
      v78 = v70[3];
      if (v79 >= v78 >> 1)
        v70 = sub_236A50F4C((_QWORD *)(v78 > 1), v79 + 1, 1, v70);
      ++v69;
      v70[2] = v79 + 1;
      v80 = &v70[2 * v79];
      v80[4] = v75;
      v80[5] = v77;

    }
    while (v68 != v69);
LABEL_8:
    swift_bridgeObjectRelease();
    sub_236A6DDFC();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_236A6DE74();
    swift_bridgeObjectRelease();
    sub_236A6DE74();
    swift_bridgeObjectRelease();

    v9 = v87;
    if (v87 == v85)
    {
      swift_bridgeObjectRelease();
      v0 = 0;
      v1 = (void *)0xE000000000000000;
      goto LABEL_108;
    }
  }
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  result._object = v1;
  result._countAndFlagsBits = (uint64_t)v0;
  return result;
}

id ATAccessibility.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ATAccessibility.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATAccessibility();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ATAccessibility.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATAccessibility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_236A6DB6C()
{
  unint64_t result;

  result = qword_256433BE8;
  if (!qword_256433BE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256433BE8);
  }
  return result;
}

uint64_t type metadata accessor for ATAccessibility()
{
  return objc_opt_self();
}

uint64_t sub_236A6DBC8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_236A6DBD4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_236A6DBE0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_236A6DBEC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_236A6DBF8()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_236A6DC04()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_236A6DC10()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_236A6DC1C()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_236A6DC28()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_236A6DC34()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_236A6DC40()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_236A6DC4C()
{
  return MEMORY[0x24BDCE8C8]();
}

uint64_t sub_236A6DC58()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_236A6DC64()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_236A6DC70()
{
  return MEMORY[0x24BE58068]();
}

uint64_t sub_236A6DC7C()
{
  return MEMORY[0x24BE58070]();
}

uint64_t sub_236A6DC88()
{
  return MEMORY[0x24BE58088]();
}

uint64_t sub_236A6DC94()
{
  return MEMORY[0x24BE58230]();
}

uint64_t sub_236A6DCA0()
{
  return MEMORY[0x24BE58250]();
}

uint64_t sub_236A6DCAC()
{
  return MEMORY[0x24BE582C0]();
}

uint64_t sub_236A6DCB8()
{
  return MEMORY[0x24BE582C8]();
}

uint64_t sub_236A6DCC4()
{
  return MEMORY[0x24BE582D0]();
}

uint64_t sub_236A6DCD0()
{
  return MEMORY[0x24BE582E0]();
}

uint64_t sub_236A6DCDC()
{
  return MEMORY[0x24BE582F0]();
}

uint64_t sub_236A6DCE8()
{
  return MEMORY[0x24BE58308]();
}

uint64_t sub_236A6DCF4()
{
  return MEMORY[0x24BE58318]();
}

uint64_t sub_236A6DD00()
{
  return MEMORY[0x24BE58360]();
}

uint64_t sub_236A6DD0C()
{
  return MEMORY[0x24BE58368]();
}

uint64_t sub_236A6DD18()
{
  return MEMORY[0x24BE58378]();
}

uint64_t sub_236A6DD24()
{
  return MEMORY[0x24BE58388]();
}

uint64_t sub_236A6DD30()
{
  return MEMORY[0x24BE583C8]();
}

uint64_t sub_236A6DD3C()
{
  return MEMORY[0x24BE583D0]();
}

uint64_t sub_236A6DD48()
{
  return MEMORY[0x24BE583D8]();
}

uint64_t sub_236A6DD54()
{
  return MEMORY[0x24BE58440]();
}

uint64_t sub_236A6DD60()
{
  return MEMORY[0x24BE58460]();
}

uint64_t sub_236A6DD6C()
{
  return MEMORY[0x24BE58468]();
}

uint64_t sub_236A6DD78()
{
  return MEMORY[0x24BE58470]();
}

uint64_t sub_236A6DD84()
{
  return MEMORY[0x24BE58478]();
}

uint64_t sub_236A6DD90()
{
  return MEMORY[0x24BE58480]();
}

uint64_t sub_236A6DD9C()
{
  return MEMORY[0x24BE58488]();
}

uint64_t sub_236A6DDA8()
{
  return MEMORY[0x24BE58490]();
}

uint64_t sub_236A6DDB4()
{
  return MEMORY[0x24BE584A0]();
}

uint64_t sub_236A6DDC0()
{
  return MEMORY[0x24BE584A8]();
}

uint64_t sub_236A6DDCC()
{
  return MEMORY[0x24BE584B0]();
}

uint64_t sub_236A6DDD8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_236A6DDE4()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_236A6DDF0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_236A6DDFC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_236A6DE08()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_236A6DE14()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_236A6DE20()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_236A6DE2C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_236A6DE38()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_236A6DE44()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_236A6DE50()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_236A6DE5C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_236A6DE68()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_236A6DE74()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236A6DE80()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_236A6DE8C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_236A6DE98()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_236A6DEA4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_236A6DEB0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_236A6DEBC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_236A6DEC8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_236A6DED4()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_236A6DEE0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_236A6DEEC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_236A6DEF8()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_236A6DF04()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_236A6DF10()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_236A6DF1C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_236A6DF28()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_236A6DF34()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_236A6DF40()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_236A6DF4C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_236A6DF58()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_236A6DF64()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_236A6DF70()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_236A6DF7C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_236A6DF88()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_236A6DF94()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_236A6DFA0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_236A6DFAC()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_236A6DFB8()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_236A6DFC4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_236A6DFD0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_236A6DFDC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_236A6DFE8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_236A6DFF4()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_236A6E000()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_236A6E00C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_236A6E018()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_236A6E024()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_236A6E030()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_236A6E03C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_236A6E048()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_236A6E054()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_236A6E060()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_236A6E06C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_236A6E078()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_236A6E084()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_236A6E090()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_236A6E09C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_236A6E0A8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_236A6E0B4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_236A6E0C0()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_236A6E0CC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_236A6E0D8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_236A6E0E4()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_236A6E0F0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_236A6E0FC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_236A6E108()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_236A6E114()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_236A6E120()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_236A6E12C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_236A6E138()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_236A6E144()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_236A6E150()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_236A6E15C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_236A6E168()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_236A6E174()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_236A6E180()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_236A6E18C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_236A6E198()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_236A6E1A4()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_236A6E1B0()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

