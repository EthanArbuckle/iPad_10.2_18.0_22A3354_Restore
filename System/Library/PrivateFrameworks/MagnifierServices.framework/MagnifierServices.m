unint64_t static MAGAngelConstants.MachService.launchAngelMachName.getter()
{
  return 0xD00000000000002BLL;
}

unint64_t static MAGAngelConstants.MachService.launchAngelMachServiceID.getter()
{
  return 0xD00000000000002ELL;
}

unint64_t static MAGAngelConstants.MachService.launchAngelMachServiceDomain.getter()
{
  return 0xD000000000000026;
}

unint64_t static MAGAngelConstants.MachService.clientEntitlement.getter()
{
  return 0xD000000000000027;
}

unint64_t static MAGAngelConstants.MachService.dispatchQueueLabel.getter()
{
  return 0xD00000000000003DLL;
}

id MAGMakeServiceInterface()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v0 = (void *)sub_24118ED00();
  v1 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithIdentifier_, v0);

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_257101A08);
  objc_msgSend(v1, sel_setServer_, v3);

  v4 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_257101660);
  objc_msgSend(v1, sel_setClient_, v4);

  objc_msgSend(v1, sel_setClientMessagingExpectation_, 0);
  return v1;
}

uint64_t sub_24118D45C(uint64_t a1)
{
  return sub_24118D4D8(a1, qword_257100308);
}

uint64_t static MAGLog.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24118D568(&qword_257100300, (uint64_t)qword_257100308, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24118D4B4(uint64_t a1)
{
  return sub_24118D4D8(a1, qword_257100328);
}

uint64_t sub_24118D4D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24118ECDC();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24118ECD0();
}

uint64_t static MAGLog.service.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24118D568(&qword_257100320, (uint64_t)qword_257100328, a1);
}

uint64_t sub_24118D568@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_24118ECDC();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

ValueMetadata *type metadata accessor for MAGAngelConstants()
{
  return &type metadata for MAGAngelConstants;
}

ValueMetadata *type metadata accessor for MAGAngelConstants.MachService()
{
  return &type metadata for MAGAngelConstants.MachService;
}

ValueMetadata *type metadata accessor for MAGLog()
{
  return &type metadata for MAGLog;
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

BOOL sub_24118D640(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24118D654()
{
  sub_24118EDA8();
  sub_24118EDB4();
  return sub_24118EDC0();
}

uint64_t sub_24118D698()
{
  return sub_24118EDB4();
}

uint64_t sub_24118D6C0()
{
  sub_24118EDA8();
  sub_24118EDB4();
  return sub_24118EDC0();
}

id MAGService.__deallocating_deinit()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  void *v3;
  void *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR____TtC17MagnifierServices10MAGService__connection;
  v3 = *(void **)&v0[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
  if (v3)
  {
    objc_msgSend(v3, sel_invalidate);
    v4 = *(void **)&v0[v2];
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)&v0[v2] = 0;

  v6.receiver = v0;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

id sub_24118D7E4()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  _BYTE *v18;
  _BYTE *v19;
  _QWORD v21[6];

  v1 = OBJC_IVAR____TtC17MagnifierServices10MAGService__connection;
  v2 = *(void **)&v0[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
    v4 = v2;
    return v3;
  }
  v5 = (void *)sub_24118ED00();
  v3 = (id)sub_24118ED00();
  v6 = objc_msgSend((id)objc_opt_self(), sel_endpointForMachName_service_instance_, v5, v3, 0);

  if (!v6)
  {
    sub_24118E9F8();
    swift_allocError();
    *v18 = 0;
    swift_willThrow();
    return v3;
  }
  v7 = objc_msgSend((id)objc_opt_self(), sel_connectionWithEndpoint_, v6);
  if (!v7)
  {
    sub_24118E9F8();
    swift_allocError();
    *v19 = 1;
    swift_willThrow();

    return v3;
  }
  v3 = v7;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_24118EA60;
  *(_QWORD *)(v9 + 24) = v8;
  v21[4] = sub_24118EA78;
  v21[5] = v9;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 1107296256;
  v21[2] = sub_24118E0D8;
  v21[3] = &block_descriptor;
  v10 = _Block_copy(v21);
  v11 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_configureConnection_, v10);
  _Block_release(v10);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v10 & 1) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  v12 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = v3;
  v3 = v3;

  if (qword_257100300 != -1)
LABEL_14:
    swift_once();
  v13 = sub_24118ECDC();
  __swift_project_value_buffer(v13, (uint64_t)qword_257100308);
  v14 = sub_24118ECC4();
  v15 = sub_24118ED30();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_24118C000, v14, v15, "WIll activate connection", v16, 2u);
    MEMORY[0x24268FE18](v16, -1, -1);
  }

  objc_msgSend(v3, sel_activate);
  swift_release();

  v17 = 0;
  return v3;
}

id sub_24118DB30(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = (void *)sub_24118ED00();
  objc_msgSend(a1, sel_setName_, v4);

  v5 = objc_msgSend((id)objc_opt_self(), sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v5);

  v6 = MAGMakeServiceInterface()();
  objc_msgSend(a1, sel_setInterface_, v6);

  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  v18 = sub_24118DD7C;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  v14 = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_24118DE48;
  v17 = &block_descriptor_7;
  v8 = _Block_copy(&v14);
  objc_msgSend(a1, sel_setActivationHandler_, v8);
  _Block_release(v8);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v18 = sub_24118EAD4;
  v19 = v9;
  v14 = v7;
  v15 = 1107296256;
  v16 = sub_24118DE48;
  v17 = &block_descriptor_13;
  v10 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v10);
  _Block_release(v10);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v18 = sub_24118EADC;
  v19 = v11;
  v14 = v7;
  v15 = 1107296256;
  v16 = sub_24118DE48;
  v17 = &block_descriptor_17;
  v12 = _Block_copy(&v14);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v12);
  _Block_release(v12);
  return objc_msgSend(a1, sel_setTargetQueue_, *(_QWORD *)(a2 + OBJC_IVAR____TtC17MagnifierServices10MAGService_queue));
}

void sub_24118DD7C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_257100300 != -1)
    swift_once();
  v0 = sub_24118ECDC();
  __swift_project_value_buffer(v0, (uint64_t)qword_257100308);
  oslog = sub_24118ECC4();
  v1 = sub_24118ED30();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_24118C000, oslog, v1, "Activation handler called", v2, 2u);
    MEMORY[0x24268FE18](v2, -1, -1);
  }

}

void sub_24118DE48(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_24118DE98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a2 + 16;
  if (qword_257100300 != -1)
    swift_once();
  v3 = sub_24118ECDC();
  __swift_project_value_buffer(v3, (uint64_t)qword_257100308);
  v4 = sub_24118ECC4();
  v5 = sub_24118ED30();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24118C000, v4, v5, "Interruption handler called", v6, 2u);
    MEMORY[0x24268FE18](v6, -1, -1);
  }

  swift_beginAccess();
  v7 = MEMORY[0x24268FE54](v2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(void **)(v7 + OBJC_IVAR____TtC17MagnifierServices10MAGService__connection);
    if (v9)
    {
      v10 = v9;

      objc_msgSend(v10, sel_activate);
      v8 = v10;
    }

  }
}

void sub_24118DFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  char *v7;
  void *v8;

  v2 = a2 + 16;
  if (qword_257100300 != -1)
    swift_once();
  v3 = sub_24118ECDC();
  __swift_project_value_buffer(v3, (uint64_t)qword_257100308);
  v4 = sub_24118ECC4();
  v5 = sub_24118ED30();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24118C000, v4, v5, "Iinvalidation handler called", v6, 2u);
    MEMORY[0x24268FE18](v6, -1, -1);
  }

  swift_beginAccess();
  v7 = (char *)MEMORY[0x24268FE54](v2);
  if (v7)
  {
    v8 = *(void **)&v7[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
    *(_QWORD *)&v7[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection] = 0;

  }
}

uint64_t sub_24118E0D8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

void sub_24118E114()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _BYTE *v12;
  _OWORD v13[2];
  _BYTE v14[24];
  uint64_t v15;
  void *v16;

  v1 = sub_24118D7E4();
  if (!v0)
  {
    v2 = v1;
    v3 = (void *)sub_24118ED00();
    v4 = (void *)sub_24118ED00();
    v5 = objc_msgSend((id)objc_opt_self(), sel_attributeWithDomain_name_, v3, v4);

    v16 = &unk_257101AB8;
    v6 = (void *)swift_dynamicCastObjCProtocolUnconditional();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257100518);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_24118F0F0;
    *(_QWORD *)(v7 + 32) = v5;
    *(_QWORD *)&v13[0] = v7;
    sub_24118ED24();
    sub_24118E938(0, &qword_257100520);
    v8 = v2;
    v9 = v5;
    v10 = (void *)sub_24118ED18();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v6, sel_remoteTargetWithLaunchingAssertionAttributes_, v10);

    if (v11)
    {
      sub_24118ED60();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v13, 0, sizeof(v13));
    }
    sub_24118E970((uint64_t)v13, (uint64_t)v14);
    if (v15)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257100538);
      if ((swift_dynamicCast() & 1) != 0)
      {

        return;
      }
    }
    else
    {
      sub_24118E9B8((uint64_t)v14);
    }
    sub_24118E9F8();
    swift_allocError();
    *v12 = 2;
    swift_willThrow();

  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.buildConnection()()
{
  uint64_t v0;

  sub_24118E114();
  if (!v0)
    swift_unknownObjectRelease();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.presentDetectionUI()()
{
  sub_24118E4C4((SEL *)&selRef_presentDetectionUI);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.dismissUI()()
{
  sub_24118E4C4((SEL *)&selRef_dismissUI);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.hideUI()()
{
  sub_24118E4C4((SEL *)&selRef_hideUI);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleUI()()
{
  sub_24118E4C4((SEL *)&selRef_toggleUI);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleTextDetection()()
{
  sub_24118E4C4((SEL *)&selRef_toggleTextDetection);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleFurnitureDetection()()
{
  sub_24118E4C4((SEL *)&selRef_toggleFurnitureDetection);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.togglePeopleDetection()()
{
  sub_24118E4C4((SEL *)&selRef_togglePeopleDetection);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleDoorDetection()()
{
  sub_24118E4C4((SEL *)&selRef_toggleDoorDetection);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleImageDescriptions()()
{
  sub_24118E4C4((SEL *)&selRef_toggleImageDescriptions);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.togglePointAndSpeak()()
{
  sub_24118E4C4((SEL *)&selRef_togglePointAndSpeak);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.describeScene()()
{
  sub_24118E4C4((SEL *)&selRef_describeScene);
}

void sub_24118E4C4(SEL *a1)
{
  uint64_t v1;
  void *v3;

  sub_24118E114();
  if (!v1)
  {
    objc_msgSend(v3, *a1);
    swift_unknownObjectRelease();
  }
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.currentState()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String result;

  sub_24118E114();
  if (!v0)
  {
    v3 = objc_msgSend(v1, sel_currentState);
    swift_unknownObjectRelease();
    v4 = sub_24118ED0C();
    v6 = v5;

    v1 = (void *)v4;
    v2 = v6;
  }
  result._object = v2;
  result._countAndFlagsBits = (uint64_t)v1;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.stopSpeech()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC17MagnifierServices10MAGService__connection))
  {
    sub_24118E114();
    if (!v1)
    {
      objc_msgSend(v2, sel_stopSpeech);
      swift_unknownObjectRelease();
    }
  }
}

id MAGService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MAGService.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v7;
  uint64_t v8;
  objc_class *ObjectType;
  objc_super v10;
  uint64_t v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v1 = sub_24118ED48();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24118ED3C();
  MEMORY[0x24BDAC7A8]();
  sub_24118ECF4();
  MEMORY[0x24BDAC7A8]();
  v8 = OBJC_IVAR____TtC17MagnifierServices10MAGService_queue;
  v7 = sub_24118E938(0, &qword_257100470);
  v5 = v0;
  sub_24118ECE8();
  v11 = MEMORY[0x24BEE4AF8];
  sub_24118E7E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257100480);
  sub_24118E868();
  sub_24118ED6C();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  *(_QWORD *)&v0[v8] = sub_24118ED54();
  *(_QWORD *)&v5[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection] = 0;

  v10.receiver = v5;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

unint64_t sub_24118E7E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257100478;
  if (!qword_257100478)
  {
    v1 = sub_24118ED3C();
    result = MEMORY[0x24268FDD0](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_257100478);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24268FDB8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24118E868()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257100488;
  if (!qword_257100488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257100480);
    result = MEMORY[0x24268FDD0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257100488);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24268FDC4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for MAGService()
{
  return objc_opt_self();
}

uint64_t sub_24118E938(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24118E970(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257100528);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24118E9B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257100528);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24118E9F8()
{
  unint64_t result;

  result = qword_257100530;
  if (!qword_257100530)
  {
    result = MEMORY[0x24268FDD0](&unk_24118F1B8, &type metadata for MAGServiceError);
    atomic_store(result, (unint64_t *)&qword_257100530);
  }
  return result;
}

uint64_t sub_24118EA3C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_24118EA60(void *a1)
{
  uint64_t v1;

  return sub_24118DB30(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_24118EA68()
{
  return swift_deallocObject();
}

uint64_t sub_24118EA78()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_24118EAB0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24118EAD4(uint64_t a1)
{
  uint64_t v1;

  sub_24118DE98(a1, v1);
}

void sub_24118EADC(uint64_t a1)
{
  uint64_t v1;

  sub_24118DFC8(a1, v1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MAGServiceError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MAGServiceError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24118EBD0 + 4 * byte_24118F105[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24118EC04 + 4 * byte_24118F100[v4]))();
}

uint64_t sub_24118EC04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24118EC0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24118EC14);
  return result;
}

uint64_t sub_24118EC20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24118EC28);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24118EC2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24118EC34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24118EC40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24118EC4C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAGServiceError()
{
  return &type metadata for MAGServiceError;
}

unint64_t sub_24118EC68()
{
  unint64_t result;

  result = qword_2571005A0;
  if (!qword_2571005A0)
  {
    result = MEMORY[0x24268FDD0](&unk_24118F190, &type metadata for MAGServiceError);
    atomic_store(result, (unint64_t *)&qword_2571005A0);
  }
  return result;
}

uint64_t sub_24118ECC4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24118ECD0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24118ECDC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24118ECE8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24118ECF4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24118ED00()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24118ED0C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24118ED18()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24118ED24()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24118ED30()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24118ED3C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24118ED48()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24118ED54()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24118ED60()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24118ED6C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24118ED78()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24118ED84()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24118ED90()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24118ED9C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24118EDA8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24118EDB4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24118EDC0()
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x24BEE4C78]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

