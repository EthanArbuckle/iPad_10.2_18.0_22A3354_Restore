uint64_t CSIsVirtualMachine()
{
  if (CSIsVirtualMachine_onceToken != -1)
    dispatch_once(&CSIsVirtualMachine_onceToken, &__block_literal_global_17);
  return CSIsVirtualMachine_isVM;
}

uint64_t CSIsWatch()
{
  return 0;
}

void sub_1B50314C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B50332B8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_1B5033328(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_1B5033364@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return result;
}

uint64_t sub_1B50333A8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  return result;
}

uint64_t (*sub_1B50333E8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1B503343C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B503347C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_1B50334B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t sub_1B50334EC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 40);
  return result;
}

uint64_t sub_1B5033530(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 40) = v2;
  return result;
}

uint64_t (*sub_1B5033570())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1B50335E8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 48);
}

uint64_t sub_1B5033658(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t sub_1B5033694@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 48);
  return result;
}

uint64_t sub_1B50336D8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_QWORD *)(v3 + 48) = v2;
  return result;
}

uint64_t (*sub_1B5033718())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t CSEnhancedEndpointerModelTypeDefault.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B50337DC()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5033884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B50338D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 32);
  *a2 = *(_QWORD *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B503391C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)(v4 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B5033A08())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t _s20CoreSpeechFoundation36CSEnhancedEndpointerModelTypeDefaultCfD_0()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1B5033A6C(void *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v2 = objc_msgSend(a1, sel_toFeatureArray);
  sub_1B5034CA4();
  v3 = sub_1B50CBC6C();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v1, sel_multiArray);
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1B50CBC9C();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_12;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1B5E45AF0](i, v3);
      else
        v6 = *(id *)(v3 + 8 * i + 32);
      v7 = v6;
      v8 = objc_msgSend(objc_msgSend(v1, sel_modelType), sel_featureCount);
      swift_unknownObjectRelease();
      if (i < (uint64_t)v8)
      {
        v9 = objc_msgSend(v1, sel_multiArray);
        objc_msgSend(v9, sel_setObject_atIndexedSubscript_, v7, i);

        v7 = v9;
      }

    }
    goto LABEL_12;
  }
  __break(1u);
}

id sub_1B5033C68(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  objc_super v13;

  v4 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_modelType;
  type metadata accessor for CSEnhancedEndpointerModelTypeDefault();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1B50D6F80;
  *(_QWORD *)(v9 + 32) = 0xE700000000000000;
  *(_QWORD *)(v9 + 40) = ObjectType;
  *(_QWORD *)(v9 + 48) = 3;
  *(_QWORD *)&v4[v8] = v9;
  objc_allocWithZone(MEMORY[0x1E0C9E978]);
  v10 = v4;
  v11 = sub_1B50346A0(a1, a2);
  if (v3)
  {

    swift_unknownObjectRelease();
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v10[OBJC_IVAR____TtC20CoreSpeechFoundation38CSEnhancedEndpointerInputVectorDefault_multiArray] = v11;

    v13.receiver = v10;
    v13.super_class = ObjectType;
    return objc_msgSendSuper2(&v13, sel_init);
  }
}

uint64_t sub_1B5033E88(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *(_QWORD *)(a1 + *a4) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

id sub_1B5033EFC(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  char *v4;
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  objc_super v13;

  v4 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = OBJC_IVAR____TtC20CoreSpeechFoundation39CSEnhancedEndpointerInputVectorAcoustic_modelType;
  type metadata accessor for CSEnhancedEndpointerModelTypeAcoustic();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1B50D6F90;
  *(_QWORD *)(v9 + 32) = 0xE800000000000000;
  *(_QWORD *)(v9 + 40) = ObjectType;
  *(_QWORD *)(v9 + 48) = 4;
  *(_QWORD *)&v4[v8] = v9;
  objc_allocWithZone(MEMORY[0x1E0C9E978]);
  v10 = v4;
  v11 = sub_1B50346A0(a1, a2);
  if (v3)
  {

    swift_unknownObjectRelease();
    return (id)swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v10[OBJC_IVAR____TtC20CoreSpeechFoundation39CSEnhancedEndpointerInputVectorAcoustic_multiArray] = v11;

    v13.receiver = v10;
    v13.super_class = ObjectType;
    return objc_msgSendSuper2(&v13, sel_init);
  }
}

uint64_t sub_1B5034018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v8;

  sub_1B5034CA4();
  v8 = sub_1B50CBC6C();
  return a6(v8, a4);
}

id sub_1B50340C8(char *a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  char *v4;
  id v5;
  void *v6;

  v3 = *(void **)&a1[*a3];
  v4 = a1;
  v5 = objc_msgSend(v3, sel_modelName);
  sub_1B50CBC48();

  v6 = (void *)sub_1B50CBC3C();
  swift_bridgeObjectRelease();
  return v6;
}

id sub_1B5034188()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B50341F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED234200);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1B50D6FA0;
  type metadata accessor for CSEnhancedEndpointerModelTypeDefault();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B50D6F80;
  *(_QWORD *)(v1 + 32) = 0xE700000000000000;
  *(_QWORD *)(v1 + 40) = type metadata accessor for CSEnhancedEndpointerInputVectorDefault();
  *(_QWORD *)(v1 + 48) = 3;
  *(_QWORD *)(v0 + 32) = v1;
  type metadata accessor for CSEnhancedEndpointerModelTypeAcoustic();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1B50D6F90;
  *(_QWORD *)(v2 + 32) = 0xE800000000000000;
  *(_QWORD *)(v2 + 40) = type metadata accessor for CSEnhancedEndpointerInputVectorAcoustic();
  *(_QWORD *)(v2 + 48) = 4;
  *(_QWORD *)(v0 + 40) = v2;
  result = sub_1B50CBC78();
  qword_1ED234630 = v0;
  return result;
}

uint64_t sub_1B50342C4(unint64_t a1, uint64_t a2)
{
  return sub_1B5034788(a1, a2);
}

id CSEnhancedEndpointerInputVectorFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CSEnhancedEndpointerInputVectorFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSEnhancedEndpointerInputVectorFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CSEnhancedEndpointerInputVectorFactory.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CSEnhancedEndpointerInputVectorFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B503444C(uint64_t a1, char a2)
{
  unint64_t v3;

  if ((a2 & 1) != 0)
  {
    sub_1B50CBC84();
    swift_bridgeObjectRelease();
    sub_1B50CBCA8();
    sub_1B50CBC54();
    swift_bridgeObjectRelease();
    sub_1B50CBC54();
    sub_1B50CBC84();
    sub_1B50CBCA8();
    swift_bridgeObjectRelease();
    sub_1B50CBC54();
    sub_1B50CBCA8();
    sub_1B50CBC54();
    swift_bridgeObjectRelease();
    sub_1B50CBC54();
    v3 = 0xD000000000000020;
    swift_bridgeObjectRetain();
    sub_1B50CBC54();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1B50CBC84();
    swift_bridgeObjectRelease();
    v3 = 0xD000000000000017;
    sub_1B50CBCA8();
    sub_1B50CBC54();
    swift_bridgeObjectRelease();
    sub_1B50CBC54();
  }
  return v3;
}

unint64_t sub_1B5034688()
{
  uint64_t v0;

  return sub_1B503444C(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

id sub_1B50346A0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1B5034CA4();
  v4 = (void *)sub_1B50CBC60();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend(v2, sel_initWithShape_dataType_error_, v4, a2, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    sub_1B50CBC30();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_1B5034788(unint64_t a1, uint64_t a2)
{
  char **v2;
  char **v3;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  char **v21;
  uint64_t v22;
  id v23[2];

  v3 = v2;
  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!(a1 >> 62))
  {
    v6 = *(id *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6 == (id)2)
      goto LABEL_3;
LABEL_24:
    sub_1B5034C60();
    swift_allocError();
    *(_QWORD *)v19 = v6;
    *(_BYTE *)(v19 + 8) = 0;
    goto LABEL_25;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  v6 = (id)sub_1B50CBC9C();
  swift_bridgeObjectRelease();
  if (v6 != (id)2)
    goto LABEL_24;
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x1B5E45AF0](1, a1);
LABEL_6:
    v8 = v7;
    v6 = objc_msgSend(v7, sel_integerValue, v21);

    if (qword_1ED234410 == -1)
      goto LABEL_7;
    goto LABEL_29;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v7 = *(id *)(a1 + 40);
    goto LABEL_6;
  }
  __break(1u);
LABEL_29:
  swift_once();
LABEL_7:
  v9 = qword_1ED234630;
  v21 = v3;
  v22 = a2;
  if (!((unint64_t)qword_1ED234630 >> 62))
  {
    v10 = *(_QWORD *)((qword_1ED234630 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_9;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  v10 = sub_1B50CBC9C();
  if (!v10)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_1B5034C60();
    swift_allocError();
    *(_QWORD *)v15 = v6;
    *(_BYTE *)(v15 + 8) = 1;
LABEL_25:
    swift_willThrow();
    return a2;
  }
LABEL_9:
  a2 = 4;
  v3 = &selRef_audioStreamWithRequest_streamName_error_;
  while (1)
  {
    v11 = a2 - 4;
    if ((v9 & 0xC000000000000001) != 0)
    {
      v12 = (void *)MEMORY[0x1B5E45AF0](a2 - 4, v9);
      v13 = __OFADD__(v11, 1);
      v14 = a2 - 3;
      if (v13)
        goto LABEL_22;
    }
    else
    {
      v12 = *(void **)(v9 + 8 * a2);
      swift_unknownObjectRetain();
      v13 = __OFADD__(v11, 1);
      v14 = a2 - 3;
      if (v13)
      {
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
    }
    if (objc_msgSend(v12, sel_featureCount, v21) == v6)
      break;
    swift_unknownObjectRelease();
    ++a2;
    if (v14 == v10)
      goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_inputVector);
  swift_getObjCClassMetadata();
  v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_1B5034CA4();
  v17 = (void *)sub_1B50CBC60();
  v23[0] = 0;
  a2 = (uint64_t)objc_msgSend(v16, sel_initWithShape_dataType_error_, v17, v22, v23);

  if (a2)
  {
    v18 = v23[0];
  }
  else
  {
    a2 = (uint64_t)v23[0];
    sub_1B50CBC30();

    swift_willThrow();
  }
  swift_unknownObjectRelease();
  return a2;
}

uint64_t type metadata accessor for CSEnhancedEndpointerInputVectorFactory()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CSEnhancedEndpointerModelTypeDefault()
{
  return objc_opt_self();
}

uint64_t method lookup function for CSEnhancedEndpointerModelTypeDefault()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.featureCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.featureCount.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.featureCount.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.modelName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.modelName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.modelName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.inputVector.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.inputVector.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.inputVector.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.endpointerType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.endpointerType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CSEnhancedEndpointerModelTypeDefault.endpointerType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t type metadata accessor for CSEnhancedEndpointerModelTypeAcoustic()
{
  return objc_opt_self();
}

uint64_t method lookup function for CSEnhancedEndpointerModelTypeAcoustic()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for CSEnhancedEndpointerInputVectorDefault()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CSEnhancedEndpointerInputVectorAcoustic()
{
  return objc_opt_self();
}

uint64_t method lookup function for CSEnhancedEndpointerInputVectorFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static CSEnhancedEndpointerInputVectorFactory.inputVector(shape:dataType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for CSEndpointerType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF0F5230)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF0F5230);
  }
}

unint64_t sub_1B5034C60()
{
  unint64_t result;

  result = qword_1EF0F5238;
  if (!qword_1EF0F5238)
  {
    result = MEMORY[0x1B5E46C0C](&unk_1B50D718C, &type metadata for CSEnhancedEndpointerInputVectorError);
    atomic_store(result, (unint64_t *)&qword_1EF0F5238);
  }
  return result;
}

unint64_t sub_1B5034CA4()
{
  unint64_t result;

  result = qword_1ED2341F8;
  if (!qword_1ED2341F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED2341F8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E46C00]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CSEnhancedEndpointerInputVectorError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CSEnhancedEndpointerInputVectorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1B5034DC4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1B5034DD0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CSEnhancedEndpointerInputVectorError()
{
  return &type metadata for CSEnhancedEndpointerInputVectorError;
}

void sub_1B5035308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B5035504(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B5035654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B503582C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5035A3C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, const __CFString *a17, void *a18, const __CFString *a19, const __CFString *a20)
{
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;

  if (a2)
  {
    v21 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      (*(void (**)(void *))(*(_QWORD *)v21 + 16))(v21);
      objc_msgSend(v22, "stringWithFormat:", CFSTR("mil2Bnns compilation Failed with exception : %s"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(_QWORD *)((char *)&buf + 4) = "+[CSMil2BnnsUtils _compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:mil"
                                        "ConfigPath:compilationFramework:error:]";
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = v23;
        _os_log_impl(&dword_1B502E000, v24, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      a17 = CFSTR("reason");
      a18 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a18, &a17, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2256, v26);
      objc_claimAutoreleasedReturnValue();

      __cxa_end_catch();
    }
    else
    {
      v27 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(_QWORD *)((char *)&buf + 4) = "+[CSMil2BnnsUtils _compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:mil"
                                        "ConfigPath:compilationFramework:error:]";
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = CFSTR("mil2Bnns compilation unkown failure from EAR");
        _os_log_impl(&dword_1B502E000, v27, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&buf, 0x16u);
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      a19 = CFSTR("reason");
      a20 = CFSTR("mil2Bnns compilation unkown failure from EAR");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a20, &a19, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2256, v29);
      objc_claimAutoreleasedReturnValue();

      __cxa_end_catch();
    }
    JUMPOUT(0x1B503595CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1B5035DE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void CSModelEngineCacheLookUpHandler(const char *a1, const char *a2, char *a3, size_t a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  const char *v20;
  id v21;
  size_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _BYTE v27[24];
  const char *v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByStandardizingPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "length"))
  {
    +[CSMil2BnnsUtils readBnnsIrFromCacheMapWithMilFile:](CSMil2BnnsUtils, "readBnnsIrFromCacheMapWithMilFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByStandardizingPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    bzero(a3, a4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v11 || (objc_msgSend(v12, "fileExistsAtPath:", v11) & 1) == 0)
    {
      v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 136315394;
        *(_QWORD *)&v27[4] = "CSModelEngineCacheLookUpHandler";
        *(_WORD *)&v27[12] = 2112;
        *(_QWORD *)&v27[14] = v11;
        _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s bnnsIr cache path: %@ file does not exist", v27, 0x16u);
      }
      v15 = v9;
      if (!+[CSUtils isBridgeOS](CSUtils, "isBridgeOS"))
      {
        *(_QWORD *)v27 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v27[8] = 3221225472;
        *(_QWORD *)&v27[16] = ___ZL35sendAnalyticsEventBnnsIrFileMissingP8NSString_block_invoke;
        v28 = (const char *)&unk_1E687E280;
        v29 = v15;
        AnalyticsSendEventLazy();

      }
    }
    objc_msgSend(v11, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) != 0)
    {
      v19 = objc_retainAutorelease(v11);
      v20 = (const char *)objc_msgSend(v19, "UTF8String");
      v21 = objc_retainAutorelease(v19);
      v22 = strlen((const char *)objc_msgSend(v21, "UTF8String"));
      strncpy(a3, v20, v22);
      a3[strlen((const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"))] = 0;
      v23 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 136315650;
        *(_QWORD *)&v27[4] = "CSModelEngineCacheLookUpHandler";
        *(_WORD *)&v27[12] = 2080;
        *(_QWORD *)&v27[14] = a3;
        *(_WORD *)&v27[22] = 2080;
        v28 = a1;
        _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s Caching bnnsIr %s to mil path %s", v27, 0x20u);
      }
    }
    else
    {
      v25 = (id)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v27 = 136315394;
        *(_QWORD *)&v27[4] = "CSModelEngineCacheLookUpHandler";
        *(_WORD *)&v27[12] = 2112;
        *(_QWORD *)&v27[14] = v26;
        _os_log_impl(&dword_1B502E000, v25, OS_LOG_TYPE_DEFAULT, "%s invalid for milPath: %@", v27, 0x16u);

      }
    }

  }
  else
  {
    v24 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 136315138;
      *(_QWORD *)&v27[4] = "CSModelEngineCacheLookUpHandler";
      _os_log_impl(&dword_1B502E000, v24, OS_LOG_TYPE_DEFAULT, "%s compute Engine caching Input Mil path invalid or empty", v27, 0xCu);
    }
  }

}

void sub_1B50361CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id ___ZL35sendAnalyticsEventBnnsIrFileMissingP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MissingIrFileCount");
  v3[1] = CFSTR("MissingIrFileForMilFileName");
  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = &unk_1E68A16C0;
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B50363B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLFSystemShellSwitcherClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ClarityFoundationLibraryCore_frameworkLibrary)
  {
    ClarityFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ClarityFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLFSystemShellSwitcher");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getCLFSystemShellSwitcherClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B5038170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id AudioInjectionXPCGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1199C8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_pingpong_completion_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v52 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_pingpong_completion_, 0, 1);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_, 1, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_, 2, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v49[0] = objc_opt_class();
  v49[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_, 3, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_completion_, 2, 1);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_injectAudio_toDeviceWithUUID_withScaleFactor_completion_, 0, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_injectAudio_toDeviceWithUUID_withScaleFactor_completion_, 1, 0);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_injectAudio_toDeviceWithUUID_withScaleFactor_withNumChannels_completion_, 0, 0);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_injectAudio_toDeviceWithUUID_withScaleFactor_withNumChannels_completion_, 1, 0);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_connectDeviceWithUUID_completion_, 0, 0);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v42 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_disconnectDeviceWithUUID_completion_, 0, 0);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v41 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_primaryInputDeviceUUIDWithCompletion_, 2, 1);

  return v0;
}

uint64_t _AssistantPrefsChangedNotification(uint64_t a1, void *a2)
{
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = AFPreferencesAssistantEnabled();
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Disabled");
    if (v3)
      v5 = CFSTR("Enabled");
    v7 = 136315394;
    v8 = "_AssistantPrefsChangedNotification";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Siri Enabled = %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return objc_msgSend(a2, "_didReceiveSiriSettingChanged:", v3 != 0);
}

uint64_t __Block_byref_object_copy__293(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__294(uint64_t a1)
{

}

void sub_1B503C644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](a5);
  v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

void CSLogInitIfNeededWithSubsystemType(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CSLogInitIfNeededWithSubsystemType_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CSLogInitIfNeededWithSubsystemType_once != -1)
    dispatch_once(&CSLogInitIfNeededWithSubsystemType_once, block);
}

void CSLogInitIfNeeded()
{
  CSLogInitIfNeededWithSubsystemType(0);
}

void SSRLogInitIfNeeded()
{
  if (SSRLogInitIfNeeded_once != -1)
    dispatch_once(&SSRLogInitIfNeeded_once, &__block_literal_global_669);
  CSLogInitIfNeededWithSubsystemType(0);
}

uint64_t CSAudioPowerServiceGetXPCInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF119A28);
}

void sub_1B503DD34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B503DE6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B503DF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B503DFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B503E0D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id CSSiriUserSupportBaseURL()
{
  if (CSSiriUserSupportBaseURL_once != -1)
    dispatch_once(&CSSiriUserSupportBaseURL_once, &__block_literal_global_1128);
  return (id)CSSiriUserSupportBaseURL_sUserSupportBaseURL;
}

uint64_t CSSiriRefreshDeviceExperimentGroup()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (AFIsInternalInstall())
  {
    +[CSSiriPreferences sharedPreferences](CSSiriPreferences, "sharedPreferences");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "internalUserClassification");

    if (v1)
    {
      _sIsCarryDevice = v1 == 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.da"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("ExperimentGroup"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("walkabout")) & 1) != 0)
          v5 = 1;
        else
          v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("carry"));
      }
      else
      {
        v5 = 0;
      }
      _sIsCarryDevice = v5;

    }
  }
  return _sIsCarryDevice;
}

uint64_t CSIsCarryDevice()
{
  return _sIsCarryDevice;
}

void sub_1B5040DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5042B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5042C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1245(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1246(uint64_t a1)
{

}

void sub_1B5042E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CarKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (CarKitLibraryCore_frameworkLibrary)
    return CarKitLibraryCore_frameworkLibrary;
  CarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CarKitLibraryCore_frameworkLibrary;
  if (!CarKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void CRSessionStatusCapabilitiesUpdatedNotificationCallback()
{
  id v0;

  +[CSCarKitUtils sharedInstance](CSCarKitUtils, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleCarCapabilitiesUpdatedWithCompletion:", 0);

}

void sub_1B5044938(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5044EB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50450E0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_1B50453E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  if (v12)
    operator delete(v12);
  _Unwind_Resume(a1);
}

void std::default_delete<CSAudioZeroFilterImpl<unsigned short>>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    *(_QWORD *)(a1 + 64) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1B5E46138);
}

void std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E687D0B8, MEMORY[0x1E0DE42D0]);
}

void sub_1B5045568(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a1);
}

void sub_1B5046C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5047160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1733(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1734(uint64_t a1)
{

}

void sub_1B5051194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B5051238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)bnnsIrMappedWeight;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B5051720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

void sub_1B5051A74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B5051D10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5051FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B50521EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5052334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B50523E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B50527BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5052A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  void *v13;
  void *v14;

  if (__p)
    operator delete(__p);

  if (a12)
    operator delete(a12);

  _Unwind_Resume(a1);
}

void sub_1B5052C28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5053004(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B50534D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5053C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  void *v21;
  void *v22;
  void *v23;

  if (v21)
    operator delete(v21);
  if (__p)
    operator delete(__p);
  if (a20)
    operator delete(a20);

  _Unwind_Resume(a1);
}

void sub_1B5053E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSFMil2bnnsComputeBackend;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<char const*>::vector(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61)
      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
    v4 = 8 * a2;
    v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_1B5053FE4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B5054138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B505430C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B50547A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B5054C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2134(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2135(uint64_t a1)
{

}

id CSResourcePathInSystemDomainMaskByAppending(void *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  const char *v17;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (a2)
        {
          v10 = CFSTR("/");
          if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
          {
            CPSystemRootDirectory();
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          -[__CFString stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = v9;
        }
        objc_msgSend(v11, "stringByAppendingPathComponent:", v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

        if (v14)
        {
          v15 = v12;

          ++v5;
          v6 = v15;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v4);
    if (v5 == 1)
      goto LABEL_21;
    if (v5)
    {
      v16 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "CSResourcePathInSystemDomainMaskByAppending";
        v27 = 2112;
        v28 = v20;
        v17 = "%s More than 1 path %@ are founded in system domain mask, returning the last one as default";
LABEL_23:
        _os_log_fault_impl(&dword_1B502E000, v16, OS_LOG_TYPE_FAULT, v17, buf, 0x16u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    v6 = 0;
  }
  v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "CSResourcePathInSystemDomainMaskByAppending";
    v27 = 2112;
    v28 = v20;
    v17 = "%s Resource path %@ is not founded in system domain mask, returning nil path";
    goto LABEL_23;
  }
LABEL_21:

  return v6;
}

uint64_t CSIsIPhone()
{
  return 1;
}

uint64_t CSIsIOS()
{
  return 1;
}

uint64_t CSIsTV()
{
  return 0;
}

uint64_t CSIsXR()
{
  return 0;
}

uint64_t CSIsSimulator()
{
  return 0;
}

uint64_t CSIsEmbedded()
{
  return 1;
}

uint64_t CSIsMac()
{
  return 0;
}

uint64_t CSIsASMacWithAOP()
{
  return 0;
}

uint64_t CSIsOSX()
{
  return 0;
}

uint64_t CSHasAOP()
{
  if (CSHasAOP_onceToken != -1)
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_24);
  return CSHasAOP_hasAOP;
}

BOOL CSIsGibraltarMac()
{
  _BOOL8 result;

  result = +[CSUtils hasRemoteCoreSpeech](CSUtils, "hasRemoteCoreSpeech");
  if (result)
    return +[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic");
  return result;
}

uint64_t CSIsMacMini()
{
  return 0;
}

uint64_t CSIsTorpedo()
{
  if (CSIsTorpedo_onceToken != -1)
    dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2532);
  return CSIsTorpedo_isTorpedo;
}

uint64_t CSIsHorseman()
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

uint64_t CSIsHorsemanLiveOn()
{
  void *v0;
  void *v1;
  uint64_t v2;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    return 0;
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"));
  if (!v0)
    return 0;
  v1 = v0;
  v2 = objc_msgSend(v0, "isEqualToString:", CFSTR("walkabout"));

  return v2;
}

uint64_t CSIsHorsemanJunior()
{
  if (CSIsHorsemanJunior_onceToken != -1)
    dispatch_once(&CSIsHorsemanJunior_onceToken, &__block_literal_global_13);
  return CSIsHorsemanJunior_isHorsemanJunior;
}

uint64_t CSIsCommunalDevice()
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

uint64_t CSIsIPad()
{
  if (CSIsIPad_onceToken != -1)
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_14);
  return CSIsIPad_isIPad;
}

uint64_t CSSupportsVibrator()
{
  if (CSSupportsVibrator_onceToken != -1)
    dispatch_once(&CSSupportsVibrator_onceToken, &__block_literal_global_27);
  return CSSupportsVibrator_hasHaptic;
}

uint64_t CSSupportsUSBTypeC()
{
  if (CSSupportsUSBTypeC_onceToken != -1)
    dispatch_once(&CSSupportsUSBTypeC_onceToken, &__block_literal_global_30);
  return CSSupportsUSBTypeC_supportsUSBTypeC;
}

uint64_t CSIsBridgeOS()
{
  return 0;
}

uint64_t CSIsAppleSiliconMac()
{
  return 0;
}

uint64_t CSIsInternalBuild()
{
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  return CSIsInternalBuild_isInternal;
}

uint64_t CSUsesMirroredCensorSetting()
{
  return 0;
}

uint64_t CSUsesExplicitContentAllowedForCensorSetting()
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

BOOL CSShouldCensorSpeech()
{
  int v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  v0 = CSIsHorseman_isHorseman;
  objc_msgSend(MEMORY[0x1E0D47228], "sharedConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
    v3 = objc_msgSend(v1, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF0]) != 1;
  else
    v3 = objc_msgSend(v1, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F30]) == 1;

  return v3;
}

__CFString *CSSystemRootDirectory()
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return CFSTR("/");
  CPSystemRootDirectory();
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

double CSMachAbsoluteTimeGetTimeInterval(unint64_t a1)
{
  if (_CSMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
  return *(double *)&_CSMachAbsoluteTimeRate_rate * (double)a1 / 1000000000.0;
}

uint64_t CSMachAbsoluteTimeAddTimeInterval(uint64_t a1, double a2)
{
  if (_CSMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
  return (unint64_t)(a2 * 1000000000.0 / *(double *)&_CSMachAbsoluteTimeRate_rate) + a1;
}

uint64_t CSMachAbsoluteTimeSubtractTimeInterval(uint64_t a1, double a2)
{
  if (_CSMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
  return a1 - (unint64_t)(a2 * 1000000000.0 / *(double *)&_CSMachAbsoluteTimeRate_rate);
}

uint64_t CSMachAbsoluteTimeToMachContinuousTime(uint64_t a1)
{
  mach_get_times();
  return a1;
}

void CSSafeSetOutErrorWithNSError(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    *a1 = objc_retainAutorelease(v3);
  }
  else if (v3)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "CSSafeSetOutErrorWithNSError";
      v8 = 2114;
      v9 = v4;
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }

}

void sub_1B505F14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2790(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2791(uint64_t a1)
{

}

void sub_1B5060AF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5060BFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5060CD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5060EC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B50610C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50614BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3904(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3905(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__4107(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4108(uint64_t a1)
{

}

void NonlinearBeepCanceller::NonlinearBeepCanceller(NonlinearBeepCanceller *this)
{
  *(_DWORD *)this = 4;
  *(_OWORD *)((char *)this + 4) = xmmword_1B50D7630;
  *(_OWORD *)((char *)this + 20) = xmmword_1B50D7640;
  *(_OWORD *)((char *)this + 36) = xmmword_1B50D7650;
  *(_OWORD *)((char *)this + 52) = xmmword_1B50D7660;
  *(_QWORD *)((char *)this + 68) = 0x4000000001;
  *((_DWORD *)this + 19) = 16000;
  *(_OWORD *)((char *)this + 84) = xmmword_1B50D7670;
  *(_QWORD *)((char *)this + 108) = 0x1E3CE50800000000;
  *(_QWORD *)((char *)this + 100) = 0x3F0000003B000000;
  bzero((char *)this + 116, 0x2E4uLL);
}

{
  *(_DWORD *)this = 4;
  *(_OWORD *)((char *)this + 4) = xmmword_1B50D7630;
  *(_OWORD *)((char *)this + 20) = xmmword_1B50D7640;
  *(_OWORD *)((char *)this + 36) = xmmword_1B50D7650;
  *(_OWORD *)((char *)this + 52) = xmmword_1B50D7660;
  *(_QWORD *)((char *)this + 68) = 0x4000000001;
  *((_DWORD *)this + 19) = 16000;
  *(_OWORD *)((char *)this + 84) = xmmword_1B50D7670;
  *(_QWORD *)((char *)this + 108) = 0x1E3CE50800000000;
  *(_QWORD *)((char *)this + 100) = 0x3F0000003B000000;
  bzero((char *)this + 116, 0x2E4uLL);
}

void NonlinearBeepCanceller::nl_init(NonlinearBeepCanceller *this, int a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10, int a11, int a12, int a13, int a14, int a15, int a16, float a17, unsigned int a18)
{
  float v31;
  vDSP_Length v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  unint64_t v39;
  NonlinearBeepCanceller *v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  BOOL v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  __int128 v56;
  _QWORD *v57;
  _QWORD *v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  _QWORD *v62;
  void *v63;
  void *v64;
  uint64_t i;
  unsigned int v66;
  unsigned int j;
  uint64_t v68;
  unsigned int *v69;
  unsigned int **v70;
  unint64_t v71;
  unsigned int *v72;
  unsigned int *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unsigned int *v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  unint64_t v85;
  _QWORD *v86;
  unsigned int v87;
  char *v88;
  uint64_t *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  _DWORD *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  _DWORD *v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  int32x2_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64x2_t v114;
  uint64x2_t v115;
  uint32x4_t v116;
  _DWORD *v117;
  int8x16_t v124;
  float32x4_t v125;
  int8x16_t v126;
  float32x4_t v127;
  int8x16_t v128;
  int8x16_t v129;
  float32x4_t v130;
  float32x4_t v131;
  int8x16_t v132;
  int8x16_t v133;
  int32x4_t v134;
  int8x16_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float v138;
  float32x4_t v139;
  float v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  int16x4_t v147;
  int32x4_t v148;
  int64x2_t v149;
  float32x4_t v150;
  float64x2_t v151;
  float32x4_t v152;
  float32x4_t v153;
  float32x4_t v154;
  uint64x2_t v155;
  int8x16_t v156;
  int32x4_t v157;
  int8x16_t v158;
  int32x4_t v159;
  int8x16_t v160;
  int32x4_t v161;
  int64x2_t v162;
  unsigned int v163;
  int64x2_t v164;
  unsigned int v165;
  float32x4_t v166;
  unint64_t v168;
  float v169;
  float32x4_t v170;
  float32x4_t v171;
  float32x4_t v172;
  __int128 v173;
  uint64_t v174;
  void **v175;

  *(_DWORD *)this = a2;
  *((float *)this + 6) = __exp10f(a5 / 10.0);
  *((float *)this + 7) = a6;
  *((float *)this + 8) = a7;
  *((float *)this + 9) = a8;
  *((float *)this + 10) = __exp10f(a9 / 10.0);
  v31 = __exp10f(a17 / 10.0);
  *((_QWORD *)this + 14) = 507307272;
  *((_DWORD *)this + 13) = a11;
  *((_DWORD *)this + 14) = a12;
  *((_DWORD *)this + 15) = a13 & 0xFFFFFFFE;
  *((_DWORD *)this + 16) = a14;
  *((_DWORD *)this + 17) = a15;
  *((_DWORD *)this + 18) = a16;
  *((_DWORD *)this + 19) = a18;
  v32 = (a13 & 0xFFFFFFFE) * a16;
  *((_DWORD *)this + 21) = v32;
  *((_DWORD *)this + 22) = v32;
  *((_DWORD *)this + 23) = v32 >> 1;
  *((_DWORD *)this + 24) = (v32 >> 1) + 1;
  *((_DWORD *)this + 27) = 0;
  *((float *)this + 11) = a10;
  *((float *)this + 12) = v31;
  *((_QWORD *)this + 105) = vDSP_DFT_zrop_CreateSetup(*((vDSP_DFT_Setup *)this + 105), v32, vDSP_DFT_FORWARD);
  *((_QWORD *)this + 106) = vDSP_DFT_zrop_CreateSetup(*((vDSP_DFT_Setup *)this + 106), *((unsigned int *)this + 22), vDSP_DFT_INVERSE);
  *((float *)this + 25) = 2.0 / (float)((float)*((unsigned int *)this + 22) * (float)*((unsigned int *)this + 15));
  *((_DWORD *)this + 26) = 1056964608;
  v33 = (float)*((unsigned int *)this + 18) / (float)*((unsigned int *)this + 19);
  if (a3 <= 0.0)
  {
    *((_DWORD *)this + 1) = 0;
    *((_DWORD *)this + 5) = -1082130432;
    v36 = 0.0;
  }
  else
  {
    v34 = -v33 / a3;
    v35 = expf(v34);
    *((float *)this + 1) = v35;
    *((float *)this + 5) = -(float)(1.0 - v35);
    v36 = 0.0;
    if (v35 > 0.0)
      v36 = sqrtf(v35);
  }
  *((float *)this + 4) = v36;
  v37 = 0.0;
  if (a4 > 0.0)
  {
    v38 = -v33 / a4;
    v37 = expf(v38);
  }
  *((float *)this + 2) = v37;
  *((float *)this + 3) = 1.0 - v37;
  v39 = *((unsigned int *)this + 17);
  v165 = *((_DWORD *)this + 14);
  v163 = *((_DWORD *)this + 13);
  v173 = *(_OWORD *)((char *)this + 168);
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0;
  v174 = *((_QWORD *)this + 23);
  *((_QWORD *)this + 23) = 0;
  v175 = (void **)&v173;
  std::vector<std::vector<unsigned int>>::__destroy_vector::operator()[abi:ne180100](&v175);
  v40 = this;
  v42 = (_QWORD *)*((_QWORD *)this + 21);
  v41 = (_QWORD *)*((_QWORD *)this + 22);
  v43 = 0xAAAAAAAAAAAAAAABLL * (v41 - v42);
  v168 = v39;
  _CF = v39 >= v43;
  v45 = v39 > v43;
  v46 = v39 - v43;
  if (!v45)
  {
    if (!_CF)
    {
      v61 = &v42[3 * v168];
      if (v41 != v61)
      {
        v62 = (_QWORD *)*((_QWORD *)this + 22);
        do
        {
          v64 = (void *)*(v62 - 3);
          v62 -= 3;
          v63 = v64;
          if (v64)
          {
            *(v41 - 2) = v63;
            operator delete(v63);
          }
          v41 = v62;
        }
        while (v62 != v61);
      }
      v40 = this;
      *((_QWORD *)this + 22) = v61;
    }
    goto LABEL_37;
  }
  v47 = *((_QWORD *)this + 23);
  if (0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v41) >> 3) >= v46)
  {
    bzero(v41, 24 * ((24 * v46 - 24) / 0x18) + 24);
    v40 = this;
    *((_QWORD *)this + 22) = &v41[3 * ((24 * v46 - 24) / 0x18) + 3];
    goto LABEL_37;
  }
  v48 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (uint64_t)v42) >> 3);
  v49 = 0x5555555555555556 * ((v47 - (uint64_t)v42) >> 3);
  if (v49 <= v168)
    v49 = v168;
  if (v48 >= 0x555555555555555)
    v50 = 0xAAAAAAAAAAAAAAALL;
  else
    v50 = v49;
  if (v50 > 0xAAAAAAAAAAAAAAALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v51 = 3 * v50;
  v52 = (char *)operator new(24 * v50);
  v53 = &v52[8 * (v41 - v42)];
  v54 = &v52[8 * v51];
  bzero(v53, 24 * ((24 * v46 - 24) / 0x18) + 24);
  v55 = &v53[24 * ((24 * v46 - 24) / 0x18) + 24];
  if (v41 == v42)
  {
    v40 = this;
    *((_QWORD *)this + 21) = v53;
    *((_QWORD *)this + 22) = v55;
    *((_QWORD *)this + 23) = v54;
    if (!v41)
      goto LABEL_37;
    goto LABEL_36;
  }
  v40 = this;
  do
  {
    *((_QWORD *)v53 - 3) = 0;
    *((_QWORD *)v53 - 2) = 0;
    v53 -= 24;
    *((_QWORD *)v53 + 2) = 0;
    v56 = *(_OWORD *)(v41 - 3);
    v41 -= 3;
    *(_OWORD *)v53 = v56;
    *((_QWORD *)v53 + 2) = v41[2];
    *v41 = 0;
    v41[1] = 0;
    v41[2] = 0;
  }
  while (v41 != v42);
  v57 = (_QWORD *)*((_QWORD *)this + 21);
  v41 = (_QWORD *)*((_QWORD *)this + 22);
  *((_QWORD *)this + 21) = v53;
  *((_QWORD *)this + 22) = v55;
  *((_QWORD *)this + 23) = v54;
  if (v41 != v57)
  {
    v58 = v41;
    do
    {
      v60 = (void *)*(v58 - 3);
      v58 -= 3;
      v59 = v60;
      if (v60)
      {
        *(v41 - 2) = v59;
        operator delete(v59);
      }
      v41 = v58;
    }
    while (v58 != v57);
    v41 = v57;
    v40 = this;
  }
  if (v41)
  {
LABEL_36:
    operator delete(v41);
    v40 = this;
  }
LABEL_37:
  if ((_DWORD)v168)
  {
    for (i = 0; i != v168; ++i)
    {
      if (((v163 >> i) & 1) != 0)
        v66 = v165;
      else
        v66 = 1;
      if (v66)
      {
        for (j = 1; j <= v66; j += 2)
        {
          v68 = *((_QWORD *)v40 + 21) + 24 * i;
          v70 = (unsigned int **)(v68 + 8);
          v69 = *(unsigned int **)(v68 + 8);
          v71 = *(_QWORD *)(v68 + 16);
          if ((unint64_t)v69 >= v71)
          {
            v73 = *(unsigned int **)v68;
            v74 = ((uint64_t)v69 - *(_QWORD *)v68) >> 2;
            v75 = v74 + 1;
            if ((unint64_t)(v74 + 1) >> 62)
              goto LABEL_106;
            v76 = v71 - (_QWORD)v73;
            if (v76 >> 1 > v75)
              v75 = v76 >> 1;
            if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL)
              v77 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v77 = v75;
            if (v77)
            {
              v77 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v77);
              v69 = *v70;
              v73 = *(unsigned int **)v68;
            }
            else
            {
              v78 = 0;
            }
            v79 = (unsigned int *)(v77 + 4 * v74);
            *v79 = j;
            v72 = v79 + 1;
            while (v69 != v73)
            {
              v80 = *--v69;
              *--v79 = v80;
            }
            *(_QWORD *)v68 = v79;
            *v70 = v72;
            *(_QWORD *)(v68 + 16) = v77 + 4 * v78;
            if (v73)
              operator delete(v73);
            v40 = this;
          }
          else
          {
            *v69 = j;
            v72 = v69 + 1;
          }
          *v70 = v72;
        }
      }
    }
  }
  *((_DWORD *)v40 + 20) = 0;
  v82 = *((_QWORD *)v40 + 21);
  v81 = *((_QWORD *)v40 + 22);
  v83 = v81 - v82;
  if (v81 != v82)
  {
    v84 = 0;
    v85 = 0xAAAAAAAAAAAAAAABLL * (v83 >> 3);
    v86 = (_QWORD *)(v82 + 8);
    v87 = 1;
    do
    {
      v84 += (*v86 - *(v86 - 1)) >> 2;
      v86 += 3;
      v45 = v85 > v87++;
    }
    while (v45);
    *((_DWORD *)v40 + 20) = v84;
  }
  v89 = (uint64_t *)((char *)v40 + 192);
  v88 = (char *)*((_QWORD *)v40 + 24);
  v90 = *(unsigned int *)v40;
  v91 = *((_QWORD *)v40 + 26);
  if (v90 > (v91 - (uint64_t)v88) >> 2)
  {
    if (v88)
    {
      *((_QWORD *)this + 25) = v88;
      operator delete(v88);
      v91 = 0;
      *v89 = 0;
      v89[1] = 0;
      v89[2] = 0;
    }
    v92 = v91 >> 1;
    if (v91 >> 1 <= v90)
      v92 = v90;
    if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFFCLL)
      v93 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v93 = v92;
    if (v93 >> 62)
LABEL_106:
      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
    v94 = std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v93);
    *((_QWORD *)this + 24) = v94;
    *((_QWORD *)this + 26) = &v94[v95];
    v96 = (char *)&v94[v90];
    v97 = 4 * v90;
    do
    {
      *v94++ = 0;
      v97 -= 4;
    }
    while (v97);
    goto LABEL_90;
  }
  v98 = (char *)*((_QWORD *)v40 + 25);
  v99 = (v98 - v88) >> 2;
  if (v99 >= v90)
    v100 = *(unsigned int *)v40;
  else
    v100 = (v98 - v88) >> 2;
  if (v100)
  {
    v101 = (_DWORD *)*((_QWORD *)v40 + 24);
    do
    {
      *v101++ = 0;
      --v100;
    }
    while (v100);
  }
  if (v90 <= v99)
  {
    v96 = &v88[4 * v90];
LABEL_90:
    *((_QWORD *)this + 25) = v96;
    goto LABEL_91;
  }
  v102 = &v98[4 * (v90 - v99)];
  v103 = 4 * v90 - 4 * v99;
  do
  {
    *(_DWORD *)v98 = 0;
    v98 += 4;
    v103 -= 4;
  }
  while (v103);
  *((_QWORD *)this + 25) = v102;
LABEL_91:
  v104 = *((unsigned int *)this + 20);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 27, v104, &v173);
  v105 = *((unsigned int *)this + 22);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 30, v105, &v173);
  v106 = *((unsigned int *)this + 22);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 33, v106, &v173);
  v107 = *((unsigned int *)this + 22);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 36, v107, &v173);
  v108 = *((unsigned int *)this + 16);
  LODWORD(v173) = 0;
  std::vector<float>::assign((char **)this + 39, v108, &v173);
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 42, *((_DWORD *)this + 20), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 45, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 48, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 51, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 54, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 57, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 60, *((_DWORD *)this + 20), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 63, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 66, *((_DWORD *)this + 16), *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 69, *((_DWORD *)this + 16), *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 72, *((_DWORD *)this + 16), *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 102, *((_DWORD *)this + 16), *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)this + 600, *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)this + 624, *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24));
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 81, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 84, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), *((float *)this + 12));
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 87, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 90, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), *((float *)this + 12));
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 93, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 96, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)this + 99, *((_DWORD *)this + 16), *((_DWORD *)this + 20), *(_DWORD *)this, *((_DWORD *)this + 24), 0.0);
  if (*(_DWORD *)this != 1)
  {
    v110 = 0;
    v111 = *v89;
    do
    {
      *(_DWORD *)(v111 + 4 * v110) = v110 + 1;
      ++v110;
    }
    while (v110 < (*(_DWORD *)this - 1));
  }
  v112 = *((unsigned int *)this + 22);
  if ((_DWORD)v112)
  {
    *(float *)v109.i32 = (float)v112;
    v154 = (float32x4_t)vdupq_lane_s32(v109, 0);
    v155 = (uint64x2_t)vdupq_n_s64(v112 - 1);
    v113 = (v112 + 3) & 0x1FFFFFFFCLL;
    v114 = (uint64x2_t)xmmword_1B50D7680;
    v115 = (uint64x2_t)xmmword_1B50D7690;
    v116 = (uint32x4_t)xmmword_1B50D76A0;
    v117 = (_DWORD *)(*((_QWORD *)this + 30) + 8);
    __asm
    {
      FMOV            V4.4S, #4.0
      FMOV            V1.4S, #1.0
    }
    v166 = _Q1;
    __asm { FMOV            V1.4S, #3.0 }
    v152 = _Q1;
    v153 = _Q4;
    v150 = (float32x4_t)vdupq_n_s32(0x3FC90FDBu);
    v151 = (float64x2_t)vdupq_n_s64(0x3FF459A5D6E6692DuLL);
    v149 = vdupq_n_s64(4uLL);
    do
    {
      v162 = (int64x2_t)v115;
      v164 = (int64x2_t)v114;
      v124 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_u64(v155, v115), (int32x4_t)vcgeq_u64(v155, v114));
      v161 = (int32x4_t)v116;
      v125 = vdivq_f32(vmulq_f32(vcvtq_f32_u32(v116), v153), v154);
      v126 = (int8x16_t)vcgtq_f32(v166, v125);
      v127.i64[0] = 0x4000000040000000;
      v127.i64[1] = 0x4000000040000000;
      v128 = (int8x16_t)vcgtq_f32(v127, v125);
      v129 = (int8x16_t)vcgtq_f32(v152, v125);
      v130 = vsubq_f32(v127, v125);
      v131.i64[0] = 0xC0000000C0000000;
      v131.i64[1] = 0xC0000000C0000000;
      v132 = vandq_s8(v124, v126);
      v133 = vbicq_s8(v124, v126);
      v134 = (int32x4_t)vandq_s8(v133, v128);
      v135 = vbicq_s8(v133, v128);
      v159 = (int32x4_t)vandq_s8(v135, v129);
      v160 = v132;
      v157 = (int32x4_t)vbicq_s8(v135, v129);
      v158 = (int8x16_t)v134;
      v136 = (float32x4_t)vbslq_s8((int8x16_t)v157, (int8x16_t)vaddq_f32(v130, v127), vbslq_s8((int8x16_t)v159, (int8x16_t)vaddq_f32(v125, v131), vbslq_s8((int8x16_t)v134, (int8x16_t)v130, (int8x16_t)v125)));
      v156 = (int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vorn_s8((int8x8_t)vmovn_s32(v157), vorr_s8((int8x8_t)vmovn_s32(v159), (int8x8_t)vmovn_s32(v134)))), 0x1FuLL));
      v172 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v136.f32), v151)), vmulq_f64(vcvt_hight_f64_f32(v136), v151)), v150);
      v169 = cosf(v172.f32[1]);
      v137.f32[0] = cosf(v172.f32[0]);
      v137.f32[1] = v169;
      v170 = v137;
      v138 = cosf(v172.f32[2]);
      v139 = v170;
      v139.f32[2] = v138;
      v171 = v139;
      v140 = cosf(v172.f32[3]);
      v141 = v171;
      v141.f32[3] = v140;
      v142.i64[0] = 0x3F0000003F000000;
      v142.i64[1] = 0x3F0000003F000000;
      v143.i64[0] = 0xBF000000BF000000;
      v143.i64[1] = 0xBF000000BF000000;
      v144 = vmlaq_f32(v142, v143, v141);
      v145 = vmulq_f32(v144, v144);
      v146 = vsqrtq_f32((float32x4_t)vbslq_s8(v156, (int8x16_t)v145, (int8x16_t)vsubq_f32(v166, v145)));
      v147 = vmovn_s32((int32x4_t)vorrq_s8(vorrq_s8((int8x16_t)v157, vorrq_s8(v160, v158)), (int8x16_t)v159));
      if ((v147.i8[0] & 1) != 0)
        *(v117 - 2) = v146.i32[0];
      if ((v147.i8[2] & 1) != 0)
        *(v117 - 1) = v146.i32[1];
      if ((v147.i8[4] & 1) != 0)
        *v117 = v146.i32[2];
      if ((v147.i8[6] & 1) != 0)
        v117[1] = v146.i32[3];
      v114 = (uint64x2_t)vaddq_s64(v164, v149);
      v115 = (uint64x2_t)vaddq_s64(v162, v149);
      v148.i64[0] = 0x400000004;
      v148.i64[1] = 0x400000004;
      v116 = (uint32x4_t)vaddq_s32(v161, v148);
      v117 += 4;
      v113 -= 4;
    }
    while (v113);
  }
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    v13 = a1[1];
    v14 = (v13 - result) >> 2;
    if (v14 >= a2)
      v15 = a2;
    else
      v15 = (v13 - result) >> 2;
    if (v15)
    {
      v16 = result;
      do
      {
        *(_DWORD *)v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      v17 = &v13[4 * (a2 - v14)];
      v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    v8 = v6 >> 1;
    if (v6 >> 1 <= a2)
      v8 = a2;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    v10 = a1[1];
    v11 = &v10[4 * a2];
    v12 = 4 * a2;
    do
    {
      *(_DWORD *)v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v23;
  int v24;

  v24 = 0;
  v5 = a2;
  std::vector<float>::vector(&__p, a3, &v24);
  v6 = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= a2)
  {
    v12 = (a1[1] - (uint64_t)v6) / 24;
    if (v12 >= v5)
      v13 = v5;
    else
      v13 = (a1[1] - (uint64_t)v6) / 24;
    for (; v13; --v13)
    {
      if (v6 != (char *)&__p)
        std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v6, (char *)__p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 2);
      v6 += 24;
    }
    if (v5 <= v12)
    {
      v17 = a1[1];
      v18 = *a1 + 24 * v5;
      if (v17 != v18)
      {
        v19 = a1[1];
        do
        {
          v21 = *(void **)(v19 - 24);
          v19 -= 24;
          v20 = v21;
          if (v21)
          {
            *(_QWORD *)(v17 - 16) = v20;
            operator delete(v20);
          }
          v17 = v19;
        }
        while (v19 != v18);
      }
      a1[1] = v18;
    }
    else
    {
      v14 = (_QWORD *)a1[1];
      v15 = &v14[3 * (v5 - v12)];
      v16 = 24 * v5 - 24 * v12;
      do
      {
        *v14 = 0;
        v14[1] = 0;
        v14[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v14, __p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 2);
        v14 += 3;
        v16 -= 24;
      }
      while (v16);
      a1[1] = (uint64_t)v15;
    }
  }
  else
  {
    std::vector<std::vector<float>>::__vdeallocate(a1);
    v7 = 0x5555555555555556 * ((a1[2] - *a1) >> 3);
    if (v7 <= v5)
      v7 = v5;
    if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= 0x555555555555555)
      v8 = 0xAAAAAAAAAAAAAAALL;
    else
      v8 = v7;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](a1, v8);
    v9 = (_QWORD *)a1[1];
    v10 = &v9[3 * v5];
    v11 = 24 * v5;
    do
    {
      *v9 = 0;
      v9[1] = 0;
      v9[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v9, __p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 2);
      v9 += 3;
      v11 -= 24;
    }
    while (v11);
    a1[1] = (uint64_t)v10;
  }
  if (__p)
  {
    v23 = __p;
    operator delete(__p);
  }
}

void sub_1B506C9E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unint64_t v6;
  unint64_t v7;
  void **v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  void *__p[3];
  uint64_t v22;
  uint64_t v23;
  int v24;
  void **v25;

  v24 = 0;
  v6 = a3;
  std::vector<float>::vector(__p, a4, &v24);
  std::vector<std::vector<float>>::vector(&v22, v6, (uint64_t)__p);
  v7 = a2;
  v8 = *(void ***)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= a2)
  {
    v14 = (*(_QWORD *)(a1 + 8) - (_QWORD)v8) / 24;
    if (v14 >= v7)
      v15 = v7;
    else
      v15 = (*(_QWORD *)(a1 + 8) - (_QWORD)v8) / 24;
    for (; v15; --v15)
    {
      if (v8 != (void **)&v22)
        std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>((uint64_t)v8, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
      v8 += 3;
    }
    if (v7 <= v14)
    {
      v19 = *(void ***)(a1 + 8);
      v20 = *(_QWORD *)a1 + 24 * v7;
      while (v19 != (void **)v20)
      {
        v19 -= 3;
        v25 = v19;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v25);
      }
      *(_QWORD *)(a1 + 8) = v20;
    }
    else
    {
      v16 = *(_QWORD **)(a1 + 8);
      v17 = &v16[3 * (v7 - v14)];
      v18 = 24 * v7 - 24 * v14;
      do
      {
        *v16 = 0;
        v16[1] = 0;
        v16[2] = 0;
        std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v16, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
        v16 += 3;
        v18 -= 24;
      }
      while (v18);
      *(_QWORD *)(a1 + 8) = v17;
    }
  }
  else
  {
    std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)a1);
    v9 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v9 <= a2)
      v9 = a2;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((_QWORD *)a1, v10);
    v11 = *(_QWORD **)(a1 + 8);
    v12 = &v11[3 * a2];
    v13 = 24 * v7;
    do
    {
      *v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v11, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
      v11 += 3;
      v13 -= 24;
    }
    while (v13);
    *(_QWORD *)(a1 + 8) = v12;
  }
  v25 = (void **)&v22;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v25);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1B506CC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16)
{
  a16 = &a12;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_vector_init(_QWORD *a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, float a6)
{
  unint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  void **v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  void **v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  void *__p[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  float v48;
  void **v49;
  char v50;

  v48 = a6;
  v9 = a4;
  std::vector<float>::vector(__p, a5, &v48);
  std::vector<std::vector<float>>::vector(&v43, v9, (uint64_t)__p);
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v49 = (void **)&v45;
  v50 = 0;
  if (a3)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](&v45, a3);
    v10 = v46;
    v11 = &v46[3 * a3];
    v12 = 24 * a3;
    do
    {
      *v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v10, v43, v44, 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 3));
      v10 += 3;
      v12 -= 24;
    }
    while (v12);
    v46 = v11;
  }
  v13 = a2;
  v14 = a1[2];
  v15 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a1) >> 3) >= v13)
  {
    v40 = (a1[1] - v15) / 24;
    v41 = a1;
    if (v40 >= v13)
      v24 = v13;
    else
      v24 = (a1[1] - v15) / 24;
    if (!v24)
    {
LABEL_41:
      if (v13 <= v40)
      {
        v38 = (void **)v41[1];
        v39 = *v41 + 24 * v13;
        while (v38 != (void **)v39)
        {
          v38 -= 3;
          v49 = v38;
          std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
        }
        v41[1] = v39;
      }
      else
      {
        v35 = (_QWORD *)v41[1];
        v36 = &v35[3 * (v13 - v40)];
        v37 = 24 * v13 - 24 * v40;
        do
        {
          *v35 = 0;
          v35[1] = 0;
          v35[2] = 0;
          std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v35, v45, v46, 0xAAAAAAAAAAAAAAABLL * (v46 - v45));
          v35 += 3;
          v37 -= 24;
        }
        while (v37);
        v41[1] = v36;
      }
      goto LABEL_49;
    }
    while (1)
    {
      if ((uint64_t **)v15 != &v45)
      {
        v26 = v45;
        v25 = v46;
        v27 = 0xAAAAAAAAAAAAAAABLL * (v46 - v45);
        v28 = *(void ***)v15;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)v15) >> 3) >= v27)
        {
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v15 + 8) - (_QWORD)v28) >> 3) >= v27)
          {
            v33 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(v45, v46, (uint64_t)v28);
            v34 = *(void ***)(v15 + 8);
            while (v34 != (void **)v33)
            {
              v34 -= 3;
              v49 = v34;
              std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v49);
            }
            *(_QWORD *)(v15 + 8) = v33;
            goto LABEL_40;
          }
          v32 = &v45[(uint64_t)(*(_QWORD *)(v15 + 8) - (_QWORD)v28) >> 3];
          std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(v45, v32, (uint64_t)v28);
          v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v15 + 16, v32, v25, *(_QWORD **)(v15 + 8));
        }
        else
        {
          std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)v15);
          if (v27 > 0xAAAAAAAAAAAAAAALL)
            std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
          v29 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)v15) >> 3);
          if (v29 <= v27)
            v29 = v27;
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)v15) >> 3) >= 0x555555555555555)
            v30 = 0xAAAAAAAAAAAAAAALL;
          else
            v30 = v29;
          std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((_QWORD *)v15, v30);
          v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v15 + 16, v26, v25, *(_QWORD **)(v15 + 8));
        }
        *(_QWORD *)(v15 + 8) = v31;
      }
LABEL_40:
      v15 += 24;
      if (!--v24)
        goto LABEL_41;
    }
  }
  if (v15)
  {
    v16 = (void **)a1[1];
    v17 = (void *)*a1;
    if (v16 != (void **)v15)
    {
      do
      {
        v16 -= 3;
        v49 = v16;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
      }
      while (v16 != (void **)v15);
      v17 = (void *)*a1;
    }
    a1[1] = v15;
    operator delete(v17);
    v14 = 0;
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  v18 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
  v19 = 2 * v18;
  if (2 * v18 <= v13)
    v19 = v13;
  if (v18 >= 0x555555555555555)
    v20 = 0xAAAAAAAAAAAAAAALL;
  else
    v20 = v19;
  if (v20 > 0xAAAAAAAAAAAAAAALL)
    std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
  v21 = operator new(24 * v20);
  *a1 = v21;
  a1[1] = v21;
  a1[2] = &v21[3 * v20];
  v22 = &v21[3 * v13];
  v23 = 24 * v13;
  do
  {
    *v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v21, v45, v46, 0xAAAAAAAAAAAAAAABLL * (v46 - v45));
    v21 += 3;
    v23 -= 24;
  }
  while (v23);
  a1[1] = v22;
LABEL_49:
  v49 = (void **)&v45;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
  v49 = (void **)&v43;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v49);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1B506D0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21)
{
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  a21 = &a14;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1B506D1A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::vector<float>>::vector(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = 3 * a2;
    v8 = &v6[3 * a2];
    v9 = 8 * v7;
    do
    {
      *v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v6, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1B506D258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(_QWORD *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1B506D3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  char *result;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
  v3 = 3 * a2;
  result = (char *)operator new(24 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v3];
  return result;
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t *v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v4, *v6, v6[1], 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3));
      v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1B506D504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1B506D57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  void **v3;
  void **v4;
  void **v5;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(void ****)(a1 + 16);
    v4 = **(void ****)(a1 + 8);
    while (v3 != v4)
    {
      v3 -= 3;
      v5 = v3;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
    }
  }
  return a1;
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 2);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1B506D698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B506D708(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (!*(_BYTE *)(a1 + 24))
  {
    v2 = **(_QWORD **)(a1 + 16);
    v3 = **(_QWORD **)(a1 + 8);
    if (v2 != v3)
    {
      v4 = **(_QWORD **)(a1 + 16);
      do
      {
        v6 = *(void **)(v4 - 24);
        v4 -= 24;
        v5 = v6;
        if (v6)
        {
          *(_QWORD *)(v2 - 16) = v5;
          operator delete(v5);
        }
        v2 = v4;
      }
      while (v4 != v3);
    }
  }
  return a1;
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v5;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if (v5 != (uint64_t *)a3)
        std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(a3, *v5, v5[1], 0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 3));
      v5 += 3;
      a3 += 24;
    }
    while (v5 != a2);
  }
  return a3;
}

void std::vector<std::vector<std::vector<float>>>::__vdeallocate(void ***a1)
{
  void **v1;
  void **v3;
  void **v4;
  void **v5;

  v1 = *a1;
  if (*a1)
  {
    v3 = a1[1];
    v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 3;
        v5 = v3;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
      }
      while (v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;

  v8 = a1 + 16;
  v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    std::vector<std::vector<float>>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
    v10 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v10 <= a4)
      v10 = a4;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v8, a2, a3, *(_QWORD **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3) < a4)
  {
    v13 = a2 + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(a2, v13, v9);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v8, v13, a3, *(_QWORD **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  v14 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(a2, a3, v9);
  v15 = *(char **)(a1 + 8);
  if (v15 != v14)
  {
    v16 = *(char **)(a1 + 8);
    do
    {
      v18 = (void *)*((_QWORD *)v16 - 3);
      v16 -= 24;
      v17 = v18;
      if (v18)
      {
        *((_QWORD *)v15 - 2) = v17;
        operator delete(v17);
      }
      v15 = v16;
    }
    while (v16 != v14);
  }
  *(_QWORD *)(a1 + 8) = v14;
}

void sub_1B506DA3C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1B506DA44(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v5;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if ((char *)v5 != a3)
        std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(a3, *(char **)v5, *(_QWORD *)(v5 + 8), (uint64_t)(*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) >> 2);
      v5 += 24;
      a3 += 24;
    }
    while (v5 != a2);
  }
  return a3;
}

void std::vector<std::vector<float>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

void std::vector<std::vector<unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (char *)v1[1];
      do
      {
        v8 = (void *)*((_QWORD *)v6 - 3);
        v6 -= 24;
        v7 = v8;
        if (v8)
        {
          *((_QWORD *)v4 - 2) = v7;
          operator delete(v7);
        }
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t NonlinearBeepCanceller::nl_proc(NonlinearBeepCanceller *this, const AudioBufferList *a2, const AudioBufferList *a3, AudioBufferList *a4, AudioBufferList *a5, AudioBufferList *a6, AudioBufferList *a7)
{
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  vDSP_Length v18;
  float *v19;
  float *v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  float v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int64_t v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  __int128 v55;
  void *v56;
  __int128 v57;
  char *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  void *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  int64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  __int128 v103;
  char *v104;
  uint64_t v105;
  float *v106;
  float *v107;
  float *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  float *v116;
  uint64_t v117;
  uint64_t v118;
  float *v119;
  float *v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  char *v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  unint64_t v142;
  void **v143;
  void *v144;
  unint64_t v145;
  unint64_t i;
  unint64_t v147;
  uint64_t v148;
  float *v149;
  float *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  float *v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  float *v159;
  float *v160;
  float *v161;
  float *v162;
  float *v163;
  uint64_t v164;
  float v165;
  unsigned int v166;
  uint64_t v167;
  float v168;
  int v169;
  unint64_t v170;
  uint64_t v171;
  float *v172;
  unint64_t v173;
  uint64_t v174;
  float *v175;
  float *v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  int v182;
  uint64_t v183;
  uint64_t v184;
  float *v185;
  float *v186;
  _QWORD *v187;
  float *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  float *v194;
  float *v195;
  float *v196;
  float *v197;
  float *v198;
  float *v199;
  float *v200;
  float *v201;
  float *v202;
  float *v203;
  uint64_t v204;
  unint64_t v205;
  uint64_t v206;
  unint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  unsigned int v211;
  float *v212;
  float *v213;
  uint64_t v214;
  uint64_t v215;
  float *v216;
  float *v217;
  float *v218;
  float *v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  void **v223;
  void **v224;
  void **v225;
  const float *v226;
  void *v227;
  uint64_t v228;
  int v229;
  int v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  int v234;
  uint64_t v235;
  unint64_t v236;
  void **v237;
  void **v238;
  void **v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  float *v244;
  uint64_t v245;
  int v246;
  int v247;
  uint64_t v248;
  uint64_t v249;
  int v250;
  int v251;
  const AudioBufferList *v253;
  uint64_t v259;
  void *v260;
  void **p_mData;
  uint64_t v262;
  uint64_t v263;
  __int128 v264;
  __int128 v265;
  unsigned int v266;
  uint64_t v267;
  const float *__src;
  unsigned int v269;
  uint64_t v270;
  float **v271;
  int v272[2];
  int v273[2];
  float *v274[2];
  unint64_t v275;
  void *v276;
  float v277;
  uint64_t __C;
  DSPSplitComplex v279;
  DSPSplitComplex __B;
  DSPSplitComplex v281;
  DSPSplitComplex __D;
  DSPSplitComplex v283;
  DSPSplitComplex __A;

  v9 = *((_QWORD *)this + 20);
  if (v9)
  {
    v10 = *((_QWORD *)this + 19);
    do
    {
      --v9;
      *((_QWORD *)this + 19) = ++v10;
      *((_QWORD *)this + 20) = v9;
      if (v10 >= 0x800)
      {
        operator delete(**((void ***)this + 16));
        *((_QWORD *)this + 16) += 8;
        v9 = *((_QWORD *)this + 20);
        v10 = *((_QWORD *)this + 19) - 1024;
        *((_QWORD *)this + 19) = v10;
      }
    }
    while (v9);
  }
  __C = 0;
  v277 = 0.0;
  if (*((_DWORD *)this + 17))
  {
    v253 = a2;
    v11 = 0;
    v12 = 0;
    v271 = (float **)((char *)this + 288);
    while (1)
    {
      __src = (const float *)a3->mBuffers[v12].mData;
      vDSP_vmul(__src, 1, __src, 1, *((float **)this + 33), 1, *((unsigned int *)this + 18));
      if (*(_QWORD *)(*((_QWORD *)this + 21) + 24 * v12 + 8) != *(_QWORD *)(*((_QWORD *)this + 21) + 24 * v12))
        break;
LABEL_118:
      if (++v12 >= (unint64_t)*((unsigned int *)this + 17))
      {
        v270 = *((unsigned int *)this + 40);
        a2 = v253;
        goto LABEL_121;
      }
    }
    v13 = 0;
    v14 = 0;
    p_mData = &a6->mBuffers[v12].mData;
    v262 = v12;
    while (1)
    {
      v15 = *(char **)(*((_QWORD *)this + 42) + 24 * v11);
      memmove(v15, &v15[4 * *((unsigned int *)this + 18)], 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18)));
      memcpy((void *)(*(_QWORD *)(*((_QWORD *)this + 42) + 24 * v11)+ 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18))), __src, 4 * *((unsigned int *)this + 18));
      v16 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)this + 21) + 24 * v12) + 4 * v13);
      if (v16 >= 2)
      {
        v17 = v16 >> 1;
        do
        {
          v18 = *((unsigned int *)this + 18);
          v19 = (float *)(*(_QWORD *)(*((_QWORD *)this + 42) + 24 * v11)
                        + 4 * (*((_DWORD *)this + 22) - v18));
          vDSP_vmul(v19, 1, *((const float **)this + 33), 1, v19, 1, v18);
          --v17;
        }
        while (v17);
      }
      NonlinearBeepCanceller::fcn_wola_analysis(*((const vDSP_DFT_SetupStruct **)this + 105), *(const float **)(*((_QWORD *)this + 42) + 24 * v11), *((const float **)this + 30), v271, *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27)), *((unsigned int *)this + 22), *((_DWORD *)this + 23), *((float *)this + 26));
      v20 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27));
      v21 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v11) + 24 * *((unsigned int *)this + 27));
      v22 = *((unsigned int *)this + 23);
      __A.realp = v20 + 1;
      __A.imagp = &v20[(v22 + 1)];
      vDSP_zvmags(&__A, 1, v21 + 1, 1, (v22 - 1));
      *v21 = *v20 * *v20;
      v21[v22] = v20[v22] * v20[v22];
      v23 = *((_QWORD *)this + 27);
      *(_DWORD *)(v23 + 4 * v11) = 0;
      LODWORD(v24) = *(_DWORD *)this;
      if (*(_DWORD *)this)
      {
        v25 = 0;
        v26 = 0;
        do
        {
          vDSP_meanv(*(const float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v11) + v25), 1, (float *)&__C + 1, *((unsigned int *)this + 24));
          v23 = *((_QWORD *)this + 27);
          v27 = *(float *)(v23 + 4 * v11) + *((float *)&__C + 1);
          *(float *)(v23 + 4 * v11) = v27;
          ++v26;
          v24 = *(unsigned int *)this;
          v25 += 24;
        }
        while (v26 < v24);
      }
      else
      {
        v27 = 0.0;
      }
      v28 = *((float *)this + 28) + (float)(v27 / (float)(*((_DWORD *)this + 22) * v24));
      *(float *)(v23 + 4 * v11) = v28;
      if ((float)(log10f(v28) * 10.0) <= *((float *)this + 11))
        goto LABEL_105;
      v29 = (char *)*((_QWORD *)this + 17);
      v30 = (char *)*((_QWORD *)this + 16);
      v31 = v29 - v30;
      v32 = v29 == v30 ? 0 : ((v29 - v30) << 7) - 1;
      v34 = *((_QWORD *)this + 19);
      v33 = *((_QWORD *)this + 20);
      v35 = v33 + v34;
      if (v32 == v33 + v34)
        break;
      v12 = v262;
LABEL_104:
      *(_DWORD *)(*(_QWORD *)&v30[(v35 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v35 & 0x3FF)) = v11;
      *((_QWORD *)this + 20) = v33 + 1;
LABEL_105:
      v127 = *((_QWORD *)this + 21);
      v128 = *(_QWORD *)(v127 + 24 * v12);
      if (*(_DWORD *)(v128 + 4 * v13) == 1)
      {
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27)), (const float **)this + 30, (const float **)(*((_QWORD *)this + 60) + 24 * v11), (const float **)v271, *p_mData, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        v127 = *((_QWORD *)this + 21);
        v128 = *(_QWORD *)(v127 + 24 * v12);
      }
      ++v11;
      v13 = ++v14;
      if (v14 >= (unint64_t)((*(_QWORD *)(v127 + 24 * v12 + 8) - v128) >> 2))
        goto LABEL_118;
    }
    v269 = v14;
    if (v34 < 0x400)
    {
      v48 = (char *)*((_QWORD *)this + 18);
      v49 = (char *)*((_QWORD *)this + 15);
      v263 = v31 >> 3;
      if (v31 >> 3 >= (unint64_t)((v48 - v49) >> 3))
      {
        if (v48 == v49)
          v52 = 1;
        else
          v52 = (v48 - v49) >> 2;
        v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v52);
        v259 = v54;
        *(_QWORD *)&v55 = v53;
        *((_QWORD *)&v55 + 1) = &v53[8 * v263];
        *(_OWORD *)v274 = v55;
        v56 = operator new(0x1000uLL);
        *(_QWORD *)&v57 = &v53[8 * v263];
        *((_QWORD *)&v57 + 1) = &v53[8 * v259];
        v58 = (char *)v57;
        if (v263 == v259)
        {
          v59 = v53;
          v60 = 8 * v263;
          v14 = v269;
          if (v31 < 1)
          {
            v260 = v56;
            v99 = v60 >> 2;
            if (v29 == v30)
              v100 = 1;
            else
              v100 = v99;
            v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v100);
            v12 = v262;
            v58 = &v101[8 * (v100 >> 2)];
            *(_QWORD *)&v103 = v101;
            *((_QWORD *)&v103 + 1) = v58;
            *(_OWORD *)v274 = v103;
            *(_QWORD *)&v57 = v58;
            *((_QWORD *)&v57 + 1) = &v101[8 * v102];
            if (v59)
            {
              v264 = v57;
              v104 = &v101[8 * (v100 >> 2)];
              operator delete(v59);
              v58 = v104;
              v57 = v264;
            }
            v56 = v260;
          }
          else
          {
            v61 = v60 >> 3;
            if (v61 >= -1)
              v62 = v61 + 1;
            else
              v62 = v61 + 2;
            v58 = (char *)(v57 - 8 * (v62 >> 1));
            *(_QWORD *)&v57 = v58;
            *(float **)&v63 = v274[0];
            *((_QWORD *)&v63 + 1) = v58;
            *(_OWORD *)v274 = v63;
            v12 = v262;
          }
        }
        else
        {
          v12 = v262;
          v14 = v269;
        }
        *(_QWORD *)v58 = v56;
        *(_QWORD *)&v57 = v57 + 8;
        v105 = *((_QWORD *)this + 17);
        while (v105 != *((_QWORD *)this + 16))
        {
          v106 = v274[1];
          if (v274[1] == v274[0])
          {
            v108 = (float *)v57;
            if ((unint64_t)v57 >= *((_QWORD *)&v57 + 1))
            {
              if (*((float **)&v57 + 1) == v274[1])
                v113 = 1;
              else
                v113 = (uint64_t)(*((_QWORD *)&v57 + 1) - (unint64_t)v274[1]) >> 2;
              v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v113);
              v107 = (float *)&v114[(2 * v113 + 6) & 0xFFFFFFFFFFFFFFF8];
              v116 = v107;
              v117 = (char *)v108 - (char *)v274[1];
              v64 = v108 == v274[1];
              v14 = v269;
              if (!v64)
              {
                v116 = (float *)((char *)v107 + (v117 & 0xFFFFFFFFFFFFFFF8));
                v118 = 8 * (v117 >> 3);
                v119 = v107;
                v120 = v274[1];
                do
                {
                  v121 = *(_QWORD *)v120;
                  v120 += 2;
                  *(_QWORD *)v119 = v121;
                  v119 += 2;
                  v118 -= 8;
                }
                while (v118);
              }
              *(_QWORD *)&v122 = v114;
              *((_QWORD *)&v122 + 1) = v107;
              *(_OWORD *)v274 = v122;
              *(_QWORD *)&v57 = v116;
              *((_QWORD *)&v57 + 1) = &v114[8 * v115];
              if (v106)
              {
                v265 = v57;
                operator delete(v106);
                v57 = v265;
              }
            }
            else
            {
              v109 = (uint64_t)(*((_QWORD *)&v57 + 1) - v57) >> 3;
              if (v109 >= -1)
                v110 = v109 + 1;
              else
                v110 = v109 + 2;
              v111 = v110 >> 1;
              v112 = v57 + 8 * (v110 >> 1);
              v107 = (float *)(v112 - (v57 - (unint64_t)v274[1]));
              if ((float *)v57 == v274[1])
              {
                v108 = v274[1];
              }
              else
              {
                v267 = *((_QWORD *)&v57 + 1);
                memmove((void *)(v112 - (v57 - (unint64_t)v274[1])), v274[1], v57 - (unint64_t)v274[1]);
                *((_QWORD *)&v57 + 1) = v267;
              }
              *(float **)&v123 = v274[0];
              *((_QWORD *)&v123 + 1) = v107;
              *(_OWORD *)v274 = v123;
              *(_QWORD *)&v57 = &v108[2 * v111];
              v12 = v262;
              v14 = v269;
            }
          }
          else
          {
            v107 = v274[1];
          }
          v124 = *(_QWORD *)(v105 - 8);
          v105 -= 8;
          *((_QWORD *)v107 - 1) = v124;
          *(float **)&v125 = v274[0];
          *((_QWORD *)&v125 + 1) = v274[1] - 2;
          *(_OWORD *)v274 = v125;
        }
        v126 = (void *)*((_QWORD *)this + 15);
        *(_OWORD *)((char *)this + 120) = *(_OWORD *)v274;
        *(_OWORD *)((char *)this + 136) = v57;
        if (v126)
          operator delete(v126);
        goto LABEL_103;
      }
      v50 = v48 - v49;
      v51 = operator new(0x1000uLL);
      if (v48 == v29)
      {
        v14 = v269;
        if (v49 == v30)
        {
          v77 = v51;
          if (v29 == v30)
            v78 = 1;
          else
            v78 = v50 >> 2;
          v79 = 2 * v78;
          v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v78);
          v30 = &v80[(v79 + 6) & 0xFFFFFFFFFFFFFFF8];
          v82 = (uint64_t *)*((_QWORD *)this + 16);
          v83 = v30;
          v84 = *((_QWORD *)this + 17) - (_QWORD)v82;
          if (v84)
          {
            v83 = &v30[v84 & 0xFFFFFFFFFFFFFFF8];
            v85 = 8 * (v84 >> 3);
            v86 = v30;
            do
            {
              v87 = *v82++;
              *(_QWORD *)v86 = v87;
              v86 += 8;
              v85 -= 8;
            }
            while (v85);
          }
          v88 = (void *)*((_QWORD *)this + 15);
          *((_QWORD *)this + 15) = v80;
          *((_QWORD *)this + 16) = v30;
          *((_QWORD *)this + 17) = v83;
          *((_QWORD *)this + 18) = &v80[8 * v81];
          v51 = v77;
          if (v88)
          {
            operator delete(v88);
            v51 = v77;
            v30 = (char *)*((_QWORD *)this + 16);
          }
        }
        *((_QWORD *)v30 - 1) = v51;
        v89 = (char *)*((_QWORD *)this + 16);
        v90 = (char *)*((_QWORD *)this + 17);
        *((_QWORD *)this + 16) = v89 - 8;
        v91 = *((_QWORD *)v89 - 1);
        *((_QWORD *)this + 16) = v89;
        v12 = v262;
        if (v90 == *((char **)this + 18))
        {
          v92 = *((_QWORD *)this + 15);
          v93 = (uint64_t)&v89[-v92];
          if ((unint64_t)v89 <= v92)
          {
            v129 = (uint64_t)&v90[-v92];
            v64 = v129 == 0;
            v130 = v129 >> 2;
            if (v64)
              v131 = 1;
            else
              v131 = v130;
            v132 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v131);
            v134 = &v132[8 * (v131 >> 2)];
            v135 = (uint64_t *)*((_QWORD *)this + 16);
            v90 = v134;
            v136 = *((_QWORD *)this + 17) - (_QWORD)v135;
            if (v136)
            {
              v90 = &v134[v136 & 0xFFFFFFFFFFFFFFF8];
              v137 = 8 * (v136 >> 3);
              v138 = &v132[8 * (v131 >> 2)];
              do
              {
                v139 = *v135++;
                *(_QWORD *)v138 = v139;
                v138 += 8;
                v137 -= 8;
              }
              while (v137);
            }
            v140 = (void *)*((_QWORD *)this + 15);
            *((_QWORD *)this + 15) = v132;
            *((_QWORD *)this + 16) = v134;
            *((_QWORD *)this + 17) = v90;
            *((_QWORD *)this + 18) = &v132[8 * v133];
            if (v140)
            {
              operator delete(v140);
              v90 = (char *)*((_QWORD *)this + 17);
            }
          }
          else
          {
            v94 = v93 >> 3;
            v42 = v93 >> 3 < -1;
            v95 = (v93 >> 3) + 2;
            if (v42)
              v96 = v95;
            else
              v96 = v94 + 1;
            v97 = &v89[-8 * (v96 >> 1)];
            v98 = v90 - v89;
            if (v90 != v89)
            {
              memmove(&v89[-8 * (v96 >> 1)], v89, v90 - v89);
              v89 = (char *)*((_QWORD *)this + 16);
            }
            v90 = &v97[v98];
            *((_QWORD *)this + 16) = &v89[-8 * (v96 >> 1)];
            *((_QWORD *)this + 17) = &v97[v98];
            v14 = v269;
          }
        }
        *(_QWORD *)v90 = v91;
        *((_QWORD *)this + 17) += 8;
        goto LABEL_103;
      }
      *(_QWORD *)v29 = v51;
      *((_QWORD *)this + 17) += 8;
      v12 = v262;
    }
    else
    {
      *((_QWORD *)this + 19) = v34 - 1024;
      v38 = *(_QWORD *)v30;
      v36 = v30 + 8;
      v37 = v38;
      *((_QWORD *)this + 16) = v36;
      v12 = v262;
      if (*((char **)this + 18) == v29)
      {
        v39 = *((_QWORD *)this + 15);
        v40 = (uint64_t)&v36[-v39];
        if ((unint64_t)v36 <= v39)
        {
          v65 = (uint64_t)&v29[-v39];
          v64 = v65 == 0;
          v66 = v65 >> 2;
          if (v64)
            v67 = 1;
          else
            v67 = v66;
          v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v67);
          v70 = &v68[8 * (v67 >> 2)];
          v71 = (uint64_t *)*((_QWORD *)this + 16);
          v29 = v70;
          v72 = *((_QWORD *)this + 17) - (_QWORD)v71;
          if (v72)
          {
            v29 = &v70[v72 & 0xFFFFFFFFFFFFFFF8];
            v73 = 8 * (v72 >> 3);
            v74 = &v68[8 * (v67 >> 2)];
            do
            {
              v75 = *v71++;
              *(_QWORD *)v74 = v75;
              v74 += 8;
              v73 -= 8;
            }
            while (v73);
          }
          v76 = (void *)*((_QWORD *)this + 15);
          *((_QWORD *)this + 15) = v68;
          *((_QWORD *)this + 16) = v70;
          *((_QWORD *)this + 17) = v29;
          *((_QWORD *)this + 18) = &v68[8 * v69];
          if (v76)
          {
            operator delete(v76);
            v29 = (char *)*((_QWORD *)this + 17);
          }
        }
        else
        {
          v41 = v40 >> 3;
          v42 = v40 >> 3 < -1;
          v43 = (v40 >> 3) + 2;
          if (v42)
            v44 = v43;
          else
            v44 = v41 + 1;
          v45 = &v36[-8 * (v44 >> 1)];
          v46 = v29 - v36;
          if (v29 == v36)
          {
            v47 = v29;
          }
          else
          {
            memmove(&v36[-8 * (v44 >> 1)], v36, v29 - v36);
            v45 = &v36[-8 * (v44 >> 1)];
            v47 = (char *)*((_QWORD *)this + 16);
          }
          v29 = &v45[v46];
          *((_QWORD *)this + 16) = &v47[-8 * (v44 >> 1)];
          *((_QWORD *)this + 17) = &v45[v46];
          v12 = v262;
        }
      }
      *(_QWORD *)v29 = v37;
      *((_QWORD *)this + 17) += 8;
    }
    v14 = v269;
LABEL_103:
    v30 = (char *)*((_QWORD *)this + 16);
    v33 = *((_QWORD *)this + 20);
    v35 = *((_QWORD *)this + 19) + v33;
    goto LABEL_104;
  }
  v270 = 0;
LABEL_121:
  if (*((_DWORD *)this + 16))
  {
    v141 = 0;
    v142 = 0;
    v143 = &a2->mBuffers[0].mData;
    do
    {
      v144 = *v143;
      v143 += 2;
      memmove(*(void **)(*((_QWORD *)this + 45) + v141), (const void *)(*(_QWORD *)(*((_QWORD *)this + 45) + v141) + 4 * *((unsigned int *)this + 18)), 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18)));
      memcpy((void *)(*(_QWORD *)(*((_QWORD *)this + 45) + v141)+ 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18))), v144, 4 * *((unsigned int *)this + 18));
      NonlinearBeepCanceller::fcn_wola_analysis(*((const vDSP_DFT_SetupStruct **)this + 105), *(const float **)(*((_QWORD *)this + 45) + v141), *((const float **)this + 30), (float **)this + 36, *(float **)(*((_QWORD *)this + 66) + v141), *((unsigned int *)this + 22), *((_DWORD *)this + 23), *((float *)this + 26));
      ++v142;
      v145 = *((unsigned int *)this + 16);
      v141 += 24;
    }
    while (v142 < v145);
    if ((_DWORD)v270)
    {
      if ((_DWORD)v145)
      {
        for (i = 0; i < v145; ++i)
        {
          vDSP_vclr(*(float **)(*((_QWORD *)this + 72) + 24 * i), 1, *((unsigned int *)this + 24));
          vDSP_vclr(*(float **)(*((_QWORD *)this + 48) + 24 * i), 1, *((unsigned int *)this + 22));
          v147 = 0;
          v148 = *(_QWORD *)(*((_QWORD *)this + 48) + 24 * i);
          v149 = (float *)(v148 + 4);
          v150 = (float *)(v148 + 4 * (*((_DWORD *)this + 23) + 1));
          __D.realp = v149;
          __D.imagp = v150;
          do
          {
            if (*((_QWORD *)this + 20) <= v147)
LABEL_196:
              std::__throw_out_of_range[abi:ne180100]();
            if (*(_DWORD *)this)
            {
              v151 = 0;
              v152 = 0;
              v153 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 16)
                                                 + (((*((_QWORD *)this + 19) + v147) >> 7) & 0x1FFFFFFFFFFFFF8))
                                     + 4 * ((*((_QWORD *)this + 19) + v147) & 0x3FF));
              do
              {
                v154 = *(unsigned int *)(*((_QWORD *)this + 24) + 4 * v152);
                v155 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * i) + 24 * v153) + v151);
                vDSP_vsmul(v155, 1, (const float *)this + 4, v155, 1, *((unsigned int *)this + 22));
                v154 *= 3;
                v156 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v153) + 8 * v154);
                v157 = *((_DWORD *)this + 23);
                v283.realp = (float *)(v156 + 4);
                v283.imagp = (float *)(v156 + 4 * (v157 + 1));
                v158 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * i) + 24 * v153) + v151);
                __B.realp = (float *)(v158 + 4);
                __B.imagp = (float *)(v158 + 4 * (v157 + 1));
                vDSP_zvma(&v283, 1, &__B, 1, &__D, 1, &__D, 1, (v157 - 1));
                v159 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v153) + 8 * v154);
                v160 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * i) + 24 * v153) + v151);
                v161 = *(float **)(*((_QWORD *)this + 48) + 24 * i);
                *v161 = *v161 + (float)(*v159 * *v160);
                v161[*((unsigned int *)this + 23)] = v161[*((unsigned int *)this + 23)]
                                                   + (float)(v159[*((unsigned int *)this + 23)]
                                                           * v160[*((unsigned int *)this + 23)]);
                NonlinearBeepCanceller::fcn_smooth_psd(*(NonlinearBeepCanceller **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * i) + 24 * v153)+ v151), *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 90) + 24 * i) + 24 * v153) + v151), *((float *)this + 1), *((float *)this + 5), (float *)1, *((float *)this + 10), *((_DWORD *)this + 24));
                vDSP_vmul(*(const float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v153) + 8 * v154), 1, *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * i) + 24 * v153) + v151), 1, *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * i) + 24 * v153) + v151), 1, *((unsigned int *)this + 24));
                vDSP_vadd(*(const float **)(*((_QWORD *)this + 72) + 24 * i), 1, *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * i) + 24 * v153) + v151), 1, *(float **)(*((_QWORD *)this + 72) + 24 * i), 1, *((unsigned int *)this + 24));
                NonlinearBeepCanceller::fcn_complex_mult_by_psd(*(NonlinearBeepCanceller **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v153) + 8 * v154), *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * i) + 24 * v153) + v151), *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 87) + 24 * i) + 24 * v153) + v151), *((unsigned int *)this + 23));
                ++v152;
                v151 += 24;
              }
              while (v152 < *(unsigned int *)this);
            }
            ++v147;
          }
          while (v147 != v270);
          vDSP_vsub(*(const float **)(*((_QWORD *)this + 48) + 24 * i), 1, *(const float **)(*((_QWORD *)this + 66) + 24 * i), 1, *(float **)(*((_QWORD *)this + 63) + 24 * i), 1, *((unsigned int *)this + 22));
          v162 = *(float **)(*((_QWORD *)this + 63) + 24 * i);
          v163 = *(float **)(*((_QWORD *)this + 69) + 24 * i);
          v164 = *((unsigned int *)this + 23);
          __A.realp = v162 + 1;
          __A.imagp = &v162[(v164 + 1)];
          vDSP_zvmags(&__A, 1, v163 + 1, 1, (v164 - 1));
          *v163 = *v162 * *v162;
          v163[v164] = v162[v164] * v162[v164];
          vDSP_meanv(*(const float **)(*((_QWORD *)this + 69) + 24 * i), 1, (float *)(*((_QWORD *)this + 39) + 4 * i), *((unsigned int *)this + 24));
          *(float *)(*((_QWORD *)this + 39) + 4 * i) = *((float *)this + 6)
                                                     + (float)(*(float *)(*((_QWORD *)this + 39) + 4 * i)
                                                             * *((float *)this + 7));
          v145 = *((unsigned int *)this + 16);
        }
      }
      goto LABEL_137;
    }
    if ((_DWORD)v145)
    {
      v235 = 0;
      v236 = 0;
      v237 = &a5->mBuffers[0].mData;
      v238 = &a4->mBuffers[0].mData;
      v239 = &a7->mBuffers[0].mData;
      do
      {
        v241 = *v239;
        v239 += 2;
        v240 = v241;
        v243 = *v238;
        v238 += 2;
        v242 = v243;
        v244 = (float *)*v237;
        v237 += 2;
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 66) + v235), (const float **)this + 30, (const float **)(*((_QWORD *)this + 57) + v235), (const float **)this + 36, v240, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        memcpy(v242, v240, 4 * *((unsigned int *)this + 18));
        vDSP_vclr(v244, 1, *((unsigned int *)this + 18));
        vDSP_vclr(*(float **)(*((_QWORD *)this + 51) + v235), 1, *((unsigned int *)this + 22));
        vDSP_vclr(*(float **)(*((_QWORD *)this + 54) + v235), 1, *((unsigned int *)this + 22));
        ++v236;
        v235 += 24;
      }
      while (v236 < *((unsigned int *)this + 16));
    }
LABEL_186:
    v245 = *(unsigned int *)this;
    v246 = *((_DWORD *)this + 27);
    if (v246 + 1 == (_DWORD)v245)
      v247 = 0;
    else
      v247 = v246 + 1;
    *((_DWORD *)this + 27) = v247;
    if ((_DWORD)v245)
    {
      v248 = 0;
      do
      {
        v249 = *((_QWORD *)this + 24);
        v250 = *(_DWORD *)(v249 + v248);
        if (v250 + 1 == (_DWORD)v245)
          v251 = 0;
        else
          v251 = v250 + 1;
        *(_DWORD *)(v249 + v248) = v251;
        v248 += 4;
      }
      while (4 * v245 != v248);
    }
    return 0;
  }
  if (!(_DWORD)v270)
    goto LABEL_186;
  LODWORD(v145) = 0;
LABEL_137:
  v165 = *((float *)this + 8);
  if (v165 > 0.0)
  {
    v166 = 0;
    if (v270 <= 1)
      v167 = 1;
    else
      v167 = v270;
    *(_QWORD *)v272 = v167;
    v168 = 0.0;
    v169 = v145;
    do
    {
      if (v169)
      {
        v266 = v166;
        v170 = 0;
        v171 = *((_QWORD *)this + 39);
        do
        {
          vDSP_vsadd(*(const float **)(*((_QWORD *)this + 72) + 24 * v170), 1, (const float *)(v171 + 4 * v170), *(float **)(*((_QWORD *)this + 102) + 24 * v170), 1, *((unsigned int *)this + 24));
          v172 = *(float **)(*((_QWORD *)this + 102) + 24 * v170);
          vDSP_svdiv((const float *)this + 9, v172, 1, v172, 1, *((unsigned int *)this + 24));
          NonlinearBeepCanceller::fcn_complex_mult_by_psd(*(NonlinearBeepCanceller **)(*((_QWORD *)this + 63) + 24 * v170), *(const float **)(*((_QWORD *)this + 102) + 24 * v170), *(float **)(*((_QWORD *)this + 63) + 24 * v170), *((unsigned int *)this + 23));
          vDSP_vclr(*(float **)(*((_QWORD *)this + 48) + 24 * v170), 1, *((unsigned int *)this + 22));
          v173 = 0;
          v174 = *(_QWORD *)(*((_QWORD *)this + 48) + 24 * v170);
          v175 = (float *)(v174 + 4);
          v176 = (float *)(v174 + 4 * (*((_DWORD *)this + 23) + 1));
          __D.realp = v175;
          __D.imagp = v176;
          do
          {
            if (*((_QWORD *)this + 20) <= v173)
              goto LABEL_196;
            if (*(_DWORD *)this)
            {
              v177 = 0;
              v178 = 0;
              v179 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 16)
                                                 + (((*((_QWORD *)this + 19) + v173) >> 7) & 0x1FFFFFFFFFFFFF8))
                                     + 4 * ((*((_QWORD *)this + 19) + v173) & 0x3FF));
              do
              {
                v180 = *(_DWORD *)(*((_QWORD *)this + 24) + 4 * v178);
                v181 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 87) + 24 * v170) + 24 * v179) + v177);
                v182 = *((_DWORD *)this + 23);
                v283.realp = (float *)(v181 + 4);
                v283.imagp = (float *)(v181 + 4 * (v182 + 1));
                v183 = *(_QWORD *)(*((_QWORD *)this + 63) + 24 * v170);
                v279.realp = (float *)(v183 + 4);
                v279.imagp = (float *)(v183 + 4 * (v182 + 1));
                v184 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * v170) + 24 * v179) + v177);
                __B.realp = (float *)(v184 + 4);
                __B.imagp = (float *)(v184 + 4 * (v182 + 1));
                vDSP_zvcma(&v283, 1, &v279, 1, &__B, 1, &__B, 1, (v182 - 1));
                v185 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 87) + 24 * v170) + 24 * v179) + v177);
                v186 = *(float **)(*((_QWORD *)this + 63) + 24 * v170);
                v187 = (_QWORD *)(*((_QWORD *)this + 81) + 24 * v170);
                v188 = *(float **)(*(_QWORD *)(*v187 + 24 * v179) + v177);
                *v188 = *v188 + (float)(*v185 * *v186);
                v189 = *((unsigned int *)this + 23);
                v188[v189] = v188[v189] + (float)(v185[v189] * v186[v189]);
                v190 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v179) + 24 * v180);
                v191 = (v189 + 1);
                v283.realp = (float *)(v190 + 4);
                v283.imagp = (float *)(v190 + 4 * v191);
                v192 = *(_QWORD *)(*(_QWORD *)(*v187 + 24 * v179) + v177);
                __B.realp = (float *)(v192 + 4);
                __B.imagp = (float *)(v192 + 4 * v191);
                if ((float)(*((float *)this + 8) + -1.0) == v168)
                {
                  v193 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v170) + 24 * v179) + v177);
                  v281.realp = (float *)(v193 + 4);
                  v281.imagp = (float *)(v193 + 4 * v191);
                  vDSP_zvmul(&v283, 1, &__B, 1, &v281, 1, (v189 - 1), 1);
                  v194 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v179) + 24 * v180);
                  v195 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * v170) + 24 * v179) + v177);
                  v196 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v170) + 24 * v179) + v177);
                  *v196 = *v194 * *v195;
                  v196[*((unsigned int *)this + 23)] = v194[*((unsigned int *)this + 23)]
                                                     * v195[*((unsigned int *)this + 23)];
                  v197 = *(float **)(*((_QWORD *)this + 48) + 24 * v170);
                  vDSP_vadd(v196, 1, v197, 1, v197, 1, *((unsigned int *)this + 22));
                }
                else
                {
                  v198 = *(float **)(*(_QWORD *)(*v187 + 24 * v179) + v177);
                  vDSP_vsmul(v198, 1, (const float *)this + 4, v198, 1, *((unsigned int *)this + 22));
                  vDSP_zvma(&v283, 1, &__B, 1, &__D, 1, &__D, 1, (*((_DWORD *)this + 23) - 1));
                  v199 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v179) + 24 * v180);
                  v200 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * v170) + 24 * v179) + v177);
                  v201 = *(float **)(*((_QWORD *)this + 48) + 24 * v170);
                  *v201 = *v201 + (float)(*v199 * *v200);
                  v201[*((unsigned int *)this + 23)] = v201[*((unsigned int *)this + 23)]
                                                     + (float)(v199[*((unsigned int *)this + 23)]
                                                             * v200[*((unsigned int *)this + 23)]);
                }
                ++v178;
                v177 += 24;
              }
              while (v178 < *(unsigned int *)this);
            }
            ++v173;
          }
          while (v173 != *(_QWORD *)v272);
          vDSP_vsub(*(const float **)(*((_QWORD *)this + 48) + 24 * v170), 1, *(const float **)(*((_QWORD *)this + 66) + 24 * v170), 1, *(float **)(*((_QWORD *)this + 63) + 24 * v170), 1, *((unsigned int *)this + 22));
          v202 = *(float **)(*((_QWORD *)this + 63) + 24 * v170);
          v203 = *(float **)(*((_QWORD *)this + 69) + 24 * v170);
          v204 = *((unsigned int *)this + 23);
          __A.realp = v202 + 1;
          __A.imagp = &v202[(v204 + 1)];
          vDSP_zvmags(&__A, 1, v203 + 1, 1, (v204 - 1));
          *v203 = *v202 * *v202;
          v203[v204] = v202[v204] * v202[v204];
          vDSP_meanv(*(const float **)(*((_QWORD *)this + 69) + 24 * v170), 1, (float *)(*((_QWORD *)this + 39) + 4 * v170), *((unsigned int *)this + 24));
          v171 = *((_QWORD *)this + 39);
          *(float *)(v171 + 4 * v170) = *((float *)this + 6)
                                      + (float)(*(float *)(v171 + 4 * v170) * *((float *)this + 7));
          ++v170;
          v145 = *((unsigned int *)this + 16);
        }
        while (v170 < v145);
        v165 = *((float *)this + 8);
        v169 = *((_DWORD *)this + 16);
        v166 = v266;
      }
      v168 = (float)++v166;
    }
    while (v165 > (float)v166);
  }
  if ((_DWORD)v145)
  {
    v205 = 0;
    if (v270 <= 1)
      v206 = 1;
    else
      v206 = v270;
    *(_QWORD *)v273 = v206;
    do
    {
      v207 = 0;
      do
      {
        if (*((_QWORD *)this + 20) <= v207)
          goto LABEL_196;
        v275 = v207;
        if (*(_DWORD *)this)
        {
          v208 = 0;
          v209 = 0;
          v210 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 16)
                                             + (((*((_QWORD *)this + 19) + v207) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((*((_QWORD *)this + 19) + v207) & 0x3FF));
          do
          {
            v211 = *(_DWORD *)(*((_QWORD *)this + 24) + 4 * v209);
            vDSP_vmul(*(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *(const float **)(*((_QWORD *)this + 102) + 24 * v205), 1, *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *((unsigned int *)this + 24));
            vDSP_vmul(*(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * v205) + 24 * v210) + v208), 1, *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *((unsigned int *)this + 24));
            v212 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * v205) + 24 * v210) + v208);
            vDSP_vsub(*(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, v212, 1, v212, 1, *((unsigned int *)this + 24));
            v213 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * v205) + 24 * v210) + v208);
            vDSP_vabs(v213, 1, v213, 1, *((unsigned int *)this + 24));
            v214 = *(_QWORD *)(*((_QWORD *)this + 63) + 24 * v205);
            v215 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v205) + 24 * v210) + v208);
            vDSP_vmma((const float *)(v214 + 4), 1, (const float *)(v215 + 4), 1, (const float *)(v214 + 4 * (*((_DWORD *)this + 23) + 1)), 1, (const float *)(v215 + 4 * (*((_DWORD *)this + 23) + 1)), 1, (float *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208)+ 4), 1, (*((_DWORD *)this + 23) - 1));
            v216 = *(float **)(*((_QWORD *)this + 63) + 24 * v205);
            v217 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v205) + 24 * v210) + v208);
            v218 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208);
            *v218 = *v216 * *v217;
            v218[*((unsigned int *)this + 23)] = v216[*((unsigned int *)this + 23)] * v217[*((unsigned int *)this + 23)];
            vDSP_vsadd(*(const float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v210) + 24 * v211), 1, (const float *)this + 6, *(float **)(*((_QWORD *)this + 69) + 24 * v205), 1, *((unsigned int *)this + 24));
            v219 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208);
            vDSP_vdiv(*(const float **)(*((_QWORD *)this + 69) + 24 * v205), 1, v219, 1, v219, 1, *((unsigned int *)this + 24));
            NonlinearBeepCanceller::fcn_smooth_psd(*(NonlinearBeepCanceller **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 90) + 24 * v205) + 24 * v210)+ v208), *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208), *((float *)this + 2), *((float *)this + 3), 0, *((float *)this + 29), *((_DWORD *)this + 24));
            ++v209;
            v208 += 24;
          }
          while (v209 < *(unsigned int *)this);
        }
        v207 = v275 + 1;
      }
      while (v275 + 1 != *(_QWORD *)v273);
      ++v205;
      v220 = *((unsigned int *)this + 16);
    }
    while (v205 < v220);
    if ((_DWORD)v220)
    {
      v221 = 0;
      v222 = 0;
      v223 = &a5->mBuffers[0].mData;
      v224 = &a4->mBuffers[0].mData;
      v225 = &a7->mBuffers[0].mData;
      do
      {
        v226 = (const float *)*v225;
        v227 = *v224;
        v276 = *v223;
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 66) + v221), (const float **)this + 30, (const float **)(*((_QWORD *)this + 57) + v221), (const float **)this + 36, *v225, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 63) + v221), (const float **)this + 30, (const float **)(*((_QWORD *)this + 51) + v221), (const float **)this + 36, v227, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 48) + v221), (const float **)this + 30, (const float **)(*((_QWORD *)this + 54) + v221), (const float **)this + 36, v276, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        vDSP_svesq(v226, 1, (float *)&__C, *((unsigned int *)this + 18));
        vDSP_svesq((const float *)v227, 1, &v277, *((unsigned int *)this + 18));
        if (v277 > (float)(*(float *)&__C * 3.0))
          memcpy(v227, v226, 4 * *((unsigned int *)this + 18));
        ++v222;
        v221 += 24;
        v223 += 2;
        v224 += 2;
        v225 += 2;
      }
      while (v222 < *((unsigned int *)this + 16));
    }
  }
  v228 = *(unsigned int *)this;
  v229 = *((_DWORD *)this + 27);
  if (v229 + 1 == (_DWORD)v228)
    v230 = 0;
  else
    v230 = v229 + 1;
  *((_DWORD *)this + 27) = v230;
  if ((_DWORD)v228)
  {
    v231 = 0;
    do
    {
      v232 = *((_QWORD *)this + 24);
      v233 = *(_DWORD *)(v232 + v231);
      if (v233 + 1 == (_DWORD)v228)
        v234 = 0;
      else
        v234 = v233 + 1;
      *(_DWORD *)(v232 + v231) = v234;
      v231 += 4;
    }
    while (4 * v228 != v231);
  }
  return 0;
}

void sub_1B506F40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int128 a29)
{
  operator delete(__p);
  if ((_QWORD)a29)
    operator delete((void *)a29);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_wola_analysis(const vDSP_DFT_SetupStruct *a1, const float *__A, const float *a3, float **a4, float *a5, vDSP_Length __N, unsigned int a7, float a8)
{
  vDSP_Length v11;
  const DSPComplex *v12;
  DSPSplitComplex __Z;
  float __B;

  v11 = a7;
  __Z.realp = a5;
  __Z.imagp = &a5[a7];
  vDSP_vmul(__A, 1, a3, 1, *a4, 1, __N);
  v12 = (const DSPComplex *)*a4;
  __B = a8;
  vDSP_ctoz(v12, 2, &__Z, 1, v11);
  vDSP_DFT_Execute(a1, __Z.realp, __Z.imagp, __Z.realp, __Z.imagp);
  vDSP_vsmul(__Z.realp, 1, &__B, __Z.realp, 1, v11);
  vDSP_vsmul(__Z.imagp, 1, &__B, __Z.imagp, 1, v11);
}

void NonlinearBeepCanceller::fcn_wola_synthesis(const vDSP_DFT_SetupStruct *a1, const float *a2, const float **a3, const float **a4, const float **a5, void *a6, unsigned int a7, unsigned int a8, float a9, unsigned int a10)
{
  DSPComplex *v16;
  vDSP_Length __N;
  float *v18;
  unsigned int v19;
  DSPSplitComplex __Z;
  float *__Or[3];
  float __B;

  v16 = (DSPComplex *)*a5;
  __B = a9;
  memset(__Or, 0, sizeof(__Or));
  __N = a8;
  LODWORD(__Z.realp) = 0;
  std::vector<float>::assign((char **)__Or, a8, &__Z);
  v18 = __Or[0];
  __Z.realp = __Or[0];
  __Z.imagp = &__Or[0][a10];
  vDSP_DFT_Execute(a1, a2, &a2[a10], __Or[0], __Z.imagp);
  vDSP_ztoc(&__Z, 1, v16, 2, a10);
  vDSP_vsmul((const float *)v16, 1, &__B, (float *)v16, 1, __N);
  if (v18)
    operator delete(v18);
  vDSP_vma(*a3, 1, *a5, 1, *a4, 1, (float *)*a4, 1, __N);
  memcpy(a6, *a4, 4 * a7);
  v19 = a8 - a7;
  memmove((void *)*a4, &(*a4)[a7], 4 * v19);
  vDSP_vclr((float *)&(*a4)[v19], 1, a7);
}

void sub_1B506F658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_out_of_range[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E687D0C0, MEMORY[0x1E0DE42E0]);
}

void sub_1B506F6B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_smooth_psd(NonlinearBeepCanceller *this, const float *a2, float a3, float a4, float *a5, float a6, unsigned int a7)
{
  int v7;
  vDSP_Length v11;
  float v12;
  float v13;
  float __B;

  v7 = (int)a5;
  v13 = a4;
  __B = a3;
  v12 = a6;
  v11 = a7;
  vDSP_vsmul((const float *)this, 1, &__B, (float *)this, 1, a7);
  vDSP_vsma(a2, 1, &v13, (const float *)this, 1, (float *)this, 1, v11);
  if (v7)
    vDSP_vabs((const float *)this, 1, (float *)this, 1, v11);
  if (a6 > 0.0)
    vDSP_vsadd((const float *)this, 1, &v12, (float *)this, 1, v11);
}

float NonlinearBeepCanceller::fcn_complex_mult_by_psd(NonlinearBeepCanceller *this, const float *__B, float *__C, vDSP_Length __N)
{
  unsigned int v4;
  float result;

  v4 = __N;
  vDSP_vmul((const float *)this, 1, __B, 1, __C, 1, __N);
  vDSP_vmul((const float *)this + v4 + 1, 1, __B + 1, 1, &__C[v4 + 1], 1, v4 - 1);
  result = *((float *)this + v4) * __B[v4];
  __C[v4] = result;
  return result;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "deque");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void sub_1B506FF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B50720E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4772(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4773(uint64_t a1)
{

}

void sub_1B50742F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5074B64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x1B5E46138](v3, 0x1090C40431A8F44);

  _Unwind_Resume(a1);
}

void sub_1B5074FFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E46120](v1, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

void sub_1B50752D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E46120](v1, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

void sub_1B507543C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E46120](v1, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

void sub_1B507559C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned short>>::operator()[abi:ne180100](_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }
  v3 = a1[5];
  a1[5] = 0;
  if (v3)
    MEMORY[0x1B5E46120](v3, 0x1000C80BDFB0063);
  JUMPOUT(0x1B5E46138);
}

void corespeech::CSAudioCircularBufferImpl<unsigned short>::copySamples(uint64_t *a1, uint64_t *a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  const void **v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  size_t v28;
  char *__dst;
  unint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2[2];
  v8 = a2[4];
  if (v8 >= v7)
    v9 = v8 - v7;
  else
    v9 = 0;
  if (v9 > a3 || a4 <= a3 || v8 < a4 || v8 <= a3 || v9 >= a4)
  {
    v14 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v32 = "copySamples";
      v33 = 2050;
      v34 = a3;
      v35 = 2050;
      v36 = a4;
      v37 = 2050;
      v38 = v9;
      v39 = 2050;
      v40 = v8;
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
    }
    *a1 = 0;
  }
  else
  {
    v30 = a4 - a3;
    v16 = operator new[]();
    __dst = (char *)v16;
    *a1 = v16;
    v17 = *a2;
    if (*a2)
    {
      v18 = 0;
      v19 = a3 % v7;
      v20 = a4 % v7;
      v21 = (const void **)a2[6];
      v22 = v7 - a3 % v7;
      v23 = 2 * a4 - 2 * a3;
      v24 = (char *)v16;
      do
      {
        v25 = (char *)*v21;
        v26 = (char *)*v21 + 2 * v19;
        if (v19 >= v20)
        {
          memcpy(v24, v26, 2 * v22);
          v27 = &__dst[2 * v18 * v30 + 2 * v22];
          v26 = v25;
          v28 = 2 * (v30 - v22);
        }
        else
        {
          v27 = v24;
          v28 = 2 * v30;
        }
        memcpy(v27, v26, v28);
        ++v18;
        ++v21;
        v24 += v23;
        --v17;
      }
      while (v17);
    }
  }
}

void sub_1B50766F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5136(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5137(uint64_t a1)
{

}

void sub_1B5077368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5078644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B507CB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke_5914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1B5E468D0](a5);
  v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

void sub_1B507E3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B507FBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B508484C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5085338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B5085530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B5085D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B5086488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5086620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5086D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5086EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B508732C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B508A074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B508A474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6454(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6455(uint64_t a1)
{

}

void sub_1B508E52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

void sub_1B5091030(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B50913D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1B50940D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _CSPreferencesSetValueForKey(void *a1, const __CFString *a2)
{
  id value;

  value = a1;
  if (+[CSUtils deviceRequirePowerAssertionHeld](CSUtils, "deviceRequirePowerAssertionHeld"))

  CFPreferencesSetAppValue(a2, value, CFSTR("com.apple.voicetrigger"));
}

void _CSNotBackedupPreferencesSetValueForKey(void *a1, const __CFString *a2)
{
  id value;

  value = a1;
  if (+[CSUtils deviceRequirePowerAssertionHeld](CSUtils, "deviceRequirePowerAssertionHeld"))

  CFPreferencesSetAppValue(a2, value, CFSTR("com.apple.voicetrigger.notbackedup"));
}

void _CSPreferencesSetValueForKeyFromRoot(void *a1, const __CFString *a2)
{
  id value;

  value = a1;
  if (+[CSUtils deviceRequirePowerAssertionHeld](CSUtils, "deviceRequirePowerAssertionHeld"))

  CFPreferencesSetValue(a2, value, CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
}

uint64_t CSInternalPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));
}

CFPropertyListRef _CSPreferencesValueForKey(const __CFString *a1)
{
  return (id)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.voicetrigger"));
}

CFPropertyListRef _CSNotBackedupPreferencesValueForKey(const __CFString *a1)
{
  return (id)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.voicetrigger.notbackedup"));
}

CFPropertyListRef _CSPreferencesValueForKeyFromRoot(const __CFString *a1)
{
  return (id)CFPreferencesCopyValue(a1, CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
}

uint64_t CSNotBackedupInternalPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger.notbackedup"));
}

void _CSNotBackedupPreferencesSetValueForKeyFromRoot(CFPropertyListRef value, CFStringRef key)
{
  CFPreferencesSetValue(key, value, CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
}

CFPropertyListRef _CSNotBackedupPreferencesValueForKeyFromRoot(const __CFString *a1)
{
  return (id)CFPreferencesCopyValue(a1, CFSTR("com.apple.voicetrigger.notbackedup"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
}

void sub_1B5099464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<BatchBeepCanceller>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;
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
  void **v15;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v15 = (void **)(v2 + 600);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v15);
    v15 = (void **)(v2 + 576);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v15);
    v15 = (void **)(v2 + 552);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v15);
    v15 = (void **)(v2 + 528);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v15);
    v3 = *(void **)(v2 + 440);
    if (v3)
    {
      *(_QWORD *)(v2 + 448) = v3;
      operator delete(v3);
    }
    v4 = *(void **)(v2 + 416);
    if (v4)
    {
      *(_QWORD *)(v2 + 424) = v4;
      operator delete(v4);
    }
    v5 = *(void **)(v2 + 392);
    if (v5)
    {
      *(_QWORD *)(v2 + 400) = v5;
      operator delete(v5);
    }
    v6 = *(void **)(v2 + 368);
    if (v6)
    {
      *(_QWORD *)(v2 + 376) = v6;
      operator delete(v6);
    }
    std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100]((uint64_t *)(v2 + 360), 0);
    v7 = *(void **)(v2 + 192);
    if (v7)
    {
      *(_QWORD *)(v2 + 200) = v7;
      operator delete(v7);
    }
    v8 = *(void **)(v2 + 160);
    if (v8)
    {
      *(_QWORD *)(v2 + 168) = v8;
      operator delete(v8);
    }
    v9 = *(void **)(v2 + 136);
    if (v9)
    {
      *(_QWORD *)(v2 + 144) = v9;
      operator delete(v9);
    }
    v10 = *(void **)(v2 + 112);
    if (v10)
    {
      *(_QWORD *)(v2 + 120) = v10;
      operator delete(v10);
    }
    v11 = *(void **)(v2 + 88);
    if (v11)
    {
      *(_QWORD *)(v2 + 96) = v11;
      operator delete(v11);
    }
    v12 = *(void **)(v2 + 48);
    if (v12)
    {
      *(_QWORD *)(v2 + 56) = v12;
      operator delete(v12);
    }
    v13 = *(void **)(v2 + 24);
    if (v13)
    {
      *(_QWORD *)(v2 + 32) = v13;
      operator delete(v13);
    }
    v14 = *(void **)v2;
    if (*(_QWORD *)v2)
    {
      *(_QWORD *)(v2 + 8) = v14;
      operator delete(v14);
    }
    JUMPOUT(0x1B5E46138);
  }
  return result;
}

uint64_t *std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  vDSP_DFT_SetupStruct *v3;
  vDSP_DFT_SetupStruct *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void **v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void **v20;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = *(vDSP_DFT_SetupStruct **)(v2 + 840);
    if (v3)
      vDSP_DFT_DestroySetup(v3);
    v4 = *(vDSP_DFT_SetupStruct **)(v2 + 848);
    if (v4)
      vDSP_DFT_DestroySetup(v4);
    v20 = (void **)(v2 + 816);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 792);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 768);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 744);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 720);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 696);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 672);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 648);
    std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 624);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 600);
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 576);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 552);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 528);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 504);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 480);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 456);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 432);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 408);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 384);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 360);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v20 = (void **)(v2 + 336);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v5 = *(void **)(v2 + 312);
    if (v5)
    {
      *(_QWORD *)(v2 + 320) = v5;
      operator delete(v5);
    }
    v6 = *(void **)(v2 + 288);
    if (v6)
    {
      *(_QWORD *)(v2 + 296) = v6;
      operator delete(v6);
    }
    v7 = *(void **)(v2 + 264);
    if (v7)
    {
      *(_QWORD *)(v2 + 272) = v7;
      operator delete(v7);
    }
    v8 = *(void **)(v2 + 240);
    if (v8)
    {
      *(_QWORD *)(v2 + 248) = v8;
      operator delete(v8);
    }
    v9 = *(void **)(v2 + 216);
    if (v9)
    {
      *(_QWORD *)(v2 + 224) = v9;
      operator delete(v9);
    }
    v10 = *(void **)(v2 + 192);
    if (v10)
    {
      *(_QWORD *)(v2 + 200) = v10;
      operator delete(v10);
    }
    v20 = (void **)(v2 + 168);
    std::vector<std::vector<unsigned int>>::__destroy_vector::operator()[abi:ne180100](&v20);
    v11 = *(void ***)(v2 + 128);
    v12 = *(void ***)(v2 + 136);
    *(_QWORD *)(v2 + 160) = 0;
    v13 = (char *)v12 - (char *)v11;
    if ((unint64_t)((char *)v12 - (char *)v11) >= 0x11)
    {
      do
      {
        operator delete(*v11);
        v12 = *(void ***)(v2 + 136);
        v11 = (void **)(*(_QWORD *)(v2 + 128) + 8);
        *(_QWORD *)(v2 + 128) = v11;
        v13 = (char *)v12 - (char *)v11;
      }
      while ((unint64_t)((char *)v12 - (char *)v11) > 0x10);
    }
    v14 = v13 >> 3;
    if (v14 == 1)
    {
      v15 = 512;
    }
    else
    {
      if (v14 != 2)
      {
LABEL_26:
        if (v11 != v12)
        {
          do
          {
            v16 = *v11++;
            operator delete(v16);
          }
          while (v11 != v12);
          v18 = *(_QWORD *)(v2 + 128);
          v17 = *(_QWORD *)(v2 + 136);
          if (v17 != v18)
            *(_QWORD *)(v2 + 136) = v17 + ((v18 - v17 + 7) & 0xFFFFFFFFFFFFFFF8);
        }
        v19 = *(void **)(v2 + 120);
        if (v19)
          operator delete(v19);
        JUMPOUT(0x1B5E46138);
      }
      v15 = 1024;
    }
    *(_QWORD *)(v2 + 152) = v15;
    goto LABEL_26;
  }
  return result;
}

void std::vector<std::vector<std::vector<std::vector<float>>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __Block_byref_object_copy__7092(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7093(uint64_t a1)
{

}

void sub_1B5099F84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(a1);
}

void BatchBeepCanceller::reset(BatchBeepCanceller *this)
{
  uint64_t *v2;
  uint64_t v3;

  *((_QWORD *)this + 23) = 0;
  *((_BYTE *)this + 228) = 0;
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 31) = 0;
  v2 = (uint64_t *)((char *)this + 360);
  if (*((_QWORD *)this + 45))
    std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100]((uint64_t *)this + 45, 0);
  v3 = operator new();
  *(_DWORD *)v3 = 4;
  *(_OWORD *)(v3 + 4) = xmmword_1B50D7630;
  *(_OWORD *)(v3 + 20) = xmmword_1B50D7640;
  *(_OWORD *)(v3 + 36) = xmmword_1B50D7650;
  *(_OWORD *)(v3 + 52) = xmmword_1B50D7660;
  *(_QWORD *)(v3 + 68) = 0x4000000001;
  *(_DWORD *)(v3 + 76) = 16000;
  *(_OWORD *)(v3 + 84) = xmmword_1B50D7670;
  *(_QWORD *)(v3 + 108) = 0x1E3CE50800000000;
  *(_QWORD *)(v3 + 100) = 0x3F0000003B000000;
  bzero((void *)(v3 + 116), 0x2E4uLL);
  std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100](v2, v3);
  NonlinearBeepCanceller::nl_init(*((NonlinearBeepCanceller **)this + 45), *((_DWORD *)this + 72), *((float *)this + 73), *((float *)this + 74), *((float *)this + 75), *((float *)this + 76), (float)*((unsigned int *)this + 77), *((float *)this + 78), *((float *)this + 79), *((float *)this + 80), *((_DWORD *)this + 82), *((_DWORD *)this + 83), *((_DWORD *)this + 84), *((_DWORD *)this + 85), *((_DWORD *)this + 86), *((_DWORD *)this + 87), *((float *)this + 81), *((_DWORD *)this + 88));
}

void sub_1B509A358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t BatchBeepCanceller::feedFloat(BatchBeepCanceller *this, const float *a2, uint64_t a3, const float **a4)
{
  uint64_t v6;
  unsigned int v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int CrossCorrelationPeak;
  unsigned int v14;
  uint64_t v15;
  int v16;
  const float *v17;
  uint64_t v18;

  if (!a2)
  {
    *((_DWORD *)this + 56) = 0;
    BatchBeepCanceller::reset(this);
    v6 = 0;
    *((_DWORD *)this + 65) = -4;
    *(_QWORD *)((char *)this + 268) = 0;
    *(_QWORD *)((char *)this + 276) = 0;
    *((_DWORD *)this + 71) = 0;
    goto LABEL_5;
  }
  v6 = a3;
  if (*((_DWORD *)this + 20) < a3)
  {
    v6 = 0;
LABEL_5:
    *a4 = 0;
    return v6;
  }
  v8 = *((_DWORD *)this + 56);
  if (v8)
  {
    v9 = v8 >= a3;
    v10 = v8 - a3;
    if (v10 != 0 && v9)
    {
      *((_DWORD *)this + 56) = v10;
    }
    else
    {
      *((_DWORD *)this + 56) = 0;
      *((_BYTE *)this + 228) = 1;
      *((_DWORD *)this + 65) = -2;
      *((_DWORD *)this + 71) = 0;
      *(_QWORD *)((char *)this + 268) = 0;
      *(_QWORD *)((char *)this + 276) = 0;
    }
  }
  if (*((_BYTE *)this + 228))
  {
    if ((_DWORD)a3)
      memmove((void *)(*((_QWORD *)this + 20) + 4 * *((unsigned int *)this + 46)), a2, 4 * a3);
    v11 = *((_DWORD *)this + 46);
    v12 = v11 + v6;
    *((_DWORD *)this + 46) = v12;
    BatchBeepCanceller::updateCrossCorrelation(this, v11, v12);
    CrossCorrelationPeak = BatchBeepCanceller::findCrossCorrelationPeak(this, v11, v12);
    if (CrossCorrelationPeak)
    {
      v14 = CrossCorrelationPeak;
      kdebug_trace();
      BatchBeepCanceller::doAdaptiveCancel(this, v14);
      kdebug_trace();
      v15 = *((unsigned int *)this + 47);
      v6 = (*((_DWORD *)this + 46) - v15);
      *a4 = (const float *)(*((_QWORD *)this + 20) + 4 * v15);
      BatchBeepCanceller::reset(this);
    }
    else
    {
      v16 = *((_DWORD *)this + 46);
      v17 = (const float *)*((_QWORD *)this + 20);
      if ((*((_DWORD *)this + 20) + v16) <= (unint64_t)((uint64_t)(*((_QWORD *)this + 21)
                                                                                      - (_QWORD)v17) >> 2))
      {
        v6 = 0;
        *a4 = v17;
      }
      else
      {
        v18 = *((unsigned int *)this + 47);
        v6 = (v16 - v18);
        *a4 = &v17[v18];
        BatchBeepCanceller::reset(this);
        *((_DWORD *)this + 65) = -1;
        *(_QWORD *)((char *)this + 268) = 0;
        *(_QWORD *)((char *)this + 276) = 0;
        *((_DWORD *)this + 71) = 0;
      }
    }
  }
  else
  {
    *a4 = a2;
  }
  return v6;
}

void BatchBeepCanceller::updateCrossCorrelation(BatchBeepCanceller *this, unsigned int a2, unsigned int a3)
{
  const float *v4;
  uint64_t v5;
  vDSP_Length v6;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  float v11;
  vDSP_Length v12;
  float *v13;
  float __B;

  v4 = *(const float **)this;
  v5 = *((_QWORD *)this + 1) - *(_QWORD *)this;
  v6 = v5 >> 2;
  if (v5 >> 2 <= (unint64_t)a3)
  {
    v8 = (unint64_t)v5 >> 2;
    if (v8 <= a2)
      v9 = a2;
    else
      v9 = v8;
    if (v8 > a3)
      a3 = v8;
    v10 = v9 - v8;
    v11 = 1.0 / (double)v6;
    __B = v11;
    v12 = a3 - v9;
    vDSP_conv((const float *)(*((_QWORD *)this + 20) + 4 * v10), 1, v4, 1, (float *)(*((_QWORD *)this + 24) + 4 * v10), 1, v12, v6);
    v13 = (float *)(*((_QWORD *)this + 24) + 4 * v10);
    vDSP_vsmul(v13, 1, &__B, v13, 1, v12);
  }
}

uint64_t BatchBeepCanceller::findCrossCorrelationPeak(BatchBeepCanceller *this, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  float *v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  double v15;
  float v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;

  v3 = (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2;
  if (a2 >= v3)
    v4 = a2 - v3;
  else
    v4 = 0;
  LODWORD(v5) = a3 - v3;
  if (a3 >= v3)
    v5 = v5;
  else
    v5 = 0;
  if (v3 >= a3)
    v6 = a3;
  else
    v6 = v3;
  if (v6 > a2)
  {
    v7 = *((double *)this + 31);
    v8 = v6 - a2;
    v9 = (float *)(*((_QWORD *)this + 20) + 4 * a2);
    do
    {
      v10 = *v9++;
      v7 = v7 + (float)(v10 * v10);
      --v8;
    }
    while (v8);
    *((double *)this + 31) = v7;
  }
  if (v4 >= v5)
  {
    v16 = *((float *)this + 54);
    v12 = *((_QWORD *)this + 20);
  }
  else
  {
    v11 = 1.0 / (double)(unint64_t)v3;
    v12 = *((_QWORD *)this + 20);
    v13 = *((_QWORD *)this + 24);
    v14 = *((float *)this + 61);
    v15 = *((double *)this + 31);
    v16 = *((float *)this + 54);
    v17 = v12 + 4 * v3;
    do
    {
      v18 = v15;
      v19 = v11 * v18;
      if (v19 < 1.1755e-38)
        v19 = 1.1755e-38;
      v20 = sqrtf(v19);
      v21 = *(float *)(v17 + 4 * v4);
      v22 = *(float *)(v12 + 4 * v4);
      v23 = fabsf(*(float *)(v13 + 4 * v4) / (float)(v20 * v14));
      if (v23 > v16)
      {
        *((float *)this + 54) = v23;
        *((_DWORD *)this + 55) = v4;
        v16 = v23;
      }
      v15 = v15 + (float)((float)(v21 * v21) - (float)(v22 * v22));
      ++v4;
    }
    while (v5 != v4);
    *((double *)this + 31) = v15;
  }
  v24 = *((_DWORD *)this + 46);
  v25 = *((_DWORD *)this + 55);
  v26 = v5 - v25;
  if (((*((_QWORD *)this + 21) - v12) >> 2 < (unint64_t)(*((_DWORD *)this + 20) + v24)
     || v16 > *((float *)this + 64))
    && v26 >= *((_DWORD *)this + 60)
    && v24 > *((_DWORD *)this + 59))
  {
    return v25;
  }
  else
  {
    return 0;
  }
}

BatchBeepCanceller *BatchBeepCanceller::doAdaptiveCancel(BatchBeepCanceller *this, unsigned int a2)
{
  unsigned int v4;
  signed int v5;
  float *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  signed int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  signed int v33;
  int v34;
  float __B;

  v4 = *((_DWORD *)this + 84) * *((_DWORD *)this + 119) * *((_DWORD *)this + 87);
  v5 = v4 - a2;
  if (v4 <= a2)
  {
    v10 = (void *)*((_QWORD *)this + 52);
    v11 = *((_QWORD *)this + 53) - (_QWORD)v10;
    v7 = v11 >> 2;
    v12 = a2 - v4;
    v13 = *((_QWORD *)this + 20);
    v33 = v12;
    if (((*((_QWORD *)this + 21) - v13) >> 2) - v12 >= (unint64_t)(v11 >> 2))
      memcpy(v10, (const void *)(v13 + 4 * v12), v11 << 30 >> 30);
    v5 = 0;
  }
  else
  {
    v6 = (float *)*((_QWORD *)this + 52);
    LODWORD(v7) = ((*((_QWORD *)this + 53) - (_QWORD)v6) >> 2) - v5;
    vDSP_vclr(v6, 1, v5);
    v8 = (const void *)*((_QWORD *)this + 20);
    v9 = *((_QWORD *)this + 52);
    if (((*((_QWORD *)this + 53) - v9) >> 2) - v5 <= (unint64_t)((uint64_t)(*((_QWORD *)this + 21) - (_QWORD)v8) >> 2))
      memcpy((void *)(v9 + 4 * v5), v8, 4 * (int)v7);
    v33 = 0;
  }
  v34 = v7;
  v14 = *((_DWORD *)this + 84);
  v15 = *((_DWORD *)this + 87);
  v16 = *((_DWORD *)this + 119);
  vDSP_svesq((const float *)(*((_QWORD *)this + 46) + 4 * (v15 * v14 * v16 - *((_DWORD *)this + 118))), 1, (float *)this + 116, (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2);
  vDSP_svesq((const float *)(*((_QWORD *)this + 52)+ 4 * (*((_DWORD *)this + 84) * *((_DWORD *)this + 119) * *((_DWORD *)this + 87))), 1, (float *)this + 117, (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2);
  __B = sqrtf(*((float *)this + 117) / *((float *)this + 116));
  vDSP_vsmul(*((const float **)this + 46), 1, &__B, *((float **)this + 49), 1, (uint64_t)(*((_QWORD *)this + 47) - *((_QWORD *)this + 46)) >> 2);
  v17 = (*((_QWORD *)this + 53) - *((_QWORD *)this + 52)) >> 2;
  v18 = *((_DWORD *)this + 87);
  if (v18 <= v17)
  {
    v19 = 0;
    v20 = v17 / v18;
    LODWORD(v17) = *((_DWORD *)this + 85);
    if (v20 <= 1)
      v21 = 1;
    else
      v21 = v20;
    do
    {
      if ((_DWORD)v17)
      {
        v22 = 0;
        v23 = 16;
        do
        {
          memcpy(*(void **)(*((_QWORD *)this + 63) + v23), (const void *)(*((_QWORD *)this + 52) + 4 * (*((_DWORD *)this + 87) * v19)), 4 * *((unsigned int *)this + 87));
          ++v22;
          v23 += 16;
        }
        while (v22 < *((unsigned int *)this + 85));
      }
      if (*((_DWORD *)this + 86))
      {
        v24 = 0;
        v25 = 16;
        do
        {
          memcpy(*(void **)(*((_QWORD *)this + 65) + v25), (const void *)(*((_QWORD *)this + 49) + 4 * (*((_DWORD *)this + 87) * v19)), 4 * *((unsigned int *)this + 87));
          ++v24;
          v25 += 16;
        }
        while (v24 < *((unsigned int *)this + 86));
      }
      NonlinearBeepCanceller::nl_proc(*((NonlinearBeepCanceller **)this + 45), *((const AudioBufferList **)this + 63), *((const AudioBufferList **)this + 65), *((AudioBufferList **)this + 60), *((AudioBufferList **)this + 61), *((AudioBufferList **)this + 64), *((AudioBufferList **)this + 62));
      LODWORD(v17) = *((_DWORD *)this + 85);
      if ((_DWORD)v17)
      {
        v26 = 0;
        v27 = 16;
        do
        {
          memcpy((void *)(*((_QWORD *)this + 55) + 4 * (*((_DWORD *)this + 87) * v19)), *(const void **)(*((_QWORD *)this + 60) + v27), 4 * *((unsigned int *)this + 87));
          ++v26;
          v17 = *((unsigned int *)this + 85);
          v27 += 16;
        }
        while (v26 < v17);
      }
      ++v19;
    }
    while (v19 != v21);
  }
  v28 = (v16 - 1) * v14;
  v29 = v28 * v15 + v33;
  v30 = v28 * v15 + v5;
  v31 = v34 - (v14 + v28 - 1) * v15;
  *((_DWORD *)this + 71) = 0;
  *(_QWORD *)((char *)this + 268) = 0;
  *(_QWORD *)((char *)this + 276) = 0;
  *((_DWORD *)this + 65) = a2;
  BatchBeepCanceller::storeReportPart1(this, a2);
  memcpy((void *)(*((_QWORD *)this + 20) + 4 * v29), (const void *)(*((_QWORD *)this + 55)+ 4 * (v30 + (*((_DWORD *)this + 84) - 1) * *((_DWORD *)this + 87))), 4 * v31);
  return BatchBeepCanceller::storeReportPart2(this, a2);
}

BatchBeepCanceller *BatchBeepCanceller::storeReportPart1(BatchBeepCanceller *this, unsigned int a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  float *v7;
  float v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  float *v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  unsigned int v18;
  float v19;
  uint64_t v20;
  float *v21;
  float v22;

  v2 = *((_DWORD *)this + 66);
  if ((v2 & 4) != 0)
  {
    v3 = (*((_QWORD *)this + 18) - *((_QWORD *)this + 17)) >> 2;
    v4 = v3 + a2;
    v5 = 0.0;
    if (v4 > a2)
    {
      v6 = v4 - a2;
      v7 = (float *)(*((_QWORD *)this + 20) + 4 * a2);
      do
      {
        v8 = *v7++;
        v5 = v5 + (float)(v8 * v8);
        --v6;
      }
      while (v6);
      v5 = sqrtf(v5 / (float)v3);
    }
    *((float *)this + 69) = v5;
  }
  if ((v2 & 0x18) != 0)
  {
    v9 = ((*((_QWORD *)this + 18) - *((_QWORD *)this + 17)) >> 2) + a2;
    v10 = 0.0;
    if (v9 > a2)
    {
      v11 = v9 - a2;
      v12 = (float *)(*((_QWORD *)this + 20) + 4 * a2);
      do
      {
        v13 = *v12++;
        v14 = fabsf(v13);
        if (v10 < v14)
          v10 = v14;
        --v11;
      }
      while (v11);
    }
    *((float *)this + 70) = v10;
  }
  if ((v2 & 0x10) != 0)
  {
    v15 = (*((_QWORD *)this + 18) - *((_QWORD *)this + 17)) >> 2;
    v16 = v15 + a2;
    v17 = 0.0;
    if (v16 > a2)
    {
      v18 = 0;
      v20 = v16 - a2;
      v21 = (float *)(*((_QWORD *)this + 20) + 4 * a2);
      do
      {
        v22 = *v21++;
        v19 = *((float *)this + 70) * 0.95;
        if (fabsf(v22) > v19)
          ++v18;
        --v20;
      }
      while (v20);
      v17 = (float)v18 / (float)v15;
    }
    *((float *)this + 71) = v17;
  }
  return this;
}

BatchBeepCanceller *BatchBeepCanceller::storeReportPart2(BatchBeepCanceller *this, unsigned int a2)
{
  int v2;
  float *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  float *v14;
  float v15;

  v2 = *((_DWORD *)this + 66);
  if ((v2 & 1) != 0)
  {
    v3 = (float *)*((_QWORD *)this + 17);
    v4 = *((_QWORD *)this + 18) - (_QWORD)v3;
    v5 = v4 >> 2;
    if ((v4 >> 2))
    {
      v6 = (v4 >> 2);
      v7 = 0.0;
      do
      {
        v8 = *v3++;
        v7 = v7 + (float)(v8 * v8);
        --v6;
      }
      while (v6);
      v9 = sqrtf(v7 / (float)v5);
    }
    else
    {
      v9 = 0.0;
    }
    *((float *)this + 67) = v9;
    if ((v2 & 2) == 0)
      return this;
  }
  else if ((v2 & 2) == 0)
  {
    return this;
  }
  v10 = (*((_QWORD *)this + 18) - *((_QWORD *)this + 17)) >> 2;
  v11 = v10 + a2;
  v12 = 0.0;
  if (v11 > a2)
  {
    v13 = v11 - a2;
    v14 = (float *)(*((_QWORD *)this + 20) + 4 * a2);
    do
    {
      v15 = *v14++;
      v12 = v12 + (float)(v15 * v15);
      --v13;
    }
    while (v13);
    v12 = sqrtf(v12 / (float)v10);
  }
  *((float *)this + 68) = v12;
  return this;
}

void BatchBeepCanceller::BatchBeepCanceller(BatchBeepCanceller *this)
{
  *((_DWORD *)this + 20) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 213) = 0u;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_DWORD *)this + 64) = 0;
  *((_DWORD *)this + 72) = 4;
  *(_OWORD *)((char *)this + 292) = xmmword_1B50D76B0;
  *((_DWORD *)this + 77) = 2;
  *(_OWORD *)((char *)this + 312) = xmmword_1B50D76C0;
  *(_OWORD *)((char *)this + 328) = xmmword_1B50D7660;
  *((_QWORD *)this + 43) = 0x4000000001;
  *((_DWORD *)this + 88) = 16000;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *(_OWORD *)((char *)this + 440) = 0u;
  *((_QWORD *)this + 57) = 0;
  *((_OWORD *)this + 37) = 0u;
  *((_OWORD *)this + 38) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
}

{
  *((_DWORD *)this + 20) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 213) = 0u;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 31) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_DWORD *)this + 64) = 0;
  *((_DWORD *)this + 72) = 4;
  *(_OWORD *)((char *)this + 292) = xmmword_1B50D76B0;
  *((_DWORD *)this + 77) = 2;
  *(_OWORD *)((char *)this + 312) = xmmword_1B50D76C0;
  *(_OWORD *)((char *)this + 328) = xmmword_1B50D7660;
  *((_QWORD *)this + 43) = 0x4000000001;
  *((_DWORD *)this + 88) = 16000;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *(_OWORD *)((char *)this + 408) = 0u;
  *(_OWORD *)((char *)this + 424) = 0u;
  *(_OWORD *)((char *)this + 440) = 0u;
  *((_QWORD *)this + 57) = 0;
  *((_OWORD *)this + 37) = 0u;
  *((_OWORD *)this + 38) = 0u;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
}

uint64_t BatchBeepCanceller::initialize(BatchBeepCanceller *this, uint64_t a2, char *a3, unsigned int *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, unsigned int *a8, _DWORD *a9, _DWORD *a10)
{
  unint64_t v18;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  unsigned int v27;

  v18 = *a4;
  if (this != (BatchBeepCanceller *)a2)
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  if (BatchBeepCanceller::updateLDL(this, a4, a3))
    return 0xFFFFFFFFLL;
  v20 = *(char **)a2;
  v21 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  v22 = v21 >> 2;
  if (!(v21 >> 2))
  {
    *((_DWORD *)this + 61) = 0;
    return 4294967294;
  }
  v23 = (v21 >> 2);
  v24 = 0.0;
  do
  {
    v25 = *(float *)v20;
    v20 += 4;
    v24 = v24 + (float)(v25 * v25);
    --v23;
  }
  while (v23);
  v26 = sqrtf(v24 / (float)v22);
  *((float *)this + 61) = v26;
  if (v26 < 1.1755e-38)
    return 4294967294;
  *((_DWORD *)this + 20) = *a5;
  *((_DWORD *)this + 59) = *a6;
  *((_DWORD *)this + 58) = *a9;
  v27 = *a8;
  if (*a8 <= *a4)
    v27 = *a4;
  *((_DWORD *)this + 60) = v27;
  *((_DWORD *)this + 64) = *a10;
  std::vector<float>::resize((char **)this + 11, v18);
  std::vector<float>::resize((char **)this + 14, v18);
  std::vector<float>::resize((char **)this + 17, v18 + ((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2));
  std::vector<float>::resize((char **)this + 20, *a5 + *a7 + ((*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2));
  std::vector<float>::resize((char **)this + 24, (*a7 + *a5 + 1));
  *((_DWORD *)this + 56) = 0;
  BatchBeepCanceller::reset(this);
  *((_DWORD *)this + 65) = -4;
  *(_QWORD *)((char *)this + 268) = 0;
  *(_QWORD *)((char *)this + 276) = 0;
  *((_DWORD *)this + 71) = 0;
  BatchBeepCanceller::initNonlinearBeepCanceller(this);
  return 0;
}

void std::vector<float>::resize(char **a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  char *v19;

  v3 = *a1;
  v4 = a1[1];
  v5 = (v4 - *a1) >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v19 = &v3[4 * a2];
    goto LABEL_15;
  }
  v6 = a2 - v5;
  v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 2)
  {
    bzero(a1[1], 4 * v6);
    v19 = &v4[4 * v6];
LABEL_15:
    a1[1] = v19;
    return;
  }
  if (a2 >> 62)
    std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
  v8 = v7 - v3;
  v9 = v8 >> 1;
  if (v8 >> 1 <= a2)
    v9 = a2;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
    v10 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v10);
  v12 = *a1;
  v13 = a1[1];
  v14 = &v11[4 * v5];
  v16 = &v11[4 * v15];
  bzero(v14, 4 * v6);
  v17 = &v14[4 * v6];
  while (v13 != v12)
  {
    v18 = *((_DWORD *)v13 - 1);
    v13 -= 4;
    *((_DWORD *)v14 - 1) = v18;
    v14 -= 4;
  }
  *a1 = v14;
  a1[1] = v17;
  a1[2] = v16;
  if (v12)
    operator delete(v12);
}

uint64_t BatchBeepCanceller::updateLDL(BatchBeepCanceller *this, const unsigned int *a2, const char *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  float *v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  _DWORD *v18;
  int v19;
  _DWORD *v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  void *__p[3];
  void *v26[3];

  if (a3 && *a3)
    return 0xFFFFFFFFLL;
  std::vector<float>::vector(v26, *a2);
  v6 = *a2;
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)this;
    v9 = (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2;
    v10 = (float *)v26[0];
    do
    {
      v11 = 0.0;
      if (v9 > v7)
      {
        v12 = 0;
        v13 = v7;
        do
        {
          v11 = v11 + (float)(*(float *)(v8 + 4 * v13) * *(float *)(v8 + 4 * v12));
          v13 = (v7 + v12++ + 1);
        }
        while (v9 > v13);
      }
      v14 = 1.0 / (double)v9 * v11;
      v10[v7++] = v14;
    }
    while (v7 != v6);
  }
  std::vector<float>::vector(__p, (v6 * v6));
  v15 = *a2;
  if ((_DWORD)v15)
  {
    v16 = 0;
    v17 = 0;
    v18 = v26[0];
    v19 = v15 + 1;
    v20 = __p[0];
    v21 = *a2;
    v22 = *a2;
    do
    {
      v20[(v19 * v17++)] = *v18;
      if (v17 < v15)
      {
        v23 = v21;
        v24 = 1;
        do
        {
          v20[(v16 + v24)] = v18[v24];
          v20[v23] = v18[v24++];
          v23 += v15;
        }
        while (v22 != (_DWORD)v24);
      }
      --v22;
      v21 += v19;
      v16 += v19;
    }
    while (v17 != v15);
  }
  LDLDecomposition::decompose((uint64_t)this + 24, (uint64_t *)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  return 0;
}

void sub_1B509B11C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void BatchBeepCanceller::initNonlinearBeepCanceller(BatchBeepCanceller *this)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _DWORD **v9;
  int v10;
  uint64_t *v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char *v20;
  uint64_t v21;
  _DWORD **v22;
  int v23;
  uint64_t *v24;
  _DWORD *v25;
  _DWORD *v26;
  uint64_t v27;
  int v28;

  v2 = (uint64_t *)((char *)this + 360);
  if (*((_QWORD *)this + 45))
    std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100]((uint64_t *)this + 45, 0);
  v3 = operator new();
  *(_DWORD *)v3 = 4;
  *(_OWORD *)(v3 + 4) = xmmword_1B50D7630;
  *(_OWORD *)(v3 + 20) = xmmword_1B50D7640;
  *(_OWORD *)(v3 + 36) = xmmword_1B50D7650;
  *(_OWORD *)(v3 + 52) = xmmword_1B50D7660;
  *(_QWORD *)(v3 + 68) = 0x4000000001;
  *(_DWORD *)(v3 + 76) = 16000;
  *(_OWORD *)(v3 + 84) = xmmword_1B50D7670;
  *(_QWORD *)(v3 + 108) = 0x1E3CE50800000000;
  *(_QWORD *)(v3 + 100) = 0x3F0000003B000000;
  bzero((void *)(v3 + 116), 0x2E4uLL);
  std::unique_ptr<NonlinearBeepCanceller>::reset[abi:ne180100](v2, v3);
  NonlinearBeepCanceller::nl_init(*((NonlinearBeepCanceller **)this + 45), *((_DWORD *)this + 72), *((float *)this + 73), *((float *)this + 74), *((float *)this + 75), *((float *)this + 76), (float)*((unsigned int *)this + 77), *((float *)this + 78), *((float *)this + 79), *((float *)this + 80), *((_DWORD *)this + 82), *((_DWORD *)this + 83), *((_DWORD *)this + 84), *((_DWORD *)this + 85), *((_DWORD *)this + 86), *((_DWORD *)this + 87), *((float *)this + 81), *((_DWORD *)this + 88));
  *((_QWORD *)this + 59) = 0x200000050;
  vDSP_svesq(*(const float **)this, 1, (float *)this + 116, (uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2);
  v4 = *((_DWORD *)this + 87)
     * vcvtps_u32_f32((float)(*((_DWORD *)this + 118)+ ((*((_QWORD *)this + 1) - *(_QWORD *)this) >> 2)+ 2 * *((_DWORD *)this + 84) * *((_DWORD *)this + 87) * *((_DWORD *)this + 119))/ (float)*((unsigned int *)this + 87));
  v28 = 0;
  std::vector<float>::assign((char **)this + 46, v4, &v28);
  v28 = 0;
  std::vector<float>::assign((char **)this + 49, v4, &v28);
  memcpy((void *)(*((_QWORD *)this + 46)+ 4* (*((_DWORD *)this + 84) * *((_DWORD *)this + 119) * *((_DWORD *)this + 87)- *((_DWORD *)this + 118))), *(const void **)this, *((_QWORD *)this + 1) - *(_QWORD *)this);
  v28 = 0;
  std::vector<float>::assign((char **)this + 52, v4, &v28);
  v28 = 0;
  std::vector<float>::assign((char **)this + 55, v4, &v28);
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)this + 528, 4u, *((_DWORD *)this + 85), *((_DWORD *)this + 87));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)this + 552, 2u, *((_DWORD *)this + 86), *((_DWORD *)this + 87));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 72, 4u, (16 * *((_DWORD *)this + 85)) | 8u);
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)this + 75, 2u, (16 * *((_DWORD *)this + 86)) | 8u);
  v5 = 0;
  v6 = *((unsigned int *)this + 85);
  do
  {
    v7 = (char *)this + 8 * v5;
    *((_QWORD *)v7 + 60) = *(_QWORD *)(*((_QWORD *)this + 72) + 24 * v5);
    if ((_DWORD)v6)
    {
      v8 = 0;
      v9 = (_DWORD **)(v7 + 480);
      v10 = 4 * *((_DWORD *)this + 87);
      v11 = *(uint64_t **)(*((_QWORD *)this + 66) + 24 * v5);
      do
      {
        v12 = *v9;
        *v12 = v6;
        v13 = &v12[v8];
        v13[2] = 1;
        v13[3] = v10;
        v14 = *v11;
        v11 += 3;
        *((_QWORD *)v13 + 2) = v14;
        v8 += 4;
      }
      while (4 * v6 != v8);
    }
    ++v5;
  }
  while (v5 != 4);
  v15 = 0;
  v16 = *((unsigned int *)this + 86);
  v17 = *((_QWORD *)this + 75);
  v18 = 1;
  do
  {
    v19 = v18;
    v20 = (char *)this + 8 * v15;
    *((_QWORD *)v20 + 64) = *(_QWORD *)(v17 + 24 * v15);
    if ((_DWORD)v16)
    {
      v21 = 0;
      v22 = (_DWORD **)(v20 + 512);
      v23 = 4 * *((_DWORD *)this + 87);
      v24 = *(uint64_t **)(*((_QWORD *)this + 69) + 24 * v15);
      do
      {
        v25 = *v22;
        *v25 = v16;
        v26 = &v25[v21];
        v26[2] = 1;
        v26[3] = v23;
        v27 = *v24;
        v24 += 3;
        *((_QWORD *)v26 + 2) = v27;
        v21 += 4;
      }
      while (4 * v16 != v21);
    }
    v18 = 0;
    v15 = 1;
  }
  while ((v19 & 1) != 0);
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t *a1, unsigned int a2, size_t __sz)
{
  int v3;
  unint64_t v5;
  size_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  size_t v23;
  _BYTE *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;

  v3 = __sz;
  v5 = a2;
  v6 = __sz;
  v7 = (char *)operator new(__sz);
  v8 = v7;
  v9 = 0;
  v10 = (uint64_t)&v7[v3];
  do
    v7[v9++] = 0;
  while (v6 != v9);
  v11 = a1[2];
  v12 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v11 - *a1) >> 3) < v5)
  {
    if (v12)
    {
      std::vector<std::vector<float>>::__clear[abi:ne180100](a1);
      operator delete((void *)*a1);
      v11 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    v13 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 3);
    v14 = 2 * v13;
    if (2 * v13 <= v5)
      v14 = v5;
    if (v13 >= 0x555555555555555)
      v15 = 0xAAAAAAAAAAAAAAALL;
    else
      v15 = v14;
    if (v15 > 0xAAAAAAAAAAAAAAALL)
      std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
    v16 = operator new(24 * v15);
    *a1 = (uint64_t)v16;
    a1[1] = (uint64_t)v16;
    a1[2] = (uint64_t)&v16[3 * v15];
    v17 = &v16[3 * v5];
    v18 = 24 * v5;
    do
    {
      *v16 = 0;
      v16[1] = 0;
      v16[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v16, v8, v10, v6);
      v16 += 3;
      v18 -= 24;
    }
    while (v18);
    goto LABEL_41;
  }
  v33 = (a1[1] - v12) / 24;
  v34 = v5;
  if (v33 >= v5)
    v19 = v5;
  else
    v19 = (a1[1] - v12) / 24;
  for (; v19; --v19)
  {
    v20 = *(_QWORD *)(v12 + 16);
    v21 = *(char **)v12;
    if (v20 - *(_QWORD *)v12 >= v6)
    {
      v24 = *(_BYTE **)(v12 + 8);
      v25 = v24 - v21;
      if (v24 - v21 < v6)
      {
        if (v24 != v21)
        {
          memmove(*(void **)v12, v8, v24 - v21);
          v21 = *(char **)(v12 + 8);
        }
        if (v25 != v6)
          memmove(v21, &v8[v25], v10 - (_QWORD)&v8[v25]);
        *(_QWORD *)(v12 + 8) = &v21[v10 - (_QWORD)&v8[v25]];
        goto LABEL_37;
      }
    }
    else
    {
      if (v21)
      {
        *(_QWORD *)(v12 + 8) = v21;
        operator delete(v21);
        v20 = 0;
        *(_QWORD *)v12 = 0;
        *(_QWORD *)(v12 + 8) = 0;
        *(_QWORD *)(v12 + 16) = 0;
      }
      v22 = 2 * v20;
      if (2 * v20 <= v6)
        v22 = v6;
      if (v20 >= 0x3FFFFFFFFFFFFFFFLL)
        v23 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v23 = v22;
      std::vector<unsigned char>::__vallocate[abi:ne180100]((_QWORD *)v12, v23);
      v21 = *(char **)(v12 + 8);
    }
    if (v3)
      memmove(v21, v8, v6);
    *(_QWORD *)(v12 + 8) = &v21[v6];
LABEL_37:
    v12 += 24;
  }
  if (v34 > v33)
  {
    v26 = (_QWORD *)a1[1];
    v17 = &v26[3 * (v34 - v33)];
    v27 = 24 * v34 - 24 * v33;
    do
    {
      *v26 = 0;
      v26[1] = 0;
      v26[2] = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v26, v8, v10, v6);
      v26 += 3;
      v27 -= 24;
    }
    while (v27);
LABEL_41:
    a1[1] = (uint64_t)v17;
    goto LABEL_48;
  }
  v28 = a1[1];
  v29 = *a1 + 24 * v34;
  if (v28 != v29)
  {
    v30 = a1[1];
    do
    {
      v32 = *(void **)(v30 - 24);
      v30 -= 24;
      v31 = v32;
      if (v32)
      {
        *(_QWORD *)(v28 - 16) = v31;
        operator delete(v31);
      }
      v28 = v30;
    }
    while (v30 != v29);
  }
  a1[1] = v29;
LABEL_48:
  operator delete(v8);
}

void sub_1B509B7AC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B509B830(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1B509B8E0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t LDLDecomposition::decompose(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  char *v14;
  uint64_t v15;
  float v16;
  uint64_t i;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t j;

  *(_DWORD *)(a1 + 48) = 0;
  v4 = a2[1] - *a2;
  v5 = v4 >> 2;
  v6 = -1;
  do
    ++v6;
  while (v6 * v6 < v5);
  result = 0xFFFFFFFFLL;
  if (v6 && v6 * v6 == (_DWORD)v5)
  {
    std::vector<float>::resize((char **)a1, (v4 >> 2));
    std::vector<float>::resize((char **)(a1 + 24), v6);
    v8 = 0;
    v9 = 0;
    *(_DWORD *)(a1 + 48) = v6;
    v10 = *a2;
    v11 = *(_QWORD *)(a1 + 24);
    v12 = 1;
    v13 = v6;
    v14 = *(char **)a1;
    do
    {
      v15 = v9 + v6 * (_DWORD)v9;
      v16 = *(float *)(v10 + 4 * v15);
      *(float *)(v11 + 4 * v9) = v16;
      if (v9)
      {
        for (i = 0; i != v9; ++i)
        {
          v16 = v16
              + (float)((float)-(float)(*(float *)&v14[4 * (v8 + i)]
                                      * *(float *)&v14[4 * (v8 + i)])
                      * *(float *)(v11 + 4 * i));
          *(float *)(v11 + 4 * v9) = v16;
        }
      }
      v18 = v9 + 1;
      v19 = v13;
      v20 = v12;
      if (v9 + 1 < (unint64_t)v6)
      {
        do
        {
          v21 = v9 + v6 * (_DWORD)v20;
          v22 = *(float *)(v10 + 4 * v21);
          if (v9)
          {
            for (j = 0; j != v9; ++j)
              v22 = v22
                  + (float)((float)-(float)(*(float *)&v14[4 * v19 + 4 * j]
                                          * *(float *)&v14[4 * (v8 + j)])
                          * *(float *)(v11 + 4 * j));
          }
          *(float *)&v14[4 * v21] = v22 / *(float *)(v11 + 4 * v9);
          ++v20;
          v19 += v6;
        }
        while (v20 != v6);
      }
      *(_DWORD *)&v14[4 * v15] = 1065353216;
      ++v12;
      v8 += v6;
      v13 += v6;
      ++v9;
    }
    while (v18 != v6);
    return 0;
  }
  return result;
}

void LDLDecomposition::LDLDecomposition(LDLDecomposition *this)
{
  *((_DWORD *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

{
  *((_DWORD *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

uint64_t LDLDecomposition::wholeSquareRoot(LDLDecomposition *this, unsigned int a2)
{
  unsigned int v2;

  v2 = -1;
  do
    ++v2;
  while (v2 * v2 < a2);
  if (v2 * v2 == a2)
    return v2;
  else
    return 0;
}

uint64_t LDLDecomposition::ldl_solve(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  float v22;
  unsigned int v23;
  int v24;
  float *v25;
  float v26;

  if (!*((_DWORD *)a1 + 12))
    return 0xFFFFFFFFLL;
  v3 = *a2;
  v4 = a2[1] - *a2;
  v5 = *a3;
  if ((v4 & 0x3FFFFFFFCLL) != 0)
  {
    v6 = 0;
    v7 = 0;
    v8 = v4 >> 2;
    v9 = *a1;
    v10 = (v4 >> 2);
    do
    {
      v11 = *(float *)(v3 + 4 * v7);
      *(float *)(v5 + 4 * v7) = v11;
      if (v7)
      {
        for (i = 0; i != v7; ++i)
        {
          v11 = v11 - (float)(*(float *)(v9 + 4 * (v6 + i)) * *(float *)(v5 + 4 * i));
          *(float *)(v5 + 4 * v7) = v11;
        }
      }
      ++v7;
      v6 += v8;
    }
    while (v7 != v10);
  }
  v13 = a3[1] - v5;
  if (v13)
  {
    v14 = 0;
    v15 = a1[3];
    do
    {
      *(float *)(v5 + 4 * v14) = *(float *)(v5 + 4 * v14) / *(float *)(v15 + 4 * v14);
      ++v14;
    }
    while (v13 >> 2 > (unint64_t)v14);
  }
  v16 = (unint64_t)v13 >> 2;
  if ((_DWORD)v16)
  {
    v17 = 0;
    v18 = v16 - 1;
    v19 = *a1;
    v20 = v16 - 1 + v16 * v16;
    v21 = v16;
    do
    {
      if (v21 < v16)
      {
        v22 = *(float *)(v5 + 4 * v18);
        v23 = v20;
        v24 = v17;
        v25 = (float *)(v5 + 4 * v21);
        do
        {
          v26 = *v25++;
          v22 = v22 - (float)(*(float *)(v19 + 4 * v23) * v26);
          *(float *)(v5 + 4 * v18) = v22;
          v23 += v16;
          --v24;
        }
        while (v24);
      }
      --v18;
      --v21;
      ++v17;
      v20 += ~(_DWORD)v16;
    }
    while (v18 < v16);
  }
  return 0;
}

float BatchBeepCanceller::rms(_QWORD *a1, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  float *v5;
  float v6;
  float v7;

  v2 = (a1[1] - *a1) >> 2;
  v3 = v2 - a2;
  if (v2 <= a2)
    return 0.0;
  v4 = a2 - (unint64_t)v2;
  v5 = (float *)(*a1 + 4 * a2);
  v6 = 0.0;
  do
  {
    v7 = *v5++;
    v6 = v6 + (float)(v7 * v7);
  }
  while (!__CFADD__(v4++, 1));
  return sqrtf(v6 / (float)v3);
}

BatchBeepCanceller *BatchBeepCanceller::resetBeepInfo(BatchBeepCanceller *this, int a2)
{
  *((_DWORD *)this + 65) = a2;
  *((_DWORD *)this + 71) = 0;
  *(_QWORD *)((char *)this + 268) = 0;
  *(_QWORD *)((char *)this + 276) = 0;
  return this;
}

uint64_t BatchBeepCanceller::feed(BatchBeepCanceller *this, const __int16 *a2, unsigned int a3, const __int16 **a4)
{
  *a4 = 0;
  return 0;
}

BatchBeepCanceller *BatchBeepCanceller::beepComing(BatchBeepCanceller *this, int a2)
{
  if (!*((_BYTE *)this + 228))
  {
    *((_DWORD *)this + 65) = -3;
    *((_DWORD *)this + 71) = 0;
    *(_QWORD *)((char *)this + 268) = 0;
    *(_QWORD *)((char *)this + 276) = 0;
  }
  *((_DWORD *)this + 56) = a2 + 1;
  return this;
}

BatchBeepCanceller *BatchBeepCanceller::recordBeepInfo(BatchBeepCanceller *this, char a2)
{
  *((_DWORD *)this + 65) = -4;
  *((_DWORD *)this + 71) = 0;
  *(_QWORD *)((char *)this + 268) = 0;
  *(_QWORD *)((char *)this + 276) = 0;
  *((_DWORD *)this + 66) = a2 & 0x1F;
  return this;
}

uint64_t BatchBeepCanceller::lastBeepInfo(uint64_t a1, _OWORD *a2)
{
  __int128 v2;

  if (a2)
  {
    v2 = *(_OWORD *)(a1 + 260);
    *(_OWORD *)((char *)a2 + 12) = *(_OWORD *)(a1 + 272);
    *a2 = v2;
  }
  return *(unsigned int *)(a1 + 260);
}

BatchBeepCanceller *BatchBeepCanceller::doBatchCancel(BatchBeepCanceller *this, unsigned int a2)
{
  void *v4;
  char *v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v5 = (char *)this + 112;
  v4 = (void *)*((_QWORD *)this + 14);
  v6 = *((_DWORD *)v5 + 30);
  v7 = a2 >= v6;
  v8 = a2 - v6;
  if (v7)
    v9 = v8;
  else
    v9 = 0;
  v10 = *((_QWORD *)v5 + 1) - (_QWORD)v4;
  if (v10)
    memmove(v4, (const void *)(*((_QWORD *)this + 24) + 4 * v9), 4 * ((v10 >> 2) + v9) - 4 * v9);
  LDLDecomposition::ldl_solve((uint64_t *)this + 3, (uint64_t *)v5, (uint64_t *)this + 11);
  *(_QWORD *)((char *)this + 268) = 0;
  *(_QWORD *)((char *)this + 276) = 0;
  *((_DWORD *)this + 71) = 0;
  *((_DWORD *)this + 65) = a2;
  BatchBeepCanceller::storeReportPart1(this, v9);
  BatchBeepCanceller::convolve((uint64_t *)this + 17, (uint64_t *)this, (uint64_t *)this + 11);
  v11 = *((_QWORD *)this + 17);
  v12 = *((_QWORD *)this + 18);
  v13 = v12 - v11;
  if (v12 != v11)
  {
    v14 = 0;
    v15 = v13 >> 2;
    v16 = *((_QWORD *)this + 20);
    do
    {
      *(float *)(v16 + 4 * (v9 + v14)) = *(float *)(v16 + 4 * (v9 + v14))
                                                       - *(float *)(v11 + 4 * v14);
      ++v14;
    }
    while (v15 > v14);
  }
  return BatchBeepCanceller::storeReportPart2(this, v9);
}

uint64_t *BatchBeepCanceller::convolve(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  float v15;
  unint64_t v16;

  v3 = *result;
  v4 = result[1] - *result;
  if (v4)
  {
    v5 = 0;
    v6 = v4 >> 2;
    v7 = *a2;
    v8 = (unint64_t)(a2[1] - *a2) >> 2;
    v9 = *a3;
    v10 = (unint64_t)(a3[1] - *a3) >> 2;
    v11 = 1;
    do
    {
      if (v11 >= v8)
        result = (uint64_t *)(v11 - v8);
      else
        result = 0;
      v12 = v5 + 1;
      if ((int)v5 + 1 >= v8)
        v13 = v5 + 1 - v8;
      else
        v13 = 0;
      if (v12 >= v10)
        v14 = v10;
      else
        v14 = v12;
      v15 = 0.0;
      if (v13 < v14)
      {
        result = (uint64_t *)(v5 - (_QWORD)result);
        LODWORD(v16) = v11 - v8;
        if (v11 >= v8)
          v16 = v16;
        else
          v16 = 0;
        do
        {
          v15 = v15 + (float)(*(float *)(v9 + 4 * v16++) * *(float *)(v7 + 4 * result));
          result = (uint64_t *)((char *)result - 1);
        }
        while (v16 < v14);
      }
      *(float *)(v3 + 4 * v5) = v15;
      ++v11;
      ++v5;
    }
    while (v6 > v12);
  }
  return result;
}

float BatchBeepCanceller::rms(_QWORD *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v3;
  float *v4;
  float v5;
  float v6;

  if (a3 <= a2)
    return 0.0;
  v3 = a3 - (unint64_t)a2;
  v4 = (float *)(*a1 + 4 * a2);
  v5 = 0.0;
  do
  {
    v6 = *v4++;
    v5 = v5 + (float)(v6 * v6);
    --v3;
  }
  while (v3);
  return sqrtf(v5 / (float)(a3 - a2));
}

_QWORD *BatchBeepCanceller::maxabs(_QWORD *result, unsigned int a2, unsigned int a3)
{
  float v3;
  unint64_t v4;
  float *v5;
  float v6;
  float v7;

  v3 = 0.0;
  if (a2 < a3)
  {
    v4 = a3 - (unint64_t)a2;
    v5 = (float *)(*result + 4 * a2);
    do
    {
      v6 = *v5++;
      v7 = fabsf(v6);
      if (v3 < v7)
        v3 = v7;
      --v4;
    }
    while (v4);
  }
  return result;
}

float BatchBeepCanceller::proportionAbsAboveBound(_QWORD *a1, unsigned int a2, unsigned int a3, float a4)
{
  float v4;
  unsigned int v5;
  unint64_t v6;
  float *v7;
  float v8;

  v4 = 0.0;
  if (a3 > a2)
  {
    v5 = 0;
    v6 = a3 - (unint64_t)a2;
    v7 = (float *)(*a1 + 4 * a2);
    do
    {
      v8 = *v7++;
      if (fabsf(v8) > a4)
        ++v5;
      --v6;
    }
    while (v6);
    return (float)v5 / (float)(a3 - a2);
  }
  return v4;
}

void sub_1B509C6F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B509E478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B509E608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AFLanguageDidChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_didReceiveLanguageCodeUpdate");
}

void sub_1B50A0FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7703(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7704(uint64_t a1)
{

}

void sub_1B50A26A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id getkSymptomDiagnosticReplySuccess()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  v7 = getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySuccessSymbolLoc_ptr)
  {
    v1 = (void *)SymptomDiagnosticReporterLibrary();
    v0 = (id *)dlsym(v1, "kSymptomDiagnosticReplySuccess");
    v5[3] = (uint64_t)v0;
    getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSymptomDiagnosticReplySessionID()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
  v7 = getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr)
  {
    v1 = (void *)SymptomDiagnosticReporterLibrary();
    v0 = (id *)dlsym(v1, "kSymptomDiagnosticReplySessionID");
    v5[3] = (uint64_t)v0;
    getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSymptomDiagnosticReplyReason()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  v7 = getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonSymbolLoc_ptr)
  {
    v1 = (void *)SymptomDiagnosticReporterLibrary();
    v0 = (id *)dlsym(v1, "kSymptomDiagnosticReplyReason");
    v5[3] = (uint64_t)v0;
    getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkSymptomDiagnosticReplyReasonString()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  v7 = getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr)
  {
    v1 = (void *)SymptomDiagnosticReporterLibrary();
    v0 = (id *)dlsym(v1, "kSymptomDiagnosticReplyReasonString");
    v5[3] = (uint64_t)v0;
    getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t SymptomDiagnosticReporterLibrary()
{
  uint64_t v0;
  void *v2;

  if (SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
    return SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
  SymptomDiagnosticReporterLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getSDRDiagnosticReporterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  SymptomDiagnosticReporterLibrary();
  result = objc_getClass("SDRDiagnosticReporter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSDRDiagnosticReporterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)abort_report_np();
    return (Class)+[CSDiagnosticReporter sharedInstance](v3, v4);
  }
  return result;
}

uint64_t HandleDeviceLockStateChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "screenLockStateChanged");
}

void sub_1B50A9B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B50AB414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B50AD104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B50AE9AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B50AEEB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B50AF074(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50AF494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B50AF704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50AF9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B50B1404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B50B1530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSAdamSpeechMetricsManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B50B1748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1B50B19A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void ___Z37AudioDataAnalysisManagerLibraryLoaderv_block_invoke()
{
  void *v0;
  char *v1;
  int v2;
  char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = dlopen("/usr/lib/libAudioIssueDetector.dylib", 1);
  if (v0)
    goto LABEL_5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = 136315138;
    v3 = dlerror();
    _os_log_error_impl(&dword_1B502E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "dlerror : libAudioIssueDetector ADAM: %s", (uint8_t *)&v2, 0xCu);
  }
  v0 = dlopen("/usr/local/lib/libAudioIssueDetector.dylib", 1);
  if (v0)
  {
LABEL_5:
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "AudioDataAnalysisManagerCreate");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v0, "AudioDataAnalysisManagerDispose");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerReset");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "AudioDataAnalysisManagerUpdateReportingSessions");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioDataAnalysisManagerCreateNodePCM");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerCreateNodeSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerRemoveNode");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v0, "AudioDataAnalysisManagerInitialize");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerIsSessionInitialized");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioDataAnalysisManagerProcessAudio");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerProcessSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerCreateNodeEnvSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerCreateNodeEnvSoundClass");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerProcessEnvSPL");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerProcessEnvSoundClass");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerSetDeviceInfo");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerRegisterDeviceInfo");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerSetDeviceConnectionState");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerStartServices");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerConnectedWiredDeviceIsHeadphone");
    AudioDataAnalysisManagerLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioDataAnalysisManagerSetApplicationBundleID");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v1 = dlerror();
    v2 = 136315138;
    v3 = v1;
    _os_log_error_impl(&dword_1B502E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "dlerror : libAudioIssueDetector ADAM: %s", (uint8_t *)&v2, 0xCu);
  }
}

unint64_t isDNSAvailable()
{
  unint64_t v0;

  if (!nwi_state_copy())
    return 0;
  if (nwi_state_get_first_ifstate() && (nwi_ifstate_get_flags() & 4) != 0)
  {
    v0 = 1;
  }
  else if (nwi_state_get_first_ifstate())
  {
    v0 = ((unint64_t)nwi_ifstate_get_flags() >> 2) & 1;
  }
  else
  {
    v0 = 0;
  }
  nwi_state_release();
  return v0;
}

void sub_1B50B51D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_1B50B53F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9851(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9852(uint64_t a1)
{

}

uint64_t _vtPhraseTypeDidChangeNotificationReceived(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vtPhraseTypeDidChangeNotificationReceived");
}

void sub_1B50B6B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B50B6C70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50B6D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B50B7448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B50B79DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B50B7ABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50B7B9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B50B7D1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B50B7FD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B50B8494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  void *v23;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B50B851C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  NSObject *v9;

  if (a2)
  {
    __cxa_begin_catch(a1);
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315138;
      *(_QWORD *)((char *)&a9 + 4) = "-[CSKeywordAnalyzerQuasar _recognizeWavData:length:]";
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s recognizeWavData failed", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1B50B84F0);
  }
  _Unwind_Resume(a1);
}

void sub_1B50B89C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B50B8B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1B50B8DD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B50B91C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50B94AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B50B9668(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10200(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10201(uint64_t a1)
{

}

void sub_1B50B9774(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  NSObject *v9;

  if (a2)
  {
    __cxa_begin_catch(a1);
    v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315138;
      *(_QWORD *)((char *)&a9 + 4) = "-[CSKeywordAnalyzerQuasar endAudio]_block_invoke";
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s endAudio failed", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1B50B9748);
  }
  _Unwind_Resume(a1);
}

void sub_1B50B9A90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B50BA4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B50BC90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10430(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10431(uint64_t a1)
{

}

void sub_1B50BE4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10693(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10694(uint64_t a1)
{

}

void sub_1B50C0A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B50C1BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _jarvisTriggerModeDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_notifyJarvisTriggerModeDidChanged");
}

uint64_t __Block_byref_object_copy__11163(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11164(uint64_t a1)
{

}

void sub_1B50C4388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11238(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11239(uint64_t a1)
{

}

void sub_1B50C4F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaSafetyNetLibrary()
{
  uint64_t v0;
  void *v2;

  if (MediaSafetyNetLibraryCore_frameworkLibrary)
    return MediaSafetyNetLibraryCore_frameworkLibrary;
  MediaSafetyNetLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MediaSafetyNetLibraryCore_frameworkLibrary;
  if (!MediaSafetyNetLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1B50C5238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B50C6848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B50C6D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B50C95F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _BTAccessoryEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "accessoryManager:accessoryEvent:device:accessoryState:", a1, a2, a3, a4);
}

uint64_t _BTLocalDeviceStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "localDevice:event:result:", a1, a2, a3);
}

uint64_t _BTServiceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return objc_msgSend(a6, "device:serviceMask:serviceEventType:serviceSpecificEvent:result:", a1, a2, a3, a4, a5);
}

void _BTSessionEventCallback(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  if ((a2 - 2) < 2)
  {
    v8 = v7;
    objc_msgSend(v7, "_sessionTerminated:", a1);
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    v8 = v7;
    objc_msgSend(v7, "_sessionDetached:", a1);
    goto LABEL_7;
  }
  if (!a2)
  {
    v8 = v7;
    objc_msgSend(v7, "_sessionAttached:result:", a1, a3);
LABEL_7:
    v7 = v8;
  }

}

uint64_t __Block_byref_object_copy__11930(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11931(uint64_t a1)
{

}

uint64_t sub_1B50CBC00()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1B50CBC0C()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1B50CBC18()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1B50CBC24()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B50CBC30()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B50CBC3C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B50CBC48()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B50CBC54()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B50CBC60()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B50CBC6C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B50CBC78()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B50CBC84()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B50CBC90()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B50CBC9C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B50CBCA8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B50CBCB4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B50CBCC0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B50CBCCC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B50CBCD8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t ADPAssertionCreateWithDispatchQueue()
{
  return MEMORY[0x1E0CFCE30]();
}

uint64_t ADPAssertionDestroy()
{
  return MEMORY[0x1E0CFCE38]();
}

uint64_t ADPAssertionSetCancelHandler()
{
  return MEMORY[0x1E0CFCE40]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x1E0CFE410]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x1E0CFE428]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x1E0CFE450]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1E0CFE458]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1E0CFE470]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4C8]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1E0CFE588]();
}

uint64_t AFPreferencesAssistantEnabled()
{
  return MEMORY[0x1E0CFE5B0]();
}

uint64_t AFPreferencesMobileUserSessionLanguage()
{
  return MEMORY[0x1E0CFE5C8]();
}

uint64_t AFPreferencesStartAlertEnabled()
{
  return MEMORY[0x1E0CFE5D8]();
}

uint64_t AFUserSupportDirectoryPath()
{
  return MEMORY[0x1E0CFE790]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1E0CFF450](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x1E0CFF458](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1E0CFF478](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0CFF4A0](inAudioConverter, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioHardwareGetProperty(AudioHardwarePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C975B8](*(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x1E0C975D0](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x1E0C975D8](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, outDataSize);
}

uint64_t BNNSDataLayoutGetRank()
{
  return MEMORY[0x1E0C8B530]();
}

uint64_t BNNSGraphCompileFromFile_v2()
{
  return MEMORY[0x1E0C8B730]();
}

uint64_t BNNSGraphCompileOptionsDestroy()
{
  return MEMORY[0x1E0C8B748]();
}

uint64_t BNNSGraphCompileOptionsMakeDefault()
{
  return MEMORY[0x1E0C8B768]();
}

uint64_t BNNSGraphCompileOptionsSetFileWriteFSyncBarrier()
{
  return MEMORY[0x1E0C8B788]();
}

uint64_t BNNSGraphCompileOptionsSetGenerateDebugInfo()
{
  return MEMORY[0x1E0C8B790]();
}

uint64_t BNNSGraphCompileOptionsSetOptimizationPreference()
{
  return MEMORY[0x1E0C8B7C0]();
}

uint64_t BNNSGraphCompileOptionsSetOutputPathWithPermissionsAndProtectionClass()
{
  return MEMORY[0x1E0C8B7D0]();
}

uint64_t BNNSGraphCompileOptionsSetPredefinedOptimizations()
{
  return MEMORY[0x1E0C8B7E0]();
}

uint64_t BNNSGraphCompileOptionsSetTargetSingleThread()
{
  return MEMORY[0x1E0C8B7F8]();
}

uint64_t BNNSGraphCompileOptionsSetWeightsPathWithPermissions()
{
  return MEMORY[0x1E0C8B810]();
}

uint64_t BNNSGraphContextDestroy_v2()
{
  return MEMORY[0x1E0C8B820]();
}

uint64_t BNNSGraphContextExecute_v2()
{
  return MEMORY[0x1E0C8B830]();
}

uint64_t BNNSGraphContextGetTensorDescriptor_v2()
{
  return MEMORY[0x1E0C8B850]();
}

uint64_t BNNSGraphContextMake()
{
  return MEMORY[0x1E0C8B868]();
}

uint64_t BNNSGraphContextSetWeights()
{
  return MEMORY[0x1E0C8B8C0]();
}

uint64_t BNNSGraphGetInputCount()
{
  return MEMORY[0x1E0C8B918]();
}

uint64_t BNNSGraphGetInputNames_v2()
{
  return MEMORY[0x1E0C8B928]();
}

uint64_t BNNSGraphGetOutputCount()
{
  return MEMORY[0x1E0C8B938]();
}

uint64_t BNNSGraphGetOutputNames_v2()
{
  return MEMORY[0x1E0C8B948]();
}

uint64_t BNNSGraphGetWorkspaceSize_v2()
{
  return MEMORY[0x1E0C8B958]();
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x1E0D4E0E8]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger()
{
  return MEMORY[0x1E0D4E100]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x1E0D4E138]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1E0D4E1A0]();
}

uint64_t BTDeviceAddressToString()
{
  return MEMORY[0x1E0D4E1A8]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x1E0D4E1C8]();
}

uint64_t BTDeviceFromIdentifier()
{
  return MEMORY[0x1E0D4E1D8]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x1E0D4E1F0]();
}

uint64_t BTDeviceIsTemporaryPairedNotInContacts()
{
  return MEMORY[0x1E0D4E250]();
}

uint64_t BTDeviceSupportsHS()
{
  return MEMORY[0x1E0D4E258]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x1E0D4E288]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x1E0D4E2A0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x1E0D4E2C8]();
}

uint64_t BTLocalDeviceGetSharingAddresses()
{
  return MEMORY[0x1E0D4E2F0]();
}

uint64_t BTLocalDeviceIsSharingEnabled()
{
  return MEMORY[0x1E0D4E2F8]();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return MEMORY[0x1E0D4E320]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x1E0D4E390]();
}

uint64_t BTServiceRemoveCallbacks()
{
  return MEMORY[0x1E0D4E3A8]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1E0D4E3B8]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x1E0D4E3C0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E20]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C8]();
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1E0CFA900]();
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0CFF630](inURL, *(_QWORD *)&inFileType, inStreamDesc, inChannelLayout, *(_QWORD *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1E0CFF638](inExtAudioFile);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0CFF650](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1E0CFF658](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSeek(ExtAudioFileRef inExtAudioFile, SInt64 inFrameOffset)
{
  return MEMORY[0x1E0CFF660](inExtAudioFile, inFrameOffset);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0CFF668](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1E0CFF680](inExtAudioFile, *(_QWORD *)&inNumberFrames, ioData);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB708](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1E0D1BD28]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE40]();
}

uint64_t QuasarC_setComputeEngineCacheLookupHandler()
{
  return MEMORY[0x1E0D1F1D8]();
}

uint64_t SASCodecForString()
{
  return MEMORY[0x1E0D89000]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t _AFBackedUpPreferencesValueForKey()
{
  return MEMORY[0x1E0CFEAD0]();
}

uint64_t _AFPreferencesValueForKey()
{
  return MEMORY[0x1E0CFEB20]();
}

uint64_t _AFPreferencesValueForKeyWithContext()
{
  return MEMORY[0x1E0CFEB38]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E687D0E8();
}

void operator delete(void *__p)
{
  off_1E687D0F0(__p);
}

uint64_t operator delete()
{
  return off_1E687D0F8();
}

uint64_t operator new[]()
{
  return off_1E687D100();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E687D108(__sz);
}

uint64_t operator new()
{
  return off_1E687D110();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1E0C80B00](a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t dispatch_pthread_root_queue_create()
{
  return MEMORY[0x1E0C82E18]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
  MEMORY[0x1E0C82FF0](workloop, frequency);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t exclaves_audio_buffer_copyout()
{
  return MEMORY[0x1E0C83230]();
}

uint64_t exclaves_audio_buffer_create()
{
  return MEMORY[0x1E0C83238]();
}

uint64_t exclaves_sensor_create()
{
  return MEMORY[0x1E0C83240]();
}

uint64_t exclaves_sensor_start()
{
  return MEMORY[0x1E0C83248]();
}

uint64_t exclaves_sensor_status()
{
  return MEMORY[0x1E0C83250]();
}

uint64_t exclaves_sensor_stop()
{
  return MEMORY[0x1E0C83258]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint64_t nd_close()
{
  return MEMORY[0x1E0DC8690]();
}

uint64_t nd_create()
{
  return MEMORY[0x1E0DC8698]();
}

uint64_t nd_error()
{
  return MEMORY[0x1E0DC86A0]();
}

uint64_t nd_getoption()
{
  return MEMORY[0x1E0DC86A8]();
}

uint64_t nd_getphraseresults()
{
  return MEMORY[0x1E0DC86B0]();
}

uint64_t nd_getresults()
{
  return MEMORY[0x1E0DC86B8]();
}

uint64_t nd_getsupervector()
{
  return MEMORY[0x1E0DC86C0]();
}

uint64_t nd_initialize()
{
  return MEMORY[0x1E0DC86C8]();
}

uint64_t nd_phrasecount()
{
  return MEMORY[0x1E0DC86D0]();
}

uint64_t nd_reset()
{
  return MEMORY[0x1E0DC86D8]();
}

uint64_t nd_resetbest()
{
  return MEMORY[0x1E0DC86E0]();
}

uint64_t nd_wavedata()
{
  return MEMORY[0x1E0DC86E8]();
}

uint64_t nd_wavedataf()
{
  return MEMORY[0x1E0DC86F0]();
}

uint64_t nde_create()
{
  return MEMORY[0x1E0DC86F8]();
}

uint64_t nde_destroy()
{
  return MEMORY[0x1E0DC8700]();
}

uint64_t nde_enable_multiinstance()
{
  return MEMORY[0x1E0DC8708]();
}

uint64_t nde_process_v2()
{
  return MEMORY[0x1E0DC8710]();
}

uint64_t nde_reset()
{
  return MEMORY[0x1E0DC8718]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x1E0C84438]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x1E0C84448]();
}

uint64_t nwi_state_get_first_ifstate()
{
  return MEMORY[0x1E0C84450]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x1E0C84460]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x1E0C84470]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C84CB8](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CE0](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF0](a1, *(_QWORD *)&a2);
}

uint64_t remote_device_cancel()
{
  return MEMORY[0x1E0D86FF0]();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return MEMORY[0x1E0D87008]();
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x1E0D87020]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x1E0D87030]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x1E0D87048]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x1E0D87090]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x1E0D870B0]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x1E0D870C0]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void vDSP_DFT_DestroySetup(vDSP_DFT_Setup __Setup)
{
  MEMORY[0x1E0C8BF50](__Setup);
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
  MEMORY[0x1E0C8BF60](__Setup, __Ir, __Ii, __Or, __Oi);
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1E0C8BFB0](__Previous, __Length, *(_QWORD *)&__Direction);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C050](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_svdiv(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2D8](__A, __B, __IB, __C, __IC, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C358](__A, __IA, __C, __IC, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C3D8](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C400](__C, __IC, __N);
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C448](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vfix16(const float *__A, vDSP_Stride __IA, __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C488](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt16(const __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C598](__A, __IA, __C, __IC, __N);
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6A0](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6F8](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C740](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C888](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA50](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvcma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA80](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_zvma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB0](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB8](__A, __IA, __C, __IC, __N);
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
  MEMORY[0x1E0C8CAE8](__A, __IA, __B, __IB, __C, __IC, __N, *(_QWORD *)&__Conjugate);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x1E0C860F8]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1E0D87358]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1E0D87368]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x1E0D87398]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1E0D873D0]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x1E0D873D8]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1E0D873F0]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

