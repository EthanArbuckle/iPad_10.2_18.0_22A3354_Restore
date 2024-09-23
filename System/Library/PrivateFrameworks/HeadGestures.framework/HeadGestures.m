id HGSetTemporaryDirectorySuffix()
{
  NSObject *v0;

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryFramework[0]);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      HGSetTemporaryDirectorySuffix_cold_1(v0);

  }
  return NSTemporaryDirectory();
}

id HGGetTemporaryRawDataDirectory()
{
  void *v0;
  void *v1;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("RawData"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id HGGetTemporaryNotificationDataDirectory()
{
  void *v0;
  void *v1;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("NotificationData"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id _HGObjCLoggingFacility(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___HGObjCLoggingFacility_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_HGObjCLoggingFacility_onceToken[0] != -1)
    dispatch_once(_HGObjCLoggingFacility_onceToken, block);
  return (id)_HGObjCLoggingFacility_oslog;
}

double sub_23DA61D78()
{
  uint64_t v0;
  double result;

  if ((*(_BYTE *)(v0 + 40) & 1) == 0)
    return *(double *)(v0 + 32);
  result = (1.0 - *(double *)(v0 + 24)) / *(double *)(v0 + 16);
  *(double *)(v0 + 32) = result;
  *(_BYTE *)(v0 + 40) = 0;
  return result;
}

double sub_23DA61DA4()
{
  uint64_t v0;
  _BYTE *v1;
  double result;

  v1 = (_BYTE *)(v0
               + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume);
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume
                 + 8) & 1) == 0)
    return *(double *)v1;
  result = *(double *)(v0 + 24);
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

void sub_23DA61DD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  double v30;
  double v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;

  v2 = v1;
  v38 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v36 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v36 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v15 = sub_23DA9B7DC();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v36 - v20;
  sub_23DA9B7B8();
  if ((*(_BYTE *)(v2 + 56) & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
LABEL_5:
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    v25 = v38;
LABEL_6:
    v26 = OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume;
    *(_QWORD *)(v2
              + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume) = *(_QWORD *)(v2 + 24);
    goto LABEL_7;
  }
  v37 = v6;
  v22 = v2 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  swift_beginAccess();
  sub_23DA6370C(v22, (uint64_t)v14);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v22) = v23(v14, 1, v15);
  sub_23DA637E4((uint64_t)v14);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  v24 = (_DWORD)v22 == 1;
  v6 = v37;
  if (v24)
    goto LABEL_5;
  v28 = v2 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  swift_beginAccess();
  sub_23DA6370C(v28, (uint64_t)v12);
  v29 = v23(v12, 1, v15);
  if (v29 == 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  sub_23DA9B7C4();
  v31 = v30;
  v32 = *(void (**)(char *, uint64_t))(v16 + 8);
  v32(v19, v15);
  v32(v12, v15);
  v25 = v38;
  if (v31 > 0.8)
    goto LABEL_6;
  if ((*(_BYTE *)(v2 + 56) & 1) != 0)
  {
LABEL_23:
    __break(1u);
    JUMPOUT(0x23DA62154);
  }
  v33 = *(_QWORD *)(v2 + 48);
  switch(v38)
  {
    case 1:
      if (v33 != 2)
        goto LABEL_6;
      break;
    case 2:
      if (v33 != 1)
        goto LABEL_6;
      break;
    case 3:
      if (v33 != 4)
        goto LABEL_6;
      break;
    case 4:
      if (v33 != 3)
        goto LABEL_6;
      break;
    default:
      goto LABEL_6;
  }
  v34 = sub_23DA61DA4();
  v35 = v34 + sub_23DA61D78();
  if (v35 > 1.0)
    v35 = 1.0;
  v26 = OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume;
  *(double *)(v2
            + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume) = v35;
LABEL_7:
  *(_BYTE *)(v2 + v26 + 8) = 0;
  *(_QWORD *)(v2 + 48) = v25;
  *(_BYTE *)(v2 + 56) = 0;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v9, v21, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v9, 0, 1, v15);
  sub_23DA63754((uint64_t)v9, (uint64_t)v6);
  v27 = v2 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  swift_beginAccess();
  sub_23DA6379C((uint64_t)v6, v27);
  swift_endAccess();
  sub_23DA61DA4();
}

uint64_t sub_23DA62164()
{
  uint64_t v0;

  sub_23DA637E4(v0 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime);
  return swift_deallocClassInstance();
}

uint64_t sub_23DA62194()
{
  return type metadata accessor for HGPartialGestureAudioProgress(0);
}

uint64_t type metadata accessor for HGPartialGestureAudioProgress(uint64_t a1)
{
  return sub_23DA625B4(a1, (uint64_t *)&unk_256CDB028);
}

void sub_23DA621B0()
{
  unint64_t v0;

  sub_23DA62238();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_23DA62238()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CDB038[0])
  {
    sub_23DA9B7DC();
    v0 = sub_23DA9BD4C();
    if (!v1)
      atomic_store(v0, qword_256CDB038);
  }
}

uint64_t sub_23DA6228C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_256CDAFE8 != -1)
    swift_once();
  v1 = *(void **)(qword_256CE1550 + 16);
  v2 = (void *)sub_23DA9BAA0();
  objc_msgSend(v1, sel_doubleForKey_, v2);
  v4 = v3;

  *(_QWORD *)(v0 + 16) = v4;
  v5 = *(void **)(qword_256CE1550 + 16);
  v6 = (void *)sub_23DA9BAA0();
  objc_msgSend(v5, sel_doubleForKey_, v6);
  v8 = v7;

  *(_QWORD *)(v0 + 24) = v8;
  *(_QWORD *)(v0 + 32) = 0;
  *(_BYTE *)(v0 + 40) = 1;
  *(_QWORD *)(v0 + 48) = 0;
  *(_BYTE *)(v0 + 56) = 1;
  v9 = v0 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  v10 = sub_23DA9B7DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = v0 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume;
  *(_QWORD *)v11 = 0;
  *(_BYTE *)(v11 + 8) = 1;
  return v0;
}

uint64_t sub_23DA623D4()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  swift_release();
  return v1;
}

id *sub_23DA62444()
{
  id *v0;
  id *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  char *v6;
  uint64_t v7;

  v1 = v0;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v2 = sub_23DA9B860();
  __swift_project_value_buffer(v2, (uint64_t)qword_256CE1558);
  v3 = sub_23DA9B848();
  v4 = sub_23DA9BC8C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23DA5F000, v3, v4, "[HGAudioPlayer] dealloc", v5, 2u);
    MEMORY[0x24263A588](v5, -1, -1);
  }

  (*((void (**)(void))*v1 + 33))();
  swift_release();
  swift_release();
  v6 = (char *)v1 + OBJC_IVAR____TtC12HeadGestures13HGAudioPlayer__isFreeToStop;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return v1;
}

uint64_t sub_23DA62574()
{
  sub_23DA62444();
  return swift_deallocClassInstance();
}

uint64_t sub_23DA62598()
{
  return type metadata accessor for HGAudioPlayer(0);
}

uint64_t type metadata accessor for HGAudioPlayer(uint64_t a1)
{
  return sub_23DA625B4(a1, (uint64_t *)&unk_256CDB178);
}

uint64_t sub_23DA625B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DA625E8()
{
  unint64_t v0;

  sub_23DA63A48(319, qword_256CDB188, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_23DA626A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB370);
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB378);
  v22 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB380);
  v25 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB388);
  v26 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = a1;
  v14 = *(void **)(v2 + 16);
  swift_beginAccess();
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8CC();
  swift_endAccess();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB390);
  sub_23DA638A0(&qword_256CDB398, &qword_256CDB390, MEMORY[0x24BDB9AF8]);
  sub_23DA638A0(&qword_256CDB3A0, &qword_256CDB370, MEMORY[0x24BDB9EE8]);
  sub_23DA9B938();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_23DA63648;
  *(_QWORD *)(v16 + 24) = v2;
  sub_23DA638A0(&qword_256CDB3A8, &qword_256CDB378, MEMORY[0x24BDB9450]);
  swift_retain();
  sub_23DA9B95C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v7);
  sub_23DA638A0(&qword_256CDB3B0, &qword_256CDB380, MEMORY[0x24BDB96C0]);
  swift_retain();
  v17 = v23;
  sub_23DA9B92C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v17);
  sub_23DA638A0(&qword_256CDB3B8, &qword_256CDB388, MEMORY[0x24BDB9568]);
  v18 = v24;
  v19 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v18);
  return v19;
}

id sub_23DA62A20@<X0>(id *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char *v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id result;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _QWORD aBlock[6];

  v6 = sub_23DA9BA04();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DA9BA1C();
  v35 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *a1;
  v13 = (char *)*(id *)(a2 + 16);
  v14 = objc_msgSend(v36, sel_headGesture);
  v15 = &v13[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture];
  swift_beginAccess();
  v16 = *(_QWORD *)v15;
  swift_bridgeObjectRetain();

  if (*(_QWORD *)(v16 + 16)
    && ((unint64_t)v14 >= 4 ? (v17 = 4) : (v17 = (uint64_t)v14), v18 = sub_23DA99868(v17), (v19 & 1) != 0))
  {
    v20 = *(_BYTE *)(*(_QWORD *)(v16 + 56) + v18);
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
      goto LABEL_10;
    v21 = (char *)*(id *)(a2 + 16);
    v22 = sub_23DA819EC((unint64_t)objc_msgSend(v36, sel_headGesturePart));
    v23 = &v21[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture];
    swift_beginAccess();
    v24 = *(_QWORD *)v23;
    swift_bridgeObjectRetain();

    if (*(_QWORD *)(v24 + 16))
    {
      v25 = sub_23DA99868(v22);
      if ((v26 & 1) != 0)
      {
        v27 = *(unsigned __int8 *)(*(_QWORD *)(v24 + 56) + v25);
        swift_bridgeObjectRelease();
        if (v27 != 1)
        {
LABEL_11:
          v32 = v36;
          *a3 = v36;
          return v32;
        }
LABEL_10:
        v34 = *(_QWORD *)(a2 + 24);
        v28 = swift_allocObject();
        v29 = v36;
        *(_QWORD *)(v28 + 16) = a2;
        *(_QWORD *)(v28 + 24) = v29;
        aBlock[4] = sub_23DA635C0;
        aBlock[5] = v28;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_23DA7ECA4;
        aBlock[3] = &block_descriptor;
        v30 = _Block_copy(aBlock);
        swift_retain();
        v31 = v36;
        sub_23DA9BA10();
        v37 = MEMORY[0x24BEE4AF8];
        sub_23DA63860((unint64_t *)&qword_256CDB358, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
        sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
        sub_23DA9BD88();
        MEMORY[0x242639C94](0, v12, v9, v30);
        _Block_release(v30);
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v10);
        swift_release();
        goto LABEL_11;
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    __break(1u);
  }
  result = (id)swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void type metadata accessor for HGHeadGesture(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB330, (uint64_t)&unk_250E6B958, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB338, (uint64_t)&unk_250E6B978, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for AVAudio3DMixingRenderingAlgorithm(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB340, (uint64_t)&unk_250E6B9A0, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for HGHeadGesturePart(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB348, (uint64_t)&unk_250E6B9C0, MEMORY[0x24BEE4D40]);
}

uint64_t sub_23DA62DD8(uint64_t a1, uint64_t a2)
{
  return sub_23DA62EA0(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23DA62DE4()
{
  sub_23DA9BAC4();
  sub_23DA9BB18();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DA62E24()
{
  uint64_t v0;

  sub_23DA9BAC4();
  sub_23DA9BFBC();
  sub_23DA9BB18();
  v0 = sub_23DA9BFD4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23DA62E94(uint64_t a1, uint64_t a2)
{
  return sub_23DA62EA0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23DA62EA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23DA9BAC4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23DA62EDC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23DA9BAAC();
  *a2 = 0;
  return result;
}

uint64_t sub_23DA62F50(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23DA9BAB8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23DA62FCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23DA9BAC4();
  v2 = sub_23DA9BAA0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23DA6300C(uint64_t a1)
{
  MEMORY[0x24263A4F8](&unk_23DA9D258, a1);
  return sub_23DA9B83C();
}

uint64_t sub_23DA63048()
{
  MEMORY[0x24263A4F8](&unk_23DA9D258);
  return sub_23DA9B830();
}

uint64_t sub_23DA63090(uint64_t a1, uint64_t a2)
{
  sub_23DA9BFBC();
  MEMORY[0x24263A4F8](&unk_23DA9D258, a2);
  sub_23DA9B830();
  return sub_23DA9BFD4();
}

_QWORD *sub_23DA630E8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23DA630F8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_23DA63104(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_23DA63118@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_23DA63128(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24263A4E0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23DA6318C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23DA9BAC4();
  v2 = v1;
  if (v0 == sub_23DA9BAC4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23DA9BF5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_23DA63214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24263A4F8](&unk_23DA9D258, a3);
  return sub_23DA9B824();
}

uint64_t sub_23DA63260@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23DA9BAA0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23DA632A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23DA9BAC4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23DA632CC()
{
  sub_23DA63860(&qword_256CDB430, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_23DA9D214);
  sub_23DA63860(&qword_256CDB438, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_23DA9D168);
  return sub_23DA9BE9C();
}

uint64_t sub_23DA63350(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;

  v2 = v1;
  v15 = a1;
  v3 = sub_23DA9BCD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BCB0();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_23DA9BA1C();
  MEMORY[0x24BDAC7A8](v9);
  v14 = sub_23DA63824();
  sub_23DA9BA10();
  v17 = MEMORY[0x24BEE4AF8];
  sub_23DA63860(&qword_256CDB3D0, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3D8);
  sub_23DA638A0(&qword_256CDB3E0, &qword_256CDB3D8, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v3);
  *(_QWORD *)(v1 + 24) = sub_23DA9BCF8();
  *(_QWORD *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 40) = 1028443341;
  type metadata accessor for HGPartialGestureAudioProgress(0);
  v10 = swift_allocObject();
  sub_23DA6228C();
  *(_QWORD *)(v2 + 48) = v10;
  v11 = v15;
  *(_QWORD *)(v2 + 16) = v15;
  swift_beginAccess();
  v16 = 0;
  v12 = v11;
  sub_23DA9B8C0();
  swift_endAccess();
  return v2;
}

uint64_t sub_23DA63594()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23DA635C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v0 + 16) + 288))(*(_QWORD *)(v0 + 24));
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24263A4EC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23DA63648(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t *v2;
  char v3;
  uint64_t v4;

  v3 = a1 & a2;
  v4 = *v2;
  if ((a1 & a2 & 1) != 0)
    (*(void (**)(void))(v4 + 272))();
  else
    (*(void (**)(uint64_t (*)(), _QWORD))(v4 + 280))(nullsub_1, 0);
  return v3 & 1;
}

uint64_t sub_23DA63690()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DA636B4@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, a1[1]);
  *a2 = result & 1;
  return result;
}

uint64_t sub_23DA636EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t (*)(), _QWORD))(*(_QWORD *)v0 + 280))(nullsub_1, 0);
}

uint64_t sub_23DA6370C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DA63754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DA6379C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DA637E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23DA63824()
{
  unint64_t result;

  result = qword_256CDB3C8;
  if (!qword_256CDB3C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDB3C8);
  }
  return result;
}

uint64_t sub_23DA63860(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24263A4F8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DA638A0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24263A4F8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB3E8, (uint64_t)&unk_250E6BA60, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for CFNumber(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB3F0, (uint64_t)&unk_250E6BA88, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for CFBoolean(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB3F8, (uint64_t)&unk_250E6BAB8, MEMORY[0x24BEE4D40]);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB400, (uint64_t)&unk_250E6BAE8, MEMORY[0x24BEE4D40]);
}

uint64_t sub_23DA63950()
{
  return sub_23DA63860(&qword_256CDB408, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_23DA9D12C);
}

uint64_t sub_23DA6397C()
{
  return sub_23DA63860(&qword_256CDB410, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_23DA9D100);
}

uint64_t sub_23DA639A8()
{
  return sub_23DA63860(&qword_256CDB418, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_23DA9D19C);
}

uint64_t sub_23DA639D4()
{
  return sub_23DA63860(&qword_256CDB420, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_23DA9D284);
}

uint64_t sub_23DA63A00()
{
  return sub_23DA63860(&qword_256CDB428, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_23DA9D0CC);
}

void type metadata accessor for e5rt_error_code_t(uint64_t a1)
{
  sub_23DA63A48(a1, &qword_256CDB440, (uint64_t)&unk_250E6BB18, MEMORY[0x24BEE4D40]);
}

void sub_23DA63A48(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_23DA63A98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB510);
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB518);
  v15 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB520);
  v16 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB528);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB530);
  sub_23DA638A0(&qword_256CDB538, &qword_256CDB528, MEMORY[0x24BDB9AF8]);
  sub_23DA9B9B0();
  swift_release();
  sub_23DA9B86C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB540);
  sub_23DA638A0(&qword_256CDB548, &qword_256CDB510, MEMORY[0x24BDB98C8]);
  sub_23DA638A0(&qword_256CDB550, &qword_256CDB540, MEMORY[0x24BDB9970]);
  sub_23DA9B9BC();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v2);
  sub_23DA638A0(&qword_256CDB558, &qword_256CDB518, MEMORY[0x24BDB98F0]);
  sub_23DA64218();
  sub_23DA9B9E0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v5);
  sub_23DA638A0(&qword_256CDB568, &qword_256CDB520, MEMORY[0x24BDB9938]);
  v11 = sub_23DA9B998();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v10, v8);
  v17 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB570);
  sub_23DA638A0(&qword_256CDB578, &qword_256CDB570, MEMORY[0x24BDB97C8]);
  v12 = sub_23DA9B914();
  swift_release();
  return v12;
}

uint64_t sub_23DA63DA0@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[6];
  _OWORD v23[2];
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[8];
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[2];
  _BYTE v40[128];
  _OWORD v41[6];
  _OWORD v42[2];

  v5 = a1[5];
  v29 = a1[4];
  v30 = v5;
  v31[0] = a1[6];
  v6 = v31[0];
  *(_OWORD *)((char *)v31 + 9) = *(__int128 *)((char *)a1 + 105);
  v7 = a1[1];
  v25 = *a1;
  v26 = v7;
  v8 = a1[3];
  v27 = a1[2];
  v28 = v8;
  *(_OWORD *)((char *)v39 + 9) = *(_OWORD *)((char *)v31 + 9);
  v38 = v5;
  v39[0] = v6;
  v36 = v8;
  v37 = v29;
  v34 = v7;
  v35 = v27;
  v33 = v25;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v10 = a2 + 16;
  v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_23DA6425C(a2 + 16, (uint64_t)v40);
  sub_23DA6425C((uint64_t)v40, (uint64_t)v41);
  if (sub_23DA642A4((uint64_t)v41) != 1)
  {
    v31[6] = v41[4];
    v31[7] = v41[5];
    v32[0] = v42[0];
    *(_OWORD *)((char *)v32 + 9) = *(_OWORD *)((char *)v42 + 9);
    v31[2] = v41[0];
    v31[3] = v41[1];
    v31[4] = v41[2];
    v31[5] = v41[3];
    v11 = sub_23DA7BD30((uint64_t)&v25, 0.04);
    if (v3)
    {
      sub_23DA642C0((uint64_t)v22);
      sub_23DA6425C((uint64_t)v22, v10);
      return swift_willThrow();
    }
    sub_23DA63FAC((uint64_t)v11);
    v9 = v24;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = sub_23DA744A4(0, v9[2] + 1, 1, v9);
  v14 = v9[2];
  v13 = v9[3];
  if (v14 >= v13 >> 1)
    v9 = sub_23DA744A4((_QWORD *)(v13 > 1), v14 + 1, 1, v9);
  v9[2] = v14 + 1;
  v15 = &v9[16 * v14];
  v16 = v25;
  v17 = v26;
  v18 = v28;
  v15[4] = v27;
  v15[5] = v18;
  v15[2] = v16;
  v15[3] = v17;
  v19 = v29;
  v20 = v30;
  v21 = v31[0];
  *(_OWORD *)((char *)v15 + 137) = *(_OWORD *)((char *)v31 + 9);
  v15[7] = v20;
  v15[8] = v21;
  v15[6] = v19;
  v22[4] = v37;
  v22[5] = v38;
  v23[0] = v39[0];
  *(_OWORD *)((char *)v23 + 9) = *(_OWORD *)((char *)v39 + 9);
  v22[0] = v33;
  v22[1] = v34;
  v22[2] = v35;
  v22[3] = v36;
  nullsub_1(v22);
  result = sub_23DA6425C((uint64_t)v22, v10);
  *a3 = v9;
  return result;
}

uint64_t sub_23DA63FAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _QWORD *v9;
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
  v3 = sub_23DA744A4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  v9 = &v3[16 * v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[16 * v2] && (unint64_t)v9 < a1 + 32 + (v2 << 7))
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), v2 << 7);
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
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA640F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB530);
  sub_23DA638A0(&qword_256CDB588, &qword_256CDB530, MEMORY[0x24BEE12C8]);
  return sub_23DA9BB60();
}

uint64_t sub_23DA64164@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id v3;
  uint64_t result;
  char v5;
  char v6;

  v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB580);
  result = swift_dynamicCast();
  if ((_DWORD)result)
    v5 = v6;
  else
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t sub_23DA641D0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGDataRegulator()
{
  return objc_opt_self();
}

uint64_t sub_23DA64200@<X0>(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_23DA63DA0(a1, v2, a2);
}

unint64_t sub_23DA64218()
{
  unint64_t result;

  result = qword_256CDB560;
  if (!qword_256CDB560)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9DC18, &type metadata for HGError);
    atomic_store(result, (unint64_t *)&qword_256CDB560);
  }
  return result;
}

uint64_t sub_23DA6425C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DA642A4(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 120);
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

double sub_23DA642C0(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 112) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_BYTE *)(a1 + 120) = 2;
  return result;
}

uint64_t sub_23DA642E4()
{
  sub_23DA9BFBC();
  sub_23DA9BFC8();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA64328()
{
  return sub_23DA9BFC8();
}

uint64_t sub_23DA64350()
{
  sub_23DA9BFBC();
  sub_23DA9BFC8();
  return sub_23DA9BFD4();
}

unint64_t sub_23DA64390@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23DA67BBC(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_23DA643C0()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  if (qword_256CDAFC0 != -1)
    swift_once();
  v0 = qword_256CDAFB8;
  v1 = (id)qword_256CDB5A8;
  if (v0 != -1)
    swift_once();
  v2 = (void *)qword_256CDB5A0;
  v3 = objc_allocWithZone((Class)type metadata accessor for HGConfiguration());
  v4 = v2;
  v5 = objc_msgSend(v3, sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, v1, v4, 0);

  qword_256CDB598 = (uint64_t)v5;
}

id HGConfiguration.__allocating_init(withML:audioFeedbackConfig:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, a1, a2, 0);

  return v5;
}

id static HGConfiguration.defaultConfig.getter()
{
  return sub_23DA66C64(&qword_256CDAFB0, (id *)&qword_256CDB598);
}

id sub_23DA64564()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___HGConfigurationInternal_mlConfig);
  swift_beginAccess();
  return *v1;
}

void sub_23DA645B4(void *a1)
{
  sub_23DA64700(a1, &OBJC_IVAR___HGConfigurationInternal_mlConfig);
}

uint64_t (*sub_23DA645C0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_23DA6464C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
  swift_beginAccess();
  return *v1;
}

void sub_23DA6469C(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void sub_23DA646F4(void *a1)
{
  sub_23DA64700(a1, &OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
}

void sub_23DA64700(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

void sub_23DA6474C(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v5;
  void **v6;
  void *v7;
  id v8;

  v5 = *a1;
  v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  v7 = *v6;
  *v6 = v5;
  v8 = v5;

}

uint64_t (*sub_23DA647A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DA64830()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_requestPartGestures);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23DA648BC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HGConfigurationInternal_requestPartGestures);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DA64904())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23DA64990()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_singleDelivery);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23DA64A1C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HGConfigurationInternal_singleDelivery);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DA64A64())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DA64AEC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  return *v1;
}

void sub_23DA64B94(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  *v3 = a1;
  sub_23DA64BE8();
}

void sub_23DA64BE8()
{
  uint64_t v0;
  unsigned __int8 *v1;
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  if (*v1 == 1)
  {
    v2 = NSUserName();
    v3 = sub_23DA9BAC4();
    v5 = v4;

    if (v3 == 1953460082 && v5 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = sub_23DA9BF5C();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        HGSetTemporaryDirectorySuffix();
        if (qword_256CDAFE8 != -1)
          swift_once();
        v12 = *(void **)(qword_256CE1550 + 16);
        v13 = (void *)sub_23DA9BAA0();
        v11 = objc_msgSend(v12, sel_BOOLForKey_, v13);

        goto LABEL_14;
      }
    }
    if (qword_256CDAFF0 != -1)
      swift_once();
    v7 = sub_23DA9B860();
    __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
    v8 = sub_23DA9B848();
    v9 = sub_23DA9BC98();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23DA5F000, v8, v9, "Raw Data logging will be disabled due to running as root", v10, 2u);
      MEMORY[0x24263A588](v10, -1, -1);
    }

    v11 = 0;
LABEL_14:
    *v1 = v11;
  }
}

void (*sub_23DA64DE4(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_23DA64E2C;
}

void sub_23DA64E2C(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_23DA64BE8();
}

id static HGMLConfiguration.defaultMLConfiguration.getter()
{
  return sub_23DA66C64(&qword_256CDAFC0, (id *)&qword_256CDB5A8);
}

id static HGAudioFeedbackConfiguration.defaultAudioConfiguration.getter()
{
  return sub_23DA66C64(&qword_256CDAFB8, (id *)&qword_256CDB5A0);
}

id HGConfiguration.__allocating_init(mlConfig:audioFeedbackConfig:requestPartGestures:)(void *a1, void *a2, char a3)
{
  objc_class *v3;
  id v7;
  id v8;

  v7 = objc_allocWithZone(v3);
  v8 = sub_23DA681E4(a1, a2, a3);

  return v8;
}

id HGConfiguration.init(mlConfig:audioFeedbackConfig:requestPartGestures:)(void *a1, void *a2, char a3)
{
  id v5;

  v5 = sub_23DA681E4(a1, a2, a3);

  return v5;
}

id HGConfiguration.init(withML:audioFeedbackConfig:)(void *a1, void *a2)
{
  void *v2;
  id v5;

  v5 = objc_msgSend(v2, sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, a1, a2, 0);

  return v5;
}

uint64_t sub_23DA65054()
{
  uint64_t v0;
  id *v1;
  id v2;

  sub_23DA9BDE8();
  sub_23DA9BB30();
  swift_beginAccess();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  swift_beginAccess();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  swift_beginAccess();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v1 = (id *)(v0 + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
  swift_beginAccess();
  v2 = *v1;
  sub_23DA66834();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  return 0;
}

id HGConfiguration.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HGConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HGConfiguration.__deallocating_deinit(uint64_t a1)
{
  return sub_23DA66A04(a1, type metadata accessor for HGConfiguration);
}

id sub_23DA65324()
{
  id v0;
  id result;

  v0 = objc_allocWithZone((Class)type metadata accessor for HGAudioFeedbackConfiguration(0));
  result = HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(1, 0, 0);
  qword_256CDB5A0 = (uint64_t)result;
  return result;
}

id HGAudioFeedbackConfiguration.__allocating_init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(char a1, char a2, int a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(a1, a2, a3);
}

uint64_t sub_23DA6540C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23DA65498(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DA654E0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DA65568()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23DA655F4(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DA6563C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DA656FC()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23DA657D8()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_23DA9B8FC();
}

uint64_t sub_23DA65840@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23DA658BC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_23DA9B8FC();
}

void (*sub_23DA65928(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_23DA9B8E4();
  return sub_23DA659A0;
}

void sub_23DA659A0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_23DA659EC()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8CC();
  return swift_endAccess();
}

uint64_t sub_23DA65A50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB370);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8D8();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_23DA65B60()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8CC();
  return swift_endAccess();
}

uint64_t sub_23DA65BC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB370);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8D8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_23DA65C94(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB370);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR___HGAudioFeedbackConfigurationInternal__enableWaitingTone;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8CC();
  swift_endAccess();
  return sub_23DA65D5C;
}

void sub_23DA65D5C(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_23DA9B8D8();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_23DA9B8D8();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_23DA65EB8()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23DA65F44(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DA65F8C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(char a1, char a2, int a3)
{
  _BYTE *v3;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  objc_super v11;
  char v12;

  v6 = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture] = v6;
  v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode] = 0;
  v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback] = a1;
  swift_beginAccess();
  v12 = a2;
  v7 = v3;
  sub_23DA9B8C0();
  swift_endAccess();
  *(_DWORD *)&v7[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID] = a3;

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for HGAudioFeedbackConfiguration(0);
  v8 = objc_msgSendSuper2(&v11, sel_init);
  sub_23DA67BCC((uint64_t)&unk_250E6B380, (uint64_t)v8);

  swift_bridgeObjectRelease();
  v9 = v8;
  sub_23DA67ED8((uint64_t)&unk_250E6B3A8, (uint64_t)v9);

  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_23DA66140(unint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28[3];

  v3 = v2;
  v6 = sub_23DA9B860();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256CDAFF0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_256CE1558);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_23DA9B848();
  v12 = sub_23DA9BCA4();
  if (os_log_type_enabled(v11, v12))
  {
    v24 = v3;
    v13 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v28[0] = v23;
    *(_DWORD *)v13 = 136315394;
    v25 = a2;
    if ((a2 & 1) != 0)
      v14 = 0x656C62616E45;
    else
      v14 = 0x656C6261736944;
    v15 = 0xE700000000000000;
    v26 = a1;
    if ((a2 & 1) != 0)
      v16 = 0xE600000000000000;
    else
      v16 = 0xE700000000000000;
    v27 = sub_23DA6701C(v14, v16, v28);
    sub_23DA9BD58();
    v17 = v26;
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    if (v17 > 2)
    {
      v18 = 0x6E776F6E6B6E55;
    }
    else
    {
      v18 = *(_QWORD *)&aBackgrounod[8 * v17];
      v15 = *(_QWORD *)&aNd[8 * v17];
    }
    v27 = sub_23DA6701C(v18, v15, v28);
    sub_23DA9BD58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v11, v12, "[AudioFeedbackConfig] %s audio feedback for %s", (uint8_t *)v13, 0x16u);
    v19 = v23;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v19, -1, -1);
    MEMORY[0x24263A588](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    LOBYTE(a2) = v25;
    v3 = v24;
    a1 = v26;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (a1 >= 4)
    a1 = 4;
  v20 = (uint64_t *)(v3 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v27 = *v20;
  *v20 = 0x8000000000000000;
  sub_23DA6778C(a2 & 1, a1, isUniquelyReferenced_nonNull_native, sub_23DA99868, (uint64_t (*)(void))sub_23DA925E4, (void (*)(void))sub_23DA90E44);
  *v20 = v27;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_23DA664B8(unint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29[3];

  v3 = v2;
  v6 = sub_23DA9B860();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256CDAFF0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_256CE1558);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_23DA9B848();
  v12 = sub_23DA9BCA4();
  if (os_log_type_enabled(v11, v12))
  {
    v25 = v3;
    v13 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v29[0] = v24;
    *(_DWORD *)v13 = 136315394;
    v26 = a2;
    if ((a2 & 1) != 0)
      v14 = 0x656C62616E45;
    else
      v14 = 0x656C6261736944;
    v15 = 0xE700000000000000;
    v27 = a1;
    if ((a2 & 1) != 0)
      v16 = 0xE600000000000000;
    else
      v16 = 0xE700000000000000;
    v28 = sub_23DA6701C(v14, v16, v29);
    sub_23DA9BD58();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    if (v27 - 1 > 3)
    {
      v18 = 0x6E776F6E6B6E75;
    }
    else
    {
      v17 = 8 * (v27 - 1);
      v18 = *(_QWORD *)&aNodup_0[v17];
      v15 = *(_QWORD *)&aShakelefshaker[v17 + 16];
    }
    v28 = sub_23DA6701C(v18, v15, v29);
    sub_23DA9BD58();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v11, v12, "[AudioFeedbackConfig] %s audio feedback for %s", (uint8_t *)v13, 0x16u);
    v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v19, -1, -1);
    MEMORY[0x24263A588](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    LOBYTE(a2) = v26;
    v3 = v25;
    a1 = v27;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v20 = sub_23DA819EC(a1);
  v21 = (uint64_t *)(v3 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v28 = *v21;
  *v21 = 0x8000000000000000;
  sub_23DA6778C(a2 & 1, v20, isUniquelyReferenced_nonNull_native, sub_23DA99868, (uint64_t (*)(void))sub_23DA925F0, (void (*)(void))sub_23DA90E50);
  *v21 = v28;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_23DA66834()
{
  sub_23DA9BDE8();
  sub_23DA9BB30();
  swift_beginAccess();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  swift_release();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  return 0;
}

void HGAudioFeedbackConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HGAudioFeedbackConfiguration.__deallocating_deinit()
{
  return sub_23DA66A04(0, (uint64_t (*)(void))type metadata accessor for HGAudioFeedbackConfiguration);
}

id sub_23DA66A04(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_23DA66A98(uint64_t a1)
{
  return sub_23DA66AFC(0.6, 0.8, a1, 0, &qword_256CDB5A8);
}

id sub_23DA66AD8(uint64_t a1)
{
  return sub_23DA66AFC(0.6, 0.8, a1, 1, &qword_256CDB5B0);
}

id sub_23DA66AFC(double a1, double a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id result;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DA9B6D4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = objc_allocWithZone((Class)type metadata accessor for HGMLConfiguration(0));
  result = sub_23DA66CF4(30, 5, a4, 8, 4, 3, 8, 4, a1, a1, 0.25, a2, a2, 0.25, 3, (uint64_t)v10);
  *a5 = result;
  return result;
}

id static HGMLConfiguration.defaultEmptyMLConfiguration.getter()
{
  return sub_23DA66C64(&qword_256CDAFC8, (id *)&qword_256CDB5B0);
}

id sub_23DA66C2C(uint64_t a1)
{
  return sub_23DA66AFC(0.4, 0.4, a1, 0, &qword_256CDB5B8);
}

id static HGMLConfiguration.defaultTestMLConfiguration.getter()
{
  return sub_23DA66C64(&qword_256CDAFD0, (id *)&qword_256CDB5B8);
}

id sub_23DA66C64(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id sub_23DA66CB8(uint64_t a1, uint64_t a2, _QWORD *a3, id *a4)
{
  if (*a3 != -1)
    swift_once();
  return *a4;
}

id sub_23DA66CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, uint64_t a15, uint64_t a16)
{
  char *v16;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  objc_super v36;

  v29 = (uint64_t)&v16[OBJC_IVAR___HGMLConfigurationInternal_testModelURL];
  v30 = sub_23DA9B6D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 1, 1, v30);
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_windowSize] = a1;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_stride] = a2;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_modelType] = a3;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGateOpenConfScoreThresholdNod] = a9;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGestureConfScoreThresholdNod] = a10;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numWindowsInPoolNod] = a4;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_maxNumBackgroundPredictionsNod] = a5;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numConsecutivePredictionsNod] = a6;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minTimeBetweenPoolsNod] = a11;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGateOpenConfScoreThresholdShake] = a12;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGestureConfScoreThresholdShake] = a13;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numWindowsInPoolShake] = a7;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_maxNumBackgroundPredictionsShake] = a8;
  *(_QWORD *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numConsecutivePredictionsShake] = a15;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minTimeBetweenPoolsShake] = a14;
  swift_beginAccess();
  v31 = v16;
  sub_23DA68D34(a16, v29);
  swift_endAccess();

  v36.receiver = v31;
  v36.super_class = (Class)type metadata accessor for HGMLConfiguration(0);
  v32 = objc_msgSendSuper2(&v36, sel_init);
  sub_23DA68CF4(a16);
  return v32;
}

void HGMLConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HGMLConfiguration.__deallocating_deinit()
{
  return sub_23DA66A04(0, (uint64_t (*)(void))type metadata accessor for HGMLConfiguration);
}

uint64_t sub_23DA66F48(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23DA66F58(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23DA66F8C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23DA66FAC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23DA6701C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23DA9BD58();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23DA6701C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DA670EC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DA68D7C((uint64_t)v12, *a3);
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
      sub_23DA68D7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DA670EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DA9BD64();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DA672A4(a5, a6);
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
  v8 = sub_23DA9BE24();
  if (!v8)
  {
    sub_23DA9BE3C();
    __break(1u);
LABEL_17:
    result = sub_23DA9BE84();
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

uint64_t sub_23DA672A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DA67338(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DA67510(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DA67510(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DA67338(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DA674AC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DA9BDF4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DA9BE3C();
      __break(1u);
LABEL_10:
      v2 = sub_23DA9BB48();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DA9BE84();
    __break(1u);
LABEL_14:
    result = sub_23DA9BE3C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DA674AC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB750);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DA67510(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB750);
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
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

_BYTE **sub_23DA6765C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

_OWORD *sub_23DA6766C(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_23DA998D0((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_OWORD *)(v15[7] + 32 * v9);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
        return sub_23DA68CE4(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_23DA92420();
      goto LABEL_7;
    }
    sub_23DA90B3C(v12, a3 & 1);
    v18 = sub_23DA998D0((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23DA67B58(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for CFString(0);
  result = (_OWORD *)sub_23DA9BF74();
  __break(1u);
  return result;
}

uint64_t sub_23DA6778C(char a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), void (*a6)(void))
{
  _QWORD *v6;
  _QWORD *v10;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t result;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v10 = v6;
  v14 = *v6;
  v16 = a4(a2);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v21 >= result && (a3 & 1) == 0)
  {
    result = a5();
LABEL_7:
    v22 = (_QWORD *)*v10;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v22[7] + v16) = a1 & 1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(_BYTE *)(v22[6] + v16) = a2;
    *(_BYTE *)(v22[7] + v16) = a1 & 1;
    v24 = v22[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v22[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  a6();
  result = a4(a2);
  if ((v20 & 1) == (v23 & 1))
  {
    v16 = result;
    v22 = (_QWORD *)*v10;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

uint64_t sub_23DA678D8(uint64_t a1, char a2, double a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v4 = v3;
  v8 = *v3;
  v10 = sub_23DA999F0(a1);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a2 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a2 & 1) == 0)
  {
    result = (uint64_t)sub_23DA92AD4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(double *)(v16[7] + 8 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a1;
    *(double *)(v16[7] + 8 * v10) = a3;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_23DA9172C(result, a2 & 1);
  result = sub_23DA999F0(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

uint64_t sub_23DA679FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23DA99804(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23DA92C70();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23DA91E48(v15, a4 & 1);
  v21 = sub_23DA99804(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

_OWORD *sub_23DA67B58(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_23DA68CE4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

unint64_t sub_23DA67BBC(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

uint64_t sub_23DA67BCC(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t result;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v41 = MEMORY[0x24BEE4AF8];
  sub_23DA855DC(0, v2, 0);
  v3 = v41;
  v6 = (unsigned __int8 *)(a1 + 32);
  v7 = (_QWORD *)(a2 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture);
  while (1)
  {
    v9 = *v6++;
    v8 = v9;
    if (v9)
      break;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = (_QWORD *)*v7;
    v40 = (_QWORD *)*v7;
    *v7 = 0x8000000000000000;
    v24 = sub_23DA99868(0);
    v25 = v22[2];
    v26 = (v23 & 1) == 0;
    v27 = v25 + v26;
    if (__OFADD__(v25, v26))
      goto LABEL_32;
    v28 = v23;
    if (v22[3] >= v27)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v20 = v40;
        if ((v23 & 1) == 0)
          goto LABEL_25;
      }
      else
      {
        sub_23DA925F0();
        v20 = v40;
        if ((v28 & 1) == 0)
          goto LABEL_25;
      }
    }
    else
    {
      sub_23DA90E50(v27, isUniquelyReferenced_nonNull_native);
      v29 = sub_23DA99868(0);
      if ((v28 & 1) != (v30 & 1))
        goto LABEL_35;
      v24 = v29;
      v20 = v40;
      if ((v28 & 1) == 0)
      {
LABEL_25:
        v20[(v24 >> 6) + 8] |= 1 << v24;
        *(_BYTE *)(v20[6] + v24) = 0;
        *(_BYTE *)(v20[7] + v24) = 0;
        v34 = v20[2];
        v32 = __OFADD__(v34, 1);
        v33 = v34 + 1;
        if (v32)
          goto LABEL_34;
LABEL_26:
        v20[2] = v33;
        goto LABEL_27;
      }
    }
    *(_BYTE *)(v20[7] + v24) = 0;
LABEL_27:
    *v7 = v20;
    swift_bridgeObjectRelease();
    swift_endAccess();
    v36 = *(_QWORD *)(v41 + 16);
    v35 = *(_QWORD *)(v41 + 24);
    v37 = v36 + 1;
    if (v36 >= v35 >> 1)
      sub_23DA855DC(v35 > 1, v36 + 1, 1);
    *(_QWORD *)(v41 + 16) = v37;
    if (!--v2)
      return v3;
  }
  swift_beginAccess();
  v10 = swift_isUniquelyReferenced_nonNull_native();
  v11 = (_QWORD *)*v7;
  v39 = (_QWORD *)*v7;
  *v7 = 0x8000000000000000;
  v13 = sub_23DA99868(v8);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (!__OFADD__(v14, v15))
  {
    v17 = v12;
    if (v11[3] >= v16)
    {
      if ((v10 & 1) != 0)
      {
        v20 = v39;
        if ((v12 & 1) == 0)
          goto LABEL_21;
      }
      else
      {
        sub_23DA925F0();
        v20 = v39;
        if ((v17 & 1) == 0)
          goto LABEL_21;
      }
    }
    else
    {
      sub_23DA90E50(v16, v10);
      v18 = sub_23DA99868(v8);
      if ((v17 & 1) != (v19 & 1))
        goto LABEL_35;
      v13 = v18;
      v20 = v39;
      if ((v17 & 1) == 0)
      {
LABEL_21:
        v20[(v13 >> 6) + 8] |= 1 << v13;
        *(_BYTE *)(v20[6] + v13) = v8;
        *(_BYTE *)(v20[7] + v13) = 1;
        v31 = v20[2];
        v32 = __OFADD__(v31, 1);
        v33 = v31 + 1;
        if (v32)
          goto LABEL_33;
        goto LABEL_26;
      }
    }
    *(_BYTE *)(v20[7] + v13) = 1;
    goto LABEL_27;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

uint64_t sub_23DA67ED8(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  unsigned __int8 *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  char v21;
  _QWORD *v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t result;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v41 = MEMORY[0x24BEE4AF8];
  sub_23DA855DC(0, v2, 0);
  v3 = v41;
  v6 = (unsigned __int8 *)(a1 + 32);
  v7 = (_QWORD *)(a2 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture);
  while (1)
  {
    v9 = *v6++;
    v8 = v9;
    if ((v9 - 1) <= 1u)
    {
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v11 = (_QWORD *)*v7;
      v39 = (_QWORD *)*v7;
      *v7 = 0x8000000000000000;
      v13 = sub_23DA99868(v8);
      v14 = v11[2];
      v15 = (v12 & 1) == 0;
      v16 = v14 + v15;
      if (__OFADD__(v14, v15))
        goto LABEL_32;
      v17 = v12;
      if (v11[3] >= v16)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v20 = v39;
          if ((v12 & 1) == 0)
            goto LABEL_21;
        }
        else
        {
          sub_23DA925E4();
          v20 = v39;
          if ((v17 & 1) == 0)
            goto LABEL_21;
        }
      }
      else
      {
        sub_23DA90E44(v16, isUniquelyReferenced_nonNull_native);
        v18 = sub_23DA99868(v8);
        if ((v17 & 1) != (v19 & 1))
          goto LABEL_35;
        v13 = v18;
        v20 = v39;
        if ((v17 & 1) == 0)
        {
LABEL_21:
          v20[(v13 >> 6) + 8] |= 1 << v13;
          *(_BYTE *)(v20[6] + v13) = v8;
          *(_BYTE *)(v20[7] + v13) = 1;
          v31 = v20[2];
          v32 = __OFADD__(v31, 1);
          v33 = v31 + 1;
          if (v32)
            goto LABEL_33;
          goto LABEL_26;
        }
      }
      *(_BYTE *)(v20[7] + v13) = 1;
      goto LABEL_27;
    }
    swift_beginAccess();
    v21 = swift_isUniquelyReferenced_nonNull_native();
    v22 = (_QWORD *)*v7;
    v40 = (_QWORD *)*v7;
    *v7 = 0x8000000000000000;
    v24 = sub_23DA99868(v8);
    v25 = v22[2];
    v26 = (v23 & 1) == 0;
    v27 = v25 + v26;
    if (__OFADD__(v25, v26))
      break;
    v28 = v23;
    if (v22[3] >= v27)
    {
      if ((v21 & 1) != 0)
      {
        v20 = v40;
        if ((v23 & 1) == 0)
          goto LABEL_25;
      }
      else
      {
        sub_23DA925E4();
        v20 = v40;
        if ((v28 & 1) == 0)
          goto LABEL_25;
      }
    }
    else
    {
      sub_23DA90E44(v27, v21);
      v29 = sub_23DA99868(v8);
      if ((v28 & 1) != (v30 & 1))
        goto LABEL_35;
      v24 = v29;
      v20 = v40;
      if ((v28 & 1) == 0)
      {
LABEL_25:
        v20[(v24 >> 6) + 8] |= 1 << v24;
        *(_BYTE *)(v20[6] + v24) = v8;
        *(_BYTE *)(v20[7] + v24) = 0;
        v34 = v20[2];
        v32 = __OFADD__(v34, 1);
        v33 = v34 + 1;
        if (v32)
          goto LABEL_34;
LABEL_26:
        v20[2] = v33;
        goto LABEL_27;
      }
    }
    *(_BYTE *)(v20[7] + v24) = 0;
LABEL_27:
    *v7 = v20;
    swift_bridgeObjectRelease();
    swift_endAccess();
    v36 = *(_QWORD *)(v41 + 16);
    v35 = *(_QWORD *)(v41 + 24);
    v37 = v36 + 1;
    if (v36 >= v35 >> 1)
      sub_23DA855DC(v35 > 1, v36 + 1, 1);
    *(_QWORD *)(v41 + 16) = v37;
    if (!--v2)
      return v3;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

id sub_23DA681E4(void *a1, void *a2, char a3)
{
  _BYTE *v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  id v24;
  id v25;
  objc_super v27;

  v3[OBJC_IVAR___HGConfigurationInternal_singleDelivery] = 0;
  v3[OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging] = 0;
  v7 = OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout;
  v8 = qword_256CDAFE8;
  v9 = v3;
  if (v8 != -1)
    swift_once();
  v10 = *(void **)(qword_256CE1550 + 16);
  v11 = (void *)sub_23DA9BAA0();
  objc_msgSend(v10, sel_floatForKey_, v11);
  v13 = v12;

  *(_DWORD *)&v9[v7] = v13;
  v14 = OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity;
  v15 = *(void **)(qword_256CE1550 + 16);
  v16 = (void *)sub_23DA9BAA0();
  objc_msgSend(v15, sel_floatForKey_, v16);
  v18 = v17;

  *(_DWORD *)&v9[v14] = v18;
  v19 = OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity;
  v20 = *(void **)(qword_256CE1550 + 16);
  v21 = (void *)sub_23DA9BAA0();
  objc_msgSend(v20, sel_floatForKey_, v21);
  v23 = v22;

  *(_DWORD *)&v9[v19] = v23;
  *(_QWORD *)&v9[OBJC_IVAR___HGConfigurationInternal_mlConfig] = a1;
  *(_QWORD *)&v9[OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig] = a2;
  v9[OBJC_IVAR___HGConfigurationInternal_requestPartGestures] = a3 & 1;
  v24 = a1;
  v25 = a2;

  v27.receiver = v9;
  v27.super_class = (Class)type metadata accessor for HGConfiguration();
  return objc_msgSendSuper2(&v27, sel_init);
}

uint64_t type metadata accessor for HGConfiguration()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HGAudioFeedbackConfiguration(uint64_t a1)
{
  return sub_23DA625B4(a1, (uint64_t *)&unk_256CDB678);
}

uint64_t type metadata accessor for HGMLConfiguration(uint64_t a1)
{
  return sub_23DA625B4(a1, (uint64_t *)&unk_256CDB728);
}

id sub_23DA68408@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR___HGConfigurationInternal_mlConfig, a2);
}

void sub_23DA68414(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_23DA6474C(a1, a2, a3, a4, &OBJC_IVAR___HGConfigurationInternal_mlConfig);
}

id sub_23DA68430@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig, a2);
}

id keypath_get_3Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_23DA68488(void **a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_23DA6474C(a1, a2, a3, a4, &OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
}

uint64_t sub_23DA684A4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___HGConfigurationInternal_requestPartGestures, a2);
}

uint64_t sub_23DA684B0(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR___HGConfigurationInternal_requestPartGestures);
}

uint64_t sub_23DA684BC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___HGConfigurationInternal_singleDelivery, a2);
}

uint64_t sub_23DA684C8(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR___HGConfigurationInternal_singleDelivery);
}

uint64_t sub_23DA684D4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging, a2);
}

void sub_23DA684E0(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  *v3 = v2;
  sub_23DA64BE8();
}

uint64_t sub_23DA68538@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback, a2);
}

uint64_t sub_23DA68544(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
}

uint64_t sub_23DA68550@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_7Tm(a1, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode, a2);
}

uint64_t keypath_get_7Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_23DA685A8(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
}

uint64_t keypath_set_8Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_23DA68604@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(*a1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23DA68654(int *a1, _QWORD *a2)
{
  int v2;
  _DWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_DWORD *)(*a2 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for HGConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HGConfiguration.mlConfig.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HGConfiguration.mlConfig.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HGConfiguration.mlConfig.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HGConfiguration.audioFeedbackConfig.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HGConfiguration.audioFeedbackConfig.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HGConfiguration.audioFeedbackConfig.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of HGConfiguration.requestPartGestures.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HGConfiguration.requestPartGestures.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HGConfiguration.requestPartGestures.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HGConfiguration.singleDelivery.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HGConfiguration.singleDelivery.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HGConfiguration.singleDelivery.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HGConfiguration.enableRawDataLogging.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of HGConfiguration.enableRawDataLogging.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of HGConfiguration.enableRawDataLogging.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of HGConfiguration.__allocating_init(mlConfig:audioFeedbackConfig:requestPartGestures:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of HGConfiguration.description()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t sub_23DA68874()
{
  return type metadata accessor for HGAudioFeedbackConfiguration(0);
}

void sub_23DA6887C()
{
  unint64_t v0;

  sub_23DA68B1C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for HGAudioFeedbackConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedback.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedback.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.invertedConfirmationAudioFeedbackMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.invertedConfirmationAudioFeedbackMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.invertedConfirmationAudioFeedbackMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableWaitingTone.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableWaitingTone.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableWaitingTone.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.$enableWaitingTone.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.$enableWaitingTone.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.$enableWaitingTone.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.audioSessionID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.audioSessionID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.audioSessionID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.__allocating_init(enableAudioFeedback:enableWaitingTone:audioSessionID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedbackForGesture(gesture:enable:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedbackForPartGesture(part:enable:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.description()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

void sub_23DA68B1C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CDB188[0])
  {
    v0 = sub_23DA9B908();
    if (!v1)
      atomic_store(v0, qword_256CDB188);
  }
}

uint64_t sub_23DA68B70()
{
  return type metadata accessor for HGMLConfiguration(0);
}

void sub_23DA68B78()
{
  unint64_t v0;

  sub_23DA68C18();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for HGMLConfiguration()
{
  return swift_lookUpClassMethod();
}

void sub_23DA68C18()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CDB738)
  {
    sub_23DA9B6D4();
    v0 = sub_23DA9BD4C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CDB738);
  }
}

ValueMetadata *type metadata accessor for HGMLModelType()
{
  return &type metadata for HGMLModelType;
}

unint64_t sub_23DA68C80()
{
  unint64_t result;

  result = qword_256CDB740;
  if (!qword_256CDB740)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9D500, &type metadata for HGMLModelType);
    atomic_store(result, (unint64_t *)&qword_256CDB740);
  }
  return result;
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

_OWORD *sub_23DA68CE4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23DA68CF4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DA68D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DA68D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_23DA68DC8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB920);
  v28 = *(_QWORD *)(v2 - 8);
  v29 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = sub_23DA9BCD4();
  v4 = *(_QWORD *)(v26[0] - 8);
  MEMORY[0x24BDAC7A8](v26[0]);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BCB0();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_23DA9BA1C();
  MEMORY[0x24BDAC7A8](v9);
  v0[2] = MEMORY[0x24BEE4B08];
  v26[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB928);
  swift_allocObject();
  v0[3] = sub_23DA9B89C();
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDB3C8);
  v0[5] = 0;
  v0[6] = 0;
  v0[4] = 0;
  sub_23DA9BA10();
  v30 = MEMORY[0x24BEE4AF8];
  sub_23DA63860(&qword_256CDB3D0, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3D8);
  sub_23DA638A0(&qword_256CDB3E0, &qword_256CDB3D8, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  (*(void (**)(char *, _QWORD, _QWORD))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v26[0]);
  v0[7] = sub_23DA9BCF8();
  if (qword_256CDAFE8 != -1)
    swift_once();
  v10 = *(void **)(qword_256CE1550 + 16);
  v11 = (void *)sub_23DA9BAA0();
  objc_msgSend(v10, sel_doubleForKey_, v11);
  v13 = v12;

  v1[8] = v13;
  v14 = *(void **)(qword_256CE1550 + 16);
  v15 = (void *)sub_23DA9BAA0();
  objc_msgSend(v14, sel_doubleForKey_, v15);
  v17 = v16;

  v1[9] = v17;
  v18 = *(void **)(qword_256CE1550 + 16);
  v19 = (void *)sub_23DA9BAA0();
  objc_msgSend(v18, sel_doubleForKey_, v19);
  v21 = v20;

  v1[10] = v21;
  v30 = v1[3];
  swift_allocObject();
  swift_weakInit();
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDB930);
  sub_23DA638A0(&qword_256CDB938, &qword_256CDB928, MEMORY[0x24BDB9CB0]);
  swift_retain();
  v22 = v27;
  sub_23DA9B920();
  swift_release();
  swift_release();
  sub_23DA638A0(&qword_256CDB940, &qword_256CDB920, MEMORY[0x24BDB94C8]);
  v23 = v29;
  v24 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v23);
  v1[4] = v24;
  swift_release();
  return v1;
}

_QWORD *sub_23DA6921C@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *result;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  void (*v22)(char *, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  _BOOL4 v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  os_log_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  int v49;
  os_log_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  id v58;
  uint64_t v59;
  uint64_t v60[3];

  v4 = sub_23DA9B7DC();
  v55 = *(_QWORD *)(v4 - 8);
  v56 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DA9B860();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23DA9B818();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v48 - v15;
  v17 = *a1;
  swift_beginAccess();
  result = (_QWORD *)swift_weakLoadStrong();
  if (!result)
    goto LABEL_4;
  v19 = result;
  v51 = v9;
  v52 = v7;
  v53 = v6;
  v57 = a2;
  swift_beginAccess();
  v20 = v19[2];
  swift_bridgeObjectRetain();
  v21 = objc_msgSend(v17, sel_uuid);
  sub_23DA9B800();

  LOBYTE(v21) = sub_23DA6EDA8((uint64_t)v16, v20);
  swift_bridgeObjectRelease();
  v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v16, v10);
  if ((v21 & 1) != 0)
  {
    result = (_QWORD *)swift_release();
    a2 = v57;
LABEL_4:
    *a2 = 0;
    return result;
  }
  v23 = objc_msgSend(v17, sel_uuid);
  sub_23DA9B800();

  swift_beginAccess();
  sub_23DA6AC04((uint64_t)v16, v14);
  v22(v16, v10);
  swift_endAccess();
  if (qword_256CDAFF0 != -1)
    swift_once();
  v24 = v53;
  v25 = __swift_project_value_buffer(v53, (uint64_t)qword_256CE1558);
  v26 = v51;
  v27 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v51, v25, v24);
  v58 = v17;
  v28 = sub_23DA9B848();
  v29 = sub_23DA9BC8C();
  v30 = os_log_type_enabled(v28, (os_log_type_t)v29);
  v31 = v57;
  if (v30)
  {
    v50 = v28;
    v32 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v60[0] = v48;
    *(_DWORD *)v32 = 136315650;
    v33 = (unint64_t)objc_msgSend(v58, sel_headGesture);
    v49 = v29;
    if (v33 > 2)
    {
      v36 = 0xE700000000000000;
      v35 = 0x6E776F6E6B6E55;
    }
    else
    {
      v34 = 8 * v33;
      v35 = *(_QWORD *)&aBackgrounod_0[8 * v33];
      v36 = *(_QWORD *)&aNd_0[v34];
    }
    v59 = sub_23DA6701C(v35, v36, v60);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    v37 = objc_msgSend(v58, sel_uuid);
    sub_23DA9B800();

    sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v38 = sub_23DA9BF50();
    v40 = v39;
    v22(v16, v10);
    v59 = sub_23DA6701C(v38, v40, v60);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2048;
    v41 = objc_msgSend(v58, sel_timestamp);
    v42 = v54;
    sub_23DA9B7AC();

    sub_23DA9B7A0();
    v44 = v43;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v56);
    v59 = v44;
    sub_23DA9BD58();

    v45 = v50;
    _os_log_impl(&dword_23DA5F000, v50, (os_log_type_t)v49, "[CR] Fired %s %s %f", (uint8_t *)v32, 0x20u);
    v46 = v48;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v46, -1, -1);
    MEMORY[0x24263A588](v32, -1, -1);
    swift_release();

    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
    v31 = v57;
  }
  else
  {

    swift_release();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v24);
  }
  v47 = v58;
  *v31 = v58;
  return v47;
}

id sub_23DA697FC@<X0>(void **a1@<X0>, id *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
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
  char *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char **p_name;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *);
  uint64_t v64;
  id v65;
  double v66;
  double v67;
  void (*v68)(char *, uint64_t);
  id v69;
  char *v70;
  double v71;
  double v72;
  double v73;
  uint64_t Strong;
  double v75;
  char v76;
  id v77;
  _QWORD *v78;
  uint64_t v80;
  uint64_t v81;
  int v82;
  void (*v83)(char *);
  void (*v84)(char *, uint64_t);
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  char *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98[4];

  v93 = a4;
  v7 = sub_23DA9B7DC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v91 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v80 - v11;
  v88 = sub_23DA9B818();
  v86 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v85 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23DA9B860();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v94 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v80 - v18;
  v20 = *a1;
  v96 = *a2;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v90 = a3 + 16;
  v21 = __swift_project_value_buffer(v14, (uint64_t)qword_256CE1558);
  v83 = *(void (**)(char *))(v15 + 16);
  v84 = (void (*)(char *, uint64_t))v21;
  v83(v19);
  v22 = v20;
  v23 = v15;
  v24 = v22;
  v25 = v14;
  v26 = sub_23DA9B848();
  v82 = sub_23DA9BC8C();
  v27 = os_log_type_enabled(v26, (os_log_type_t)v82);
  v92 = v7;
  v95 = v8;
  v89 = v25;
  v87 = v12;
  if (v27)
  {
    v81 = v23;
    v28 = swift_slowAlloc();
    v80 = swift_slowAlloc();
    v98[0] = v80;
    *(_DWORD *)v28 = 136315650;
    v29 = (unint64_t)objc_msgSend(v24, sel_headGesture);
    if (v29 > 2)
    {
      v32 = 0xE700000000000000;
      v31 = 0x6E776F6E6B6E55;
    }
    else
    {
      v30 = 8 * v29;
      v31 = *(_QWORD *)&aBackgrounod_0[8 * v29];
      v32 = *(_QWORD *)&aNd_0[v30];
    }
    v97 = sub_23DA6701C(v31, v32, v98);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    v34 = objc_msgSend(v24, sel_uuid);
    v35 = v85;
    sub_23DA9B800();

    sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v36 = v88;
    v37 = sub_23DA9BF50();
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v35, v36);
    v97 = sub_23DA6701C(v37, v39, v98);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 2048;
    v40 = objc_msgSend(v24, sel_timestamp);
    v12 = v87;
    sub_23DA9B7AC();

    sub_23DA9B7A0();
    v42 = v41;
    v7 = v92;
    (*(void (**)(char *, uint64_t))(v95 + 8))(v12, v92);
    v97 = v42;
    sub_23DA9BD58();

    _os_log_impl(&dword_23DA5F000, v26, (os_log_type_t)v82, "[CR HR]:%s %s %f", (uint8_t *)v28, 0x20u);
    v43 = v80;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v43, -1, -1);
    MEMORY[0x24263A588](v28, -1, -1);

    v33 = *(void (**)(char *, uint64_t))(v81 + 8);
    v25 = v89;
    v33(v19, v89);
  }
  else
  {

    v33 = *(void (**)(char *, uint64_t))(v23 + 8);
    v33(v19, v25);
  }
  v44 = 0x6E776F6E6B6E55;
  v45 = v94;
  ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v83)(v94, v84, v25);
  v96 = v96;
  v46 = sub_23DA9B848();
  v47 = sub_23DA9BC8C();
  if (os_log_type_enabled(v46, v47))
  {
    v84 = v33;
    v48 = swift_slowAlloc();
    v83 = (void (*)(char *))swift_slowAlloc();
    v98[0] = (uint64_t)v83;
    *(_DWORD *)v48 = 136315650;
    v49 = (unint64_t)objc_msgSend(v96, sel_headGesture);
    if (v49 > 2)
    {
      v50 = 0xE700000000000000;
    }
    else
    {
      v44 = *(_QWORD *)&aBackgrounod_0[8 * v49];
      v50 = *(_QWORD *)&aNd_0[8 * v49];
    }
    v97 = sub_23DA6701C(v44, v50, v98);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    v53 = objc_msgSend(v96, sel_uuid);
    v54 = v85;
    sub_23DA9B800();

    sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v55 = v88;
    v56 = sub_23DA9BF50();
    v58 = v57;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v54, v55);
    v97 = sub_23DA6701C(v56, v58, v98);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 22) = 2048;
    v59 = objc_msgSend(v96, sel_timestamp);
    v12 = v87;
    sub_23DA9B7AC();

    sub_23DA9B7A0();
    v61 = v60;
    v51 = v95;
    v62 = v92;
    (*(void (**)(char *, uint64_t))(v95 + 8))(v12, v92);
    v97 = v61;
    v7 = v62;
    sub_23DA9BD58();

    _os_log_impl(&dword_23DA5F000, v46, v47, "[CR MR]:%s %s %f", (uint8_t *)v48, 0x20u);
    v63 = v83;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v63, -1, -1);
    v64 = v48;
    p_name = &E5RTExecutionStreamOperation.name;
    MEMORY[0x24263A588](v64, -1, -1);

    v84(v94, v89);
  }
  else
  {

    v33(v45, v25);
    v51 = v95;
    p_name = (char **)(&E5RTExecutionStreamOperation + 24);
  }
  v65 = objc_msgSend(v96, p_name[306]);
  sub_23DA9B7AC();

  sub_23DA9B7A0();
  v67 = v66;
  v68 = *(void (**)(char *, uint64_t))(v51 + 8);
  v68(v12, v7);
  v69 = objc_msgSend(v24, p_name[306]);
  v70 = v91;
  sub_23DA9B7AC();

  sub_23DA9B7A0();
  v72 = v71;
  v68(v70, v7);
  v73 = vabdd_f64(v67, v72);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    if (v73 < 0.8)
      goto LABEL_17;
LABEL_19:
    v76 = 0;
    goto LABEL_20;
  }
  v75 = *(double *)(Strong + 80);
  swift_release();
  if (v73 >= v75)
    goto LABEL_19;
LABEL_17:
  v76 = 1;
LABEL_20:
  v77 = v96;
  v78 = v93;
  *v93 = v96;
  *((_BYTE *)v78 + 8) = v76;
  return v77;
}

uint64_t sub_23DA6A0C0()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 40);
    if (v2)
    {
      swift_retain_n();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB908);
      sub_23DA638A0(&qword_256CDB910, &qword_256CDB908, MEMORY[0x24BDB9AF8]);
      v2 = sub_23DA9B968();
      swift_release_n();
      swift_release();
    }
    *(_QWORD *)(v1 + 48) = v2;
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23DA6A1B4()
{
  swift_retain();
  sub_23DA9B884();
  return swift_release();
}

uint64_t sub_23DA6A1F8(uint64_t a1, uint64_t a2)
{
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
  uint64_t result;
  uint64_t v17;
  char *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t aBlock;
  uint64_t v75;
  uint64_t (*v76)(uint64_t);
  void *v77;
  uint64_t (*v78)();
  uint64_t v79;

  v4 = sub_23DA9BA04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v72 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BA1C();
  v71 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v70 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DA9BA34();
  v68 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v69 = (char *)&v61 - v13;
  v14 = sub_23DA9B818();
  v15 = *(_QWORD *)(v14 - 8);
  result = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    v66 = v7;
    v67 = v4;
    v20 = *(unsigned __int8 *)(a1 + 8);
    v21 = qword_256CDAFF0;
    v22 = v19;
    v65 = v5;
    if (v20 == 1)
    {
      if (v21 != -1)
        swift_once();
      v23 = sub_23DA9B860();
      __swift_project_value_buffer(v23, (uint64_t)qword_256CE1558);
      v24 = v22;
      swift_retain_n();
      v25 = v24;
      v26 = sub_23DA9B848();
      v27 = sub_23DA9BC8C();
      v28 = v27;
      if (os_log_type_enabled(v26, v27))
      {
        v29 = swift_slowAlloc();
        v63 = swift_slowAlloc();
        aBlock = v63;
        *(_DWORD *)v29 = 136315394;
        v30 = objc_msgSend(v25, sel_uuid, v29 + 4);
        v62 = v28;
        v31 = v30;
        sub_23DA9B800();

        sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v32 = sub_23DA9BF50();
        v64 = (id)v9;
        v34 = v33;
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        v73 = sub_23DA6701C(v32, v34, &aBlock);
        sub_23DA9BD58();

        v9 = (uint64_t)v64;
        swift_bridgeObjectRelease();
        *(_WORD *)(v29 + 12) = 2048;
        v73 = *(_QWORD *)(a2 + 72);
        sub_23DA9BD58();
        swift_release_n();
        _os_log_impl(&dword_23DA5F000, v26, (os_log_type_t)v62, "[CR] Immediately firing %s after %fs", (uint8_t *)v29, 0x16u);
        v35 = v63;
        swift_arrayDestroy();
        MEMORY[0x24263A588](v35, -1, -1);
        MEMORY[0x24263A588](v29, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      v64 = *(id *)(a2 + 56);
      sub_23DA9BA28();
      v48 = v69;
      MEMORY[0x2426399E8](v12, *(double *)(a2 + 72));
      v68 = *(_QWORD *)(v68 + 8);
      ((void (*)(char *, uint64_t))v68)(v12, v9);
      v49 = swift_allocObject();
      swift_weakInit();
      v50 = swift_allocObject();
      *(_QWORD *)(v50 + 16) = v25;
      *(_QWORD *)(v50 + 24) = v49;
      v78 = sub_23DA6BCF8;
      v79 = v50;
      aBlock = MEMORY[0x24BDAC760];
      v75 = 1107296256;
      v51 = &block_descriptor_13;
    }
    else
    {
      if (v21 != -1)
        swift_once();
      v36 = sub_23DA9B860();
      __swift_project_value_buffer(v36, (uint64_t)qword_256CE1558);
      v37 = v22;
      swift_retain_n();
      v25 = v37;
      v38 = sub_23DA9B848();
      v39 = sub_23DA9BC8C();
      v40 = v39;
      if (os_log_type_enabled(v38, v39))
      {
        v41 = swift_slowAlloc();
        v63 = swift_slowAlloc();
        aBlock = v63;
        *(_DWORD *)v41 = 136315394;
        v42 = objc_msgSend(v25, sel_uuid, v41 + 4);
        v62 = v40;
        v43 = v42;
        sub_23DA9B800();

        sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v44 = sub_23DA9BF50();
        v64 = (id)v9;
        v46 = v45;
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        v73 = sub_23DA6701C(v44, v46, &aBlock);
        sub_23DA9BD58();

        v9 = (uint64_t)v64;
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 12) = 2048;
        v73 = *(_QWORD *)(a2 + 64);
        sub_23DA9BD58();
        swift_release_n();
        _os_log_impl(&dword_23DA5F000, v38, (os_log_type_t)v62, "[CR] Postpone firing %s after %fs", (uint8_t *)v41, 0x16u);
        v47 = v63;
        swift_arrayDestroy();
        MEMORY[0x24263A588](v47, -1, -1);
        MEMORY[0x24263A588](v41, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      v64 = *(id *)(a2 + 56);
      sub_23DA9BA28();
      v48 = v69;
      MEMORY[0x2426399E8](v12, *(double *)(a2 + 64));
      v68 = *(_QWORD *)(v68 + 8);
      ((void (*)(char *, uint64_t))v68)(v12, v9);
      v52 = swift_allocObject();
      swift_weakInit();
      v53 = swift_allocObject();
      *(_QWORD *)(v53 + 16) = v25;
      *(_QWORD *)(v53 + 24) = v52;
      v78 = sub_23DA6BC58;
      v79 = v53;
      aBlock = MEMORY[0x24BDAC760];
      v75 = 1107296256;
      v51 = &block_descriptor_0;
    }
    v76 = sub_23DA7ECA4;
    v77 = v51;
    v54 = _Block_copy(&aBlock);
    v55 = v25;
    swift_retain();
    v56 = v70;
    sub_23DA9BA10();
    v73 = MEMORY[0x24BEE4AF8];
    sub_23DA63860((unint64_t *)&qword_256CDB358, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
    v57 = v9;
    sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
    v58 = v72;
    v59 = v67;
    sub_23DA9BD88();
    v60 = v64;
    MEMORY[0x242639C64](v48, v56, v58, v54);
    _Block_release(v54);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v58, v59);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v56, v66);
    ((void (*)(char *, uint64_t))v68)(v48, v57);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23DA6AA2C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t result;
  void *v8;

  v2 = sub_23DA9B7DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DA9B7B8();
  v6 = (void *)sub_23DA9B770();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(a1, sel_setTimestamp_, v6);

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    v8 = a1;
    sub_23DA9B890();
    return swift_release();
  }
  return result;
}

uint64_t sub_23DA6AB2C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (*(_QWORD *)(result + 48))
    {
      swift_retain();
      sub_23DA9B878();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_23DA6AB98()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGConfirmationRegulator()
{
  return objc_opt_self();
}

uint64_t sub_23DA6AC04(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23DA9B818();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23DA63860((unint64_t *)&qword_256CDB948, v11, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23DA9BA70();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23DA63860(&qword_256CDB950, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v21 = sub_23DA9BA94();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23DA6B1CC((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23DA6AE60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23DA9B818();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB958);
  v6 = sub_23DA9BDC4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_23DA63860((unint64_t *)&qword_256CDB948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      result = sub_23DA9BA70();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23DA6B1CC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23DA9B818();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23DA6AE60();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23DA6B3D0();
      goto LABEL_12;
    }
    sub_23DA6B5F4();
  }
  v12 = *v3;
  sub_23DA63860((unint64_t *)&qword_256CDB948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v13 = sub_23DA9BA70();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_23DA63860(&qword_256CDB950, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v18 = sub_23DA9BA94();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23DA9BF68();
  __break(1u);
  return result;
}

void *sub_23DA6B3D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_23DA9B818();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB958);
  v6 = *v0;
  v7 = sub_23DA9BDB8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23DA6B5F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23DA9B818();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB958);
  v7 = sub_23DA9BDC4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23DA63860((unint64_t *)&qword_256CDB948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_23DA9BA70();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23DA6B91C(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB8D0);
  v17 = *(_QWORD *)(v6 - 8);
  v18 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB8D8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1;
  v20 = a2;
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB8E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB8E8);
  sub_23DA638A0(&qword_256CDB8F0, &qword_256CDB8E0, MEMORY[0x24BDB9AF8]);
  sub_23DA9B944();
  swift_release();
  sub_23DA638A0(&qword_256CDB8F8, &qword_256CDB8D8, MEMORY[0x24BDB96C0]);
  v13 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(_QWORD *)(v3 + 40) = v13;
  result = swift_release();
  if (!*(_QWORD *)(v3 + 32))
  {
    __break(1u);
    goto LABEL_5;
  }
  v20 = *(_QWORD *)(v3 + 32);
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23DA9B92C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23DA638A0(&qword_256CDB900, &qword_256CDB8D0, MEMORY[0x24BDB9568]);
  v15 = v18;
  v16 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v15);
  *(_QWORD *)(v3 + 32) = v16;
  swift_release();
  result = *(_QWORD *)(v3 + 32);
  if (!result)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_23DA6BC08()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

id sub_23DA6BC2C@<X0>(void **a1@<X0>, id *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_23DA697FC(a1, a2, v3, a3);
}

uint64_t sub_23DA6BC34()
{
  return sub_23DA6A0C0();
}

uint64_t sub_23DA6BC3C()
{
  return sub_23DA6AB2C();
}

uint64_t sub_23DA6BC44()
{
  return sub_23DA6A1B4();
}

uint64_t sub_23DA6BC4C(uint64_t a1)
{
  uint64_t v1;

  return sub_23DA6A1F8(a1, v1);
}

uint64_t sub_23DA6BC58()
{
  uint64_t v0;

  return sub_23DA6AA2C(*(void **)(v0 + 16));
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

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_23DA6BCB8@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23DA6921C(a1, a2);
}

uint64_t sub_23DA6BCC0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23DA6BD04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v6[2];

  v1 = sub_23DA9B818();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = 0x3A6E6F6973736553;
  v6[1] = 0xE800000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_id, v1);
  sub_23DA9B7E8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  return v6[0];
}

uint64_t sub_23DA6BDDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB370);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD18);
  v24 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_caManager);
  type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(0);
  swift_allocObject();
  sub_23DA9B7B8();
  swift_beginAccess();
  v11 = swift_retain();
  MEMORY[0x242639B44](v11);
  if (*(_QWORD *)((*(_QWORD *)(v10 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v10 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_23DA9BBCC();
  sub_23DA9BBE4();
  sub_23DA9BBC0();
  swift_endAccess();
  swift_release();
  v23 = a1;
  sub_23DA6CC64(a1);
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer))
  {
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
    sub_23DA9B8CC();
    swift_endAccess();
    sub_23DA638A0(&qword_256CDB3A0, &qword_256CDB370, MEMORY[0x24BDB9EE8]);
    sub_23DA9B9EC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_23DA638A0(&qword_256CDBD20, &qword_256CDBD18, MEMORY[0x24BDB9658]);
    v12 = v22;
    v13 = sub_23DA9B914();
    v14 = v5;
    v15 = v4;
    v16 = v24;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v12);
    v17 = sub_23DA626A4(v13);
    swift_release();
    v25 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB390);
    sub_23DA638A0(&qword_256CDB398, &qword_256CDB390, MEMORY[0x24BDB9AF8]);
    v18 = sub_23DA9B9F8();
    v19 = v16;
    v4 = v15;
    v5 = v14;
    swift_release();
  }
  else
  {
    v18 = 0;
    v19 = v24;
    v12 = v22;
  }
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_waitingToneTask) = v18;
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  sub_23DA9B8CC();
  swift_endAccess();
  sub_23DA638A0(&qword_256CDB3A0, &qword_256CDB370, MEMORY[0x24BDB9EE8]);
  sub_23DA9B9EC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(_QWORD *)(swift_allocObject() + 16) = v23;
  sub_23DA638A0(&qword_256CDBD20, &qword_256CDBD18, MEMORY[0x24BDB9658]);
  swift_unknownObjectRetain();
  v20 = sub_23DA9B9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v12);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStatusTask) = v20;
  return swift_release();
}

void sub_23DA6C20C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t inited;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint8_t *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  uint64_t v72;
  id v73;

  v3 = v2;
  v71 = (void (*)(uint64_t))a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD28);
  MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD30);
  MEMORY[0x24BDAC7A8](v7);
  v61 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_23DA9BD40();
  v9 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD38);
  v59 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD40);
  v65 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB370);
  v62 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD48);
  v69 = *(_QWORD *)(v17 - 8);
  v70 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v68 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_caManager);
  type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(0);
  swift_allocObject();
  sub_23DA9B7B8();
  swift_beginAccess();
  v20 = swift_retain();
  MEMORY[0x242639B44](v20);
  if (*(_QWORD *)((*(_QWORD *)(v19 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v19 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_23DA9BBCC();
  sub_23DA9BBE4();
  sub_23DA9BBC0();
  swift_endAccess();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DA9D660;
  v22 = *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask);
  *(_QWORD *)(inited + 32) = v22;
  v23 = v3;
  v24 = *(_QWORD *)(v3 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStatusTask);
  *(_QWORD *)(inited + 40) = v24;
  v72 = v23;
  v25 = *(_QWORD *)(v23 + OBJC_IVAR____TtC12HeadGestures9HGSession_waitingToneTask);
  *(_QWORD *)(inited + 48) = v25;
  if (v22)
  {
    swift_retain();
    swift_retain_n();
    swift_retain();
    sub_23DA9B878();
    swift_release();
    if (!v24)
      goto LABEL_6;
    goto LABEL_5;
  }
  swift_retain();
  swift_retain();
  if (v24)
  {
LABEL_5:
    swift_retain();
    sub_23DA9B878();
    swift_release();
  }
LABEL_6:
  if (v25)
  {
    swift_retain();
    sub_23DA9B878();
    swift_release();
  }
  v26 = a2;
  v27 = v72;
  swift_release();
  sub_23DA8FBAC();
  v28 = v71;
  if (v71)
  {
    v29 = *(_QWORD *)(v27 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer);
    if (v29)
    {
      sub_23DA6EA18((uint64_t)v71);
      v30 = qword_256CDAFF0;
      swift_retain();
      if (v30 != -1)
        swift_once();
      v57 = v26;
      v31 = sub_23DA9B860();
      __swift_project_value_buffer(v31, (uint64_t)qword_256CE1558);
      v32 = sub_23DA9B848();
      v33 = sub_23DA9BCA4();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_23DA5F000, v32, v33, "[Session] Start waiting for FTS signal, will force release FTS after 2s.", v34, 2u);
        v35 = v34;
        v28 = v71;
        MEMORY[0x24263A588](v35, -1, -1);
      }

      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
      v56 = v16;
      sub_23DA9B8CC();
      swift_endAccess();
      LOBYTE(v73) = 1;
      v36 = v13;
      sub_23DA9B8B4();
      v37 = v11;
      sub_23DA9BD34();
      v55 = v9;
      v38 = (uint64_t)v61;
      v39 = v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v61, 1, 1, v58);
      v73 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
      v40 = sub_23DA9BD28();
      v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56);
      v71 = (void (*)(uint64_t))v29;
      v42 = (uint64_t)v66;
      v41(v66, 1, 1, v40);
      sub_23DA6BCC0(0, &qword_256CDBD58);
      sub_23DA638A0(&qword_256CDBD60, &qword_256CDBD38, MEMORY[0x24BDB9DF8]);
      sub_23DA6EA28();
      v43 = v63;
      v44 = v60;
      sub_23DA9B974();
      sub_23DA6EA80(v42, &qword_256CDBD28);

      sub_23DA6EA80(v38, &qword_256CDBD30);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v39);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v44);
      sub_23DA638A0(&qword_256CDB3A0, &qword_256CDB370, MEMORY[0x24BDB9EE8]);
      sub_23DA638A0(&qword_256CDBD70, &qword_256CDBD40, MEMORY[0x24BDB9758]);
      v45 = v67;
      v46 = v68;
      v47 = v64;
      v48 = v56;
      sub_23DA9B980();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v43, v45);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v48, v47);
      v49 = swift_allocObject();
      v50 = v57;
      *(_QWORD *)(v49 + 16) = v28;
      *(_QWORD *)(v49 + 24) = v50;
      sub_23DA638A0(&qword_256CDBD78, &qword_256CDBD48, MEMORY[0x24BDB9798]);
      swift_retain();
      v51 = v70;
      v52 = sub_23DA9B9F8();
      swift_release();
      swift_release();
      sub_23DA6EA08((uint64_t)v28);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v46, v51);
      *(_QWORD *)(v72 + OBJC_IVAR____TtC12HeadGestures9HGSession_cleanupTask) = v52;
      swift_release();
    }
    else
    {
      v53 = swift_retain();
      v28(v53);
      sub_23DA6EA08((uint64_t)v28);
    }
  }
}

void sub_23DA6C9D4(unsigned __int8 *a1, void (*a2)(void))
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  v3 = *a1;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v4 = sub_23DA9B860();
  __swift_project_value_buffer(v4, (uint64_t)qword_256CE1558);
  v5 = sub_23DA9B848();
  v6 = sub_23DA9BC8C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v5, v6, "[Session] Current FTS signal: %{BOOL}d", v7, 8u);
    MEMORY[0x24263A588](v7, -1, -1);
  }

  if (v3)
  {
    v8 = sub_23DA9B848();
    v9 = sub_23DA9BCA4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23DA5F000, v8, v9, "[Session] audio finished playing, free to execute completion", v10, 2u);
      MEMORY[0x24263A588](v10, -1, -1);
    }

    a2();
  }
}

uint64_t sub_23DA6CB64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_caManager);
  type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(0);
  swift_allocObject();
  sub_23DA9B7B8();
  swift_beginAccess();
  v2 = swift_retain();
  MEMORY[0x242639B44](v2);
  if (*(_QWORD *)((*(_QWORD *)(v1 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_23DA9BBCC();
  sub_23DA9BBE4();
  sub_23DA9BBC0();
  swift_endAccess();
  swift_release();
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask))
  {
    swift_retain();
    sub_23DA9B878();
    swift_release();
  }
  return sub_23DA6D6D0();
}

uint64_t sub_23DA6CC64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD00);
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher))
  {
    v12[1] = *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB8E0);
    sub_23DA638A0(&qword_256CDB8F0, &qword_256CDB8E0, MEMORY[0x24BDB9AF8]);
    sub_23DA9B950();
    swift_release();
    v9 = swift_allocObject();
    swift_weakInit();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = a1;
    *(_QWORD *)(swift_allocObject() + 16) = a1;
    sub_23DA638A0(&qword_256CDBD08, &qword_256CDBD00, MEMORY[0x24BDB9658]);
    swift_unknownObjectRetain_n();
    v11 = sub_23DA9B968();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask) = v11;
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23DA6CE3C(void **a1, id *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v4 = sub_23DA9B818();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - v9;
  v11 = *a1;
  v12 = objc_msgSend(*a2, sel_uuid);
  sub_23DA9B800();

  v13 = objc_msgSend(v11, sel_uuid);
  sub_23DA9B800();

  LOBYTE(v13) = sub_23DA9B7F4();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  v14(v10, v4);
  return v13 & 1;
}

void sub_23DA6CF4C(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _BYTE *v13;
  _QWORD *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *oslog;
  os_log_t osloga;
  uint64_t v20;

  v3 = *a1;
  if (v3 == 3)
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v4 = sub_23DA9B860();
    __swift_project_value_buffer(v4, (uint64_t)qword_256CE1558);
    oslog = sub_23DA9B848();
    v5 = sub_23DA9BCA4();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23DA5F000, oslog, v5, "Pipeline finsihed", v6, 2u);
      MEMORY[0x24263A588](v6, -1, -1);
    }

  }
  else
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v8 = sub_23DA9B860();
    __swift_project_value_buffer(v8, (uint64_t)qword_256CE1558);
    v9 = sub_23DA9B848();
    v10 = sub_23DA9BC98();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      osloga = a3;
      v12 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v11 = 138412290;
      sub_23DA64218();
      swift_allocError();
      *v13 = v3;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      sub_23DA9BD58();
      *v12 = v20;
      _os_log_impl(&dword_23DA5F000, v9, v10, "Pipeline encountered an error %@", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD10);
      swift_arrayDestroy();
      v14 = v12;
      a3 = osloga;
      MEMORY[0x24263A588](v14, -1, -1);
      MEMORY[0x24263A588](v11, -1, -1);
    }

    if (v3 == 1)
    {
      v15 = sub_23DA9B848();
      v16 = sub_23DA9BCA4();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_23DA5F000, v15, v16, "Pipeline reseting", v17, 2u);
        MEMORY[0x24263A588](v17, -1, -1);
      }

      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        sub_23DA6CB64();
        swift_release();
      }
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        sub_23DA6CC64(a3);
        swift_release();
      }
    }
  }
}

void sub_23DA6D28C(id *a1, void *a2)
{
  id v3;
  char **p_name;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint8_t *v10;
  uint64_t v11;
  Swift::String v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  uint8_t *v22;
  uint64_t v23;
  Swift::String v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27[3];

  v3 = *a1;
  p_name = &E5RTExecutionStreamOperation.name;
  if (!objc_msgSend(*a1, sel_headGesture) && objc_msgSend(v3, sel_headGesturePart))
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v17 = sub_23DA9B860();
    __swift_project_value_buffer(v17, (uint64_t)qword_256CE1558);
    v18 = v3;
    v19 = sub_23DA9B848();
    v20 = sub_23DA9BCA4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = a2;
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v27[0] = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = HGHeadGestureResult.description()();
      v26 = sub_23DA6701C(v24._countAndFlagsBits, (unint64_t)v24._object, v27);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DA5F000, v19, v20, "[Part Result]: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v23, -1, -1);
      v25 = v22;
      a2 = v21;
      MEMORY[0x24263A588](v25, -1, -1);

      if (!v21)
        return;
    }
    else
    {

      if (!a2)
        return;
    }
LABEL_12:
    objc_msgSend(a2, sel_didDetectedWithHeadGesture_, v3, v26, v27[0]);
    return;
  }
  if (qword_256CDAFF0 != -1)
    swift_once();
  v5 = sub_23DA9B860();
  __swift_project_value_buffer(v5, (uint64_t)qword_256CE1558);
  v6 = v3;
  v7 = sub_23DA9B848();
  v8 = sub_23DA9BCA4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = a2;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v27[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = HGHeadGestureResult.description()();
    v26 = sub_23DA6701C(v12._countAndFlagsBits, (unint64_t)v12._object, v27);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v7, v8, "[Gesture Result]: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v11, -1, -1);
    v13 = v10;
    a2 = v9;
    p_name = (char **)(&E5RTExecutionStreamOperation + 24);
    MEMORY[0x24263A588](v13, -1, -1);

  }
  else
  {

  }
  if (qword_256CDAFE0 != -1)
    swift_once();
  v14 = qword_256CE1520;
  v15 = objc_msgSend(v6, p_name[297], v26, v27[0]);
  type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(0);
  *(_QWORD *)(swift_allocObject()
            + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAGestureDetectionEvent_detectedGesture) = v15;
  sub_23DA9B7B8();
  swift_beginAccess();
  v16 = swift_retain();
  MEMORY[0x242639B44](v16);
  if (*(_QWORD *)((*(_QWORD *)(v14 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v14 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_23DA9BBCC();
  sub_23DA9BBE4();
  sub_23DA9BBC0();
  swift_endAccess();
  swift_release();
  if (a2)
    goto LABEL_12;
}

uint64_t sub_23DA6D6D0()
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
  char *v20;
  char *v21;
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
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t result;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE v126[128];
  _OWORD v127[20];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC50);
  v105 = *(_QWORD *)(v2 - 8);
  v106 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v104 = (char *)&v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC58);
  v96 = *(_QWORD *)(v4 - 8);
  v97 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v95 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC60);
  v93 = *(_QWORD *)(v6 - 8);
  v94 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v92 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC68);
  v100 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v109 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC70);
  v102 = *(_QWORD *)(v111 - 8);
  v9 = MEMORY[0x24BDAC7A8](v111);
  v91 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v101 = (char *)&v90 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC78);
  v117 = *(_QWORD *)(v12 - 8);
  v118 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v115 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC80);
  v119 = *(_QWORD *)(v14 - 8);
  v120 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v116 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC88);
  v17 = *(_QWORD *)(v16 - 8);
  v113 = v16;
  v114 = v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(char **)(v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_config);
  v21 = &v20[OBJC_IVAR___HGConfigurationInternal_mlConfig];
  swift_beginAccess();
  v22 = *(_QWORD *)v21;
  v23 = *(_QWORD *)(*(_QWORD *)v21 + OBJC_IVAR___HGMLConfigurationInternal_windowSize);
  v24 = *(_QWORD *)(v22 + OBJC_IVAR___HGMLConfigurationInternal_stride);
  type metadata accessor for HGBuffer();
  swift_allocObject();
  v25 = sub_23DA80D7C(v23, v24);
  v26 = OBJC_IVAR____TtC12HeadGestures9HGSession_buffer;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_buffer) = v25;
  swift_release();
  type metadata accessor for HGPredictionAggregator();
  swift_allocObject();
  v27 = MEMORY[0x24BEE4AF8];
  v28 = sub_23DA8339C((uint64_t)&unk_250E6B4C0, MEMORY[0x24BEE4AF8]);
  v29 = OBJC_IVAR____TtC12HeadGestures9HGSession_aggregator;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_aggregator) = v28;
  swift_release();
  type metadata accessor for HGPartGestureRecognizer();
  swift_allocObject();
  v30 = v20;
  v31 = sub_23DA964A4((uint64_t)v30);
  v122 = v30;

  v99 = OBJC_IVAR____TtC12HeadGestures9HGSession_partGesturesRecognizer;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_partGesturesRecognizer) = v31;
  swift_release();
  type metadata accessor for HGMotionStateRecognizer();
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_23DA9D670;
  sub_23DA642C0((uint64_t)v126);
  *(_QWORD *)&v127[0] = 0;
  BYTE8(v127[0]) = 1;
  sub_23DA6425C((uint64_t)v126, (uint64_t)&v127[1]);
  memset(&v127[9], 0, 24);
  BYTE8(v127[10]) = 1;
  memset(&v127[11], 0, 24);
  BYTE8(v127[12]) = 1;
  memset(&v127[13], 0, 24);
  BYTE8(v127[14]) = 1;
  memset(&v127[15], 0, 48);
  LOBYTE(v127[18]) = 1;
  *((_QWORD *)&v127[18] + 1) = 0;
  LOBYTE(v127[19]) = 1;
  memcpy((void *)(v32 + 32), v127, 0x131uLL);
  *(_QWORD *)(v32 + 344) = v27;
  *(_QWORD *)(v32 + 352) = v27;
  *(_QWORD *)(v32 + 360) = v27;
  *(_BYTE *)(v32 + 368) = 1;
  v112 = OBJC_IVAR____TtC12HeadGestures9HGSession_motionStateRecognizer;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStateRecognizer) = v32;
  swift_release();
  type metadata accessor for HGDataRegulator();
  v33 = swift_allocObject();
  sub_23DA6425C((uint64_t)v126, v33 + 16);
  v34 = OBJC_IVAR____TtC12HeadGestures9HGSession_regulator;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_regulator) = v33;
  swift_release();
  type metadata accessor for HGHeuristicHeadGestureRecognizer();
  swift_allocObject();
  v35 = sub_23DA7BA5C();
  v36 = OBJC_IVAR____TtC12HeadGestures9HGSession_heuristicRecognizer;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_heuristicRecognizer) = v35;
  swift_release();
  swift_allocObject();
  v37 = sub_23DA95AD4(0.65, 0.25, 0.4);
  v38 = OBJC_IVAR____TtC12HeadGestures9HGSession_sensitivePartGestureRecognizer;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_sensitivePartGestureRecognizer) = v37;
  swift_release();
  type metadata accessor for HGConfirmationRegulator();
  swift_allocObject();
  v39 = sub_23DA68DC8();
  v40 = OBJC_IVAR____TtC12HeadGestures9HGSession_confirmationRegulator;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_confirmationRegulator) = v39;
  swift_release();
  if (!*(_QWORD *)(v1 + v34))
  {
    __break(1u);
    goto LABEL_21;
  }
  v103 = v40;
  if (!*(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionDataProvider)
                  + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataPublisher))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    swift_release();
    __break(1u);
    goto LABEL_23;
  }
  swift_retain();
  v41 = swift_retain();
  v42 = sub_23DA63A98(v41);
  swift_release();
  swift_release();
  v43 = &v122[OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging];
  swift_beginAccess();
  v44 = *v43;
  v98 = v36;
  if (v44 == 1)
  {
    if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_recorder))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    swift_retain();
    swift_retain();
    v45 = sub_23DA93B80(v42);
    swift_release();
    swift_release_n();
    v42 = v45;
  }
  v90 = v38;
  if (!*(_QWORD *)(v1 + v29))
    goto LABEL_22;
  if (!*(_QWORD *)(v1 + v26))
  {
LABEL_23:
    swift_retain();
    swift_release();
    __break(1u);
    goto LABEL_24;
  }
  v121 = v42;
  v125 = v42;
  swift_retain_n();
  swift_retain();
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC90);
  type metadata accessor for HGMLInput();
  v47 = v19;
  v107 = sub_23DA638A0(&qword_256CDBC98, &qword_256CDBC90, MEMORY[0x24BDB9AF8]);
  v108 = v46;
  sub_23DA9B920();
  swift_release();
  v48 = MEMORY[0x24BDB94C8];
  sub_23DA638A0(&qword_256CDBCA0, &qword_256CDBC88, MEMORY[0x24BDB94C8]);
  v49 = v113;
  v50 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v47, v49);
  swift_release();
  v51 = sub_23DA825AC(v50);
  swift_release();
  v125 = v51;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBCA8);
  v52 = sub_23DA6BCC0(0, (unint64_t *)&qword_256CDB930);
  v53 = MEMORY[0x24BDB9AF8];
  sub_23DA638A0(&qword_256CDBCB0, &qword_256CDBCA8, MEMORY[0x24BDB9AF8]);
  v54 = v115;
  v114 = v52;
  sub_23DA9B920();
  swift_release();
  sub_23DA638A0(&qword_256CDBCB8, &qword_256CDBC78, v48);
  v55 = v116;
  v56 = v118;
  sub_23DA9B9A4();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v54, v56);
  sub_23DA638A0(&qword_256CDBCC0, &qword_256CDBC80, MEMORY[0x24BDB97F8]);
  v57 = v120;
  v58 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v119 + 8))(v55, v57);
  swift_release();
  swift_release();
  v125 = v58;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB8E0);
  v120 = sub_23DA638A0(&qword_256CDB8F0, &qword_256CDB8E0, v53);
  v60 = sub_23DA9B914();
  swift_release();
  v61 = &v122[OBJC_IVAR___HGConfigurationInternal_requestPartGestures];
  swift_beginAccess();
  if ((*v61 & 1) != 0)
  {
    v62 = *(char **)(v1 + v103);
    if (v62)
    {
      if (*(_QWORD *)(v1 + v98))
      {
        if (*(_QWORD *)(v1 + v90))
        {
          v119 = v59;
          if (*(_QWORD *)(v1 + v112))
          {
            v124 = v121;
            swift_retain_n();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            v122 = v62;
            v63 = v109;
            sub_23DA9B920();
            swift_release();
            v64 = sub_23DA638A0(&qword_256CDBCD0, &qword_256CDBC68, MEMORY[0x24BDB94C8]);
            v65 = v110;
            v118 = v64;
            v66 = sub_23DA9B998();
            v117 = *(_QWORD *)(v100 + 8);
            ((void (*)(char *, uint64_t))v117)(v63, v65);
            swift_release();
            swift_release();
            v124 = v66;
            swift_retain();
            v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBCD8);
            v68 = sub_23DA638A0(&qword_256CDBCE0, &qword_256CDBCD8, MEMORY[0x24BDB97C8]);
            v69 = v101;
            v116 = (char *)v68;
            sub_23DA9B920();
            swift_release();
            swift_release_n();
            v70 = sub_23DA638A0(&qword_256CDBCE8, &qword_256CDBC70, MEMORY[0x24BDB94C8]);
            v71 = v111;
            v72 = sub_23DA9B914();
            v115 = *(char **)(v102 + 8);
            ((void (*)(char *, uint64_t))v115)(v69, v71);
            v73 = sub_23DA7A4E4(v72);
            swift_release();
            swift_release();
            v74 = sub_23DA6B91C(v60, v73);
            swift_retain();
            swift_release();
            swift_release();
            swift_release_n();
            if (*(_QWORD *)(v1 + v99))
            {
              v113 = v70;
              v122 = (char *)v67;
              if (*(_QWORD *)(v1 + v112))
              {
                v124 = v121;
                swift_retain_n();
                swift_retain();
                swift_retain();
                swift_retain();
                v75 = v109;
                sub_23DA9B920();
                swift_release();
                v76 = v110;
                v77 = sub_23DA9B998();
                ((void (*)(char *, uint64_t))v117)(v75, v76);
                swift_release();
                swift_release();
                v124 = v77;
                swift_retain();
                v78 = v91;
                sub_23DA9B920();
                swift_release();
                swift_release_n();
                v79 = v92;
                v80 = v111;
                sub_23DA9B95C();
                ((void (*)(char *, uint64_t))v115)(v78, v80);
                sub_23DA638A0(&qword_256CDBCF0, &qword_256CDBC60, MEMORY[0x24BDB96C0]);
                v81 = v94;
                v82 = sub_23DA9B914();
                (*(void (**)(char *, uint64_t))(v93 + 8))(v79, v81);
                v123 = v74;
                v124 = v82;
                v83 = v95;
                sub_23DA9B98C();
                swift_release();
                sub_23DA638A0(&qword_256CDBCF8, &qword_256CDBC58, MEMORY[0x24BDB99D8]);
                v84 = v97;
                v60 = sub_23DA9B914();
                swift_release();
                swift_release();
                (*(void (**)(char *, uint64_t))(v96 + 8))(v83, v84);
                goto LABEL_16;
              }
LABEL_30:
              swift_retain();
              swift_release();
              result = swift_release();
              __break(1u);
              return result;
            }
LABEL_29:
            swift_release();
            swift_release();
            __break(1u);
            goto LABEL_30;
          }
LABEL_28:
          swift_retain();
          swift_retain();
          swift_retain();
          swift_release();
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        swift_retain();
        swift_retain();
        swift_release();
        __break(1u);
        goto LABEL_28;
      }
LABEL_26:
      swift_retain();
      swift_release();
      __break(1u);
      goto LABEL_27;
    }
LABEL_25:
    swift_release();
    __break(1u);
    goto LABEL_26;
  }
LABEL_16:
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer))
  {
    v124 = v60;
    swift_retain();
    v85 = v104;
    sub_23DA9B95C();
    swift_release();
    sub_23DA638A0(&qword_256CDBCC8, &qword_256CDBC50, MEMORY[0x24BDB96C0]);
    v86 = v106;
    v87 = sub_23DA9B914();
    (*(void (**)(char *, uint64_t))(v105 + 8))(v85, v86);
    v124 = v87;
    v88 = sub_23DA9B914();
    swift_release();
    swift_release();
    swift_release();
    v60 = v88;
  }
  else
  {
    swift_release();
  }
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher) = v60;
  return swift_release();
}

id sub_23DA6E58C@<X0>(unsigned __int8 *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = sub_23DA81470(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_23DA6E5B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_id;
  v2 = sub_23DA9B818();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

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
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_23DA6E728()
{
  sub_23DA6E5B4();
  return swift_deallocClassInstance();
}

uint64_t sub_23DA6E74C()
{
  return type metadata accessor for HGSession();
}

uint64_t type metadata accessor for HGSession()
{
  uint64_t result;

  result = qword_256CDB988;
  if (!qword_256CDB988)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA6E790()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DA9B818();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t sub_23DA6E83C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_id;
  v4 = sub_23DA9B818();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23DA6E884()
{
  return sub_23DA6BD04();
}

unint64_t sub_23DA6E8A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDB948;
  if (!qword_256CDB948)
  {
    v1 = sub_23DA9B818();
    result = MEMORY[0x24263A4F8](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_256CDB948);
  }
  return result;
}

uint64_t sub_23DA6E8F0(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_23DA6E914@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

_QWORD *sub_23DA6E93C@<X0>(double *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_23DA80E04(a1, v2, a2);
}

void sub_23DA6E944(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23DA83B54(a1, a2);
}

id sub_23DA6E94C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_23DA62A20(a1, v2, a2);
}

uint64_t sub_23DA6E954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23DA78980(a1, a2);
}

uint64_t sub_23DA6E95C@<X0>(void *__src@<X0>, char *a2@<X8>)
{
  return sub_23DA95B50(__src, a2);
}

uint64_t sub_23DA6E964()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DA6E988()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_23DA6E9B4(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_23DA6CF4C(a1, *(_QWORD *)(v1 + 16), *(NSObject **)(v1 + 24));
}

void sub_23DA6E9BC(id *a1)
{
  uint64_t v1;

  sub_23DA6D28C(a1, *(void **)(v1 + 16));
}

uint64_t sub_23DA6E9C4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_23DA6E9E8(unsigned __int8 *a1)
{
  uint64_t v1;
  id result;

  result = *(id *)(v1 + 16);
  if (result)
    return objc_msgSend(result, sel_didStartStreamingWithIsStreaming_, *a1);
  return result;
}

uint64_t sub_23DA6EA08(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23DA6EA18(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_23DA6EA28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDBD68;
  if (!qword_256CDBD68)
  {
    v1 = sub_23DA6BCC0(255, &qword_256CDBD58);
    result = MEMORY[0x24263A4F8](MEMORY[0x24BDD0408], v1);
    atomic_store(result, (unint64_t *)&qword_256CDBD68);
  }
  return result;
}

uint64_t sub_23DA6EA80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23DA6EABC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23DA6EAE0(unsigned __int8 *a1)
{
  uint64_t v1;

  sub_23DA6C9D4(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_23DA6EAE8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  char *v8;
  void **v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  char *v13;

  v2 = v1;
  sub_23DA9B80C();
  v4 = OBJC_IVAR____TtC12HeadGestures9HGSession_caManager;
  if (qword_256CDAFE0 != -1)
    swift_once();
  *(_QWORD *)(v2 + v4) = qword_256CE1520;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_aggregator) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_buffer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_regulator) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_recorder) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStateRecognizer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_partGesturesRecognizer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_confirmationRegulator) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_heuristicRecognizer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_sensitivePartGestureRecognizer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStatusTask) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_waitingToneTask) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_cleanupTask) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_config) = a1;
  v5 = objc_allocWithZone((Class)type metadata accessor for HGHeadphoneMotionDataProvider());
  swift_retain();
  v6 = a1;
  v7 = objc_msgSend(v5, sel_init);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionDataProvider) = v7;
  type metadata accessor for HGMLHeadGesturesClassifier();
  swift_allocObject();
  v8 = (char *)v6;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_mlRecognizer) = sub_23DA820F8(v8);
  v9 = (void **)&v8[OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig];
  swift_beginAccess();
  v10 = (char *)*v9;
  v11 = (char *)*v9 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback;
  swift_beginAccess();
  v12 = 0;
  if (*v11 == 1)
  {
    v13 = &v10[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID];
    swift_beginAccess();
    if (*(_DWORD *)v13)
    {
      type metadata accessor for HGCustomizedAudioPlayer();
      swift_allocObject();
      v12 = sub_23DA75388(v10);
    }
    else
    {
      type metadata accessor for HGSystemAudioPlayer();
      swift_allocObject();
      v12 = sub_23DA7ECD0(v10);
    }
  }
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer) = v12;
  type metadata accessor for HGDataCollector();
  swift_allocObject();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_recorder) = sub_23DA9381C();
  swift_release();
  sub_23DA6D6D0();
  return v2;
}

uint64_t sub_23DA6EDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_23DA9B818();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_23DA63860((unint64_t *)&qword_256CDB948, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]), v6 = sub_23DA9BA70(), v7 = -1 << *(_BYTE *)(a2 + 32), v8 = v6 & ~v7, ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_23DA63860(&qword_256CDB950, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v12 = sub_23DA9BA94();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_23DA6EF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_23DA9BFBC();
    sub_23DA9BB18();
    v6 = sub_23DA9BFD4();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23DA9BF5C() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23DA9BF5C() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_23DA6F060()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v1 = objc_msgSend(v0, sel_modelDescription);
  v2 = objc_msgSend(v1, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  sub_23DA63860(&qword_256CDB430, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&unk_23DA9D214);
  v3 = sub_23DA9BA58();

  if (!*(_QWORD *)(v3 + 16))
  {
    v12 = 0u;
    v13 = 0u;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v4 = (id)*MEMORY[0x24BDBFF38];
  v5 = sub_23DA99940((uint64_t)v4);
  if ((v6 & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;

    goto LABEL_10;
  }
  sub_23DA68D7C(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v12);

  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v13 + 1))
  {
LABEL_11:
    sub_23DA6EA80((uint64_t)&v12, &qword_256CDBF68);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBF70);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  if (!*(_QWORD *)(v11 + 16) || (v7 = sub_23DA99804(0x64695F746C6F62, 0xE700000000000000), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 16 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v9;
}

id sub_23DA6F2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  id v7;
  uint64_t inited;
  void *v9;

  v5 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  v6 = sub_23DA6EF2C(a1, a2, v5);
  swift_bridgeObjectRelease();
  v7 = 0;
  if ((v6 & 1) != 0)
  {
    if (a1 == 0xD000000000000010 && a2 == 0x800000023DAA0E10 || (sub_23DA9BF5C() & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBF50);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_23DA9D740;
      sub_23DA6BCC0(0, &qword_256CDBF58);
      sub_23DA9BDAC();
      sub_23DA6BCC0(0, (unint64_t *)&qword_256CDBF48);
      *(_QWORD *)(inited + 72) = sub_23DA9BD1C();
      sub_23DA87E34(inited);
      return sub_23DA98900();
    }
    else if (a1 == 0x62614C7373616C63 && a2 == 0xEA00000000006C65 || (sub_23DA9BF5C() & 1) != 0)
    {
      v9 = (void *)sub_23DA9BAA0();
      v7 = objc_msgSend((id)objc_opt_self(), sel_featureValueWithString_, v9);

    }
    else
    {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_23DA6F528()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_23DA6F630()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FooModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FooModel()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for FooModel.FooModelFeatureProvider()
{
  return objc_opt_self();
}

uint64_t sub_23DA6F6A0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v2 = v1;
  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = 0;
  v3 = qword_256CDAFF0;
  v4 = a1;
  if (v3 != -1)
    swift_once();
  v5 = sub_23DA9B860();
  __swift_project_value_buffer(v5, (uint64_t)qword_256CE1558);
  v6 = sub_23DA9B848();
  v7 = sub_23DA9BC80();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23DA5F000, v6, v7, "[HGModel] using v1 model", v8, 2u);
    MEMORY[0x24263A588](v8, -1, -1);
  }

  return v2;
}

void sub_23DA6F78C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v4 + OBJC_IVAR___HGMLConfigurationInternal_modelType);
  if (v5 == 1)
  {
    v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FooModel()), sel_init);
    v7 = *(void **)(v0 + 24);
    *(_QWORD *)(v0 + 24) = v6;

  }
  else if (v5
         || (v8 = v4 + OBJC_IVAR___HGMLConfigurationInternal_testModelURL,
             swift_beginAccess(),
             sub_23DA700CC(v8, (uint64_t)v3),
             v9 = sub_23DA70370((uint64_t)v3),
             sub_23DA6EA80((uint64_t)v3, &qword_256CDB748),
             !v9))
  {
    sub_23DA9BE48();
    __break(1u);
  }
  else
  {
    v10 = *(void **)(v0 + 24);
    *(_QWORD *)(v0 + 24) = v9;

  }
}

uint64_t sub_23DA6F908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = sub_23DA9B860();
  v2 = *(_QWORD *)(v1 - 8);
  result = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v0 + 16);
  if (*(_QWORD *)(v6 + OBJC_IVAR___HGMLConfigurationInternal_modelType) == 1)
    return result;
  v7 = *(void **)(v0 + 24);
  if (!v7)
    goto LABEL_26;
  v8 = v7;
  v9 = objc_msgSend(v8, sel_modelDescription);
  v10 = objc_msgSend(v9, sel_inputDescriptionsByName);

  sub_23DA6BCC0(0, &qword_256CDBF40);
  v11 = sub_23DA9BA58();

  sub_23DA6FE08(v11);
  v13 = v12;
  v15 = v14;
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_26;
  if (objc_msgSend(v15, sel_type) == (id)5)
  {
    v16 = objc_msgSend(v15, sel_multiArrayConstraint);
    if (!v16)
      goto LABEL_25;
    v17 = v16;
    v18 = objc_msgSend(v16, sel_shape);

    sub_23DA6BCC0(0, (unint64_t *)&qword_256CDBF48);
    v19 = sub_23DA9BBA8();

    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      v34 = sub_23DA9BE54();
      swift_bridgeObjectRelease();
      if (v34)
      {
LABEL_8:
        if ((v19 & 0xC000000000000001) == 0)
        {
          if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v20 = *(id *)(v19 + 32);
            goto LABEL_11;
          }
          __break(1u);
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_23:
        v20 = (id)MEMORY[0x242639DA8](0, v19);
LABEL_11:
        v21 = v20;
        swift_bridgeObjectRelease();
        v22 = objc_msgSend(v21, sel_integerValue);

        if (v22 == *(id *)(v6 + OBJC_IVAR___HGMLConfigurationInternal_windowSize))
          goto LABEL_12;
LABEL_26:
        result = sub_23DA9BE48();
        __break(1u);
        return result;
      }
    }
    else if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_23;
  }
LABEL_12:
  if (qword_256CDAFF0 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v1, (uint64_t)qword_256CE1558);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v23, v1);
  v24 = v8;
  v25 = sub_23DA9B848();
  v26 = sub_23DA9BCA4();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v37 = v13;
    v28 = (uint8_t *)v27;
    v29 = swift_slowAlloc();
    v38 = v2;
    v30 = v29;
    v40 = v29;
    *(_DWORD *)v28 = 136315138;
    v31 = sub_23DA6F060();
    if (v32)
    {
      v33 = v32;
    }
    else
    {
      v31 = 0x6E776F6E6B6E55;
      v33 = 0xE700000000000000;
    }
    v36 = v15;
    v39 = sub_23DA6701C(v31, v33, &v40);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v25, v26, "[HGEspressoV1Model] ML model version: %s loaded.", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v30, -1, -1);
    MEMORY[0x24263A588](v28, -1, -1);

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v5, v1);
  }
  else
  {

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

_QWORD *sub_23DA6FE08(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_23DA8661C();
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_23DA7003C(&v5, (uint64_t)result, v3, 0, a1);
}

uint64_t sub_23DA6FE90(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t result;
  id v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v1 + 24);
  if (!v2)
    return 0;
  v10[0] = 0;
  v4 = v2;
  v5 = objc_msgSend(v4, sel_predictionFromFeatures_error_, a1, v10);
  if (v5)
  {
    v6 = v5;
    v7 = v10[0];

    type metadata accessor for HGMLOutput();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v6;
  }
  else
  {
    v9 = v10[0];
    sub_23DA9B680();

    swift_willThrow();
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_23DA6FF90()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGEspressoV1Model()
{
  return objc_opt_self();
}

void sub_23DA6FFDC()
{
  sub_23DA6F78C();
}

uint64_t sub_23DA6FFFC()
{
  return sub_23DA6F908();
}

uint64_t sub_23DA7001C(uint64_t a1)
{
  return sub_23DA6FE90(a1);
}

_QWORD *sub_23DA7003C(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * a2);
    *result = v6;
    swift_bridgeObjectRetain();
    v7 = v6;
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_23DA700CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23DA70114()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t result;

  type metadata accessor for HGMLInput();
  if (swift_dynamicCastClass())
  {
    type metadata accessor for FooModel.FooModelFeatureProvider();
    v0 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBF60);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23DA9D750;
    *(_QWORD *)(inited + 32) = 0x62614C7373616C63;
    *(_QWORD *)(inited + 40) = 0xEA00000000006C65;
    *(_QWORD *)(inited + 48) = 0xD000000000000010;
    *(_QWORD *)(inited + 56) = 0x800000023DAA0E10;
    v2 = sub_23DA9B428(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    *(_QWORD *)(v0 + 16) = v2;
    return v0;
  }
  else
  {
    result = sub_23DA9BE48();
    __break(1u);
  }
  return result;
}

id sub_23DA70254(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_23DA9B6A4();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_23DA9B6D4();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_23DA9B680();

    swift_willThrow();
    v11 = sub_23DA9B6D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

id sub_23DA70370(uint64_t a1)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t ObjCClassFromMetadata;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  id v31;
  id v32;
  id v34;
  _QWORD v35[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v35 - v6;
  v8 = sub_23DA9B6D4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v35 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v35[0] = (char *)v35 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v35 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v35 - v21;
  sub_23DA700CC(a1, (uint64_t)v7);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v23(v7, 1, v8) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v22, v7, v8);
    sub_23DA6BCC0(0, &qword_256CDBF78);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v20, v22, v8);
    v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
    v34 = sub_23DA70254((uint64_t)v20, (uint64_t)v32);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v22, v8);
    return v34;
  }
  sub_23DA6EA80((uint64_t)v7, &qword_256CDB748);
  type metadata accessor for HGEspressoV1Model();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v25 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v26 = (void *)sub_23DA9BAA0();
  v27 = (void *)sub_23DA9BAA0();
  v28 = objc_msgSend(v25, sel_URLForResource_withExtension_, v26, v27);

  if (!v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
    goto LABEL_7;
  }
  sub_23DA9B6B0();

  v29 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v29(v5, v15, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  if (v23(v5, 1, v8) == 1)
  {
LABEL_7:

    sub_23DA6EA80((uint64_t)v5, &qword_256CDB748);
    return 0;
  }
  v30 = v35[0];
  v29((char *)v35[0], v5, v8);
  sub_23DA6BCC0(0, &qword_256CDBF78);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v30, v8);
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  v34 = sub_23DA70254((uint64_t)v12, (uint64_t)v31);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v30, v8);
  return v34;
}

uint64_t sub_23DA70770()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGFileUtil()
{
  return objc_opt_self();
}

uint64_t sub_23DA707A0(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_23DA707C0(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23DA9BD58();
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

id sub_23DA70870(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, unint64_t a6)
{
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
  char *v20;
  unint64_t v21;
  void (*v22)(char *, uint64_t);
  unint64_t v23;
  unint64_t v24;
  void *v25;
  char **p_name;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  unsigned __int8 v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  unsigned int v60;
  os_log_type_t v61;
  uint8_t *v62;
  void *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  uint64_t v76;
  id v77[3];

  v73 = a5;
  v74 = a6;
  v75 = a4;
  v77[2] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = sub_23DA9B68C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23DA9B6D4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v71 - v18;
  sub_23DA9B698();
  v77[0] = a3;
  v77[1] = v75;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDCD798], v9);
  sub_23DA7125C();
  sub_23DA9B6C8();
  v20 = v12;
  v21 = a2;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v20, v9);
  v22 = *(void (**)(char *, uint64_t))(v14 + 8);
  v22(v17, v13);
  v75 = (void *)sub_23DA9B6BC();
  v24 = v23;
  v22(v19, v13);
  v25 = (void *)objc_opt_self();
  p_name = &E5RTExecutionStreamOperation.name;
  v27 = objc_msgSend(v25, sel_defaultManager);
  v28 = a1;
  v29 = (void *)sub_23DA9BAA0();
  v77[0] = 0;
  LODWORD(v17) = objc_msgSend(v27, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v29, 1, 0, v77);

  if (!(_DWORD)v17)
  {
    v37 = v77[0];
    swift_bridgeObjectRelease();
    v38 = (void *)sub_23DA9B680();

    swift_willThrow();
    if (qword_256CDAFF0 != -1)
      swift_once();
    v39 = sub_23DA9B860();
    __swift_project_value_buffer(v39, (uint64_t)qword_256CE1558);
    v40 = v38;
    v41 = v38;
    v42 = sub_23DA9B848();
    v43 = sub_23DA9BC98();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = (void *)swift_slowAlloc();
      v77[0] = v45;
      *(_DWORD *)v44 = 136315138;
      swift_getErrorValue();
      v46 = sub_23DA9BF80();
      v76 = sub_23DA6701C(v46, v47, (uint64_t *)v77);
      sub_23DA9BD58();
      swift_bridgeObjectRelease();

      swift_arrayDestroy();
      MEMORY[0x24263A588](v45, -1, -1);
      MEMORY[0x24263A588](v44, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v72 = v24;
  v30 = qword_256CDAFF0;
  v31 = v77[0];
  if (v30 != -1)
    swift_once();
  v32 = sub_23DA9B860();
  __swift_project_value_buffer(v32, (uint64_t)qword_256CE1558);
  swift_bridgeObjectRetain_n();
  v33 = sub_23DA9B848();
  v34 = sub_23DA9BCA4();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = (void *)swift_slowAlloc();
    v77[0] = v36;
    *(_DWORD *)v35 = 136315138;
    swift_bridgeObjectRetain();
    v76 = sub_23DA6701C(v28, v21, (uint64_t *)v77);
    p_name = (char **)(&E5RTExecutionStreamOperation + 24);
    sub_23DA9BD58();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23DA5F000, v33, v34, "[HGFileUtil] Directory created at %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v36, -1, -1);
    MEMORY[0x24263A588](v35, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v48 = objc_msgSend(v25, p_name[322]);
  v49 = (uint64_t)v75;
  v50 = v72;
  v51 = (void *)sub_23DA9BAA0();
  v52 = objc_msgSend(v48, sel_fileExistsAtPath_, v51);

  if ((v52 & 1) == 0)
  {
    v57 = objc_msgSend(v25, p_name[322]);
    v58 = (void *)sub_23DA9BAA0();
    if (v74 >> 60 == 15)
      v59 = 0;
    else
      v59 = (void *)sub_23DA9B71C();
    v60 = objc_msgSend(v57, sel_createFileAtPath_contents_attributes_, v58, v59, 0);

    swift_bridgeObjectRetain();
    if (v60)
    {
      swift_bridgeObjectRetain();
      v53 = sub_23DA9B848();
      v61 = sub_23DA9BCA4();
      if (os_log_type_enabled(v53, v61))
      {
        v62 = (uint8_t *)swift_slowAlloc();
        v63 = (void *)swift_slowAlloc();
        v77[0] = v63;
        *(_DWORD *)v62 = 136315138;
        swift_bridgeObjectRetain();
        v76 = sub_23DA6701C(v49, v50, (uint64_t *)v77);
        sub_23DA9BD58();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23DA5F000, v53, v61, "[HGFileUtil] Empty file created at %s", v62, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24263A588](v63, -1, -1);
        MEMORY[0x24263A588](v62, -1, -1);

        goto LABEL_25;
      }
LABEL_24:

      swift_bridgeObjectRelease_n();
      goto LABEL_25;
    }
    v64 = sub_23DA9B848();
    v65 = sub_23DA9BC98();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      v67 = (void *)swift_slowAlloc();
      v77[0] = v67;
      *(_DWORD *)v66 = 136315138;
      swift_bridgeObjectRetain();
      v76 = sub_23DA6701C(v49, v50, (uint64_t *)v77);
      sub_23DA9BD58();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23DA5F000, v64, v65, "[HGFileUtil] Error creating file at %s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v67, -1, -1);
      MEMORY[0x24263A588](v66, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  swift_bridgeObjectRetain_n();
  v53 = sub_23DA9B848();
  v54 = sub_23DA9BCA4();
  if (!os_log_type_enabled(v53, v54))
    goto LABEL_24;
  v55 = (uint8_t *)swift_slowAlloc();
  v56 = (void *)swift_slowAlloc();
  v77[0] = v56;
  *(_DWORD *)v55 = 136315138;
  swift_bridgeObjectRetain();
  v76 = sub_23DA6701C(v49, v50, (uint64_t *)v77);
  sub_23DA9BD58();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_23DA5F000, v53, v54, "[HGFileUtil] File already exists at %s", v55, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24263A588](v56, -1, -1);
  MEMORY[0x24263A588](v55, -1, -1);

LABEL_25:
  v68 = (void *)sub_23DA9BAA0();
  swift_bridgeObjectRelease();
  v69 = objc_msgSend((id)objc_opt_self(), sel_fileHandleForWritingAtPath_, v68);

  return v69;
}

unint64_t sub_23DA7125C()
{
  unint64_t result;

  result = qword_256CDC018;
  if (!qword_256CDC018)
  {
    result = MEMORY[0x24263A4F8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256CDC018);
  }
  return result;
}

void sub_23DA712A0(void *a1, unint64_t a2, void *a3, char a4)
{
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20[3];

  v20[2] = *(id *)MEMORY[0x24BDAC8D0];
  sub_23DA9BC74();
  if (a2 >> 60 != 15)
  {
    v20[0] = a1;
    v20[1] = (id)a2;
    sub_23DA71580((uint64_t)a1, a2);
    sub_23DA715C4();
    sub_23DA9BC68();
    sub_23DA71608((uint64_t)a1, a2);
  }
  if ((a4 & 1) != 0)
  {
    v20[0] = 0;
    if (objc_msgSend(a3, sel_closeAndReturnError_, v20))
    {
      v17 = v20[0];
    }
    else
    {
      v18 = v20[0];
      v19 = (void *)sub_23DA9B680();

      swift_willThrow();
      if (qword_256CDAFF0 != -1)
        swift_once();
      v8 = sub_23DA9B860();
      __swift_project_value_buffer(v8, (uint64_t)qword_256CE1558);
      v9 = v19;
      v10 = v19;
      v11 = sub_23DA9B848();
      v12 = sub_23DA9BC98();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        v14 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v13 = 138412290;
        v15 = v19;
        v16 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v20[0] = v16;
        sub_23DA9BD58();
        *v14 = v16;

        _os_log_impl(&dword_23DA5F000, v11, v12, "[HGDataCollector] Error when trying to write to file %@", v13, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD10);
        swift_arrayDestroy();
        MEMORY[0x24263A588](v14, -1, -1);
        MEMORY[0x24263A588](v13, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_23DA71580(uint64_t a1, unint64_t a2)
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

unint64_t sub_23DA715C4()
{
  unint64_t result;

  result = qword_256CDC020;
  if (!qword_256CDC020)
  {
    result = MEMORY[0x24263A4F8](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256CDC020);
  }
  return result;
}

uint64_t sub_23DA71608(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23DA7161C(a1, a2);
  return a1;
}

uint64_t sub_23DA7161C(uint64_t a1, unint64_t a2)
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

uint64_t sub_23DA71660()
{
  id v0;
  uint64_t ObjCClassFromMetadata;
  void *v2;
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v25 = (id)objc_opt_self();
  v0 = objc_msgSend(v25, sel_defaultManager);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = objc_msgSend(v3, sel_bundlePath);

  sub_23DA9BAC4();
  swift_bridgeObjectRetain();
  sub_23DA9BB54();
  sub_23DA9BB24();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_23DA9BAA0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v0, sel_fileExistsAtPath_, v5);

  v7 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = v7;
  if (v6)
  {
LABEL_6:
    v19 = objc_msgSend(v7, sel_bundlePath);

    sub_23DA9BAC4();
    swift_bridgeObjectRetain();
    v27 = sub_23DA9BB54();
    sub_23DA9BB24();
    swift_bridgeObjectRelease();
    return v27;
  }
  v9 = objc_msgSend(v7, sel_resourcePath);

  if (!v9)
  {
LABEL_5:
    v14 = objc_msgSend(v25, sel_defaultManager);
    v15 = objc_msgSend(v2, sel_mainBundle);
    v16 = objc_msgSend(v15, sel_bundlePath);

    sub_23DA9BAC4();
    swift_bridgeObjectRetain();
    sub_23DA9BB54();
    sub_23DA9BB24();
    swift_bridgeObjectRelease();
    v17 = (void *)sub_23DA9BAA0();
    swift_bridgeObjectRelease();
    v18 = objc_msgSend(v14, sel_fileExistsAtPath_, v17);

    v7 = objc_msgSend(v2, sel_mainBundle);
    v8 = v7;
    if (!v18)
    {
      v21 = objc_msgSend(v7, sel_resourcePath);

      if (v21)
      {
        sub_23DA9BAC4();

        swift_bridgeObjectRetain();
        v28 = sub_23DA9BB54();
        sub_23DA9BB24();
        swift_bridgeObjectRelease();
        v10 = v28;
        v22 = objc_msgSend(v25, sel_defaultManager);
        v23 = (void *)sub_23DA9BAA0();
        v24 = objc_msgSend(v22, sel_fileExistsAtPath_, v23);

        if (v24)
          return v10;
        swift_bridgeObjectRelease();
      }
      return 0;
    }
    goto LABEL_6;
  }
  sub_23DA9BAC4();

  swift_bridgeObjectRetain();
  v26 = sub_23DA9BB54();
  sub_23DA9BB24();
  swift_bridgeObjectRelease();
  v10 = v26;
  v11 = objc_msgSend(v25, sel_defaultManager);
  v12 = (void *)sub_23DA9BAA0();
  v13 = objc_msgSend(v11, sel_fileExistsAtPath_, v12);

  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  return v10;
}

unint64_t sub_23DA71C0C()
{
  uint64_t v0;

  sub_23DA9BDE8();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager), sel_isDeviceMotionActive);
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  return 0xD00000000000001BLL;
}

id sub_23DA71D20()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager), sel_setDelegate_, v0);
}

void sub_23DA71D3C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t aBlock[6];

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager);
  if (objc_msgSend(v1, sel_isDeviceMotionAvailable)
    && (objc_msgSend(v1, sel_isDeviceMotionActive) & 1) == 0)
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v2 = sub_23DA9B860();
    __swift_project_value_buffer(v2, (uint64_t)qword_256CE1558);
    v3 = sub_23DA9B848();
    v4 = sub_23DA9BCA4();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      aBlock[0] = v6;
      *(_DWORD *)v5 = 136315138;
      sub_23DA6701C(0x29287472617473, 0xE700000000000000, aBlock);
      sub_23DA9BD58();
      _os_log_impl(&dword_23DA5F000, v3, v4, "HGHeadphoneMotionManager:%s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v6, -1, -1);
      MEMORY[0x24263A588](v5, -1, -1);
    }

    v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue);
    v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_23DA72780;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23DA9A7A4;
    aBlock[3] = (uint64_t)&block_descriptor_1;
    v9 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v1, sel_startDeviceMotionUpdatesToQueue_withHandler_, v7, v9);
    _Block_release(v9);
    v10 = sub_23DA9B848();
    v11 = sub_23DA9BCA4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23DA5F000, v10, v11, "HGHeadphoneMotionManager: started", v12, 2u);
      MEMORY[0x24263A588](v12, -1, -1);
    }

  }
}

void sub_23DA71FF4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _OWORD v28[6];
  _OWORD v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];
  _OWORD v37[6];
  _OWORD v38[2];

  v6 = sub_23DA9B7DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v10 = a2;
    if (qword_256CDAFF0 != -1)
      swift_once();
    v11 = sub_23DA9B860();
    __swift_project_value_buffer(v11, (uint64_t)qword_256CE1558);
    v12 = a2;
    v13 = a2;
    v27 = sub_23DA9B848();
    v14 = sub_23DA9BC98();
    if (os_log_type_enabled(v27, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      *(_QWORD *)&v37[0] = v16;
      *(_DWORD *)v15 = 136315138;
      swift_getErrorValue();
      v17 = sub_23DA9BF80();
      *(_QWORD *)&v30 = sub_23DA6701C(v17, v18, (uint64_t *)v37);
      sub_23DA9BD58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DA5F000, v27, v14, "HeadPhoneMotionError: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v16, -1, -1);
      MEMORY[0x24263A588](v15, -1, -1);

    }
    else
    {

    }
  }
  else if (a1)
  {
    v19 = a3 + 16;
    v20 = a1;
    sub_23DA9B7B8();
    sub_23DA9B7A0();
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_23DA7CFC8(v20, (uint64_t)&v30, v22);

    swift_beginAccess();
    v23 = MEMORY[0x24263A5E8](v19);
    if (v23)
    {
      v24 = (void *)v23;
      v37[4] = v34;
      v37[5] = v35;
      v38[0] = v36[0];
      *(_OWORD *)((char *)v38 + 9) = *(_OWORD *)((char *)v36 + 9);
      v37[0] = v30;
      v37[1] = v31;
      v37[2] = v32;
      v37[3] = v33;
      sub_23DA9B890();
      v28[4] = v34;
      v28[5] = v35;
      v29[0] = v36[0];
      *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)((char *)v36 + 9);
      v28[0] = v30;
      v28[1] = v31;
      v28[2] = v32;
      v28[3] = v33;
      nullsub_1(v28);
      v25 = (uint64_t)v24 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
      sub_23DA6425C((uint64_t)v24 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v37);
      sub_23DA6425C((uint64_t)v28, v25);
      sub_23DA736E8((uint64_t)v37);

    }
  }
}

void sub_23DA72360()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;

  if (qword_256CDAFF0 != -1)
    swift_once();
  v1 = sub_23DA9B860();
  __swift_project_value_buffer(v1, (uint64_t)qword_256CE1558);
  v2 = sub_23DA9B848();
  v3 = sub_23DA9BCA4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    sub_23DA6701C(0x2928706F7473, 0xE600000000000000, &v9);
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v2, v3, "HGHeadphoneMotionManager:%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v5, -1, -1);
    MEMORY[0x24263A588](v4, -1, -1);
  }

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager), sel_stopDeviceMotionUpdates);
  v6 = sub_23DA9B848();
  v7 = sub_23DA9BCA4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23DA5F000, v6, v7, "HGHeadphoneMotionManager: stopped", v8, 2u);
    MEMORY[0x24263A588](v8, -1, -1);
  }

}

void sub_23DA72678()
{
  uint64_t v0;

}

id sub_23DA72688()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGHeadphoneMotionDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DA726CC()
{
  return type metadata accessor for HGHeadphoneMotionDataProvider();
}

uint64_t type metadata accessor for HGHeadphoneMotionDataProvider()
{
  uint64_t result;

  result = qword_256CDC0B8;
  if (!qword_256CDC0B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA72710()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA7275C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23DA72780(void *a1, void *a2)
{
  uint64_t v2;

  sub_23DA71FF4(a1, a2, v2);
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

void sub_23DA727A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v2 = sub_23DA9B860();
  __swift_project_value_buffer(v2, (uint64_t)qword_256CE1558);
  v3 = sub_23DA9B848();
  v4 = sub_23DA9BCA4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v7 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_23DA6701C(0xD000000000000024, 0x800000023DAA0F70, &v7);
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v3, v4, "HGHeadphoneMotionManager:%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v6, -1, -1);
    MEMORY[0x24263A588](v5, -1, -1);
  }

  *(_BYTE *)(v1 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_headphoneConnected) = 1;
}

void sub_23DA72924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v2 = sub_23DA9B860();
  __swift_project_value_buffer(v2, (uint64_t)qword_256CE1558);
  v3 = sub_23DA9B848();
  v4 = sub_23DA9BCA4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v7 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_23DA6701C(0xD000000000000027, 0x800000023DAA0F40, &v7);
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v3, v4, "HGHeadphoneMotionManager:%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v6, -1, -1);
    MEMORY[0x24263A588](v5, -1, -1);
  }

  *(_BYTE *)(v1 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_headphoneConnected) = 0;
}

void *static HGUtils.getCurrentModelVersion()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23DA9B6D4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = sub_23DA70370((uint64_t)v2);
  sub_23DA68CF4((uint64_t)v2);
  if (v4)
  {
    v5 = v4;
    v4 = (void *)sub_23DA6F060();
    v7 = v6;

    if (!v7)
      return 0;
  }
  return v4;
}

uint64_t _s12HeadGestures7HGUtilsV19headGestureToString0dE0SSSo06HGHeadE0V_tFZ_0(unint64_t a1)
{
  if (a1 > 2)
    return 0x6E776F6E6B6E55;
  else
    return *(_QWORD *)&aBackgrounod_1[8 * a1];
}

uint64_t _s12HeadGestures7HGUtilsV23headGesturePartToString0deF0SSSo06HGHeadeF0V_tFZ_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0x6E776F6E6B6E75;
  else
    return *(_QWORD *)&aNodup_1[8 * a1 - 8];
}

ValueMetadata *type metadata accessor for HGUtils()
{
  return &type metadata for HGUtils;
}

uint64_t sub_23DA72C0C()
{
  id *v0;
  id *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v1 = v0;
  sub_23DA9BDE8();
  sub_23DA9BB30();
  v2 = v0[2];
  v3 = objc_msgSend(v2, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v4 = v1[3];
  v5 = objc_msgSend(v4, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v6 = v1[4];
  v7 = objc_msgSend(v6, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v8 = v1[5];
  v9 = objc_msgSend(v8, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v10 = v1[6];
  v11 = objc_msgSend(v10, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v12 = v1[7];
  v13 = objc_msgSend(v12, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  return 0;
}

id sub_23DA72F1C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  BOOL v3;
  _QWORD *v6;

  v3 = a1 == 0x6E6F697461746F52 && a2 == 0xE900000000000058;
  if (v3 || (sub_23DA9BF5C() & 1) != 0)
  {
    v6 = v2 + 2;
    return objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6E6F697461746F52 && a2 == 0xE900000000000059 || (sub_23DA9BF5C() & 1) != 0)
  {
    v6 = v2 + 3;
    return objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6E6F697461746F52 && a2 == 0xE90000000000005ALL || (sub_23DA9BF5C() & 1) != 0)
  {
    v6 = v2 + 4;
    return objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6172656C65636341 && a2 == 0xED0000586E6F6974 || (sub_23DA9BF5C() & 1) != 0)
  {
    v6 = v2 + 5;
    return objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6172656C65636341 && a2 == 0xED0000596E6F6974 || (sub_23DA9BF5C() & 1) != 0)
  {
    v6 = v2 + 6;
    return objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6172656C65636341 && a2 == 0xED00005A6E6F6974 || (sub_23DA9BF5C() & 1) != 0)
  {
    v6 = v2 + 7;
    return objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, *v6);
  }
  return 0;
}

uint64_t sub_23DA73210()
{
  id *v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMLInput()
{
  return objc_opt_self();
}

uint64_t sub_23DA7327C()
{
  return sub_23DA72C0C();
}

uint64_t sub_23DA7329C()
{
  uint64_t inited;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBF60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DA9D8C0;
  *(_QWORD *)(inited + 32) = 0x6E6F697461746F52;
  *(_QWORD *)(inited + 40) = 0xE900000000000058;
  *(_QWORD *)(inited + 48) = 0x6E6F697461746F52;
  *(_QWORD *)(inited + 56) = 0xE900000000000059;
  *(_QWORD *)(inited + 64) = 0x6E6F697461746F52;
  *(_QWORD *)(inited + 72) = 0xE90000000000005ALL;
  strcpy((char *)(inited + 80), "AccelerationX");
  *(_WORD *)(inited + 94) = -4864;
  strcpy((char *)(inited + 96), "AccelerationY");
  *(_WORD *)(inited + 110) = -4864;
  strcpy((char *)(inited + 112), "AccelerationZ");
  *(_WORD *)(inited + 126) = -4864;
  v1 = sub_23DA9B428(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

uint64_t sub_23DA73390(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23DA73398(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23DA733A0()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23DA73410()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD28);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor])
  {
    swift_retain();
    sub_23DA9B878();
    swift_release();
  }
  *(_QWORD *)&v0[v5] = 0;
  swift_release();
  sub_23DA75290();
  v6 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v7 = sub_23DA9BD28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
  v8 = sub_23DA9BD10();

  sub_23DA752CC((uint64_t)v4);
  v14 = v8;
  sub_23DA9BD04();
  sub_23DA7530C();
  v9 = sub_23DA9B8A8();
  swift_release();
  v14 = v9;
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  v10 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC340);
  sub_23DA638A0(&qword_256CDC348, &qword_256CDC340, MEMORY[0x24BDB9510]);
  v11 = sub_23DA9B9F8();
  swift_release();
  swift_release();
  *(_QWORD *)&v1[v5] = v11;
  return swift_release();
}

uint64_t sub_23DA73600@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23DA7367C(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_23DA9B8FC();
}

uint64_t sub_23DA736E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  double v16;
  _QWORD **v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  double v22;
  _QWORD *v23;
  unint64_t v24;
  double *v25;
  double v26;
  uint64_t v27;
  unint64_t v28;
  double *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[104];
  double v35;
  _BYTE v36[104];
  double v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v2 = v1;
  sub_23DA6425C(a1, (uint64_t)v40);
  sub_23DA6425C((uint64_t)v40, (uint64_t)v42);
  sub_23DA6425C(a1, (uint64_t)v41);
  if (sub_23DA642A4((uint64_t)v41) == 1)
  {
    sub_23DA6425C(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v38);
    sub_23DA6425C((uint64_t)v38, (uint64_t)v39);
    result = sub_23DA642A4((uint64_t)v39);
    if ((_DWORD)result != 1)
    {
      if (qword_256CDAFF0 != -1)
        swift_once();
      v5 = sub_23DA9B860();
      __swift_project_value_buffer(v5, (uint64_t)qword_256CE1558);
      v6 = sub_23DA9B848();
      v7 = sub_23DA9BCA4();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_23DA5F000, v6, v7, "HGMotionDataProvider started receiving sensor data...", v8, 2u);
        MEMORY[0x24263A588](v8, -1, -1);
      }

      if (qword_256CDAFE0 != -1)
        swift_once();
      v9 = qword_256CE1520;
      type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(0);
      swift_allocObject();
      sub_23DA9B7B8();
      swift_beginAccess();
      v10 = swift_retain();
      MEMORY[0x242639B44](v10);
      if (*(_QWORD *)((*(_QWORD *)(v9 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v9 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
        sub_23DA9BBCC();
      sub_23DA9BBE4();
      sub_23DA9BBC0();
      swift_endAccess();
      swift_release();
      return sub_23DA73410();
    }
    return result;
  }
  sub_23DA6425C(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v38);
  sub_23DA6425C((uint64_t)v38, (uint64_t)v39);
  if (sub_23DA642A4((uint64_t)v39) == 1)
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v11 = sub_23DA9B860();
    __swift_project_value_buffer(v11, (uint64_t)qword_256CE1558);
    v12 = sub_23DA9B848();
    v13 = sub_23DA9BCA4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23DA5F000, v12, v13, "HGMotionDataProvider data stream stopped...", v14, 2u);
      MEMORY[0x24263A588](v14, -1, -1);
    }

    v15 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor;
    if (*(_QWORD *)(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor))
    {
      swift_retain();
      sub_23DA9B878();
      swift_release();
    }
    *(_QWORD *)(v2 + v15) = 0;
    return swift_release();
  }
  sub_23DA6425C((uint64_t)v42, (uint64_t)v34);
  sub_23DA6425C((uint64_t)v38, (uint64_t)v36);
  v16 = v37 - v35;
  v17 = (_QWORD **)(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_samplingRatePool);
  swift_beginAccess();
  v18 = *v17;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v17 = v18;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v18 = sub_23DA745B0(0, v18[2] + 1, 1, v18);
    *v17 = v18;
  }
  v21 = v18[2];
  v20 = v18[3];
  v22 = 1.0 / v16;
  if (v21 >= v20 >> 1)
  {
    v18 = sub_23DA745B0((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
    *v17 = v18;
  }
  v18[2] = v21 + 1;
  *(double *)&v18[v21 + 4] = v22;
  v23 = *v17;
  result = swift_endAccess();
  v24 = v23[2];
  if (v24 >= 0xA)
  {
    v25 = (double *)(v23 + 5);
    v26 = 0.0;
    v27 = v24 & 0x7FFFFFFFFFFFFFFELL;
    do
    {
      v26 = v26 + *(v25 - 1) + *v25;
      v25 += 2;
      v27 -= 2;
    }
    while (v27);
    v28 = v24 - (v24 & 0x7FFFFFFFFFFFFFFELL);
    if (v28)
    {
      v29 = (double *)&v23[2 * (v24 >> 1) + 4];
      do
      {
        v30 = *v29++;
        v26 = v26 + v30;
        --v28;
      }
      while (v28);
    }
    v31 = v26 / (double)(uint64_t)v24;
    *v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    if (qword_256CDAFE0 != -1)
      swift_once();
    v32 = qword_256CE1520;
    type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(0);
    *(double *)(swift_allocObject()
              + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager21HGCASamplingRateEvent_currentSamplingRate) = v31;
    sub_23DA9B7B8();
    swift_beginAccess();
    v33 = swift_retain();
    MEMORY[0x242639B44](v33);
    if (*(_QWORD *)((*(_QWORD *)(v32 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v32 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
      sub_23DA9BBCC();
    sub_23DA9BBE4();
    sub_23DA9BBC0();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

char *sub_23DA73C78()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;
  _BYTE v24[136];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC310);
  v21 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB350);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataSubject;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC318);
  swift_allocObject();
  v9 = v0;
  *(_QWORD *)&v0[v8] = sub_23DA9B89C();
  v10 = &v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider__isStreamingData];
  v24[0] = 0;
  sub_23DA9B8C0();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v4);
  *(_QWORD *)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataPublisher] = 0;
  v11 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue;
  *(_QWORD *)&v9[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  *(_QWORD *)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_samplingRatePool] = MEMORY[0x24BEE4AF8];
  v12 = (uint64_t)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion];
  sub_23DA642C0((uint64_t)v24);
  sub_23DA6425C((uint64_t)v24, v12);

  v13 = (objc_class *)type metadata accessor for HGMotionDataProvider();
  v23.receiver = v9;
  v23.super_class = v13;
  v14 = (char *)objc_msgSendSuper2(&v23, sel_init);
  v15 = *(void **)&v14[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue];
  v16 = v14;
  objc_msgSend(v15, sel_setMaxConcurrentOperationCount_, 1);
  v22 = *(_QWORD *)&v16[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataSubject];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_23DA638A0(&qword_256CDC320, &qword_256CDC318, MEMORY[0x24BDB9CB0]);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23DA9B92C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_23DA638A0(&qword_256CDC328, &qword_256CDC310, MEMORY[0x24BDB9568]);
  v17 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v1);
  *(_QWORD *)&v16[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataPublisher] = v17;
  v18 = swift_release();
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v16) + 0x130))(v18);

  return v16;
}

void sub_23DA73FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x24263A5E8](v2);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0x138))();

  }
}

void sub_23DA74038(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x24263A5E8](v1);
  if (v2)
  {
    v3 = v2;
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x140))();

  }
}

uint64_t sub_23DA740C0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  double v5;
  double v6;
  id v7;
  id v8;
  _BYTE v9[128];
  _BYTE v10[128];
  _BYTE v11[128];
  _BYTE v12[112];
  double v13;

  v3 = (uint64_t)a2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
  sub_23DA6425C((uint64_t)a2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v11);
  sub_23DA6425C((uint64_t)v11, (uint64_t)v12);
  result = sub_23DA642A4((uint64_t)v12);
  if ((_DWORD)result != 1)
  {
    v5 = v13;
    sub_23DA9B7A0();
    if (vabdd_f64(v5, v6) <= 1.0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v10[0] = 1;
      v8 = a2;
    }
    else
    {
      sub_23DA642C0((uint64_t)v9);
      sub_23DA6425C(v3, (uint64_t)v10);
      sub_23DA6425C((uint64_t)v9, v3);
      sub_23DA736E8(v10);
      swift_getKeyPath();
      swift_getKeyPath();
      v7 = a2;
    }
    return sub_23DA9B8FC();
  }
  return result;
}

void sub_23DA741E4()
{
  sub_23DA9BE48();
  __break(1u);
}

void sub_23DA7423C()
{
  sub_23DA9BE48();
  __break(1u);
}

void sub_23DA74294()
{
  sub_23DA9BE48();
  __break(1u);
}

id sub_23DA742EC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGMotionDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DA743B4()
{
  return type metadata accessor for HGMotionDataProvider();
}

uint64_t type metadata accessor for HGMotionDataProvider()
{
  uint64_t result;

  result = qword_256CDC2D8;
  if (!qword_256CDC2D8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DA743F8()
{
  unint64_t v0;

  sub_23DA68B1C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

_QWORD *sub_23DA744A4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC360);
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
    sub_23DA74CF0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DA745B0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC2E8);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23DA74DD8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DA746BC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC308);
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
    sub_23DA74EC0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DA747C8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC300);
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
    sub_23DA74EC0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23DA748D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC358);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_23DA74FA8(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DA749E0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC2F8);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23DA74DD8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DA74AEC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC350);
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
    sub_23DA75090(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23DA74BF8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC2F0);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23DA75178(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_23DA74CF0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + (a1 << 7) + 32);
    v6 = v4 << 7;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

char *sub_23DA74DD8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

char *sub_23DA74EC0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 32 * a1 + 32);
    v6 = 32 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

char *sub_23DA74FA8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

char *sub_23DA75090(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

char *sub_23DA75178(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA7525C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_23DA75280(uint64_t a1)
{
  uint64_t v1;

  sub_23DA73FD0(a1, v1);
}

void sub_23DA75288()
{
  uint64_t v0;

  sub_23DA74038(v0);
}

unint64_t sub_23DA75290()
{
  unint64_t result;

  result = qword_256CDC330;
  if (!qword_256CDC330)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDC330);
  }
  return result;
}

uint64_t sub_23DA752CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23DA7530C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDC338;
  if (!qword_256CDC338)
  {
    v1 = sub_23DA9BD04();
    result = MEMORY[0x24263A4F8](MEMORY[0x24BDD01B0], v1);
    atomic_store(result, (unint64_t *)&qword_256CDC338);
  }
  return result;
}

uint64_t sub_23DA75354()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23DA75378(uint64_t a1)
{
  uint64_t v1;

  return sub_23DA740C0(a1, *(void **)(v1 + 16));
}

uint64_t sub_23DA75388(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];
  _OWORD v25[2];
  uint64_t v26;

  v3 = sub_23DA9BA04();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v22 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BA1C();
  v20 = *(_QWORD *)(v7 - 8);
  v21 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine;
  v11 = objc_allocWithZone(MEMORY[0x24BDB1800]);
  swift_retain();
  *(_QWORD *)(v1 + v10) = objc_msgSend(v11, sel_init);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo) = 3;
  swift_beginAccess();
  sub_23DA97E10(v25);
  v12 = v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager;
  v13 = v25[1];
  *(_OWORD *)v12 = v25[0];
  *(_OWORD *)(v12 + 16) = v13;
  *(_QWORD *)(v12 + 32) = v26;
  swift_release();
  v14 = a1;
  v15 = sub_23DA63350(v14);

  v16 = *(void **)(v15 + 24);
  aBlock[4] = sub_23DA7895C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_24;
  v17 = _Block_copy(aBlock);
  swift_retain_n();
  v18 = v16;
  sub_23DA9BA10();
  v23 = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v9, v6, v17);
  swift_release();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v21);
  swift_release();
  return v15;
}

id sub_23DA75660()
{
  uint64_t v0;
  id v1;
  id result;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  result = *(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  objc_msgSend(result, sel_stop);
  result = *(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  objc_msgSend(result, sel_stop);
  result = *(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (result)
  {
    objc_msgSend(result, sel_stop);
    return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine), sel_stop);
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_23DA75718(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _BYTE *v13;
  void **v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  int v31;
  _BOOL4 v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  id *v45;
  void *v46;
  id v47;
  double v48;
  double v49;
  double v50;
  id v51;
  id v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  float v57;
  os_log_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  double v63;
  uint64_t v64;
  id v65;
  id v66;
  NSObject *v67;
  int v68;
  uint64_t v69;
  NSObject *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  id v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  float v80;
  os_log_t v81;
  os_log_t v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  os_log_t v88;
  uint64_t v89;
  os_log_t v90;
  id *v91;
  id v92;
  uint64_t v93;
  char *v94;
  Class isa;
  uint64_t aBlock[6];
  double v97;

  v2 = v1;
  v4 = sub_23DA9B818();
  isa = v4[-1].isa;
  MEMORY[0x24BDAC7A8](v4);
  v94 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DA9B860();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v85 - v11;
  v13 = (_BYTE *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  swift_beginAccess();
  if (*v13 != 1)
    return;
  v93 = v6;
  v14 = (void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager);
  v15 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 16);
  v16 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 24);
  v17 = objc_msgSend(a1, sel_headGesture);
  if (v17 != (id)2)
  {
    if (v17 != (id)1)
      goto LABEL_12;
    v16 = v15;
  }
  if (v16)
  {
    v90 = v4;
    v91 = (id *)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
    v18 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
    if (v18)
    {
      v19 = swift_allocObject();
      swift_weakInit();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = a1;
      *(_QWORD *)(v20 + 24) = v19;
      aBlock[4] = (uint64_t)sub_23DA788AC;
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_23DA76798;
      aBlock[3] = (uint64_t)&block_descriptor_14;
      v21 = _Block_copy(aBlock);
      v22 = v16;
      v23 = v18;
      v24 = a1;
      swift_release();
      v92 = v22;
      objc_msgSend(v23, sel_scheduleBuffer_completionCallbackType_completionHandler_, v22, 2, v21);
      _Block_release(v21);

      if (qword_256CDAFF0 != -1)
        swift_once();
      v25 = v93;
      v26 = __swift_project_value_buffer(v93, (uint64_t)qword_256CE1558);
      v27 = v7;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v26, v25);
      v28 = v24;
      swift_retain_n();
      v29 = v28;
      v30 = sub_23DA9B848();
      v31 = sub_23DA9BC8C();
      v32 = os_log_type_enabled(v30, (os_log_type_t)v31);
      v33 = v90;
      if (!v32)
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v25);
LABEL_29:
        v60 = v92;
        swift_getKeyPath();
        swift_getKeyPath();
        LOBYTE(aBlock[0]) = 0;
        swift_retain();
        sub_23DA9B8FC();
        v45 = v91;
LABEL_48:
        v83 = *v45;
        v84 = *v45;
        sub_23DA78208(v2, v83);

        return;
      }
      v34 = swift_slowAlloc();
      v35 = swift_slowAlloc();
      aBlock[0] = v35;
      *(_DWORD *)v34 = 136315650;
      v36 = (unint64_t)objc_msgSend(v29, sel_headGesture);
      v88 = v30;
      v87 = v31;
      v86 = v35;
      if (v36 > 2)
      {
        v38 = 0x6E776F6E6B6E55;
        v39 = 0xE700000000000000;
      }
      else
      {
        v37 = 8 * v36;
        v38 = *(_QWORD *)&aBackgrounod_2[8 * v36];
        v39 = *(_QWORD *)&aNd_2[v37];
      }
      v97 = COERCE_DOUBLE(sub_23DA6701C(v38, v39, aBlock));
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      v89 = v34 + 14;
      v52 = objc_msgSend(v29, sel_uuid);
      v53 = v94;
      sub_23DA9B800();

      sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v54 = sub_23DA9BF50();
      v56 = v55;
      (*((void (**)(char *, os_log_t))isa + 1))(v53, v33);
      v97 = COERCE_DOUBLE(sub_23DA6701C(v54, v56, aBlock));
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 2048;
      if (*v91)
      {
        objc_msgSend(*v91, sel_volume);
        v97 = v57;
        sub_23DA9BD58();
        swift_release_n();
        v58 = v88;
        _os_log_impl(&dword_23DA5F000, v88, (os_log_type_t)v87, "[Audio] Playing Audio feedback %s UUID: %s at volume %f", (uint8_t *)v34, 0x20u);
        v59 = v86;
        swift_arrayDestroy();
        MEMORY[0x24263A588](v59, -1, -1);
        MEMORY[0x24263A588](v34, -1, -1);

        (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v93);
        goto LABEL_29;
      }
      goto LABEL_53;
    }
    goto LABEL_51;
  }
LABEL_12:
  v41 = *v14;
  v40 = v14[1];
  v42 = (char *)objc_msgSend(a1, sel_headGesturePart);
  if ((unint64_t)(v42 - 1) < 2)
  {
    v40 = v41;
    v44 = v7;
    v43 = v93;
    if (!v40)
      return;
LABEL_18:
    v45 = (id *)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
    v46 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
    if (!v46)
    {
LABEL_52:
      __break(1u);
LABEL_53:
      swift_release();
      __break(1u);
LABEL_54:
      swift_release();
      __break(1u);
      return;
    }
    v47 = v40;
    objc_msgSend(v46, sel_scheduleBuffer_atTime_options_completionHandler_, v47, 0, 2, 0);
    if (objc_msgSend(a1, sel_headGesturePart) == (id)2)
    {
      v51 = *v45;
      if (*v45)
      {
        LODWORD(v48) = 0;
        LODWORD(v49) = -1110651699;
LABEL_36:
        LODWORD(v50) = LODWORD(v49);
        objc_msgSend(v51, sel_setPosition_, v48, v49, v50);
LABEL_37:
        v61 = *v45;
        if (*v45)
        {
          v92 = v47;
          v62 = v61;
          sub_23DA61DD0((uint64_t)objc_msgSend(a1, sel_headGesturePart));
          *(float *)&v63 = v63;
          objc_msgSend(v62, sel_setVolume_, v63);

          if (qword_256CDAFF0 != -1)
            swift_once();
          v64 = __swift_project_value_buffer(v43, (uint64_t)qword_256CE1558);
          (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v10, v64, v43);
          v65 = a1;
          swift_retain_n();
          v66 = v65;
          v67 = sub_23DA9B848();
          v68 = sub_23DA9BC8C();
          if (os_log_type_enabled(v67, (os_log_type_t)v68))
          {
            LODWORD(v89) = v68;
            v90 = v67;
            v69 = swift_slowAlloc();
            v70 = swift_slowAlloc();
            aBlock[0] = (uint64_t)v70;
            *(_DWORD *)v69 = 136315650;
            v71 = (char *)objc_msgSend(v66, sel_headGesturePart);
            v85 = v44;
            v88 = v70;
            if ((unint64_t)(v71 - 1) > 3)
            {
              v73 = 0x6E776F6E6B6E75;
              v74 = 0xE700000000000000;
            }
            else
            {
              v72 = 8 * (_QWORD)(v71 - 1);
              v73 = *(_QWORD *)&aNodup_2[v72];
              v74 = *(_QWORD *)&aShakelefshaker_1[v72 + 16];
            }
            v97 = COERCE_DOUBLE(sub_23DA6701C(v73, v74, aBlock));
            sub_23DA9BD58();

            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 12) = 2080;
            v91 = (id *)(v69 + 14);
            v75 = objc_msgSend(v66, sel_uuid);
            v76 = v94;
            sub_23DA9B800();

            sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
            v77 = sub_23DA9BF50();
            v79 = v78;
            (*((void (**)(char *, NSObject *))isa + 1))(v76, v4);
            v97 = COERCE_DOUBLE(sub_23DA6701C(v77, v79, aBlock));
            sub_23DA9BD58();

            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 22) = 2048;
            if (!*v45)
              goto LABEL_54;
            objc_msgSend(*v45, sel_volume);
            v97 = v80;
            sub_23DA9BD58();
            swift_release_n();
            v81 = v90;
            _os_log_impl(&dword_23DA5F000, v90, (os_log_type_t)v89, "[Audio] Playing Audio feedback %s UUID: %s at volume %f", (uint8_t *)v69, 0x20u);
            v82 = v88;
            swift_arrayDestroy();
            MEMORY[0x24263A588](v82, -1, -1);
            MEMORY[0x24263A588](v69, -1, -1);

            (*(void (**)(char *, uint64_t))(v85 + 8))(v10, v93);
          }
          else
          {

            swift_release_n();
            (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v43);
          }
          v60 = v92;
          goto LABEL_48;
        }
      }
    }
    else if (objc_msgSend(a1, sel_headGesturePart) == (id)1)
    {
      v51 = *v45;
      if (*v45)
      {
        LODWORD(v48) = 0;
        LODWORD(v49) = 1036831949;
        goto LABEL_36;
      }
    }
    else if (objc_msgSend(a1, sel_headGesturePart) == (id)3)
    {
      v51 = *v45;
      if (*v45)
      {
        LODWORD(v49) = 0;
        LODWORD(v48) = -1.0;
        goto LABEL_36;
      }
    }
    else
    {
      if (objc_msgSend(a1, sel_headGesturePart) != (id)4)
        goto LABEL_37;
      v51 = *v45;
      if (*v45)
      {
        LODWORD(v49) = 0;
        LODWORD(v48) = 1.0;
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v43 = v93;
  if (v42 == (char *)3 || v42 == (char *)4)
  {
    v44 = v7;
    if (v40)
      goto LABEL_18;
  }
}

uint64_t sub_23DA7619C(uint64_t a1, void *a2, uint64_t a3)
{
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
  uint64_t result;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  os_log_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t aBlock[6];
  uint64_t v54;

  v6 = sub_23DA9BA04();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DA9BA1C();
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v49 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DA9B818();
  v48 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23DA9B860();
  v15 = *(_QWORD *)(v14 - 8);
  result = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 2)
  {
    v47 = v6;
    v45 = a3 + 16;
    if (qword_256CDAFF0 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v14, (uint64_t)qword_256CE1558);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v19, v14);
    v20 = a2;
    v21 = sub_23DA9B848();
    v22 = sub_23DA9BC8C();
    v23 = os_log_type_enabled(v21, (os_log_type_t)v22);
    v46 = v7;
    if (v23)
    {
      v43 = v22;
      v44 = v21;
      v24 = swift_slowAlloc();
      v42 = swift_slowAlloc();
      aBlock[0] = v42;
      *(_DWORD *)v24 = 136315394;
      v25 = (unint64_t)objc_msgSend(v20, sel_headGesture);
      if (v25 > 2)
      {
        v28 = 0xE700000000000000;
        v27 = 0x6E776F6E6B6E55;
      }
      else
      {
        v26 = 8 * v25;
        v27 = *(_QWORD *)&aBackgrounod_2[8 * v25];
        v28 = *(_QWORD *)&aNd_2[v26];
      }
      v54 = sub_23DA6701C(v27, v28, aBlock);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      v29 = objc_msgSend(v20, sel_uuid, v24 + 14);
      sub_23DA9B800();

      sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v30 = sub_23DA9BF50();
      v32 = v31;
      (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
      v54 = sub_23DA6701C(v30, v32, aBlock);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      v33 = v44;
      _os_log_impl(&dword_23DA5F000, v44, (os_log_type_t)v43, "[Audio] Finished playing Audio feedback %s UUID: %s", (uint8_t *)v24, 0x16u);
      v34 = v42;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v34, -1, -1);
      MEMORY[0x24263A588](v24, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    sub_23DA6BCC0(0, (unint64_t *)&qword_256CDB3C8);
    v35 = (void *)sub_23DA9BCE0();
    v36 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    aBlock[4] = (uint64_t)sub_23DA788B4;
    aBlock[5] = v36;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23DA7ECA4;
    aBlock[3] = (uint64_t)&block_descriptor_18;
    v37 = _Block_copy(aBlock);
    swift_release();
    v38 = v49;
    sub_23DA9BA10();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_23DA63860((unint64_t *)&qword_256CDB358, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
    sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
    v39 = v52;
    v40 = v47;
    sub_23DA9BD88();
    MEMORY[0x242639C94](0, v38, v39, v37);
    _Block_release(v37);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v40);
    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v38, v51);
  }
  return result;
}

uint64_t sub_23DA76718()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_23DA9B8FC();
  }
  return result;
}

uint64_t sub_23DA76798(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_23DA767D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_23DA9BA04();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BA1C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(_QWORD *)(v1 + 24);
  aBlock[4] = sub_23DA78200;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_5;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_23DA9BA10();
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

void sub_23DA769A8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  v2 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (v2)
  {
    v4 = v2;
    sub_23DA77B14(v4, (uint64_t)nullsub_1, 0, 1.0);
    v5 = *(void **)(a1 + v1);
    v6 = v5;
    sub_23DA78208(a1, v5);

  }
}

uint64_t sub_23DA76A34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_23DA9BA04();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DA9BA1C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(_QWORD *)(v3 + 24);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v3;
  v15[3] = a1;
  v15[4] = a2;
  aBlock[4] = sub_23DA781DC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_2;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_23DA9BA10();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

void sub_23DA76C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v6;

  v3 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (v3)
  {
    v6 = v3;
    sub_23DA77B14(v6, a2, a3, 0.0);

  }
}

void sub_23DA76CA8(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  double v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  id v60[2];

  v60[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode;
  if (!*(_QWORD *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode))
    return;
  v3 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  if ((objc_msgSend(v3, sel_isRunning) & 1) != 0)
    return;
  v4 = *(void **)(a1 + v1);
  if (!v4)
  {
    __break(1u);
    goto LABEL_29;
  }
  v5 = v4;
  v6 = objc_msgSend(v3, sel_mainMixerNode);
  v7 = sub_23DA77920();
  objc_msgSend(v3, sel_connect_to_format_, v5, v6, v7);

  v8 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode;
  v9 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!v9)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v10 = *(void **)(a1 + v1);
  if (!v10)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v11 = a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager;
  v12 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager);
  if (!v12)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v13 = v9;
  v14 = v10;
  v15 = objc_msgSend(v12, sel_format);
  objc_msgSend(v3, sel_connect_to_format_, v13, v14, v15);

  v16 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode;
  v17 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!v17)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v18 = *(void **)(a1 + v1);
  if (!v18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v19 = *(void **)(v11 + 16);
  if (!v19)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v20 = v17;
  v21 = v18;
  v22 = objc_msgSend(v19, sel_format);
  objc_msgSend(v3, sel_connect_to_format_, v20, v21, v22);

  v23 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  v24 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (!v24)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v25 = v24;
  v26 = objc_msgSend(v3, sel_mainMixerNode);
  v27 = *(void **)(v11 + 32);
  if (!v27)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v28 = v26;
  v29 = objc_msgSend(*(id *)(v11 + 32), sel_format);
  objc_msgSend(v3, sel_connect_to_format_, v25, v28, v29);

  v30 = *(void **)(a1 + v8);
  if (!v30)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  objc_msgSend(v30, sel_setRenderingAlgorithm_, *(_QWORD *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo));
  v32 = *(void **)(a1 + v8);
  if (!v32)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  LODWORD(v31) = 1050253722;
  objc_msgSend(v32, sel_setReverbBlend_, v31);
  v36 = *(void **)(a1 + v1);
  if (!v36)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  LODWORD(v33) = 0;
  LODWORD(v34) = 0;
  LODWORD(v35) = 0;
  objc_msgSend(v36, sel_setListenerPosition_, v33, v34, v35);
  v40 = *(void **)(a1 + v16);
  if (!v40)
  {
LABEL_40:
    __break(1u);
    return;
  }
  LODWORD(v37) = 0;
  LODWORD(v38) = 0;
  LODWORD(v39) = 0;
  objc_msgSend(v40, sel_setPosition_, v37, v38, v39);
  v41 = *(void **)(a1 + v23);
  if (v41)
  {
    v42 = v27;
    v43 = v41;
    objc_msgSend(v43, sel_stop);
    objc_msgSend(v43, sel_scheduleBuffer_atTime_options_completionHandler_, v42, 0, 1, 0);
    LODWORD(v44) = 0;
    objc_msgSend(v43, sel_setVolume_, v44);

  }
  if (qword_256CDAFF0 != -1)
    swift_once();
  v45 = sub_23DA9B860();
  __swift_project_value_buffer(v45, (uint64_t)qword_256CE1558);
  v46 = sub_23DA9B848();
  v47 = sub_23DA9BC80();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_23DA5F000, v46, v47, "[HGAudioPlayer] Starting the audio engine", v48, 2u);
    MEMORY[0x24263A588](v48, -1, -1);
  }

  objc_msgSend(v3, sel_prepare);
  v60[0] = 0;
  if (objc_msgSend(v3, sel_startAndReturnError_, v60))
  {
    v49 = v60[0];
  }
  else
  {
    v50 = v60[0];
    v51 = (void *)sub_23DA9B680();

    swift_willThrow();
    v52 = v51;
    v53 = v51;
    v54 = sub_23DA9B848();
    v55 = sub_23DA9BC98();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      v57 = (void *)swift_slowAlloc();
      v60[0] = v57;
      *(_DWORD *)v56 = 136315138;
      swift_getErrorValue();
      v58 = sub_23DA9BF80();
      sub_23DA6701C(v58, v59, (uint64_t *)v60);
      sub_23DA9BD58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DA5F000, v54, v55, "[HGAudioPlayer] Unable to start the AudioEngine: %s", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v57, -1, -1);
      MEMORY[0x24263A588](v56, -1, -1);

    }
    else
    {

    }
  }
}

void sub_23DA772B4()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v1 = v0;
  v2 = (unsigned int *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  v3 = *v2;
  if ((_DWORD)v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_retrieveSessionWithID_, v3);
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine), sel_setAudioSession_, v4);
    if (qword_256CDAFF0 != -1)
      swift_once();
    v5 = sub_23DA9B860();
    __swift_project_value_buffer(v5, (uint64_t)qword_256CE1558);
    swift_retain();
    v6 = sub_23DA9B848();
    v7 = sub_23DA9BCA4();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 67109120;
      swift_beginAccess();
      sub_23DA9BD58();
      swift_release();
      _os_log_impl(&dword_23DA5F000, v6, v7, "[AudioSession] Attached session ID %u", v8, 8u);
      MEMORY[0x24263A588](v8, -1, -1);

    }
    else
    {

      swift_release();
      v6 = v4;
    }

  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1850]), sel_init);
  v10 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  v11 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode) = v9;

  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1850]), sel_init);
  v13 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode;
  v14 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode) = v12;

  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1850]), sel_init);
  v16 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode;
  v17 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode) = v15;

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1808]), sel_init);
  v19 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode;
  v20 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode) = v18;

  if (!*(_QWORD *)(v1 + v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  v21 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  objc_msgSend(v21, sel_attachNode_);
  if (!*(_QWORD *)(v1 + v13))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v21, sel_attachNode_);
  if (!*(_QWORD *)(v1 + v16))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(v21, sel_attachNode_);
  if (*(_QWORD *)(v1 + v10))
  {
    objc_msgSend(v21, sel_attachNode_);
    sub_23DA775F0();
    sub_23DA76CA8(v1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_23DA9B8FC();
    return;
  }
LABEL_16:
  __break(1u);
}

void sub_23DA775F0()
{
  uint64_t v0;
  id v1;
  unsigned int *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_handleAudioEngineConfigurationChangeWithNotification_, *MEMORY[0x24BDB1580], *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine));
  v2 = (unsigned int *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  v3 = *v2;
  if ((_DWORD)v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_retrieveSessionWithID_, v3);
    v5 = *MEMORY[0x24BDB15D8];
    v6 = v4;
    objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_handleInterruptionWithNotification_, v5, v6);

  }
}

id sub_23DA7770C(uint64_t a1)
{
  return sub_23DA77730(a1, "[HGAudioPlayer] Received Audio Session Interruption notification...");
}

id sub_23DA77724(uint64_t a1)
{
  return sub_23DA77730(a1, "[HGAudioPlayer] Received Audio Engine Configuration changed notification...");
}

id sub_23DA77730(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id result;

  v4 = v2;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v5 = sub_23DA9B860();
  __swift_project_value_buffer(v5, (uint64_t)qword_256CE1558);
  v6 = sub_23DA9B848();
  v7 = sub_23DA9BCA4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23DA5F000, v6, v7, a2, v8, 2u);
    MEMORY[0x24263A588](v8, -1, -1);
  }

  result = *(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(result, sel_stop);
  result = *(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  objc_msgSend(result, sel_stop);
  result = *(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (result)
  {
    objc_msgSend(result, sel_stop);
    return objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine), sel_stop);
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_23DA7787C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = sub_23DA9B62C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DA9B620();
  v9 = swift_retain();
  a4(v9);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_23DA77920()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  unsigned int v4;
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  v2 = objc_msgSend(v1, sel_mainMixerNode);
  v3 = objc_msgSend(v2, sel_outputFormatForBus_, 0);

  v4 = objc_msgSend(v3, sel_channelCount);
  v5 = objc_msgSend(v1, sel_mainMixerNode);
  v6 = objc_msgSend(v5, sel_outputFormatForBus_, 0);

  objc_msgSend(v6, sel_sampleRate);
  v8 = v7;

  if (v4 < 3)
  {
LABEL_3:
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1818]), sel_initStandardFormatWithSampleRate_channels_, 2, v8);
    if (!v10)
    {
      __break(1u);
LABEL_14:
      __break(1u);
      JUMPOUT(0x23DA77AFCLL);
    }
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v9 = 7077892;
    switch(v4)
    {
      case 3u:
        goto LABEL_3;
      case 4u:
        goto LABEL_10;
      case 5u:
        v9 = 7733253;
        goto LABEL_10;
      case 6u:
        v9 = 9109510;
        goto LABEL_10;
      case 7u:
        v9 = 9175047;
        goto LABEL_10;
      case 8u:
        v9 = 7274504;
        goto LABEL_10;
      default:
        v9 = 6619138;
LABEL_10:
        v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB17E8]), sel_initWithLayoutTag_, v9);
        if (!v13)
          goto LABEL_14;
        v14 = v13;
        v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1818]), sel_initStandardFormatWithSampleRate_channelLayout_, v13, v8);

        v12 = 3;
        break;
    }
  }
  *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo) = v12;
  return v11;
}

uint64_t sub_23DA77B14(void *a1, uint64_t a2, uint64_t a3, float a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;

  v5 = v4;
  v31 = a2;
  v32 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC5D8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD28);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC5E0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v4 + 32))
  {
    swift_retain();
    sub_23DA9B878();
    swift_release();
    *(_QWORD *)(v4 + 32) = 0;
    swift_release();
  }
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDC330);
  v18 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v19 = sub_23DA9BD28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 1, 1, v19);
  v20 = sub_23DA9BD10();

  sub_23DA6EA80((uint64_t)v13, &qword_256CDBD28);
  v34 = v20;
  sub_23DA9BD04();
  sub_23DA63860((unint64_t *)&qword_256CDC338, (uint64_t (*)(uint64_t))MEMORY[0x24BDD01C8], MEMORY[0x24BDD01B0]);
  v21 = sub_23DA9B8A8();
  swift_release();
  v34 = v21;
  v33 = *(id *)(v5 + 24);
  v22 = v33;
  v23 = sub_23DA9BCC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v10, 1, 1, v23);
  v24 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC340);
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDB3C8);
  sub_23DA638A0(&qword_256CDC348, &qword_256CDC340, MEMORY[0x24BDB9510]);
  sub_23DA788BC();
  sub_23DA9B9D4();
  sub_23DA6EA80((uint64_t)v10, &qword_256CDC5D8);

  swift_release();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = a1;
  *(float *)(v25 + 24) = a4;
  v26 = v31;
  v27 = v32;
  *(_QWORD *)(v25 + 32) = v5;
  *(_QWORD *)(v25 + 40) = v26;
  *(_QWORD *)(v25 + 48) = v27;
  sub_23DA638A0(&qword_256CDC5F0, &qword_256CDC5E0, MEMORY[0x24BDB9A08]);
  v28 = a1;
  swift_retain();
  swift_retain();
  v29 = sub_23DA9B9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  *(_QWORD *)(v5 + 32) = v29;
  return swift_release();
}

id sub_23DA77E9C(int a1, id a2, float a3, uint64_t a4, void (*a5)(id))
{
  id v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;

  v9 = objc_msgSend(a2, sel_volume);
  if (v10 == a3)
  {
    if (*(_QWORD *)(a4 + 32))
    {
      swift_retain();
      sub_23DA9B878();
      swift_release();
      *(_QWORD *)(a4 + 32) = 0;
      v9 = (id)swift_release();
    }
    a5(v9);
  }
  objc_msgSend(a2, sel_volume);
  v12 = v11;
  objc_msgSend(a2, sel_volume);
  v14 = *(float *)&v13 + -0.05;
  if ((float)(*(float *)&v13 + -0.05) <= a3)
    v14 = a3;
  *(float *)&v13 = *(float *)&v13 + 0.05;
  if (*(float *)&v13 > a3)
    *(float *)&v13 = a3;
  if (v12 >= a3)
    *(float *)&v13 = v14;
  return objc_msgSend(a2, sel_setVolume_, v13);
}

void sub_23DA77F88()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 8);
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 16);
  v3 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 24);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 32);

}

id *sub_23DA78028()
{
  id *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = sub_23DA62444();
  v1 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 8);
  v2 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 16);
  v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 24);
  v4 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 32);

  return v0;
}

uint64_t sub_23DA780D8()
{
  sub_23DA78028();
  return swift_deallocClassInstance();
}

uint64_t sub_23DA780F8()
{
  return type metadata accessor for HGCustomizedAudioPlayer();
}

uint64_t type metadata accessor for HGCustomizedAudioPlayer()
{
  uint64_t result;

  result = qword_256CDC390;
  if (!qword_256CDC390)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA7813C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA781B0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23DA781DC()
{
  uint64_t *v0;

  sub_23DA76C34(v0[2], v0[3], v0[4]);
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

void sub_23DA78200()
{
  uint64_t v0;

  sub_23DA769A8(v0);
}

void sub_23DA78208(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  double v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  id v63[2];

  v63[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode;
  if (!*(_QWORD *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode))
    return;
  v5 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  if ((objc_msgSend(v5, sel_isRunning) & 1) != 0)
  {
LABEL_24:
    objc_msgSend(a2, sel_play);
    return;
  }
  v62 = a2;
  v6 = *(void **)(a1 + v2);
  if (!v6)
  {

    __break(1u);
    goto LABEL_30;
  }
  v7 = v6;
  v8 = objc_msgSend(v5, sel_mainMixerNode);
  v9 = sub_23DA77920();
  objc_msgSend(v5, sel_connect_to_format_, v7, v8, v9);

  v10 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode;
  v11 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!v11)
  {
LABEL_30:

    __break(1u);
    goto LABEL_31;
  }
  v12 = *(void **)(a1 + v2);
  if (!v12)
  {
LABEL_31:

    __break(1u);
    goto LABEL_32;
  }
  v13 = a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager);
  if (!v14)
  {
LABEL_32:

    __break(1u);
    goto LABEL_33;
  }
  v15 = v12;
  v16 = v11;
  v17 = objc_msgSend(v14, sel_format);
  objc_msgSend(v5, sel_connect_to_format_, v16, v15, v17);

  v18 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode;
  v19 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!v19)
  {
LABEL_33:

    __break(1u);
    goto LABEL_34;
  }
  v20 = *(void **)(a1 + v2);
  if (!v20)
  {
LABEL_34:

    __break(1u);
    goto LABEL_35;
  }
  v21 = *(void **)(v13 + 16);
  if (!v21)
  {
LABEL_35:

    __break(1u);
    goto LABEL_36;
  }
  v22 = v20;
  v23 = v19;
  v24 = objc_msgSend(v21, sel_format);
  objc_msgSend(v5, sel_connect_to_format_, v23, v22, v24);

  v25 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  v26 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (!v26)
  {
LABEL_36:

    __break(1u);
    goto LABEL_37;
  }
  v27 = v26;
  v28 = objc_msgSend(v5, sel_mainMixerNode);
  v29 = *(void **)(v13 + 32);
  if (!v29)
  {
LABEL_37:

    __break(1u);
    goto LABEL_38;
  }
  v30 = v28;
  v31 = objc_msgSend(*(id *)(v13 + 32), sel_format);
  objc_msgSend(v5, sel_connect_to_format_, v27, v30, v31);

  v32 = *(void **)(a1 + v10);
  if (!v32)
  {
LABEL_38:

    __break(1u);
    goto LABEL_39;
  }
  objc_msgSend(v32, sel_setRenderingAlgorithm_, *(_QWORD *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo));
  v34 = *(void **)(a1 + v10);
  if (!v34)
  {
LABEL_39:

    __break(1u);
    goto LABEL_40;
  }
  LODWORD(v33) = 1050253722;
  objc_msgSend(v34, sel_setReverbBlend_, v33);
  v38 = *(void **)(a1 + v2);
  if (!v38)
  {
LABEL_40:

    __break(1u);
    goto LABEL_41;
  }
  LODWORD(v35) = 0;
  LODWORD(v36) = 0;
  LODWORD(v37) = 0;
  objc_msgSend(v38, sel_setListenerPosition_, v35, v36, v37);
  v42 = *(void **)(a1 + v18);
  if (!v42)
  {
LABEL_41:

    __break(1u);
    return;
  }
  LODWORD(v39) = 0;
  LODWORD(v40) = 0;
  LODWORD(v41) = 0;
  objc_msgSend(v42, sel_setPosition_, v39, v40, v41);
  v43 = *(void **)(a1 + v25);
  if (v43)
  {
    v44 = v29;
    v45 = v43;
    objc_msgSend(v45, sel_stop);
    objc_msgSend(v45, sel_scheduleBuffer_atTime_options_completionHandler_, v44, 0, 1, 0);
    LODWORD(v46) = 0;
    objc_msgSend(v45, sel_setVolume_, v46);

  }
  if (qword_256CDAFF0 != -1)
    swift_once();
  v47 = sub_23DA9B860();
  __swift_project_value_buffer(v47, (uint64_t)qword_256CE1558);
  v48 = sub_23DA9B848();
  v49 = sub_23DA9BC80();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    _os_log_impl(&dword_23DA5F000, v48, v49, "[HGAudioPlayer] Starting the audio engine", v50, 2u);
    MEMORY[0x24263A588](v50, -1, -1);
  }

  objc_msgSend(v5, sel_prepare);
  v63[0] = 0;
  if (objc_msgSend(v5, sel_startAndReturnError_, v63))
  {
    v51 = v63[0];
    a2 = v62;
    goto LABEL_24;
  }
  v52 = v63[0];
  v53 = (void *)sub_23DA9B680();

  swift_willThrow();
  v54 = v53;
  v55 = v53;
  v56 = sub_23DA9B848();
  v57 = sub_23DA9BC98();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    v59 = (void *)swift_slowAlloc();
    v63[0] = v59;
    *(_DWORD *)v58 = 136315138;
    swift_getErrorValue();
    v60 = sub_23DA9BF80();
    sub_23DA6701C(v60, v61, (uint64_t *)v63);
    sub_23DA9BD58();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23DA5F000, v56, v57, "[HGAudioPlayer] Unable to start the AudioEngine: %s", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v59, -1, -1);
    MEMORY[0x24263A588](v58, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_23DA7885C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DA78880()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DA788AC(uint64_t a1)
{
  uint64_t v1;

  return sub_23DA7619C(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23DA788B4()
{
  return sub_23DA76718();
}

unint64_t sub_23DA788BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDC5E8;
  if (!qword_256CDC5E8)
  {
    v1 = sub_23DA6BCC0(255, (unint64_t *)&qword_256CDB3C8);
    result = MEMORY[0x24263A4F8](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_256CDC5E8);
  }
  return result;
}

uint64_t sub_23DA78914()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

id sub_23DA78948(int a1)
{
  uint64_t v1;

  return sub_23DA77E9C(a1, *(id *)(v1 + 16), *(float *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_23DA78980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE v4[312];

  sub_23DA789D4(a1, v4);
  nullsub_1(v4);
  return sub_23DA79398((uint64_t)v4, a2, &qword_256CDC750);
}

void *sub_23DA789D4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  _QWORD **v10;
  double v11;
  double v12;
  double v13;
  float32x4_t v14;
  uint64_t v15;
  int64_t v16;
  float32x4_t *v17;
  unint64_t v18;
  uint64_t v19;
  float32x4_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  float32x4_t v31;
  int32x4_t v32;
  int8x16_t v33;
  float32x4_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v42;
  unint64_t v43;
  double *v44;
  _QWORD *v45;
  uint64_t v46;
  double *v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  double *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  __int128 v71;
  uint64_t v72;
  void *result;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  int64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  int64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  double v96;
  double v97;
  uint64_t v98;
  double *v99;
  double v100;
  double v101;
  uint64_t v102;
  double v103;
  double v104;
  uint64_t v105;
  double *v106;
  double v107;
  double v108;
  uint64_t v109;
  double v110;
  double v111;
  uint64_t v112;
  double *v113;
  double v114;
  double v115;
  uint64_t v116;
  double *v117;
  double v118;
  double v119;
  uint64_t v120;
  double *v121;
  double v122;
  double v123;
  uint64_t v124;
  double *v125;
  double v126;
  double v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  BOOL v131;
  double v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  float32x4_t v138;
  __int128 v139;
  uint64_t v140;
  uint64_t v141;
  float32x4_t v142;
  __int128 v143;
  __int128 v144;
  void *v145;
  uint64_t v146;
  _QWORD __src[39];
  _OWORD v148[6];
  _OWORD v149[3];

  v3 = v2;
  v6 = *(_OWORD *)(a1 + 80);
  v148[4] = *(_OWORD *)(a1 + 64);
  v148[5] = v6;
  v149[0] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v149 + 9) = *(_OWORD *)(a1 + 105);
  v7 = *(_OWORD *)(a1 + 16);
  v148[0] = *(_OWORD *)a1;
  v148[1] = v7;
  v8 = *(_OWORD *)(a1 + 48);
  v148[2] = *(_OWORD *)(a1 + 32);
  v148[3] = v8;
  v9 = *(double *)(a1 + 104);
  nullsub_1(v148);
  v142 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 24)), *(float64x2_t *)(a1 + 40));
  v10 = (_QWORD **)(v2 + 344);
  swift_beginAccess();
  v15 = *(_QWORD *)(v2 + 344);
  v16 = *(_QWORD *)(v15 + 16);
  v17 = (float32x4_t *)MEMORY[0x24BEE4AF8];
  if (v16)
  {
    __src[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23DA85684(0, v16, 0);
    v17 = (float32x4_t *)__src[0];
    v18 = *(_QWORD *)(__src[0] + 16);
    v19 = 48;
    do
    {
      v20 = *(float32x4_t *)(v15 + v19);
      __src[0] = v17;
      v21 = v17[1].u64[1];
      if (v18 >= v21 >> 1)
      {
        v138 = v20;
        sub_23DA85684(v21 > 1, v18 + 1, 1);
        v20 = v138;
        v17 = (float32x4_t *)__src[0];
      }
      v17[1].i64[0] = v18 + 1;
      v17[v18 + 2] = v20;
      v19 += 32;
      ++v18;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
  }
  sub_23DA81D3C(v17, v11, v12, v13, v14);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  swift_bridgeObjectRelease();
  v28.i32[0] = 0;
  v29.i32[0] = v27 & 1;
  v30 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v29, v28), 0);
  v29.i64[0] = v23;
  v29.i64[1] = v25;
  v31 = vmulq_f32((float32x4_t)vbslq_s8(v30, v29, (int8x16_t)v142), (float32x4_t)xmmword_23DA9DB50);
  v32 = (int32x4_t)vnegq_f32(v142);
  v33 = (int8x16_t)vtrn2q_s32((int32x4_t)v142, vtrn1q_s32((int32x4_t)v142, v32));
  v34 = (float32x4_t)vrev64q_s32((int32x4_t)v142);
  v34.i32[0] = v32.i32[1];
  v34.i32[3] = v32.i32[2];
  v35 = sub_23DA8200C(vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v142, (int8x16_t)v32, 8uLL), *(float32x2_t *)v31.f32, 1), (float32x4_t)vextq_s8(v33, v33, 8uLL), v31.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(v142, v31, 3), v34, v31, 2)));
  v37 = v36;
  v39 = v38;
  if ((*(_BYTE *)(v3 + 368) & 1) != 0)
  {
    swift_beginAccess();
    v40 = *v10;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v40;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v40 = sub_23DA747C8(0, v40[2] + 1, 1, v40);
      *v10 = v40;
    }
    v43 = v40[2];
    v42 = v40[3];
    if (v43 >= v42 >> 1)
    {
      v40 = sub_23DA747C8((_QWORD *)(v42 > 1), v43 + 1, 1, v40);
      *v10 = v40;
    }
    v40[2] = v43 + 1;
    v44 = (double *)&v40[4 * v43];
    v44[4] = v9;
    *((float32x4_t *)v44 + 3) = v142;
    v45 = *v10;
    swift_endAccess();
    v46 = v45[2];
    if (v46)
    {
      swift_bridgeObjectRetain();
      v47 = (double *)(v45 + 6);
      v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v52 = *(v47 - 2);
        if (v9 + -1.0 <= v52)
        {
          v143 = *(_OWORD *)v47;
          __src[0] = v48;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_23DA85668(0, v48[2] + 1, 1);
            v48 = (_QWORD *)__src[0];
          }
          v50 = v48[2];
          v49 = v48[3];
          if (v50 >= v49 >> 1)
          {
            sub_23DA85668(v49 > 1, v50 + 1, 1);
            v48 = (_QWORD *)__src[0];
          }
          v48[2] = v50 + 1;
          v51 = (double *)&v48[4 * v50];
          v51[4] = v52;
          *((_OWORD *)v51 + 3) = v143;
        }
        v47 += 4;
        --v46;
      }
      while (v46);
      swift_bridgeObjectRelease();
    }
    else
    {
      v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    *v10 = v48;
    swift_bridgeObjectRelease();
  }
  v53 = *(_QWORD *)(a1 + 56);
  v54 = *(_QWORD *)(a1 + 64);
  v55 = *(_QWORD *)(a1 + 72);
  v57 = *(_QWORD *)(a1 + 80);
  v56 = *(_QWORD *)(a1 + 88);
  v58 = (uint64_t *)(v3 + 352);
  v59 = *(_QWORD *)(a1 + 96);
  swift_beginAccess();
  v60 = *(_QWORD **)(v3 + 352);
  v61 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v3 + 352) = v60;
  v137 = v56;
  v135 = v59;
  if ((v61 & 1) == 0)
  {
    v60 = sub_23DA746BC(0, v60[2] + 1, 1, v60);
    *v58 = (uint64_t)v60;
  }
  v63 = v60[2];
  v62 = v60[3];
  if (v63 >= v62 >> 1)
  {
    v60 = sub_23DA746BC((_QWORD *)(v62 > 1), v63 + 1, 1, v60);
    *v58 = (uint64_t)v60;
  }
  v60[2] = v63 + 1;
  v64 = (double *)&v60[4 * v63];
  v64[4] = v9;
  *((_QWORD *)v64 + 5) = v53;
  *((_QWORD *)v64 + 6) = v54;
  *((_QWORD *)v64 + 7) = v55;
  v136 = v55;
  v65 = *v58;
  swift_endAccess();
  v66 = *(_QWORD *)(v65 + 16);
  if (v66)
  {
    swift_bridgeObjectRetain();
    v67 = (double *)(v65 + 48);
    v68 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v9 + -0.1 <= *(v67 - 2))
      {
        v144 = *((_OWORD *)v67 - 1);
        v139 = *(_OWORD *)v67;
        __src[0] = v68;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23DA8564C(0, *(_QWORD *)(v68 + 16) + 1, 1);
          v68 = __src[0];
        }
        v70 = *(_QWORD *)(v68 + 16);
        v69 = *(_QWORD *)(v68 + 24);
        v71 = v144;
        if (v70 >= v69 >> 1)
        {
          sub_23DA8564C(v69 > 1, v70 + 1, 1);
          v71 = v144;
          v68 = __src[0];
        }
        *(_QWORD *)(v68 + 16) = v70 + 1;
        v72 = v68 + 32 * v70;
        *(_OWORD *)(v72 + 32) = v71;
        *(_OWORD *)(v72 + 48) = v139;
      }
      v67 += 4;
      --v66;
    }
    while (v66);
    swift_bridgeObjectRelease();
  }
  else
  {
    v68 = MEMORY[0x24BEE4AF8];
  }
  *v58 = v68;
  result = (void *)swift_bridgeObjectRelease();
  v74 = *v58;
  v75 = *(_QWORD *)(*v58 + 16);
  v76 = MEMORY[0x24BEE4AF8];
  if (!v75)
  {
    v77 = MEMORY[0x24BEE4AF8];
    v90 = MEMORY[0x24BEE4AF8];
    goto LABEL_59;
  }
  v140 = v57;
  v145 = a2;
  __src[0] = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_23DA85630(0, v75, 0);
  v77 = __src[0];
  v78 = *(_QWORD *)(__src[0] + 16);
  v79 = 40;
  do
  {
    v80 = *(_QWORD *)(v74 + v79);
    __src[0] = v77;
    v81 = *(_QWORD *)(v77 + 24);
    if (v78 >= v81 >> 1)
    {
      sub_23DA85630(v81 > 1, v78 + 1, 1);
      v77 = __src[0];
    }
    *(_QWORD *)(v77 + 16) = v78 + 1;
    *(_QWORD *)(v77 + 8 * v78 + 32) = v80;
    v79 += 32;
    ++v78;
    --v75;
  }
  while (v75);
  result = (void *)swift_bridgeObjectRelease();
  v82 = *v58;
  v83 = *(_QWORD *)(*v58 + 16);
  v76 = MEMORY[0x24BEE4AF8];
  if (v83)
  {
    __src[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23DA85630(0, v83, 0);
    v76 = __src[0];
    v84 = *(_QWORD *)(__src[0] + 16);
    v85 = 48;
    do
    {
      v86 = *(_QWORD *)(v82 + v85);
      __src[0] = v76;
      v87 = *(_QWORD *)(v76 + 24);
      if (v84 >= v87 >> 1)
      {
        sub_23DA85630(v87 > 1, v84 + 1, 1);
        v76 = __src[0];
      }
      *(_QWORD *)(v76 + 16) = v84 + 1;
      *(_QWORD *)(v76 + 8 * v84 + 32) = v86;
      v85 += 32;
      ++v84;
      --v83;
    }
    while (v83);
    result = (void *)swift_bridgeObjectRelease();
    v88 = *v58;
    v89 = *(_QWORD *)(v88 + 16);
    v90 = MEMORY[0x24BEE4AF8];
    if (v89)
    {
      __src[0] = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_23DA85630(0, v89, 0);
      v90 = __src[0];
      v91 = *(_QWORD *)(__src[0] + 16);
      v92 = 56;
      a2 = v145;
      do
      {
        v93 = *(_QWORD *)(v88 + v92);
        __src[0] = v90;
        v94 = *(_QWORD *)(v90 + 24);
        if (v91 >= v94 >> 1)
        {
          sub_23DA85630(v94 > 1, v91 + 1, 1);
          v90 = __src[0];
        }
        *(_QWORD *)(v90 + 16) = v91 + 1;
        *(_QWORD *)(v90 + 8 * v91 + 32) = v93;
        v92 += 32;
        ++v91;
        --v89;
      }
      while (v89);
      result = (void *)swift_bridgeObjectRelease();
      goto LABEL_58;
    }
  }
  else
  {
    v90 = MEMORY[0x24BEE4AF8];
  }
  a2 = v145;
LABEL_58:
  v57 = v140;
LABEL_59:
  v95 = *(_QWORD *)(v77 + 16);
  if (!v95)
  {
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
    return result;
  }
  v96 = *(double *)(v77 + 32);
  v97 = v96;
  v98 = v95 - 1;
  if (v95 != 1)
  {
    v99 = (double *)(v77 + 40);
    v97 = *(double *)(v77 + 32);
    do
    {
      v100 = *v99++;
      v101 = v100;
      if (v100 < v97)
        v97 = v101;
      --v98;
    }
    while (v98);
  }
  v141 = v54;
  v146 = v53;
  v102 = *(_QWORD *)(v76 + 16);
  if (!v102)
    goto LABEL_96;
  v103 = *(double *)(v76 + 32);
  v104 = v103;
  v105 = v102 - 1;
  if (v102 != 1)
  {
    v106 = (double *)(v76 + 40);
    v104 = *(double *)(v76 + 32);
    do
    {
      v107 = *v106++;
      v108 = v107;
      if (v107 < v104)
        v104 = v108;
      --v105;
    }
    while (v105);
  }
  v133 = v39;
  v134 = v37;
  v109 = *(_QWORD *)(v90 + 16);
  if (!v109)
    goto LABEL_97;
  v110 = *(double *)(v90 + 32);
  v111 = v110;
  v112 = v109 - 1;
  if (v109 != 1)
  {
    v113 = (double *)(v90 + 40);
    v111 = *(double *)(v90 + 32);
    do
    {
      v114 = *v113++;
      v115 = v114;
      if (v114 < v111)
        v111 = v115;
      --v112;
    }
    while (v112);
  }
  v116 = v95 - 1;
  if (v116)
  {
    v117 = (double *)(v77 + 40);
    do
    {
      v118 = *v117++;
      v119 = v118;
      if (v96 < v118)
        v96 = v119;
      --v116;
    }
    while (v116);
  }
  v120 = v102 - 1;
  if (v102 != 1)
  {
    v121 = (double *)(v76 + 40);
    do
    {
      v122 = *v121++;
      v123 = v122;
      if (v103 < v122)
        v103 = v123;
      --v120;
    }
    while (v120);
  }
  v124 = v109 - 1;
  v132 = v35;
  if (v109 != 1)
  {
    v125 = (double *)(v90 + 40);
    do
    {
      v126 = *v125++;
      v127 = v126;
      if (v110 < v126)
        v110 = v127;
      --v124;
    }
    while (v124);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_23DA932D4(32, v9);
  swift_endAccess();
  v128 = *(_QWORD *)(v3 + 360);
  v129 = *(_QWORD *)(v128 + 16);
  v130 = 0.0;
  if (v129 == 32)
    v130 = 32.0 / (*(double *)(v128 + 280) - *(double *)(v128 + 32));
  v131 = v129 != 32;
  *(double *)__src = v9;
  LOBYTE(__src[1]) = 0;
  sub_23DA79398((uint64_t)v148, (uint64_t)&__src[2], &qword_256CDB590);
  *(double *)&__src[18] = v132;
  __src[19] = v134;
  __src[20] = v133;
  LOBYTE(__src[21]) = 0;
  __src[22] = v146;
  __src[23] = v141;
  __src[24] = v136;
  LOBYTE(__src[25]) = 0;
  __src[26] = v57;
  __src[27] = v137;
  __src[28] = v135;
  LOBYTE(__src[29]) = 0;
  *(double *)&__src[30] = v97;
  *(double *)&__src[31] = v104;
  *(double *)&__src[32] = v111;
  *(double *)&__src[33] = v96;
  *(double *)&__src[34] = v103;
  *(double *)&__src[35] = v110;
  LOBYTE(__src[36]) = 0;
  *(double *)&__src[37] = v130;
  LOBYTE(__src[38]) = v131;
  memcpy((void *)(v3 + 32), __src, 0x131uLL);
  return memcpy(a2, __src, 0x131uLL);
}

uint64_t sub_23DA79344()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMotionStateRecognizer()
{
  return objc_opt_self();
}

uint64_t sub_23DA79398(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HGError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HGError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DA794C8 + 4 * byte_23DA9DBFD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23DA794FC + 4 * byte_23DA9DBF8[v4]))();
}

uint64_t sub_23DA794FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA79504(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DA7950CLL);
  return result;
}

uint64_t sub_23DA79518(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DA79520);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23DA79524(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA7952C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA79538(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23DA79540(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HGError()
{
  return &type metadata for HGError;
}

BOOL sub_23DA79558(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23DA7956C()
{
  sub_23DA9BFBC();
  sub_23DA9BFC8();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA795B0()
{
  return sub_23DA9BFC8();
}

uint64_t sub_23DA795D8()
{
  sub_23DA9BFBC();
  sub_23DA9BFC8();
  return sub_23DA9BFD4();
}

unint64_t sub_23DA7962C()
{
  unint64_t result;

  result = qword_256CDC758;
  if (!qword_256CDC758)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9DC98, &type metadata for HGError);
    atomic_store(result, (unint64_t *)&qword_256CDC758);
  }
  return result;
}

uint64_t sub_23DA79670(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;

  v7 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle) = 0;
  if (a1)
  {
    v10 = a1;
    v11 = sub_23DA9BAD0();
    v13 = v12;
    swift_bridgeObjectRelease();
    if (v13 >> 60 != 15)
    {
      v15 = *(void **)(v5 + v7);
      *(_QWORD *)(v5 + v7) = a1;
      v16 = v10;

      v17 = (uint64_t *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_delimData);
      *v17 = v11;
      v17[1] = v13;
      v18 = v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding;
      v19 = sub_23DA9BAF4();
      v20 = *(_QWORD *)(v19 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, a4, v19);
      *(_QWORD *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_chunkSize) = a5;
      sub_23DA7A3F8(v11, v13);
      v21 = sub_23DA7A364(a5);
      v23 = v22;

      sub_23DA71608(v11, v13);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a4, v19);
      v24 = (uint64_t *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer);
      *v24 = v21;
      v24[1] = v23;
      *(_BYTE *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_atEof) = 0;
      return v5;
    }

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v14 = sub_23DA9BAF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a4, v14);

  type metadata accessor for StreamReader(0);
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_23DA79828()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle), sel_closeFile);
  v2 = *(void **)(v0 + v1);
  *(_QWORD *)(v0 + v1) = 0;

  v3 = v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding;
  v4 = sub_23DA9BAF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_23DA7161C(*(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_delimData), *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_delimData + 8));
  sub_23DA7161C(*(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer), *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer + 8));
  return swift_deallocClassInstance();
}

uint64_t sub_23DA798D4()
{
  return type metadata accessor for StreamReader(0);
}

uint64_t type metadata accessor for StreamReader(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDC788);
}

uint64_t sub_23DA798F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DA9BAF4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23DA79988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;

  v1 = v0;
  v2 = sub_23DA9BAF4();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v6 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle))
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v19 = sub_23DA9B860();
    __swift_project_value_buffer(v19, (uint64_t)qword_256CE1558);
    v20 = sub_23DA9B848();
    v21 = sub_23DA9BC98();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_23DA5F000, v20, v21, "HGFileDataReading error, Attempt to read from closed file", v22, 2u);
      MEMORY[0x24263A588](v22, -1, -1);
    }

    return 0;
  }
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_atEof) & 1) != 0)
    return 0;
  v30[1] = OBJC_IVAR____TtC12HeadGestures12StreamReader_atEof;
  v31 = v5;
  v32 = v3;
  v33 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer);
  v34 = OBJC_IVAR____TtC12HeadGestures12StreamReader_chunkSize;
  swift_beginAccess();
  v8 = *v7;
  v9 = v7[1];
  sub_23DA71580(*v7, v9);
  v10 = sub_23DA9B734();
  v12 = v11;
  v14 = v13;
  sub_23DA7161C(v8, v9);
  if ((v14 & 1) != 0)
  {
    v15 = *(void **)(v1 + v6);
    if (v15)
    {
      v16 = objc_msgSend(v15, sel_readDataOfLength_, *(_QWORD *)(v1 + v34));
      sub_23DA9B728();
      v18 = v17;

      __asm { BR              X9 }
    }
LABEL_18:
    __break(1u);
    JUMPOUT(0x23DA79DD0);
  }
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v24 = *v7;
  v23 = v7[1];
  sub_23DA71580(*v7, v23);
  v25 = sub_23DA9B74C();
  v27 = v26;
  sub_23DA7161C(v24, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, v1 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding, v32);
  v28 = sub_23DA9BADC();
  sub_23DA7161C(v25, v27);
  if (v12 < 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_beginAccess();
  sub_23DA9B704();
  swift_endAccess();
  return v28;
}

uint64_t sub_23DA79DF0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = sub_23DA9BA04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DA9BA1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v0;
  aBlock[4] = sub_23DA7A430;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_3;
  v10 = _Block_copy(aBlock);
  v11 = v0;
  sub_23DA9BA10();
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_23DA7A450();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA7A498();
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v8, v4, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_23DA79FA4(uint64_t result)
{
  uint64_t v1;
  uint64_t i;
  unint64_t v3;
  uint64_t v4;
  _BYTE v5[128];
  __int128 v6;
  _BYTE v7[128];

  if (*(_QWORD *)(result + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_streamReader))
  {
    v1 = result;
    swift_retain();
    for (i = sub_23DA79988(); v3; i = sub_23DA79988())
    {
      sub_23DA7D24C(i, v3, (uint64_t)v5);
      sub_23DA6425C((uint64_t)v5, (uint64_t)&v6);
      if (sub_23DA642A4((uint64_t)&v6) != 1)
      {
        sub_23DA9B890();
        v4 = v1 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
        sub_23DA6425C(v1 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v7);
        sub_23DA6425C((uint64_t)v5, v4);
        sub_23DA736E8((uint64_t)v7);
      }
    }
    sub_23DA9B884();
    return swift_release();
  }
  return result;
}

void sub_23DA7A0CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_streamReader);
  if (v1)
  {
    v2 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
    v3 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle);
    swift_retain();
    objc_msgSend(v3, sel_closeFile);
    v4 = *(id *)(v1 + v2);
    *(_QWORD *)(v1 + v2) = 0;
    swift_release();

  }
}

uint64_t sub_23DA7A154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v8;

  v1 = v0;
  v2 = sub_23DA9BAF4();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_fileHandle);
  v6 = v5;
  sub_23DA9BAE8();
  type metadata accessor for StreamReader(0);
  swift_allocObject();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_streamReader) = sub_23DA79670(v5, 10, 0xE100000000000000, (uint64_t)v4, 1024);
  return swift_release();
}

uint64_t sub_23DA7A240()
{
  uint64_t v0;

  return swift_release();
}

id sub_23DA7A27C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGFileDataProvider(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DA7A2F8()
{
  return type metadata accessor for HGFileDataProvider(0);
}

uint64_t type metadata accessor for HGFileDataProvider(uint64_t a1)
{
  return sub_23DA625B4(a1, (uint64_t *)&unk_256CDC8B8);
}

uint64_t sub_23DA7A314()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA7A364(uint64_t result)
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
      sub_23DA9B668();
      swift_allocObject();
      sub_23DA9B65C();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_23DA9B6F8();
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

uint64_t sub_23DA7A3F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23DA71580(a1, a2);
  return a1;
}

uint64_t sub_23DA7A40C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23DA7A430()
{
  uint64_t v0;

  return sub_23DA79FA4(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_23DA7A450()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDB358;
  if (!qword_256CDB358)
  {
    v1 = sub_23DA9BA04();
    result = MEMORY[0x24263A4F8](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256CDB358);
  }
  return result;
}

unint64_t sub_23DA7A498()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDB368;
  if (!qword_256CDB368)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256CDB360);
    result = MEMORY[0x24263A4F8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256CDB368);
  }
  return result;
}

uint64_t sub_23DA7A4E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v17 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA00);
  v18 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA08);
  v19 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9B7DC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(objc_allocWithZone((Class)HGHeadGestureResult), sel_init);
  objc_msgSend(v11, sel_setHeadGesture_, 4);
  objc_msgSend(v11, sel_setHeadGesturePart_, 0);
  sub_23DA9B7B8();
  v12 = (void *)sub_23DA9B770();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v11, sel_setTimestamp_, v12);

  v20 = v17;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA10);
  sub_23DA7BC00();
  sub_23DA638A0(&qword_256CDCA18, &qword_256CDCA10, MEMORY[0x24BDB9AF8]);
  sub_23DA9B920();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA20);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23DA9DD50;
  *(_QWORD *)(v13 + 32) = v11;
  v20 = v13;
  sub_23DA9BBC0();
  sub_23DA638A0(&qword_256CDCA28, &qword_256CDCA00, MEMORY[0x24BDB94C8]);
  v14 = v11;
  sub_23DA9B9C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v1);
  sub_23DA638A0(&qword_256CDCA30, &qword_256CDCA08, MEMORY[0x24BDB9530]);
  v15 = sub_23DA9B914();

  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
  return v15;
}

uint64_t sub_23DA7A7AC(int a1)
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
  double v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  unint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  _QWORD *v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  double v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __n128 v89;
  int64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  int64_t v96;
  char *v97;
  unint64_t v98;
  unint64_t v99;
  int64_t v100;
  unint64_t v101;
  int64_t v102;
  unint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  NSObject *v110;
  int v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  id v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  id v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t result;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  unsigned int v136;
  int v137;
  unsigned int v138;
  int v139;
  char *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint8_t *v148;
  uint64_t i;
  uint64_t v150;
  uint64_t v151[3];

  v2 = v1;
  v132 = sub_23DA9B818();
  v131 = *(_QWORD *)(v132 - 8);
  MEMORY[0x24BDAC7A8](v132);
  v130 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = sub_23DA9B860();
  v133 = *(_QWORD *)(v135 - 8);
  MEMORY[0x24BDAC7A8](v135);
  v134 = (char *)&v129 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DA9B7DC();
  v143 = *(_QWORD *)(v6 - 8);
  v144 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v140 = (char *)&v129 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v141 = (char *)&v129 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v145 = (char *)&v129 - v11;
  sub_23DA9B7B8();
  v12 = 1.0
      / *(double *)(v2 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_partialGestureCountTarget);
  v13 = (uint64_t *)(v2 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_progress);
  swift_beginAccess();
  v14 = *v13;
  v15 = *(_QWORD *)(*v13 + 64);
  v146 = *v13 + 64;
  v16 = 1 << *(_BYTE *)(v14 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v19 = v2 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_lastGesturePartRecognizedAt;
  swift_bridgeObjectRetain();
  v142 = v19;
  swift_beginAccess();
  v20 = 0;
  v147 = (unint64_t)(v16 + 63) >> 6;
  v139 = a1 - 3;
  v137 = a1;
  v138 = (a1 - 1);
  v136 = (a1 - 5);
  for (i = v2; ; v2 = i)
  {
    if (v18)
    {
      v21 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_26;
    }
    v23 = v20 + 1;
    if (__OFADD__(v20, 1))
      goto LABEL_113;
    if (v23 >= v147)
      break;
    v24 = *(_QWORD *)(v146 + 8 * v23);
    ++v20;
    if (!v24)
    {
      v20 = v23 + 1;
      if (v23 + 1 >= v147)
        break;
      v24 = *(_QWORD *)(v146 + 8 * v20);
      if (!v24)
      {
        v20 = v23 + 2;
        if (v23 + 2 >= v147)
          break;
        v24 = *(_QWORD *)(v146 + 8 * v20);
        if (!v24)
        {
          v20 = v23 + 3;
          if (v23 + 3 >= v147)
            break;
          v24 = *(_QWORD *)(v146 + 8 * v20);
          if (!v24)
          {
            v20 = v23 + 4;
            if (v23 + 4 >= v147)
              break;
            v24 = *(_QWORD *)(v146 + 8 * v20);
            if (!v24)
            {
              v25 = v23 + 5;
              if (v25 >= v147)
                break;
              v24 = *(_QWORD *)(v146 + 8 * v25);
              if (!v24)
              {
                while (1)
                {
                  v20 = v25 + 1;
                  if (__OFADD__(v25, 1))
                    break;
                  if (v20 >= v147)
                    goto LABEL_79;
                  v24 = *(_QWORD *)(v146 + 8 * v20);
                  ++v25;
                  if (v24)
                    goto LABEL_25;
                }
                __break(1u);
LABEL_125:
                result = sub_23DA9BF74();
                __break(1u);
                return result;
              }
              v20 = v25;
            }
          }
        }
      }
    }
LABEL_25:
    v18 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v20 << 6);
LABEL_26:
    v26 = *(unsigned __int8 *)(*(_QWORD *)(v14 + 48) + v22);
    v27 = *(unsigned __int8 *)(v2 + 16);
    if (v27 == 5)
      goto LABEL_33;
    v28 = v143;
    v2 = v144;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v143 + 16);
    LODWORD(v148) = v26;
    v30 = v18;
    v31 = v13;
    v32 = v20;
    v33 = v14;
    v34 = v141;
    v29(v141, v142, v144);
    v35 = v140;
    sub_23DA9B794();
    v36 = sub_23DA9B77C();
    v37 = *(void (**)(char *, uint64_t))(v28 + 8);
    v37(v35, v2);
    v38 = v34;
    v14 = v33;
    v20 = v32;
    v13 = v31;
    v18 = v30;
    v26 = v148;
    v37(v38, v2);
    if ((v36 & 1) == 0)
    {
LABEL_33:
      if ((_DWORD)v26 == 2)
      {
LABEL_60:
        if (v139 <= 1u)
          goto LABEL_36;
      }
      else if ((_DWORD)v26 == 1)
      {
LABEL_35:
        if (v138 < 2)
        {
LABEL_36:
          swift_beginAccess();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v150 = *v13;
          v40 = v150;
          *v13 = 0x8000000000000000;
          v42 = sub_23DA99868(v26);
          v43 = *(_QWORD *)(v40 + 16);
          v44 = (v41 & 1) == 0;
          v45 = v43 + v44;
          if (__OFADD__(v43, v44))
            goto LABEL_115;
          v2 = v41;
          if (*(_QWORD *)(v40 + 24) >= v45)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v48 = (_QWORD *)v150;
              if ((v41 & 1) != 0)
                goto LABEL_45;
            }
            else
            {
              sub_23DA92AE0();
              v48 = (_QWORD *)v150;
              if ((v2 & 1) != 0)
                goto LABEL_45;
            }
          }
          else
          {
            sub_23DA91B80(v45, isUniquelyReferenced_nonNull_native);
            v46 = sub_23DA99868(v26);
            if ((v2 & 1) != (v47 & 1))
              goto LABEL_125;
            v42 = v46;
            v48 = (_QWORD *)v150;
            if ((v2 & 1) != 0)
            {
LABEL_45:
              *(double *)(v48[7] + 8 * v42) = v12;
              goto LABEL_5;
            }
          }
          v48[(v42 >> 6) + 8] |= 1 << v42;
          *(_BYTE *)(v48[6] + v42) = v26;
          *(double *)(v48[7] + 8 * v42) = v12;
          v49 = v48[2];
          v50 = __OFADD__(v49, 1);
          v51 = v49 + 1;
          if (v50)
            goto LABEL_116;
          goto LABEL_69;
        }
      }
LABEL_61:
      swift_beginAccess();
      v67 = swift_isUniquelyReferenced_nonNull_native();
      v150 = *v13;
      v68 = v150;
      *v13 = 0x8000000000000000;
      v70 = sub_23DA99868(v26);
      v71 = *(_QWORD *)(v68 + 16);
      v72 = (v69 & 1) == 0;
      v73 = v71 + v72;
      if (__OFADD__(v71, v72))
      {
        __break(1u);
LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        __break(1u);
LABEL_116:
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
        goto LABEL_123;
      }
      v2 = v69;
      if (*(_QWORD *)(v68 + 24) >= v73)
      {
        if ((v67 & 1) != 0)
        {
          v48 = (_QWORD *)v150;
          if ((v69 & 1) != 0)
            goto LABEL_4;
        }
        else
        {
          sub_23DA92AE0();
          v48 = (_QWORD *)v150;
          if ((v2 & 1) != 0)
            goto LABEL_4;
        }
      }
      else
      {
        sub_23DA91B80(v73, v67);
        v74 = sub_23DA99868(v26);
        if ((v2 & 1) != (v75 & 1))
          goto LABEL_125;
        v70 = v74;
        v48 = (_QWORD *)v150;
        if ((v2 & 1) != 0)
        {
LABEL_4:
          *(_QWORD *)(v48[7] + 8 * v70) = 0;
          goto LABEL_5;
        }
      }
      v48[(v70 >> 6) + 8] |= 1 << v70;
      *(_BYTE *)(v48[6] + v70) = v26;
      *(_QWORD *)(v48[7] + 8 * v70) = 0;
      v76 = v48[2];
      v50 = __OFADD__(v76, 1);
      v51 = v76 + 1;
      if (v50)
        goto LABEL_114;
      goto LABEL_69;
    }
    if ((_DWORD)v26 == 2)
    {
      if (v136 < 0xFE || v27 == v137)
        goto LABEL_60;
    }
    else
    {
      if ((_DWORD)v26 != 1)
        goto LABEL_61;
      if (v139 < 0xFEu || v27 == v137)
        goto LABEL_35;
    }
    v52 = *v13;
    if (!*(_QWORD *)(*v13 + 16))
      goto LABEL_118;
    v53 = sub_23DA99868(v26);
    if ((v54 & 1) == 0)
      goto LABEL_119;
    v55 = *(_QWORD *)(v52 + 56);
    if (v12 + *(double *)(v55 + 8 * v53) <= 1.0)
      v56 = v12 + *(double *)(v55 + 8 * v53);
    else
      v56 = 1.0;
    swift_beginAccess();
    v57 = swift_isUniquelyReferenced_nonNull_native();
    v150 = *v13;
    v58 = v150;
    *v13 = 0x8000000000000000;
    v60 = sub_23DA99868(v26);
    v61 = *(_QWORD *)(v58 + 16);
    v62 = (v59 & 1) == 0;
    v63 = v61 + v62;
    if (__OFADD__(v61, v62))
      goto LABEL_120;
    v2 = v59;
    if (*(_QWORD *)(v58 + 24) >= v63)
    {
      if ((v57 & 1) != 0)
      {
        v48 = (_QWORD *)v150;
        if ((v59 & 1) == 0)
          goto LABEL_57;
      }
      else
      {
        sub_23DA92AE0();
        v48 = (_QWORD *)v150;
        if ((v2 & 1) == 0)
          goto LABEL_57;
      }
    }
    else
    {
      sub_23DA91B80(v63, v57);
      v64 = sub_23DA99868(v26);
      if ((v2 & 1) != (v65 & 1))
        goto LABEL_125;
      v60 = v64;
      v48 = (_QWORD *)v150;
      if ((v2 & 1) == 0)
      {
LABEL_57:
        v48[(v60 >> 6) + 8] |= 1 << v60;
        *(_BYTE *)(v48[6] + v60) = v26;
        *(double *)(v48[7] + 8 * v60) = v56;
        v66 = v48[2];
        v50 = __OFADD__(v66, 1);
        v51 = v66 + 1;
        if (v50)
          goto LABEL_121;
LABEL_69:
        v48[2] = v51;
        goto LABEL_5;
      }
    }
    *(double *)(v48[7] + 8 * v60) = v56;
LABEL_5:
    *v13 = (uint64_t)v48;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_79:
  swift_release();
  if (qword_256CDAFF0 == -1)
    goto LABEL_80;
LABEL_123:
  swift_once();
LABEL_80:
  v77 = v135;
  v78 = __swift_project_value_buffer(v135, (uint64_t)qword_256CE1558);
  swift_retain_n();
  v79 = sub_23DA9B848();
  v80 = sub_23DA9BC8C();
  if (os_log_type_enabled(v79, v80))
  {
    v81 = (uint8_t *)swift_slowAlloc();
    v82 = swift_slowAlloc();
    v151[0] = v82;
    *(_DWORD *)v81 = 136315138;
    v148 = v81 + 4;
    sub_23DA7BB94();
    swift_bridgeObjectRetain();
    v83 = sub_23DA9BA64();
    v84 = v78;
    v86 = v85;
    v2 = i;
    swift_bridgeObjectRelease();
    v150 = sub_23DA6701C(v83, v86, v151);
    sub_23DA9BD58();
    swift_release_n();
    v78 = v84;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v79, v80, "[HE] updated progress: %s", v81, 0xCu);
    swift_arrayDestroy();
    v87 = v82;
    v77 = v135;
    MEMORY[0x24263A588](v87, -1, -1);
    MEMORY[0x24263A588](v81, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  *(_BYTE *)(v2 + 16) = v137;
  v88 = v142;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v143 + 24))(v88, v145, v144);
  swift_endAccess();
  v90 = 0;
  v91 = *v13;
  v92 = *v13 + 64;
  v93 = 1 << *(_BYTE *)(*v13 + 32);
  v94 = -1;
  if (v93 < 64)
    v94 = ~(-1 << v93);
  v95 = v94 & *(_QWORD *)(*v13 + 64);
  v96 = (unint64_t)(v93 + 63) >> 6;
  v89.n128_u64[0] = 0x3FEFAE147AE147AELL;
  v97 = v134;
  do
  {
    if (v95)
    {
      v98 = __clz(__rbit64(v95));
      v95 &= v95 - 1;
      v99 = v98 | (v90 << 6);
    }
    else
    {
      v100 = v90 + 1;
      if (__OFADD__(v90, 1))
        goto LABEL_117;
      if (v100 >= v96)
      {
LABEL_106:
        v109 = 0;
        goto LABEL_111;
      }
      v101 = *(_QWORD *)(v92 + 8 * v100);
      ++v90;
      if (!v101)
      {
        v90 = v100 + 1;
        if (v100 + 1 >= v96)
          goto LABEL_106;
        v101 = *(_QWORD *)(v92 + 8 * v90);
        if (!v101)
        {
          v90 = v100 + 2;
          if (v100 + 2 >= v96)
            goto LABEL_106;
          v101 = *(_QWORD *)(v92 + 8 * v90);
          if (!v101)
          {
            v102 = v100 + 3;
            if (v102 >= v96)
              goto LABEL_106;
            v101 = *(_QWORD *)(v92 + 8 * v102);
            if (!v101)
            {
              while (1)
              {
                v90 = v102 + 1;
                if (__OFADD__(v102, 1))
                  goto LABEL_122;
                if (v90 >= v96)
                  goto LABEL_106;
                v101 = *(_QWORD *)(v92 + 8 * v90);
                ++v102;
                if (v101)
                  goto LABEL_102;
              }
            }
            v90 = v102;
          }
        }
      }
LABEL_102:
      v103 = __clz(__rbit64(v101));
      v95 = (v101 - 1) & v101;
      v99 = v103 + (v90 << 6);
    }
  }
  while (*(double *)(*(_QWORD *)(v91 + 56) + 8 * v99) <= 0.99);
  v104 = *(unsigned __int8 *)(*(_QWORD *)(v91 + 48) + v99);
  v105 = objc_allocWithZone((Class)HGHeadGestureResult);
  swift_bridgeObjectRetain();
  v106 = objc_msgSend(v105, sel_init);
  objc_msgSend(v106, sel_setHeadGesture_, v104);
  objc_msgSend(v106, sel_setHeadGesturePart_, 0);
  v107 = (void *)sub_23DA9B770();
  objc_msgSend(v106, sel_setTimestamp_, v107);

  v108 = v133;
  (*(void (**)(char *, uint64_t, uint64_t))(v133 + 16))(v97, v78, v77);
  v109 = v106;
  v110 = sub_23DA9B848();
  v111 = sub_23DA9BC8C();
  if (os_log_type_enabled(v110, (os_log_type_t)v111))
  {
    LODWORD(v148) = v111;
    v112 = swift_slowAlloc();
    v147 = swift_slowAlloc();
    v151[0] = v147;
    *(_DWORD *)v112 = 136315650;
    v113 = (unint64_t)objc_msgSend(v109, sel_headGesture);
    if (v113 > 2)
    {
      v116 = 0xE700000000000000;
      v115 = 0x6E776F6E6B6E55;
    }
    else
    {
      v114 = 8 * v113;
      v115 = *(_QWORD *)&aBackgrounod_3[8 * v113];
      v116 = *(_QWORD *)&aNd_3[v114];
    }
    v150 = sub_23DA6701C(v115, v116, v151);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v112 + 12) = 2080;
    v117 = objc_msgSend(v109, sel_uuid);
    v118 = v130;
    sub_23DA9B800();

    sub_23DA7BB4C();
    v119 = v132;
    v120 = sub_23DA9BF50();
    v122 = v121;
    (*(void (**)(char *, uint64_t))(v131 + 8))(v118, v119);
    v150 = sub_23DA6701C(v120, v122, v151);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v112 + 22) = 2048;
    v123 = objc_msgSend(v109, sel_timestamp);
    v124 = v141;
    sub_23DA9B7AC();

    sub_23DA9B7A0();
    v126 = v125;
    (*(void (**)(char *, uint64_t))(v143 + 8))(v124, v144);
    v150 = v126;
    sub_23DA9BD58();

    _os_log_impl(&dword_23DA5F000, v110, (os_log_type_t)v148, "[HE] Heuristic final prediction: %s %s at: %f", (uint8_t *)v112, 0x20u);
    v127 = v147;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v127, -1, -1);
    MEMORY[0x24263A588](v112, -1, -1);

    (*(void (**)(char *, uint64_t))(v133 + 8))(v134, v135);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v108 + 8))(v97, v77);
  }
  sub_23DA7B678();
  swift_release();
LABEL_111:
  (*(void (**)(char *, uint64_t, __n128))(v143 + 8))(v145, v144, v89);
  return (uint64_t)v109;
}

uint64_t sub_23DA7B678()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  _QWORD *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  _QWORD *v30;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_progress);
  swift_beginAccess();
  v2 = *v1;
  v29 = *v1 + 64;
  v3 = 1 << *(_BYTE *)(*v1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(*v1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v9 = v8 | (v7 << 6);
    }
    else
    {
      v10 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_36;
      if (v10 >= v6)
        return swift_release();
      v11 = *(_QWORD *)(v29 + 8 * v10);
      ++v7;
      if (!v11)
      {
        v7 = v10 + 1;
        if (v10 + 1 >= v6)
          return swift_release();
        v11 = *(_QWORD *)(v29 + 8 * v7);
        if (!v11)
        {
          v7 = v10 + 2;
          if (v10 + 2 >= v6)
            return swift_release();
          v11 = *(_QWORD *)(v29 + 8 * v7);
          if (!v11)
          {
            v12 = v10 + 3;
            if (v12 >= v6)
              return swift_release();
            v11 = *(_QWORD *)(v29 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                v7 = v12 + 1;
                if (__OFADD__(v12, 1))
                  goto LABEL_37;
                if (v7 >= v6)
                  return swift_release();
                v11 = *(_QWORD *)(v29 + 8 * v7);
                ++v12;
                if (v11)
                  goto LABEL_21;
              }
            }
            v7 = v12;
          }
        }
      }
LABEL_21:
      v5 = (v11 - 1) & v11;
      v9 = __clz(__rbit64(v11)) + (v7 << 6);
    }
    v13 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v9);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v1;
    v30 = (_QWORD *)*v1;
    *v1 = 0x8000000000000000;
    v17 = sub_23DA99868(v13);
    v18 = *(_QWORD *)(v15 + 16);
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
      break;
    v21 = v16;
    if (*(_QWORD *)(v15 + 24) >= v20)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v24 = v30;
        if ((v16 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23DA92AE0();
        v24 = v30;
        if ((v21 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23DA91B80(v20, isUniquelyReferenced_nonNull_native);
      v22 = sub_23DA99868(v13);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_38;
      v17 = v22;
      v24 = v30;
      if ((v21 & 1) != 0)
      {
LABEL_4:
        *(_QWORD *)(v24[7] + 8 * v17) = 0;
        goto LABEL_5;
      }
    }
    v24[(v17 >> 6) + 8] |= 1 << v17;
    *(_BYTE *)(v24[6] + v17) = v13;
    *(_QWORD *)(v24[7] + 8 * v17) = 0;
    v25 = v24[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_35;
    v24[2] = v27;
LABEL_5:
    *v1 = (uint64_t)v24;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

uint64_t sub_23DA7B924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_lastGesturePartRecognizedAt;
  v2 = sub_23DA9B7DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23DA7B984()
{
  return type metadata accessor for HGHeuristicHeadGestureRecognizer();
}

uint64_t type metadata accessor for HGHeuristicHeadGestureRecognizer()
{
  uint64_t result;

  result = qword_256CDC8F0;
  if (!qword_256CDC8F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA7B9C8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DA9B7DC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23DA7BA5C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v0 + 16) = 5;
  sub_23DA9B758();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_gestureContinuationTimeout) = 0x3FE999999999999ALL;
  v1 = OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_partialGestureCountTarget;
  if (qword_256CDAFE8 != -1)
    swift_once();
  v2 = *(void **)(qword_256CE1550 + 16);
  v3 = (void *)sub_23DA9BAA0();
  objc_msgSend(v2, sel_doubleForKey_, v3);
  v5 = v4;

  *(_QWORD *)(v0 + v1) = v5;
  v6 = OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_progress;
  *(_QWORD *)(v0 + v6) = sub_23DA8B200((uint64_t)&unk_250E6B420);
  return v0;
}

unint64_t sub_23DA7BB4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDB918;
  if (!qword_256CDB918)
  {
    v1 = sub_23DA9B818();
    result = MEMORY[0x24263A4F8](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_256CDB918);
  }
  return result;
}

unint64_t sub_23DA7BB94()
{
  unint64_t result;

  result = qword_256CDC9F8;
  if (!qword_256CDC9F8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E750, &type metadata for HGHeadGestureInternal);
    atomic_store(result, (unint64_t *)&qword_256CDC9F8);
  }
  return result;
}

uint64_t sub_23DA7BBD8@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_23DA7A7AC(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_23DA7BC00()
{
  unint64_t result;

  result = qword_256CDB930;
  if (!qword_256CDB930)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDB930);
  }
  return result;
}

__n128 __swift_memcpy121_8(uint64_t a1, __int128 *a2)
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
  v7 = a2[6];
  *(_OWORD *)(a1 + 105) = *(__int128 *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HGMotionData(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 121))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 120);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HGMotionData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 120) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 121) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 121) = 0;
    if (a2)
      *(_BYTE *)(result + 120) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HGMotionData()
{
  return &type metadata for HGMotionData;
}

_QWORD *sub_23DA7BD30(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD *v21;
  double v22;
  _QWORD *v23;
  float64x2_t v24;
  uint64_t i;
  unint64_t v26;
  double v27;
  float64x2_t *v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _BYTE *v34;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;

  v7 = *(double *)(v2 + 104);
  v8 = *(double *)(a1 + 104) - v7;
  v9 = v8 - a2;
  v10 = round((v8 - a2) / a2);
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    swift_once();
    goto LABEL_7;
  }
  v6 = (uint64_t)v10;
  v5 = (uint64_t)v10 - 1;
  if ((uint64_t)v10 < 1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v9 >= 1.0)
  {
    if (qword_256CDAFF0 == -1)
    {
LABEL_22:
      v30 = sub_23DA9B860();
      __swift_project_value_buffer(v30, (uint64_t)qword_256CE1558);
      v31 = sub_23DA9B848();
      v32 = sub_23DA9BC98();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v33 = 134217984;
        sub_23DA9BD58();
        _os_log_impl(&dword_23DA5F000, v31, v32, "Timestamp gap too large: %f, going to reset the pipeline", v33, 0xCu);
        MEMORY[0x24263A588](v33, -1, -1);
      }

      sub_23DA64218();
      swift_allocError();
      *v34 = 1;
      swift_willThrow();
      return v23;
    }
LABEL_32:
    swift_once();
    goto LABEL_22;
  }
  v3 = v2;
  v4 = a1;
  if (qword_256CDAFF0 != -1)
    goto LABEL_30;
LABEL_7:
  v11 = sub_23DA9B860();
  __swift_project_value_buffer(v11, (uint64_t)qword_256CE1558);
  v12 = sub_23DA9B848();
  v13 = sub_23DA9BC80();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v14 = 134217984;
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v12, v13, "Intepolation required, adding %ld data points in between", v14, 0xCu);
    MEMORY[0x24263A588](v14, -1, -1);
  }

  if (qword_256CDAFE0 != -1)
    swift_once();
  v15 = qword_256CE1520;
  type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(0);
  *(_QWORD *)(swift_allocObject()
            + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAInterpolatedDataEvent_intepolationAmount) = v6;
  sub_23DA9B7B8();
  swift_beginAccess();
  v16 = swift_retain();
  MEMORY[0x242639B44](v16);
  if (*(_QWORD *)((*(_QWORD *)(v15 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v15 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_23DA9BBCC();
  sub_23DA9BBE4();
  sub_23DA9BBC0();
  swift_endAccess();
  swift_release();
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  v17 = *(double *)v3;
  v18 = *(double *)v4 - *(double *)v3;
  v48 = *(float64x2_t *)(v3 + 8);
  v46 = *(float64x2_t *)(v3 + 40);
  v47 = *(float64x2_t *)(v3 + 24);
  v44 = vsubq_f64(v47, v47);
  v45 = vsubq_f64(*(float64x2_t *)(v4 + 8), v48);
  v42 = *(float64x2_t *)(v3 + 56);
  v43 = vsubq_f64(v46, v46);
  v40 = *(float64x2_t *)(v3 + 72);
  v41 = vsubq_f64(*(float64x2_t *)(v4 + 56), v42);
  v38 = vsubq_f64(*(float64x2_t *)(v4 + 72), v40);
  v39 = *(float64x2_t *)(v3 + 88);
  v19 = *(double *)(v3 + 112);
  v20 = *(double *)(v4 + 112) - v19;
  v37 = vsubq_f64(*(float64x2_t *)(v4 + 88), v39);
  v21 = sub_23DA744A4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v22 = (double)(v6 + 1);
  v23 = v21;
  v3 = 0;
  v4 = v21[2];
  v24 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0);
  for (i = (v4 << 7) + 152; ; i += 128)
  {
    v26 = v23[3];
    if (v4 + v3 >= v26 >> 1)
    {
      v36 = v24;
      v29 = sub_23DA744A4((_QWORD *)(v26 > 1), v4 + v3 + 1, 1, v23);
      v24 = v36;
      v22 = (double)(v6 + 1);
      v23 = v29;
    }
    v27 = (double)(v3 + 1);
    v23[2] = v4 + v3 + 1;
    v28 = (float64x2_t *)((char *)v23 + i);
    v28[-8].f64[1] = v17 + v18 * v27 / v22;
    v28[-7] = vaddq_f64(v48, vdivq_f64(vmulq_n_f64(v45, v27), v24));
    v28[-6] = vaddq_f64(v47, vdivq_f64(vmulq_n_f64(v44, v27), v24));
    v28[-5] = vaddq_f64(v46, vdivq_f64(vmulq_n_f64(v43, v27), v24));
    v28[-4] = vaddq_f64(v42, vdivq_f64(vmulq_n_f64(v41, v27), v24));
    v28[-3] = vaddq_f64(v40, vdivq_f64(vmulq_n_f64(v38, v27), v24));
    v28[-2] = vaddq_f64(v39, vdivq_f64(vmulq_n_f64(v37, v27), v24));
    v28[-1].f64[0] = v7 + v8 * v27 / v22;
    v28[-1].f64[1] = v19 + v20 * v27 / v22;
    LOBYTE(v28->f64[0]) = 0;
    if (v5 == v3)
      break;
    if (__OFADD__(v3 + 1, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    ++v3;
  }
  return v23;
}

BOOL sub_23DA7C288(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL sub_23DA7C2C4(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  uint64_t v6;
  _OWORD v7[3];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 48);
  return sub_23DA7CE68((double *)v5, (double *)v7);
}

BOOL sub_23DA7C320(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

void sub_23DA7C350()
{
  sub_23DA855F8(0, 16, 0);
  __asm { BR              X9 }
}

uint64_t sub_23DA7C5EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23DA7C624 + 4 * byte_23DA9DE20[a1]))(0xD000000000000011, 0x800000023DA9F950);
}

uint64_t sub_23DA7C624()
{
  return 0x6954726F736E6553;
}

uint64_t sub_23DA7C648()
{
  return 1482908481;
}

uint64_t sub_23DA7C658()
{
  return 1499685697;
}

uint64_t sub_23DA7C668()
{
  return 1516462913;
}

uint64_t sub_23DA7C678()
{
  return 0x586F727947;
}

uint64_t sub_23DA7C68C()
{
  return 0x596F727947;
}

uint64_t sub_23DA7C6A0()
{
  return 0x5A6F727947;
}

uint64_t sub_23DA7C6B4()
{
  return 1819045714;
}

uint64_t sub_23DA7C6C4()
{
  return 0x6863746950;
}

uint64_t sub_23DA7C6D8()
{
  return 7823705;
}

uint64_t sub_23DA7C6E8()
{
  return 30801;
}

uint64_t sub_23DA7C6F4()
{
  return 31057;
}

uint64_t sub_23DA7C700()
{
  return 31313;
}

uint64_t sub_23DA7C70C()
{
  return 30545;
}

uint64_t sub_23DA7C718()
{
  return 0x6E696769724F7369;
}

uint64_t sub_23DA7C734(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_23DA7C5EC(*a1);
  v5 = v4;
  if (v3 == sub_23DA7C5EC(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23DA9BF5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23DA7C7BC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23DA9BFBC();
  sub_23DA7C5EC(v1);
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA7C81C()
{
  unsigned __int8 *v0;

  sub_23DA7C5EC(*v0);
  sub_23DA9BB18();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DA7C85C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23DA9BFBC();
  sub_23DA7C5EC(v1);
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA7C8B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DA7D204();
  *a1 = result;
  return result;
}

uint64_t sub_23DA7C8E4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23DA7C5EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_23DA7C90C(_QWORD *a1@<X8>)
{
  *a1 = &unk_250E6B4E8;
}

uint64_t sub_23DA7C91C()
{
  sub_23DA9BDE8();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  return 0;
}

uint64_t sub_23DA7CC10()
{
  sub_23DA9BDE8();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  return 0;
}

BOOL sub_23DA7CDE4(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v12[6];
  _OWORD v13[2];
  _OWORD v14[6];
  _BYTE v15[25];

  v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  v13[0] = a1[6];
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)a1 + 105);
  v3 = a1[1];
  v12[0] = *a1;
  v12[1] = v3;
  v4 = a1[3];
  v12[2] = a1[2];
  v12[3] = v4;
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[3];
  v14[2] = a2[2];
  v14[3] = v7;
  v14[0] = v5;
  v14[1] = v6;
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  *(_OWORD *)&v15[9] = *(__int128 *)((char *)a2 + 105);
  v14[5] = v9;
  *(_OWORD *)v15 = v10;
  v14[4] = v8;
  return sub_23DA7CED8((uint64_t)v12, (uint64_t)v14);
}

BOOL sub_23DA7CE68(double *a1, double *a2)
{
  BOOL v2;
  _BOOL8 result;

  result = 0;
  if (*a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3])
  {
    v2 = a1[4] == a2[4] && a1[5] == a2[5];
    if (v2 && a1[6] == a2[6])
      return 1;
  }
  return result;
}

BOOL sub_23DA7CED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(double *)(a1 + 104) == *(double *)(a2 + 104))
  {
    v2 = 0;
    if (*(double *)a1 != *(double *)a2)
      return v2;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 8), *(float64x2_t *)(a2 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 24), *(float64x2_t *)(a2 + 24)))), 0xFuLL))) & 1) == 0)return v2;
    if (*(double *)(a1 + 40) != *(double *)(a2 + 40))
      return v2;
    if (*(double *)(a1 + 48) != *(double *)(a2 + 48))
      return v2;
    v2 = 0;
    if (*(double *)(a1 + 56) != *(double *)(a2 + 56)
      || *(double *)(a1 + 64) != *(double *)(a2 + 64)
      || *(double *)(a1 + 72) != *(double *)(a2 + 72))
    {
      return v2;
    }
    if (*(double *)(a1 + 80) == *(double *)(a2 + 80) && *(double *)(a1 + 88) == *(double *)(a2 + 88))
      return *(double *)(a1 + 96) == *(double *)(a2 + 96);
  }
  return 0;
}

double sub_23DA7CFC8@<D0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
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
  double result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v5, sel_roll);
  v39 = v6;

  v7 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v7, sel_pitch);
  v38 = v8;

  v9 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v9, sel_yaw);
  v37 = v10;

  v11 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v11, sel_quaternion);
  v36 = v12;

  v13 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v13, sel_quaternion);
  v35 = v14;

  v15 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v15, sel_quaternion);
  v17 = v16;

  v18 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v18, sel_quaternion);
  v20 = v19;

  objc_msgSend(a1, sel_rotationRate);
  v22 = v21;
  objc_msgSend(a1, sel_rotationRate);
  v24 = v23;
  objc_msgSend(a1, sel_rotationRate);
  v26 = v25;
  objc_msgSend(a1, sel_userAcceleration);
  v28 = v27;
  objc_msgSend(a1, sel_userAcceleration);
  v30 = v29;
  objc_msgSend(a1, sel_userAcceleration);
  v32 = v31;
  objc_msgSend(a1, sel_timestamp);
  *(_QWORD *)a2 = v39;
  *(_QWORD *)(a2 + 8) = v38;
  *(_QWORD *)(a2 + 16) = v37;
  *(_QWORD *)(a2 + 24) = v36;
  *(_QWORD *)(a2 + 32) = v35;
  *(_QWORD *)(a2 + 40) = v17;
  *(_QWORD *)(a2 + 48) = v20;
  *(_QWORD *)(a2 + 56) = v22;
  *(_QWORD *)(a2 + 64) = v24;
  *(_QWORD *)(a2 + 72) = v26;
  *(_QWORD *)(a2 + 80) = v28;
  *(_QWORD *)(a2 + 88) = v30;
  *(_QWORD *)(a2 + 96) = v32;
  *(_QWORD *)(a2 + 104) = v33;
  result = a3;
  *(double *)(a2 + 112) = a3;
  *(_BYTE *)(a2 + 120) = 1;
  return result;
}

uint64_t sub_23DA7D204()
{
  unint64_t v0;

  v0 = sub_23DA9BEA8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x10)
    return 16;
  else
    return v0;
}

uint64_t sub_23DA7D24C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
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
  char v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v64 = a3;
  v5 = sub_23DA9B614();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = a1;
  v88 = a2;
  v71 = 8236;
  v72 = 0xE200000000000000;
  sub_23DA7125C();
  v9 = sub_23DA9BD70();
  swift_bridgeObjectRelease();
  if (qword_256CDAFD8 != -1)
    swift_once();
  v87 = qword_256CE14C0;
  v88 = *(_QWORD *)algn_256CE14C8;
  v10 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v11 = objc_msgSend(v10, sel_whitespaceAndNewlineCharacterSet);
  sub_23DA9B608();

  v12 = sub_23DA9BD7C();
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  v89 = v12;
  v90 = v14;
  v87 = 8236;
  v88 = 0xE200000000000000;
  v15 = sub_23DA9BD70();
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(v15 + 16);
  if (*(_QWORD *)(v9 + 16) >= v16)
  {
    if (v16)
    {
      v65 = 0;
      v69 = v15;
      v70 = "nsion";
      v68 = v16;
      swift_bridgeObjectRetain();
      v18 = (char *)&loc_23DA7D4A8 + *((int *)qword_23DA7DB90 + sub_23DA7D204());
      __asm { BR              X9 }
    }
    v65 = 0;
    v19 = MEMORY[0x24BEE4B00];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v19 + 16))
    {
      v20 = sub_23DA999F0(0);
      if ((v21 & 1) != 0)
      {
        if (*(_QWORD *)(v19 + 16))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
          v23 = sub_23DA999F0(1);
          if ((v24 & 1) != 0)
          {
            if (*(_QWORD *)(v19 + 16))
            {
              v25 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v23);
              v26 = sub_23DA999F0(2);
              if ((v27 & 1) != 0)
              {
                if (*(_QWORD *)(v19 + 16))
                {
                  v28 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v26);
                  v29 = sub_23DA999F0(3);
                  if ((v30 & 1) != 0)
                  {
                    if (*(_QWORD *)(v19 + 16))
                    {
                      v31 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v29);
                      v32 = sub_23DA999F0(4);
                      if ((v33 & 1) != 0)
                      {
                        if (*(_QWORD *)(v19 + 16))
                        {
                          v34 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v32);
                          v35 = sub_23DA999F0(5);
                          if ((v36 & 1) != 0)
                          {
                            if (*(_QWORD *)(v19 + 16))
                            {
                              v37 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v35);
                              v38 = sub_23DA999F0(6);
                              if ((v39 & 1) != 0)
                              {
                                if (*(_QWORD *)(v19 + 16))
                                {
                                  v40 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v38);
                                  v41 = sub_23DA999F0(7);
                                  if ((v42 & 1) != 0)
                                  {
                                    if (*(_QWORD *)(v19 + 16))
                                    {
                                      v43 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v41);
                                      v44 = sub_23DA999F0(8);
                                      if ((v45 & 1) != 0)
                                      {
                                        if (*(_QWORD *)(v19 + 16))
                                        {
                                          v70 = *(char **)(*(_QWORD *)(v19 + 56) + 8 * v44);
                                          v46 = sub_23DA999F0(9);
                                          if ((v47 & 1) != 0)
                                          {
                                            if (*(_QWORD *)(v19 + 16))
                                            {
                                              v69 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v46);
                                              v48 = sub_23DA999F0(10);
                                              if ((v49 & 1) != 0)
                                              {
                                                if (*(_QWORD *)(v19 + 16))
                                                {
                                                  v68 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v48);
                                                  v50 = sub_23DA999F0(11);
                                                  if ((v51 & 1) != 0)
                                                  {
                                                    if (*(_QWORD *)(v19 + 16))
                                                    {
                                                      v67 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v50);
                                                      v52 = sub_23DA999F0(12);
                                                      if ((v53 & 1) != 0)
                                                      {
                                                        if (*(_QWORD *)(v19 + 16))
                                                        {
                                                          v66 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v52);
                                                          v54 = sub_23DA999F0(13);
                                                          if ((v55 & 1) != 0)
                                                          {
                                                            if (*(_QWORD *)(v19 + 16))
                                                            {
                                                              v63 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v54);
                                                              v56 = sub_23DA999F0(14);
                                                              if ((v57 & 1) != 0)
                                                              {
                                                                v58 = *(_QWORD *)(v19 + 56);
                                                                v62 = v25;
                                                                v59 = v22;
                                                                v60 = *(_QWORD *)(v58 + 8 * v56);
                                                                swift_bridgeObjectRelease();
                                                                v71 = (uint64_t)v70;
                                                                v72 = v69;
                                                                v73 = v68;
                                                                v74 = v67;
                                                                v75 = v66;
                                                                v76 = v63;
                                                                v77 = v60;
                                                                v78 = v37;
                                                                v79 = v40;
                                                                v80 = v43;
                                                                v81 = v28;
                                                                v82 = v31;
                                                                v83 = v34;
                                                                v84 = v59;
                                                                v85 = v62;
                                                                v86 = v65 & 1;
                                                                nullsub_1(&v71);
                                                                sub_23DA6425C((uint64_t)&v71, (uint64_t)&v87);
                                                                v17 = v64;
                                                                return sub_23DA6425C((uint64_t)&v87, v17);
                                                              }
LABEL_68:
                                                              __break(1u);
                                                              JUMPOUT(0x23DA7DB90);
                                                            }
LABEL_67:
                                                            __break(1u);
                                                            goto LABEL_68;
                                                          }
LABEL_66:
                                                          __break(1u);
                                                          goto LABEL_67;
                                                        }
LABEL_65:
                                                        __break(1u);
                                                        goto LABEL_66;
                                                      }
LABEL_64:
                                                      __break(1u);
                                                      goto LABEL_65;
                                                    }
LABEL_63:
                                                    __break(1u);
                                                    goto LABEL_64;
                                                  }
LABEL_62:
                                                  __break(1u);
                                                  goto LABEL_63;
                                                }
LABEL_61:
                                                __break(1u);
                                                goto LABEL_62;
                                              }
LABEL_60:
                                              __break(1u);
                                              goto LABEL_61;
                                            }
LABEL_59:
                                            __break(1u);
                                            goto LABEL_60;
                                          }
LABEL_58:
                                          __break(1u);
                                          goto LABEL_59;
                                        }
LABEL_57:
                                        __break(1u);
                                        goto LABEL_58;
                                      }
LABEL_56:
                                      __break(1u);
                                      goto LABEL_57;
                                    }
LABEL_55:
                                    __break(1u);
                                    goto LABEL_56;
                                  }
LABEL_54:
                                  __break(1u);
                                  goto LABEL_55;
                                }
LABEL_53:
                                __break(1u);
                                goto LABEL_54;
                              }
LABEL_52:
                              __break(1u);
                              goto LABEL_53;
                            }
LABEL_51:
                            __break(1u);
                            goto LABEL_52;
                          }
LABEL_50:
                          __break(1u);
                          goto LABEL_51;
                        }
LABEL_49:
                        __break(1u);
                        goto LABEL_50;
                      }
LABEL_48:
                      __break(1u);
                      goto LABEL_49;
                    }
LABEL_47:
                    __break(1u);
                    goto LABEL_48;
                  }
LABEL_46:
                  __break(1u);
                  goto LABEL_47;
                }
LABEL_45:
                __break(1u);
                goto LABEL_46;
              }
LABEL_44:
              __break(1u);
              goto LABEL_45;
            }
LABEL_43:
            __break(1u);
            goto LABEL_44;
          }
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = v64;
  sub_23DA642C0((uint64_t)&v71);
  sub_23DA6425C((uint64_t)&v71, (uint64_t)&v87);
  return sub_23DA6425C((uint64_t)&v87, v17);
}

_BYTE *sub_23DA7DBD4@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t getEnumTagSinglePayload for HGMotionData.Property(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HGMotionData.Property(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_23DA7DD1C + 4 * byte_23DA9DE35[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_23DA7DD50 + 4 * byte_23DA9DE30[v4]))();
}

uint64_t sub_23DA7DD50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA7DD58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DA7DD60);
  return result;
}

uint64_t sub_23DA7DD6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DA7DD74);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_23DA7DD78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA7DD80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HGMotionData.Property()
{
  return &type metadata for HGMotionData.Property;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HGAcceleration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HGAcceleration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HGAcceleration()
{
  return &type metadata for HGAcceleration;
}

ValueMetadata *type metadata accessor for HGRotationRate()
{
  return &type metadata for HGRotationRate;
}

uint64_t initializeBufferWithCopyOfBuffer for HGAttitude(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HGAttitude(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HGAttitude(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HGAttitude()
{
  return &type metadata for HGAttitude;
}

uint64_t sub_23DA7DED0()
{
  return sub_23DA638A0(&qword_256CDCA48, &qword_256CDCA50, MEMORY[0x24BEE12E0]);
}

unint64_t sub_23DA7DF00()
{
  unint64_t result;

  result = qword_256CDCA58;
  if (!qword_256CDCA58)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E000, &type metadata for HGMotionData.Property);
    atomic_store(result, (unint64_t *)&qword_256CDCA58);
  }
  return result;
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

uint64_t getEnumTagSinglePayload for HGQuaternion(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HGQuaternion(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HGQuaternion()
{
  return &type metadata for HGQuaternion;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError()
{
  return &type metadata for CInteropUtils.DomainError;
}

uint64_t sub_23DA7DFD0()
{
  return 0;
}

uint64_t sub_23DA7DFDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23DA7E008()
{
  return 0;
}

void sub_23DA7E014(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23DA7E020()
{
  sub_23DA7E878();
  return sub_23DA9C01C();
}

uint64_t sub_23DA7E048()
{
  sub_23DA7E878();
  return sub_23DA9C028();
}

uint64_t sub_23DA7E070(_QWORD *a1, int a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;

  v17 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCAA0);
  v15 = *(_QWORD *)(v3 - 8);
  v16 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCAA8);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCAB0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DA7E834();
  sub_23DA9C010();
  if ((v17 & 1) != 0)
  {
    v19 = 1;
    sub_23DA7E878();
    sub_23DA9BF08();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v16);
  }
  else
  {
    v18 = 0;
    sub_23DA7E8BC();
    sub_23DA9BF08();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

BOOL sub_23DA7E240(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_23DA7E260()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0xD000000000000014;
}

uint64_t sub_23DA7E29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DA7E3F8(a1, a2);
  *a3 = result;
  return result;
}

void sub_23DA7E2C0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23DA7E2CC()
{
  sub_23DA7E834();
  return sub_23DA9C01C();
}

uint64_t sub_23DA7E2F4()
{
  sub_23DA7E834();
  return sub_23DA9C028();
}

uint64_t sub_23DA7E31C()
{
  sub_23DA7E8BC();
  return sub_23DA9C01C();
}

uint64_t sub_23DA7E344()
{
  sub_23DA7E8BC();
  return sub_23DA9C028();
}

uint64_t sub_23DA7E36C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23DA7E4E4(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_23DA7E398(_QWORD *a1)
{
  unsigned __int8 *v1;

  return sub_23DA7E070(a1, *v1);
}

unint64_t sub_23DA7E3B4()
{
  unint64_t result;

  result = qword_256CDCA60;
  if (!qword_256CDCA60)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E124, &type metadata for CInteropUtils.DomainError);
    atomic_store(result, (unint64_t *)&qword_256CDCA60);
  }
  return result;
}

uint64_t sub_23DA7E3F8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000014 && a2 == 0x800000023DAA1630 || (sub_23DA9BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023DAA1650)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23DA9BF5C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23DA7E4E4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA68);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA70);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA78);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DA7E834();
  v10 = v26;
  sub_23DA9C004();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_23DA9BEF0();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_23DA9BE18();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCA88);
    *v19 = &type metadata for CInteropUtils.DomainError;
    sub_23DA9BEC0();
    sub_23DA9BE0C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v6);
    a1 = v21;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return v6;
  }
  v6 = *(unsigned __int8 *)(v13 + 32);
  if ((v6 & 1) != 0)
  {
    v28 = 1;
    sub_23DA7E878();
    sub_23DA9BEB4();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_23DA7E8BC();
    sub_23DA9BEB4();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  return v6;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23DA7E834()
{
  unint64_t result;

  result = qword_256CDCA80;
  if (!qword_256CDCA80)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E3D8, &type metadata for CInteropUtils.DomainError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCA80);
  }
  return result;
}

unint64_t sub_23DA7E878()
{
  unint64_t result;

  result = qword_256CDCA90;
  if (!qword_256CDCA90)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E388, &type metadata for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCA90);
  }
  return result;
}

unint64_t sub_23DA7E8BC()
{
  unint64_t result;

  result = qword_256CDCA98;
  if (!qword_256CDCA98)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E338, &type metadata for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCA98);
  }
  return result;
}

uint64_t _s12HeadGestures13CInteropUtilsV11DomainErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12HeadGestures13CInteropUtilsV11DomainErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DA7E9DC + 4 * byte_23DA9E065[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23DA7EA10 + 4 * byte_23DA9E060[v4]))();
}

uint64_t sub_23DA7EA10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA7EA18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DA7EA20);
  return result;
}

uint64_t sub_23DA7EA2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DA7EA34);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23DA7EA38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA7EA40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23DA7EA4C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError.CodingKeys()
{
  return &type metadata for CInteropUtils.DomainError.CodingKeys;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys()
{
  return &type metadata for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys;
}

ValueMetadata *type metadata accessor for CInteropUtils()
{
  return &type metadata for CInteropUtils;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys()
{
  return &type metadata for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys;
}

unint64_t sub_23DA7EA9C()
{
  unint64_t result;

  result = qword_256CDCAB8;
  if (!qword_256CDCAB8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E310, &type metadata for CInteropUtils.DomainError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAB8);
  }
  return result;
}

unint64_t sub_23DA7EAE4()
{
  unint64_t result;

  result = qword_256CDCAC0;
  if (!qword_256CDCAC0)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E230, &type metadata for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAC0);
  }
  return result;
}

unint64_t sub_23DA7EB2C()
{
  unint64_t result;

  result = qword_256CDCAC8;
  if (!qword_256CDCAC8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E258, &type metadata for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAC8);
  }
  return result;
}

unint64_t sub_23DA7EB74()
{
  unint64_t result;

  result = qword_256CDCAD0;
  if (!qword_256CDCAD0)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E1E0, &type metadata for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAD0);
  }
  return result;
}

unint64_t sub_23DA7EBBC()
{
  unint64_t result;

  result = qword_256CDCAD8;
  if (!qword_256CDCAD8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E208, &type metadata for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAD8);
  }
  return result;
}

unint64_t sub_23DA7EC04()
{
  unint64_t result;

  result = qword_256CDCAE0;
  if (!qword_256CDCAE0)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E280, &type metadata for CInteropUtils.DomainError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAE0);
  }
  return result;
}

unint64_t sub_23DA7EC4C()
{
  unint64_t result;

  result = qword_256CDCAE8;
  if (!qword_256CDCAE8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E2A8, &type metadata for CInteropUtils.DomainError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDCAE8);
  }
  return result;
}

uint64_t sub_23DA7ECA4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23DA7ECD0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  id v14;
  id v15;
  void **v16;
  void *v17;
  void *v18;
  _BYTE v20[64];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_23DA9B6D4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v20[-v11];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer) = 0;
  v13 = sub_23DA63350(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_23DA9B8F0();
  swift_release();
  swift_release();
  if (v20[32] == 1)
  {
    sub_23DA9759C((uint64_t)v5);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_23DA6EA80((uint64_t)v5, &qword_256CDB748);
    }
    else
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(v12, v5, v6);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
      v14 = objc_allocWithZone(MEMORY[0x24BDB1848]);
      v15 = sub_23DA80B9C((uint64_t)v10);
      v16 = (void **)(v13 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
      swift_beginAccess();
      v17 = *v16;
      *v16 = v15;

      swift_beginAccess();
      v18 = *v16;
      if (*v16)
      {
        swift_endAccess();
        objc_msgSend(v18, sel_setNumberOfLoops_, -1);
        (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
        swift_endAccess();
      }
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v20[8] = 1;
  swift_retain();
  sub_23DA9B8FC();
  swift_release();

  return v13;
}

void sub_23DA7F02C(void *a1)
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
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  uint64_t inited;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  char *v47;
  _BYTE *v48;
  int v49;
  double v50;
  double v51;
  float v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v74;
  id v75;
  uint64_t v76;
  char v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  unint64_t v90;
  __int128 aBlock;
  uint64_t (*v92)(uint64_t);
  void *v93;
  uint64_t (*v94)();
  uint64_t v95;
  unint64_t v96;
  double v97[4];

  v2 = v1;
  v4 = sub_23DA9B818();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23DA9B860();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v79 - v13;
  v15 = (_BYTE *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  swift_beginAccess();
  if (*v15 != 1)
    return;
  v86 = v7;
  v87 = v5;
  v88 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCC98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23DA9D740;
  v17 = (void *)*MEMORY[0x24BDB6D40];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDB6D40];
  v18 = v17;
  v19 = sub_23DA9BBF0();
  type metadata accessor for CFBoolean(0);
  *(_QWORD *)(inited + 64) = v20;
  *(_QWORD *)(inited + 40) = v19;
  v90 = sub_23DA87D08(inited);
  swift_bridgeObjectRetain();
  v21 = objc_msgSend(a1, sel_headGesture);
  v22 = (unsigned __int8 *)(*(_QWORD *)(v2 + 16)
                          + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  swift_beginAccess();
  v23 = *v22;
  v89 = v12;
  if (v21 == (id)2)
  {
    if (v23)
      v24 = 1371;
    else
      v24 = 1372;
    goto LABEL_10;
  }
  if (v21 == (id)1)
  {
    if (v23)
      v24 = 1372;
    else
      v24 = 1371;
LABEL_10:
    v85 = v24;
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock) = 0;
    swift_retain();
    sub_23DA9B8FC();
    if (qword_256CDAFF0 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v8, (uint64_t)qword_256CE1558);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v25, v8);
    v26 = a1;
    v27 = sub_23DA9B848();
    v28 = sub_23DA9BC8C();
    if (os_log_type_enabled(v27, (os_log_type_t)v28))
    {
      v81 = v28;
      v84 = v9;
      v29 = swift_slowAlloc();
      v80 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v80;
      *(_DWORD *)v29 = 136315650;
      v30 = (unint64_t)objc_msgSend(v26, sel_headGesture);
      v83 = v8;
      v82 = (uint64_t)a1;
      if (v30 > 2)
      {
        v32 = 0x6E776F6E6B6E55;
        v33 = 0xE700000000000000;
      }
      else
      {
        v31 = 8 * v30;
        v32 = *(_QWORD *)&aBackgrounod_4[8 * v30];
        v33 = *(_QWORD *)&aNd_4[v31];
      }
      *(_QWORD *)&v97[0] = sub_23DA6701C(v32, v33, (uint64_t *)&aBlock);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      v35 = objc_msgSend(v26, sel_uuid, v29 + 14);
      v36 = v86;
      sub_23DA9B800();

      sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v37 = v88;
      v38 = sub_23DA9BF50();
      v40 = v39;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v36, v37);
      *(_QWORD *)&v97[0] = sub_23DA6701C(v38, v40, (uint64_t *)&aBlock);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 22) = 2080;
      *(_QWORD *)&v97[0] = sub_23DA6701C(49, 0xE100000000000000, (uint64_t *)&aBlock);
      sub_23DA9BD58();
      _os_log_impl(&dword_23DA5F000, v27, (os_log_type_t)v81, "[Audio] Playing Audio feedback %s UUID: %s at volume %s", (uint8_t *)v29, 0x20u);
      v41 = v80;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v41, -1, -1);
      MEMORY[0x24263A588](v29, -1, -1);

      v9 = v84;
      v8 = v83;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v14, v83);
      a1 = (void *)v82;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    type metadata accessor for CFString(0);
    sub_23DA63860(&qword_256CDB420, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_23DA9D284);
    v34 = v90;
    v42 = (void *)sub_23DA9BA4C();
    swift_bridgeObjectRelease();
    v43 = swift_allocObject();
    swift_weakInit();
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = v43;
    *(_QWORD *)(v44 + 24) = v26;
    v94 = sub_23DA80D20;
    v95 = v44;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v92 = sub_23DA7ECA4;
    v93 = &block_descriptor_14_0;
    v45 = _Block_copy(&aBlock);
    v46 = v26;
    swift_release();
    AudioServicesPlaySystemSoundWithOptions();
    _Block_release(v45);

    v12 = v89;
    goto LABEL_20;
  }
  v34 = v90;
  swift_bridgeObjectRelease();
LABEL_20:
  v47 = (char *)objc_msgSend(a1, sel_headGesturePart);
  v48 = (_BYTE *)(*(_QWORD *)(v2 + 16)
                + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  swift_beginAccess();
  if ((unint64_t)(v47 - 3) < 2)
  {
    if (*v48)
      v49 = 1373;
    else
      v49 = 1374;
  }
  else
  {
    if ((unint64_t)(v47 - 1) > 1)
    {
      swift_bridgeObjectRelease();
      return;
    }
    if (*v48)
      v49 = 1374;
    else
      v49 = 1373;
  }
  v85 = v49;
  sub_23DA61DD0((uint64_t)objc_msgSend(a1, sel_headGesturePart));
  v51 = v50;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v52 = v51;
  v53 = __swift_project_value_buffer(v8, (uint64_t)qword_256CE1558);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v53, v8);
  v54 = a1;
  v55 = sub_23DA9B848();
  v56 = sub_23DA9BC8C();
  if (os_log_type_enabled(v55, v56))
  {
    v84 = v9;
    v57 = swift_slowAlloc();
    v82 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v82;
    *(_DWORD *)v57 = 136315650;
    v58 = (char *)objc_msgSend(v54, sel_headGesturePart);
    v83 = v8;
    if ((unint64_t)(v58 - 1) > 3)
    {
      v60 = 0x6E776F6E6B6E75;
      v61 = 0xE700000000000000;
    }
    else
    {
      v59 = 8 * (_QWORD)(v58 - 1);
      v60 = *(_QWORD *)&aNodup_3[v59];
      v61 = *(_QWORD *)&aShakelefshaker_2[v59 + 16];
    }
    *(_QWORD *)&v97[0] = sub_23DA6701C(v60, v61, (uint64_t *)&aBlock);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 12) = 2080;
    v62 = objc_msgSend(v54, sel_uuid);
    v63 = v86;
    sub_23DA9B800();

    sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v64 = v88;
    v65 = sub_23DA9BF50();
    v67 = v66;
    (*(void (**)(char *, uint64_t))(v87 + 8))(v63, v64);
    *(_QWORD *)&v97[0] = sub_23DA6701C(v65, v67, (uint64_t *)&aBlock);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 22) = 2048;
    v97[0] = v52;
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v55, v56, "[Audio] Playing Audio feedback %s UUID: %s at volume %f", (uint8_t *)v57, 0x20u);
    v68 = v82;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v68, -1, -1);
    MEMORY[0x24263A588](v57, -1, -1);

    (*(void (**)(char *, uint64_t))(v84 + 8))(v89, v83);
    v34 = v90;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  v69 = (id)*MEMORY[0x24BDB6D58];
  v70 = sub_23DA9BC20();
  type metadata accessor for CFNumber(0);
  v72 = v71;
  v93 = v71;
  *(_QWORD *)&aBlock = v70;
  sub_23DA68CE4(&aBlock, v97);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v96 = v34;
  sub_23DA6766C(v97, v69, isUniquelyReferenced_nonNull_native);
  v74 = v96;

  swift_bridgeObjectRelease();
  if (objc_msgSend(v54, sel_headGesturePart) == (id)3 || objc_msgSend(v54, sel_headGesturePart) == (id)4)
  {
    v75 = (id)*MEMORY[0x24BDB6D48];
    v76 = sub_23DA9BC44();
    v93 = v72;
    *(_QWORD *)&aBlock = v76;
    sub_23DA68CE4(&aBlock, v97);
    v77 = swift_isUniquelyReferenced_nonNull_native();
    v96 = v74;
    sub_23DA6766C(v97, v75, v77);

    swift_bridgeObjectRelease();
  }
  type metadata accessor for CFString(0);
  sub_23DA63860(&qword_256CDB420, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_23DA9D284);
  v78 = (void *)sub_23DA9BA4C();
  swift_bridgeObjectRelease();
  AudioServicesPlaySystemSoundWithOptions();

}

uint64_t sub_23DA7FC50(uint64_t a1, void *a2)
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
  id v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = sub_23DA9B818();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9B860();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v33) = 1;
    sub_23DA9B8FC();
  }
  if (qword_256CDAFF0 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = a2;
  v13 = sub_23DA9B848();
  v14 = sub_23DA9BC8C();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    v29 = v14;
    v30 = v4;
    v31 = v8;
    v15 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v33 = v28;
    *(_DWORD *)v15 = 136315394;
    v16 = (unint64_t)objc_msgSend(v12, sel_headGesture);
    v17 = v3;
    if (v16 > 2)
    {
      v20 = 0xE700000000000000;
      v19 = 0x6E776F6E6B6E55;
    }
    else
    {
      v18 = 8 * v16;
      v19 = *(_QWORD *)&aBackgrounod_4[8 * v16];
      v20 = *(_QWORD *)&aNd_4[v18];
    }
    v32 = sub_23DA6701C(v19, v20, &v33);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v22 = objc_msgSend(v12, sel_uuid, v15 + 14);
    sub_23DA9B800();

    sub_23DA63860((unint64_t *)&qword_256CDB918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v23 = sub_23DA9BF50();
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v17);
    v32 = sub_23DA6701C(v23, v25, &v33);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v13, (os_log_type_t)v29, "[Audio] Finished playing Audio feedback %s UUID: %s", (uint8_t *)v15, 0x16u);
    v26 = v28;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v26, -1, -1);
    MEMORY[0x24263A588](v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v10, v7);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

id sub_23DA80008()
{
  uint64_t v0;
  id *v1;

  if (*(_QWORD *)(v0 + 32))
  {
    swift_retain();
    sub_23DA9B878();
    swift_release();
    *(_QWORD *)(v0 + 32) = 0;
    swift_release();
  }
  v1 = (id *)(v0 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
  swift_beginAccess();
  return objc_msgSend(*v1, sel_stop);
}

uint64_t sub_23DA80084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_23DA9BA04();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BA1C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = *(_QWORD *)(v1 + 24);
  aBlock[4] = sub_23DA80AA8;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_3;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_23DA9BA10();
  v13[1] = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

uint64_t sub_23DA80258(uint64_t a1)
{
  id *v1;

  v1 = (id *)(a1 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
  swift_beginAccess();
  objc_msgSend(*v1, sel_play);
  return sub_23DA804C0((uint64_t)nullsub_1, 0, 1.0);
}

uint64_t sub_23DA802C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_23DA9BA04();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23DA9BA1C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(_QWORD *)(v3 + 24);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v3;
  v15[3] = a1;
  v15[4] = a2;
  aBlock[4] = sub_23DA80A64;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_4;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_23DA9BA10();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

uint64_t sub_23DA804C0(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v4 = v3;
  v28 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC5D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBD28);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC5E0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v3 + 32))
  {
    swift_retain();
    sub_23DA9B878();
    swift_release();
    *(_QWORD *)(v3 + 32) = 0;
    swift_release();
  }
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDC330);
  v17 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v18 = sub_23DA9BD28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
  v19 = sub_23DA9BD10();

  sub_23DA6EA80((uint64_t)v12, &qword_256CDBD28);
  v30 = v19;
  sub_23DA9BD04();
  sub_23DA63860((unint64_t *)&qword_256CDC338, (uint64_t (*)(uint64_t))MEMORY[0x24BDD01C8], MEMORY[0x24BDD01B0]);
  v20 = sub_23DA9B8A8();
  swift_release();
  v30 = v20;
  v29 = *(id *)(v4 + 24);
  v21 = v29;
  v22 = sub_23DA9BCC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
  v23 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC340);
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDB3C8);
  sub_23DA638A0(&qword_256CDC348, &qword_256CDC340, MEMORY[0x24BDB9510]);
  sub_23DA788BC();
  sub_23DA9B9D4();
  sub_23DA6EA80((uint64_t)v9, &qword_256CDC5D8);

  swift_release();
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v4;
  *(float *)(v24 + 24) = a3;
  *(_QWORD *)(v24 + 32) = v28;
  *(_QWORD *)(v24 + 40) = a2;
  sub_23DA638A0(&qword_256CDC5F0, &qword_256CDC5E0, MEMORY[0x24BDB9A08]);
  swift_retain();
  swift_retain();
  v25 = sub_23DA9B9F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  *(_QWORD *)(v4 + 32) = v25;
  return swift_release();
}

void sub_23DA80840(float a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  id *v7;
  id v8;
  id v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;

  v7 = (id *)(a3 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
  swift_beginAccess();
  if (*v7)
  {
    v8 = *v7;
    v9 = objc_msgSend(v8, sel_volume);
    if (v10 == a1)
    {
      if (*(_QWORD *)(a3 + 32))
      {
        swift_retain();
        sub_23DA9B878();
        swift_release();
        *(_QWORD *)(a3 + 32) = 0;
        v9 = (id)swift_release();
      }
      a4(v9);
    }
    objc_msgSend(v8, sel_volume);
    v12 = v11;
    objc_msgSend(v8, sel_volume);
    v14 = *(float *)&v13 + -0.05;
    if ((float)(*(float *)&v13 + -0.05) <= a1)
      v14 = a1;
    *(float *)&v13 = *(float *)&v13 + 0.05;
    if (*(float *)&v13 > a1)
      *(float *)&v13 = a1;
    if (v12 >= a1)
      *(float *)&v13 = v14;
    objc_msgSend(v8, sel_setVolume_, v13);

  }
}

void sub_23DA80964()
{
  uint64_t v0;

}

uint64_t sub_23DA80974()
{

  return swift_deallocClassInstance();
}

uint64_t sub_23DA809B4()
{
  return type metadata accessor for HGSystemAudioPlayer();
}

uint64_t type metadata accessor for HGSystemAudioPlayer()
{
  uint64_t result;

  result = qword_256CDCB18;
  if (!qword_256CDCB18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA809F8()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA80A38()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DA80A64()
{
  uint64_t v0;

  return sub_23DA804C0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), 0.0);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_23DA80AA8()
{
  uint64_t v0;

  return sub_23DA80258(v0);
}

uint64_t sub_23DA80AB0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23DA9B8F0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23DA80B2C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_23DA9B8FC();
}

id sub_23DA80B9C(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v2 = v1;
  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_23DA9B6A4();
  v13[0] = 0;
  v5 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_23DA9B6D4();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_23DA9B680();

    swift_willThrow();
    v11 = sub_23DA9B6D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

double sub_23DA80CA4(float (*a1)(void))
{
  return a1();
}

uint64_t sub_23DA80CD0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DA80CF4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23DA80D20()
{
  uint64_t v0;

  return sub_23DA7FC50(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_23DA80D28()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_23DA80D54(uint64_t a1)
{
  uint64_t v1;

  sub_23DA80840(*(float *)(v1 + 24), a1, *(_QWORD *)(v1 + 16), *(void (**)(id))(v1 + 32));
}

uint64_t sub_23DA80D7C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x24BEE4AF8];
  v2[4] = MEMORY[0x24BEE4AF8];
  v2[5] = v3;
  v2[6] = v3;
  v2[7] = v3;
  v2[8] = v3;
  v2[9] = v3;
  if (a2 < 1)
  {
    result = sub_23DA9BE48();
    __break(1u);
  }
  else
  {
    v2[2] = a1;
    v2[3] = a2;
    return (uint64_t)v2;
  }
  return result;
}

_QWORD *sub_23DA80E04@<X0>(double *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  void *v22;
  _QWORD *result;

  v5 = a1[7];
  v4 = a1[8];
  v6 = a1[9];
  v7 = a1[11];
  v8 = a1[12];
  v9 = a1[10];
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_QWORD *)(a2 + 24);
  swift_beginAccess();
  v12 = (void *)sub_23DA93394(v10, v11, v9);
  swift_endAccess();
  swift_beginAccess();
  v13 = v7;
  v14 = (void *)sub_23DA93394(v10, v11, v13);
  swift_endAccess();
  swift_beginAccess();
  v15 = v8;
  v16 = (void *)sub_23DA93394(v10, v11, v15);
  swift_endAccess();
  swift_beginAccess();
  v17 = v5;
  v18 = (void *)sub_23DA93394(v10, v11, v17);
  swift_endAccess();
  swift_beginAccess();
  v19 = v4;
  v20 = (void *)sub_23DA93394(v10, v11, v19);
  swift_endAccess();
  swift_beginAccess();
  v21 = v6;
  v22 = (void *)sub_23DA93394(v10, v11, v21);
  swift_endAccess();
  if (!v12)
  {

LABEL_12:
LABEL_13:

LABEL_14:
LABEL_15:
    result = 0;
    goto LABEL_16;
  }
  if (!v14)
  {

LABEL_11:
    goto LABEL_12;
  }
  if (!v16)
  {

    goto LABEL_11;
  }
  if (!v18)
  {

    goto LABEL_15;
  }
  if (!v20)
  {

    goto LABEL_14;
  }
  if (!v22)
  {

    goto LABEL_13;
  }
  type metadata accessor for HGMLInput();
  result = (_QWORD *)swift_allocObject();
  result[2] = v18;
  result[3] = v20;
  result[4] = v22;
  result[5] = v12;
  result[6] = v14;
  result[7] = v16;
LABEL_16:
  *a3 = result;
  return result;
}

uint64_t sub_23DA8106C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGBuffer()
{
  return objc_opt_self();
}

Swift::Bool __swiftcall HGHeadGestureResult.isPartGesture()()
{
  void *v0;

  return !objc_msgSend(v0, sel_headGesture) && objc_msgSend(v0, sel_headGesturePart) != 0;
}

Swift::String __swiftcall HGHeadGestureResult.description()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  Swift::String result;
  uint64_t v17;
  unint64_t v18;

  v1 = v0;
  v2 = sub_23DA9B7DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DA9B818();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_23DA9BDE8();
  sub_23DA9BB30();
  v10 = objc_msgSend(v0, sel_uuid);
  sub_23DA9B800();

  sub_23DA7BB4C();
  sub_23DA9BF50();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23DA9BB30();
  objc_msgSend(v1, sel_headGesture);
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v11 = objc_msgSend(v1, sel_avgConfidence);
  v12 = objc_msgSend(v11, sel_description);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  objc_msgSend(v1, sel_headGesturePart);
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  v13 = objc_msgSend(v1, sel_timestamp);
  sub_23DA9B7AC();

  sub_23DA9B7A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23DA9BC14();
  v14 = v17;
  v15 = (void *)v18;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

id sub_23DA81470(unsigned __int8 a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v2 = sub_23DA9B7DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone((Class)HGHeadGestureResult), sel_init);
  objc_msgSend(v6, sel_setHeadGesture_, 0);
  objc_msgSend(v6, sel_setHeadGesturePart_, a1);
  sub_23DA81BD0();
  v7 = (void *)sub_23DA9BD1C();
  objc_msgSend(v6, sel_setAvgConfidence_, v7);

  sub_23DA9B7D0();
  v8 = (void *)sub_23DA9B770();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v6, sel_setTimestamp_, v8);

  return v6;
}

uint64_t sub_23DA81588(char a1)
{
  return *(_QWORD *)&aBackgrouyes[8 * a1];
}

BOOL sub_23DA815A8(char a1, _BOOL8 a2)
{
  void *v2;

  if (a1 == 1)
  {
    v2 = &unk_250E6B6B8;
    return sub_23DA816F0(a2, (uint64_t)v2);
  }
  if (a1 == 2)
  {
    v2 = &unk_250E6B6E0;
    return sub_23DA816F0(a2, (uint64_t)v2);
  }
  return 0;
}

unint64_t sub_23DA815F8@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_23DA81B7C(*a1);
  *a2 = result;
  return result;
}

void sub_23DA81620(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23DA8162C()
{
  char *v0;

  return sub_23DA81588(*v0);
}

void sub_23DA81634(_QWORD *a1@<X8>)
{
  *a1 = &unk_250E6B708;
}

uint64_t sub_23DA81644()
{
  sub_23DA81B8C();
  return sub_23DA9BB90();
}

uint64_t sub_23DA816A0()
{
  sub_23DA81B8C();
  return sub_23DA9BB84();
}

BOOL sub_23DA816F0(_BOOL8 result, uint64_t a2)
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

void sub_23DA81750(_QWORD *a1@<X8>)
{
  *a1 = &unk_250E6B730;
}

ValueMetadata *type metadata accessor for HGHeadGesturePartInternal()
{
  return &type metadata for HGHeadGesturePartInternal;
}

uint64_t _s12HeadGestures21HGHeadGestureInternalOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12HeadGestures21HGHeadGestureInternalOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DA81854 + 4 * byte_23DA9E615[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23DA81888 + 4 * byte_23DA9E610[v4]))();
}

uint64_t sub_23DA81888(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA81890(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DA81898);
  return result;
}

uint64_t sub_23DA818A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DA818ACLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23DA818B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA818B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HGHeadGestureInternal()
{
  return &type metadata for HGHeadGestureInternal;
}

uint64_t sub_23DA818D4()
{
  return sub_23DA81964(&qword_256CDCE18, &qword_256CDCE20);
}

unint64_t sub_23DA818FC()
{
  unint64_t result;

  result = qword_256CDCE28;
  if (!qword_256CDCE28)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E790, &type metadata for HGHeadGestureInternal);
    atomic_store(result, (unint64_t *)&qword_256CDCE28);
  }
  return result;
}

uint64_t sub_23DA81940()
{
  return sub_23DA81964(&qword_256CDCE30, &qword_256CDCE38);
}

uint64_t sub_23DA81964(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24263A4F8](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DA819A8()
{
  unint64_t result;

  result = qword_256CDCE40;
  if (!qword_256CDCE40)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E868, &type metadata for HGHeadGesturePartInternal);
    atomic_store(result, (unint64_t *)&qword_256CDCE40);
  }
  return result;
}

unint64_t sub_23DA819EC(unint64_t result)
{
  if (result >= 5)
    return 0;
  else
    return result;
}

uint64_t sub_23DA819F8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x756F72676B636142 && a2 == 0xEA0000000000646ELL;
  if (v3 || (sub_23DA9BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7562585 && a2 == 0xE300000000000000 || (sub_23DA9BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 28494 && a2 == 0xE200000000000000 || (sub_23DA9BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x67695220746C6954 && a2 == 0xEA00000000007468)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23DA9BF5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t sub_23DA81B7C(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

unint64_t sub_23DA81B8C()
{
  unint64_t result;

  result = qword_256CDCE48;
  if (!qword_256CDCE48)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E718, &type metadata for HGHeadGestureInternal);
    atomic_store(result, (unint64_t *)&qword_256CDCE48);
  }
  return result;
}

unint64_t sub_23DA81BD0()
{
  unint64_t result;

  result = qword_256CDBF48;
  if (!qword_256CDBF48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDBF48);
  }
  return result;
}

ValueMetadata *type metadata accessor for Orientation()
{
  return &type metadata for Orientation;
}

void *__swift_memcpy305_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x131uLL);
}

uint64_t getEnumTagSinglePayload for HGMotionState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 305))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 136);
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HGMotionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 304) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 305) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 305) = 0;
    if (a2)
      *(_BYTE *)(result + 136) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for HGMotionState()
{
  return &type metadata for HGMotionState;
}

double sub_23DA81D3C(float32x4_t *a1, double result, double a3, double a4, float32x4_t a5)
{
  uint64_t v5;
  float32x4_t v6;
  float v7;
  float32x4_t v8;
  uint64_t v9;
  float32x4_t *v10;
  float32x4_t v11;
  float32x4_t v12;
  int8x16_t v13;
  float32x2_t v14;
  unsigned __int32 v15;
  float32x2_t v16;
  float32x2_t v17;

  v5 = a1[1].i64[0];
  if (v5)
  {
    v6 = a1[2];
    v7 = 1.0 / (float)v5;
    v8 = vmulq_n_f32(v6, v7);
    v9 = v5 - 1;
    if (v5 != 1)
    {
      v10 = a1 + 3;
      a5.i32[0] = 0;
      do
      {
        v11 = *v10++;
        v12 = vmulq_f32(v6, v11);
        *(float32x2_t *)v12.f32 = vadd_f32(*(float32x2_t *)v12.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL));
        v12.f32[0] = vaddv_f32(*(float32x2_t *)v12.f32);
        v8 = vaddq_f32(v8, vmulq_n_f32((float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(a5, v12), 0), (int8x16_t)vsubq_f32((float32x4_t)0, v11), (int8x16_t)v11), v7));
        --v9;
      }
      while (v9);
    }
    v13 = (int8x16_t)vmulq_f32(v8, v8);
    v14 = vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
    if (vaddv_f32(v14) == 0.0)
    {
      return 0.0;
    }
    else
    {
      v15 = vadd_f32(v14, (float32x2_t)vdup_lane_s32((int32x2_t)v14, 1)).u32[0];
      v16 = vrsqrte_f32((float32x2_t)v15);
      v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15, vmul_f32(v16, v16)));
      *(_QWORD *)&result = vmulq_n_f32(v8, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15, vmul_f32(v17, v17))).f32[0]).u64[0];
    }
  }
  return result;
}

uint64_t sub_23DA81E10(void *__src, const void *a2)
{
  _BYTE v4[312];
  _BYTE __dst[312];

  memcpy(v4, __src, 0x131uLL);
  memcpy(__dst, a2, 0x131uLL);
  return sub_23DA81E64((uint64_t)v4, (uint64_t)__dst) & 1;
}

uint64_t sub_23DA81E64(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;
  float64x2_t v5[2];
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16[2];
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BYTE v27[128];
  _BYTE v28[128];
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v3 = 1;
    if ((v3 & 1) != 0)
      return 0;
  }
  sub_23DA6425C(a1 + 16, (uint64_t)v28);
  sub_23DA6425C(a2 + 16, (uint64_t)v29);
  sub_23DA6425C((uint64_t)v28, (uint64_t)v30);
  if (sub_23DA642A4((uint64_t)v30) == 1)
  {
    sub_23DA6425C((uint64_t)v29, (uint64_t)v27);
    result = sub_23DA642A4((uint64_t)v27);
    if ((_DWORD)result == 1)
      return result;
  }
  else
  {
    sub_23DA6425C((uint64_t)v29, (uint64_t)v27);
    if (sub_23DA642A4((uint64_t)v27) != 1)
    {
      sub_23DA6425C((uint64_t)v28, (uint64_t)v5);
      sub_23DA6425C((uint64_t)v29, (uint64_t)v16);
      if (v15 == v26
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v5[0], v16[0]), (int32x4_t)vceqq_f64(v5[1], v16[1]))), 0xFuLL))) & 1) != 0&& v6 == v17&& v7 == v18&& v8 == v19&& v9 == v20&& v10 == v21&& v11 == v22&& v12 == v23&& v13 == v24)
      {
        return v14 == v25;
      }
    }
  }
  return 0;
}

double sub_23DA8200C(float32x4_t a1)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;

  v2 = a1.f32[3];
  v3 = vmuls_lane_f32(a1.f32[0], a1, 3);
  v4 = a1.f32[2];
  v5 = vmuls_lane_f32(a1.f32[1], a1, 2);
  v6 = (float)(v3 + v5) + (float)(v3 + v5);
  v7 = vmulq_f32(a1, a1).f32[0];
  v8 = vmuls_lane_f32(a1.f32[1], *(float32x2_t *)a1.f32, 1);
  atan2f(v6, 1.0 - (float)((float)(v7 + v8) + (float)(v7 + v8)));
  v9 = vmuls_lane_f32(v2, *(float32x2_t *)a1.f32, 1);
  v10 = vmuls_lane_f32(a1.f32[0], a1, 2);
  v11 = atan2f(sqrtf((float)((float)(v9 - v10) + (float)(v9 - v10)) + 1.0), sqrtf(1.0 - (float)((float)(v9 - v10) + (float)(v9 - v10))));
  v12 = v11 + v11 + -1.57079633;
  v13 = vmuls_lane_f32(v2, a1, 2);
  v14 = vmuls_lane_f32(a1.f32[0], *(float32x2_t *)a1.f32, 1);
  v15 = (float)(v13 + v14) + (float)(v13 + v14);
  v16 = vmuls_lane_f32(v4, a1, 2);
  atan2f(v15, 1.0 - (float)((float)(v8 + v16) + (float)(v8 + v16)));
  return v12;
}

uint64_t sub_23DA820F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_23DA820F8(char *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void **v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _UNKNOWN **v22;
  char *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t result;
  _QWORD v28[2];
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v2 = v1;
  v29 = a1;
  v3 = sub_23DA9BA04();
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DA9BCD4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DA9BCB0();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_23DA9BA1C();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = sub_23DA63824();
  sub_23DA9BA10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_23DA63860(&qword_256CDB3D0, v10, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3D8);
  sub_23DA638A0(&qword_256CDB3E0, &qword_256CDB3D8, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5750], v5);
  v14 = v29;
  v15 = sub_23DA9BCF8();
  v1[2] = v14;
  v1[3] = v15;
  v16 = (void **)&v14[OBJC_IVAR___HGConfigurationInternal_mlConfig];
  swift_beginAccess();
  v17 = *v16;
  v18 = *(_QWORD *)((char *)*v16 + OBJC_IVAR___HGMLConfigurationInternal_modelType);
  if (v18 >= 2)
  {
    if (v18 != 2)
    {
      result = sub_23DA9BE48();
      __break(1u);
      return result;
    }
    v19 = type metadata accessor for HGEspressoV2Model();
    swift_allocObject();
    v23 = v14;
    v21 = (uint64_t)sub_23DA8806C(v17);
    v22 = &off_250E6D098;
  }
  else
  {
    v19 = type metadata accessor for HGEspressoV1Model();
    swift_allocObject();
    v20 = v14;
    v21 = sub_23DA6F6A0(v17);
    v22 = &off_250E6BED0;
  }
  v2[7] = v19;
  v2[8] = v22;
  v2[4] = v21;
  aBlock[4] = sub_23DA82920;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_5;
  v24 = _Block_copy(aBlock);
  swift_retain();
  sub_23DA9BA10();
  v35 = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  v25 = v32;
  v26 = v34;
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v13, v25, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
  swift_release();
  return (uint64_t)v2;
}

uint64_t sub_23DA82534(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1 + 4;
  v3 = a1[7];
  v4 = a1[8];
  __swift_project_boxed_opaque_existential_1(a1 + 4, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  v6 = a1[7];
  v5 = a1[8];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v6, v5);
}

uint64_t sub_23DA825AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC5D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCF08);
  v20 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCF10);
  v21 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  v22 = *(id *)(v2 + 24);
  v12 = v22;
  v13 = sub_23DA9BCC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDCF18);
  sub_23DA63824();
  sub_23DA638A0(&qword_256CDCF20, &qword_256CDCF18, MEMORY[0x24BDB9AF8]);
  sub_23DA63860((unint64_t *)&qword_256CDC5E8, (uint64_t (*)(uint64_t))sub_23DA63824, MEMORY[0x24BEE5670]);
  sub_23DA9B9D4();
  sub_23DA82884((uint64_t)v6);

  type metadata accessor for HGMLOutput();
  sub_23DA638A0(&qword_256CDCF28, &qword_256CDCF08, MEMORY[0x24BDB9A08]);
  swift_retain();
  sub_23DA9B920();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v7);
  sub_23DA638A0(&qword_256CDCF30, &qword_256CDCF10, MEMORY[0x24BDB94C8]);
  v15 = v19;
  v16 = sub_23DA9B914();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v15);
  return v16;
}

uint64_t sub_23DA82830()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMLHeadGesturesClassifier()
{
  return objc_opt_self();
}

uint64_t sub_23DA82884(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC5D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DA828C4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *a1;
  v5 = v2[7];
  v6 = v2[8];
  __swift_project_boxed_opaque_existential_1(v2 + 4, v5);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(v4, v5, v6);
  *a2 = result;
  return result;
}

uint64_t sub_23DA82920()
{
  _QWORD *v0;

  return sub_23DA82534(v0);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_23DA82940(uint64_t a1)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v4 = a1;
  v31 = MEMORY[0x24BEE4AF8];
  sub_23DA855F8(0, v2, 0);
  v3 = v31;
  result = sub_23DA86620(v4);
  v6 = result;
  v8 = v7;
  v9 = 0;
  v10 = v4 + 64;
  v25 = v4 + 80;
  v26 = v2;
  v27 = v7;
  v28 = v4;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v4 + 32))
  {
    v14 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v10 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(v4 + 36) != v8)
      goto LABEL_26;
    result = sub_23DA8329C(v30);
    if (v1)
    {
      swift_release();
      return v3;
    }
    v29 = v9;
    v16 = v30[0];
    v15 = v30[1];
    v31 = v3;
    v18 = *(_QWORD *)(v3 + 16);
    v17 = *(_QWORD *)(v3 + 24);
    if (v18 >= v17 >> 1)
    {
      result = sub_23DA855F8(v17 > 1, v18 + 1, 1);
      v3 = v31;
    }
    *(_QWORD *)(v3 + 16) = v18 + 1;
    v19 = v3 + 16 * v18;
    *(_QWORD *)(v19 + 32) = v16;
    *(_QWORD *)(v19 + 40) = v15;
    v4 = v28;
    v11 = 1 << *(_BYTE *)(v28 + 32);
    if (v6 >= v11)
      goto LABEL_27;
    v20 = *(_QWORD *)(v10 + 8 * v14);
    if ((v20 & (1 << v6)) == 0)
      goto LABEL_28;
    v8 = v27;
    if (*(_DWORD *)(v28 + 36) != v27)
      goto LABEL_29;
    v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      v11 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v12 = v29;
      v1 = 0;
      v13 = v26;
    }
    else
    {
      v22 = v14 + 1;
      v23 = (unint64_t)(v11 + 63) >> 6;
      v12 = v29;
      v1 = 0;
      v13 = v26;
      if (v14 + 1 < v23)
      {
        v24 = *(_QWORD *)(v10 + 8 * v22);
        if (v24)
        {
LABEL_21:
          v11 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v14)
          {
            v24 = *(_QWORD *)(v25 + 8 * v14++);
            if (v24)
            {
              v22 = v14 + 1;
              goto LABEL_21;
            }
          }
        }
      }
    }
    v9 = v12 + 1;
    v6 = v11;
    if (v9 == v13)
      return v3;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_23DA82B88()
{
  sub_23DA9BDE8();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  sub_23DA9BF50();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  sub_23DA9BF50();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  sub_23DA9BF50();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  sub_23DA9BC14();
  sub_23DA9BB30();
  return 0;
}

uint64_t sub_23DA82D90(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23DA82DD0 + 4 * byte_23DA9EA30[a1]))(0xD00000000000001DLL, 0x800000023DA9F9B0);
}

uint64_t sub_23DA82DD0()
{
  uint64_t v0;

  return v0 + 12;
}

uint64_t sub_23DA82E34(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23DA82E74 + 4 * byte_23DA9EA36[a1]))(0xD00000000000001DLL, 0x800000023DA9F9B0);
}

uint64_t sub_23DA82E74()
{
  uint64_t v0;

  return v0 + 12;
}

void sub_23DA82ED8(char *a1)
{
  sub_23DA8B488(*a1);
}

void sub_23DA82EE4()
{
  char *v0;

  sub_23DA8B610(*v0);
}

void sub_23DA82EEC(uint64_t a1)
{
  char *v1;

  sub_23DA8B7A8(a1, *v1);
}

void sub_23DA82EF4(uint64_t a1)
{
  char *v1;

  sub_23DA8B86C(a1, *v1);
}

uint64_t sub_23DA82EFC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DA86BBC();
  *a1 = result;
  return result;
}

uint64_t sub_23DA82F28@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23DA82D90(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23DA82F50()
{
  unsigned __int8 *v0;

  return sub_23DA82E34(*v0);
}

uint64_t sub_23DA82F58@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DA86BBC();
  *a1 = result;
  return result;
}

void sub_23DA82F7C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23DA82F88()
{
  sub_23DA8795C();
  return sub_23DA9C01C();
}

uint64_t sub_23DA82FB0()
{
  sub_23DA8795C();
  return sub_23DA9C028();
}

uint64_t sub_23DA82FD8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD148);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DA8795C();
  sub_23DA9C010();
  v8[15] = 0;
  sub_23DA9BF14();
  if (!v1)
  {
    v8[14] = 1;
    sub_23DA9BF14();
    v8[13] = 2;
    sub_23DA9BF20();
    v8[12] = 3;
    sub_23DA9BF20();
    v8[11] = 4;
    sub_23DA9BF20();
    v8[10] = 5;
    sub_23DA9BF14();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_23DA8318C@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_23DA86C04(a1, v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_23DA831CC(_QWORD *a1)
{
  return sub_23DA82FD8(a1);
}

unint64_t sub_23DA831E4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  sub_23DA85480((uint64_t)v0);
  v2 = sub_23DA82940(v1);
  sub_23DA854A8((uint64_t)v0);
  sub_23DA9BDE8();
  swift_bridgeObjectRelease();
  MEMORY[0x242639B5C](v2, MEMORY[0x24BEE0D00]);
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0xD00000000000001ALL;
}

uint64_t sub_23DA8329C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();
  sub_23DA82B88();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  result = sub_23DA9BB30();
  *a1 = 0;
  a1[1] = v3;
  return result;
}

unint64_t sub_23DA8335C()
{
  return sub_23DA831E4();
}

uint64_t sub_23DA8339C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  _OWORD *v30;
  __int128 v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  _QWORD *v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t result;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  _OWORD v72[2];
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;

  v3 = v2;
  v6 = v2 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed;
  v7 = sub_23DA9B7DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_BYTE *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen) = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionList) = a1;
  swift_bridgeObjectRetain();
  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool) = sub_23DA83A10(MEMORY[0x24BEE4AF8]);
  v9 = sub_23DA8B0F4(v8);
  sub_23DA866A8(0, v72);
  v10 = v73;
  v11 = v74;
  *(_QWORD *)(v3 + 16) = v9;
  v12 = (_QWORD *)(v3 + 16);
  v13 = v72[1];
  *(_OWORD *)(v3 + 24) = v72[0];
  *(_OWORD *)(v3 + 40) = v13;
  *(_QWORD *)(v3 + 56) = v10;
  *(_QWORD *)(v3 + 64) = v11;
  v14 = *(_QWORD *)(a1 + 16);
  v66 = a2;
  v67 = v3;
  if (!v14)
  {
    swift_bridgeObjectRelease();
    if (!a2)
      goto LABEL_36;
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  v15 = 0;
  v3 = 48;
  do
  {
    v18 = *(unsigned __int8 *)(a1 + v15 + 32);
    sub_23DA866A8(*(_BYTE *)(a1 + v15 + 32), &v75);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = (_QWORD *)*v12;
    v69 = (_QWORD *)*v12;
    *v12 = 0x8000000000000000;
    v22 = sub_23DA99868(v18);
    v23 = v20[2];
    v24 = (v21 & 1) == 0;
    v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    v26 = v21;
    if (v20[3] >= v25)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v29 = v69;
        if ((v21 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_23DA9277C();
        v29 = v69;
        if ((v26 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_23DA9111C(v25, isUniquelyReferenced_nonNull_native);
      v27 = sub_23DA99868(v18);
      if ((v26 & 1) != (v28 & 1))
      {
LABEL_46:
        result = sub_23DA9BF74();
        __break(1u);
        return result;
      }
      v22 = v27;
      v29 = v69;
      if ((v26 & 1) != 0)
      {
LABEL_3:
        v16 = (_OWORD *)(v29[7] + 48 * v22);
        v17 = v76;
        *v16 = v75;
        v16[1] = v17;
        v16[2] = v77;
        goto LABEL_4;
      }
    }
    v29[(v22 >> 6) + 8] |= 1 << v22;
    *(_BYTE *)(v29[6] + v22) = v18;
    v30 = (_OWORD *)(v29[7] + 48 * v22);
    v31 = v76;
    *v30 = v75;
    v30[1] = v31;
    v30[2] = v77;
    v32 = v29[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
      goto LABEL_43;
    v29[2] = v34;
LABEL_4:
    ++v15;
    *v12 = v29;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  while (v14 != v15);
  swift_bridgeObjectRelease_n();
  a2 = v66;
  v3 = v67;
  if (v66)
  {
LABEL_19:
    v35 = *(_QWORD *)(a2 + 16);
    if (!v35)
    {
LABEL_35:
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v3 = a2 + 80;
    while (1)
    {
      v68 = v35;
      v37 = *(unsigned __int8 *)(v3 - 48);
      v39 = *(_QWORD *)(v3 - 40);
      v38 = *(_QWORD *)(v3 - 32);
      v40 = *(_QWORD *)(v3 - 24);
      v41 = *(_QWORD *)(v3 - 16);
      v42 = *(_QWORD *)(v3 - 8);
      v43 = *(_QWORD *)v3;
      v44 = swift_isUniquelyReferenced_nonNull_native();
      v45 = (_QWORD *)*v12;
      v70 = (_QWORD *)*v12;
      *v12 = 0x8000000000000000;
      v47 = sub_23DA99868(v37);
      v48 = v45[2];
      v49 = (v46 & 1) == 0;
      v50 = v48 + v49;
      if (__OFADD__(v48, v49))
        goto LABEL_42;
      v51 = v46;
      if (v45[3] >= v50)
      {
        if ((v44 & 1) != 0)
        {
          v54 = v70;
          if ((v46 & 1) == 0)
            goto LABEL_30;
        }
        else
        {
          sub_23DA9277C();
          v54 = v70;
          if ((v51 & 1) == 0)
            goto LABEL_30;
        }
      }
      else
      {
        sub_23DA9111C(v50, v44);
        v52 = sub_23DA99868(v37);
        if ((v51 & 1) != (v53 & 1))
          goto LABEL_46;
        v47 = v52;
        v54 = v70;
        if ((v51 & 1) == 0)
        {
LABEL_30:
          v54[(v47 >> 6) + 8] |= 1 << v47;
          *(_BYTE *)(v54[6] + v47) = v37;
          v55 = (_QWORD *)(v54[7] + 48 * v47);
          *v55 = v39;
          v55[1] = v38;
          v55[2] = v40;
          v55[3] = v41;
          v55[4] = v42;
          v55[5] = v43;
          v56 = v54[2];
          v33 = __OFADD__(v56, 1);
          v57 = v56 + 1;
          if (v33)
            goto LABEL_44;
          v54[2] = v57;
          goto LABEL_22;
        }
      }
      v36 = (_QWORD *)(v54[7] + 48 * v47);
      *v36 = v39;
      v36[1] = v38;
      v36[2] = v40;
      v36[3] = v41;
      v36[4] = v42;
      v36[5] = v43;
LABEL_22:
      v3 += 56;
      *v12 = v54;
      swift_bridgeObjectRelease();
      v35 = v68 - 1;
      if (v68 == 1)
      {
        swift_endAccess();
        swift_bridgeObjectRelease();
        v3 = v67;
        goto LABEL_35;
      }
    }
  }
LABEL_36:
  if (qword_256CDAFF0 != -1)
LABEL_45:
    swift_once();
  v58 = sub_23DA9B860();
  __swift_project_value_buffer(v58, (uint64_t)qword_256CE1558);
  swift_retain_n();
  v59 = sub_23DA9B848();
  v60 = sub_23DA9BC8C();
  if (os_log_type_enabled(v59, v60))
  {
    v61 = (uint8_t *)swift_slowAlloc();
    v62 = swift_slowAlloc();
    v71 = v62;
    *(_DWORD *)v61 = 136315138;
    swift_beginAccess();
    v63 = swift_bridgeObjectRetain();
    v64 = sub_23DA82940(v63);
    sub_23DA9BDE8();
    swift_bridgeObjectRelease();
    MEMORY[0x242639B5C](v64, MEMORY[0x24BEE0D00]);
    sub_23DA9BB30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DA6701C(0xD00000000000001ALL, 0x800000023DAA1900, &v71);
    v3 = v67;
    sub_23DA9BD58();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v59, v60, "%s", v61, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v62, -1, -1);
    MEMORY[0x24263A588](v61, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  return v3;
}

uint64_t sub_23DA83A10(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_23DA85614(0, v1, 0);
    v2 = v11;
    v4 = a1 + 40;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD128);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD118);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23DA85614(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v11;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23DA85614(v5 > 1, v6 + 1, 1);
        v2 = v11;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      v7 = v2 + 16 * v6;
      *(_BYTE *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      v4 += 16;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_23DA83B54(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v3 = *a1;
  v4 = *(void **)(*a1 + 16);
  v5 = (void *)sub_23DA9BAA0();
  v6 = objc_msgSend(v4, sel_featureValueForName_, v5);

  if (!v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  v7 = objc_msgSend(v6, sel_stringValue);

  v8 = sub_23DA9BAC4();
  v10 = v9;

  v11 = *(void **)(v3 + 16);
  v12 = (void *)sub_23DA9BAA0();
  v13 = objc_msgSend(v11, sel_featureValueForName_, v12);

  if (!v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v14 = objc_msgSend(v13, sel_dictionaryValue);

  sub_23DA81BD0();
  v15 = sub_23DA9BA58();

  v16 = sub_23DA98DA8(v15);
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v16 + 16))
  {
LABEL_10:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v17 = sub_23DA99804(v8, v10);
  if ((v18 & 1) == 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v19 = *(double *)(*(_QWORD *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = *(void **)(v3 + 16);
  v21 = (void *)sub_23DA9BAA0();
  v22 = objc_msgSend(v20, sel_featureValueForName_, v21);

  if (v22)
  {
    v23 = objc_msgSend(v22, sel_dictionaryValue);

    v24 = sub_23DA9BA58();
    sub_23DA98DA8(v24);
    swift_bridgeObjectRelease();
    v25 = sub_23DA87050(v8, v10, v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a2 = v25;
    return;
  }
LABEL_11:
  __break(1u);
}

BOOL sub_23DA83DF0(id *a1)
{
  return objc_msgSend(*a1, sel_headGesture) != 0;
}

uint64_t sub_23DA83E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  void (*v38)(char *, uint64_t, uint64_t);
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void (*v51)(uint64_t, uint64_t);
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  id v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  id v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t result;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98[4];

  v1 = v0;
  v2 = sub_23DA9B7DC();
  v90 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DA9B818();
  v82 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v81 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9B860();
  v92 = *(void (**)(char *, uint64_t))(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v95 = (char *)&v79 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v88 = (uint64_t)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v85 = (uint64_t)&v79 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v89 = (uint64_t)&v79 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v79 - v19;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
  swift_retain_n();
  v93 = v21;
  v22 = sub_23DA9B848();
  v23 = sub_23DA9BC8C();
  v24 = os_log_type_enabled(v22, v23);
  v91 = v10;
  v94 = v1;
  v87 = v2;
  v84 = v4;
  v83 = v5;
  if (v24)
  {
    v25 = swift_slowAlloc();
    v80 = swift_slowAlloc();
    v98[0] = v80;
    *(_DWORD *)v25 = 134218242;
    v26 = (uint64_t *)(v94 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
    swift_beginAccess();
    v96 = *(_QWORD *)(*v26 + 16);
    sub_23DA9BD58();
    *(_WORD *)(v25 + 12) = 2080;
    v27 = *v26;
    swift_bridgeObjectRetain();
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD118);
    v29 = MEMORY[0x242639B5C](v27, v28);
    v30 = v7;
    v32 = v31;
    swift_bridgeObjectRelease();
    v96 = sub_23DA6701C(v29, v32, v98);
    v2 = v87;
    sub_23DA9BD58();
    swift_release_n();
    v7 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v22, v23, "[AG]Closing gate and aggregating %ld predictions:\n\t%s", (uint8_t *)v25, 0x16u);
    v33 = v80;
    swift_arrayDestroy();
    v1 = v94;
    MEMORY[0x24263A588](v33, -1, -1);
    MEMORY[0x24263A588](v25, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v34 = v90;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen) = 0;
  sub_23DA9B7D0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v20, 0, 1, v2);
  v35 = v89;
  sub_23DA63754((uint64_t)v20, v89);
  v36 = v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed;
  swift_beginAccess();
  sub_23DA6379C(v35, v36);
  swift_endAccess();
  v37 = v92;
  v38 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v92 + 2);
  v38(v95, v93, v7);
  swift_retain();
  v39 = sub_23DA9B848();
  v40 = sub_23DA9BC8C();
  v41 = os_log_type_enabled(v39, v40);
  v86 = v7;
  if (v41)
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v42 = 134217984;
    v43 = v85;
    sub_23DA6370C(v36, v85);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v43, 1, v2) == 1)
    {
LABEL_25:
      result = swift_release();
      __break(1u);
      return result;
    }
    sub_23DA9B7A0();
    v45 = v44;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v43, v2);
    v98[0] = v45;
    sub_23DA9BD58();
    swift_release();
    _os_log_impl(&dword_23DA5F000, v39, v40, "[AG]Closing gate at time: %f", v42, 0xCu);
    MEMORY[0x24263A588](v42, -1, -1);

    v7 = v86;
    v37 = v92;
  }
  else
  {

    swift_release();
  }
  v46 = (void (*)(char *, uint64_t))*((_QWORD *)v37 + 1);
  v46(v95, v7);
  v47 = objc_msgSend(objc_allocWithZone((Class)HGHeadGestureResult), sel_init);
  v48 = v88;
  sub_23DA6370C(v36, v88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v48, 1, v2) == 1)
  {
    __break(1u);
    goto LABEL_25;
  }
  v49 = v34;
  v50 = (void *)sub_23DA9B770();
  v51 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
  v51(v48, v2);
  objc_msgSend(v47, sel_setTimestamp_, v50);

  v52 = sub_23DA84E68();
  v95 = (char *)v51;
  if ((v52 & 1) != 0)
  {
    v53 = v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool;
    swift_beginAccess();
    v54 = *(_QWORD *)(*(_QWORD *)v53 + 16);
    if (v54)
    {
      v55 = *(unsigned __int8 *)(*(_QWORD *)v53 + 16 * v54 + 16);
LABEL_16:
      v56 = v55;
      goto LABEL_17;
    }
  }
  else
  {
    v55 = sub_23DA84824();
    if (v55 != 5)
      goto LABEL_16;
  }
  v55 = 0;
  v56 = 0;
LABEL_17:
  objc_msgSend(v47, sel_setHeadGesture_, v56);
  sub_23DA81BD0();
  sub_23DA84F28(v55);
  v57 = (void *)sub_23DA9BD1C();
  objc_msgSend(v47, sel_setAvgConfidence_, v57);

  v58 = v91;
  v38(v91, v93, v7);
  v59 = v47;
  v60 = sub_23DA9B848();
  v61 = sub_23DA9BC8C();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = swift_slowAlloc();
    v93 = swift_slowAlloc();
    v98[0] = v93;
    *(_DWORD *)v62 = 136315650;
    v63 = (unint64_t)objc_msgSend(v59, sel_headGesture);
    v92 = v46;
    v90 = v55;
    if (v63 > 2)
    {
      v66 = 0xE700000000000000;
      v65 = 0x6E776F6E6B6E55;
    }
    else
    {
      v64 = 8 * v63;
      v65 = *(_QWORD *)&aBackgrounod_6[8 * v63];
      v66 = *(_QWORD *)&aNd_7[v64];
    }
    v97 = sub_23DA6701C(v65, v66, v98);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2080;
    v67 = objc_msgSend(v59, sel_uuid);
    v68 = v81;
    sub_23DA9B800();

    sub_23DA7BB4C();
    v69 = v83;
    v70 = sub_23DA9BF50();
    v72 = v71;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v68, v69);
    v97 = sub_23DA6701C(v70, v72, v98);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 22) = 2048;
    v73 = objc_msgSend(v59, sel_timestamp);
    v55 = (uint64_t)v84;
    sub_23DA9B7AC();

    sub_23DA9B7A0();
    v75 = v74;
    ((void (*)(uint64_t, uint64_t))v95)(v55, v87);
    v97 = v75;
    sub_23DA9BD58();

    _os_log_impl(&dword_23DA5F000, v60, v61, "[AG] ML final prediction: %s, %s, at %f", (uint8_t *)v62, 0x20u);
    v76 = v93;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v76, -1, -1);
    MEMORY[0x24263A588](v62, -1, -1);

    v92(v91, v86);
    v1 = v94;
    LOBYTE(v55) = v90;
  }
  else
  {

    v46(v58, v7);
  }
  v77 = (_QWORD *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  swift_beginAccess();
  *v77 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  *(_BYTE *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed) = v55;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool) = 0;
  return (uint64_t)v59;
}

uint64_t sub_23DA84824()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  if (!v3)
    return 5;
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)(v2 + 40);
  v5 = MEMORY[0x24BEE4AF8];
  v6 = MEMORY[0x24BEE4AF8];
  do
  {
    v10 = *((_BYTE *)v4 - 8);
    if (v10)
    {
      v11 = *v4;
      v35 = v6;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23DA85614(0, *(_QWORD *)(v6 + 16) + 1, 1);
        v6 = v35;
      }
      v8 = *(_QWORD *)(v6 + 16);
      v7 = *(_QWORD *)(v6 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_23DA85614(v7 > 1, v8 + 1, 1);
        v6 = v35;
      }
      *(_QWORD *)(v6 + 16) = v8 + 1;
      v9 = v6 + 16 * v8;
      *(_BYTE *)(v9 + 32) = v10;
      *(_QWORD *)(v9 + 40) = v11;
    }
    v4 += 2;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v6 + 16);
  if (v12)
  {
    v35 = v5;
    sub_23DA856D8(0, v12, 0);
    v13 = v5;
    v14 = *(_QWORD *)(v5 + 16);
    v15 = 32;
    do
    {
      v16 = *(_BYTE *)(v6 + v15);
      v35 = v13;
      v17 = *(_QWORD *)(v13 + 24);
      if (v14 >= v17 >> 1)
      {
        sub_23DA856D8(v17 > 1, v14 + 1, 1);
        v13 = v35;
      }
      *(_QWORD *)(v13 + 16) = v14 + 1;
      *(_BYTE *)(v13 + v14 + 32) = v16;
      v15 += 16;
      ++v14;
      --v12;
    }
    while (v12);
    swift_release();
  }
  else
  {
    swift_release();
    v13 = MEMORY[0x24BEE4AF8];
  }
  v19 = *(_QWORD *)(v13 + 16);
  v20 = *(_QWORD *)(*v1 + 16);
  if (v19)
  {
    v34 = *(_QWORD *)(*v1 + 16);
    v35 = v5;
    sub_23DA856BC(0, v19, 0);
    v21 = 0;
    v22 = v35;
    v23 = *(_QWORD *)(v35 + 16);
    v24 = 16 * v23;
    do
    {
      v25 = *(_BYTE *)(v13 + v21 + 32);
      v35 = v22;
      v26 = *(_QWORD *)(v22 + 24);
      v27 = v23 + v21 + 1;
      if (v23 + v21 >= v26 >> 1)
      {
        sub_23DA856BC(v26 > 1, v23 + v21 + 1, 1);
        v22 = v35;
      }
      ++v21;
      *(_QWORD *)(v22 + 16) = v27;
      v28 = v22 + v24;
      *(_BYTE *)(v28 + 32) = v25;
      *(_QWORD *)(v28 + 40) = 1;
      v24 += 16;
    }
    while (v19 != v21);
    swift_bridgeObjectRelease();
    v20 = v34;
    if (*(_QWORD *)(v22 + 16))
      goto LABEL_24;
LABEL_26:
    v29 = MEMORY[0x24BEE4B00];
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  v22 = MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_26;
LABEL_24:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD100);
  v29 = sub_23DA9BE78();
LABEL_27:
  v35 = v29;
  sub_23DA86E18(v22, 1, &v35);
  swift_bridgeObjectRelease();
  v30 = sub_23DA84B50(v35);
  v32 = v31;
  swift_release();
  if (v32 >= v20 - v19)
    v33 = v30;
  else
    v33 = 0;
  if (v30 == 5)
    return 0;
  else
    return v33;
}

uint64_t sub_23DA84B50(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = a1 + 64;
  v2 = *(_BYTE *)(a1 + 32);
  v3 = 1 << v2;
  v4 = -1;
  if (1 << v2 < 64)
    v4 = ~(-1 << (1 << v2));
  v5 = v4 & *(_QWORD *)(a1 + 64);
  if (!v5)
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 > 6)
    {
      v9 = (unint64_t)(v3 + 63) >> 6;
      v22 = *(_QWORD *)(a1 + 72);
      if (v22)
      {
        v6 = 1;
LABEL_32:
        v8 = (v22 - 1) & v22;
        v7 = __clz(__rbit64(v22)) + (v6 << 6);
        goto LABEL_5;
      }
      if (v6 >= 8)
      {
        v22 = *(_QWORD *)(a1 + 80);
        if (v22)
        {
          v6 = 2;
          goto LABEL_32;
        }
        v22 = *(_QWORD *)(a1 + 88);
        if (v22)
        {
          v6 = 3;
          goto LABEL_32;
        }
LABEL_39:
        if (v6 >= 9)
        {
          v22 = *(_QWORD *)(a1 + 96);
          if (v22)
          {
            v6 = 4;
          }
          else
          {
            v22 = *(_QWORD *)(a1 + 104);
            if (!v22)
              goto LABEL_46;
            v6 = 5;
          }
          goto LABEL_32;
        }
      }
    }
    return 5;
  }
  v6 = 0;
  v7 = __clz(__rbit64(v5));
  v8 = (v5 - 1) & v5;
  v9 = (unint64_t)(v3 + 63) >> 6;
LABEL_5:
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_BYTE *)(v10 + v7);
  v13 = *(_QWORD *)(v11 + 8 * v7);
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v6 << 6);
      goto LABEL_7;
    }
    v18 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v18 >= v9)
      return v12;
    v19 = *(_QWORD *)(v1 + 8 * v18);
    ++v6;
    if (!v19)
    {
      v6 = v18 + 1;
      if (v18 + 1 >= v9)
        return v12;
      v19 = *(_QWORD *)(v1 + 8 * v6);
      if (!v19)
      {
        v6 = v18 + 2;
        if (v18 + 2 >= v9)
          return v12;
        v19 = *(_QWORD *)(v1 + 8 * v6);
        if (!v19)
        {
          v6 = v18 + 3;
          if (v18 + 3 >= v9)
            return v12;
          v19 = *(_QWORD *)(v1 + 8 * v6);
          if (!v19)
            break;
        }
      }
    }
LABEL_27:
    v8 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v6 << 6);
LABEL_7:
    v16 = *(_BYTE *)(v10 + v15);
    v17 = *(_QWORD *)(v11 + 8 * v15);
    if (v13 < v17)
      v12 = v16;
    if (v13 <= v17)
      v13 = v17;
  }
  v20 = v18 + 4;
  if (v20 >= v9)
    return v12;
  v19 = *(_QWORD *)(v1 + 8 * v20);
  if (v19)
  {
    v6 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v6 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v6 >= v9)
      return v12;
    v19 = *(_QWORD *)(v1 + 8 * v6);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
  __break(1u);
LABEL_46:
  v23 = 0;
  v24 = 6;
  if (v9 > 6)
    v24 = v9;
  while (v24 - 6 != v23)
  {
    v22 = *(_QWORD *)(a1 + 112 + 8 * v23++);
    if (v22)
    {
      v6 = v23 + 5;
      goto LABEL_32;
    }
  }
  return 5;
}

uint64_t sub_23DA84D70(unsigned __int8 a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  result = swift_beginAccess();
  v7 = *v5;
  v8 = *(_QWORD *)(*v5 + 16);
  if ((uint64_t)v8 < (uint64_t)a2)
    return 0;
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_25;
  if (v8 >= a2)
    v9 = v8 - a2;
  else
    v9 = 0;
  if (v9 != v8)
  {
    if (v9 >= v8)
    {
LABEL_26:
      __break(1u);
      return result;
    }
    if (*(unsigned __int8 *)(v7 + 32 + 16 * v9) != a1)
      return 0;
    if (v9 + 1 == v8)
      return 1;
    if (v8 >= a2)
      v10 = a2;
    else
      v10 = *(_QWORD *)(*v5 + 16);
    v11 = -(uint64_t)v10;
    v12 = (unsigned __int8 *)(v7 - 16 * v10 + 16 * v8 + 48);
    while (v8 + 1 + v11 < v8)
    {
      v13 = *v12;
      v12 += 16;
      result = v13 == a1;
      if (v13 != a1 || v11++ == -2)
        return result;
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  return 1;
}

uint64_t sub_23DA84E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool;
  swift_beginAccess();
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v3 && (v4 = *(_QWORD *)v2 + 16 * v3, v5 = *(unsigned __int8 *)(v4 + 16), *(_BYTE *)(v4 + 16)))
  {
    swift_beginAccess();
    v6 = *(_QWORD *)(v1 + 16);
    v7 = *(_QWORD *)(v1 + 56);
    if (*(_QWORD *)(v6 + 16))
    {
      v8 = sub_23DA99868(v5);
      if ((v9 & 1) != 0)
        v7 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 48 * v8 + 32);
    }
    v10 = sub_23DA84D70(v5, v7);
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_23DA84F28(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  double v27;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  swift_beginAccess();
  v4 = *v3;
  v5 = *(_QWORD *)(*v3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v7 = a1;
    swift_bridgeObjectRetain();
    v8 = (uint64_t *)(v4 + 40);
    v9 = MEMORY[0x24BEE4AF8];
    do
    {
      if (*((unsigned __int8 *)v8 - 8) == v7)
      {
        v13 = *v8;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23DA85614(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v11 = *(_QWORD *)(v9 + 16);
        v10 = *(_QWORD *)(v9 + 24);
        if (v11 >= v10 >> 1)
          sub_23DA85614(v10 > 1, v11 + 1, 1);
        *(_QWORD *)(v9 + 16) = v11 + 1;
        v12 = v9 + 16 * v11;
        *(_BYTE *)(v12 + 32) = v7;
        *(_QWORD *)(v12 + 40) = v13;
      }
      v8 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    v14 = *(_QWORD *)(v9 + 16);
    if (v14)
    {
LABEL_11:
      sub_23DA85630(0, v14, 0);
      v15 = v6;
      v16 = *(_QWORD *)(v6 + 16);
      v17 = 40;
      do
      {
        v18 = *(_QWORD *)(v9 + v17);
        v19 = *(_QWORD *)(v15 + 24);
        if (v16 >= v19 >> 1)
          sub_23DA85630(v19 > 1, v16 + 1, 1);
        *(_QWORD *)(v15 + 16) = v16 + 1;
        *(_QWORD *)(v15 + 8 * v16 + 32) = v18;
        v17 += 16;
        ++v16;
        --v14;
      }
      while (v14);
      swift_release();
      v20 = *(_QWORD *)(v15 + 16);
      if (!v20)
        return swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
    v14 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v14)
      goto LABEL_11;
  }
  swift_release();
  v15 = MEMORY[0x24BEE4AF8];
  v20 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (!v20)
    return swift_bridgeObjectRelease();
LABEL_16:
  if (v20 == 1)
  {
    v21 = 0;
    v22 = 0.0;
LABEL_24:
    v25 = v20 - v21;
    v26 = (double *)(v15 + 8 * v21 + 32);
    do
    {
      v27 = *v26++;
      v22 = v22 + v27;
      --v25;
    }
    while (v25);
    return swift_bridgeObjectRelease();
  }
  v21 = v20 & 0x7FFFFFFFFFFFFFFELL;
  v23 = (double *)(v15 + 40);
  v22 = 0.0;
  v24 = v20 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v22 = v22 + *(v23 - 1) + *v23;
    v23 += 2;
    v24 -= 2;
  }
  while (v24);
  if (v20 != v21)
    goto LABEL_24;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DA85190()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_23DA637E4(v0 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23DA851E8()
{
  return type metadata accessor for HGPredictionAggregator();
}

uint64_t type metadata accessor for HGPredictionAggregator()
{
  uint64_t result;

  result = qword_256CDCF68;
  if (!qword_256CDCF68)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DA8522C()
{
  unint64_t v0;

  sub_23DA62238();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t destroy for HGPredictionAggregator.HGPredictionAggregatorParameters()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for HGPredictionAggregator.HGPredictionAggregatorParameters(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HGPredictionAggregator.HGPredictionAggregatorParameters()
{
  return &type metadata for HGPredictionAggregator.HGPredictionAggregatorParameters;
}

uint64_t sub_23DA85480(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23DA854A8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_23DA854D0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_23DA9BE84();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_23DA85564(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_23DA9BD58();
  *a1 = v5;
  return result;
}

uint64_t sub_23DA855B4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_23DA855DC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA856F4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA855F8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA85840(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA85614(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA859A8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA85630(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA85B04(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA8564C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA85C60(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA85668(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA85DBC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA85684(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA85F18(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA856A0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA86074(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA856BC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA86374(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA856D8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23DA864D0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23DA856F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD130);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA85840(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBF60);
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
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA859A8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC350);
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA85B04(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC2E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA85C60(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC308);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA85DBC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC300);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA85F18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD120);
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA86074(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC2F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA861D0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD0F0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD0F8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA86374(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD108);
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA864D0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD110);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA86620(uint64_t a1)
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

void sub_23DA866A8(char a1@<W0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 == 2)
  {
    if (qword_256CDAFE8 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    if (qword_256CDAFE8 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  if (qword_256CDAFE8 != -1)
LABEL_9:
    swift_once();
LABEL_8:
  v3 = *(void **)(qword_256CE1550 + 16);
  v4 = (void *)sub_23DA9BAA0();
  objc_msgSend(v3, sel_doubleForKey_, v4);
  v6 = v5;

  v7 = *(void **)(qword_256CE1550 + 16);
  v8 = (void *)sub_23DA9BAA0();
  objc_msgSend(v7, sel_doubleForKey_, v8);
  v10 = v9;

  v11 = *(void **)(qword_256CE1550 + 16);
  v12 = (void *)sub_23DA9BAA0();
  v13 = objc_msgSend(v11, sel_integerForKey_, v12);

  v14 = *(void **)(qword_256CE1550 + 16);
  v15 = (void *)sub_23DA9BAA0();
  v16 = objc_msgSend(v14, sel_integerForKey_, v15);

  v17 = *(void **)(qword_256CE1550 + 16);
  v18 = (void *)sub_23DA9BAA0();
  v19 = objc_msgSend(v17, sel_integerForKey_, v18);

  v20 = *(void **)(qword_256CE1550 + 16);
  v21 = (void *)sub_23DA9BAA0();
  objc_msgSend(v20, sel_doubleForKey_, v21);
  v23 = v22;

  *a2 = v6;
  a2[1] = v10;
  a2[2] = v13;
  a2[3] = v16;
  a2[4] = v19;
  a2[5] = v23;
}

uint64_t sub_23DA86BBC()
{
  unint64_t v0;

  v0 = sub_23DA9BEA8();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_23DA86C04@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t result;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD138);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DA8795C();
  sub_23DA9C004();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v24 = 0;
  sub_23DA9BECC();
  v10 = v9;
  v23 = 1;
  sub_23DA9BECC();
  v12 = v11;
  v22 = 2;
  v13 = sub_23DA9BED8();
  v21 = 3;
  v14 = sub_23DA9BED8();
  v20 = 4;
  v18 = sub_23DA9BED8();
  v19 = 5;
  sub_23DA9BECC();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  a2[3] = v14;
  a2[4] = v18;
  a2[5] = v16;
  return result;
}

uint64_t sub_23DA86E18(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *i;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;

  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = result;
    v7 = *(unsigned __int8 *)(result + 32);
    v8 = *(_QWORD *)(result + 40);
    v9 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    v11 = sub_23DA99868(v7);
    v12 = v9[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (!__OFADD__(v12, v13))
    {
      v15 = v10;
      if (v9[3] >= v14)
      {
        if ((a2 & 1) != 0)
        {
          v18 = (_QWORD *)*a3;
          if ((v10 & 1) == 0)
            goto LABEL_13;
        }
        else
        {
          sub_23DA92E24();
          v18 = (_QWORD *)*a3;
          if ((v15 & 1) == 0)
            goto LABEL_13;
        }
      }
      else
      {
        sub_23DA9215C(v14, a2 & 1);
        v16 = sub_23DA99868(v7);
        if ((v15 & 1) != (v17 & 1))
        {
LABEL_29:
          result = sub_23DA9BF74();
          __break(1u);
          return result;
        }
        v11 = v16;
        v18 = (_QWORD *)*a3;
        if ((v15 & 1) == 0)
        {
LABEL_13:
          v18[(v11 >> 6) + 8] |= 1 << v11;
          *(_BYTE *)(v18[6] + v11) = v7;
          *(_QWORD *)(v18[7] + 8 * v11) = v8;
          v21 = v18[2];
          v19 = v18 + 2;
          v20 = v21 + 1;
          if (__OFADD__(v21, 1))
          {
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
          goto LABEL_14;
        }
      }
      v19 = (_QWORD *)(v18[7] + 8 * v11);
      v20 = *v19 + v8;
      if (!__OFADD__(*v19, v8))
      {
LABEL_14:
        *v19 = v20;
        v22 = v3 - 1;
        if (v3 == 1)
          return swift_bridgeObjectRelease();
        for (i = (uint64_t *)(v6 + 56); ; i += 2)
        {
          v27 = *((unsigned __int8 *)i - 8);
          v28 = *i;
          v29 = (_QWORD *)*a3;
          v30 = sub_23DA99868(v27);
          v32 = v29[2];
          v33 = (v31 & 1) == 0;
          v34 = __OFADD__(v32, v33);
          v35 = v32 + v33;
          if (v34)
            break;
          v36 = v31;
          if (v29[3] < v35)
          {
            sub_23DA9215C(v35, 1);
            v30 = sub_23DA99868(v27);
            if ((v36 & 1) != (v37 & 1))
              goto LABEL_29;
          }
          v38 = (_QWORD *)*a3;
          if ((v36 & 1) != 0)
          {
            v24 = (_QWORD *)(v38[7] + 8 * v30);
            v26 = *v24 + v28;
            if (__OFADD__(*v24, v28))
              goto LABEL_26;
          }
          else
          {
            v38[(v30 >> 6) + 8] |= 1 << v30;
            *(_BYTE *)(v38[6] + v30) = v27;
            *(_QWORD *)(v38[7] + 8 * v30) = v28;
            v25 = v38[2];
            v24 = v38 + 2;
            v26 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_28;
          }
          *v24 = v26;
          if (!--v22)
            return swift_bridgeObjectRelease();
        }
        goto LABEL_27;
      }
LABEL_26:
      __break(1u);
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_23DA87050(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  double v30;
  double v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78[3];
  unsigned __int8 v79;

  v4 = v3;
  v75 = sub_23DA9B860();
  v8 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v10 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3C0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23DA9B7DC();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v73 - v19;
  swift_bridgeObjectRetain();
  v21 = sub_23DA819F8(a1, a2);
  v79 = v21;
  v22 = OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen;
  if (*(_BYTE *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen) == 1)
  {
    v23 = v21;
    swift_beginAccess();
    v24 = *(_QWORD *)(v4 + 16);
    v25 = *(double *)(v4 + 32);
    if (*(_QWORD *)(v24 + 16))
    {
      v26 = sub_23DA99868(v23);
      v27 = v75;
      if ((v28 & 1) != 0)
        v25 = *(double *)(*(_QWORD *)(v24 + 56) + 48 * v26 + 8);
      if (v25 <= a3)
        goto LABEL_30;
    }
    else
    {
      v27 = v75;
      if (v25 <= a3)
      {
LABEL_30:
        v48 = v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool;
        swift_beginAccess();
        v49 = *(_QWORD **)v48;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)v48 = v49;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v49 = sub_23DA74AEC(0, v49[2] + 1, 1, v49);
          *(_QWORD *)v48 = v49;
        }
        v52 = v49[2];
        v51 = v49[3];
        if (v52 >= v51 >> 1)
        {
          v49 = sub_23DA74AEC((_QWORD *)(v51 > 1), v52 + 1, 1, v49);
          *(_QWORD *)v48 = v49;
        }
        v49[2] = v52 + 1;
        v53 = &v49[2 * v52];
        *((_BYTE *)v53 + 32) = v23;
        *((double *)v53 + 5) = a3;
        swift_endAccess();
        if ((sub_23DA84E68() & 1) != 0)
        {
          if (qword_256CDAFF0 != -1)
            swift_once();
          __swift_project_value_buffer(v27, (uint64_t)qword_256CE1558);
          v54 = sub_23DA9B848();
          v55 = sub_23DA9BC8C();
          if (!os_log_type_enabled(v54, v55))
            goto LABEL_48;
          v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v56 = 0;
          v57 = "[AG]Closing gate since recent predictions are consistent";
LABEL_47:
          _os_log_impl(&dword_23DA5F000, v54, v55, v57, v56, 2u);
          MEMORY[0x24263A588](v56, -1, -1);
LABEL_48:

          return sub_23DA83E18();
        }
        v58 = OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool;
        v59 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool);
        swift_beginAccess();
        v60 = *(_QWORD *)(v4 + 16);
        v61 = *(_QWORD *)(v4 + 48);
        if (*(_QWORD *)(v60 + 16))
        {
          v62 = sub_23DA99868(v59);
          if ((v63 & 1) != 0)
            v61 = *(_QWORD *)(*(_QWORD *)(v60 + 56) + 48 * v62 + 24);
        }
        if ((sub_23DA84D70(0, v61) & 1) != 0)
        {
          if (qword_256CDAFF0 != -1)
            swift_once();
          __swift_project_value_buffer(v27, (uint64_t)qword_256CE1558);
          v54 = sub_23DA9B848();
          v55 = sub_23DA9BC8C();
          if (!os_log_type_enabled(v54, v55))
            goto LABEL_48;
          v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v56 = 0;
          v57 = "[AG]Closing gate since pool has max number of background windows";
          goto LABEL_47;
        }
        v65 = *(_QWORD *)(*(_QWORD *)v48 + 16);
        v66 = *(_QWORD *)(v4 + 16);
        v67 = *(_QWORD *)(v4 + 40);
        if (*(_QWORD *)(v66 + 16))
        {
          v68 = sub_23DA99868(*(unsigned __int8 *)(v4 + v58));
          if ((v69 & 1) != 0)
            v67 = *(_QWORD *)(*(_QWORD *)(v66 + 56) + 48 * v68 + 16);
        }
        if (v65 == v67)
        {
          if (qword_256CDAFF0 != -1)
            swift_once();
          __swift_project_value_buffer(v27, (uint64_t)qword_256CE1558);
          swift_retain();
          v70 = sub_23DA9B848();
          v71 = sub_23DA9BC8C();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v72 = 134217984;
            v76 = *(_QWORD *)(*(_QWORD *)v48 + 16);
            sub_23DA9BD58();
            swift_release();
            _os_log_impl(&dword_23DA5F000, v70, v71, "[AG]Closing gate since there are %ld predictions in pool", v72, 0xCu);
            MEMORY[0x24263A588](v72, -1, -1);

          }
          else
          {

            swift_release();
          }
          return sub_23DA83E18();
        }
        return 0;
      }
    }
    LOBYTE(v23) = 0;
    v79 = 0;
    goto LABEL_30;
  }
  v29 = v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed;
  swift_beginAccess();
  sub_23DA6370C(v29, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_23DA637E4((uint64_t)v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
    sub_23DA9B7D0();
    sub_23DA9B764();
    v31 = v30;
    v32 = *(void (**)(char *, uint64_t))(v15 + 8);
    v32(v18, v14);
    v33 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed);
    if (*(_BYTE *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed))
    {
      swift_beginAccess();
      v34 = *(_QWORD *)(v4 + 16);
      v35 = *(double *)(v4 + 64);
      if (*(_QWORD *)(v34 + 16))
      {
        v36 = sub_23DA99868(v33);
        if ((v37 & 1) != 0)
          v35 = *(double *)(*(_QWORD *)(v34 + 56) + 48 * v36 + 40);
      }
      v32(v20, v14);
      if (v31 < v35)
        return 0;
    }
    else
    {
      v32(v20, v14);
    }
  }
  v38 = v79;
  if ((sub_23DA816EC(v79, *(_QWORD *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionList)) & 1) != 0)
  {
    swift_beginAccess();
    v39 = *(_QWORD *)(v4 + 16);
    v40 = *(double *)(v4 + 24);
    if (*(_QWORD *)(v39 + 16))
    {
      v41 = sub_23DA99868(v38);
      v27 = v75;
      if ((v42 & 1) != 0)
        v40 = *(double *)(*(_QWORD *)(v39 + 56) + 48 * v41);
      if (v40 > a3)
        return 0;
    }
    else
    {
      v27 = v75;
      if (v40 > a3)
        return 0;
    }
    if (qword_256CDAFF0 != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v27, (uint64_t)qword_256CE1558);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v43, v27);
    v44 = sub_23DA9B848();
    v45 = sub_23DA9BC8C();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      v74 = swift_slowAlloc();
      v78[0] = v74;
      *(_DWORD *)v46 = 136315138;
      swift_beginAccess();
      v77 = sub_23DA6701C(*(_QWORD *)&aBackgrouyes_0[8 * (char)v79], *(_QWORD *)&aNd_8[8 * (char)v79], v78);
      v27 = v75;
      sub_23DA9BD58();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DA5F000, v44, v45, "[AG] Opening gate for '%s' prediction", v46, 0xCu);
      v47 = v74;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v47, -1, -1);
      MEMORY[0x24263A588](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v27);
    *(_BYTE *)(v4 + v22) = 1;
    swift_beginAccess();
    LOBYTE(v23) = v79;
    *(_BYTE *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool) = v79;
    goto LABEL_30;
  }
  return 0;
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

uint64_t getEnumTagSinglePayload for HGAggregationParameters(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HGAggregationParameters(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HGAggregationParameters()
{
  return &type metadata for HGAggregationParameters;
}

unint64_t sub_23DA8795C()
{
  unint64_t result;

  result = qword_256CDD140;
  if (!qword_256CDD140)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9ECBC, &type metadata for HGAggregationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDD140);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HGAggregationParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HGAggregationParameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23DA87A7C + 4 * byte_23DA9EA41[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23DA87AB0 + 4 * byte_23DA9EA3C[v4]))();
}

uint64_t sub_23DA87AB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA87AB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DA87AC0);
  return result;
}

uint64_t sub_23DA87ACC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DA87AD4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23DA87AD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA87AE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HGAggregationParameters.CodingKeys()
{
  return &type metadata for HGAggregationParameters.CodingKeys;
}

unint64_t sub_23DA87B00()
{
  unint64_t result;

  result = qword_256CDD150;
  if (!qword_256CDD150)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9EC94, &type metadata for HGAggregationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDD150);
  }
  return result;
}

unint64_t sub_23DA87B48()
{
  unint64_t result;

  result = qword_256CDD158;
  if (!qword_256CDD158)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9EBCC, &type metadata for HGAggregationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDD158);
  }
  return result;
}

unint64_t sub_23DA87B90()
{
  unint64_t result;

  result = qword_256CDD160;
  if (!qword_256CDD160)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9EBF4, &type metadata for HGAggregationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256CDD160);
  }
  return result;
}

unint64_t sub_23DA87BD4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2B8);
  v2 = sub_23DA9BE78();
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
    sub_23DA8B3C0(v6, (uint64_t)&v15, &qword_256CDD2C0);
    v7 = v15;
    v8 = v16;
    result = sub_23DA99804(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23DA68CE4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_23DA87D08(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2E0);
  v2 = sub_23DA9BE78();
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
    sub_23DA8B3C0(v6, (uint64_t)&v13, &qword_256CDD2E8);
    v7 = v13;
    result = sub_23DA998D0(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_23DA68CE4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_23DA87E34(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  char v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _OWORD v13[2];
  uint64_t v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2F0);
  v2 = (_QWORD *)sub_23DA9BE78();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23DA8B3C0(v4, (uint64_t)v13, &qword_256CDD2F8);
    result = sub_23DA999C0((uint64_t)v13);
    if ((v6 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v7 = v2[6] + 40 * result;
    v8 = v13[0];
    v9 = v13[1];
    *(_QWORD *)(v7 + 32) = v14;
    *(_OWORD *)v7 = v8;
    *(_OWORD *)(v7 + 16) = v9;
    *(_QWORD *)(v2[7] + 8 * result) = v15;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 48;
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

unint64_t sub_23DA87F5C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2D0);
  v2 = (_QWORD *)sub_23DA9BE78();
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
    result = sub_23DA99804(v5, v6);
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

_QWORD *sub_23DA8806C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v2 = v1;
  v3 = MEMORY[0x24BEE4B00];
  v1[4] = 0;
  v1[5] = v3;
  v1[6] = 0;
  v1[2] = a1;
  v1[3] = 0;
  v4 = qword_256CDAFF0;
  v5 = a1;
  if (v4 != -1)
    swift_once();
  v6 = sub_23DA9B860();
  __swift_project_value_buffer(v6, (uint64_t)qword_256CE1558);
  v7 = sub_23DA9B848();
  v8 = sub_23DA9BC80();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23DA5F000, v7, v8, "[HGModel] using v2 model", v9, 2u);
    MEMORY[0x24263A588](v9, -1, -1);
  }

  return v2;
}

void sub_23DA88168()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *oslog;

  v1 = v0;
  sub_23DA71660();
  if (v2)
  {
    v10 = sub_23DA97048();
    type metadata accessor for E5RTExecutionStreamOperation();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    swift_bridgeObjectRelease();
    v1[3] = v11;
    swift_release();
    v12 = v1[3];
    if (v12)
    {
      v13 = *(_QWORD *)(v12 + 16);
      swift_retain();
      if (e5rt_execution_stream_operation_get_num_inputs())
      {
LABEL_17:
        swift_release();
        return;
      }
      v14 = sub_23DA96998(0, v13);
      if (e5rt_execution_stream_operation_get_num_outputs())
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      v15 = (_QWORD *)sub_23DA9697C(0, v13);
      if (!v15[2])
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      v29 = v15[4];
      v30 = v15[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16 = *(_QWORD *)(v14 + 16);
      if (v16)
      {
        v17 = v14 + 40;
        do
        {
          if (v1[3])
          {
            sub_23DA9BB0C();
            swift_retain_n();
            swift_bridgeObjectRetain();
            v20 = e5rt_execution_stream_operation_retain_input_port();
            swift_release();
            if (v20)
            {
              sub_23DA8B2F0();
              v18 = (void *)swift_allocError();
              *(_DWORD *)v19 = v20;
              *(_BYTE *)(v19 + 4) = 0;
            }
            else
            {
              sub_23DA8B37C();
              v18 = (void *)swift_allocError();
              *v21 = 0;
            }
            swift_willThrow();

            swift_bridgeObjectRelease();
            swift_release_n();
          }
          v17 += 16;
          --v16;
        }
        while (v16);
      }
      swift_bridgeObjectRelease();
      v22 = sub_23DA88A64(v29, v30, 0);
      swift_bridgeObjectRelease();
      v1[6] = v22;
      swift_release();
      v23 = sub_23DA971A8();
      type metadata accessor for E5RTExecutionStream();
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v23;
      v1[4] = v24;
      swift_release();
      if (!v1[4])
        goto LABEL_17;
      swift_retain();
      v25 = e5rt_execution_stream_encode_operation();
      if (!v25)
      {
        swift_release();
        goto LABEL_17;
      }
      v26 = v25;
      sub_23DA8B2F0();
      v27 = (void *)swift_allocError();
      *(_DWORD *)v28 = v26;
      *(_BYTE *)(v28 + 4) = 0;
      swift_willThrow();
      swift_release();
      swift_release();
      if (qword_256CDAFF0 != -1)
        swift_once();
      v3 = sub_23DA9B860();
      __swift_project_value_buffer(v3, (uint64_t)qword_256CE1558);
      v4 = sub_23DA9B848();
      v5 = sub_23DA9BC98();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_23DA5F000, v4, v5, "[HGEspressoV2Model] loadModel Error: Failed to load E5 model", v6, 2u);
        MEMORY[0x24263A588](v6, -1, -1);
      }

    }
  }
  else
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v7 = sub_23DA9B860();
    __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
    oslog = sub_23DA9B848();
    v8 = sub_23DA9BC98();
    if (os_log_type_enabled(oslog, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23DA5F000, oslog, v8, "[HGEspressoV2Model] loadModel Error: invalid model path.", v9, 2u);
      MEMORY[0x24263A588](v9, -1, -1);
    }

  }
}

uint64_t sub_23DA88A64(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;

  if (!*(_QWORD *)(v3 + 24))
    return 0;
  if ((a3 & 1) != 0)
    v6 = sub_23DA8B35C;
  else
    v6 = sub_23DA8B33C;
  swift_retain_n();
  v6(a1, a2);
  sub_23DA96840();
  v8 = sub_23DA966FC();
  type metadata accessor for E5RTBufferObject();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  e5rt_io_port_bind_buffer_object();
  swift_release();
  v10 = e5rt_tensor_desc_release();
  if (!v10)
  {
    swift_release();
    swift_release();
    return v9;
  }
  v11 = v10;
  sub_23DA8B2F0();
  swift_allocError();
  *(_DWORD *)v12 = v11;
  *(_BYTE *)(v12 + 4) = 0;
  swift_willThrow();
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_23DA88C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4(a1, a2, *(_QWORD *)(a3 + 16));
  v6 = result;
  if (!v4)
  {
    type metadata accessor for E5RTIOPort();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v6;
  }
  return result;
}

uint64_t sub_23DA88CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  uint64_t v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int size;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(v0 + 32))
    return 0;
  swift_retain();
  v1 = sub_23DA7329C();
  v39 = v1 + 56;
  v2 = 1 << *(_BYTE *)(v1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(v1 + 56);
  v36 = v0;
  v38 = v0 + 40;
  swift_beginAccess();
  v5 = 0;
  v40 = (unint64_t)(v2 + 63) >> 6;
  v37 = v1;
  while (1)
  {
    if (v4)
    {
      v6 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v7 = v6 | (v5 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      JUMPOUT(0x23DA894C8);
    }
    if (v5 >= v40)
      goto LABEL_30;
    v9 = *(_QWORD *)(v39 + 8 * v5);
    if (!v9)
      break;
LABEL_18:
    v4 = (v9 - 1) & v9;
    v7 = __clz(__rbit64(v9)) + (v5 << 6);
LABEL_19:
    v11 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v7);
    v13 = *v11;
    v12 = v11[1];
    swift_bridgeObjectRetain();
    v14 = sub_23DA72F1C(v13, v12);
    if (v14
      && (v15 = v14,
          v16 = objc_msgSend(v14, sel_multiArrayValue),
          v15,
          v16))
    {
      if (*(_QWORD *)(*(_QWORD *)v38 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23DA99804(v13, v12);
        if ((v17 & 1) != 0)
        {
          swift_retain();
          swift_bridgeObjectRelease();
          v18 = swift_bridgeObjectRelease();
          MEMORY[0x24BDAC7A8](v18);
          sub_23DA9BC50();
          swift_bridgeObjectRelease();
          swift_release();

          v1 = v37;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();

      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v10 = v5 + 1;
  if (v5 + 1 >= v40)
    goto LABEL_30;
  v9 = *(_QWORD *)(v39 + 8 * v10);
  if (v9)
    goto LABEL_17;
  v10 = v5 + 2;
  if (v5 + 2 >= v40)
    goto LABEL_30;
  v9 = *(_QWORD *)(v39 + 8 * v10);
  if (v9)
    goto LABEL_17;
  v10 = v5 + 3;
  if (v5 + 3 >= v40)
    goto LABEL_30;
  v9 = *(_QWORD *)(v39 + 8 * v10);
  if (v9)
  {
LABEL_17:
    v5 = v10;
    goto LABEL_18;
  }
  while (1)
  {
    v5 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      JUMPOUT(0x23DA895ACLL);
    }
    if (v5 >= v40)
      break;
    v9 = *(_QWORD *)(v39 + 8 * v5);
    ++v10;
    if (v9)
      goto LABEL_18;
  }
LABEL_30:
  swift_release();
  v19 = e5rt_execution_stream_execute_sync();
  if (v19)
  {
    v20 = v19;
    sub_23DA8B2F0();
    v21 = (void *)swift_allocError();
    *(_DWORD *)v22 = v20;
    *(_BYTE *)(v22 + 4) = 0;
    swift_willThrow();
    goto LABEL_32;
  }
  if (*(_QWORD *)(v36 + 48))
  {
    v41 = xmmword_23DA9EDA0;
    swift_retain();
    sub_23DA965C0();
    size = e5rt_buffer_object_get_size();
    if (!size)
    {
      sub_23DA8ABAC((uint64_t)&v41);
      __asm { BR              X10 }
    }
    v34 = size;
    sub_23DA8B2F0();
    v21 = (void *)swift_allocError();
    *(_DWORD *)v35 = v34;
    *(_BYTE *)(v35 + 4) = 0;
    swift_willThrow();
    swift_release();
    sub_23DA7161C(v41, *((unint64_t *)&v41 + 1));
LABEL_32:
    if (qword_256CDAFF0 != -1)
      swift_once();
    v23 = sub_23DA9B860();
    __swift_project_value_buffer(v23, (uint64_t)qword_256CE1558);
    v24 = v21;
    v25 = v21;
    v26 = sub_23DA9B848();
    v27 = sub_23DA9BC98();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      *(_QWORD *)&v41 = v29;
      *(_DWORD *)v28 = 136315138;
      swift_getErrorValue();
      v30 = sub_23DA9BF80();
      sub_23DA6701C(v30, v31, (uint64_t *)&v41);
      sub_23DA9BD58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DA5F000, v26, v27, "[HGEspressoV2Model]:prediction Error %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v29, -1, -1);
      MEMORY[0x24263A588](v28, -1, -1);

      swift_release();
    }
    else
    {
      swift_release();

    }
  }
  else
  {
    swift_release();
  }
  return 0;
}

void sub_23DA8993C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, _BYTE *a6)
{
  uint64_t v6;
  uint64_t v12;
  void *v13;
  int size;
  int v15;
  uint64_t v16;

  v12 = sub_23DA965C0();
  if (!v6)
  {
    v13 = (void *)v12;
    size = e5rt_buffer_object_get_size();
    if (size)
    {
      v15 = size;
      sub_23DA8B2F0();
      swift_allocError();
      *(_DWORD *)v16 = v15;
      *(_BYTE *)(v16 + 4) = 0;
      swift_willThrow();
    }
    else
    {
      sub_23DA89A48(v13, (uint64_t)v13, a1, a2, a4, a5, a6);
    }
  }
}

void sub_23DA89A48(void *a1, uint64_t a2, void *__src, uint64_t a4, uint64_t a5, unint64_t a6, _BYTE *a7)
{
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (__src)
    v10 = a4 - (_QWORD)__src;
  else
    v10 = 0;
  if (a1)
  {
    if (v10 == a2 - (_QWORD)a1)
    {
      if (__src)
        memmove(a1, __src, a4 - (_QWORD)__src);
      return;
    }
  }
  else if (!v10)
  {
    return;
  }
  if (qword_256CDAFF0 != -1)
    swift_once();
  v11 = sub_23DA9B860();
  __swift_project_value_buffer(v11, (uint64_t)qword_256CE1558);
  swift_bridgeObjectRetain_n();
  v12 = sub_23DA9B848();
  v13 = sub_23DA9BC98();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v16 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_23DA6701C(a5, a6, &v16);
    sub_23DA9BD58();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23DA5F000, v12, v13, "[HGEspressoV2Model]:loadData Error, source/des buffer size mismatch for %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v15, -1, -1);
    MEMORY[0x24263A588](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *a7 = 0;
}

void *sub_23DA89C50(void *result, uint64_t a2, void *__src, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a4 - (_QWORD)__src;
  else
    v4 = 0;
  if (!result)
  {
    if (v4 <= 0)
      return result;
LABEL_10:
    result = (void *)sub_23DA9BE84();
    __break(1u);
    return result;
  }
  if (a2 - (uint64_t)result < v4)
    goto LABEL_10;
  if (__src)
    return memmove(result, __src, a4 - (_QWORD)__src);
  return result;
}

uint64_t sub_23DA89CDC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGEspressoV2Model()
{
  return objc_opt_self();
}

void sub_23DA89D40()
{
  sub_23DA88168();
}

uint64_t sub_23DA89D60()
{
  return sub_23DA88CBC();
}

_QWORD *sub_23DA89D80(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD0F0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_23DA8AEDC((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23DA8B334();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23DA89E74(char *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;

  if (!a2)
    return MEMORY[0x24BEE4AF8];
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDC358);
    v4 = 4 * a2;
    v5 = (char *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 29;
    *((_QWORD *)v5 + 2) = a2;
    *((_QWORD *)v5 + 3) = 2 * (v7 >> 2);
    v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 4 * a2);
      return (uint64_t)v5;
    }
  }
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA89FA8(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_23DA8B0E0(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_23DA8A010(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_23DA8A010(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
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
  double *v31;
  double v32;
  uint64_t v33;
  double *v34;
  double v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
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
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  unint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double *__dst;

  v3 = a1[1];
  result = sub_23DA9BF44();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v88 = *a1;
      v89 = *a1 + 16;
      v90 = -1;
      for (i = 1; i != v3; ++i)
      {
        v92 = *(double *)(v88 + 24 * i + 16);
        v93 = v90;
        v94 = v89;
        do
        {
          if (*(double *)v94 >= v92)
            break;
          if (!v88)
            goto LABEL_141;
          v95 = *(_QWORD *)(v94 + 8);
          v96 = *(_QWORD *)(v94 + 16);
          *(_OWORD *)(v94 + 8) = *(_OWORD *)(v94 - 16);
          *(_QWORD *)(v94 + 24) = *(_QWORD *)v94;
          *(_QWORD *)(v94 - 16) = v95;
          *(_QWORD *)(v94 - 8) = v96;
          *(double *)v94 = v92;
          v94 -= 24;
        }
        while (!__CFADD__(v93++, 1));
        v89 += 24;
        --v90;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v6 = result;
  v106 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v98 = v12;
      v108 = v9;
      if (v13 >= 2)
      {
        v99 = *v106;
        do
        {
          v100 = v13 - 2;
          if (v13 < 2)
            goto LABEL_132;
          if (!v99)
            goto LABEL_145;
          v101 = v98;
          v102 = *(_QWORD *)&v98[16 * v100 + 32];
          v103 = *(_QWORD *)&v98[16 * v13 + 24];
          sub_23DA8A728((double *)(v99 + 24 * v102), (double *)(v99 + 24 * *(_QWORD *)&v98[16 * v13 + 16]), v99 + 24 * v103, __dst);
          if (v1)
            break;
          if (v103 < v102)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v101 = sub_23DA8AB98((uint64_t)v101);
          if (v100 >= *((_QWORD *)v101 + 2))
            goto LABEL_134;
          v104 = &v101[16 * v100 + 32];
          *(_QWORD *)v104 = v102;
          *((_QWORD *)v104 + 1) = v103;
          v105 = *((_QWORD *)v101 + 2);
          if (v13 > v105)
            goto LABEL_135;
          memmove(&v101[16 * v13 + 16], &v101[16 * v13 + 32], 16 * (v105 - v13));
          v98 = v101;
          *((_QWORD *)v101 + 2) = v105 - 1;
          v13 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v108 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v108 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD0F8);
    v8 = sub_23DA9BBD8();
    *(_QWORD *)(v8 + 16) = v7;
    v108 = v8;
    __dst = (double *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v107 = *a1 + 64;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v109 = v6;
  v110 = v3;
  v111 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(double *)(v11 + 24 * v10 + 16);
      v16 = *(double *)(v11 + 24 * v14 + 16);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (double *)(v107 + 24 * v14);
        v18 = v15;
        while (1)
        {
          v19 = v18;
          v18 = *v17;
          if (v16 < v15 == v19 >= *v17)
            break;
          ++v10;
          v17 += 3;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14)
          goto LABEL_138;
        if (v14 < v10)
        {
          v20 = 24 * v10;
          v21 = 24 * v14;
          v22 = v10;
          v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11)
                goto LABEL_144;
              v24 = v11 + v21;
              v25 = v11 + v20;
              v26 = *(_QWORD *)(v11 + v21);
              v27 = *(_QWORD *)(v11 + v21 + 8);
              v28 = *(_QWORD *)(v11 + v21 + 16);
              v29 = *(_QWORD *)(v11 + v20 - 8);
              *(_OWORD *)v24 = *(_OWORD *)(v11 + v20 - 24);
              *(_QWORD *)(v24 + 16) = v29;
              *(_QWORD *)(v25 - 24) = v26;
              *(_QWORD *)(v25 - 16) = v27;
              *(_QWORD *)(v25 - 8) = v28;
            }
            ++v23;
            v20 -= 24;
            v21 += 24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_136;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v30 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_139;
    if (v30 >= v3)
      v30 = v3;
    if (v30 < v14)
      break;
    if (v10 != v30)
    {
      v31 = (double *)(v11 + 24 * v10);
      do
      {
        v32 = *(double *)(v11 + 24 * v10 + 16);
        v33 = v14;
        v34 = v31;
        do
        {
          if (*(v34 - 1) >= v32)
            break;
          if (!v11)
            goto LABEL_142;
          v35 = *v34;
          v36 = *((_QWORD *)v34 + 1);
          *(_OWORD *)v34 = *(_OWORD *)(v34 - 3);
          v34[2] = *(v34 - 1);
          *((_QWORD *)v34 - 2) = v36;
          *(v34 - 1) = v32;
          *(v34 - 3) = v35;
          v34 -= 3;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 3;
      }
      while (v10 != v30);
      v10 = v30;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_23DA8A9E4(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v38 = *((_QWORD *)v12 + 2);
    v37 = *((_QWORD *)v12 + 3);
    v13 = v38 + 1;
    v11 = v111;
    if (v38 >= v37 >> 1)
    {
      v87 = sub_23DA8A9E4((char *)(v37 > 1), v38 + 1, 1, v12);
      v11 = v111;
      v12 = v87;
    }
    *((_QWORD *)v12 + 2) = v13;
    v39 = v12 + 32;
    v40 = &v12[16 * v38 + 32];
    *(_QWORD *)v40 = v14;
    *((_QWORD *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        v41 = v13 - 1;
        if (v13 >= 4)
        {
          v46 = &v39[16 * v13];
          v47 = *((_QWORD *)v46 - 8);
          v48 = *((_QWORD *)v46 - 7);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_120;
          v51 = *((_QWORD *)v46 - 6);
          v50 = *((_QWORD *)v46 - 5);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_121;
          v53 = v13 - 2;
          v54 = &v39[16 * v13 - 32];
          v56 = *(_QWORD *)v54;
          v55 = *((_QWORD *)v54 + 1);
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_123;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_126;
          if (v58 >= v49)
          {
            v76 = &v39[16 * v41];
            v78 = *(_QWORD *)v76;
            v77 = *((_QWORD *)v76 + 1);
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_130;
            v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v70 = *((_QWORD *)v12 + 4);
            v71 = *((_QWORD *)v12 + 5);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_77;
          }
          v43 = *((_QWORD *)v12 + 4);
          v42 = *((_QWORD *)v12 + 5);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_122;
        v53 = v13 - 2;
        v59 = &v39[16 * v13 - 32];
        v61 = *(_QWORD *)v59;
        v60 = *((_QWORD *)v59 + 1);
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_125;
        v65 = &v39[16 * v41];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_128;
        if (__OFADD__(v63, v68))
          goto LABEL_129;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_83:
          if (v69)
            v41 = v53;
          goto LABEL_85;
        }
LABEL_77:
        if ((v64 & 1) != 0)
          goto LABEL_124;
        v72 = &v39[16 * v41];
        v74 = *(_QWORD *)v72;
        v73 = *((_QWORD *)v72 + 1);
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_127;
        if (v75 < v63)
          goto LABEL_15;
LABEL_85:
        v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
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
          goto LABEL_140;
        }
        if (!v11)
          goto LABEL_143;
        v81 = v12;
        v82 = &v39[16 * v80];
        v83 = *(_QWORD *)v82;
        v84 = &v39[16 * v41];
        v85 = *((_QWORD *)v84 + 1);
        sub_23DA8A728((double *)(v11 + 24 * *(_QWORD *)v82), (double *)(v11 + 24 * *(_QWORD *)v84), v11 + 24 * v85, __dst);
        if (v1)
          goto LABEL_93;
        if (v85 < v83)
          goto LABEL_117;
        if (v41 > *((_QWORD *)v81 + 2))
          goto LABEL_118;
        *(_QWORD *)v82 = v83;
        *(_QWORD *)&v39[16 * v80 + 8] = v85;
        v86 = *((_QWORD *)v81 + 2);
        if (v41 >= v86)
          goto LABEL_119;
        v12 = v81;
        v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((_QWORD *)v81 + 2) = v86 - 1;
        v11 = v111;
        if (v86 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v109;
    v3 = v110;
    if (v10 >= v110)
    {
      v9 = v108;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  result = sub_23DA9BE3C();
  __break(1u);
  return result;
}

uint64_t sub_23DA8A728(double *__src, double *a2, unint64_t a3, double *__dst)
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
  __int128 v16;
  double *v17;
  unint64_t v18;
  double *v19;
  double *v20;
  __int128 v21;
  __int128 v22;
  uint64_t result;
  char *v24;
  double *v25;
  double *v26;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = ((char *)a2 - (char *)__src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  v26 = __src;
  v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[3 * v11] <= __dst)
        memmove(__dst, a2, 24 * v11);
      v17 = &v4[3 * v11];
      v24 = (char *)v17;
      v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        v18 = a3 - 24;
        do
        {
          v19 = (double *)(v18 + 24);
          if (*(v6 - 1) >= *(v17 - 1))
          {
            v24 = (char *)(v17 - 3);
            if (v19 < v17 || v18 >= (unint64_t)v17 || v19 != v17)
            {
              v22 = *(_OWORD *)(v17 - 3);
              *(double *)(v18 + 16) = *(v17 - 1);
              *(_OWORD *)v18 = v22;
            }
            v20 = v6;
            v17 -= 3;
            if (v6 <= v7)
              break;
          }
          else
          {
            v20 = v6 - 3;
            if (v19 != v6 || v18 >= (unint64_t)v6)
            {
              v21 = *(_OWORD *)v20;
              *(double *)(v18 + 16) = *(v6 - 1);
              *(_OWORD *)v18 = v21;
            }
            v26 = v6 - 3;
            if (v20 <= v7)
              break;
          }
          v18 -= 24;
          v6 = v20;
        }
        while (v17 > v4);
      }
LABEL_40:
      sub_23DA8AADC((void **)&v26, (const void **)&v25, &v24);
      return 1;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[3 * v9] <= __dst)
      memmove(__dst, __src, 24 * v9);
    v12 = &v4[3 * v9];
    v24 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      v13 = v4;
      while (1)
      {
        if (v13[2] >= v6[2])
        {
          v4 = v13 + 3;
          v15 = v13;
          v14 = v6;
          if (v7 == v13)
          {
            v13 += 3;
            if (v7 < v4)
              goto LABEL_18;
          }
          else
          {
            v13 += 3;
          }
        }
        else
        {
          v14 = v6 + 3;
          v15 = v6;
          if (v7 == v6 && v7 < v14)
            goto LABEL_18;
        }
        v16 = *(_OWORD *)v15;
        v7[2] = v15[2];
        *(_OWORD *)v7 = v16;
LABEL_18:
        v7 += 3;
        if (v13 < v12)
        {
          v6 = v14;
          if ((unint64_t)v14 < a3)
            continue;
        }
        v25 = v4;
        v26 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  result = sub_23DA9BE84();
  __break(1u);
  return result;
}

char *sub_23DA8A9E4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2C8);
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

char *sub_23DA8AADC(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_23DA9BE84();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
      return (char *)memmove(result, v3, 24 * v6);
  }
  return result;
}

char *sub_23DA8AB98(uint64_t a1)
{
  return sub_23DA8A9E4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_23DA8ABAC(uint64_t a1)
{
  __asm { BR              X12 }
}

void *sub_23DA8AC10@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>, char a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  void *result;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;

  v27 = v22;
  LOWORD(v28) = a2;
  BYTE2(v28) = BYTE2(a2);
  HIBYTE(v28) = BYTE3(a2);
  v29 = BYTE4(a2);
  v30 = BYTE5(a2);
  v31 = BYTE6(a2);
  result = sub_23DA89C50(&v27, (uint64_t)&v27 + BYTE6(a2), v24, a1);
  v26 = v28 | ((unint64_t)v29 << 32) | ((unint64_t)v30 << 40) | ((unint64_t)v31 << 48);
  *v23 = v27;
  v23[1] = v26;
  return result;
}

char *sub_23DA8AE2C(int *a1, void *a2, uint64_t a3)
{
  char *result;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = (char *)sub_23DA9B6EC();
  v7 = *a1;
  v8 = a1[1];
  if ((int)v8 < (int)v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_23DA9B638();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v9 = result;
  result = (char *)sub_23DA9B650();
  v10 = v7 - (_QWORD)result;
  if (__OFSUB__(v7, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v11 = v8 - v7;
  v12 = sub_23DA9B644();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  return (char *)sub_23DA89C50(&v9[v10], (uint64_t)&v9[v10 + v13], a2, a3);
}

uint64_t sub_23DA8AEDC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    v22 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23DA8B0E0(_QWORD *a1)
{
  return sub_23DA861D0(0, a1[2], 0, a1);
}

unint64_t sub_23DA8B0F4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD308);
    v3 = (_QWORD *)sub_23DA9BE78();
    for (i = (_QWORD *)(a1 + 80); ; i += 7)
    {
      v5 = *((_BYTE *)i - 48);
      v14 = *(_OWORD *)(i - 3);
      v15 = *(_OWORD *)(i - 5);
      v6 = *(i - 1);
      v7 = *i;
      result = sub_23DA99868(v5);
      if ((v9 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      v10 = v3[7] + 48 * result;
      *(_OWORD *)v10 = v15;
      *(_OWORD *)(v10 + 16) = v14;
      *(_QWORD *)(v10 + 32) = v6;
      *(_QWORD *)(v10 + 40) = v7;
      v11 = v3[2];
      v12 = __OFADD__(v11, 1);
      v13 = v11 + 1;
      if (v12)
        goto LABEL_10;
      v3[2] = v13;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_23DA8B200(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  unsigned __int8 v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD300);
    v3 = (_QWORD *)sub_23DA9BE78();
    for (i = (_QWORD *)(a1 + 40); ; i += 2)
    {
      v5 = *((_BYTE *)i - 8);
      v6 = *i;
      result = sub_23DA99868(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      *(_QWORD *)(v3[7] + 8 * result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

void sub_23DA8B2D4(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_23DA8993C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_BYTE **)(v2 + 40));
}

unint64_t sub_23DA8B2F0()
{
  unint64_t result;

  result = qword_256CDD2A8;
  if (!qword_256CDD2A8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9F67C, &type metadata for E5RTUtils.DomainError);
    atomic_store(result, (unint64_t *)&qword_256CDD2A8);
  }
  return result;
}

uint64_t sub_23DA8B334()
{
  return swift_release();
}

uint64_t sub_23DA8B33C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23DA88C74(a1, a2, v2, sub_23DA96BF8);
}

uint64_t sub_23DA8B35C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23DA88C74(a1, a2, v2, sub_23DA96C48);
}

unint64_t sub_23DA8B37C()
{
  unint64_t result;

  result = qword_256CDD2D8;
  if (!qword_256CDD2D8)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9E14C, &type metadata for CInteropUtils.DomainError);
    atomic_store(result, (unint64_t *)&qword_256CDD2D8);
  }
  return result;
}

uint64_t sub_23DA8B3C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23DA8B404(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aStopped_1[8 * a1] == *(_QWORD *)&aStopped_1[8 * a2] && qword_23DA9EFC0[a1] == qword_23DA9EFC0[a2])
    v3 = 1;
  else
    v3 = sub_23DA9BF5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23DA8B488(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23DA8B4D8(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_23DA8B55C + 4 * byte_23DA9EE1E[a2]))(v2 + 12);
}

uint64_t sub_23DA8B55C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 12 && v2 == 0x800000023DA9F9D0)
    v3 = 1;
  else
    v3 = sub_23DA9BF5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23DA8B610(char a1)
{
  sub_23DA9BFBC();
  __asm { BR              X10 }
}

uint64_t sub_23DA8B670()
{
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA8B700()
{
  sub_23DA9BFBC();
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA8B768()
{
  sub_23DA9BB18();
  return swift_bridgeObjectRelease();
}

void sub_23DA8B7A8(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23DA8B7F4()
{
  sub_23DA9BB18();
  return swift_bridgeObjectRelease();
}

void sub_23DA8B86C(uint64_t a1, char a2)
{
  sub_23DA9BFBC();
  __asm { BR              X10 }
}

uint64_t sub_23DA8B8C8()
{
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA8B958()
{
  sub_23DA9BFBC();
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA8B9BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  v4 = sub_23DA9B818();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_23DA8BA24(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_23DA9B818();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_23DA8BAE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  v4 = sub_23DA9B818();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23DA8BB4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  v4 = sub_23DA9B818();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_23DA8BBB8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DA8BBFC(char a1)
{
  return *(_QWORD *)&aStopped_1[8 * a1];
}

uint64_t sub_23DA8BC1C(char *a1, char *a2)
{
  return sub_23DA8B404(*a1, *a2);
}

uint64_t sub_23DA8BC28()
{
  return sub_23DA8B700();
}

uint64_t sub_23DA8BC30()
{
  return sub_23DA8B768();
}

uint64_t sub_23DA8BC38()
{
  return sub_23DA8B958();
}

uint64_t sub_23DA8BC40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DA8EF38();
  *a1 = result;
  return result;
}

uint64_t sub_23DA8BC6C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23DA8BBFC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_23DA8BCDC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  return *v1;
}

void sub_23DA8BD7C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_23DA8BDCC(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_23DA8BE2C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id HGManager.__allocating_init(delegate:config:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_23DA8EF80(a1, a2);
  swift_unknownObjectRelease();

  return v6;
}

id HGManager.init(delegate:config:)(uint64_t a1, void *a2)
{
  id v3;

  v3 = sub_23DA8EF80(a1, a2);
  swift_unknownObjectRelease();

  return v3;
}

id sub_23DA8BF60()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[2];
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[2];

  v1 = v0;
  v2 = sub_23DA9B818();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DA9B860();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256CDAFF0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_256CE1558);
  v10 = sub_23DA9B848();
  v11 = sub_23DA9BCA4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_23DA5F000, v10, v11, "==========▶️===========", v12, 2u);
    MEMORY[0x24263A588](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v13 = v1;
  v14 = sub_23DA9B848();
  v15 = sub_23DA9BCA4();
  v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)v17 = 136315650;
    v26[1] = v17 + 4;
    v27 = v16;
    v18 = &v13[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    v19 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v4, v18, v2);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v20 = sub_23DA9BF50();
    v28 = v6;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
    v31 = sub_23DA6701C(v20, v22, v32);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v31 = sub_23DA6701C(0x29287472617473, 0xE700000000000000, v32);
    sub_23DA9BD58();
    *(_WORD *)(v17 + 22) = 2080;
    v31 = sub_23DA6701C(*(_QWORD *)&aStopped_1[8 * v13[OBJC_IVAR___HGManagerInternal_status]], qword_23DA9EFC0[v13[OBJC_IVAR___HGManagerInternal_status]], v32);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v14, (os_log_type_t)v27, "[HGManager]%s: %s status: %s", (uint8_t *)v17, 0x20u);
    v23 = v29;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v23, -1, -1);
    MEMORY[0x24263A588](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v5);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v24 = *(void **)&v13[OBJC_IVAR___HGManagerInternal_lock];
  objc_msgSend(v24, sel_lock);
  sub_23DA8C370(v13);
  return objc_msgSend(v24, sel_unlock);
}

void sub_23DA8C370(_BYTE *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  void **v52;
  void *v53;
  id v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t *v59;
  NSObject *v60;
  uint64_t v61;
  char *v62;
  uint64_t *v63;
  void (*v64)(char *, uint64_t, uint8_t *);
  uint8_t *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  os_log_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t, uint8_t *);
  uint64_t v83;
  os_log_t v84;
  uint64_t v85;
  void (*v86)(char *, char *, uint64_t);
  uint64_t v87;
  id *v88;
  os_log_t v89;
  uint64_t v90;
  uint8_t *v91;
  uint8_t *v92;
  char *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97[3];
  uint64_t v98;

  v2 = sub_23DA9B818();
  v94 = *(uint64_t **)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v92 = (uint8_t *)&v81 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v93 = (char *)&v81 - v8;
  v9 = sub_23DA9B860();
  v95 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v81 - v12;
  v14 = OBJC_IVAR___HGManagerInternal_status;
  if (a1[OBJC_IVAR___HGManagerInternal_status])
  {
    if (a1[OBJC_IVAR___HGManagerInternal_status] != 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    v91 = v11;
    v15 = v9;
  }
  else
  {
    v91 = v11;
    v15 = v9;
  }
  v16 = sub_23DA9BF5C();
  swift_bridgeObjectRelease();
  v9 = v15;
  if ((v16 & 1) != 0)
  {
LABEL_10:
    if (qword_256CDAFF0 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v9, (uint64_t)qword_256CE1558);
    v20 = v95;
    (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v13, v19, v9);
    v21 = a1;
    v22 = sub_23DA9B848();
    v23 = sub_23DA9BC98();
    if (!os_log_type_enabled(v22, (os_log_type_t)v23))
    {

      (*(void (**)(char *, uint64_t))(v20 + 8))(v13, v9);
      return;
    }
    LODWORD(v88) = v23;
    v89 = v22;
    v90 = v9;
    v24 = swift_slowAlloc();
    v87 = swift_slowAlloc();
    v97[0] = v87;
    *(_DWORD *)v24 = 136315394;
    v91 = (uint8_t *)(v24 + 4);
    v25 = &v21[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    v26 = v93;
    v27 = v94;
    v86 = (void (*)(char *, char *, uint64_t))v94[2];
    v86(v93, v25, v2);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v28 = sub_23DA9BF50();
    v30 = v29;
    v94 = (uint64_t *)v27[1];
    ((void (*)(char *, uint64_t))v94)(v26, v2);
    v98 = sub_23DA6701C(v28, v30, v97);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    v31 = *(_QWORD *)&v21[OBJC_IVAR___HGManagerInternal_session];
    if (v31)
    {
      v32 = v92;
      v86((char *)v92, (char *)(v31 + OBJC_IVAR____TtC12HeadGestures9HGSession_id), v2);
      v33 = sub_23DA9BF50();
      v35 = v34;
      ((void (*)(uint8_t *, uint64_t))v94)(v32, v2);
      v98 = sub_23DA6701C(v33, v35, v97);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      v36 = v89;
      _os_log_impl(&dword_23DA5F000, v89, (os_log_type_t)v88, "[HGManager]%s: EXISTING LIVE SESSION %s, ignore command...", (uint8_t *)v24, 0x16u);
      v37 = v87;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v37, -1, -1);
      MEMORY[0x24263A588](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v95 + 8))(v13, v90);
      return;
    }

    __break(1u);
    goto LABEL_32;
  }
  v17 = v14;
  v18 = (uint8_t *)v2;
  if (!a1[v14] || a1[v14] != 1)
  {
    v38 = sub_23DA9BF5C();
    swift_bridgeObjectRelease();
    if ((v38 & 1) != 0)
      goto LABEL_17;
    v92 = v18;
    v52 = (void **)&a1[OBJC_IVAR___HGManagerInternal_configuration];
    swift_beginAccess();
    v88 = v52;
    v53 = *v52;
    type metadata accessor for HGSession();
    swift_allocObject();
    v54 = v53;
    v55 = sub_23DA6EAE8(v54);

    v56 = OBJC_IVAR___HGManagerInternal_session;
    *(_QWORD *)&a1[OBJC_IVAR___HGManagerInternal_session] = v55;
    swift_release();
    if (qword_256CDAFF0 != -1)
      swift_once();
    v57 = __swift_project_value_buffer(v9, (uint64_t)qword_256CE1558);
    v58 = v95;
    v59 = v91;
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(v95 + 16))(v91, v57, v9);
    v13 = a1;
    v60 = sub_23DA9B848();
    LODWORD(v87) = sub_23DA9BCA4();
    if (os_log_type_enabled(v60, (os_log_type_t)v87))
    {
      v84 = v60;
      v85 = v17;
      v90 = v9;
      v61 = swift_slowAlloc();
      v83 = swift_slowAlloc();
      v98 = v83;
      *(_DWORD *)v61 = 136315650;
      v86 = (void (*)(char *, char *, uint64_t))(v61 + 4);
      v62 = &v13[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      v63 = v94;
      v64 = (void (*)(char *, uint64_t, uint8_t *))v94[2];
      v89 = v56;
      v65 = v92;
      v66 = v93;
      v82 = v64;
      v64(v93, (uint64_t)v62, v92);
      v81 = sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
      v67 = sub_23DA9BF50();
      v69 = v68;
      v93 = (char *)v63[1];
      ((void (*)(char *, uint8_t *))v93)(v66, v65);
      v96 = sub_23DA6701C(v67, v69, &v98);
      v94 = v97;
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 12) = 2080;
      v70 = *(uint64_t *)((char *)&v89->isa + (_QWORD)a1);
      if (!v70)
      {
LABEL_33:

        __break(1u);
        return;
      }
      v82(v5, v70 + OBJC_IVAR____TtC12HeadGestures9HGSession_id, v65);
      v71 = sub_23DA9BF50();
      v73 = v72;
      ((void (*)(char *, uint8_t *))v93)(v5, v65);
      v96 = sub_23DA6701C(v71, v73, &v98);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 22) = 2080;
      v74 = *v88;
      v75 = sub_23DA65054();
      v77 = v76;

      v96 = sub_23DA6701C(v75, v77, &v98);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      v78 = v84;
      _os_log_impl(&dword_23DA5F000, v84, (os_log_type_t)v87, "[HGManager]%s: starting new session %s with config: %s", (uint8_t *)v61, 0x20u);
      v79 = v83;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v79, -1, -1);
      MEMORY[0x24263A588](v61, -1, -1);

      (*(void (**)(uint8_t *, uint64_t))(v95 + 8))(v91, v90);
      v17 = v85;
      v56 = v89;
    }
    else
    {

      (*(void (**)(uint8_t *, uint64_t))(v58 + 8))(v59, v9);
    }
    if (*(Class *)((char *)&v56->isa + (_QWORD)a1))
    {
      v80 = MEMORY[0x24263A5E8](&v13[OBJC_IVAR___HGManagerInternal_delegate]);
      swift_retain();
      sub_23DA6BDDC(v80);
      swift_release();
      swift_unknownObjectRelease();
      a1[v17] = 2;
      return;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
LABEL_17:
  if (qword_256CDAFF0 != -1)
    swift_once();
  __swift_project_value_buffer(v9, (uint64_t)qword_256CE1558);
  v39 = a1;
  v40 = sub_23DA9B848();
  v41 = sub_23DA9BCA4();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    v95 = v43;
    v92 = v42;
    *(_DWORD *)v42 = 136315138;
    v97[0] = v43;
    v91 = v42 + 4;
    v44 = &v39[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    v46 = v93;
    v45 = v94;
    ((void (*)(char *, char *, uint8_t *))v94[2])(v93, v44, v18);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v47 = sub_23DA9BF50();
    v49 = v48;
    ((void (*)(char *, uint8_t *))v45[1])(v46, v18);
    v98 = sub_23DA6701C(v47, v49, v97);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    v50 = v92;
    _os_log_impl(&dword_23DA5F000, v40, v41, "[HGManager]%s: Received impatient start, will restart once HG fully stopped", v92, 0xCu);
    v51 = v95;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v51, -1, -1);
    MEMORY[0x24263A588](v50, -1, -1);

  }
  else
  {

  }
  v39[OBJC_IVAR___HGManagerInternal_impatientStart] = 1;
}

void sub_23DA8CEA0(uint64_t a1, uint64_t a2)
{
  void *v2;
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
  char *v13;
  uint64_t v14;
  void (*v15)(char *, void *, uint64_t);
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(_QWORD, _QWORD);
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  void *v32;
  uint64_t v33;
  char v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(char *, void *, uint64_t);
  uint8_t *v49;
  char *v50;
  NSObject *v51;
  _QWORD *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  os_log_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  uint64_t v73;
  os_log_t v74;
  uint64_t v75;
  void (*v76)(_QWORD, _QWORD);
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint8_t *v82;
  void (*v83)(char *, void *, uint64_t);
  char *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88[3];
  uint64_t v89[2];

  v79 = a1;
  v80 = a2;
  v3 = sub_23DA9B818();
  v85 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v78 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v84 = (char *)&v72 - v6;
  v7 = sub_23DA9B860();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v72 - v12;
  if (qword_256CDAFF0 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
  v15 = *(void (**)(char *, void *, uint64_t))(v8 + 16);
  v86 = (void *)v14;
  v83 = v15;
  ((void (*)(char *))v15)(v13);
  v16 = v2;
  v17 = sub_23DA9B848();
  v18 = sub_23DA9BCA4();
  v19 = &unk_256CDD000;
  if (os_log_type_enabled(v17, v18))
  {
    v20 = swift_slowAlloc();
    v81 = v11;
    v21 = v20;
    v76 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
    v88[0] = (uint64_t)v76;
    *(_DWORD *)v21 = 136315650;
    v82 = (uint8_t *)v7;
    v75 = v21 + 4;
    v77 = v8;
    v22 = &v16[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    v23 = v84;
    v24 = v85;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v84, v22, v3);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v25 = sub_23DA9BF50();
    v26 = v3;
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v26);
    v89[0] = sub_23DA6701C(v25, v28, v88);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    v89[0] = sub_23DA6701C(0x74697728706F7473, 0xEB00000000293A68, v88);
    sub_23DA9BD58();
    *(_WORD *)(v21 + 22) = 2080;
    v89[0] = sub_23DA6701C(*(_QWORD *)&aStopped_1[8 * v16[OBJC_IVAR___HGManagerInternal_status]], qword_23DA9EFC0[v16[OBJC_IVAR___HGManagerInternal_status]], v88);
    v19 = (_QWORD *)&unk_256CDD000;
    v7 = (uint64_t)v82;
    sub_23DA9BD58();

    v3 = v26;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v17, v18, "[HGManager]%s: %s status: %s", (uint8_t *)v21, 0x20u);
    v29 = v76;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v29, -1, -1);
    v30 = v21;
    v11 = v81;
    MEMORY[0x24263A588](v30, -1, -1);

    v31 = *(void (**)(char *, uint64_t))(v77 + 8);
  }
  else
  {

    v31 = *(void (**)(char *, uint64_t))(v8 + 8);
  }
  v31(v13, v7);
  v32 = *(void **)&v16[OBJC_IVAR___HGManagerInternal_lock];
  objc_msgSend(v32, sel_lock);
  v33 = v19[99];
  if (v16[v33] && v16[v33] != 1)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    v83(v11, v86, v7);
    v50 = v16;
    v51 = sub_23DA9B848();
    LODWORD(v83) = sub_23DA9BCA4();
    v52 = &unk_256CE1000;
    if (os_log_type_enabled(v51, (os_log_type_t)v83))
    {
      v74 = v51;
      v75 = v33;
      v76 = (void (*)(_QWORD, _QWORD))v31;
      v86 = v32;
      v81 = v11;
      v82 = (uint8_t *)v7;
      v53 = swift_slowAlloc();
      v73 = swift_slowAlloc();
      v89[0] = v73;
      *(_DWORD *)v53 = 136315394;
      v77 = v53 + 4;
      v54 = &v50[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      v55 = v84;
      v56 = v85;
      v72 = *(void (**)(char *, char *, uint64_t))(v85 + 16);
      v72(v84, v54, v3);
      sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
      v57 = sub_23DA9BF50();
      v59 = v58;
      v60 = *(void (**)(char *, uint64_t))(v56 + 8);
      v60(v55, v3);
      v87 = sub_23DA6701C(v57, v59, v89);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v53 + 12) = 2080;
      v61 = *(_QWORD *)&v50[OBJC_IVAR___HGManagerInternal_session];
      if (!v61)
      {
LABEL_21:

        __break(1u);
        return;
      }
      v62 = v78;
      v72(v78, (char *)(v61 + OBJC_IVAR____TtC12HeadGestures9HGSession_id), v3);
      v63 = sub_23DA9BF50();
      v65 = v64;
      v60(v62, v3);
      v87 = sub_23DA6701C(v63, v65, v89);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      v66 = v74;
      _os_log_impl(&dword_23DA5F000, v74, (os_log_type_t)v83, "[HGManager]%s: stopping session %s", (uint8_t *)v53, 0x16u);
      v67 = v73;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v67, -1, -1);
      MEMORY[0x24263A588](v53, -1, -1);

      v76(v81, v82);
      v32 = v86;
      v33 = v75;
      v52 = (_QWORD *)&unk_256CE1000;
    }
    else
    {

      v31(v11, v7);
    }
    v16[v33] = 1;
    objc_msgSend(v32, sel_unlock);
    if (*(_QWORD *)&v50[v52[162]])
    {
      v68 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v69 = (_QWORD *)swift_allocObject();
      v71 = v79;
      v70 = v80;
      v69[2] = v68;
      v69[3] = v71;
      v69[4] = v70;
      swift_retain();
      swift_retain();
      sub_23DA6EA18(v71);
      sub_23DA6C20C((uint64_t)sub_23DA8F2D0, (uint64_t)v69);
      swift_release();
      swift_release();
      swift_release();
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  v34 = sub_23DA9BF5C();
  swift_bridgeObjectRelease();
  if ((v34 & 1) != 0)
    goto LABEL_12;
  v35 = v16;
  v36 = sub_23DA9B848();
  v37 = sub_23DA9BC98();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = swift_slowAlloc();
    v86 = v32;
    v39 = (uint8_t *)v38;
    v40 = swift_slowAlloc();
    v83 = (void (*)(char *, void *, uint64_t))v40;
    *(_DWORD *)v39 = 136315138;
    v89[0] = v40;
    v41 = v3;
    v82 = v39 + 4;
    v42 = &v35[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    v43 = v84;
    v44 = v85;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v84, v42, v41);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v45 = sub_23DA9BF50();
    v47 = v46;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v41);
    v87 = sub_23DA6701C(v45, v47, v89);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v36, v37, "[HGManager]%s: NO LIVE SESSION, ignore command...", v39, 0xCu);
    v48 = v83;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v48, -1, -1);
    v49 = v39;
    v32 = v86;
    MEMORY[0x24263A588](v49, -1, -1);

  }
  else
  {

  }
  objc_msgSend(v32, sel_unlock);
}

void sub_23DA8D814(uint64_t a1, void (*a2)(void), uint64_t a3)
{
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  void *v58;
  _BYTE *v59;
  uint8_t *v60;
  uint8_t *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[9];
  uint64_t v69[3];

  v66 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD368);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v65 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v60 - v8;
  v10 = sub_23DA9B818();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v63 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v64 = (char *)&v60 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v60 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v60 - v19;
  v21 = a1 + 16;
  swift_beginAccess();
  v22 = MEMORY[0x24263A5E8](a1 + 16);
  if (v22)
  {
    v23 = (void *)v22;
    v24 = *(id *)(v22 + OBJC_IVAR___HGManagerInternal_lock);

    objc_msgSend(v24, sel_lock);
    sub_23DA8DFC0(a1);
    objc_msgSend(v24, sel_unlock);

  }
  if (a2)
  {
    swift_retain();
    a2();
    swift_beginAccess();
    v25 = MEMORY[0x24263A5E8](v21);
    if (v25)
    {
      v26 = (void *)v25;
      v27 = v25 + OBJC_IVAR___HGManagerInternal_id;
      swift_beginAccess();
      v28 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v28(v9, v27, v10);

      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v20, v9, v10);
        if (qword_256CDAFF0 != -1)
          swift_once();
        v29 = sub_23DA9B860();
        __swift_project_value_buffer(v29, (uint64_t)qword_256CE1558);
        v28(v18, (uint64_t)v20, v10);
        v30 = sub_23DA9B848();
        v31 = sub_23DA9BC8C();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          v62 = swift_slowAlloc();
          v69[0] = v62;
          v61 = v32;
          *(_DWORD *)v32 = 136315138;
          v60 = v32 + 4;
          sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
          v33 = sub_23DA9BF50();
          v68[6] = sub_23DA6701C(v33, v34, v69);
          sub_23DA9BD58();
          swift_bridgeObjectRelease();
          v35 = *(void (**)(char *, uint64_t))(v11 + 8);
          v35(v18, v10);
          v36 = v31;
          v37 = v61;
          _os_log_impl(&dword_23DA5F000, v30, v36, "[HGManager]%s: Client provided stop completion handler finish execution.", v61, 0xCu);
          v38 = v62;
          swift_arrayDestroy();
          MEMORY[0x24263A588](v38, -1, -1);
          MEMORY[0x24263A588](v37, -1, -1);
          sub_23DA6EA08((uint64_t)a2);

        }
        else
        {
          sub_23DA6EA08((uint64_t)a2);

          v35 = *(void (**)(char *, uint64_t))(v11 + 8);
          v35(v18, v10);
        }
        v35(v20, v10);
        goto LABEL_14;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    }
    sub_23DA6EA08((uint64_t)a2);
    sub_23DA8F6FC((uint64_t)v9);
  }
LABEL_14:
  swift_beginAccess();
  v39 = (unsigned __int8 *)MEMORY[0x24263A5E8](v21);
  if (!v39)
    return;
  v40 = v39[OBJC_IVAR___HGManagerInternal_impatientStart];

  if (v40 != 1)
    return;
  swift_beginAccess();
  v41 = MEMORY[0x24263A5E8](v21);
  if (v41)
  {
    v42 = (void *)v41;
    v43 = v41 + OBJC_IVAR___HGManagerInternal_id;
    swift_beginAccess();
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v45 = (uint64_t)v65;
    v44(v65, v43, v10);

    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v45, 0, 1, v10);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v45, 1, v10) != 1)
    {
      v46 = v64;
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v64, v45, v10);
      if (qword_256CDAFF0 != -1)
        swift_once();
      v47 = sub_23DA9B860();
      __swift_project_value_buffer(v47, (uint64_t)qword_256CE1558);
      v48 = v63;
      v44(v63, (uint64_t)v46, v10);
      v49 = sub_23DA9B848();
      v50 = sub_23DA9BCA4();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        v66 = swift_slowAlloc();
        v68[0] = v66;
        *(_DWORD *)v51 = 136315138;
        v65 = (char *)(v51 + 4);
        sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
        v52 = sub_23DA9BF50();
        v67 = sub_23DA6701C(v52, v53, v68);
        sub_23DA9BD58();
        swift_bridgeObjectRelease();
        v54 = *(void (**)(char *, uint64_t))(v11 + 8);
        v54(v48, v10);
        _os_log_impl(&dword_23DA5F000, v49, v50, "[HGManager]%s: Restarting HG due to impatientStart request received.", v51, 0xCu);
        v55 = v66;
        swift_arrayDestroy();
        MEMORY[0x24263A588](v55, -1, -1);
        MEMORY[0x24263A588](v51, -1, -1);

        v54(v64, v10);
      }
      else
      {

        v56 = *(void (**)(char *, uint64_t))(v11 + 8);
        v56(v48, v10);
        v56(v46, v10);
      }
      goto LABEL_25;
    }
  }
  else
  {
    v45 = (uint64_t)v65;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v65, 1, 1, v10);
  }
  sub_23DA8F6FC(v45);
LABEL_25:
  swift_beginAccess();
  v57 = MEMORY[0x24263A5E8](v21);
  if (v57)
  {
    v58 = (void *)v57;
    sub_23DA8BF60();

  }
  swift_beginAccess();
  v59 = (_BYTE *)MEMORY[0x24263A5E8](v21);
  if (v59)
  {
    v59[OBJC_IVAR___HGManagerInternal_impatientStart] = 0;

  }
}

void sub_23DA8DFC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _BYTE *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[3];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD368);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23DA9B818();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - v10;
  v12 = a1 + 16;
  swift_beginAccess();
  v13 = (char *)MEMORY[0x24263A5E8](v12);
  if (v13)
  {
    *(_QWORD *)&v13[OBJC_IVAR___HGManagerInternal_session] = 0;

    swift_release();
  }
  swift_beginAccess();
  v14 = MEMORY[0x24263A5E8](v12);
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_10;
  }
  v15 = (void *)v14;
  v16 = v14 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v17(v4, v16, v5);

  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_10:
    sub_23DA8F6FC((uint64_t)v4);
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
  if (qword_256CDAFF0 != -1)
    swift_once();
  v18 = sub_23DA9B860();
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_256CE1558);
  v17(v9, (uint64_t)v11, v5);
  v20 = sub_23DA9B848();
  v21 = sub_23DA9BCA4();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v34 = v19;
    v23 = (uint8_t *)v22;
    v33 = swift_slowAlloc();
    v36[0] = v33;
    *(_DWORD *)v23 = 136315138;
    v32 = v23 + 4;
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v24 = sub_23DA9BF50();
    v35 = sub_23DA6701C(v24, v25, v36);
    sub_23DA9BD58();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26(v9, v5);
    _os_log_impl(&dword_23DA5F000, v20, v21, "[HGManager]%s: HG ALL STOPPED", v23, 0xCu);
    v27 = v33;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v27, -1, -1);
    MEMORY[0x24263A588](v23, -1, -1);
  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26(v9, v5);
  }

  v28 = sub_23DA9B848();
  v29 = sub_23DA9BCA4();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_23DA5F000, v28, v29, "==========⏹️===========", v30, 2u);
    MEMORY[0x24263A588](v30, -1, -1);
  }

  v26(v11, v5);
LABEL_15:
  swift_beginAccess();
  v31 = (_BYTE *)MEMORY[0x24263A5E8](v12);
  if (v31)
  {
    v31[OBJC_IVAR___HGManagerInternal_status] = 0;

  }
}

id sub_23DA8E46C(char a1)
{
  void *v1;
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
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  os_log_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[2];
  os_log_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  v3 = sub_23DA9B818();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9B860();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256CDAFF0 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = v1;
  v13 = sub_23DA9B848();
  v14 = sub_23DA9BCA4();
  v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    v16 = swift_slowAlloc();
    v32 = v15;
    v17 = v16;
    v33 = swift_slowAlloc();
    v35[0] = v33;
    *(_DWORD *)v17 = 136315650;
    v29[1] = v17 + 4;
    v30 = v13;
    v18 = &v12[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v18, v3);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v19 = sub_23DA9BF50();
    v31 = v8;
    v20 = a1;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v34 = sub_23DA6701C(v19, v22, v35);
    sub_23DA9BD58();

    a1 = v20;
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v34 = sub_23DA6701C(0xD00000000000001BLL, 0x800000023DAA1EE0, v35);
    sub_23DA9BD58();
    *(_WORD *)(v17 + 22) = 2080;
    if ((v20 & 1) != 0)
      v23 = 1702131021;
    else
      v23 = 0x6574756D6E55;
    if ((v20 & 1) != 0)
      v24 = 0xE400000000000000;
    else
      v24 = 0xE600000000000000;
    v34 = sub_23DA6701C(v23, v24, v35);
    sub_23DA9BD58();
    swift_bridgeObjectRelease();
    v25 = v30;
    _os_log_impl(&dword_23DA5F000, v30, (os_log_type_t)v32, "[HGManager]%s: %s trying to %s", (uint8_t *)v17, 0x20u);
    v26 = v33;
    swift_arrayDestroy();
    MEMORY[0x24263A588](v26, -1, -1);
    MEMORY[0x24263A588](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v7);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  v27 = *(void **)&v12[OBJC_IVAR___HGManagerInternal_lock];
  objc_msgSend(v27, sel_lock);
  sub_23DA8E800(v12, a1 & 1);
  return objc_msgSend(v27, sel_unlock);
}

void sub_23DA8E800(char *a1, int a2)
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
  BOOL *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  char *v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  int v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48[3];
  uint64_t v49;
  uint64_t v50;

  LODWORD(v47) = a2;
  v3 = sub_23DA9B818();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9B860();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)&a1[OBJC_IVAR___HGManagerInternal_session];
  if (v11)
  {
    v12 = *(_QWORD *)(v11 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer);
    if (v12)
    {
      v13 = (BOOL *)(*(_QWORD *)(v12 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
      swift_beginAccess();
      *v13 = (v47 & 1) == 0;
    }
    v46 = (uint8_t *)v4;
    if (qword_256CDAFF0 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
    v15 = a1;
    v16 = v8;
    v17 = sub_23DA9B848();
    v18 = sub_23DA9BCA4();
    v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v20 = swift_slowAlloc();
      v45 = swift_slowAlloc();
      v50 = v45;
      *(_DWORD *)v20 = 136315394;
      v41[1] = v20 + 4;
      v43 = v17;
      v21 = &v15[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      v42 = v19;
      v22 = v46;
      (*((void (**)(char *, char *, uint64_t))v46 + 2))(v6, v21, v3);
      sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
      v23 = sub_23DA9BF50();
      v44 = v16;
      v25 = v24;
      (*((void (**)(char *, uint64_t))v22 + 1))(v6, v3);
      v49 = sub_23DA6701C(v23, v25, &v50);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      if ((v47 & 1) != 0)
        v26 = 0x646574754DLL;
      else
        v26 = 0x646574756D6E55;
      if ((v47 & 1) != 0)
        v27 = 0xE500000000000000;
      else
        v27 = 0xE700000000000000;
      v49 = sub_23DA6701C(v26, v27, &v50);
      sub_23DA9BD58();
      swift_bridgeObjectRelease();
      v28 = v43;
      _os_log_impl(&dword_23DA5F000, v43, (os_log_type_t)v42, "[HGManager]%s: AudioFeedback %s", (uint8_t *)v20, 0x16u);
      v29 = v45;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v29, -1, -1);
      MEMORY[0x24263A588](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v7);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  else
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
    v30 = a1;
    v31 = sub_23DA9B848();
    v32 = sub_23DA9BC98();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v47 = v34;
      *(_DWORD *)v33 = 136315138;
      v48[0] = v34;
      v46 = v33 + 4;
      v35 = &v30[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v35, v3);
      sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
      v36 = sub_23DA9BF50();
      v37 = v4;
      v39 = v38;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v3);
      v50 = sub_23DA6701C(v36, v39, v48);
      sub_23DA9BD58();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DA5F000, v31, v32, "[HGManager]%s: NO LIVE SESSION, ignore command...", v33, 0xCu);
      v40 = v47;
      swift_arrayDestroy();
      MEMORY[0x24263A588](v40, -1, -1);
      MEMORY[0x24263A588](v33, -1, -1);

    }
    else
    {

    }
  }
}

id HGManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HGManager.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HGManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DA8EED0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  v4 = sub_23DA9B818();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23DA8EF38()
{
  unint64_t v0;

  v0 = sub_23DA9BEA8();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

id sub_23DA8EF80(uint64_t a1, void *a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char **p_name;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  char *v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  objc_class *v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v4 = sub_23DA9B818();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = &v2[OBJC_IVAR___HGManagerInternal_id];
  v9 = v2;
  sub_23DA9B80C();
  *(_QWORD *)&v9[OBJC_IVAR___HGManagerInternal_session] = 0;
  swift_unknownObjectWeakInit();
  v10 = OBJC_IVAR___HGManagerInternal_lock;
  p_name = &E5RTExecutionStreamOperation.name;
  *(_QWORD *)&v9[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  v9[OBJC_IVAR___HGManagerInternal_impatientStart] = 0;
  v9[OBJC_IVAR___HGManagerInternal_status] = 0;
  *(_QWORD *)&v9[OBJC_IVAR___HGManagerInternal_configuration] = a2;
  swift_unknownObjectWeakAssign();
  v12 = qword_256CDAFF0;
  v13 = a2;
  if (v12 != -1)
    swift_once();
  v14 = sub_23DA9B860();
  __swift_project_value_buffer(v14, (uint64_t)qword_256CE1558);
  v15 = v9;
  v16 = sub_23DA9B848();
  v17 = sub_23DA9BCA4();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = v7;
    v19 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v29 = v27;
    *(_DWORD *)v19 = 136315138;
    v26[1] = v19 + 4;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v18, v8, v4);
    sub_23DA8F33C((unint64_t *)&qword_256CDB918, MEMORY[0x24BDCEAB8]);
    v20 = sub_23DA9BF50();
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v18, v4);
    v28 = sub_23DA6701C(v20, v22, &v29);
    sub_23DA9BD58();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, v16, v17, "[HGManager]%s: Initialized manager", v19, 0xCu);
    v23 = v27;
    swift_arrayDestroy();
    p_name = (char **)(&E5RTExecutionStreamOperation + 24);
    MEMORY[0x24263A588](v23, -1, -1);
    MEMORY[0x24263A588](v19, -1, -1);

  }
  else
  {

  }
  v24 = (objc_class *)type metadata accessor for HGManager();
  v30.receiver = v15;
  v30.super_class = v24;
  return objc_msgSendSuper2(&v30, p_name[296]);
}

uint64_t sub_23DA8F278()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23DA8F29C()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void sub_23DA8F2D0()
{
  uint64_t v0;

  sub_23DA8D814(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t type metadata accessor for HGManager()
{
  uint64_t result;

  result = qword_256CDD350;
  if (!qword_256CDD350)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA8F318()
{
  return sub_23DA8F33C((unint64_t *)&qword_256CDB948, MEMORY[0x24BDCEA88]);
}

uint64_t sub_23DA8F33C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23DA9B818();
    result = MEMORY[0x24263A4F8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_23DA8F384@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_23DA8F3D8()
{
  return type metadata accessor for HGManager();
}

uint64_t sub_23DA8F3E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DA9B818();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for HGManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HGManager.id.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HGManager.id.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HGManager.id.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HGManager.configuration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HGManager.configuration.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HGManager.configuration.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HGManager.__allocating_init(delegate:config:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of HGManager.start()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HGManager.stop(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of HGManager.muteAudioFeedback(setting:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t storeEnumTagSinglePayload for HGManager.Status(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23DA8F5E0 + 4 * byte_23DA9EE3B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23DA8F614 + 4 * byte_23DA9EE36[v4]))();
}

uint64_t sub_23DA8F614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA8F61C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23DA8F624);
  return result;
}

uint64_t sub_23DA8F630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23DA8F638);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23DA8F63C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23DA8F644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HGManager.Status()
{
  return &type metadata for HGManager.Status;
}

unint64_t sub_23DA8F664()
{
  unint64_t result;

  result = qword_256CDD360;
  if (!qword_256CDD360)
  {
    result = MEMORY[0x24263A4F8](&unk_23DA9EF80, &type metadata for HGManager.Status);
    atomic_store(result, (unint64_t *)&qword_256CDD360);
  }
  return result;
}

uint64_t sub_23DA8F6A8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23DA8F6CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23DA8F6D8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_23DA8F6FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DA8F73C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager9HGCAEvent_timestamp;
  v2 = sub_23DA9B7DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23DA8F790()
{
  _OWORD *v0;
  uint64_t v1;
  char *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _OWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  _BYTE v36[32];
  _QWORD v37[2];
  _OWORD v38[2];
  _OWORD *v39;
  uint64_t v40;
  _QWORD v41[3];
  uint64_t v42;

  v29 = sub_23DA9BFF8();
  v28 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41[1] = &type metadata for HGCoreAnalyticsManager.HGCAReport;
  v3 = (_OWORD *)swift_allocObject();
  v39 = v3;
  v4 = v0[1];
  v3[1] = *v0;
  v3[2] = v4;
  v5 = v0[3];
  v3[3] = v0[2];
  v3[4] = v5;
  sub_23DA90A58((uint64_t)v0);
  sub_23DA9BFE0();
  v27 = v2;
  sub_23DA9BFEC();
  v6 = sub_23DA9BE30();
  swift_release();
  swift_retain();
  sub_23DA9BE90();
  if (!v42)
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_21:
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
    return (uint64_t)v8;
  }
  v7 = v41;
  v8 = (_QWORD *)MEMORY[0x24BEE4B00];
  v31 = v41;
  v32 = v6;
  v30 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    v9 = (uint64_t)v39;
    v10 = v40;
    v37[0] = v39;
    v37[1] = v40;
    sub_23DA68CE4(v7, v38);
    v34 = (_QWORD *)v9;
    v35 = v10;
    sub_23DA68D7C((uint64_t)v38, (uint64_t)v36);
    if (v10)
      break;
    sub_23DA90AC0((uint64_t)v37);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
LABEL_4:
    sub_23DA9BE90();
    if (!v42)
      goto LABEL_21;
  }
  swift_bridgeObjectRetain_n();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  v34 = (_QWORD *)v9;
  v35 = v10;
  sub_23DA68D7C((uint64_t)v38, (uint64_t)v36);
  swift_bridgeObjectRelease();
  sub_23DA90B00();
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_23DA90AC0((uint64_t)v37);
    goto LABEL_4;
  }
  v11 = v33;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v34 = v8;
  v14 = sub_23DA99804(v9, v10);
  v15 = v8[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (!__OFADD__(v15, v16))
  {
    v18 = v13;
    if (v8[3] >= v17)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v8 = v34;
        if ((v13 & 1) == 0)
          goto LABEL_17;
      }
      else
      {
        sub_23DA92924();
        v8 = v34;
        if ((v18 & 1) == 0)
          goto LABEL_17;
      }
    }
    else
    {
      sub_23DA91420(v17, isUniquelyReferenced_nonNull_native);
      v19 = sub_23DA99804(v9, v10);
      if ((v18 & 1) != (v20 & 1))
        goto LABEL_24;
      v14 = v19;
      v8 = v34;
      if ((v18 & 1) == 0)
      {
LABEL_17:
        v8[(v14 >> 6) + 8] |= 1 << v14;
        v22 = (uint64_t *)(v8[6] + 16 * v14);
        *v22 = v9;
        v22[1] = v10;
        *(_QWORD *)(v8[7] + 8 * v14) = v11;
        v23 = v8[2];
        v24 = __OFADD__(v23, 1);
        v25 = v23 + 1;
        if (v24)
          goto LABEL_23;
        v8[2] = v25;
        swift_bridgeObjectRetain();
        goto LABEL_19;
      }
    }
    v21 = v8[7];

    *(_QWORD *)(v21 + 8 * v14) = v11;
LABEL_19:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23DA90AC0((uint64_t)v37);
    v7 = v31;
    goto LABEL_4;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23DA9BF74();
  __break(1u);
  return result;
}

void sub_23DA8FB0C()
{
  _QWORD *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for HGCoreAnalyticsManager();
  v0 = (_QWORD *)swift_allocObject();
  v1 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v2 = objc_msgSend(v1, sel_processName);

  v3 = sub_23DA9BAC4();
  v5 = v4;

  v0[2] = v3;
  v0[3] = v5;
  v0[4] = MEMORY[0x24BEE4AF8];
  qword_256CE1520 = (uint64_t)v0;
}

void sub_23DA8FBAC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *oslog;

  if (sub_23DA8FDD8())
  {
    v1 = (void *)sub_23DA9BAA0();
    sub_23DA90B00();
    v2 = (void *)sub_23DA9BA4C();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    *(_QWORD *)(v0 + 32) = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    if (qword_256CDAFF0 != -1)
      swift_once();
    v3 = sub_23DA9B860();
    __swift_project_value_buffer(v3, (uint64_t)qword_256CE1558);
    v4 = sub_23DA9B848();
    v5 = sub_23DA9BCA4();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23DA5F000, v4, v5, "[CoreAnalytics] CAEvent sent...", v6, 2u);
      MEMORY[0x24263A588](v6, -1, -1);
    }

  }
  else
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v7 = sub_23DA9B860();
    __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
    oslog = sub_23DA9B848();
    v8 = sub_23DA9BCA4();
    if (os_log_type_enabled(oslog, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23DA5F000, oslog, v8, "[CoreAnalytics] CAEvent is missing information. skip sending...", v9, 2u);
      MEMORY[0x24263A588](v9, -1, -1);
    }

  }
}

uint64_t sub_23DA8FDD8()
{
  unint64_t v0;
  void *v1;
  void *v2;
  unint64_t v3;
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
  uint64_t result;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *v28;
  char *v29;
  void *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  void *v55;
  id v56;
  char *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  id v65;
  NSObject *log;
  id v67;
  char *v68;
  uint8_t *buf;
  uint64_t v70;
  os_log_type_t type;
  id v72;
  id v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  char *v86;
  void *v87;
  uint64_t v88;

  v79 = MEMORY[0x24BEE4AF8];
  v80 = MEMORY[0x24BEE4AF8];
  v78 = MEMORY[0x24BEE4AF8];
  swift_beginAccess();
  v3 = *(_QWORD *)(v0 + 32);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v4 = sub_23DA9BE54();
    if (v4)
      goto LABEL_3;
LABEL_43:
    swift_bridgeObjectRelease_n();
    goto LABEL_44;
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v4)
    goto LABEL_43;
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
LABEL_48:
    swift_bridgeObjectRetain_n();
    result = sub_23DA9BE54();
    v20 = result;
    if (result)
      goto LABEL_36;
    goto LABEL_49;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      v2 = (void *)MEMORY[0x242639DA8](v5, v3);
    }
    else
    {
      v2 = *(void **)(v3 + 8 * v5 + 32);
      swift_retain();
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(0);
    v11 = swift_dynamicCastClass();
    if (v11)
    {
      v10 = v11;
      swift_release();
      v9 = v10;
      goto LABEL_6;
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(0);
    v12 = swift_dynamicCastClass();
    if (v12)
    {
      v13 = v12;
      swift_release();
      v8 = v13;
      goto LABEL_6;
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(0);
    v14 = swift_dynamicCastClass();
    if (v14)
    {
      if (!v7)
      {
        v7 = v14;
        goto LABEL_6;
      }
LABEL_18:
      swift_release();
      goto LABEL_6;
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(0);
    v15 = swift_dynamicCastClass();
    if (v15)
    {
      if (v6)
        goto LABEL_18;
      v6 = v15;
    }
    else
    {
      type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(0);
      if (swift_dynamicCastClass())
      {
        v16 = swift_retain();
        MEMORY[0x242639B44](v16);
        v17 = v80;
      }
      else
      {
        type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(0);
        if (swift_dynamicCastClass())
        {
          v18 = swift_retain();
          MEMORY[0x242639B44](v18);
          v17 = v79;
        }
        else
        {
          type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(0);
          if (!swift_dynamicCastClass())
            goto LABEL_18;
          v19 = swift_retain();
          MEMORY[0x242639B44](v19);
          v17 = v78;
        }
      }
      if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23DA9BBCC();
      sub_23DA9BBE4();
      sub_23DA9BBC0();
      swift_release();
    }
LABEL_6:
    ++v5;
  }
  while (v4 != v5);
  swift_bridgeObjectRelease_n();
  if (!v9 || !v8 || !v6 || !v7)
  {
LABEL_44:
    v27 = MEMORY[0x24BEE4B00];
    if (!*(_QWORD *)(MEMORY[0x24BEE4B00] + 16))
      goto LABEL_45;
    goto LABEL_46;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23DA9B7C4();
  sub_23DA9B7C4();
  v76 = (char *)v7;
  sub_23DA9B7C4();
  v0 = v78;
  v1 = (void *)(v78 >> 62);
  if (v78 >> 62)
    goto LABEL_48;
  v20 = *(_QWORD *)((v78 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain_n();
  if (v20)
  {
LABEL_36:
    if (v20 < 1)
    {
      __break(1u);
LABEL_80:
      __break(1u);
      return result;
    }
    v22 = 0;
    v23 = 0.0;
    do
    {
      while ((v0 & 0xC000000000000001) == 0)
      {
        v24 = *(_QWORD *)(v0 + 32 + 8 * v22++);
        v23 = v23
            + *(double *)(v24
                        + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager21HGCASamplingRateEvent_currentSamplingRate);
        if (v22 == v20)
          goto LABEL_49;
      }
      v25 = MEMORY[0x242639DA8](v22++, v0);
      v26 = *(double *)(v25
                      + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager21HGCASamplingRateEvent_currentSamplingRate);
      swift_unknownObjectRelease();
      v23 = v23 + v26;
    }
    while (v22 != v20);
  }
LABEL_49:
  swift_bridgeObjectRelease_n();
  if (v1)
    goto LABEL_64;
  v28 = *(void **)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (2)
  {
    v29 = (char *)v80;
    if (v80 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_23DA9BE54();
      swift_bridgeObjectRelease();
    }
    v30 = (void *)v79;
    v31 = v76;
    if (!((unint64_t)v79 >> 62))
    {
      v32 = *(_QWORD *)((v79 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain_n();
      if (!v32)
        break;
      goto LABEL_55;
    }
    if (v79 < 0)
      v29 = (char *)v79;
    else
      v29 = (char *)(v79 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain_n();
    v31 = v76;
    result = sub_23DA9BE54();
    v32 = result;
    if (result)
    {
LABEL_55:
      if (v32 < 1)
        goto LABEL_80;
      v33 = 0;
      v29 = 0;
      v1 = (void *)(v79 & 0xC000000000000001);
      v2 = &unk_256CE1000;
      while (1)
      {
        v34 = v1 ? MEMORY[0x242639DA8](v33, v79) : swift_retain();
        v35 = *(_QWORD *)(v34
                        + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAInterpolatedDataEvent_intepolationAmount);
        swift_release();
        v36 = __OFADD__(v29, v35);
        v29 += v35;
        if (v36)
          break;
        if (v32 == ++v33)
        {
          swift_bridgeObjectRelease_n();
          v31 = v76;
          goto LABEL_70;
        }
      }
      __break(1u);
LABEL_64:
      swift_bridgeObjectRetain();
      v28 = (void *)sub_23DA9BE54();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease_n();
LABEL_70:
  v37 = *(_QWORD *)&v31[OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAGestureDetectionEvent_detectedGesture];
  if (v37 < 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    v29 = (char *)sub_23DA9BAA0();
    swift_bridgeObjectRelease();
    v28 = (void *)sub_23DA9BBFC();
    v30 = (void *)sub_23DA9BC44();
    v32 = sub_23DA9BBFC();
    v2 = (void *)sub_23DA9BBFC();
    v31 = (char *)sub_23DA9BC44();
    v1 = (void *)sub_23DA9BBFC();
    v37 = sub_23DA9BBFC();
    v81 = v29;
    v82 = v28;
    v83 = v30;
    v84 = v32;
    v85 = v2;
    v86 = v31;
    v87 = v1;
    v88 = v37;
    if (qword_256CDAFF0 == -1)
      goto LABEL_72;
  }
  swift_once();
LABEL_72:
  v38 = sub_23DA9B860();
  __swift_project_value_buffer(v38, (uint64_t)qword_256CE1558);
  v39 = v29;
  v40 = v28;
  v41 = v30;
  v42 = (id)v32;
  v43 = v2;
  v44 = v31;
  v45 = v1;
  v46 = (id)v37;
  v75 = v39;
  v47 = v40;
  v48 = v41;
  v49 = v42;
  v50 = v43;
  v74 = v44;
  v51 = v45;
  v73 = v46;
  v52 = sub_23DA9B848();
  v53 = sub_23DA9BC8C();
  if (os_log_type_enabled(v52, v53))
  {
    type = v53;
    v54 = (uint8_t *)swift_slowAlloc();
    v70 = swift_slowAlloc();
    v77 = v70;
    buf = v54;
    *(_DWORD *)v54 = 136315138;
    v68 = v75;
    v67 = v47;
    v65 = v48;
    v64 = v49;
    v55 = v51;
    v56 = v50;
    v72 = v50;
    v57 = v74;
    v58 = v55;
    log = v52;
    v59 = v48;
    v60 = v47;
    v61 = v73;
    v62 = sub_23DA9BB00();
    sub_23DA6701C(v62, v63, &v77);
    sub_23DA9BD58();

    v47 = v60;
    v48 = v59;

    v50 = v72;
    v51 = v55;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DA5F000, log, type, "[Core Analytics] sending report: %s", buf, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24263A588](v70, -1, -1);
    MEMORY[0x24263A588](buf, -1, -1);

  }
  else
  {

  }
  v27 = sub_23DA8F790();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  if (!*(_QWORD *)(v27 + 16))
  {
LABEL_45:
    swift_bridgeObjectRelease();
    v27 = 0;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v27;
}

uint64_t sub_23DA907E4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGCoreAnalyticsManager()
{
  return objc_opt_self();
}

uint64_t sub_23DA90830()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD478);
}

uint64_t sub_23DA9084C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DA9B7DC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23DA908B8()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD528);
}

uint64_t sub_23DA908D8()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD5D8);
}

uint64_t sub_23DA908F4()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD688);
}

uint64_t sub_23DA90910()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD738);
}

uint64_t sub_23DA9092C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA90960()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD7E8);
}

uint64_t sub_23DA9097C()
{
  return sub_23DA909C4();
}

uint64_t sub_23DA9098C()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD8A8);
}

uint64_t sub_23DA909A8()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(uint64_t a1)
{
  return sub_23DA625B4(a1, qword_256CDD968);
}

uint64_t sub_23DA909C4()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA909FC()
{
  id *v0;

  return swift_deallocObject();
}

uint64_t sub_23DA90A58(uint64_t a1)
{
  void *v2;
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
  id v15;
  id v16;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v9 = *(id *)a1;
  v10 = v2;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  return a1;
}

uint64_t sub_23DA90AC0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23DA90B00()
{
  unint64_t result;

  result = qword_256CDDA08;
  if (!qword_256CDDA08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDDA08);
  }
  return result;
}

uint64_t sub_23DA90B3C(uint64_t a1, char a2)
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  _OWORD *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2E0);
  v6 = sub_23DA9BE6C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v33 = v2;
  v34 = v5 + 64;
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
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v11)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v34 + 8 * v18);
    ++v14;
    if (!v20)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_34;
      v20 = *(_QWORD *)(v34 + 8 * v14);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_34:
          swift_release();
          v3 = v33;
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v34 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v14 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v20 = *(_QWORD *)(v34 + 8 * v14);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v14 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    v22 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v17);
    v23 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
    if ((a2 & 1) != 0)
    {
      sub_23DA68CE4(v23, v35);
    }
    else
    {
      sub_23DA68D7C((uint64_t)v23, (uint64_t)v35);
      v24 = v22;
    }
    sub_23DA9BFBC();
    type metadata accessor for CFString(0);
    sub_23DA92FB0();
    sub_23DA9B830();
    result = sub_23DA9BFD4();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v22;
    result = (uint64_t)sub_23DA68CE4(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v33;
  v19 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23DA90E44(uint64_t a1, char a2)
{
  return sub_23DA90E5C(a1, a2, &qword_256CDDA38);
}

uint64_t sub_23DA90E50(uint64_t a1, char a2)
{
  return sub_23DA90E5C(a1, a2, &qword_256CDDA30);
}

uint64_t sub_23DA90E5C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  _QWORD *v32;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  result = sub_23DA9BE6C();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v31 = a2;
    v9 = 0;
    v32 = (_QWORD *)(v6 + 64);
    v10 = 1 << *(_BYTE *)(v6 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v6 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v9 << 6);
      }
      else
      {
        v18 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v6 + 64;
        if (v18 >= v13)
          goto LABEL_31;
        v19 = v32[v18];
        ++v9;
        if (!v19)
        {
          v9 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_31;
          v19 = v32[v9];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v31 & 1) == 0)
              {
                result = swift_release();
                v4 = v3;
                goto LABEL_38;
              }
              v30 = 1 << *(_BYTE *)(v6 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v4 = v3;
              *(_QWORD *)(v6 + 16) = 0;
              break;
            }
            v19 = v32[v20];
            if (!v19)
            {
              while (1)
              {
                v9 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v9 >= v13)
                  goto LABEL_31;
                v19 = v32[v9];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v9 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v9 << 6);
      }
      v21 = *(_BYTE *)(*(_QWORD *)(v6 + 48) + v17);
      v22 = *(_BYTE *)(*(_QWORD *)(v6 + 56) + v17);
      sub_23DA9BFBC();
      sub_23DA9BFC8();
      result = sub_23DA9BFD4();
      v23 = -1 << *(_BYTE *)(v8 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_BYTE *)(*(_QWORD *)(v8 + 48) + v15) = v21;
      *(_BYTE *)(*(_QWORD *)(v8 + 56) + v15) = v22;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v4 = v8;
  return result;
}

uint64_t sub_23DA9111C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  int64_t v37;
  _QWORD *v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD308);
  result = sub_23DA9BE6C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v36 = a2;
    v8 = 0;
    v38 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v37)
          goto LABEL_31;
        v18 = v38[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v37)
            goto LABEL_31;
          v18 = v38[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v37)
            {
LABEL_31:
              if ((v36 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v35 = 1 << *(_BYTE *)(v5 + 32);
              if (v35 >= 64)
                bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v38 = -1 << v35;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v38[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_40;
                if (v8 >= v37)
                  goto LABEL_31;
                v18 = v38[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 48 * v16);
      v22 = v21[5];
      v23 = v21[3];
      v24 = v21[4];
      v25 = v21[2];
      v27 = *v21;
      v26 = v21[1];
      sub_23DA9BFBC();
      sub_23DA9BFC8();
      result = sub_23DA9BFD4();
      v28 = -1 << *(_BYTE *)(v7 + 32);
      v29 = result & ~v28;
      v30 = v29 >> 6;
      if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v33 = v30 == v32;
          if (v30 == v32)
            v30 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v12 + 8 * v30);
        }
        while (v34 == -1);
        v13 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v13) = v20;
      v14 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 48 * v13);
      *v14 = v27;
      v14[1] = v26;
      v14[2] = v25;
      v14[3] = v23;
      v14[4] = v24;
      v14[5] = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23DA91420(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA10);
  v38 = a2;
  v6 = sub_23DA9BE6C();
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
    sub_23DA9BFBC();
    sub_23DA9BB18();
    result = sub_23DA9BFD4();
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

uint64_t sub_23DA9172C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA28);
  v6 = sub_23DA9BE6C();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_24;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v18 = (_QWORD *)(v5 + 64);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v11 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v10 > 1)
  {
    v12 = *(_QWORD *)(v5 + 72);
    v13 = 1;
    if (v12)
      goto LABEL_17;
    v13 = 2;
    if (v10 > 2)
    {
      v12 = *(_QWORD *)(v5 + 80);
      if (!v12)
      {
        v14 = 3;
        if (v10 > 3)
        {
          v12 = *(_QWORD *)(v5 + 88);
          if (v12)
          {
            v13 = 3;
            goto LABEL_17;
          }
          while (1)
          {
            v13 = v14 + 1;
            if (__OFADD__(v14, 1))
            {
              __break(1u);
              JUMPOUT(0x23DA91B40);
            }
            if (v13 >= v10)
              break;
            v12 = v18[v13];
            ++v14;
            if (v12)
              goto LABEL_17;
          }
        }
        goto LABEL_19;
      }
LABEL_17:
      v11 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
      v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v11);
      sub_23DA9BFBC();
      __asm { BR              X8 }
    }
  }
LABEL_19:
  swift_release();
  v3 = v2;
  if ((a2 & 1) != 0)
  {
    v16 = 1 << *(_BYTE *)(v5 + 32);
    if (v16 >= 64)
      bzero(v18, ((unint64_t)(v16 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v18 = -1 << v16;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_24:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_23DA91B80(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD300);
  result = sub_23DA9BE6C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = a2;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_31;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_31;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v31 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v17);
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v17);
      sub_23DA9BFBC();
      sub_23DA9BFC8();
      result = sub_23DA9BFD4();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v15) = v21;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v15) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23DA91E48(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA18);
  v36 = a2;
  v6 = sub_23DA9BE6C();
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
      swift_retain();
    }
    sub_23DA9BFBC();
    sub_23DA9BB18();
    result = sub_23DA9BFD4();
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

uint64_t sub_23DA9215C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD100);
  result = sub_23DA9BE6C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = a2;
    v8 = 0;
    v31 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v12)
          goto LABEL_31;
        v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_31;
          v18 = v31[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v31 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v18 = v31[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
      sub_23DA9BFBC();
      sub_23DA9BFC8();
      result = sub_23DA9BFD4();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v14) = v20;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v14) = v21;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

id sub_23DA92420()
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
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2E0);
  v2 = *v0;
  v3 = sub_23DA9BE60();
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_23DA68D7C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_23DA68CE4(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23DA925E4()
{
  return sub_23DA925FC(&qword_256CDDA38);
}

void *sub_23DA925F0()
{
  return sub_23DA925FC(&qword_256CDDA30);
}

void *sub_23DA925FC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23DA9BE60();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v13 = (v19 - 1) & v19;
    v16 = v21 + (v10 << 6);
LABEL_12:
    v17 = *(_BYTE *)(*(_QWORD *)(v3 + 56) + v16);
    *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16) = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v16);
    *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23DA9277C()
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD308);
  v2 = *v0;
  v3 = sub_23DA9BE60();
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
    v25 = __clz(__rbit64(v23));
    v12 = (v23 - 1) & v23;
    v15 = v25 + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(v2 + 56) + 48 * v15;
    v17 = *(_QWORD *)(v16 + 32);
    v18 = *(_QWORD *)(v16 + 40);
    v20 = *(_OWORD *)v16;
    v19 = *(_OWORD *)(v16 + 16);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v21 = *(_QWORD *)(v4 + 56) + 48 * v15;
    *(_OWORD *)v21 = v20;
    *(_OWORD *)(v21 + 16) = v19;
    *(_QWORD *)(v21 + 32) = v17;
    *(_QWORD *)(v21 + 40) = v18;
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

id sub_23DA92924()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA10);
  v2 = *v0;
  v3 = sub_23DA9BE60();
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

void *sub_23DA92AD4()
{
  return sub_23DA92AEC(&qword_256CDDA28);
}

void *sub_23DA92AE0()
{
  return sub_23DA92AEC(&qword_256CDD300);
}

void *sub_23DA92AEC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23DA9BE60();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v13 = (v19 - 1) & v19;
    v16 = v21 + (v10 << 6);
LABEL_12:
    v17 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v16);
    *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16) = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23DA92C70()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA18);
  v2 = *v0;
  v3 = sub_23DA9BE60();
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
    result = (void *)swift_retain();
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

void *sub_23DA92E24()
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
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD100);
  v2 = *v0;
  v3 = sub_23DA9BE60();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_23DA92FB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDDA20;
  if (!qword_256CDDA20)
  {
    type metadata accessor for CFString(255);
    result = MEMORY[0x24263A4F8](&unk_23DA9D258, v1);
    atomic_store(result, (unint64_t *)&qword_256CDDA20);
  }
  return result;
}

void destroy for HGCoreAnalyticsManager.HGCAReport(id *a1)
{

}

_QWORD *initializeWithCopy for HGCoreAnalyticsManager.HGCAReport(_QWORD *a1, uint64_t a2)
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

uint64_t assignWithCopy for HGCoreAnalyticsManager.HGCAReport(uint64_t a1, uint64_t a2)
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

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

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

  v22 = *(void **)(a2 + 48);
  v23 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v22;
  v24 = v22;

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

uint64_t assignWithTake for HGCoreAnalyticsManager.HGCAReport(uint64_t a1, _OWORD *a2)
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

uint64_t getEnumTagSinglePayload for HGCoreAnalyticsManager.HGCAReport(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HGCoreAnalyticsManager.HGCAReport(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HGCoreAnalyticsManager.HGCAReport()
{
  return &type metadata for HGCoreAnalyticsManager.HGCAReport;
}

uint64_t sub_23DA932D4(uint64_t result, double a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD **)v2;
  if (*(_QWORD *)(*(_QWORD *)v2 + 16) == result)
  {
    if (!result)
    {
      __break(1u);
      return result;
    }
    sub_23DA934E4(0, 1);
    v4 = *(_QWORD **)v2;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_23DA745B0(0, v4[2] + 1, 1, v4);
    v4 = (_QWORD *)result;
  }
  v6 = v4[2];
  v5 = v4[3];
  if (v6 >= v5 >> 1)
  {
    result = (uint64_t)sub_23DA745B0((_QWORD *)(v5 > 1), v6 + 1, 1, v4);
    v4 = (_QWORD *)result;
  }
  v4[2] = v6 + 1;
  *(double *)&v4[v6 + 4] = a2;
  *(_QWORD *)v2 = v4;
  return result;
}

unint64_t sub_23DA93394(unint64_t result, unint64_t a2, float a3)
{
  char **v3;
  unint64_t v4;
  char *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = result;
  v6 = *v3;
  if (*((_QWORD *)*v3 + 2) != result || a2 == 0)
    goto LABEL_8;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (result < a2)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  sub_23DA936C4(0, a2);
  v6 = *v3;
LABEL_8:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = sub_23DA748D4(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
  v9 = *((_QWORD *)v6 + 2);
  v8 = *((_QWORD *)v6 + 3);
  v10 = v9 + 1;
  if (v9 >= v8 >> 1)
    v6 = sub_23DA748D4((char *)(v8 > 1), v9 + 1, 1, v6);
  *((_QWORD *)v6 + 2) = v10;
  *(float *)&v6[4 * v9 + 32] = a3;
  *v3 = v6;
  if (v10 != v4)
    return 0;
  sub_23DA9363C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDA48);
  sub_23DA93678();
  return sub_23DA9BC5C();
}

char *sub_23DA934E4(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_23DA745B0(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[8 * a1 + 32];
    v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14])
      result = (char *)memmove(result, v15, 8 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

unint64_t sub_23DA9363C()
{
  unint64_t result;

  result = qword_256CDDA40;
  if (!qword_256CDDA40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDDA40);
  }
  return result;
}

unint64_t sub_23DA93678()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256CDDA50;
  if (!qword_256CDDA50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256CDDA48);
    result = MEMORY[0x24263A4F8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256CDDA50);
  }
  return result;
}

char *sub_23DA936C4(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = sub_23DA748D4(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[4 * a1 + 32];
    v15 = &v4[4 * a2 + 32];
    if (a1 != a2 || result >= &v15[4 * v14])
      result = (char *)memmove(result, v15, 4 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_23DA9BE84();
  __break(1u);
  return result;
}

uint64_t sub_23DA9381C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t result;
  _QWORD v24[2];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = sub_23DA9B7DC();
  v27 = *(_QWORD *)(v1 - 8);
  v28 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v26 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23DA9BCD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23DA9BCB0();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_23DA9BA1C();
  MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)(v0 + 16) = 0;
  v24[1] = sub_23DA63824();
  sub_23DA9BA10();
  v29 = MEMORY[0x24BEE4AF8];
  sub_23DA63860(&qword_256CDB3D0, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB3D8);
  sub_23DA638A0(&qword_256CDB3E0, &qword_256CDB3D8, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v3);
  v10 = sub_23DA9BCF8();
  v11 = v25;
  *(_QWORD *)(v25 + 40) = v10;
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v13 = (void *)sub_23DA9BAA0();
  objc_msgSend(v12, sel_setDateFormat_, v13);

  v14 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v15 = objc_msgSend(v14, sel_processName);

  v16 = sub_23DA9BAC4();
  v18 = v17;

  v29 = v16;
  v30 = v18;
  sub_23DA9BB30();
  v19 = v26;
  sub_23DA9B7D0();
  v20 = (void *)sub_23DA9B770();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v28);
  v21 = objc_msgSend(v12, sel_stringFromDate_, v20);

  sub_23DA9BAC4();
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  sub_23DA9BB30();

  v22 = v30;
  result = v11;
  *(_QWORD *)(v11 + 24) = v29;
  *(_QWORD *)(v11 + 32) = v22;
  return result;
}

uint64_t sub_23DA93B80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDB60);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDB68);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDBC90);
  sub_23DA638A0(&qword_256CDBC98, &qword_256CDBC90, MEMORY[0x24BDB9AF8]);
  sub_23DA9B95C();
  swift_release();
  sub_23DA638A0(&qword_256CDDB70, &qword_256CDDB60, MEMORY[0x24BDB96C0]);
  swift_retain_n();
  sub_23DA9B92C();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23DA638A0(&qword_256CDDB78, &qword_256CDDB68, MEMORY[0x24BDB9568]);
  v10 = sub_23DA9B998();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDDB80);
  sub_23DA638A0(qword_256CDDB88, &qword_256CDDB80, MEMORY[0x24BDB97C8]);
  v11 = sub_23DA9B914();
  swift_release();
  return v11;
}

double sub_23DA93DC0@<D0>(__int128 *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double result;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[3];

  v6 = sub_23DA9BA04();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v31 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_23DA9BA1C();
  v10 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[4];
  v14 = a1[6];
  v39 = a1[5];
  v40[0] = v14;
  *(_OWORD *)((char *)v40 + 9) = *(__int128 *)((char *)a1 + 105);
  v15 = a1[1];
  v34 = *a1;
  v35 = v15;
  v16 = a1[3];
  v36 = a1[2];
  v37 = v16;
  v38 = v13;
  v17 = *(void **)(a2 + 40);
  v18 = swift_allocObject();
  v19 = a1[5];
  *(_OWORD *)(v18 + 88) = a1[4];
  *(_OWORD *)(v18 + 104) = v19;
  *(_OWORD *)(v18 + 120) = a1[6];
  *(_OWORD *)(v18 + 129) = *(__int128 *)((char *)a1 + 105);
  v20 = a1[1];
  *(_OWORD *)(v18 + 24) = *a1;
  *(_OWORD *)(v18 + 40) = v20;
  v21 = a1[3];
  *(_OWORD *)(v18 + 56) = a1[2];
  *(_QWORD *)(v18 + 16) = a2;
  *(_OWORD *)(v18 + 72) = v21;
  aBlock[4] = sub_23DA947C4;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_3_0;
  v22 = _Block_copy(aBlock);
  v23 = v17;
  swift_retain();
  sub_23DA9BA10();
  v32 = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v12, v9, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v30);
  swift_release();
  v24 = v39;
  v25 = v40[0];
  a3[4] = v38;
  a3[5] = v24;
  a3[6] = v25;
  *(_OWORD *)((char *)a3 + 105) = *(_OWORD *)((char *)v40 + 9);
  v26 = v35;
  *a3 = v34;
  a3[1] = v26;
  result = *(double *)&v36;
  v28 = v37;
  a3[2] = v36;
  a3[3] = v28;
  return result;
}

void sub_23DA9406C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v2 = sub_23DA9BAF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(a1 + 16);
  if (v6)
  {
    v7 = v6;
    sub_23DA7C91C();
    sub_23DA9BAE8();
    v8 = (void *)sub_23DA9BAD0();
    v10 = v9;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v10 >> 60 == 15)
    {

    }
    else
    {
      sub_23DA7A3F8((uint64_t)v8, v10);
      sub_23DA712A0(v8, v10, v7, 0);

      sub_23DA71608((uint64_t)v8, v10);
      sub_23DA71608((uint64_t)v8, v10);
    }
  }
}

void sub_23DA94188(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;

  v3 = sub_23DA9BAF4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = HGGetTemporaryRawDataDirectory();
  v8 = sub_23DA9BAC4();
  v10 = v9;

  v12 = (void *)a2[3];
  v11 = (void *)a2[4];
  v13 = qword_256CDAFD8;
  swift_bridgeObjectRetain();
  if (v13 != -1)
    swift_once();
  sub_23DA9BAE8();
  v14 = sub_23DA9BAD0();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v17 = sub_23DA70870(v8, v10, v12, v11, v14, v16);
  sub_23DA71608(v14, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = (void *)a2[2];
  a2[2] = v17;

}

uint64_t sub_23DA942DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];
  _QWORD aBlock[6];

  v2 = sub_23DA9BA04();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14[0] = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23DA9BA1C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(a1 + 40);
  aBlock[4] = sub_23DA94780;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23DA7ECA4;
  aBlock[3] = &block_descriptor_6;
  v11 = _Block_copy(aBlock);
  v12 = v10;
  swift_retain();
  sub_23DA9BA10();
  v14[1] = MEMORY[0x24BEE4AF8];
  sub_23DA63860((unint64_t *)&qword_256CDB358, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB360);
  sub_23DA638A0((unint64_t *)&qword_256CDB368, &qword_256CDB360, MEMORY[0x24BEE12C8]);
  sub_23DA9BD88();
  MEMORY[0x242639C94](0, v9, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v14[0] + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void sub_23DA944C0(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 16);
  if (!v2)
  {
    v3 = 0;
    goto LABEL_5;
  }
  v15[0] = 0;
  if (objc_msgSend(v2, sel_closeAndReturnError_, v15))
  {
    v3 = *(NSObject **)(a1 + 16);
    v4 = v15[0];
LABEL_5:
    *(_QWORD *)(a1 + 16) = 0;
LABEL_6:

    return;
  }
  v5 = v15[0];
  v6 = (void *)sub_23DA9B680();

  swift_willThrow();
  if (qword_256CDAFF0 != -1)
    swift_once();
  v7 = sub_23DA9B860();
  __swift_project_value_buffer(v7, (uint64_t)qword_256CE1558);
  v8 = v6;
  v9 = v6;
  v3 = sub_23DA9B848();
  v10 = sub_23DA9BC98();
  if (!os_log_type_enabled(v3, v10))
  {

    goto LABEL_6;
  }
  v11 = (uint8_t *)swift_slowAlloc();
  v12 = (void *)swift_slowAlloc();
  v15[0] = v12;
  *(_DWORD *)v11 = 136315138;
  swift_getErrorValue();
  v13 = sub_23DA9BF80();
  sub_23DA6701C(v13, v14, (uint64_t *)v15);
  sub_23DA9BD58();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_23DA5F000, v3, v10, "[HGDataCollector] Failed to close file handle, error %s", v11, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24263A588](v12, -1, -1);
  MEMORY[0x24263A588](v11, -1, -1);

}

uint64_t sub_23DA94714()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGDataCollector()
{
  return objc_opt_self();
}

double sub_23DA94768@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_23DA93DC0(a1, v2, a2);
}

void sub_23DA94770(uint64_t a1)
{
  _QWORD *v1;

  sub_23DA94188(a1, v1);
}

uint64_t sub_23DA94778()
{
  uint64_t v0;

  return sub_23DA942DC(v0);
}

void sub_23DA94780()
{
  uint64_t v0;

  sub_23DA944C0(v0);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_23DA947A0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23DA947C4()
{
  uint64_t v0;

  sub_23DA9406C(*(_QWORD *)(v0 + 16));
}

uint64_t RawRepresentableWrapper.rawValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v1, AssociatedTypeWitness);
}

uint64_t RawRepresentableWrapper.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v3 = v2;
  v5 = *(_QWORD *)(a1 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v15 - v8;
  v10 = sub_23DA9BD4C();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, AssociatedTypeWitness);
  sub_23DA9BB78();
  v13 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v5);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v12, v5);
  __break(1u);
  return result;
}

uint64_t RawRepresentableWrapper.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v11 - v8;
  sub_23DA9BB6C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, AssociatedTypeWitness);
}

uint64_t sub_23DA94A0C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6156776172 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23DA9BF5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23DA94A90()
{
  return 1;
}

uint64_t sub_23DA94A98()
{
  sub_23DA9BFBC();
  sub_23DA9BFC8();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA94AD8()
{
  return sub_23DA9BFC8();
}

uint64_t sub_23DA94AFC()
{
  sub_23DA9BFBC();
  sub_23DA9BFC8();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA94B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23DA94A0C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23DA94B6C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23DA94A90();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23DA94B98(uint64_t a1)
{
  MEMORY[0x24263A4F8](&unk_23DA9F340, a1);
  return sub_23DA9C01C();
}

uint64_t sub_23DA94BCC(uint64_t a1)
{
  MEMORY[0x24263A4F8](&unk_23DA9F340, a1);
  return sub_23DA9C028();
}

uint64_t static RawRepresentableWrapper<>.== infix(_:_:)()
{
  swift_getAssociatedTypeWitness();
  return sub_23DA9BA94() & 1;
}

uint64_t sub_23DA94C68()
{
  return static RawRepresentableWrapper<>.== infix(_:_:)();
}

uint64_t RawRepresentableWrapper<>.hash(into:)()
{
  swift_getAssociatedTypeWitness();
  return sub_23DA9BA7C();
}

uint64_t RawRepresentableWrapper<>.hashValue.getter()
{
  sub_23DA9BFBC();
  swift_getAssociatedTypeWitness();
  sub_23DA9BA7C();
  return sub_23DA9BFD4();
}

uint64_t sub_23DA94D3C()
{
  return RawRepresentableWrapper<>.hashValue.getter();
}

uint64_t sub_23DA94D44()
{
  return RawRepresentableWrapper<>.hash(into:)();
}

uint64_t sub_23DA94D4C()
{
  sub_23DA9BFBC();
  RawRepresentableWrapper<>.hash(into:)();
  return sub_23DA9BFD4();
}

uint64_t RawRepresentableWrapper<>.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a3;
  v5 = *(_QWORD *)(a2 + 24);
  v13 = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for RawRepresentableWrapper.CodingKeys(255, v13, v5, a4);
  MEMORY[0x24263A4F8](&unk_23DA9F340, v6);
  v7 = sub_23DA9BF38();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23DA9C010();
  swift_getAssociatedTypeWitness();
  sub_23DA9BF2C();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for RawRepresentableWrapper.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RawRepresentableWrapper.CodingKeys);
}

uint64_t sub_23DA94EE0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return RawRepresentableWrapper<>.encode(to:)(a1, a2, *(_QWORD *)(a3 - 8), a4);
}

uint64_t RawRepresentableWrapper<>.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t AssociatedTypeWitness;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v29 = a5;
  v30 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v28 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v32 = (char *)&v24 - v8;
  v10 = type metadata accessor for RawRepresentableWrapper.CodingKeys(255, a2, a3, v9);
  MEMORY[0x24263A4F8](&unk_23DA9F340, v10);
  v33 = sub_23DA9BEFC();
  v26 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v12 = (char *)&v24 - v11;
  v25 = type metadata accessor for RawRepresentableWrapper(0, a2, a3, v13);
  v14 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v16 = (char *)&v24 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v27 = v12;
  v17 = v34;
  sub_23DA9C004();
  if (!v17)
  {
    v34 = v14;
    v18 = v26;
    v19 = v27;
    v21 = v28;
    v20 = v29;
    v22 = AssociatedTypeWitness;
    sub_23DA9BEE4();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v33);
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v16, v32, v22);
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v20, v16, v25);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t type metadata accessor for RawRepresentableWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RawRepresentableWrapper);
}

uint64_t sub_23DA9511C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 8);
  return MEMORY[0x24263A4F8](&protocol conformance descriptor for <> RawRepresentableWrapper<A>, a1, &v4);
}

uint64_t sub_23DA95154@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return RawRepresentableWrapper<>.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), *(_QWORD *)(a3 - 8), a4);
}

uint64_t sub_23DA95174()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23DA9517C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23DA951F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(_QWORD *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_23DA9528C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_23DA952D8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_23DA95330(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_23DA95388(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_23DA953E0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_23DA95438(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2)
    return 0;
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (a2 <= v6)
    goto LABEL_18;
  v7 = *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if ((_DWORD)v7)
  {
    if (v7 > 3)
      LODWORD(v7) = 4;
    __asm { BR              X11 }
  }
  return (v6 + v11 + 1);
}

void sub_23DA95578(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (a3 <= v7)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      v9 = 4u;
    }
    else if (v11 >= 0x100)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 > 1;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (v7 < a2)
  {
    v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_23DA9574C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23DA95758(unsigned int *a1, int a2)
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

uint64_t sub_23DA957A8(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DA957E8 + 4 * byte_23DA9F12E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DA95808 + 4 * byte_23DA9F133[v4]))();
}

_BYTE *sub_23DA957E8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DA95808(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DA95810(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DA95818(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DA95820(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DA95828(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23DA95834()
{
  return 0;
}

void sub_23DA9583C()
{
  JUMPOUT(0x24263A4F8);
}

void sub_23DA9584C()
{
  JUMPOUT(0x24263A4F8);
}

void sub_23DA9585C()
{
  JUMPOUT(0x24263A4F8);
}

uint64_t sub_23DA9586C()
{
  return 0x65756C6156776172;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24263A498](a1, v6, a5);
}

uint64_t sub_23DA958B0(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = a1 + 64;
  v2 = *(_BYTE *)(a1 + 32);
  v3 = 1 << v2;
  v4 = -1;
  if (1 << v2 < 64)
    v4 = ~(-1 << (1 << v2));
  v5 = v4 & *(_QWORD *)(a1 + 64);
  if (!v5)
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 > 6)
    {
      v9 = (unint64_t)(v3 + 63) >> 6;
      v20 = *(_QWORD *)(a1 + 72);
      if (v20)
      {
        v6 = 1;
LABEL_30:
        v8 = (v20 - 1) & v20;
        v7 = __clz(__rbit64(v20)) + (v6 << 6);
        goto LABEL_5;
      }
      if (v6 >= 8)
      {
        v20 = *(_QWORD *)(a1 + 80);
        if (v20)
        {
          v6 = 2;
          goto LABEL_30;
        }
        v20 = *(_QWORD *)(a1 + 88);
        if (v20)
        {
          v6 = 3;
          goto LABEL_30;
        }
LABEL_37:
        if (v6 >= 9)
        {
          v20 = *(_QWORD *)(a1 + 96);
          if (v20)
          {
            v6 = 4;
          }
          else
          {
            v20 = *(_QWORD *)(a1 + 104);
            if (!v20)
              goto LABEL_44;
            v6 = 5;
          }
          goto LABEL_30;
        }
      }
    }
    return 5;
  }
  v6 = 0;
  v7 = __clz(__rbit64(v5));
  v8 = (v5 - 1) & v5;
  v9 = (unint64_t)(v3 + 63) >> 6;
LABEL_5:
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_BYTE *)(v10 + v7);
  v13 = *(double *)(v11 + 8 * v7);
  while (v8)
  {
    v14 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v15 = v14 | (v6 << 6);
LABEL_7:
    if (v13 < *(double *)(v11 + 8 * v15))
    {
      v12 = *(_BYTE *)(v10 + v15);
      v13 = *(double *)(v11 + 8 * v15);
    }
  }
  v16 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v16 >= v9)
    return v12;
  v17 = *(_QWORD *)(v1 + 8 * v16);
  ++v6;
  if (v17)
    goto LABEL_25;
  v6 = v16 + 1;
  if (v16 + 1 >= v9)
    return v12;
  v17 = *(_QWORD *)(v1 + 8 * v6);
  if (v17)
    goto LABEL_25;
  v6 = v16 + 2;
  if (v16 + 2 >= v9)
    return v12;
  v17 = *(_QWORD *)(v1 + 8 * v6);
  if (v17)
    goto LABEL_25;
  v6 = v16 + 3;
  if (v16 + 3 >= v9)
    return v12;
  v17 = *(_QWORD *)(v1 + 8 * v6);
  if (v17)
  {
LABEL_25:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v6 << 6);
    goto LABEL_7;
  }
  v18 = v16 + 4;
  if (v18 >= v9)
    return v12;
  v17 = *(_QWORD *)(v1 + 8 * v18);
  if (v17)
  {
    v6 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v6 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v6 >= v9)
      return v12;
    v17 = *(_QWORD *)(v1 + 8 * v6);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
  __break(1u);
LABEL_44:
  v21 = 0;
  v22 = 6;
  if (v9 > 6)
    v22 = v9;
  while (v22 - 6 != v21)
  {
    v20 = *(_QWORD *)(a1 + 112 + 8 * v21++);
    if (v20)
    {
      v6 = v21 + 5;
      goto LABEL_30;
    }
  }
  return 5;
}

uint64_t sub_23DA95AD4(double a1, double a2, double a3)
{
  uint64_t v3;

  *(_BYTE *)(v3 + 16) = 1;
  *(_QWORD *)(v3 + 24) = sub_23DA8B200((uint64_t)&unk_250E6B470);
  *(_OWORD *)(v3 + 32) = xmmword_23DA9F390;
  *(_OWORD *)(v3 + 48) = xmmword_23DA9F3A0;
  *(_BYTE *)(v3 + 64) = 5;
  sub_23DA9B758();
  *(double *)(v3 + 48) = a1;
  *(double *)(v3 + 56) = a2;
  *(double *)(v3 + 32) = a3;
  return v3;
}

uint64_t sub_23DA95B50@<X0>(void *__src@<X0>, char *a2@<X8>)
{
  uint64_t result;
  char v4;
  _BYTE __dst[312];

  memcpy(__dst, __src, 0x131uLL);
  result = sub_23DA95BA8((uint64_t)__dst);
  if ((_BYTE)result)
    v4 = result;
  else
    v4 = 5;
  *a2 = v4;
  return result;
}

uint64_t sub_23DA95BA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;

  v3 = sub_23DA9B7DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23DA9B7B8();
  v13 = v1;
  v14 = a1;
  v15 = v6;
  v7 = sub_23DA95CC8((void (*)(_QWORD *__return_ptr, _QWORD))sub_23DA96450, (uint64_t)v12, (uint64_t)&unk_250E6B870);
  v8 = *((_QWORD *)v7 + 2);
  if (!v8)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v9 = v7[32];
  swift_bridgeObjectRelease();
  if (v8 != 1 || (sub_23DA96180(v9) & 1) == 0)
    goto LABEL_6;
  *(_BYTE *)(v1 + 64) = v9;
  v10 = v1 + OBJC_IVAR____TtC12HeadGestures23HGPartGestureRecognizer_lastGesturePartRecognizedAt;
  swift_beginAccess();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v4 + 24))(v10, v6, v3);
  swift_endAccess();
LABEL_7:
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return v9;
}

char *sub_23DA95CC8(void (*a1)(_QWORD *__return_ptr, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  char *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  void (*v13)(_QWORD *__return_ptr, _QWORD);
  uint64_t v14;

  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return (char *)MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = (char *)MEMORY[0x24BEE4AF8];
  v13 = a1;
  do
  {
    BYTE1(v14) = *(_BYTE *)(a3 + v7 + 32);
    a1(&v14, (char *)&v14 + 1);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    v9 = v14;
    if (v14 != 5)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_23DA74BF8(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v11 = *((_QWORD *)v8 + 2);
      v10 = *((_QWORD *)v8 + 3);
      if (v11 >= v10 >> 1)
        v8 = sub_23DA74BF8((char *)(v10 > 1), v11 + 1, 1, v8);
      *((_QWORD *)v8 + 2) = v11 + 1;
      v8[v11 + 32] = v9;
      a1 = v13;
    }
    ++v7;
  }
  while (v4 != v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23DA95E14(_BOOL8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  int v12;
  char v13;
  _BYTE v15[56];
  _BYTE v16[32];
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  v7 = sub_23DA9B7DC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_23DA79398(a2 + 176, (uint64_t)v16, &qword_256CDDE48);
  sub_23DA79398((uint64_t)v16, (uint64_t)&v17, &qword_256CDDE48);
  if ((v18 & 1) == 0)
  {
    sub_23DA79398(a2 + 240, (uint64_t)v15, &qword_256CDDE50);
    sub_23DA79398((uint64_t)v15, (uint64_t)&v19, &qword_256CDDE50);
    if ((v20 & 1) == 0)
    {
      v12 = *(unsigned __int8 *)(v3 + 16);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
      if (v12 == 1)
      {
        (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
      }
      else
      {
        v13 = sub_23DA96180(a1);
        (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
        if ((v13 & 1) == 0)
          return 0;
      }
      __asm { BR              X10 }
    }
  }
  return 0;
}

void sub_23DA95FA0()
{
  JUMPOUT(0x23DA95EF0);
}

uint64_t sub_23DA96180(_BOOL8 a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  void (*v14)(_BYTE *, uint64_t);
  char v15;
  _BYTE v16[32];

  v3 = sub_23DA9B7DC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v16[-v8];
  v10 = swift_bridgeObjectRetain();
  v11 = sub_23DA958B0(v10);
  result = swift_bridgeObjectRelease();
  if (v11 == 5)
  {
    __break(1u);
  }
  else
  {
    sub_23DA815A8(v11, a1);
    v13 = v1 + OBJC_IVAR____TtC12HeadGestures23HGPartGestureRecognizer_lastGesturePartRecognizedAt;
    swift_beginAccess();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v7, v13, v3);
    sub_23DA9B788();
    v14 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
    v14(v7, v3);
    v15 = sub_23DA9B77C();
    v14(v9, v3);
    return (v15 & 1) == 0;
  }
  return result;
}

uint64_t sub_23DA96310()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC12HeadGestures23HGPartGestureRecognizer_lastGesturePartRecognizedAt;
  v2 = sub_23DA9B7DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23DA96368()
{
  return type metadata accessor for HGPartGestureRecognizer();
}

uint64_t type metadata accessor for HGPartGestureRecognizer()
{
  uint64_t result;

  result = qword_256CDDCB8;
  if (!qword_256CDDCB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA963AC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23DA9B7DC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23DA96450@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  char v4;
  uint64_t result;
  char v6;

  v4 = *a1;
  result = sub_23DA95E14(*a1, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
  if ((result & 1) != 0)
    v6 = v4;
  else
    v6 = 5;
  *a2 = v6;
  return result;
}

uint64_t sub_23DA964A4(uint64_t a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = 1;
  *(_QWORD *)(v1 + 24) = sub_23DA8B200((uint64_t)&unk_250E6B3D0);
  *(_OWORD *)(v1 + 32) = xmmword_23DA9F390;
  *(_OWORD *)(v1 + 48) = xmmword_23DA9F3A0;
  *(_BYTE *)(v1 + 64) = 5;
  sub_23DA9B758();
  *(double *)(v1 + 32) = *(float *)(a1 + OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout);
  *(double *)(v1 + 48) = *(float *)(a1 + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity);
  *(double *)(v1 + 56) = *(float *)(a1 + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity);
  return v1;
}

uint64_t sub_23DA96550()
{
  return sub_23DA96E4C(MEMORY[0x24BE2FA68]);
}

uint64_t type metadata accessor for E5RTTensorDescriptorDataType()
{
  return objc_opt_self();
}

uint64_t sub_23DA965C0()
{
  int data_ptr;
  int v1;
  uint64_t v2;
  _BYTE *v4;

  data_ptr = e5rt_buffer_object_get_data_ptr();
  if (data_ptr)
  {
    v1 = data_ptr;
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v2 = v1;
    *(_BYTE *)(v2 + 4) = 0;
  }
  else
  {
    sub_23DA8B37C();
    swift_allocError();
    *v4 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_23DA9668C()
{
  return sub_23DA96E4C(MEMORY[0x24BE2F720]);
}

uint64_t type metadata accessor for E5RTBufferObject()
{
  return objc_opt_self();
}

uint64_t sub_23DA966FC()
{
  int v0;
  int v1;
  uint64_t v2;
  _BYTE *v4;

  v0 = e5rt_tensor_desc_alloc_buffer_object();
  if (v0)
  {
    v1 = v0;
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v2 = v1;
    *(_BYTE *)(v2 + 4) = 0;
  }
  else
  {
    sub_23DA8B37C();
    swift_allocError();
    *v4 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_23DA967D0()
{
  return sub_23DA96E4C((uint64_t (*)(_QWORD *))MEMORY[0x24BE2FAA8]);
}

uint64_t type metadata accessor for E5RTTensorDescriptor()
{
  return objc_opt_self();
}

uint64_t sub_23DA96840()
{
  int v0;
  int v1;
  uint64_t v2;
  _BYTE *v4;

  v0 = e5rt_io_port_retain_tensor_desc();
  if (v0)
  {
    v1 = v0;
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v2 = v1;
    *(_BYTE *)(v2 + 4) = 0;
  }
  else
  {
    sub_23DA8B37C();
    swift_allocError();
    *v4 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_23DA9690C()
{
  return sub_23DA96E4C((uint64_t (*)(_QWORD *))MEMORY[0x24BE2F8E8]);
}

uint64_t type metadata accessor for E5RTIOPort()
{
  return objc_opt_self();
}

uint64_t sub_23DA9697C(int64_t a1, uint64_t a2)
{
  return sub_23DA969B4(a1, a2, MEMORY[0x24BE2F820]);
}

uint64_t sub_23DA96998(int64_t a1, uint64_t a2)
{
  return sub_23DA969B4(a1, a2, MEMORY[0x24BE2F7F0]);
}

uint64_t sub_23DA969B4(int64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD, _QWORD *))
{
  _QWORD *v3;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD *);
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  if (a1 < 0)
  {
    __break(1u);
LABEL_23:
    v3 = sub_23DA97034(v3);
    goto LABEL_10;
  }
  v4 = a3;
  v5 = a2;
  v7 = a1;
  v6 = MEMORY[0x24BEE4AF8];
  if (a1)
  {
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_23DA856A0(0, a1, 0);
    v3 = v23;
    v8 = v23[2];
    do
    {
      v9 = v23[3];
      if (v8 >= v9 >> 1)
        sub_23DA856A0(v9 > 1, v8 + 1, 1);
      v23[2] = v8 + 1;
      v23[v8++ + 4] = 0;
      --v7;
    }
    while (v7);
  }
  else
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_23;
LABEL_10:
  v10 = v4(v5, v3[2], v3 + 4);
  if ((_DWORD)v10)
  {
    v11 = v10;
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v12 = v11;
    *(_BYTE *)(v12 + 4) = 0;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = v3[2];
    if (v14)
    {
      v24 = v6;
      sub_23DA855F8(0, v14, 0);
      v15 = 0;
      v11 = v24;
      while (v3[v15 + 4])
      {
        v16 = sub_23DA9BB3C();
        v18 = v17;
        v24 = v11;
        v20 = *(_QWORD *)(v11 + 16);
        v19 = *(_QWORD *)(v11 + 24);
        if (v20 >= v19 >> 1)
          sub_23DA855F8(v19 > 1, v20 + 1, 1);
        ++v15;
        *(_QWORD *)(v11 + 16) = v20 + 1;
        v21 = v11 + 16 * v20;
        *(_QWORD *)(v21 + 32) = v16;
        *(_QWORD *)(v21 + 40) = v18;
        if (v14 == v15)
        {
          swift_bridgeObjectRelease();
          return v11;
        }
      }
      sub_23DA8B2F0();
      swift_allocError();
      *(_DWORD *)v22 = 3;
      *(_BYTE *)(v22 + 4) = 1;
      swift_willThrow();
      v11 = v24;
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
  }
  return v11;
}

uint64_t sub_23DA96BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DA96C98(a1, a2, a3, MEMORY[0x24BE2F850]);
}

uint64_t sub_23DA96C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DA96C98(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD *))MEMORY[0x24BE2F840]);
}

uint64_t sub_23DA96C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;
  _BYTE *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v6 = sub_23DA9BB0C();
  v7 = a4(a3, v6 + 32, v11);
  swift_release();
  if (v7)
  {
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v8 = v7;
    *(_BYTE *)(v8 + 4) = 0;
    return swift_willThrow();
  }
  result = v11[0];
  if (!v11[0])
  {
    sub_23DA8B37C();
    swift_allocError();
    *v10 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23DA96D8C()
{
  return sub_23DA96E4C(MEMORY[0x24BE2F830]);
}

uint64_t type metadata accessor for E5RTExecutionStreamOperation()
{
  return objc_opt_self();
}

uint64_t sub_23DA96DFC()
{
  return sub_23DA96E4C(MEMORY[0x24BE2F870]);
}

uint64_t sub_23DA96E4C(uint64_t (*a1)(_QWORD *))
{
  uint64_t v1;
  int v2;
  uint64_t result;
  int v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = *(_QWORD *)(v1 + 16);
  v2 = a1(v6);
  if (!v2)
    return swift_deallocClassInstance();
  v4 = v2;
  sub_23DA8B2F0();
  swift_allocError();
  *(_DWORD *)v5 = v4;
  *(_BYTE *)(v5 + 4) = 0;
  swift_willThrow();
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for E5RTExecutionStream()
{
  return objc_opt_self();
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for UnsafeE5RTExecutionStream()
{
  return &type metadata for UnsafeE5RTExecutionStream;
}

ValueMetadata *type metadata accessor for UnsafeE5RTExecutionStreamOperation()
{
  return &type metadata for UnsafeE5RTExecutionStreamOperation;
}

ValueMetadata *type metadata accessor for UnsafeE5RTIOPort()
{
  return &type metadata for UnsafeE5RTIOPort;
}

ValueMetadata *type metadata accessor for UnsafeE5RTTensorDescriptor()
{
  return &type metadata for UnsafeE5RTTensorDescriptor;
}

ValueMetadata *type metadata accessor for UnsafeE5RTBufferObject()
{
  return &type metadata for UnsafeE5RTBufferObject;
}

uint64_t _s12HeadGestures34UnsafeE5RTExecutionStreamOperationVwet_0(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t _s12HeadGestures34UnsafeE5RTExecutionStreamOperationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeE5RTTensorDescriptorDataType()
{
  return &type metadata for UnsafeE5RTTensorDescriptorDataType;
}

_QWORD *sub_23DA97034(_QWORD *a1)
{
  return sub_23DA749E0(0, a1[2], 0, a1);
}

uint64_t sub_23DA97048()
{
  int precompiled_compute_operation;
  uint64_t v1;
  _BYTE *v3;

  sub_23DA9BB0C();
  sub_23DA9BB0C();
  sub_23DA9BB0C();
  precompiled_compute_operation = e5rt_execution_stream_operation_create_precompiled_compute_operation();
  swift_release();
  swift_release();
  swift_release();
  if (precompiled_compute_operation)
  {
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v1 = precompiled_compute_operation;
    *(_BYTE *)(v1 + 4) = 0;
  }
  else
  {
    sub_23DA8B37C();
    swift_allocError();
    *v3 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_23DA971A8()
{
  int v0;
  int v1;
  uint64_t v2;
  _BYTE *v4;

  v0 = e5rt_execution_stream_create();
  if (v0)
  {
    v1 = v0;
    sub_23DA8B2F0();
    swift_allocError();
    *(_DWORD *)v2 = v1;
    *(_BYTE *)(v2 + 4) = 0;
  }
  else
  {
    sub_23DA8B37C();
    swift_allocError();
    *v4 = 0;
  }
  return swift_willThrow();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for E5RTUtils.DomainError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for E5RTUtils.DomainError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_23DA972D4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23DA972F0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for E5RTUtils.DomainError()
{
  return &type metadata for E5RTUtils.DomainError;
}

ValueMetadata *type metadata accessor for E5RTErrorCode()
{
  return &type metadata for E5RTErrorCode;
}

void destroy for HGAudioAssetManager(id *a1)
{

}

_QWORD *initializeWithCopy for HGAudioAssetManager(_QWORD *a1, uint64_t a2)
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

uint64_t assignWithCopy for HGAudioAssetManager(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for HGAudioAssetManager(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for HGAudioAssetManager(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HGAudioAssetManager(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for HGAudioAssetManager()
{
  return &type metadata for HGAudioAssetManager;
}

uint64_t sub_23DA9759C@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for HGAudioPlayer(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_23DA9BAA0();
  v5 = (void *)sub_23DA9BAA0();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_23DA9B6B0();

    v7 = sub_23DA9B6D4();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_23DA9B6D4();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

id sub_23DA976C0(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v2 = v1;
  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_23DA9B6A4();
  v13[0] = 0;
  v5 = objc_msgSend(v2, sel_initForReading_error_, v4, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_23DA9B6D4();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_23DA9B680();

    swift_willThrow();
    v11 = sub_23DA9B6D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

id sub_23DA977C8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void (*v18)(_BYTE *, _BYTE *, uint64_t);
  id v19;
  id v20;
  _BYTE v22[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB748);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v22[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_23DA9B6D4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = &v22[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v22[-v11];
  type metadata accessor for HGAudioPlayer(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v15 = (void *)sub_23DA9BAA0();
  v16 = (void *)sub_23DA9BAA0();
  v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (!v17)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_5;
  }
  sub_23DA9B6B0();

  v18 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32);
  v18(v2, v10, v3);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_5:
    sub_23DA68CF4((uint64_t)v2);
    return 0;
  }
  v18(v12, v2, v3);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v7, v12, v3);
  v19 = objc_allocWithZone(MEMORY[0x24BDB1810]);
  v20 = sub_23DA976C0((uint64_t)v7);
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v12, v3);
  return v20;
}

uint64_t sub_23DA97A34(void *a1)
{
  id v1;
  id v2;
  unint64_t v3;
  id v4;
  unsigned int v5;
  id v6;
  uint64_t result;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = a1;
  v2 = objc_msgSend(v1, sel_processingFormat);
  v3 = (unint64_t)objc_msgSend(v1, sel_length);
  if ((v3 & 0x8000000000000000) != 0 || HIDWORD(v3))
    goto LABEL_10;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1838]), sel_initWithPCMFormat_frameCapacity_, v2, v3);

  if (!v4)
  {
    __break(1u);
LABEL_10:
    sub_23DA9BE3C();
    __break(1u);
    goto LABEL_11;
  }
  v12 = 0;
  v5 = objc_msgSend(v1, sel_readIntoBuffer_error_, v4, &v12);
  v2 = v12;
  if (v5)
  {
    v6 = v12;

    return (uint64_t)v4;
  }
LABEL_11:
  v8 = v2;
  v9 = sub_23DA9B680();

  swift_willThrow();
  v15 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDB580);
  sub_23DA98070();
  swift_dynamicCast();
  v10 = v14;
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_23DA9BDE8();
  swift_bridgeObjectRelease();
  v12 = (id)0xD000000000000020;
  v13 = 0x800000023DAA2600;
  v11 = objc_msgSend(v10, sel_localizedDescription);
  sub_23DA9BAC4();

  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  result = sub_23DA9BE48();
  __break(1u);
  return result;
}

id sub_23DA97CC4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (qword_256CDAFE8 != -1)
    swift_once();
  v2 = *(void **)(qword_256CE1550 + 16);
  v3 = (void *)sub_23DA9BAA0();
  objc_msgSend(v2, sel_BOOLForKey_, v3);

  if (a1 == 1 || a1 == 2)
  {
    sub_23DA9BB30();
    v4 = sub_23DA977C8();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

void sub_23DA97E10(_QWORD *a1@<X8>)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;

  if (qword_256CDAFF0 != -1)
    swift_once();
  v2 = sub_23DA9B860();
  __swift_project_value_buffer(v2, (uint64_t)qword_256CE1558);
  v3 = sub_23DA9B848();
  v4 = sub_23DA9BC8C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    sub_23DA9BD58();
    _os_log_impl(&dword_23DA5F000, v3, v4, "[HGAudioAssetManager] using inverted tones: %{BOOL}d", v5, 8u);
    MEMORY[0x24263A588](v5, -1, -1);
  }

  v6 = sub_23DA977C8();
  v7 = (void *)sub_23DA97A34(v6);

  v8 = v7;
  v9 = sub_23DA977C8();
  v10 = (void *)sub_23DA97A34(v9);

  v11 = v10;
  v12 = sub_23DA97CC4(1);
  v13 = (void *)sub_23DA97A34(v12);

  v14 = v13;
  v15 = sub_23DA97CC4(2);
  v16 = (void *)sub_23DA97A34(v15);

  v17 = v16;
  v18 = sub_23DA977C8();
  v19 = sub_23DA97A34(v18);

  *a1 = v7;
  a1[1] = v10;
  a1[2] = v13;
  a1[3] = v16;
  a1[4] = v19;
}

unint64_t sub_23DA98070()
{
  unint64_t result;

  result = qword_256CDE218;
  if (!qword_256CDE218)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CDE218);
  }
  return result;
}

void sub_23DA980AC()
{
  uint64_t v0;

  type metadata accessor for HGDefaults();
  swift_allocObject();
  sub_23DA982E8();
  qword_256CE1550 = v0;
}

uint64_t sub_23DA980E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23DA98120
                                                                     + 4 * aQ_0[a1]))(0xD000000000000016, 0x800000023DAA0850);
}

uint64_t sub_23DA98120()
{
  uint64_t v0;

  return v0 - 12;
}

void sub_23DA982E8()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v1 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v2 = (void *)sub_23DA9BAA0();
  v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

  if (v3)
  {
    *(_QWORD *)(v0 + 16) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDE300);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_23DA9F740;
    *(_QWORD *)(v4 + 32) = 0xD000000000000014;
    *(_QWORD *)(v4 + 40) = 0x800000023DAA0830;
    v5 = MEMORY[0x24BEE13C8];
    *(_QWORD *)(v4 + 48) = 0x3FE6666666666666;
    *(_QWORD *)(v4 + 72) = v5;
    *(_QWORD *)(v4 + 80) = 0xD000000000000016;
    *(_QWORD *)(v4 + 88) = 0x800000023DAA0850;
    *(_QWORD *)(v4 + 96) = 0x3FF0000000000000;
    *(_QWORD *)(v4 + 120) = v5;
    *(_QWORD *)(v4 + 128) = 0xD00000000000001ALL;
    *(_QWORD *)(v4 + 136) = 0x800000023DAA0810;
    *(_QWORD *)(v4 + 144) = 0x3FE999999999999ALL;
    *(_QWORD *)(v4 + 168) = v5;
    *(_QWORD *)(v4 + 176) = 0xD000000000000020;
    *(_QWORD *)(v4 + 184) = 0x800000023DAA09C0;
    *(_QWORD *)(v4 + 192) = 0;
    *(_QWORD *)(v4 + 216) = v5;
    *(_QWORD *)(v4 + 224) = 0xD000000000000020;
    *(_QWORD *)(v4 + 232) = 0x800000023DAA09F0;
    *(_QWORD *)(v4 + 240) = 0;
    *(_QWORD *)(v4 + 264) = v5;
    *(_QWORD *)(v4 + 272) = 0xD00000000000002BLL;
    *(_QWORD *)(v4 + 280) = 0x800000023DAA15D0;
    *(_QWORD *)(v4 + 288) = 0x4010000000000000;
    *(_QWORD *)(v4 + 312) = v5;
    *(_QWORD *)(v4 + 320) = 0xD000000000000023;
    *(_QWORD *)(v4 + 328) = 0x800000023DAA0A20;
    *(_QWORD *)(v4 + 336) = 0x3FE999999999999ALL;
    *(_QWORD *)(v4 + 360) = v5;
    *(_QWORD *)(v4 + 368) = 0xD000000000000023;
    *(_QWORD *)(v4 + 376) = 0x800000023DA9FA80;
    *(_QWORD *)(v4 + 384) = 0x3FD999999999999ALL;
    *(_QWORD *)(v4 + 408) = v5;
    *(_QWORD *)(v4 + 416) = 0xD000000000000021;
    *(_QWORD *)(v4 + 424) = 0x800000023DA9FAB0;
    *(_QWORD *)(v4 + 432) = 0x4008000000000000;
    *(_QWORD *)(v4 + 456) = v5;
    *(_QWORD *)(v4 + 464) = 0xD000000000000024;
    *(_QWORD *)(v4 + 472) = 0x800000023DAA2580;
    v6 = MEMORY[0x24BEE1328];
    *(_BYTE *)(v4 + 480) = 0;
    *(_QWORD *)(v4 + 504) = v6;
    *(_QWORD *)(v4 + 512) = 0xD000000000000013;
    *(_QWORD *)(v4 + 520) = 0x800000023DAA0870;
    *(_QWORD *)(v4 + 552) = v6;
    *(_BYTE *)(v4 + 528) = 1;
    *(_QWORD *)(v4 + 560) = 0xD00000000000001ELL;
    *(_QWORD *)(v4 + 568) = 0x800000023DAA1A60;
    *(_QWORD *)(v4 + 600) = v5;
    *(_QWORD *)(v4 + 576) = 0x3FD999999999999ALL;
    *(_QWORD *)(v4 + 608) = 0xD00000000000001DLL;
    *(_QWORD *)(v4 + 616) = 0x800000023DAA1A80;
    *(_QWORD *)(v4 + 648) = v5;
    *(_QWORD *)(v4 + 624) = 0x3FD999999999999ALL;
    *(_QWORD *)(v4 + 656) = 0xD000000000000015;
    *(_QWORD *)(v4 + 664) = 0x800000023DAA1AA0;
    v7 = MEMORY[0x24BEE1768];
    *(_QWORD *)(v4 + 696) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v4 + 672) = 8;
    *(_QWORD *)(v4 + 704) = 0xD000000000000027;
    *(_QWORD *)(v4 + 712) = 0x800000023DAA1AC0;
    *(_QWORD *)(v4 + 744) = v7;
    *(_QWORD *)(v4 + 720) = 4;
    *(_QWORD *)(v4 + 752) = 0xD000000000000024;
    *(_QWORD *)(v4 + 760) = 0x800000023DAA1AF0;
    *(_QWORD *)(v4 + 792) = v7;
    *(_QWORD *)(v4 + 768) = 3;
    *(_QWORD *)(v4 + 800) = 0xD000000000000020;
    *(_QWORD *)(v4 + 808) = 0x800000023DAA1B20;
    *(_QWORD *)(v4 + 840) = v5;
    *(_QWORD *)(v4 + 816) = 0x3FC999999999999ALL;
    *(_QWORD *)(v4 + 848) = 0xD000000000000021;
    *(_QWORD *)(v4 + 856) = 0x800000023DAA1C60;
    *(_QWORD *)(v4 + 888) = v5;
    *(_QWORD *)(v4 + 864) = 0x3FE3333333333333;
    *(_QWORD *)(v4 + 896) = 0xD000000000000020;
    *(_QWORD *)(v4 + 904) = 0x800000023DAA1C90;
    *(_QWORD *)(v4 + 936) = v5;
    *(_QWORD *)(v4 + 912) = 0x3FE3333333333333;
    *(_QWORD *)(v4 + 944) = 0xD000000000000018;
    *(_QWORD *)(v4 + 952) = 0x800000023DAA1CC0;
    *(_QWORD *)(v4 + 984) = v7;
    *(_QWORD *)(v4 + 960) = 8;
    *(_QWORD *)(v4 + 992) = 0xD00000000000002ALL;
    *(_QWORD *)(v4 + 1000) = 0x800000023DAA1CE0;
    *(_QWORD *)(v4 + 1032) = v7;
    *(_QWORD *)(v4 + 1008) = 4;
    *(_QWORD *)(v4 + 1040) = 0xD000000000000027;
    *(_QWORD *)(v4 + 1048) = 0x800000023DAA1D10;
    *(_QWORD *)(v4 + 1080) = v7;
    *(_QWORD *)(v4 + 1056) = 3;
    *(_QWORD *)(v4 + 1088) = 0xD000000000000023;
    *(_QWORD *)(v4 + 1096) = 0x800000023DAA1D40;
    *(_QWORD *)(v4 + 1128) = v5;
    *(_QWORD *)(v4 + 1104) = 0x4000000000000000;
    *(_QWORD *)(v4 + 1136) = 0xD000000000000023;
    *(_QWORD *)(v4 + 1144) = 0x800000023DAA1B50;
    *(_QWORD *)(v4 + 1176) = v5;
    *(_QWORD *)(v4 + 1152) = 0x3FE999999999999ALL;
    *(_QWORD *)(v4 + 1184) = 0xD000000000000022;
    *(_QWORD *)(v4 + 1192) = 0x800000023DAA1B80;
    *(_QWORD *)(v4 + 1224) = v5;
    *(_QWORD *)(v4 + 1200) = 0x3FE999999999999ALL;
    *(_QWORD *)(v4 + 1232) = 0xD00000000000001ALL;
    *(_QWORD *)(v4 + 1240) = 0x800000023DAA1BB0;
    *(_QWORD *)(v4 + 1272) = v7;
    *(_QWORD *)(v4 + 1248) = 8;
    *(_QWORD *)(v4 + 1280) = 0xD00000000000002CLL;
    *(_QWORD *)(v4 + 1288) = 0x800000023DAA1BD0;
    *(_QWORD *)(v4 + 1320) = v7;
    *(_QWORD *)(v4 + 1296) = 4;
    *(_QWORD *)(v4 + 1328) = 0xD000000000000029;
    *(_QWORD *)(v4 + 1336) = 0x800000023DAA1C00;
    *(_QWORD *)(v4 + 1368) = v7;
    *(_QWORD *)(v4 + 1344) = 3;
    *(_QWORD *)(v4 + 1376) = 0xD000000000000025;
    *(_QWORD *)(v4 + 1384) = 0x800000023DAA1C30;
    *(_QWORD *)(v4 + 1416) = v5;
    *(_QWORD *)(v4 + 1392) = 0x4000000000000000;
    v8 = v3;
    sub_23DA87BD4(v4);
    v9 = (void *)sub_23DA9BA4C();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_registerDefaults_, v9);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23DA987FC()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGDefaults()
{
  return objc_opt_self();
}

uint64_t sub_23DA98840()
{
  uint64_t v0;

  v0 = sub_23DA9B860();
  __swift_allocate_value_buffer(v0, qword_256CE1558);
  __swift_project_value_buffer(v0, (uint64_t)qword_256CE1558);
  return sub_23DA9B854();
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

id sub_23DA98900()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDBF48);
  v0 = (void *)sub_23DA9BA4C();
  swift_bridgeObjectRelease();
  v5[0] = 0;
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_featureValueWithDictionary_error_, v0, v5);

  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_23DA9B680();

    swift_willThrow();
  }
  return v1;
}

void sub_23DA98A04()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  sub_23DA9BDE8();
  sub_23DA9BB30();
  v1 = *(void **)(v0 + 16);
  v2 = (void *)sub_23DA9BAA0();
  v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, sel_stringValue);

    sub_23DA9BAC4();
    sub_23DA9BB30();
    swift_bridgeObjectRelease();
    sub_23DA9BB30();
    v5 = (void *)sub_23DA9BAA0();
    v6 = objc_msgSend(v1, sel_featureValueForName_, v5);

    if (v6)
    {
      v7 = objc_msgSend(v6, sel_dictionaryValue);

      sub_23DA6BCC0(0, (unint64_t *)&qword_256CDBF48);
      v8 = sub_23DA9BA58();

      sub_23DA98DA8(v8);
      swift_bridgeObjectRelease();
      sub_23DA9BA64();
      sub_23DA9BB30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23DA9BB30();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23DA98C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v5 = *(void **)(a3 + 16);
  v6 = (void *)sub_23DA9BAA0();
  v7 = objc_msgSend(v5, sel_featureValueForName_, v6);

  if (v7)
  {
    v8 = objc_msgSend(v7, sel_dictionaryValue);

    sub_23DA6BCC0(0, (unint64_t *)&qword_256CDBF48);
    v9 = sub_23DA9BA58();

    v10 = sub_23DA98DA8(v9);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v10 + 16))
    {
      swift_bridgeObjectRetain();
      sub_23DA99804(a1, a2);
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23DA98DA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int64_t v12;
  __int128 v13;
  id v14;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2D0);
    v2 = sub_23DA9BE78();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v12 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v5)
  {
    if (v12 > 1)
    {
      v8 = *(_QWORD *)(a1 + 72);
      v9 = 1;
      if (v8)
        goto LABEL_23;
      v9 = 2;
      if (v12 <= 2)
        goto LABEL_25;
      v8 = *(_QWORD *)(a1 + 80);
      if (v8)
        goto LABEL_23;
      v9 = 3;
      if (v12 <= 3)
        goto LABEL_25;
      v8 = *(_QWORD *)(a1 + 88);
      if (v8)
        goto LABEL_23;
      v9 = 4;
      if (v12 <= 4)
        goto LABEL_25;
      v8 = *(_QWORD *)(a1 + 96);
      if (v8)
      {
LABEL_23:
        v7 = __clz(__rbit64(v8)) + (v9 << 6);
        goto LABEL_24;
      }
      v10 = 5;
      if (v12 > 5)
      {
        v8 = *(_QWORD *)(a1 + 104);
        if (!v8)
        {
          while (1)
          {
            v9 = v10 + 1;
            if (__OFADD__(v10, 1))
              break;
            if (v9 >= v12)
              goto LABEL_25;
            v8 = *(_QWORD *)(a1 + 64 + 8 * v9);
            ++v10;
            if (v8)
              goto LABEL_23;
          }
          __break(1u);
          goto LABEL_27;
        }
        v9 = 5;
        goto LABEL_23;
      }
    }
LABEL_25:
    sub_23DA8B334();
    return v2;
  }
  v7 = __clz(__rbit64(v5));
LABEL_24:
  sub_23DA9A734(*(_QWORD *)(a1 + 48) + 40 * v7, (uint64_t)&v13);
  v14 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v7);
  v11 = v14;
  swift_dynamicCast();
  v11;
  result = MEMORY[0x242639BB0]();
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23DA991DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256CDE300);
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_OWORD *)(inited + 16) = xmmword_23DA9D750;
  *(_QWORD *)(inited + 40) = 0x800000023DAA0E10;
  v5 = sub_23DA6BCC0(0, &qword_256CDBF58);
  sub_23DA9939C(a1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = sub_23DA98900();
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0x62614C7373616C63;
  *(_QWORD *)(inited + 88) = 0xEA00000000006C65;
  v6 = (void *)sub_23DA9BAA0();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), sel_featureValueWithString_, v6);

  *(_QWORD *)(inited + 120) = v5;
  *(_QWORD *)(inited + 96) = v7;
  sub_23DA87BD4(inited);
  v8 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  *(_QWORD *)(v2 + 16) = sub_23DA99720();
  return v2;
}

uint64_t sub_23DA9939C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDD2F0);
    v2 = sub_23DA9BE78();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v3 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(63 - v4) >> 6;
  v8 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v13);
    v15 = v10 + 1;
    if (!v14)
    {
      v15 = v10 + 2;
      if (v10 + 2 >= v7)
        goto LABEL_37;
      v14 = *(_QWORD *)(v3 + 8 * v15);
      if (!v14)
      {
        v15 = v10 + 3;
        if (v10 + 3 >= v7)
          goto LABEL_37;
        v14 = *(_QWORD *)(v3 + 8 * v15);
        if (!v14)
        {
          v15 = v10 + 4;
          if (v10 + 4 >= v7)
            goto LABEL_37;
          v14 = *(_QWORD *)(v3 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v14 - 1) & v14;
    v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    v17 = sub_23DA9BBFC();
    result = sub_23DA9BD94();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v23 = v20 == v22;
        if (v20 == v22)
          v20 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v2 + 48) + 40 * v11;
    *(_OWORD *)v12 = v25;
    *(_OWORD *)(v12 + 16) = v26;
    *(_QWORD *)(v12 + 32) = v27;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v11) = v17;
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_23DA8B334();
    return v2;
  }
  v14 = *(_QWORD *)(v3 + 8 * v16);
  if (v14)
  {
    v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23DA996B0()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMLOutput()
{
  return objc_opt_self();
}

void sub_23DA996F4(uint64_t *a1, uint64_t *a2)
{
  sub_23DA9A4C0(*a1, *a2);
}

void sub_23DA99700()
{
  sub_23DA98A04();
}

id sub_23DA99720()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_23DA9BA4C();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_23DA9B680();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_23DA99804(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DA9BFBC();
  sub_23DA9BB18();
  v4 = sub_23DA9BFD4();
  return sub_23DA99A64(a1, a2, v4);
}

unint64_t sub_23DA9986C(unsigned __int8 a1)
{
  uint64_t v2;

  sub_23DA9BFBC();
  sub_23DA9BFC8();
  v2 = sub_23DA9BFD4();
  return sub_23DA99B44(a1, v2);
}

unint64_t sub_23DA998D0(uint64_t a1)
{
  uint64_t v2;

  sub_23DA9BFBC();
  type metadata accessor for CFString(0);
  sub_23DA92FB0();
  sub_23DA9B830();
  v2 = sub_23DA9BFD4();
  return sub_23DA99BE4(a1, v2);
}

unint64_t sub_23DA99940(uint64_t a1)
{
  uint64_t v2;

  sub_23DA9BAC4();
  sub_23DA9BFBC();
  sub_23DA9BB18();
  v2 = sub_23DA9BFD4();
  swift_bridgeObjectRelease();
  return sub_23DA99D0C(a1, v2);
}

unint64_t sub_23DA999C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23DA9BD94();
  return sub_23DA99E80(a1, v2);
}

uint64_t sub_23DA999F0(uint64_t a1)
{
  uint64_t v2;

  sub_23DA9BFBC();
  sub_23DA7C5EC(a1);
  sub_23DA9BB18();
  swift_bridgeObjectRelease();
  v2 = sub_23DA9BFD4();
  return sub_23DA99F44(a1, v2);
}

unint64_t sub_23DA99A64(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23DA9BF5C() & 1) == 0)
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
      while (!v14 && (sub_23DA9BF5C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23DA99B44(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_23DA99BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_23DA92FB0();
    v7 = v6;
    v8 = sub_23DA9B824();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_23DA9B824();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_23DA99D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_23DA9BAC4();
    v8 = v7;
    if (v6 == sub_23DA9BAC4() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23DA9BF5C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_23DA9BAC4();
          v15 = v14;
          if (v13 == sub_23DA9BAC4() && v15 == v16)
            break;
          v18 = sub_23DA9BF5C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_23DA99E80(uint64_t a1, uint64_t a2)
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
      sub_23DA9A734(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242639D48](v9, a1);
      sub_23DA9A770((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_23DA99F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_23DA9A30C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v18 >= v8)
      goto LABEL_24;
    v19 = *(_QWORD *)(v4 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v8)
        goto LABEL_24;
      v19 = *(_QWORD *)(v4 + 8 * v10);
      if (!v19)
      {
        v10 = v18 + 2;
        if (v18 + 2 >= v8)
          goto LABEL_24;
        v19 = *(_QWORD *)(v4 + 8 * v10);
        if (!v19)
        {
          v10 = v18 + 3;
          if (v18 + 3 >= v8)
            goto LABEL_24;
          v19 = *(_QWORD *)(v4 + 8 * v10);
          if (!v19)
          {
            v20 = v18 + 4;
            if (v20 >= v8)
            {
LABEL_24:
              v21 = 1;
              goto LABEL_25;
            }
            v19 = *(_QWORD *)(v4 + 8 * v20);
            if (!v19)
            {
              while (1)
              {
                v10 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_27;
                if (v10 >= v8)
                  goto LABEL_24;
                v19 = *(_QWORD *)(v4 + 8 * v10);
                ++v20;
                if (v19)
                  goto LABEL_22;
              }
            }
            v10 = v20;
          }
        }
      }
    }
LABEL_22:
    v7 = (v19 - 1) & v19;
    v12 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(double *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    v17 = a2(v14, v15, v16);
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      v21 = 0;
LABEL_25:
      swift_release();
      return v21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_23DA9A4C0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(void **)(a1 + 16);
  v4 = (void *)sub_23DA9BAA0();
  v5 = objc_msgSend(v3, sel_featureValueForName_, v4);

  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = objc_msgSend(v5, sel_dictionaryValue);

  sub_23DA6BCC0(0, (unint64_t *)&qword_256CDBF48);
  v7 = sub_23DA9BA58();

  v8 = sub_23DA98DA8(v7);
  swift_bridgeObjectRelease();
  sub_23DA9A30C(v8, (uint64_t (*)(uint64_t, uint64_t, double))sub_23DA9A72C);
  swift_bridgeObjectRelease();
  v9 = (void *)sub_23DA9BAA0();
  v10 = objc_msgSend(v3, sel_featureValueForName_, v9);

  if (!v10)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v11 = objc_msgSend(v10, sel_stringValue);

  v12 = sub_23DA9BAC4();
  v14 = v13;

  v15 = *(void **)(a2 + 16);
  v16 = (void *)sub_23DA9BAA0();
  v17 = objc_msgSend(v15, sel_featureValueForName_, v16);

  if (!v17)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v18 = objc_msgSend(v17, sel_stringValue);

  v19 = sub_23DA9BAC4();
  v21 = v20;

  if (v12 == v19 && v14 == v21)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_23DA9BF5C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_23DA9A72C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23DA98C44(a1, a2, v2);
}

uint64_t sub_23DA9A734(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23DA9A770(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

void sub_23DA9A7A4(uint64_t a1, void *a2, void *a3)
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

unint64_t sub_23DA9A86C()
{
  uint64_t v0;

  sub_23DA9BDE8();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager), sel_isDeviceMotionActive);
  sub_23DA9BB30();
  swift_bridgeObjectRelease();
  return 0xD000000000000016;
}

void sub_23DA9A918()
{
  char *v0;
  char *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t aBlock[6];

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager];
  if ((objc_msgSend(v2, sel_isDeviceMotionActive) & 1) == 0)
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v3 = sub_23DA9B860();
    __swift_project_value_buffer(v3, (uint64_t)qword_256CE1558);
    v4 = sub_23DA9B848();
    v5 = sub_23DA9BC8C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      aBlock[0] = v7;
      *(_DWORD *)v6 = 136315138;
      sub_23DA6701C(0x29287472617473, 0xE700000000000000, aBlock);
      sub_23DA9BD58();
      _os_log_impl(&dword_23DA5F000, v4, v5, "HGBuiltinMotionDataProvider:%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v7, -1, -1);
      MEMORY[0x24263A588](v6, -1, -1);
    }

    objc_msgSend(v2, sel_setDeviceMotionUpdateInterval_, 1.0 / *(double *)&v1[OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_samplingRate]);
    v8 = *(_QWORD *)&v1[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue];
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v1;
    aBlock[4] = (uint64_t)sub_23DA9B1E0;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23DA9A7A4;
    aBlock[3] = (uint64_t)&block_descriptor_7;
    v10 = _Block_copy(aBlock);
    v11 = v1;
    swift_release();
    objc_msgSend(v2, sel_startDeviceMotionUpdatesToQueue_withHandler_, v8, v10);
    _Block_release(v10);
  }
}

void sub_23DA9AB68(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _OWORD v25[6];
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  _OWORD v34[6];
  _OWORD v35[2];

  v6 = sub_23DA9B7DC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v10 = a2;
    if (qword_256CDAFF0 != -1)
      swift_once();
    v11 = sub_23DA9B860();
    __swift_project_value_buffer(v11, (uint64_t)qword_256CE1558);
    v12 = a2;
    v13 = a2;
    v24 = sub_23DA9B848();
    v14 = sub_23DA9BC98();
    if (os_log_type_enabled(v24, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      *(_QWORD *)&v34[0] = v16;
      *(_DWORD *)v15 = 136315138;
      swift_getErrorValue();
      v17 = sub_23DA9BF80();
      *(_QWORD *)&v27 = sub_23DA6701C(v17, v18, (uint64_t *)v34);
      sub_23DA9BD58();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23DA5F000, v24, v14, "HGBuiltinMotionDataProviderError: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v16, -1, -1);
      MEMORY[0x24263A588](v15, -1, -1);

    }
    else
    {

    }
  }
  else if (a1)
  {
    v19 = a1;
    sub_23DA9B7B8();
    sub_23DA9B7A0();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_23DA7CFC8(v19, (uint64_t)&v27, v21);

    v34[4] = v31;
    v34[5] = v32;
    v35[0] = v33[0];
    *(_OWORD *)((char *)v35 + 9) = *(_OWORD *)((char *)v33 + 9);
    v34[0] = v27;
    v34[1] = v28;
    v34[2] = v29;
    v34[3] = v30;
    sub_23DA9B890();
    v25[4] = v31;
    v25[5] = v32;
    v26[0] = v33[0];
    *(_OWORD *)((char *)v26 + 9) = *(_OWORD *)((char *)v33 + 9);
    v25[0] = v27;
    v25[1] = v28;
    v25[2] = v29;
    v25[3] = v30;
    nullsub_1(v25);
    v22 = a3 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
    sub_23DA6425C(a3 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v34);
    sub_23DA6425C((uint64_t)v25, v22);
    sub_23DA736E8((uint64_t)v34);
  }
}

id sub_23DA9AEA8()
{
  uint64_t v0;
  void *v1;
  id result;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager);
  result = objc_msgSend(v1, sel_isDeviceMotionActive);
  if ((_DWORD)result)
  {
    if (qword_256CDAFF0 != -1)
      swift_once();
    v3 = sub_23DA9B860();
    __swift_project_value_buffer(v3, (uint64_t)qword_256CE1558);
    v4 = sub_23DA9B848();
    v5 = sub_23DA9BC8C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v8 = v7;
      *(_DWORD *)v6 = 136315138;
      sub_23DA6701C(0x2928706F7473, 0xE600000000000000, &v8);
      sub_23DA9BD58();
      _os_log_impl(&dword_23DA5F000, v4, v5, "HGBuiltinMotionDataProviderError:%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24263A588](v7, -1, -1);
      MEMORY[0x24263A588](v6, -1, -1);
    }

    return objc_msgSend(v1, sel_stopDeviceMotionUpdates);
  }
  return result;
}

void sub_23DA9B0D4()
{
  uint64_t v0;

}

id sub_23DA9B0E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGBuiltinMotionDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23DA9B128()
{
  return type metadata accessor for HGBuiltinMotionDataProvider();
}

uint64_t type metadata accessor for HGBuiltinMotionDataProvider()
{
  uint64_t result;

  result = qword_256CDE400;
  if (!qword_256CDE400)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23DA9B16C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_23DA9B1BC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23DA9B1E0(void *a1, void *a2)
{
  uint64_t v2;

  sub_23DA9AB68(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t type metadata accessor for MotionTransformerInput()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MotionTransformerOutput()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MotionTransformer()
{
  return objc_opt_self();
}

uint64_t sub_23DA9B428(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256CDE738);
    v3 = sub_23DA9BDD0();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_23DA9BFBC();
      swift_bridgeObjectRetain();
      sub_23DA9BB18();
      result = sub_23DA9BFD4();
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
        if (v17 || (result = sub_23DA9BF5C(), (result & 1) != 0))
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
            result = sub_23DA9BF5C();
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
  return MEMORY[0x24BEE4B08];
}

void HGSetTemporaryDirectorySuffix_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23DA5F000, log, OS_LOG_TYPE_ERROR, "Failed to set temporary directory suffix", v1, 2u);
}

uint64_t sub_23DA9B608()
{
  return MEMORY[0x24BDCB6D0]();
}

uint64_t sub_23DA9B614()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23DA9B620()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23DA9B62C()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23DA9B638()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23DA9B644()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23DA9B650()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23DA9B65C()
{
  return MEMORY[0x24BDCBBF8]();
}

uint64_t sub_23DA9B668()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23DA9B674()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23DA9B680()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23DA9B68C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23DA9B698()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_23DA9B6A4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23DA9B6B0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23DA9B6BC()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23DA9B6C8()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_23DA9B6D4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23DA9B6E0()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23DA9B6EC()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_23DA9B6F8()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23DA9B704()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23DA9B710()
{
  return MEMORY[0x24BDCDC38]();
}

uint64_t sub_23DA9B71C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23DA9B728()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23DA9B734()
{
  return MEMORY[0x24BDCDD18]();
}

uint64_t sub_23DA9B740()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_23DA9B74C()
{
  return MEMORY[0x24BDCDD68]();
}

uint64_t sub_23DA9B758()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_23DA9B764()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23DA9B770()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23DA9B77C()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23DA9B788()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_23DA9B794()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_23DA9B7A0()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23DA9B7AC()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23DA9B7B8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23DA9B7C4()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_23DA9B7D0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23DA9B7DC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23DA9B7E8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23DA9B7F4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23DA9B800()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23DA9B80C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23DA9B818()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23DA9B824()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_23DA9B830()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_23DA9B83C()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_23DA9B848()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DA9B854()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23DA9B860()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DA9B86C()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_23DA9B878()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_23DA9B884()
{
  return MEMORY[0x24BDB9C70]();
}

uint64_t sub_23DA9B890()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_23DA9B89C()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_23DA9B8A8()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t sub_23DA9B8B4()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_23DA9B8C0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23DA9B8CC()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_23DA9B8D8()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_23DA9B8E4()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_23DA9B8F0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23DA9B8FC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23DA9B908()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23DA9B914()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_23DA9B920()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_23DA9B92C()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_23DA9B938()
{
  return MEMORY[0x24BDB9F68]();
}

uint64_t sub_23DA9B944()
{
  return MEMORY[0x24BDB9F70]();
}

uint64_t sub_23DA9B950()
{
  return MEMORY[0x24BDB9F80]();
}

uint64_t sub_23DA9B95C()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_23DA9B968()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_23DA9B974()
{
  return MEMORY[0x24BDB9FC0]();
}

uint64_t sub_23DA9B980()
{
  return MEMORY[0x24BDB9FD8]();
}

uint64_t sub_23DA9B98C()
{
  return MEMORY[0x24BDB9FE0]();
}

uint64_t sub_23DA9B998()
{
  return MEMORY[0x24BDBA010]();
}

uint64_t sub_23DA9B9A4()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_23DA9B9B0()
{
  return MEMORY[0x24BDBA048]();
}

uint64_t sub_23DA9B9BC()
{
  return MEMORY[0x24BDBA070]();
}

uint64_t sub_23DA9B9C8()
{
  return MEMORY[0x24BDBA080]();
}

uint64_t sub_23DA9B9D4()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_23DA9B9E0()
{
  return MEMORY[0x24BDBA0A8]();
}

uint64_t sub_23DA9B9EC()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_23DA9B9F8()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23DA9BA04()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23DA9BA10()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23DA9BA1C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23DA9BA28()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23DA9BA34()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23DA9BA40()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23DA9BA4C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23DA9BA58()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23DA9BA64()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23DA9BA70()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23DA9BA7C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23DA9BA88()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23DA9BA94()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23DA9BAA0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DA9BAAC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23DA9BAB8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23DA9BAC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23DA9BAD0()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23DA9BADC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23DA9BAE8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23DA9BAF4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23DA9BB00()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DA9BB0C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23DA9BB18()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DA9BB24()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_23DA9BB30()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DA9BB3C()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23DA9BB48()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DA9BB54()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23DA9BB60()
{
  return MEMORY[0x24BDBA170]();
}

uint64_t sub_23DA9BB6C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23DA9BB78()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_23DA9BB84()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23DA9BB90()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23DA9BB9C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23DA9BBA8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23DA9BBB4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23DA9BBC0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23DA9BBCC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23DA9BBD8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23DA9BBE4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23DA9BBF0()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23DA9BBFC()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_23DA9BC08()
{
  return MEMORY[0x24BDCFC60]();
}

uint64_t sub_23DA9BC14()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23DA9BC20()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_23DA9BC2C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23DA9BC38()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23DA9BC44()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23DA9BC50()
{
  return MEMORY[0x24BDBFE58]();
}

uint64_t sub_23DA9BC5C()
{
  return MEMORY[0x24BDBFE78]();
}

uint64_t sub_23DA9BC68()
{
  return MEMORY[0x24BDCFE60]();
}

uint64_t sub_23DA9BC74()
{
  return MEMORY[0x24BDCFE78]();
}

uint64_t sub_23DA9BC80()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23DA9BC8C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23DA9BC98()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DA9BCA4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23DA9BCB0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23DA9BCBC()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_23DA9BCC8()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_23DA9BCD4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23DA9BCE0()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23DA9BCEC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23DA9BCF8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23DA9BD04()
{
  return MEMORY[0x24BDD01C8]();
}

uint64_t sub_23DA9BD10()
{
  return MEMORY[0x24BDD01D8]();
}

uint64_t sub_23DA9BD1C()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_23DA9BD28()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_23DA9BD34()
{
  return MEMORY[0x24BDD03E8]();
}

uint64_t sub_23DA9BD40()
{
  return MEMORY[0x24BDD03F0]();
}

uint64_t sub_23DA9BD4C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DA9BD58()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DA9BD64()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DA9BD70()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23DA9BD7C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23DA9BD88()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23DA9BD94()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23DA9BDA0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23DA9BDAC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23DA9BDB8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23DA9BDC4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23DA9BDD0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23DA9BDDC()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_23DA9BDE8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DA9BDF4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DA9BE00()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DA9BE0C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23DA9BE18()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23DA9BE24()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DA9BE30()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_23DA9BE3C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DA9BE48()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23DA9BE54()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DA9BE60()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23DA9BE6C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23DA9BE78()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23DA9BE84()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DA9BE90()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_23DA9BE9C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23DA9BEA8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DA9BEB4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23DA9BEC0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23DA9BECC()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23DA9BED8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23DA9BEE4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23DA9BEF0()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23DA9BEFC()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23DA9BF08()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23DA9BF14()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23DA9BF20()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23DA9BF2C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23DA9BF38()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23DA9BF44()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23DA9BF50()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DA9BF5C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DA9BF68()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23DA9BF74()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23DA9BF80()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23DA9BF8C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23DA9BF98()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23DA9BFA4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23DA9BFB0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23DA9BFBC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DA9BFC8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DA9BFD4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DA9BFE0()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_23DA9BFEC()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_23DA9BFF8()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_23DA9C004()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23DA9C010()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23DA9C01C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23DA9C028()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x24BDB6990]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x24BDACC40]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x24BE2F700]();
}

uint64_t e5rt_buffer_object_get_size()
{
  return MEMORY[0x24BE2F718]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x24BE2F7A0]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x24BE2F7B0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x24BE2F7C0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x24BE2F7D0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x24BE2F800]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x24BE2F808]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x24BE2F840]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x24BE2F8A8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x24BE2F8E8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x24BE2F908]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x24BE2FA20]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x24BE2FAA8]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

