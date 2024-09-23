unint64_t ATRawAssortmentServiceName.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_236A43554(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_236A43580()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2564329F8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_236A49570;
  sub_236A48F4C();
  swift_bridgeObjectRelease();
  sub_236A48EA4();
  sub_236A48EA4();
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 32) = 0xD000000000000012;
  *(_QWORD *)(v0 + 40) = 0x8000000236A49870;
  sub_236A48FAC();
  return swift_bridgeObjectRelease();
}

uint64_t static ATRawAssortmentClient.printRawAssortment()()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v29;
  unint64_t aBlock;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  v0 = (void *)objc_opt_self();
  v1 = &unk_256434800;
  v2 = objc_msgSend(v0, sel_interfaceWithProtocol_, v1);
  v3 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v4 = (void *)sub_236A48E80();
  v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 0);

  -[NSObject setRemoteObjectInterface:](v5, sel_setRemoteObjectInterface_, v2);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0xD00000000000002BLL;
  *(_QWORD *)(v6 + 24) = 0x8000000236A496D0;
  v34 = sub_236A43EE0;
  v35 = v6;
  v7 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v31 = 1107296256;
  v32 = sub_236A43554;
  v33 = &block_descriptor;
  v8 = _Block_copy(&aBlock);
  swift_release();
  -[NSObject setInterruptionHandler:](v5, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0xD00000000000002BLL;
  *(_QWORD *)(v9 + 24) = 0x8000000236A496D0;
  v34 = sub_236A43F2C;
  v35 = v9;
  aBlock = v7;
  v31 = 1107296256;
  v32 = sub_236A43554;
  v33 = &block_descriptor_6;
  v10 = _Block_copy(&aBlock);
  swift_release();
  -[NSObject setInvalidationHandler:](v5, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
  -[NSObject activate](v5, sel_activate);

  v34 = sub_236A43BE0;
  v35 = 0;
  aBlock = v7;
  v31 = 1107296256;
  v32 = sub_236A43CD4;
  v33 = &block_descriptor_9;
  v11 = _Block_copy(&aBlock);
  v12 = -[NSObject remoteObjectProxyWithErrorHandler:](v5, sel_remoteObjectProxyWithErrorHandler_, v11);
  _Block_release(v11);
  sub_236A48F40();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564329F0);
  v13 = swift_dynamicCast();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2564329F8);
  if ((_DWORD)v13)
  {
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_236A49570;
    aBlock = 0;
    v31 = 0xE000000000000000;
    sub_236A48F4C();
    swift_bridgeObjectRelease();
    aBlock = 0xD00000000000002ALL;
    v31 = 0x8000000236A49770;
    -[NSObject processIdentifier](v5, sel_processIdentifier);
    sub_236A48F7C();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    v15 = aBlock;
    v16 = v31;
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v16;
    sub_236A48FAC();
    swift_bridgeObjectRelease();
    v17 = dispatch_semaphore_create(0);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    v34 = sub_236A43FC4;
    v35 = v18;
    aBlock = v7;
    v31 = 1107296256;
    v32 = sub_236A43D24;
    v33 = &block_descriptor_15;
    v19 = _Block_copy(&aBlock);
    v20 = v17;
    swift_release();
    objc_msgSend(v29, sel_spotlightEmailAttributes_completionHandler_, 10, v19);
    _Block_release(v19);
    sub_236A48F04();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v20;
    v34 = sub_236A43FFC;
    v35 = v21;
    aBlock = v7;
    v31 = 1107296256;
    v32 = sub_236A43D24;
    v33 = &block_descriptor_21;
    v22 = _Block_copy(&aBlock);
    v23 = v20;
    swift_release();
    objc_msgSend(v29, sel_spotlightItemTitles_completionHandler_, 10, v22);
    _Block_release(v22);
    sub_236A48F04();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v23;
    v34 = sub_236A44030;
    v35 = v24;
    aBlock = v7;
    v31 = 1107296256;
    v32 = sub_236A43D24;
    v33 = &block_descriptor_27;
    v25 = _Block_copy(&aBlock);
    v26 = v23;
    swift_release();
    objc_msgSend(v29, sel_textOnScreenAX_, v25);
    _Block_release(v25);
    sub_236A48F04();
    swift_unknownObjectRelease();

    v5 = v26;
  }
  else
  {
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_236A49570;
    *(_QWORD *)(v27 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v27 + 32) = 0xD000000000000033;
    *(_QWORD *)(v27 + 40) = 0x8000000236A49730;
    sub_236A48FAC();
    swift_bridgeObjectRelease();
  }

  return v13;
}

uint64_t sub_236A43BE0()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2564329F8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_236A49570;
  sub_236A48F4C();
  sub_236A48EA4();
  swift_getErrorValue();
  sub_236A48FA0();
  sub_236A48EA4();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0xE000000000000000;
  sub_236A48FAC();
  return swift_bridgeObjectRelease();
}

void sub_236A43CD4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_236A43D24(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    v3 = sub_236A48E98();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  swift_retain();
  v2(v3, v5);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236A43D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2564329F8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_236A49570;
  sub_236A48F4C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_236A48EA4();
  swift_bridgeObjectRelease();
  sub_236A48EA4();
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 32) = a5;
  *(_QWORD *)(v8 + 40) = a6;
  sub_236A48FAC();
  swift_bridgeObjectRelease();
  return sub_236A48F10();
}

uint64_t ATRawAssortmentClient.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ATRawAssortmentClient.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_236A43EBC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_236A43EE0()
{
  return sub_236A43580();
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

uint64_t sub_236A43F2C()
{
  return sub_236A43580();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7F9B40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_236A43FA0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_236A43FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_236A43D88(a1, a2, *(_QWORD *)(v2 + 16), 16, 0x69616D65200A0A0ALL, 0xEB000000003A736CLL);
}

uint64_t sub_236A43FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_236A43D88(a1, a2, *(_QWORD *)(v2 + 16), 21, 0xD000000000000010, 0x8000000236A49810);
}

uint64_t sub_236A44030(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_236A43D88(a1, a2, *(_QWORD *)(v2 + 16), 24, 0xD000000000000013, 0x8000000236A497F0);
}

uint64_t type metadata accessor for ATRawAssortmentClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for ATRawAssortmentClient()
{
  return swift_lookUpClassMethod();
}

unint64_t ATPersonalizationServiceName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t static ATCalendarEvent.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return byte_256432AA0;
}

uint64_t static ATCalendarEvent.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_256432AA0 = a1;
  return result;
}

uint64_t (*static ATCalendarEvent.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ATCalendarEvent.eventTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  swift_bridgeObjectRetain();
  return v1;
}

id ATCalendarEvent.__allocating_init(eventTitle:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ATCalendarEvent.init(eventTitle:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_super v5;

  v3 = &v2[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(_QWORD *)v3 = a1;
  *((_QWORD *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for ATCalendarEvent();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for ATCalendarEvent()
{
  return objc_opt_self();
}

id sub_236A44374@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle + 8);
  v5 = (objc_class *)type metadata accessor for ATCalendarEvent();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_bridgeObjectRetain();
  result = objc_msgSendSuper2(&v9, sel_init);
  a1[3] = v5;
  *a1 = result;
  return result;
}

void sub_236A44468(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_236A48E80();
  v3 = (id)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);

}

uint64_t ATCalendarEvent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATCalendarEvent.init(coder:)(a1);
}

uint64_t ATCalendarEvent.init(coder:)(void *a1)
{
  uint64_t v2;
  void *v3;

  sub_236A48414(0, &qword_256432AB0);
  v2 = sub_236A48F1C();
  if (v2)
  {
    v3 = (void *)v2;
    sub_236A48E8C();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_236A446D4()
{
  swift_bridgeObjectRetain();
  sub_236A48EA4();
  swift_bridgeObjectRelease();
  sub_236A48EA4();
  return 34;
}

id ATCalendarEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATCalendarEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATCalendarEvent.__deallocating_deinit()
{
  return sub_236A48044(type metadata accessor for ATCalendarEvent);
}

uint64_t static ATArrayOfCalendarEvents.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return byte_256432AA1;
}

uint64_t static ATArrayOfCalendarEvents.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_256432AA1 = a1;
  return result;
}

uint64_t (*static ATArrayOfCalendarEvents.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATArrayOfCalendarEvents.calendarEvents.getter()
{
  return swift_bridgeObjectRetain();
}

id ATArrayOfCalendarEvents.__allocating_init(calendarEvents:)(uint64_t a1)
{
  return sub_236A466E8(a1, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents);
}

id ATArrayOfCalendarEvents.init(calendarEvents:)(uint64_t a1)
{
  return sub_236A46750(a1, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents);
}

uint64_t type metadata accessor for ATArrayOfCalendarEvents()
{
  return objc_opt_self();
}

id sub_236A44998@<X0>(_QWORD *a1@<X8>)
{
  return sub_236A46820(&OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents, a1);
}

void sub_236A449C0(void *a1)
{
  sub_236A4693C(a1, (uint64_t)&OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, (void (*)(void))type metadata accessor for ATCalendarEvent);
}

id ATArrayOfCalendarEvents.__allocating_init(coder:)(void *a1)
{
  return sub_236A46ABC(a1, (void (*)(void))type metadata accessor for ATCalendarEvent, 0x7261646E656C6163, 0xEE0073746E657645, (SEL *)&selRef_initWithCalendarEvents_);
}

id ATArrayOfCalendarEvents.init(coder:)(void *a1)
{
  return sub_236A46BB0(a1, (void (*)(void))type metadata accessor for ATCalendarEvent, 0x7261646E656C6163, 0xEE0073746E657645, (SEL *)&selRef_initWithCalendarEvents_);
}

uint64_t sub_236A44AD0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256432AC0);
    sub_236A48364();
    sub_236A48E74();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    return 91;
  }
  swift_bridgeObjectRetain();
  v2 = sub_236A48F64();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  v14 = MEMORY[0x24BEE4AF8];
  result = sub_236A48348(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x23B7F9858](v4, v1);
      else
        v5 = *(id *)(v1 + 8 * v4 + 32);
      v6 = v5;
      v7 = objc_msgSend(v5, sel_description);
      v8 = sub_236A48E98();
      v10 = v9;

      v12 = *(_QWORD *)(v14 + 16);
      v11 = *(_QWORD *)(v14 + 24);
      if (v12 >= v11 >> 1)
        sub_236A48348(v11 > 1, v12 + 1, 1);
      ++v4;
      *(_QWORD *)(v14 + 16) = v12 + 1;
      v13 = v14 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void ATArrayOfCalendarEvents.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATArrayOfCalendarEvents.__deallocating_deinit()
{
  return sub_236A48044(type metadata accessor for ATArrayOfCalendarEvents);
}

uint64_t static ATPlayedMediaItem.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return byte_256432AA2;
}

uint64_t static ATPlayedMediaItem.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_256432AA2 = a1;
  return result;
}

uint64_t (*static ATPlayedMediaItem.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATPlayedMediaItem.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.artist.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.album.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.link.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.bundleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPlayedMediaItem.mediaType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  swift_bridgeObjectRetain();
  return v1;
}

double ATPlayedMediaItem.playTime.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
}

id ATPlayedMediaItem.__allocating_init(title:artist:album:link:bundleID:mediaType:playTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  objc_class *v13;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  objc_super v31;

  v22 = (char *)objc_allocWithZone(v13);
  v23 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title];
  *(_QWORD *)v23 = a1;
  *((_QWORD *)v23 + 1) = a2;
  v24 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist];
  *(_QWORD *)v24 = a3;
  *((_QWORD *)v24 + 1) = a4;
  v25 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album];
  *(_QWORD *)v25 = a5;
  *((_QWORD *)v25 + 1) = a6;
  v26 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link];
  *(_QWORD *)v26 = a7;
  *((_QWORD *)v26 + 1) = a8;
  v27 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID];
  *(_QWORD *)v27 = a10;
  *((_QWORD *)v27 + 1) = a11;
  v28 = &v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType];
  *(_QWORD *)v28 = a12;
  *((_QWORD *)v28 + 1) = a13;
  *(double *)&v22[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime] = a9;
  v31.receiver = v22;
  v31.super_class = v13;
  return objc_msgSendSuper2(&v31, sel_init);
}

id ATPlayedMediaItem.init(title:artist:album:link:bundleID:mediaType:playTime:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  objc_super v21;

  v14 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v17 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link];
  *(_QWORD *)v17 = a7;
  *((_QWORD *)v17 + 1) = a8;
  v18 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID];
  *(_QWORD *)v18 = a10;
  *((_QWORD *)v18 + 1) = a11;
  v19 = &v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType];
  *(_QWORD *)v19 = a12;
  *((_QWORD *)v19 + 1) = a13;
  *(double *)&v13[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime] = a9;
  v21.receiver = v13;
  v21.super_class = (Class)type metadata accessor for ATPlayedMediaItem();
  return objc_msgSendSuper2(&v21, sel_init);
}

id sub_236A452DC@<X0>(_QWORD *a1@<X8>)
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
  objc_class *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  id result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title + 8);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist + 8);
  v22 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist);
  v23 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album + 8);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link + 8);
  v20 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link);
  v21 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID + 8);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType + 8);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
  v11 = (objc_class *)type metadata accessor for ATPlayedMediaItem();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title];
  *(_QWORD *)v13 = v23;
  *((_QWORD *)v13 + 1) = v2;
  v14 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist];
  *(_QWORD *)v14 = v22;
  *((_QWORD *)v14 + 1) = v3;
  v15 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album];
  *(_QWORD *)v15 = v21;
  *((_QWORD *)v15 + 1) = v4;
  v16 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link];
  *(_QWORD *)v16 = v20;
  *((_QWORD *)v16 + 1) = v5;
  v17 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID];
  *(_QWORD *)v17 = v7;
  *((_QWORD *)v17 + 1) = v6;
  v18 = &v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType];
  *(_QWORD *)v18 = v8;
  *((_QWORD *)v18 + 1) = v9;
  *(_QWORD *)&v12[OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime] = v10;
  v25.receiver = v12;
  v25.super_class = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = objc_msgSendSuper2(&v25, sel_init);
  a1[3] = v11;
  *a1 = result;
  return result;
}

void sub_236A454D4(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  v3 = (void *)sub_236A48E80();
  v4 = (void *)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  v5 = (void *)sub_236A48E80();
  v6 = (void *)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  v7 = (void *)sub_236A48E80();
  v8 = (void *)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

  v9 = (void *)sub_236A48E80();
  v10 = (void *)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  v11 = (void *)sub_236A48E80();
  v12 = (void *)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  v13 = (void *)sub_236A48E80();
  v14 = (void *)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);

  v15 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
  v16 = (id)sub_236A48E80();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v16, v15);

}

uint64_t ATPlayedMediaItem.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ATPlayedMediaItem.init(coder:)(a1);
}

uint64_t ATPlayedMediaItem.init(coder:)(void *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  sub_236A48414(0, &qword_256432AB0);
  v2 = sub_236A48F1C();
  if (v2)
  {
    v3 = (void *)v2;
    v5 = 0;
    v6 = 0;
    sub_236A48E8C();

  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_236A45BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t result;
  double v7;
  BOOL v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType;
  v3 = *(uint64_t **)(v0 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  v4 = *(_QWORD *)(v2 + 8);
  v5 = v3 == (uint64_t *)1735290739 && v4 == 0xE400000000000000;
  if (v5 || (sub_236A48F94() & 1) != 0)
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_236A48F4C();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    result = sub_236A48EA4();
    v7 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(_QWORD *)&v7 & 0x7FF0000000000000) != 0)
    {
      if (v7 > -9.22337204e18)
      {
        if (v7 < 9.22337204e18)
        {
LABEL_9:
          sub_236A48F7C();
          sub_236A48EA4();
          swift_bridgeObjectRelease();
          sub_236A48EA4();
          swift_bridgeObjectRetain();
          sub_236A48EA4();
          swift_bridgeObjectRelease();
          sub_236A48EA4();
          return v14;
        }
        goto LABEL_41;
      }
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v8 = v3 == (uint64_t *)0x74736163646F70 && v4 == 0xE700000000000000;
  if (v8 || (sub_236A48F94() & 1) != 0)
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_236A48F4C();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    v3 = &v14;
    result = sub_236A48EA4();
    v9 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    if (v9 <= -9.22337204e18)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v9 < 9.22337204e18)
      goto LABEL_9;
    __break(1u);
  }
  v10 = v3 == (uint64_t *)0x6F6F626F69647561 && v4 == 0xE90000000000006BLL;
  if (v10 || (sub_236A48F94() & 1) != 0)
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_236A48F4C();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    v3 = &v14;
    result = sub_236A48EA4();
    v11 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) == 0)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    if (v11 <= -9.22337204e18)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v11 < 9.22337204e18)
      goto LABEL_9;
    __break(1u);
  }
  if (v3 == (uint64_t *)0xD000000000000010 && v4 == 0x8000000236A49B40 || (sub_236A48F94() & 1) != 0)
  {
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_236A48F4C();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    sub_236A48EA4();
    swift_bridgeObjectRetain();
    sub_236A48EA4();
    swift_bridgeObjectRelease();
    result = sub_236A48EA4();
    v12 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
    if ((~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
    {
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (v12 <= -9.22337204e18)
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v12 < 9.22337204e18)
      goto LABEL_9;
    __break(1u);
  }
  v14 = 0;
  v15 = 0xE000000000000000;
  sub_236A48F4C();
  sub_236A48EA4();
  swift_bridgeObjectRetain();
  sub_236A48EA4();
  swift_bridgeObjectRelease();
  sub_236A48EA4();
  swift_bridgeObjectRetain();
  sub_236A48EA4();
  swift_bridgeObjectRelease();
  result = sub_236A48EA4();
  v13 = *(double *)(v1 + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime);
  if ((~*(_QWORD *)&v13 & 0x7FF0000000000000) == 0)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (v13 > -9.22337204e18)
  {
    if (v13 < 9.22337204e18)
      goto LABEL_9;
    __break(1u);
    goto LABEL_39;
  }
LABEL_49:
  __break(1u);
  return result;
}

void ATPlayedMediaItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATPlayedMediaItem.__deallocating_deinit()
{
  return sub_236A48044(type metadata accessor for ATPlayedMediaItem);
}

uint64_t static ATArrayOfPlayedMediaItems.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return byte_256432AA3;
}

uint64_t static ATArrayOfPlayedMediaItems.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_256432AA3 = a1;
  return result;
}

uint64_t (*static ATArrayOfPlayedMediaItems.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t ATArrayOfPlayedMediaItems.playedMediaItems.getter()
{
  return swift_bridgeObjectRetain();
}

id ATArrayOfPlayedMediaItems.__allocating_init(playedMediaItems:)(uint64_t a1)
{
  return sub_236A466E8(a1, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems);
}

id sub_236A466E8(uint64_t a1, _QWORD *a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[*a2] = a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ATArrayOfPlayedMediaItems.init(playedMediaItems:)(uint64_t a1)
{
  return sub_236A46750(a1, &OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems);
}

id sub_236A46750(uint64_t a1, _QWORD *a2, uint64_t (*a3)(void))
{
  char *v3;
  objc_super v5;

  *(_QWORD *)&v3[*a2] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)a3();
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_236A467A4(char *a1, uint64_t a2, uint64_t a3, void (*a4)(void), _QWORD *a5, uint64_t (*a6)(void))
{
  objc_super v10;

  a4();
  *(_QWORD *)&a1[*a5] = sub_236A48EBC();
  v10.receiver = a1;
  v10.super_class = (Class)a6();
  return objc_msgSendSuper2(&v10, sel_init);
}

id sub_236A4680C@<X0>(_QWORD *a1@<X8>)
{
  return sub_236A46820(&OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, type metadata accessor for ATArrayOfPlayedMediaItems, a1);
}

id sub_236A46820@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(void)@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  id result;
  objc_super v10;

  v6 = *(_QWORD *)(v3 + *a1);
  v7 = (objc_class *)a2();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[*a1] = v6;
  v10.receiver = v8;
  v10.super_class = v7;
  swift_bridgeObjectRetain();
  result = objc_msgSendSuper2(&v10, sel_init);
  a3[3] = v7;
  *a3 = result;
  return result;
}

id sub_236A468A8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(void))
{
  uint64_t v6;
  objc_class *v7;
  char *v8;
  objc_super v10;

  v6 = *(_QWORD *)(a1 + *a4);
  v7 = (objc_class *)a5();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[*a4] = v6;
  v10.receiver = v8;
  v10.super_class = v7;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v10, sel_init);
}

void sub_236A46910(void *a1)
{
  sub_236A4693C(a1, (uint64_t)&OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems, (void (*)(void))type metadata accessor for ATPlayedMediaItem);
}

void sub_236A4693C(void *a1, uint64_t a2, void (*a3)(void))
{
  void *v4;
  id v5;

  a3();
  v4 = (void *)sub_236A48EB0();
  v5 = (id)sub_236A48E80();
  objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);

}

void sub_236A469E8(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void))
{
  id v7;
  id v8;
  void *v9;
  id v10;

  a5();
  v7 = a3;
  v8 = a1;
  v9 = (void *)sub_236A48EB0();
  v10 = (id)sub_236A48E80();
  objc_msgSend(v7, sel_encodeObject_forKey_, v9, v10);

}

id ATArrayOfPlayedMediaItems.__allocating_init(coder:)(void *a1)
{
  return sub_236A46ABC(a1, (void (*)(void))type metadata accessor for ATPlayedMediaItem, 0xD000000000000010, 0x8000000236A49BC0, (SEL *)&selRef_initWithPlayedMediaItems_);
}

id sub_236A46ABC(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4, SEL *a5)
{
  objc_class *v5;
  objc_class *v8;
  id v10;
  void *v11;
  id v12;

  v8 = v5;
  v10 = objc_allocWithZone(v8);
  a2();
  if (sub_236A48F28())
  {
    v11 = (void *)sub_236A48EB0();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, *a5, v11);

  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v12;
}

id ATArrayOfPlayedMediaItems.init(coder:)(void *a1)
{
  return sub_236A46BB0(a1, (void (*)(void))type metadata accessor for ATPlayedMediaItem, 0xD000000000000010, 0x8000000236A49BC0, (SEL *)&selRef_initWithPlayedMediaItems_);
}

id sub_236A46BB0(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v5;
  void *v7;
  void *v9;
  id v10;

  v7 = v5;
  a2();
  if (sub_236A48F28())
  {
    v9 = (void *)sub_236A48EB0();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v7, *a5, v9);

  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

id sub_236A46C94(void *a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5, uint64_t a6, SEL *a7)
{
  id v10;
  void *v11;
  id v12;

  a4();
  v10 = a3;
  if (sub_236A48F28())
  {
    v11 = (void *)sub_236A48EB0();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(a1, *a7, v11);

    return v12;
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

id sub_236A46D64(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_236A48E80();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_236A46DBC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Archetype25ATArrayOfPlayedMediaItems_playedMediaItems);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256432AC0);
    sub_236A48364();
    v14 = sub_236A48E74();
    swift_bridgeObjectRelease();
    return v14;
  }
  swift_bridgeObjectRetain();
  v2 = sub_236A48F64();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  v15 = MEMORY[0x24BEE4AF8];
  result = sub_236A48348(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x23B7F9858](v4, v1);
      else
        v5 = *(id *)(v1 + 8 * v4 + 32);
      v6 = v5;
      v7 = objc_msgSend(v5, sel_description);
      v8 = sub_236A48E98();
      v10 = v9;

      v12 = *(_QWORD *)(v15 + 16);
      v11 = *(_QWORD *)(v15 + 24);
      if (v12 >= v11 >> 1)
        sub_236A48348(v11 > 1, v12 + 1, 1);
      ++v4;
      *(_QWORD *)(v15 + 16) = v12 + 1;
      v13 = v15 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void ATArrayOfPlayedMediaItems.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ATArrayOfPlayedMediaItems.__deallocating_deinit()
{
  return sub_236A48044(type metadata accessor for ATArrayOfPlayedMediaItems);
}

id ATPersonalizationClient.init()()
{
  void *v0;
  id v1;
  char *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  objc_super v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v2 = v0;
  v3 = (void *)sub_236A48E80();
  v4 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v3, 4096);

  v5 = OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_connection;
  *(_QWORD *)&v2[OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_connection] = v4;
  v6 = (void *)objc_opt_self();
  v7 = v4;
  v8 = objc_msgSend(v6, sel_interfaceWithProtocol_, &unk_256434608);
  objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);

  v9 = *(void **)&v2[v5];
  objc_msgSend(v9, sel_resume);
  aBlock[4] = sub_236A471E0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236A43CD4;
  aBlock[3] = &block_descriptor_0;
  v10 = _Block_copy(aBlock);
  v11 = v9;
  v12 = objc_msgSend(v11, sel_remoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);

  sub_236A48F40();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256432B20);
  v13 = swift_dynamicCast();
  v14 = v17;
  if (!v13)
    v14 = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy] = v14;

  v16.receiver = v2;
  v16.super_class = (Class)type metadata accessor for ATPersonalizationClient();
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t sub_236A471E0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint8_t *v15;
  _QWORD v17[2];

  v2 = sub_236A48E68();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236A48E5C();
  v6 = a1;
  v7 = a1;
  v8 = sub_236A48E50();
  v9 = sub_236A48EF8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v17[0] = v2;
    v11 = (uint8_t *)v10;
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = a1;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    v17[1] = v14;
    sub_236A48F34();
    *v12 = v14;

    _os_log_impl(&dword_236A42000, v8, v9, "Received error from ArchetypeService: %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256432D88);
    swift_arrayDestroy();
    MEMORY[0x23B7F9B94](v12, -1, -1);
    v15 = v11;
    v2 = v17[0];
    MEMORY[0x23B7F9B94](v15, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_236A473C0(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = v1;
  *(_BYTE *)(v2 + 136) = a1;
  return swift_task_switch();
}

uint64_t sub_236A473DC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(*(_QWORD *)(v0 + 128) + OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy);
  if (!v1)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v2 = *(unsigned __int8 *)(v0 + 136);
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_236A474AC;
  v3 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v4 = (_QWORD *)(v0 + 80);
  v4[1] = 0x40000000;
  v4[2] = sub_236A47504;
  v4[3] = &block_descriptor_1;
  v4[4] = v3;
  objc_msgSend(v1, sel_freeNowWithExcludeAllDayEvents_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_236A474AC()
{
  return swift_task_switch();
}

uint64_t sub_236A474F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
}

uint64_t sub_236A47504(uint64_t a1, void *a2)
{
  return sub_236A478F8(a1, a2, &qword_256432D80);
}

uint64_t sub_236A4763C(char a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  uint64_t v7;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v6 = a3;
  v7 = swift_task_alloc();
  v3[4] = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_236A476C8;
  *(_QWORD *)(v7 + 128) = v6;
  *(_BYTE *)(v7 + 136) = a1;
  return swift_task_switch();
}

uint64_t sub_236A476C8(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v4 = *(void **)(*v1 + 16);
  v6 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_236A47740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[20] = a5;
  v6[21] = v5;
  v6[18] = a3;
  v6[19] = a4;
  v6[16] = a1;
  v6[17] = a2;
  return swift_task_switch();
}

uint64_t sub_236A47760()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(void **)(*(_QWORD *)(v0 + 168) + OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy);
  if (!v1)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v3 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 128);
  v5 = sub_236A48E80();
  *(_QWORD *)(v0 + 176) = v5;
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_236A47868;
  v6 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v7 = (_QWORD *)(v0 + 80);
  v7[1] = 0x40000000;
  v7[2] = sub_236A478EC;
  v7[3] = &block_descriptor_2;
  v7[4] = v6;
  objc_msgSend(v1, sel_topPlayedMediaWithK_start_end_mediaType_completionHandler_, v4, v3, v2, v5, v7);
  return swift_continuation_await();
}

uint64_t sub_236A47868()
{
  return swift_task_switch();
}

uint64_t sub_236A478B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_236A478EC(uint64_t a1, void *a2)
{
  return sub_236A478F8(a1, a2, &qword_256432D78);
}

uint64_t sub_236A478F8(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v8;

  v4 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 64) + 40);
  v6 = a2;
  sub_236A48C68((uint64_t)&v8, v5, a3);
  return swift_continuation_resume();
}

uint64_t sub_236A47A98(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *aBlock, void *a6)
{
  _QWORD *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;

  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  v11 = sub_236A48E98();
  v13 = v12;
  v6[4] = v12;
  v14 = a6;
  v15 = (_QWORD *)swift_task_alloc();
  v6[5] = v15;
  *v15 = v6;
  v15[1] = sub_236A47B58;
  v15[20] = v13;
  v15[21] = v14;
  v15[18] = a3;
  v15[19] = v11;
  v15[16] = a1;
  v15[17] = a2;
  return swift_task_switch();
}

uint64_t sub_236A47B58(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v4 = *(void **)(*v1 + 16);
  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_236A47BD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return swift_task_switch();
}

uint64_t sub_236A47BF4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(*(_QWORD *)(v0 + 152) + OBJC_IVAR____TtC9Archetype23ATPersonalizationClient_remoteObjectProxy);
  if (!v1)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  v2 = sub_236A48E80();
  *(_QWORD *)(v0 + 160) = v2;
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_236A47CD4;
  v3 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v4 = (_QWORD *)(v0 + 80);
  v4[1] = 0x40000000;
  v4[2] = sub_236A47D5C;
  v4[3] = &block_descriptor_3;
  v4[4] = v3;
  objc_msgSend(v1, sel_currentLocationWithEffectiveBundleIdentifier_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_236A47CD4()
{
  return swift_task_switch();
}

uint64_t sub_236A47D20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_236A47D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = sub_236A48E98();
  else
    v3 = 0;
  v5[0] = v3;
  v5[1] = a2;
  sub_236A48C68((uint64_t)v5, *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40), &qword_256432D70);
  return swift_continuation_resume();
}

uint64_t sub_236A47EE8(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_236A48E98();
  v7 = v6;
  v3[4] = v6;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc();
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_236A47F88;
  v9[18] = v7;
  v9[19] = v8;
  v9[17] = v5;
  return swift_task_switch();
}

uint64_t sub_236A47F88(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);

  v4 = *v2;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  if (a2)
  {
    v7 = (void *)sub_236A48E80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v8 = *(void (***)(_QWORD, _QWORD))(v4 + 24);
  ((void (**)(_QWORD, void *))v8)[2](v8, v7);

  _Block_release(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id ATPersonalizationClient.__deallocating_deinit()
{
  return sub_236A48044(type metadata accessor for ATPersonalizationClient);
}

id sub_236A48044(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_236A480AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_236A48E30;
  return v6();
}

uint64_t sub_236A48100(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_236A48E30;
  return v7();
}

uint64_t sub_236A48154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_236A48EE0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_236A48ED4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_236A48974(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236A48EC8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_236A48298(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_236A482FC;
  return v6(a1);
}

uint64_t sub_236A482FC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236A48348(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_236A48CAC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

unint64_t sub_236A48364()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256432AC8;
  if (!qword_256432AC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256432AC0);
    result = MEMORY[0x23B7F9B58](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_256432AC8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7F9B4C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for ATPlayedMediaItem()
{
  return objc_opt_self();
}

uint64_t sub_236A48414(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for ATArrayOfPlayedMediaItems()
{
  return objc_opt_self();
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

uint64_t type metadata accessor for ATPersonalizationClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for ATCalendarEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATCalendarEvent.__allocating_init(eventTitle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ATCalendarEvent.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of ATCalendarEvent.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ATCalendarEvent.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for ATArrayOfCalendarEvents()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATArrayOfCalendarEvents.__allocating_init(calendarEvents:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for ATPlayedMediaItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATPlayedMediaItem.__allocating_init(title:artist:album:link:bundleID:mediaType:playTime:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ATPlayedMediaItem.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ATPlayedMediaItem.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ATPlayedMediaItem.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t method lookup function for ATArrayOfPlayedMediaItems()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for ATPersonalizationClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ATPersonalizationClient.freeNow(excludeAllDayEvents:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_236A48E24;
  return v7(a1);
}

uint64_t dispatch thunk of ATPersonalizationClient.topPlayedMedia(k:start:end:mediaType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  int *v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = *(int **)((*MEMORY[0x24BEE4EA0] & *v5) + 0x68);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_236A486A8;
  return v15(a1, a2, a3, a4, a5);
}

uint64_t sub_236A486A8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of ATPersonalizationClient.currentLocation(effectiveBundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x70);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_236A48778;
  return v9(a1, a2);
}

uint64_t sub_236A48778(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_236A487D0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_236A48804()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_236A48E30;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_256432CF0 + dword_256432CF0))(v2, v3, v4);
}

uint64_t sub_236A48874()
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
  v5[1] = sub_236A48E30;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_256432D00 + dword_256432D00))(v2, v3, v4);
}

uint64_t sub_236A488F0(uint64_t a1)
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
  v7[1] = sub_236A48E30;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_256432D10 + dword_256432D10))(a1, v4, v5, v6);
}

uint64_t sub_236A48974(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256432CE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236A489B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236A489D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_236A48A48;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256432D20 + dword_256432D20))(a1, v4);
}

uint64_t sub_236A48A48()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236A48A90()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_236A48AC4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = v0[5];
  v7 = (void *)v0[6];
  v6 = (void *)v0[7];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_236A48A48;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int, void *, void *))((char *)&dword_256432D30
                                                                                 + dword_256432D30))(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_236A48B58()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_236A48B84()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v3 = *(void **)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_236A48E30;
  return ((uint64_t (*)(char, void *, void *))((char *)&dword_256432D50 + dword_256432D50))(v2, v4, v3);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t sub_236A48C68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_236A48CAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256432D90);
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
  result = sub_236A48F70();
  __break(1u);
  return result;
}

uint64_t sub_236A48E50()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_236A48E5C()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t sub_236A48E68()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_236A48E74()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_236A48E80()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_236A48E8C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_236A48E98()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_236A48EA4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236A48EB0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_236A48EBC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_236A48EC8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_236A48ED4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_236A48EE0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_236A48EEC()
{
  return MEMORY[0x24BDCFC68]();
}

uint64_t sub_236A48EF8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_236A48F04()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_236A48F10()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_236A48F1C()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_236A48F28()
{
  return MEMORY[0x24BDD0190]();
}

uint64_t sub_236A48F34()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_236A48F40()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_236A48F4C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_236A48F58()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_236A48F64()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_236A48F70()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_236A48F7C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_236A48F88()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_236A48F94()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_236A48FA0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_236A48FAC()
{
  return MEMORY[0x24BEE42C0]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

