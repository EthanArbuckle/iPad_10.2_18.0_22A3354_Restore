uint64_t HomeAutomationUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HomeAutomationUIPlugin.init()()
{
  uint64_t v0;

  return v0;
}

void HomeAutomationUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
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
  uint64_t (*v22)(_QWORD);
  char *v23;

  type metadata accessor for TemperatureView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  type metadata accessor for CallToActionView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for CallToActionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  type metadata accessor for AutomationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  type metadata accessor for CompletionView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
  type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8();
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0();
  v15 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v15);
  type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_8();
  type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0();
  v18 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v18);
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_8();
  sub_23E180B78(a1, v21 - v20, v22);
  v23 = (char *)sub_23E1808D0 + 4 * byte_23E1BEAD0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E1808D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23E180B4C(v2, v0, type metadata accessor for DisambiguationSnippetModel);
  sub_23E180B78(v0, v3, type metadata accessor for DisambiguationSnippetModel);
  sub_23E1B31CC(v3, v1);
  sub_23E180C20(&qword_256D34880, (uint64_t (*)(uint64_t))type metadata accessor for DisambiguationView, (uint64_t)&unk_23E1C0E80);
  v4 = sub_23E1BE0D8();
  sub_23E180BA4(v1, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  sub_23E180BA4(v0, type metadata accessor for DisambiguationSnippetModel);
  return v4;
}

void sub_23E180B4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_7(a1, a2, a3);
  OUTLINED_FUNCTION_13(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_9();
}

void sub_23E180B78(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_7(a1, a2, a3);
  OUTLINED_FUNCTION_13(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_9();
}

void sub_23E180BA4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_9();
}

uint64_t HomeAutomationUIPlugin.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t HomeAutomationUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_23E180BF4()
{
  sub_23E180C20(&qword_256D34888, (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationSnippetModels, (uint64_t)&protocol conformance descriptor for HomeAutomationSnippetModels);
}

void sub_23E180C20(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24264D408](a3, v5), a1);
  }
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E180C5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = HomeAutomationUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

void sub_23E180C80(uint64_t a1)
{
  HomeAutomationUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for HomeAutomationUIPlugin()
{
  return objc_opt_self();
}

uint64_t method lookup function for HomeAutomationUIPlugin()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HomeAutomationUIPlugin.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for VRXVisualResponseLocation()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256D34890)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256D34890);
  }
}

void OUTLINED_FUNCTION_1(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_23E180B4C(a1, v2, v1);
}

void OUTLINED_FUNCTION_4(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_23E180B78(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return 0;
}

void OUTLINED_FUNCTION_6(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_23E180C20(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_13@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t AutomationSnippetModel.triggerValue.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_16();
  return v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24264D3F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23E180E38()
{
  swift_bridgeObjectRetain();
  return AutomationSnippetModel.triggerValue.setter();
}

uint64_t AutomationSnippetModel.triggerValue.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  return OUTLINED_FUNCTION_14();
}

void AutomationSnippetModel.triggerValue.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t AutomationSnippetModel.targetedEntitiesIcons.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  sub_23E1BDDCC();
  return v1;
}

uint64_t type metadata accessor for AutomationSnippetModel()
{
  uint64_t result;

  result = qword_256D34970;
  if (!qword_256D34970)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E180F60()
{
  swift_bridgeObjectRetain();
  AutomationSnippetModel.targetedEntitiesIcons.setter();
}

void AutomationSnippetModel.targetedEntitiesIcons.setter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  sub_23E1BDDD8();
  OUTLINED_FUNCTION_7_0();
}

void AutomationSnippetModel.targetedEntitiesIcons.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void AutomationSnippetModel.triggerIcon.getter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_9();
}

void sub_23E18104C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;

  v2 = type metadata accessor for IconConfiguration();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E181E98(a1, (uint64_t)v4, v5);
  AutomationSnippetModel.triggerIcon.setter((uint64_t)v4);
}

void AutomationSnippetModel.triggerIcon.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_33();
  sub_23E181E98(a1, v1, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  sub_23E1BDDD8();
  sub_23E180BA4(a1, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
}

void AutomationSnippetModel.triggerIcon.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void AutomationSnippetModel.automationSubtext.getter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

void sub_23E1811D4()
{
  swift_bridgeObjectRetain();
  AutomationSnippetModel.automationSubtext.setter();
}

void AutomationSnippetModel.automationSubtext.setter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void AutomationSnippetModel.automationSubtext.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void AutomationSnippetModel.scheduledText.getter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

void sub_23E1812CC()
{
  swift_bridgeObjectRetain();
  AutomationSnippetModel.scheduledText.setter();
}

void AutomationSnippetModel.scheduledText.setter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void AutomationSnippetModel.scheduledText.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t AutomationSnippetModel.isSceneAutomation.getter()
{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDCC();
  return v1;
}

void AutomationSnippetModel.isSceneAutomation.setter()
{
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDD8();
  OUTLINED_FUNCTION_7_0();
}

void AutomationSnippetModel.isSceneAutomation.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E18145C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_23E18148C()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_23E1814D8()
{
  return 6;
}

uint64_t sub_23E1814E0()
{
  return 0;
}

uint64_t sub_23E1814EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E181528 + 4 * byte_23E1BEB90[a1]))(0xD000000000000015, 0x800000023E1C1B60);
}

uint64_t sub_23E181528()
{
  return 0x5672656767697274;
}

uint64_t sub_23E181548()
{
  return 0x4972656767697274;
}

unint64_t sub_23E181568()
{
  return 0xD000000000000011;
}

uint64_t sub_23E1815B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E1815F0 + 4 * byte_23E1BEB96[a1]))(0xD000000000000015, 0x800000023E1C1B60);
}

uint64_t sub_23E1815F0()
{
  return 0x5672656767697274;
}

uint64_t sub_23E181610()
{
  return 0x4972656767697274;
}

unint64_t sub_23E181630()
{
  return 0xD000000000000011;
}

void sub_23E18167C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  sub_23E1B5C58(*a1, *a2);
}

void sub_23E181688()
{
  unsigned __int8 *v0;

  sub_23E1B5D50(*v0);
}

uint64_t sub_23E181690(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23E1B5FFC(a1, *v1);
}

void sub_23E181698(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23E1B60A0(a1, *v1);
}

uint64_t sub_23E1816A0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E18148C();
  *a1 = result;
  return result;
}

void sub_23E1816CC(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_23E1814EC(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1816F0()
{
  unsigned __int8 *v0;

  return sub_23E1815B4(*v0);
}

uint64_t sub_23E1816F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1814D4();
  *a1 = result;
  return result;
}

uint64_t sub_23E18171C()
{
  return sub_23E1814E0();
}

uint64_t sub_23E181738@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1814D8();
  *a1 = result;
  return result;
}

uint64_t sub_23E18175C()
{
  sub_23E181DF8();
  return sub_23E1BE708();
}

uint64_t sub_23E181784()
{
  sub_23E181DF8();
  return sub_23E1BE714();
}

Swift::String __swiftcall AutomationSnippetModel.responseViewId()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x800000023E1C2090;
  v1 = 0xD000000000000019;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

void AutomationSnippetModel.init(triggerValue:targetedEntitiesIcons:triggerIcon:automationSubtext:scheduledText:isSceneAutomation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  _QWORD v19[5];
  int v20;
  uint64_t v21;
  uint64_t v22;

  v19[3] = a7;
  v19[4] = a8;
  v19[1] = a5;
  v19[2] = a6;
  v20 = a9;
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v19 - v17;
  v21 = a1;
  v22 = a2;
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_0_0();
  v21 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B8);
  sub_23E1BDDB4();
  sub_23E181E98(a4, (uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  sub_23E181E98((uint64_t)v18, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  sub_23E1BDDB4();
  sub_23E180BA4((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_32();
  LOBYTE(v21) = v20;
  sub_23E1BDDB4();
  sub_23E180BA4(a4, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
}

void AutomationSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v21 = a2;
  v23 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v22 = (uint64_t)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v24 = (char *)&v19 - v6;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348C0);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_33();
  v7 = type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E181DF8();
  v12 = (uint64_t)v26;
  sub_23E1BE6F0();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v26 = a1;
    LOBYTE(v27) = 0;
    v13 = (uint64_t)v24;
    v27 = sub_23E1BE63C();
    v28 = v14;
    v20 = v11;
    sub_23E1BDDB4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B8);
    LOBYTE(v29) = 1;
    sub_23E18223C(&qword_256D348D0, &qword_256D348D8, (uint64_t)&protocol conformance descriptor for IconConfiguration, MEMORY[0x24BEE12D0]);
    sub_23E1BE654();
    v29 = v27;
    sub_23E1BDDB4();
    LOBYTE(v27) = 2;
    sub_23E180C20(&qword_256D348D8, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, (uint64_t)&protocol conformance descriptor for IconConfiguration);
    sub_23E1BE654();
    v19 = v7;
    sub_23E181E98(v13, v22, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    sub_23E1BDDB4();
    sub_23E180BA4(v13, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    v15 = OUTLINED_FUNCTION_12_0(3);
    v16 = v20;
    v27 = v15;
    v28 = v17;
    OUTLINED_FUNCTION_37();
    v27 = OUTLINED_FUNCTION_12_0(4);
    v28 = v18;
    OUTLINED_FUNCTION_37();
    LOBYTE(v27) = 5;
    LOBYTE(v27) = sub_23E1BE648() & 1;
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_1_0();
    sub_23E181E98(v16, v21, (uint64_t (*)(_QWORD))type metadata accessor for AutomationSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    sub_23E180BA4(v16, (uint64_t (*)(_QWORD))type metadata accessor for AutomationSnippetModel);
  }
  OUTLINED_FUNCTION_9_0();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23E181DF8()
{
  unint64_t result;

  result = qword_256D348C8;
  if (!qword_256D348C8)
  {
    result = MEMORY[0x24264D408](&unk_23E1BED74, &type metadata for AutomationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D348C8);
  }
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24264D3FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23E181E98(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_9();
}

void AutomationSnippetModel.encode(to:)(_QWORD *a1)
{
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

  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348E0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E181DF8();
  sub_23E1BE6FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE678();
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for AutomationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    sub_23E1BDDCC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B8);
    sub_23E18223C(&qword_256D348E8, &qword_256D348F0, (uint64_t)&protocol conformance descriptor for IconConfiguration, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_34();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
    sub_23E1BDDCC();
    sub_23E180C20(&qword_256D348F0, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, (uint64_t)&protocol conformance descriptor for IconConfiguration);
    OUTLINED_FUNCTION_34();
    sub_23E180BA4(v5, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    sub_23E1BDDCC();
    OUTLINED_FUNCTION_36(3);
    sub_23E1BE678();
    swift_bridgeObjectRelease();
    sub_23E1BDDCC();
    OUTLINED_FUNCTION_36(4);
    sub_23E1BE678();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    sub_23E1BDDCC();
    sub_23E1BE684();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  }
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_23E18223C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D348B8);
    sub_23E180C20(a2, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, a3);
    v11 = v10;
    result = MEMORY[0x24264D408](a4, v9, &v11);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t AutomationSnippetModel.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];
  unint64_t v5;
  unint64_t v6;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v2 = v1 - v0;
  v5 = 0xD000000000000017;
  v6 = 0x800000023E1C20B0;
  OUTLINED_FUNCTION_11_0();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  strcpy((char *)v4, "triggerValue: ");
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_0();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_27();
  sub_23E1BE480();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11_0();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  v4[0] = 0xD000000000000019;
  v4[1] = 0x800000023E1C20F0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  sub_23E1BDDCC();
  swift_bridgeObjectRelease();
  sub_23E1BE6A8();
  sub_23E1BE480();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11_0();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  sub_23E1BDDCC();
  IconConfiguration.description.getter();
  sub_23E180BA4(v2, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_0();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_11_0();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  v4[0] = 0xD000000000000015;
  v4[1] = 0x800000023E1C2130;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  sub_23E1BE480();
  return v5;
}

uint64_t AutomationSnippetModel.stringId.getter()
{
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  sub_23E1BE6A8();
  sub_23E1BE480();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_27();
  sub_23E1BE480();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_19();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  return 0x7265676769727423;
}

uint64_t static AutomationSnippetModel.== infix(_:_:)()
{
  if ((sub_23E1BDDE4() & 1) != 0
    && (OUTLINED_FUNCTION_0_0(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B8),
        sub_23E18223C(&qword_256D348F8, &qword_256D34900, (uint64_t)&protocol conformance descriptor for IconConfiguration, MEMORY[0x24BEE12C0]), (OUTLINED_FUNCTION_15() & 1) != 0)&& (OUTLINED_FUNCTION_24(), sub_23E180C20(&qword_256D34900, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, (uint64_t)&protocol conformance descriptor for IconConfiguration), (OUTLINED_FUNCTION_15() & 1) != 0)&& (sub_23E1BDDE4() & 1) != 0&& (sub_23E1BDDE4() & 1) != 0)
  {
    return sub_23E1BDDE4();
  }
  else
  {
    return 0;
  }
}

void sub_23E1829FC()
{
  sub_23E180C20(&qword_256D34908, (uint64_t (*)(uint64_t))type metadata accessor for AutomationSnippetModel, (uint64_t)&protocol conformance descriptor for AutomationSnippetModel);
}

void sub_23E182A28()
{
  sub_23E180C20(&qword_256D34910, (uint64_t (*)(uint64_t))type metadata accessor for AutomationSnippetModel, (uint64_t)&protocol conformance descriptor for AutomationSnippetModel);
}

void sub_23E182A58(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AutomationSnippetModel.init(from:)(a1, a2);
}

void sub_23E182A6C(_QWORD *a1)
{
  AutomationSnippetModel.encode(to:)(a1);
}

void sub_23E182A80()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  *v0 = AutomationSnippetModel.triggerValue.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E182AA4()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20();
  *v0 = AutomationSnippetModel.targetedEntitiesIcons.getter();
  OUTLINED_FUNCTION_9();
}

void sub_23E182AC8()
{
  AutomationSnippetModel.triggerIcon.getter();
  OUTLINED_FUNCTION_9();
}

void sub_23E182AE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  AutomationSnippetModel.automationSubtext.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E182B0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  AutomationSnippetModel.scheduledText.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E182B30()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20();
  *v0 = AutomationSnippetModel.isSceneAutomation.getter() & 1;
  OUTLINED_FUNCTION_9();
}

void sub_23E182B54()
{
  AutomationSnippetModel.isSceneAutomation.setter();
  OUTLINED_FUNCTION_9();
}

uint64_t *initializeBufferWithCopyOfBuffer for AutomationSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
    v8((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]), v7);
    v17 = a3[9];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for AutomationSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + a2[5];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v5(a1 + a2[7], v4);
  v5(a1 + a2[8], v4);
  v10 = a1 + a2[9];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t initializeWithCopy for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v16 = a3[9];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v16 = a3[9];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v16 = a3[9];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  v16 = a3[9];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomationSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E183234(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_17();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    OUTLINED_FUNCTION_17();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
      OUTLINED_FUNCTION_17();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        v11 = a3[9];
      }
    }
    v8 = a1 + v11;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AutomationSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1832F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_18();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    OUTLINED_FUNCTION_18();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
      OUTLINED_FUNCTION_18();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        v12 = a4[9];
      }
    }
    v9 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_23E1833B0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23E18353C(319, (unint64_t *)&qword_256D34980);
  if (v0 <= 0x3F)
  {
    sub_23E183490();
    if (v1 <= 0x3F)
    {
      sub_23E1834E8();
      if (v2 <= 0x3F)
      {
        sub_23E18353C(319, qword_256D34998);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_23E183490()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D34988)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D348B8);
    v0 = sub_23E1BDDF0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D34988);
  }
}

void sub_23E1834E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D34990)
  {
    type metadata accessor for IconConfiguration();
    v0 = sub_23E1BDDF0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D34990);
  }
}

void sub_23E18353C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23E1BDDF0();
    if (!v4)
      atomic_store(v3, a2);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AutomationSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AutomationSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E183664 + 4 * byte_23E1BEBA1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23E183698 + 4 * byte_23E1BEB9C[v4]))();
}

uint64_t sub_23E183698(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1836A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1836A8);
  return result;
}

uint64_t sub_23E1836B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1836BCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23E1836C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1836C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1836D4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23E1836E0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AutomationSnippetModel.CodingKeys()
{
  return &type metadata for AutomationSnippetModel.CodingKeys;
}

unint64_t sub_23E1836FC()
{
  unint64_t result;

  result = qword_256D349D8;
  if (!qword_256D349D8)
  {
    result = MEMORY[0x24264D408](&unk_23E1BED4C, &type metadata for AutomationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D349D8);
  }
  return result;
}

unint64_t sub_23E18373C()
{
  unint64_t result;

  result = qword_256D349E0;
  if (!qword_256D349E0)
  {
    result = MEMORY[0x24264D408](&unk_23E1BEC84, &type metadata for AutomationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D349E0);
  }
  return result;
}

unint64_t sub_23E18377C()
{
  unint64_t result;

  result = qword_256D349E8;
  if (!qword_256D349E8)
  {
    result = MEMORY[0x24264D408](&unk_23E1BECAC, &type metadata for AutomationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D349E8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return type metadata accessor for AutomationSnippetModel();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

void *OUTLINED_FUNCTION_3_0()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_23E1BDDC0();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = 0;
  *(_QWORD *)(v1 - 104) = v0;
}

uint64_t OUTLINED_FUNCTION_12_0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_23E1BE63C();
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_23E1BDDD8();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_23E1BDDE4();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return type metadata accessor for IconConfiguration();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_23E1BE5B8();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = v0;
  return sub_23E1BDDB4();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_23E1BE690();
}

void OUTLINED_FUNCTION_36(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_23E1BDDB4();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  return v2(v3 + a1, v1);
}

uint64_t AutomationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  char v17;

  v4 = sub_23E1BDE50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_3_1();
  v10 = (uint64_t *)(a2 + *(int *)(v9 + 20));
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v10 = sub_23E1BDF04();
  v10[1] = v11;
  sub_23E186F18(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for AutomationSnippetModel);
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDCC();
  *(_BYTE *)(a2 + *(int *)(v9 + 24)) = v17;
  if (qword_256D34828 != -1)
    swift_once();
  v12 = (id)qword_256D3AF18;
  sub_23E1BDE2C();
  sub_23E1BE534();
  sub_23E1BDE20();
  if (qword_256D34820 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v4, (uint64_t)qword_256D3AF00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, v13, v4);
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  AutomationSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0xD00000000000002FLL;
  v15._countAndFlagsBits = 0xD000000000000067;
  v15._object = (void *)0x800000023E1C2220;
  v14._object = (void *)0x800000023E1C21F0;
  Logger.debug(output:test:caller:)(v14, 0, v15);
  swift_bridgeObjectRelease();
  sub_23E187F20(a1, (uint64_t (*)(_QWORD))type metadata accessor for AutomationSnippetModel);
  return OUTLINED_FUNCTION_12_1(v8, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
}

uint64_t type metadata accessor for AutomationView()
{
  uint64_t result;

  result = qword_256D34AB0;
  if (!qword_256D34AB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AutomationView.body.getter@<X0>(uint64_t a1@<X8>)
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
  void (**v11)();
  uint64_t v13;
  uint64_t v14;

  v3 = v1;
  v14 = a1;
  v4 = OUTLINED_FUNCTION_3_1();
  v5 = *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64);
  MEMORY[0x24BDAC7A8](v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D349F8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_1();
  sub_23E186F18(v3, (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AutomationView);
  v8 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_15_0(v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34A00);
  sub_23E186FB4();
  sub_23E1BE318();
  sub_23E186F18(v3, (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for AutomationView);
  v9 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_15_0(v9);
  v10 = v14;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v14, v2, v6);
  v11 = (void (**)())(v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34A50) + 36));
  *v11 = sub_23E187214;
  v11[1] = (void (*)())v9;
  v11[2] = 0;
  v11[3] = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v6);
}

void sub_23E183DA0(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  char *v42;
  id *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, char *, uint64_t);
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t);
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;

  v142 = a2;
  v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34A48);
  MEMORY[0x24BDAC7A8](v143);
  v123 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_23E1BE3D8();
  v121 = *(_QWORD *)(v124 - 8);
  v4 = MEMORY[0x24BDAC7A8](v124);
  v120 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v122 = (char *)&v103 - v6;
  v119 = sub_23E1BDD3C();
  v118 = *(_QWORD *)(v119 - 8);
  MEMORY[0x24BDAC7A8](v119);
  v117 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for IconConfiguration();
  MEMORY[0x24BDAC7A8](v8);
  v105 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23E1BDDA8();
  MEMORY[0x24BDAC7A8](v10);
  v106 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_23E1BE2F4();
  v111 = *(_QWORD *)(v113 - 8);
  MEMORY[0x24BDAC7A8](v113);
  v107 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B68);
  v112 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v109 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B70);
  MEMORY[0x24BDAC7A8](v110);
  v108 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34A38);
  MEMORY[0x24BDAC7A8](v132);
  v115 = (uint64_t)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B78);
  v16 = MEMORY[0x24BDAC7A8](v125);
  v126 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v127 = (uint64_t)&v103 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B80);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v104 = (uint64_t)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v116 = (uint64_t *)((char *)&v103 - v22);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B88);
  MEMORY[0x24BDAC7A8](v139);
  v141 = (uint64_t)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B90);
  MEMORY[0x24BDAC7A8](v128);
  v130 = (uint64_t)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34A28);
  MEMORY[0x24BDAC7A8](v129);
  v26 = (char *)&v103 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34A18);
  MEMORY[0x24BDAC7A8](v140);
  v131 = (char *)&v103 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v134 = sub_23E1BE390();
  v133 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v135 = (char *)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_23E1BE3A8();
  v136 = *(_QWORD *)(v138 - 8);
  v29 = MEMORY[0x24BDAC7A8](v138);
  v31 = (char *)&v103 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v137 = (char *)&v103 - v32;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B98);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v103 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v103 - v37;
  v39 = type metadata accessor for AutomationView();
  v40 = MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v103 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = (id *)(a1 + *(int *)(v40 + 20));
  if (!*v43)
    goto LABEL_12;
  v44 = *v43;
  sub_23E1BE3E4();

  LOBYTE(v44) = sub_23E1BE540();
  sub_23E186F18(a1, (uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for AutomationView);
  v45 = a1;
  if ((v44 & 1) != 0)
  {
    sub_23E187F20((uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for AutomationView);
LABEL_6:
    *(_QWORD *)v38 = sub_23E1BDFD0();
    *((_QWORD *)v38 + 1) = 0x4018000000000000;
    v38[16] = 0;
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BC0);
    sub_23E184F00(v45, (uint64_t)&v38[*(int *)(v48 + 44)]);
    type metadata accessor for AutomationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    sub_23E1BDDCC();
    v155 = MEMORY[0x24BEE0D00];
    v156 = MEMORY[0x24BEAE5B8];
    (*(void (**)(char *, _QWORD, uint64_t))(v133 + 104))(v135, *MEMORY[0x24BEADF78], v134);
    v49 = v137;
    sub_23E1BE39C();
    sub_23E18827C((uint64_t)v38, (uint64_t)v36, &qword_256D34B98);
    v50 = v136;
    v51 = *(void (**)(char *, char *, uint64_t))(v136 + 16);
    v52 = v138;
    v51(v31, v49, v138);
    sub_23E18827C((uint64_t)v36, (uint64_t)v26, &qword_256D34B98);
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BC8);
    v51(&v26[*(int *)(v53 + 48)], v31, v52);
    v54 = *(void (**)(char *, uint64_t))(v50 + 8);
    v54(v31, v52);
    sub_23E18829C((uint64_t)v36, &qword_256D34B98);
    sub_23E18827C((uint64_t)v26, v130, &qword_256D34A28);
    swift_storeEnumTagMultiPayload();
    sub_23E18819C(&qword_256D34A20, &qword_256D34A28);
    sub_23E18819C(&qword_256D34A30, &qword_256D34A38);
    v55 = (uint64_t)v131;
    sub_23E1BE018();
    sub_23E18829C((uint64_t)v26, &qword_256D34A28);
    sub_23E18827C(v55, v141, &qword_256D34A18);
    swift_storeEnumTagMultiPayload();
    sub_23E187038();
    sub_23E18819C(&qword_256D34A40, &qword_256D34A48);
    sub_23E1BE018();
    sub_23E18829C(v55, &qword_256D34A18);
    v54(v49, v52);
    v56 = (uint64_t)v38;
    v57 = &qword_256D34B98;
LABEL_7:
    sub_23E18829C(v56, v57);
    return;
  }
  v46 = *(void **)&v42[*(int *)(v39 + 20)];
  if (!v46)
    goto LABEL_12;
  v47 = v46;
  sub_23E1BE3E4();

  LOBYTE(v47) = sub_23E1BE558();
  sub_23E187F20((uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for AutomationView);
  v45 = a1;
  if ((v47 & 1) != 0)
    goto LABEL_6;
  if (*v43)
  {
    v58 = *v43;
    sub_23E1BE3E4();

    if ((sub_23E1BE54C() & 1) != 0)
    {
      v59 = sub_23E1BDFD0();
      v60 = (uint64_t)v116;
      *v116 = v59;
      *(_QWORD *)(v60 + 8) = 0;
      *(_BYTE *)(v60 + 16) = 0;
      v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BB0);
      sub_23E185B38(a1, v60 + *(int *)(v61 + 44));
      type metadata accessor for AutomationSnippetModel();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      sub_23E1BDDCC();
      v155 = MEMORY[0x24BEE0D00];
      v156 = MEMORY[0x24BEAE5B8];
      (*(void (**)(char *, _QWORD, uint64_t))(v133 + 104))(v135, *MEMORY[0x24BEADF78], v134);
      v62 = v137;
      sub_23E1BE39C();
      v63 = sub_23E1BE204();
      v64 = sub_23E1BE030();
      v65 = v136;
      v66 = (uint64_t)v126;
      v67 = v138;
      (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v126, v62, v138);
      v68 = v66 + *(int *)(v125 + 36);
      *(_QWORD *)v68 = v63;
      *(_BYTE *)(v68 + 8) = v64;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v62, v67);
      v69 = v127;
      sub_23E188248(v66, v127, &qword_256D34B78);
      v70 = v104;
      sub_23E18827C(v60, v104, &qword_256D34B80);
      sub_23E18827C(v69, v66, &qword_256D34B78);
      v71 = v115;
      sub_23E18827C(v70, v115, &qword_256D34B80);
      v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BB8);
      sub_23E18827C(v66, v71 + *(int *)(v72 + 48), &qword_256D34B78);
      sub_23E18829C(v66, &qword_256D34B78);
      sub_23E18829C(v70, &qword_256D34B80);
      sub_23E18827C(v71, v130, &qword_256D34A38);
      swift_storeEnumTagMultiPayload();
      sub_23E18819C(&qword_256D34A20, &qword_256D34A28);
      sub_23E18819C(&qword_256D34A30, &qword_256D34A38);
      v73 = (uint64_t)v131;
      sub_23E1BE018();
      sub_23E18829C(v71, &qword_256D34A38);
      sub_23E18827C(v73, v141, &qword_256D34A18);
      swift_storeEnumTagMultiPayload();
      sub_23E187038();
      sub_23E18819C(&qword_256D34A40, &qword_256D34A48);
      sub_23E1BE018();
      sub_23E18829C(v73, &qword_256D34A18);
      sub_23E18829C(v69, &qword_256D34B78);
      v56 = v60;
      v57 = &qword_256D34B80;
      goto LABEL_7;
    }
    type metadata accessor for AutomationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
    v74 = (uint64_t)v105;
    sub_23E1BDDCC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    sub_23E1BDDCC();
    sub_23E187F20(v74, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    sub_23E1BDD9C();
    swift_bridgeObjectRelease();
    v75 = v107;
    sub_23E1BE300();
    v76 = v118;
    v77 = v117;
    v78 = v119;
    (*(void (**)(char *, _QWORD, uint64_t))(v118 + 104))(v117, *MEMORY[0x24BEAAB68], v119);
    sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v79 = v109;
    v80 = v113;
    sub_23E1BE0E4();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v78);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v75, v80);
    v81 = sub_23E1BE234();
    v82 = v112;
    v83 = (uint64_t)v108;
    v84 = v114;
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v108, v79, v114);
    *(_QWORD *)(v83 + *(int *)(v110 + 36)) = v81;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v79, v84);
    sub_23E187F48();
    v85 = sub_23E1BE0D8();
    sub_23E18829C(v83, &qword_256D34B70);
    sub_23E1BDDCC();
    v86 = MEMORY[0x24BEE0D00];
    v87 = MEMORY[0x24BEAE5B8];
    v155 = MEMORY[0x24BEE0D00];
    v156 = MEMORY[0x24BEAE5B8];
    sub_23E1BDDCC();
    v153 = v86;
    v154 = v87;
    v152 = 0;
    v150 = 0u;
    v151 = 0u;
    v149 = 0;
    v147 = 0u;
    v148 = 0u;
    v146 = MEMORY[0x24BEAD938];
    v145 = MEMORY[0x24BDF4780];
    v144 = v85;
    swift_retain();
    v88 = v122;
    sub_23E1BE3CC();
    sub_23E1BDDCC();
    v155 = v86;
    v156 = v87;
    (*(void (**)(char *, _QWORD, uint64_t))(v133 + 104))(v135, *MEMORY[0x24BEADF78], v134);
    v89 = v137;
    sub_23E1BE39C();
    v90 = sub_23E1BE204();
    LOBYTE(v86) = sub_23E1BE030();
    v91 = v136;
    v92 = (uint64_t)v126;
    v93 = v138;
    (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v126, v89, v138);
    v94 = v92 + *(int *)(v125 + 36);
    *(_QWORD *)v94 = v90;
    *(_BYTE *)(v94 + 8) = v86;
    (*(void (**)(char *, uint64_t))(v91 + 8))(v89, v93);
    v95 = v127;
    sub_23E188248(v92, v127, &qword_256D34B78);
    v96 = v121;
    v97 = *(void (**)(char *, char *, uint64_t))(v121 + 16);
    v98 = v120;
    v99 = v124;
    v97(v120, v88, v124);
    sub_23E18827C(v95, v92, &qword_256D34B78);
    v100 = (uint64_t)v123;
    v97(v123, v98, v99);
    v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BA8);
    sub_23E18827C(v92, v100 + *(int *)(v101 + 48), &qword_256D34B78);
    sub_23E18829C(v92, &qword_256D34B78);
    v102 = *(void (**)(char *, uint64_t))(v96 + 8);
    v102(v98, v99);
    sub_23E18827C(v100, v141, &qword_256D34A48);
    swift_storeEnumTagMultiPayload();
    sub_23E187038();
    sub_23E18819C(&qword_256D34A40, &qword_256D34A48);
    sub_23E1BE018();
    swift_release();
    sub_23E18829C(v100, &qword_256D34A48);
    sub_23E18829C(v95, &qword_256D34B78);
    v102(v88, v99);
  }
  else
  {
LABEL_12:
    sub_23E1BE408();
    sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_23E1BDEF8();
    __break(1u);
  }
}

void sub_23E184F00(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v18;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v48 = a2;
  v47 = sub_23E1BE3D8();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BD0);
  v5 = MEMORY[0x24BDAC7A8](v45);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v45 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BD8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BE0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v45 - v17;
  *(_QWORD *)v12 = sub_23E1BDF88();
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 0;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BE8);
  sub_23E1852E8(a1, (uint64_t)&v12[*(int *)(v19 + 44)]);
  v20 = sub_23E1BE048();
  sub_23E1BDEA4();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  sub_23E18827C((uint64_t)v12, (uint64_t)v16, &qword_256D34BD8);
  v29 = &v16[*(int *)(v13 + 36)];
  *v29 = v20;
  *((_QWORD *)v29 + 1) = v22;
  *((_QWORD *)v29 + 2) = v24;
  *((_QWORD *)v29 + 3) = v26;
  *((_QWORD *)v29 + 4) = v28;
  v29[40] = 0;
  sub_23E18829C((uint64_t)v12, &qword_256D34BD8);
  sub_23E188248((uint64_t)v16, (uint64_t)v18, &qword_256D34BE0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  v30 = MEMORY[0x24BEE0D00];
  v31 = MEMORY[0x24BEAE5B8];
  v60 = MEMORY[0x24BEE0D00];
  v61 = MEMORY[0x24BEAE5B8];
  type metadata accessor for AutomationSnippetModel();
  sub_23E1BDDCC();
  v58 = v30;
  v59 = v31;
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v54 = 0;
  v53 = 0u;
  v52 = 0u;
  v51 = 0;
  v50 = 0u;
  v49 = 0u;
  sub_23E1BE3CC();
  LOBYTE(v12) = sub_23E1BE048();
  sub_23E1BDEA4();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v40 = v46;
  v41 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v7, v4, v47);
  v42 = &v7[*(int *)(v45 + 36)];
  *v42 = (char)v12;
  *((_QWORD *)v42 + 1) = v33;
  *((_QWORD *)v42 + 2) = v35;
  *((_QWORD *)v42 + 3) = v37;
  *((_QWORD *)v42 + 4) = v39;
  v42[40] = 0;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v4, v41);
  sub_23E188248((uint64_t)v7, (uint64_t)v9, &qword_256D34BD0);
  sub_23E18827C((uint64_t)v18, (uint64_t)v16, &qword_256D34BE0);
  sub_23E18827C((uint64_t)v9, (uint64_t)v7, &qword_256D34BD0);
  v43 = v48;
  sub_23E18827C((uint64_t)v16, v48, &qword_256D34BE0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BF0);
  sub_23E18827C((uint64_t)v7, v43 + *(int *)(v44 + 48), &qword_256D34BD0);
  sub_23E18829C((uint64_t)v9, &qword_256D34BD0);
  sub_23E18829C((uint64_t)v18, &qword_256D34BE0);
  sub_23E18829C((uint64_t)v7, &qword_256D34BD0);
  sub_23E18829C((uint64_t)v16, &qword_256D34BE0);
}

void sub_23E1852E8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t KeyPath;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
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
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;

  v85 = a1;
  v92 = a2;
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34BF8);
  v87 = *(_QWORD *)(v89 - 8);
  v2 = MEMORY[0x24BDAC7A8](v89);
  v93 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v90 = (char *)&v77 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v88 = (char *)&v77 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for IconConfiguration();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23E1BDDA8();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v84 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v79 = sub_23E1BE2F4();
  v91 = *(char **)(v79 - 8);
  v16 = MEMORY[0x24BDAC7A8](v79);
  v80 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v77 - v18;
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C08);
  v20 = MEMORY[0x24BDAC7A8](v94);
  v81 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v77 - v22;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C10);
  v24 = MEMORY[0x24BDAC7A8](v96);
  v83 = (uint64_t)&v77 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v77 - v26;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C18);
  v28 = MEMORY[0x24BDAC7A8](v95);
  v82 = (uint64_t)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v77 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v97 = (uint64_t)&v77 - v33;
  v86 = type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  sub_23E1BDDCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E187F20((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  sub_23E1BDD9C();
  swift_bridgeObjectRelease();
  sub_23E1BE300();
  v78 = sub_23E1BE078();
  v34 = (uint64_t)v9;
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v78);
  v35 = sub_23E1BE084();
  sub_23E18829C((uint64_t)v9, &qword_256D34C00);
  KeyPath = swift_getKeyPath();
  v37 = (uint64_t)v91;
  v77 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v91 + 2);
  v38 = v79;
  v77(v23, v19, v79);
  v39 = (uint64_t *)&v23[*(int *)(v94 + 36)];
  *v39 = KeyPath;
  v39[1] = v35;
  v40 = *(void (**)(char *, uint64_t))(v37 + 8);
  v40(v19, v38);
  LOBYTE(v35) = sub_23E1BE030();
  sub_23E18827C((uint64_t)v23, (uint64_t)v27, &qword_256D34C08);
  v41 = &v27[*(int *)(v96 + 36)];
  *v41 = v35;
  *(_OWORD *)(v41 + 8) = 0u;
  *(_OWORD *)(v41 + 24) = 0u;
  v41[40] = 1;
  sub_23E18829C((uint64_t)v23, &qword_256D34C08);
  v42 = sub_23E1BE234();
  sub_23E18827C((uint64_t)v27, (uint64_t)v32, &qword_256D34C10);
  *(_QWORD *)&v32[*(int *)(v95 + 36)] = v42;
  sub_23E18829C((uint64_t)v27, &qword_256D34C10);
  v91 = v32;
  sub_23E188248((uint64_t)v32, v97, &qword_256D34C18);
  sub_23E1BDD9C();
  v43 = v80;
  sub_23E1BE300();
  __swift_storeEnumTagSinglePayload(v34, 1, 1, v78);
  v44 = sub_23E1BE084();
  v45 = v88;
  sub_23E18829C(v34, &qword_256D34C00);
  v46 = swift_getKeyPath();
  v47 = (uint64_t)v81;
  v77(v81, v43, v38);
  v48 = v89;
  v49 = (uint64_t *)(v47 + *(int *)(v94 + 36));
  *v49 = v46;
  v49[1] = v44;
  v40(v43, v38);
  LOBYTE(v44) = sub_23E1BE06C();
  sub_23E1BDEA4();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v58 = v83;
  sub_23E18827C(v47, v83, &qword_256D34C08);
  v59 = v58 + *(int *)(v96 + 36);
  *(_BYTE *)v59 = v44;
  *(_QWORD *)(v59 + 8) = v51;
  *(_QWORD *)(v59 + 16) = v53;
  *(_QWORD *)(v59 + 24) = v55;
  *(_QWORD *)(v59 + 32) = v57;
  *(_BYTE *)(v59 + 40) = 0;
  sub_23E18829C(v47, &qword_256D34C08);
  v60 = sub_23E1BE1BC();
  v61 = v82;
  sub_23E18827C(v58, v82, &qword_256D34C10);
  *(_QWORD *)(v61 + *(int *)(v95 + 36)) = v60;
  sub_23E18829C(v58, &qword_256D34C10);
  sub_23E188010();
  v62 = v90;
  sub_23E1BE168();
  sub_23E18829C(v61, &qword_256D34C18);
  v63 = v87;
  v64 = v45;
  v65 = v45;
  v66 = v48;
  (*(void (**)(char *, char *, uint64_t))(v87 + 32))(v65, v62, v48);
  if (*(_BYTE *)(v85 + *(int *)(type metadata accessor for AutomationView() + 24)) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    sub_23E1BDDCC();
    v98 = v100;
    v99 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    sub_23E1BDDCC();
    v98 = v100;
    v99 = 1;
  }
  sub_23E1881D0();
  sub_23E18820C();
  sub_23E1BE018();
  v67 = v100;
  LODWORD(v96) = v101;
  v68 = v97;
  v69 = (uint64_t)v91;
  sub_23E18827C(v97, (uint64_t)v91, &qword_256D34C18);
  v70 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  v71 = v93;
  v72 = v64;
  v70(v93, v64, v66);
  v73 = v92;
  sub_23E18827C(v69, v92, &qword_256D34C18);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C58);
  v70((char *)(v73 + *(int *)(v74 + 48)), v71, v66);
  v75 = v73 + *(int *)(v74 + 64);
  *(_QWORD *)v75 = v67;
  *(_BYTE *)(v75 + 8) = v96;
  v76 = *(void (**)(char *, uint64_t))(v63 + 8);
  swift_bridgeObjectRetain();
  v76(v72, v66);
  sub_23E18829C(v68, &qword_256D34C18);
  swift_bridgeObjectRelease();
  v76(v71, v66);
  sub_23E18829C(v69, &qword_256D34C18);
}

void sub_23E185B38(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v56 = a2;
  v55 = sub_23E1BE3D8();
  v54 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v51 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C60);
  v4 = MEMORY[0x24BDAC7A8](v53);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v52 = (uint64_t)&v51 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C68);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C70);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C78);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v51 - v18;
  *(_QWORD *)v10 = sub_23E1BDF88();
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C80);
  sub_23E185FD0(a1, (uint64_t)&v10[*(int *)(v20 + 44)]);
  v21 = sub_23E1BE03C();
  sub_23E1BDEA4();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  sub_23E18827C((uint64_t)v10, (uint64_t)v13, &qword_256D34C68);
  v30 = &v13[*(int *)(v11 + 36)];
  *v30 = v21;
  *((_QWORD *)v30 + 1) = v23;
  *((_QWORD *)v30 + 2) = v25;
  *((_QWORD *)v30 + 3) = v27;
  *((_QWORD *)v30 + 4) = v29;
  v30[40] = 0;
  sub_23E18829C((uint64_t)v10, &qword_256D34C68);
  v31 = sub_23E1BE048();
  sub_23E1BDEA4();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_23E18827C((uint64_t)v13, (uint64_t)v17, &qword_256D34C70);
  v40 = &v17[*(int *)(v14 + 36)];
  *v40 = v31;
  *((_QWORD *)v40 + 1) = v33;
  *((_QWORD *)v40 + 2) = v35;
  *((_QWORD *)v40 + 3) = v37;
  *((_QWORD *)v40 + 4) = v39;
  v40[40] = 0;
  sub_23E18829C((uint64_t)v13, &qword_256D34C70);
  sub_23E188248((uint64_t)v17, (uint64_t)v19, &qword_256D34C78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  v41 = MEMORY[0x24BEE0D00];
  v42 = MEMORY[0x24BEAE5B8];
  v68 = MEMORY[0x24BEE0D00];
  v69 = MEMORY[0x24BEAE5B8];
  type metadata accessor for AutomationSnippetModel();
  sub_23E1BDDCC();
  v66 = v41;
  v67 = v42;
  v65 = 0;
  v63 = 0u;
  v64 = 0u;
  v62 = 0;
  v61 = 0u;
  v60 = 0u;
  v59 = 0;
  v58 = 0u;
  v57 = 0u;
  v43 = v51;
  sub_23E1BE3CC();
  v44 = sub_23E1BE204();
  LOBYTE(v14) = sub_23E1BE030();
  v45 = v54;
  v46 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v6, v43, v55);
  v47 = &v6[*(int *)(v53 + 36)];
  *(_QWORD *)v47 = v44;
  v47[8] = v14;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v46);
  v48 = v52;
  sub_23E188248((uint64_t)v6, v52, &qword_256D34C60);
  sub_23E18827C((uint64_t)v19, (uint64_t)v17, &qword_256D34C78);
  sub_23E18827C(v48, (uint64_t)v6, &qword_256D34C60);
  v49 = v56;
  sub_23E18827C((uint64_t)v17, v56, &qword_256D34C78);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C88);
  sub_23E18827C((uint64_t)v6, v49 + *(int *)(v50 + 48), &qword_256D34C60);
  sub_23E18829C(v48, &qword_256D34C60);
  sub_23E18829C((uint64_t)v19, &qword_256D34C78);
  sub_23E18829C((uint64_t)v6, &qword_256D34C60);
  sub_23E18829C((uint64_t)v17, &qword_256D34C78);
}

void sub_23E185FD0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
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
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
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
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t KeyPath;
  char *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
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
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t v124;

  v108 = a1;
  v120 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C00);
  MEMORY[0x24BDAC7A8](v2);
  v110 = (uint64_t)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C08);
  MEMORY[0x24BDAC7A8](v113);
  v111 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C10);
  MEMORY[0x24BDAC7A8](v115);
  v112 = (uint64_t)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C90);
  MEMORY[0x24BDAC7A8](v117);
  v116 = (uint64_t)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C98);
  v7 = MEMORY[0x24BDAC7A8](v118);
  v119 = (uint64_t)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v114 = (uint64_t)&v94 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v106 = (uint64_t)&v94 - v11;
  v104 = sub_23E1BDD3C();
  v103 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v13 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for IconConfiguration();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23E1BDDA8();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v107 = (char *)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v97 = sub_23E1BE2F4();
  v101 = *(_QWORD *)(v97 - 8);
  v20 = MEMORY[0x24BDAC7A8](v97);
  v105 = (char *)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v94 - v22;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B68);
  v99 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v25 = (char *)&v94 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CA0);
  MEMORY[0x24BDAC7A8](v96);
  v27 = (char *)&v94 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CA8);
  MEMORY[0x24BDAC7A8](v98);
  v29 = (char *)&v94 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CB0);
  v30 = MEMORY[0x24BDAC7A8](v102);
  v32 = (char *)&v94 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v95 = (char *)&v94 - v33;
  v109 = type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  sub_23E1BDDCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E187F20((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  sub_23E1BDD9C();
  swift_bridgeObjectRelease();
  sub_23E1BE300();
  v34 = v103;
  v35 = v104;
  (*(void (**)(char *, _QWORD, uint64_t))(v103 + 104))(v13, *MEMORY[0x24BEAAB58], v104);
  sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
  v36 = v97;
  sub_23E1BE0E4();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
  v37 = v101;
  v38 = *(void (**)(char *, uint64_t))(v101 + 8);
  v38(v23, v36);
  LOBYTE(v35) = sub_23E1BE054();
  sub_23E1BDEA4();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v47 = v99;
  v48 = v100;
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v27, v25, v100);
  v49 = &v27[*(int *)(v96 + 36)];
  *v49 = v35;
  *((_QWORD *)v49 + 1) = v40;
  *((_QWORD *)v49 + 2) = v42;
  *((_QWORD *)v49 + 3) = v44;
  *((_QWORD *)v49 + 4) = v46;
  v49[40] = 0;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v25, v48);
  LOBYTE(v35) = sub_23E1BE030();
  sub_23E18827C((uint64_t)v27, (uint64_t)v29, &qword_256D34CA0);
  v50 = &v29[*(int *)(v98 + 36)];
  *v50 = v35;
  *(_OWORD *)(v50 + 8) = 0u;
  *(_OWORD *)(v50 + 24) = 0u;
  v50[40] = 1;
  v51 = (uint64_t)v27;
  v52 = (uint64_t)v95;
  sub_23E18829C(v51, &qword_256D34CA0);
  v53 = sub_23E1BE234();
  sub_23E18827C((uint64_t)v29, (uint64_t)v32, &qword_256D34CA8);
  *(_QWORD *)&v32[*(int *)(v102 + 36)] = v53;
  v54 = (uint64_t)v29;
  v55 = (uint64_t)v32;
  sub_23E18829C(v54, &qword_256D34CA8);
  sub_23E188248((uint64_t)v32, v52, &qword_256D34CB0);
  sub_23E1BDD9C();
  v56 = v105;
  sub_23E1BE300();
  v57 = sub_23E1BE078();
  v58 = v110;
  __swift_storeEnumTagSinglePayload(v110, 1, 1, v57);
  v59 = sub_23E1BE084();
  sub_23E18829C(v58, &qword_256D34C00);
  KeyPath = swift_getKeyPath();
  v61 = v111;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v111, v56, v36);
  v62 = (uint64_t *)&v61[*(int *)(v113 + 36)];
  v63 = (uint64_t)v61;
  *v62 = KeyPath;
  v62[1] = v59;
  v38(v56, v36);
  LOBYTE(v59) = sub_23E1BE06C();
  sub_23E1BDEA4();
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  v72 = (uint64_t)v61;
  v73 = v112;
  sub_23E18827C(v72, v112, &qword_256D34C08);
  v74 = v73 + *(int *)(v115 + 36);
  *(_BYTE *)v74 = v59;
  *(_QWORD *)(v74 + 8) = v65;
  *(_QWORD *)(v74 + 16) = v67;
  *(_QWORD *)(v74 + 24) = v69;
  *(_QWORD *)(v74 + 32) = v71;
  *(_BYTE *)(v74 + 40) = 0;
  sub_23E18829C(v63, &qword_256D34C08);
  LOBYTE(v59) = sub_23E1BE054();
  sub_23E1BDEA4();
  v76 = v75;
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v83 = v116;
  sub_23E18827C(v73, v116, &qword_256D34C10);
  v84 = v83 + *(int *)(v117 + 36);
  *(_BYTE *)v84 = v59;
  *(_QWORD *)(v84 + 8) = v76;
  *(_QWORD *)(v84 + 16) = v78;
  *(_QWORD *)(v84 + 24) = v80;
  *(_QWORD *)(v84 + 32) = v82;
  *(_BYTE *)(v84 + 40) = 0;
  sub_23E18829C(v73, &qword_256D34C10);
  v85 = sub_23E1BE1BC();
  v86 = v114;
  sub_23E18827C(v83, v114, &qword_256D34C90);
  *(_QWORD *)(v86 + *(int *)(v118 + 36)) = v85;
  sub_23E18829C(v83, &qword_256D34C90);
  v87 = v106;
  sub_23E188248(v86, v106, &qword_256D34C98);
  if (*(_BYTE *)(v108 + *(int *)(type metadata accessor for AutomationView() + 24)) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    sub_23E1BDDCC();
    v121 = v123;
    v122 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    sub_23E1BDDCC();
    v121 = v123;
    v122 = 1;
  }
  sub_23E1881D0();
  sub_23E18820C();
  sub_23E1BE018();
  v88 = v123;
  v89 = v124;
  sub_23E18827C(v52, v55, &qword_256D34CB0);
  v90 = v119;
  sub_23E18827C(v87, v119, &qword_256D34C98);
  v91 = v120;
  sub_23E18827C(v55, v120, &qword_256D34CB0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CB8);
  sub_23E18827C(v90, v91 + *(int *)(v92 + 48), &qword_256D34C98);
  v93 = v91 + *(int *)(v92 + 64);
  *(_QWORD *)v93 = v88;
  *(_BYTE *)(v93 + 8) = v89;
  swift_bridgeObjectRetain();
  sub_23E18829C(v87, &qword_256D34C98);
  sub_23E18829C(v52, &qword_256D34CB0);
  swift_bridgeObjectRelease();
  sub_23E18829C(v90, &qword_256D34C98);
  sub_23E18829C(v55, &qword_256D34CB0);
}

void sub_23E186998()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_256D34828 != -1)
    swift_once();
  type metadata accessor for AutomationView();
  sub_23E1BE528();
  sub_23E1BDE14();
  if (qword_256D34820 != -1)
    swift_once();
  v0 = sub_23E1BDE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  v1._countAndFlagsBits = 0xD000000000000067;
  v2._object = (void *)0x800000023E1C22B0;
  v1._object = (void *)0x800000023E1C2220;
  v2._countAndFlagsBits = 0xD000000000000027;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_23E186ACC()
{
  return sub_23E1BE15C();
}

uint64_t sub_23E186AEC()
{
  return sub_23E186B0C();
}

uint64_t sub_23E186B0C()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B00);
  sub_23E18819C(&qword_256D34B08, &qword_256D348B8);
  sub_23E187D98();
  sub_23E187EEC(&qword_256D34B50, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
  return sub_23E1BE2DC();
}

uint64_t sub_23E186BE0@<X0>(uint64_t a1@<X8>)
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
  char v22;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;

  v2 = sub_23E1BDD3C();
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v39 = v5 - v4;
  sub_23E1BDDA8();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v35 = sub_23E1BE2F4();
  v7 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_7_1();
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B28);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B58);
  v37 = *(_QWORD *)(v12 - 8);
  v38 = v12;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8();
  v16 = v15 - v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B20);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_8();
  v21 = v20 - v19;
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  if (v43)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    sub_23E1BDDCC();
    sub_23E1BDD9C();
    swift_bridgeObjectRelease();
    sub_23E1BE300();
    v22 = sub_23E1BE06C();
    sub_23E1BDEA4();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v11, v1, v35);
    v31 = v11 + *(int *)(v36 + 36);
    *(_BYTE *)v31 = v22;
    *(_QWORD *)(v31 + 8) = v24;
    *(_QWORD *)(v31 + 16) = v26;
    *(_QWORD *)(v31 + 24) = v28;
    *(_QWORD *)(v31 + 32) = v30;
    *(_BYTE *)(v31 + 40) = 0;
    OUTLINED_FUNCTION_12_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v39, *MEMORY[0x24BEAAB68], v41);
    sub_23E187E68();
    sub_23E1BE0E4();
    OUTLINED_FUNCTION_12_1(v39, *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
    sub_23E18829C(v11, &qword_256D34B28);
    v32 = static ColorUtils.fromString(_:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v21, v16, v38);
    *(_QWORD *)(v21 + *(int *)(v17 + 36)) = v32;
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v16, v38);
    sub_23E188248(v21, a1, &qword_256D34B20);
    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a1, v33, 1, v17);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_23E186F18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E186F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AutomationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23E186F8C(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_3_1();
  v3 = OUTLINED_FUNCTION_9_1(v2);
  sub_23E183DA0(v3, a1);
}

unint64_t sub_23E186FB4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_256D34A08;
  if (!qword_256D34A08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34A00);
    v2 = sub_23E187038();
    sub_23E18819C(&qword_256D34A40, &qword_256D34A48);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256D34A08);
  }
  return result;
}

unint64_t sub_23E187038()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256D34A10;
  if (!qword_256D34A10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34A18);
    sub_23E18819C(&qword_256D34A20, &qword_256D34A28);
    v3 = v2;
    sub_23E18819C(&qword_256D34A30, &qword_256D34A38);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256D34A10);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = OUTLINED_FUNCTION_3_1();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_13_1(v3);
  v4 = (int *)type metadata accessor for AutomationSnippetModel();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  OUTLINED_FUNCTION_4_1(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  OUTLINED_FUNCTION_4_1(v6);
  OUTLINED_FUNCTION_13_1(v3 + v4[7]);
  OUTLINED_FUNCTION_13_1(v3 + v4[8]);
  v7 = v3 + v4[9];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  v9 = v3 + *(int *)(v1 + 28);
  v10 = OUTLINED_FUNCTION_11_1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject();
}

void sub_23E187214()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9_1(v0);
  sub_23E186998();
}

uint64_t sub_23E18722C()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for AutomationView(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  char v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  id v34;
  uint64_t v35;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v35 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v35 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = (int *)type metadata accessor for AutomationSnippetModel();
    v10 = v9[5];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = v9[6];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v8((_QWORD *)((char *)a1 + v9[7]), (_QWORD *)((char *)a2 + v9[7]), v7);
    v8((_QWORD *)((char *)a1 + v9[8]), (_QWORD *)((char *)a2 + v9[8]), v7);
    v18 = v9[9];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = a3[5];
    v23 = a3[6];
    v24 = (_QWORD *)((char *)a1 + v22);
    v25 = (char *)a2 + v22;
    v27 = *(void **)v25;
    v26 = *((_QWORD *)v25 + 1);
    v28 = *((_BYTE *)a2 + v23);
    *v24 = v27;
    v24[1] = v26;
    *((_BYTE *)a1 + v23) = v28;
    v29 = a3[7];
    v30 = (char *)a1 + v29;
    v31 = (char *)a2 + v29;
    v32 = sub_23E1BDE38();
    v33 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
    v34 = v27;
    v33(v30, v31, v32);
  }
  return a1;
}

uint64_t destroy for AutomationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = (int *)type metadata accessor for AutomationSnippetModel();
  v7 = a1 + v6[5];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + v6[6];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v5(a1 + v6[7], v4);
  v5(a1 + v6[8], v4);
  v11 = a1 + v6[9];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);

  v13 = a1 + *(int *)(a2 + 28);
  v14 = sub_23E1BDE38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

uint64_t initializeWithCopy for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
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
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  id v33;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = (int *)type metadata accessor for AutomationSnippetModel();
  v9 = v8[5];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = v8[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  v17 = v8[9];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = a3[5];
  v22 = a3[6];
  v23 = (_QWORD *)(a1 + v21);
  v24 = a2 + v21;
  v26 = *(void **)v24;
  v25 = *(_QWORD *)(v24 + 8);
  v27 = *(_BYTE *)(a2 + v22);
  *v23 = v26;
  v23[1] = v25;
  *(_BYTE *)(a1 + v22) = v27;
  v28 = a3[7];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = sub_23E1BDE38();
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
  v33 = v26;
  v32(v29, v30, v31);
  return a1;
}

uint64_t assignWithCopy for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
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
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = (int *)type metadata accessor for AutomationSnippetModel();
  v9 = v8[5];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = v8[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  v17 = v8[9];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  v21 = a3[5];
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  v24 = *(void **)(a1 + v21);
  v25 = *(void **)(a2 + v21);
  *v22 = v25;
  v26 = v25;

  v22[1] = *(_QWORD *)(v23 + 8);
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v27 = a3[7];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v28, v29, v30);
  return a1;
}

uint64_t initializeWithTake for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = (int *)type metadata accessor for AutomationSnippetModel();
  v9 = v8[5];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = v8[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  v17 = v8[9];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v21) = *(_BYTE *)(a2 + v21);
  v22 = a3[7];
  v23 = a1 + v22;
  v24 = a2 + v22;
  v25 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
  return a1;
}

uint64_t assignWithTake for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
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
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = (int *)type metadata accessor for AutomationSnippetModel();
  v9 = v8[5];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = v8[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  v17 = v8[9];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = a3[5];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  v24 = *(void **)(a1 + v21);
  *v22 = *v23;

  v22[1] = v23[1];
  v25 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E187B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 2147483646)
  {
    v7 = OUTLINED_FUNCTION_11_1();
    v8 = v4 + *(int *)(a3 + 28);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for AutomationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E187BB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20)) = v4;
      return result;
    }
    v9 = OUTLINED_FUNCTION_11_1();
    v10 = v5 + *(int *)(a4 + 28);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t sub_23E187C38()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for AutomationSnippetModel();
  if (v1 <= 0x3F)
  {
    result = sub_23E1BDE38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23E187CD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D34AF0;
  if (!qword_256D34AF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34A50);
    sub_23E18819C(&qword_256D34AF8, &qword_256D349F8);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D34AF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DevicesSnippetView()
{
  return &type metadata for DevicesSnippetView;
}

ValueMetadata *type metadata accessor for ScenesSnippetView()
{
  return &type metadata for ScenesSnippetView;
}

uint64_t sub_23E187D78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E187D88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E187D98()
{
  return sub_23E1882F8(&qword_256D34B10, &qword_256D34B00, (uint64_t (*)(void))sub_23E187DBC, MEMORY[0x24BDF5578]);
}

unint64_t sub_23E187DBC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_256D34B18;
  if (!qword_256D34B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34B20);
    v4[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34B28);
    v4[3] = sub_23E187E68();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23E18819C(&qword_256D34B40, &qword_256D34B48);
    v4[0] = OpaqueTypeConformance2;
    v4[1] = v3;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256D34B18);
  }
  return result;
}

unint64_t sub_23E187E68()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D34B30;
  if (!qword_256D34B30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34B28);
    sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D34B30);
  }
  return result;
}

void sub_23E187EEC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_14_0();
  }
  OUTLINED_FUNCTION_9();
}

void sub_23E187F20(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_13_0(v2);
  OUTLINED_FUNCTION_9();
}

unint64_t sub_23E187F48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_256D34BA0;
  if (!qword_256D34BA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34B70);
    v2 = sub_23E1BE2F4();
    sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23E18819C(&qword_256D34B40, &qword_256D34B48);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_256D34BA0);
  }
  return result;
}

unint64_t sub_23E188010()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_256D34C20;
  if (!qword_256D34C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34C18);
    v2 = sub_23E188094();
    sub_23E18819C(&qword_256D34B40, &qword_256D34B48);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256D34C20);
  }
  return result;
}

unint64_t sub_23E188094()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D34C28;
  if (!qword_256D34C28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34C10);
    v2[0] = sub_23E188100();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D34C28);
  }
  return result;
}

unint64_t sub_23E188100()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256D34C30;
  if (!qword_256D34C30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34C08);
    sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v3 = v2;
    sub_23E18819C(&qword_256D34C38, &qword_256D34C40);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256D34C30);
  }
  return result;
}

void sub_23E18819C(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_14_0();
  }
  OUTLINED_FUNCTION_9();
}

unint64_t sub_23E1881D0()
{
  unint64_t result;

  result = qword_256D34C48;
  if (!qword_256D34C48)
  {
    result = MEMORY[0x24264D408](&unk_23E1BEEB4, &type metadata for ScenesSnippetView);
    atomic_store(result, (unint64_t *)&qword_256D34C48);
  }
  return result;
}

unint64_t sub_23E18820C()
{
  unint64_t result;

  result = qword_256D34C50;
  if (!qword_256D34C50)
  {
    result = MEMORY[0x24264D408](&unk_23E1BEF04, &type metadata for DevicesSnippetView);
    atomic_store(result, (unint64_t *)&qword_256D34C50);
  }
  return result;
}

void sub_23E188248(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_10_0(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_9();
}

void sub_23E18827C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_10_0(a1, a2, a3);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_9();
}

void sub_23E18829C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_13_0(v2);
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1882C4()
{
  return sub_23E1882F8(&qword_256D34CC0, &qword_256D34CC8, sub_23E187D98, MEMORY[0x24BDF4A08]);
}

uint64_t sub_23E1882F8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24264D408](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return type metadata accessor for AutomationView();
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return type metadata accessor for AutomationSnippetModel();
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_23E1BDE38();
}

uint64_t OUTLINED_FUNCTION_12_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_14_0()
{
  JUMPOUT(0x24264D408);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_23E186F48(v2, a1 + v1);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_allocObject();
}

uint64_t TemperatureSnippetModel.primaryText.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_16();
  return v1;
}

uint64_t sub_23E188458()
{
  swift_bridgeObjectRetain();
  return TemperatureSnippetModel.primaryText.setter();
}

uint64_t TemperatureSnippetModel.primaryText.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  return OUTLINED_FUNCTION_14();
}

void TemperatureSnippetModel.primaryText.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void TemperatureSnippetModel.secondaryText.getter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

uint64_t type metadata accessor for TemperatureSnippetModel()
{
  uint64_t result;

  result = qword_256D34DA0;
  if (!qword_256D34DA0)
    return swift_getSingletonMetadata();
  return result;
}

void TemperatureSnippetModel.secondaryText.setter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void TemperatureSnippetModel.secondaryText.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void TemperatureSnippetModel.temperature.getter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

void sub_23E18862C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  v7 = a1[1];
  swift_bridgeObjectRetain();
  a5(v6, v7);
  OUTLINED_FUNCTION_2_0();
}

void TemperatureSnippetModel.temperature.setter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void TemperatureSnippetModel.temperature.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t TemperatureSnippetModel.isHeating.getter()
{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  sub_23E1BDDCC();
  return v1;
}

void TemperatureSnippetModel.isHeating.setter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  sub_23E1BDDD8();
  OUTLINED_FUNCTION_7_0();
}

void TemperatureSnippetModel.isHeating.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void TemperatureSnippetModel.punchOut.getter()
{
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_9();
}

void sub_23E1887F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1888E8(a1, (uint64_t)v4);
  TemperatureSnippetModel.punchOut.setter((uint64_t)v4);
}

void TemperatureSnippetModel.punchOut.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8();
  sub_23E1888E8(a1, v4 - v3);
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  sub_23E1BDDD8();
  sub_23E188930(a1);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1888E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E188930(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void TemperatureSnippetModel.punchOut.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1889BC()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_23E188A08()
{
  return 5;
}

uint64_t sub_23E188A10(char a1)
{
  return *(_QWORD *)&aTemperatprimar[8 * a1];
}

void sub_23E188A30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  sub_23E1B5B2C(*a1, *a2);
}

void sub_23E188A3C()
{
  unsigned __int8 *v0;

  sub_23E1B5D5C(*v0);
}

uint64_t sub_23E188A44(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23E1B5F1C(a1, *v1);
}

void sub_23E188A4C(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23E1B61A8(a1, *v1);
}

uint64_t sub_23E188A54@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1889BC();
  *a1 = result;
  return result;
}

void sub_23E188A80(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = sub_23E188A10(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E188AA4()
{
  char *v0;

  return sub_23E188A10(*v0);
}

uint64_t sub_23E188AAC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E188A04();
  *a1 = result;
  return result;
}

uint64_t sub_23E188AD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E188A08();
  *a1 = result;
  return result;
}

uint64_t sub_23E188AF4()
{
  sub_23E189218();
  return sub_23E1BE708();
}

uint64_t sub_23E188B1C()
{
  sub_23E189218();
  return sub_23E1BE714();
}

Swift::String __swiftcall TemperatureSnippetModel.responseViewId()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x800000023E1C22E0;
  v1 = 0xD000000000000019;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t TemperatureSnippetModel.init(primaryText:temperature:secondaryText:isHeating:punchOut:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
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
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a8;
  v27 = a7;
  v25 = a5;
  v26 = a6;
  v22 = a4;
  v23 = a1;
  v24 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  v12 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - v13;
  v15 = OUTLINED_FUNCTION_0_1();
  v29 = 0;
  v30 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  sub_23E1BDDB4();
  v16 = a9 + *(int *)(v15 + 24);
  v29 = 0;
  v30 = 0;
  OUTLINED_FUNCTION_15_1();
  LOBYTE(v29) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  OUTLINED_FUNCTION_28_0();
  sub_23E1BDDB4();
  v17 = sub_23E1BDD0C();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v17);
  OUTLINED_FUNCTION_20_0();
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_19_0();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v16, v18);
  v29 = a3;
  v30 = v22;
  OUTLINED_FUNCTION_15_1();
  v29 = v23;
  v30 = v24;
  sub_23E1BDDB4();
  v29 = v25;
  v30 = v26;
  sub_23E1BDDD8();
  LOBYTE(v29) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_28_0();
  sub_23E1BDDD8();
  v19 = v28;
  sub_23E1888E8(v28, (uint64_t)v14);
  OUTLINED_FUNCTION_20_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  sub_23E1BDDD8();
  OUTLINED_FUNCTION_19_0();
  return sub_23E188930(v19);
}

void TemperatureSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  int *v15;
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
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v49 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF8);
  v50 = *(_QWORD *)(v3 - 8);
  v51 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2();
  v48 = v8;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v43 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v43 - v13;
  v15 = (int *)type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_8();
  v19 = v18 - v17;
  v21 = v18 - v17 + *(int *)(v20 + 20);
  v55 = 0;
  v56 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  v57 = v21;
  sub_23E1BDDB4();
  v22 = v19 + v15[6];
  v55 = 0;
  v56 = 0;
  v53 = v22;
  sub_23E1BDDB4();
  v23 = v19 + v15[7];
  LOBYTE(v55) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  OUTLINED_FUNCTION_28_0();
  v54 = v23;
  sub_23E1BDDB4();
  v24 = v19 + v15[8];
  v25 = sub_23E1BDD0C();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v25);
  sub_23E1888E8((uint64_t)v14, (uint64_t)v12);
  sub_23E1BDDB4();
  sub_23E188930((uint64_t)v14);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E189218();
  v26 = v52;
  sub_23E1BE6F0();
  if (v26)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v29 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8);
    v29(v57, v28);
    v29(v53, v28);
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v54, v30);
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v24, v31);
  }
  else
  {
    v46 = v25;
    v47 = v19;
    v52 = v24;
    v44 = v14;
    v27 = v50;
    LOBYTE(v55) = 1;
    v55 = OUTLINED_FUNCTION_22_0();
    v56 = v32;
    sub_23E1BDDB4();
    LOBYTE(v55) = 2;
    v45 = v6;
    v33 = OUTLINED_FUNCTION_22_0();
    v43 = a1;
    v55 = v33;
    v56 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    sub_23E1BDDD8();
    LOBYTE(v55) = 0;
    OUTLINED_FUNCTION_27_0();
    v55 = sub_23E1BE63C();
    v56 = v35;
    sub_23E1BDDD8();
    LOBYTE(v55) = 3;
    OUTLINED_FUNCTION_27_0();
    v36 = sub_23E1BE648() & 1;
    v37 = v27;
    v38 = v48;
    LOBYTE(v55) = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    OUTLINED_FUNCTION_28_0();
    sub_23E1BDDD8();
    LOBYTE(v55) = 4;
    sub_23E189D50(&qword_256D34D08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v39 = v45;
    sub_23E1BE654();
    v40 = v47;
    v41 = v49;
    v42 = (uint64_t)v44;
    __swift_storeEnumTagSinglePayload(v38, 0, 1, v46);
    sub_23E1888E8(v38, v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    sub_23E1BDDD8();
    sub_23E188930(v38);
    OUTLINED_FUNCTION_26_0(v39, *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8));
    sub_23E189254(v40, v41);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    sub_23E189298(v40);
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E189218()
{
  unint64_t result;

  result = qword_256D34D00;
  if (!qword_256D34D00)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF134, &type metadata for TemperatureSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34D00);
  }
  return result;
}

uint64_t sub_23E189254(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TemperatureSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E189298(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TemperatureSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void TemperatureSnippetModel.encode(to:)(_QWORD *a1)
{
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34D10);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E189218();
  sub_23E1BE6FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE678();
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
    OUTLINED_FUNCTION_9_2();
  }
  else
  {
    OUTLINED_FUNCTION_9_2();
    type metadata accessor for TemperatureSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    sub_23E1BDDCC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
    sub_23E189620((unint64_t *)&qword_256D34D18, &qword_256D34CE8, MEMORY[0x24BEE0D08]);
    sub_23E1BE690();
    OUTLINED_FUNCTION_9_2();
    sub_23E1BDDCC();
    sub_23E1BE690();
    OUTLINED_FUNCTION_9_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    sub_23E1BDDCC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
    sub_23E189620(&qword_256D34D20, &qword_256D34CF0, MEMORY[0x24BEE1330]);
    sub_23E1BE690();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    sub_23E1BDDCC();
    sub_23E189674();
    sub_23E1BE690();
    sub_23E188930(v5);
    OUTLINED_FUNCTION_26_0(v10, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  }
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_23E189620(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3;
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23E189674()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256D34D28;
  if (!qword_256D34D28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34CE0);
    v2 = sub_23E189D50(&qword_256D34D30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D34D28);
  }
  return result;
}

unint64_t TemperatureSnippetModel.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v18[2];
  unint64_t v19;
  unint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v2 = v1 - v0;
  v3 = sub_23E1BDD0C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  v15 = v5;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - v6;
  v19 = 0xD000000000000018;
  v20 = 0x800000023E1C2300;
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_8_0();
  strcpy((char *)v18, "primaryText: ");
  HIWORD(v18[1]) = -4864;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v18[0] = 0;
  v18[1] = 0xE000000000000000;
  sub_23E1BE480();
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  sub_23E1BDDCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  sub_23E1BE5F4();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  if (v18[1])
  {
    v18[0] = 0;
    v18[1] = 0xE000000000000000;
    sub_23E1BE5B8();
    OUTLINED_FUNCTION_8_0();
    v18[0] = 0xD000000000000011;
    v18[1] = 0x800000023E1C2320;
    sub_23E1BE480();
    swift_bridgeObjectRelease();
    sub_23E1BE480();
    swift_bridgeObjectRelease();
  }
  sub_23E1BDDCC();
  if (v18[1])
  {
    v18[0] = 0;
    v18[1] = 0xE000000000000000;
    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_8_0();
    v18[0] = 0x7265706D6574202CLL;
    v18[1] = 0xEF203A6572757461;
    sub_23E1BE480();
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_33_0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
  {
    OUTLINED_FUNCTION_19_0();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v7, v2, v3);
    v8 = v15;
    sub_23E1BDD00();
    v9 = sub_23E1BDCE8();
    v11 = v10;
    v12 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v12(v8, v3);
    v18[0] = v9;
    v18[1] = v11;
    swift_bridgeObjectRetain();
    LOBYTE(v9) = sub_23E1BE4B0();
    OUTLINED_FUNCTION_9_2();
    if ((v9 & 1) != 0)
    {
      sub_23E189AF4();
      swift_bridgeObjectRelease();
    }
    v16 = 0x74756F68636E7570;
    v17 = 0xEA0000000000203ALL;
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_9_2();
    v12((uint64_t)v7, v3);
  }
  sub_23E1BE480();
  return v19;
}

uint64_t sub_23E189AF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[1];
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((*v0 & 0xFFFFFFFFFFFFLL) != 0)
    {
LABEL_5:
      sub_23E1BE468();
      return sub_23E1BE48C();
    }
    __break(1u);
  }
  if ((v1 & 0xF00000000000000) != 0)
    goto LABEL_5;
  __break(1u);
  return result;
}

uint64_t TemperatureSnippetModel.stringId.getter()
{
  _QWORD v1[2];

  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "#primaryText: ");
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_9_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  sub_23E1BE438();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t sub_23E189CF8()
{
  return sub_23E189D50(&qword_256D34D38, (uint64_t (*)(uint64_t))type metadata accessor for TemperatureSnippetModel, (uint64_t)&protocol conformance descriptor for TemperatureSnippetModel);
}

uint64_t sub_23E189D24()
{
  return sub_23E189D50(&qword_256D34D40, (uint64_t (*)(uint64_t))type metadata accessor for TemperatureSnippetModel, (uint64_t)&protocol conformance descriptor for TemperatureSnippetModel);
}

uint64_t sub_23E189D50(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24264D408](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_23E189D90(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TemperatureSnippetModel.init(from:)(a1, a2);
}

void sub_23E189DA4(_QWORD *a1)
{
  TemperatureSnippetModel.encode(to:)(a1);
}

void sub_23E189DB8()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  *v0 = TemperatureSnippetModel.primaryText.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E189DDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  TemperatureSnippetModel.secondaryText.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E189DFC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23E18862C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))TemperatureSnippetModel.secondaryText.setter);
}

void sub_23E189E18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  TemperatureSnippetModel.temperature.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E189E38(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23E18862C(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))TemperatureSnippetModel.temperature.setter);
}

void sub_23E189E54()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20();
  *v0 = TemperatureSnippetModel.isHeating.getter();
  OUTLINED_FUNCTION_9();
}

void sub_23E189E74()
{
  TemperatureSnippetModel.isHeating.setter();
  OUTLINED_FUNCTION_9();
}

void sub_23E189E94()
{
  TemperatureSnippetModel.punchOut.getter();
  OUTLINED_FUNCTION_9();
}

char *initializeBufferWithCopyOfBuffer for TemperatureSnippetModel(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[a3[6]], (char *)a2 + a3[6], v11);
    v13 = a3[7];
    v14 = &a1[v13];
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = a3[8];
    v18 = &a1[v17];
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for TemperatureSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[6], v6);
  v8 = a1 + a2[7];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + a2[8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t initializeWithCopy for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for TemperatureSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E18A500(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_17();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_17();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
      OUTLINED_FUNCTION_17();
      if (v12)
      {
        v7 = v13;
        v11 = a3[7];
      }
      else
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
        v11 = a3[8];
      }
    }
    v8 = a1 + v11;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for TemperatureSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E18A5B4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_18();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_18();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
      OUTLINED_FUNCTION_18();
      if (v13)
      {
        v8 = v14;
        v12 = a4[7];
      }
      else
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
        v12 = a4[8];
      }
    }
    v9 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

void sub_23E18A664()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23E18A750();
  if (v0 <= 0x3F)
  {
    sub_23E18A798(319, &qword_256D34DB0, &qword_256D34CE8);
    if (v1 <= 0x3F)
    {
      sub_23E18A798(319, &qword_256D34DB8, &qword_256D34CF0);
      if (v2 <= 0x3F)
      {
        sub_23E18A798(319, qword_256D34DC0, &qword_256D34CE0);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_23E18A750()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D34980)
  {
    v0 = sub_23E1BDDF0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D34980);
  }
}

void sub_23E18A798(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_23E1BDDF0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t getEnumTagSinglePayload for TemperatureSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TemperatureSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E18A8B8 + 4 * byte_23E1BEF95[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23E18A8EC + 4 * byte_23E1BEF90[v4]))();
}

uint64_t sub_23E18A8EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E18A8F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E18A8FCLL);
  return result;
}

uint64_t sub_23E18A908(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E18A910);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23E18A914(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E18A91C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureSnippetModel.CodingKeys()
{
  return &type metadata for TemperatureSnippetModel.CodingKeys;
}

unint64_t sub_23E18A93C()
{
  unint64_t result;

  result = qword_256D34E00;
  if (!qword_256D34E00)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF10C, &type metadata for TemperatureSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34E00);
  }
  return result;
}

unint64_t sub_23E18A97C()
{
  unint64_t result;

  result = qword_256D34E08;
  if (!qword_256D34E08)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF044, &type metadata for TemperatureSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34E08);
  }
  return result;
}

unint64_t sub_23E18A9BC()
{
  unint64_t result;

  result = qword_256D34E10;
  if (!qword_256D34E10)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF06C, &type metadata for TemperatureSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34E10);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return type metadata accessor for TemperatureSnippetModel();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_23E1BDDB4();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;

  return sub_23E188930(v0);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23E1888E8(v1, v0);
}

void OUTLINED_FUNCTION_21_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_23E1BE63C();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_23E1BE5B8();
}

uint64_t OUTLINED_FUNCTION_26_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  uint64_t v0;

  return v0 - 96;
}

void OUTLINED_FUNCTION_30_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t ConfirmationSnippetModel.primaryText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ConfirmationSnippetModel.primaryText.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*ConfirmationSnippetModel.primaryText.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.secondaryText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void ConfirmationSnippetModel.secondaryText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*ConfirmationSnippetModel.secondaryText.modify())()
{
  return nullsub_1;
}

void ConfirmationSnippetModel.confirmLabel.getter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_7_0();
}

uint64_t type metadata accessor for ConfirmationSnippetModel()
{
  uint64_t result;

  result = qword_256D34EE8;
  if (!qword_256D34EE8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E18ABE0()
{
  swift_bridgeObjectRetain();
  ConfirmationSnippetModel.confirmLabel.setter();
}

void ConfirmationSnippetModel.confirmLabel.setter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void ConfirmationSnippetModel.confirmLabel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void ConfirmationSnippetModel.denyLabel.getter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_7_0();
}

void sub_23E18ACDC()
{
  swift_bridgeObjectRetain();
  ConfirmationSnippetModel.denyLabel.setter();
}

void ConfirmationSnippetModel.denyLabel.setter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void ConfirmationSnippetModel.denyLabel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void ConfirmationSnippetModel.confirmDirectInvocation.getter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  sub_23E1BDD60();
  OUTLINED_FUNCTION_9();
}

void sub_23E18ADCC(id *a1)
{
  id v1;

  v1 = *a1;
  ConfirmationSnippetModel.confirmDirectInvocation.setter();
}

void ConfirmationSnippetModel.confirmDirectInvocation.setter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_9();
}

void ConfirmationSnippetModel.confirmDirectInvocation.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v1[4] = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_2_0();
}

void ConfirmationSnippetModel.denyDirectInvocation.getter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  sub_23E1BDD60();
  OUTLINED_FUNCTION_9();
}

void sub_23E18AEA4(id *a1)
{
  id v1;

  v1 = *a1;
  ConfirmationSnippetModel.denyDirectInvocation.setter();
}

void ConfirmationSnippetModel.denyDirectInvocation.setter()
{
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_9();
}

void ConfirmationSnippetModel.denyDirectInvocation.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v1[4] = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t ConfirmationSnippetModel.iconConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_2() + 40);
  return sub_23E18AF78(v3, a1);
}

uint64_t sub_23E18AF78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmationSnippetModel.iconConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_0_2() + 40);
  return sub_23E18AFEC(a1, v3);
}

uint64_t sub_23E18AFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ConfirmationSnippetModel.iconConfiguration.modify())()
{
  OUTLINED_FUNCTION_0_2();
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.isDestructive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_2() + 44));
}

void ConfirmationSnippetModel.isDestructive.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_0_2() + 44)) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*ConfirmationSnippetModel.isDestructive.modify())()
{
  OUTLINED_FUNCTION_0_2();
  return nullsub_1;
}

uint64_t sub_23E18B0BC()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t sub_23E18B108()
{
  return 8;
}

uint64_t sub_23E18B110(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E18B14C + 4 * byte_23E1BF1E0[a1]))(0xD000000000000017, 0x800000023E1C1C20);
}

uint64_t sub_23E18B14C()
{
  return 0x547972616D697270;
}

uint64_t sub_23E18B16C()
{
  return 0x7261646E6F636573;
}

uint64_t sub_23E18B190()
{
  return 0x4C6D7269666E6F63;
}

uint64_t sub_23E18B1B0()
{
  return 0x6562614C796E6564;
}

uint64_t sub_23E18B1CC()
{
  uint64_t v0;

  return v0 + 3;
}

uint64_t sub_23E18B1E4()
{
  return 0x7572747365447369;
}

unint64_t sub_23E18B208()
{
  return 0xD000000000000011;
}

uint64_t sub_23E18B224(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E18B260 + 4 * byte_23E1BF1E8[a1]))(0xD000000000000017, 0x800000023E1C1C20);
}

uint64_t sub_23E18B260()
{
  return 0x547972616D697270;
}

uint64_t sub_23E18B280()
{
  return 0x7261646E6F636573;
}

uint64_t sub_23E18B2A4()
{
  return 0x4C6D7269666E6F63;
}

uint64_t sub_23E18B2C4()
{
  return 0x6562614C796E6564;
}

uint64_t sub_23E18B2E0()
{
  uint64_t v0;

  return v0 + 3;
}

uint64_t sub_23E18B2F8()
{
  return 0x7572747365447369;
}

unint64_t sub_23E18B31C()
{
  return 0xD000000000000011;
}

void sub_23E18B338(unsigned __int8 *a1, unsigned __int8 *a2)
{
  sub_23E1B5A14(*a1, *a2);
}

void sub_23E18B344()
{
  unsigned __int8 *v0;

  sub_23E1B5D68(*v0);
}

uint64_t sub_23E18B34C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23E1B5E84(a1, *v1);
}

void sub_23E18B354(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23E1B6264(a1, *v1);
}

uint64_t sub_23E18B35C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E18B0BC();
  *a1 = result;
  return result;
}

void sub_23E18B388(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_23E18B110(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E18B3AC()
{
  unsigned __int8 *v0;

  return sub_23E18B224(*v0);
}

uint64_t sub_23E18B3B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E18B104();
  *a1 = result;
  return result;
}

uint64_t sub_23E18B3D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E18B108();
  *a1 = result;
  return result;
}

uint64_t sub_23E18B3FC()
{
  sub_23E18BAF4();
  return sub_23E1BE708();
}

uint64_t sub_23E18B424()
{
  sub_23E18BAF4();
  return sub_23E1BE714();
}

Swift::String __swiftcall ConfirmationSnippetModel.responseViewId()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x800000023E1C2360;
  v1 = 0xD00000000000001BLL;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t ConfirmationSnippetModel.init(primaryText:secondaryText:confirmLabel:denyLabel:confirmDirectInvocation:denyDirectInvocation:iconConfiguration:isDestructive:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>, void *a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v14 = OUTLINED_FUNCTION_0_2();
  v15 = (uint64_t)a5 + *(int *)(v14 + 40);
  v16 = OUTLINED_FUNCTION_24();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_44();
  sub_23E18B5A4();
  v17 = a6;
  sub_23E1BDD48();
  sub_23E1BDD48();

  *((_BYTE *)a5 + *(int *)(v14 + 44)) = a9;
  return sub_23E18AFEC(a8, v15);
}

unint64_t sub_23E18B5A4()
{
  unint64_t result;

  result = qword_256D34E28;
  if (!qword_256D34E28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256D34E28);
  }
  return result;
}

void ConfirmationSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD);
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD, _QWORD);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t *v42;
  void (*v43)(_QWORD, _QWORD);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v38 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v39 = v5 - v4;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v46 = *(_QWORD *)(v49 - 8);
  v6 = MEMORY[0x24BDAC7A8](v49);
  v40 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v33 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E30);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8();
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8();
  v14 = (uint64_t *)(v13 - v12);
  v14[2] = 0;
  v14[3] = 0;
  v45 = v15;
  v16 = *(int *)(v15 + 40);
  v42 = v14;
  v17 = (uint64_t)v14 + v16;
  v18 = type metadata accessor for IconConfiguration();
  v44 = v17;
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v18);
  v19 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_23E18BAF4();
  v20 = v43;
  sub_23E1BE6F0();
  if (v20)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    swift_bridgeObjectRelease();
    sub_23E18BB30(v44);
  }
  else
  {
    v43 = (void (*)(_QWORD, _QWORD))v9;
    v37 = v18;
    LOBYTE(v47) = 0;
    OUTLINED_FUNCTION_33_1();
    v21 = sub_23E1BE63C();
    v22 = v42;
    *v42 = v21;
    v22[1] = v23;
    v22[2] = OUTLINED_FUNCTION_9_3(1);
    v22[3] = v24;
    LOBYTE(v47) = 2;
    v47 = sub_23E1BE63C();
    v48 = v25;
    sub_23E1BDDB4();
    v47 = OUTLINED_FUNCTION_9_3(3);
    v48 = v26;
    sub_23E1BDDB4();
    LOBYTE(v47) = 4;
    sub_23E18C068(&qword_256D34E40);
    OUTLINED_FUNCTION_34_0();
    v27 = v43;
    v28 = v49;
    v35 = v29;
    v36 = v10;
    OUTLINED_FUNCTION_12_2();
    v34 = OUTLINED_FUNCTION_27_1();
    v43 = *(void (**)(_QWORD, _QWORD))(v46 + 8);
    v43(v27, v28);
    v34 = sub_23E18B5A4();
    sub_23E1BDD48();
    LOBYTE(v47) = 5;
    v30 = v40;
    OUTLINED_FUNCTION_12_2();
    OUTLINED_FUNCTION_27_1();
    v43(v30, v28);
    sub_23E1BDD48();
    LOBYTE(v47) = 7;
    sub_23E187EEC(&qword_256D348D8, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_12_2();
    v32 = v38;
    v31 = v39;
    __swift_storeEnumTagSinglePayload(v39, 0, 1, v37);
    sub_23E18AFEC(v31, v44);
    LOBYTE(v47) = 6;
    OUTLINED_FUNCTION_33_1();
    LOBYTE(v31) = sub_23E1BE648();
    OUTLINED_FUNCTION_22_1();
    *((_BYTE *)v22 + *(int *)(v45 + 44)) = v31 & 1;
    sub_23E18BB70((uint64_t)v22, v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    sub_23E180BA4((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationSnippetModel);
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E18BAF4()
{
  unint64_t result;

  result = qword_256D34E38;
  if (!qword_256D34E38)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF404, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34E38);
  }
  return result;
}

uint64_t sub_23E18BB30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E18BB70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void ConfirmationSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(unint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v5 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  v35 = v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v31 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E48);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8();
  v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E18BAF4();
  sub_23E1BE6FC();
  LOBYTE(v37) = 0;
  v16 = v36;
  sub_23E1BE678();
  if (v16)
  {
    v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v18 = v15;
    v19 = v11;
  }
  else
  {
    v32 = v8;
    v20 = *(_QWORD *)(v2 + 16);
    v21 = *(_QWORD *)(v2 + 24);
    v36 = (unint64_t)v10;
    v37 = v20;
    v38 = v21;
    v39 = 1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
    sub_23E18BF90();
    OUTLINED_FUNCTION_4_2();
    v33 = v12;
    swift_bridgeObjectRelease();
    v22 = type metadata accessor for ConfirmationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    sub_23E1BDDCC();
    LOBYTE(v37) = 2;
    OUTLINED_FUNCTION_26_1();
    swift_bridgeObjectRelease();
    v31 = v22;
    LOBYTE(v37) = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    sub_23E18BFEC();
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_4_2();
    v24 = v35;
    v23 = v36;
    sub_23E1BDDCC();
    LOBYTE(v37) = 3;
    OUTLINED_FUNCTION_26_1();
    swift_bridgeObjectRelease();
    v25 = v24;
    v26 = v34;
    sub_23E1BDD60();
    v36 = sub_23E18B5A4();
    sub_23E1BDD48();
    LOBYTE(v37) = 4;
    sub_23E18C068(&qword_256D34E58);
    OUTLINED_FUNCTION_34_0();
    v35 = v27;
    OUTLINED_FUNCTION_4_2();
    v28 = v23;
    v29 = *(void (**)(unint64_t, uint64_t))(v25 + 8);
    v29(v28, v26);
    sub_23E1BDD60();
    v30 = v32;
    sub_23E1BDD48();
    LOBYTE(v37) = 5;
    OUTLINED_FUNCTION_4_2();
    v29((unint64_t)v30, v26);
    LOBYTE(v37) = 6;
    sub_23E1BE684();
    v18 = OUTLINED_FUNCTION_43();
  }
  v17(v18, v19);
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E18BF90()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256D34D18;
  if (!qword_256D34D18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34CE8);
    v2 = MEMORY[0x24BEE0D08];
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D34D18);
  }
  return result;
}

unint64_t sub_23E18BFEC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256D34E50;
  if (!qword_256D34E50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34E20);
    sub_23E187EEC(&qword_256D348F0, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    v3 = v2;
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256D34E50);
  }
  return result;
}

void sub_23E18C068(_QWORD *a1)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34E18);
    OUTLINED_FUNCTION_14_0();
  }
  OUTLINED_FUNCTION_9();
}

unint64_t ConfirmationSnippetModel.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];
  unint64_t v5;
  unint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_19_1();
  v5 = 0xD000000000000019;
  v6 = 0x800000023E1C2380;
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_8_0();
  strcpy((char *)v4, "primaryText: ");
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_9_2();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  strcpy((char *)v4, "confirmLabel: ");
  v1 = OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  strcpy((char *)v4, "denyLabel: ");
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_8_0();
  v4[0] = 0x7572747365447369;
  v4[1] = 0xEF203A6576697463;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  if (*(_QWORD *)(v0 + 24))
  {
    sub_23E1BE5B8();
    OUTLINED_FUNCTION_8_0();
    v4[0] = 0xD000000000000011;
    v4[1] = 0x800000023E1C2320;
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_19();
  }
  v4[0] = 0;
  v4[1] = 0xE000000000000000;
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  v4[0] = 0xD000000000000015;
  v4[1] = 0x800000023E1C23A0;
  OUTLINED_FUNCTION_37_0(*(int *)(v1 + 40));
  v2 = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_1(v2);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  sub_23E1BE480();
  return v5;
}

uint64_t ConfirmationSnippetModel.stringId.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_19_1();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  strcpy((char *)v4, "#primaryText: ");
  HIBYTE(v4[1]) = -18;
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_9_2();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v1 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_37_0(*(int *)(v1 + 40));
  v2 = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_1(v2);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_31();
  return v4[0];
}

void sub_23E18C570()
{
  sub_23E187EEC(&qword_256D34E60, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
}

void sub_23E18C59C()
{
  sub_23E187EEC(&qword_256D34E68, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
}

void sub_23E18C5C8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  ConfirmationSnippetModel.init(from:)(a1, a2);
}

void sub_23E18C5DC(_QWORD *a1)
{
  ConfirmationSnippetModel.encode(to:)(a1);
}

void sub_23E18C5F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  ConfirmationSnippetModel.confirmLabel.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E18C614()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  ConfirmationSnippetModel.denyLabel.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E18C638()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  ConfirmationSnippetModel.confirmDirectInvocation.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E18C65C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  ConfirmationSnippetModel.denyDirectInvocation.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_9();
}

char *initializeBufferWithCopyOfBuffer for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = *((_QWORD *)a2 + 3);
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = &a2[v9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    v13(&a1[a3[7]], &a2[a3[7]], v12);
    v14 = a3[8];
    v15 = &a1[v14];
    v16 = &a2[v14];
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    v18(&a1[a3[9]], &a2[a3[9]], v17);
    v19 = a3[10];
    v20 = &a1[v19];
    v21 = &a2[v19];
    v22 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, (uint64_t)v22))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      v52 = v18;
      v53 = v17;
      v13(v20, v21, v12);
      v25 = v22[5];
      v26 = &v20[v25];
      v27 = &v21[v25];
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v54 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
      v55 = v28;
      v54(v26, v27, v28);
      v29 = v22[6];
      v30 = &v20[v29];
      v31 = &v21[v29];
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
      v33 = v22[7];
      v34 = &v20[v33];
      v35 = &v21[v33];
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v37 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16);
      v37(v34, v35, v36);
      v37(&v20[v22[8]], &v21[v22[8]], v36);
      v38 = v22[9];
      v39 = &v20[v38];
      v40 = &v21[v38];
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v39, v40, v41);
      v54(&v20[v22[10]], &v21[v22[10]], v55);
      v42 = v22[11];
      v43 = &v20[v42];
      v44 = &v21[v42];
      v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v43, v44, v45);
      v54(&v20[v22[12]], &v21[v22[12]], v55);
      v54(&v20[v22[13]], &v21[v22[13]], v55);
      v46 = v22[14];
      v47 = &v20[v46];
      v48 = &v21[v46];
      v49 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49))
      {
        v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
      }
      else
      {
        v52(v47, v48, v53);
        __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, (uint64_t)v22);
    }
    a1[a3[11]] = a2[a3[11]];
  }
  return a1;
}

uint64_t destroy for ConfirmationSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[7], v5);
  v7 = a1 + a2[8];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v26(v7, v8);
  v26(a1 + a2[9], v8);
  v9 = a1 + a2[10];
  v10 = (int *)type metadata accessor for IconConfiguration();
  result = __swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10);
  if (!(_DWORD)result)
  {
    v6(v9, v5);
    v12 = v9 + v10[5];
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
    v14(v12, v13);
    v15 = v9 + v10[6];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    v17 = v9 + v10[7];
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v19 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8);
    v19(v17, v18);
    v19(v9 + v10[8], v18);
    v20 = v9 + v10[9];
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
    v14(v9 + v10[10], v13);
    v22 = v9 + v10[11];
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
    v14(v9 + v10[12], v13);
    v14(v9 + v10[13], v13);
    v24 = v9 + v10[14];
    v25 = type metadata accessor for DirectInvocationConfig();
    result = __swift_getEnumTagSinglePayload(v24, 1, v25);
    if (!(_DWORD)result)
      return ((uint64_t (*)(uint64_t, uint64_t))v26)(v24, v8);
  }
  return result;
}

char *initializeWithCopy for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  v13 = a3[8];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  v17(v14, v15, v16);
  v17(&a1[a3[9]], &a2[a3[9]], v16);
  v18 = a3[10];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v21))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v50 = v17;
    v51 = v16;
    v12(v19, v20, v11);
    v23 = v21[5];
    v24 = &v19[v23];
    v25 = &v20[v23];
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v52 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
    v53 = v26;
    v52(v24, v25, v26);
    v27 = v21[6];
    v28 = &v19[v27];
    v29 = &v20[v27];
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
    v31 = v21[7];
    v32 = &v19[v31];
    v33 = &v20[v31];
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
    v35(v32, v33, v34);
    v35(&v19[v21[8]], &v20[v21[8]], v34);
    v36 = v21[9];
    v37 = &v19[v36];
    v38 = &v20[v36];
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v37, v38, v39);
    v52(&v19[v21[10]], &v20[v21[10]], v53);
    v40 = v21[11];
    v41 = &v19[v40];
    v42 = &v20[v40];
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v41, v42, v43);
    v52(&v19[v21[12]], &v20[v21[12]], v53);
    v52(&v19[v21[13]], &v20[v21[13]], v53);
    v44 = v21[14];
    v45 = &v19[v44];
    v46 = &v20[v44];
    v47 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
    {
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v50(v45, v46, v51);
      __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, (uint64_t)v21);
  }
  a1[a3[11]] = a2[a3[11]];
  return a1;
}

char *assignWithCopy for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int EnumTagSinglePayload;
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
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  void *v49;
  const void *v50;
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
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  void (*v81)(uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v11(&a1[a3[7]], &a2[a3[7]], v9);
  v12 = a3[8];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v83 = *(_QWORD *)(v15 - 8);
  v16 = *(void (**)(char *, char *, uint64_t))(v83 + 24);
  v16(v13, v14, v15);
  v84 = v15;
  v16(&a1[a3[9]], &a2[a3[9]], v15);
  v85 = a3;
  v17 = a3[10];
  v18 = (uint64_t)&a1[v17];
  v19 = (uint64_t)&a2[v17];
  v20 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(v15) = __swift_getEnumTagSinglePayload(v18, 1, (uint64_t)v20);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v19, 1, (uint64_t)v20);
  if ((_DWORD)v15)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v18, v19, v9);
      v22 = v20[5];
      v23 = v18 + v22;
      v24 = v19 + v22;
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
      v81(v23, v24, v25);
      v26 = v20[6];
      v27 = v18 + v26;
      v28 = v19 + v26;
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
      v30 = v20[7];
      v31 = v18 + v30;
      v32 = v19 + v30;
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
      v34(v31, v32, v33);
      v34(v18 + v20[8], v19 + v20[8], v33);
      v35 = v20[9];
      v36 = v18 + v35;
      v37 = v19 + v35;
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
      v81(v18 + v20[10], v19 + v20[10], v25);
      v39 = v20[11];
      v40 = v18 + v39;
      v41 = v19 + v39;
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v40, v41, v42);
      v81(v18 + v20[12], v19 + v20[12], v25);
      v81(v18 + v20[13], v19 + v20[13], v25);
      v43 = v20[14];
      v44 = (void *)(v18 + v43);
      v45 = (const void *)(v19 + v43);
      v46 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
      {
        v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v83 + 16))(v44, v45, v84);
        __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
      }
      v77 = v18;
      v78 = (uint64_t)v20;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (EnumTagSinglePayload)
  {
    sub_23E180BA4(v18, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
LABEL_7:
    v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
    v49 = (void *)v18;
    v50 = (const void *)v19;
    goto LABEL_8;
  }
  v11((char *)v18, (char *)v19, v9);
  v51 = v20[5];
  v52 = v18 + v51;
  v53 = v19 + v51;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 24);
  v82 = v54;
  v80(v52, v53, v54);
  v55 = v20[6];
  v56 = v18 + v55;
  v57 = v19 + v55;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 24))(v56, v57, v58);
  v59 = v20[7];
  v60 = v18 + v59;
  v61 = v19 + v59;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 24);
  v63(v60, v61, v62);
  v63(v18 + v20[8], v19 + v20[8], v62);
  v64 = v20[9];
  v65 = v18 + v64;
  v66 = v19 + v64;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 24))(v65, v66, v67);
  v80(v18 + v20[10], v19 + v20[10], v82);
  v68 = v20[11];
  v69 = v18 + v68;
  v70 = v19 + v68;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 24))(v69, v70, v71);
  v80(v18 + v20[12], v19 + v20[12], v82);
  v80(v18 + v20[13], v19 + v20[13], v82);
  v72 = v20[14];
  v73 = v18 + v72;
  v74 = v19 + v72;
  v75 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v69) = __swift_getEnumTagSinglePayload(v73, 1, v75);
  v76 = __swift_getEnumTagSinglePayload(v74, 1, v75);
  if ((_DWORD)v69)
  {
    if (!v76)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v73, v74, v84);
      v77 = v73;
      v78 = v75;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v77, 0, 1, v78);
      goto LABEL_15;
    }
  }
  else
  {
    if (!v76)
    {
      v16((char *)v73, (char *)v74, v84);
      goto LABEL_15;
    }
    sub_23E180BA4(v73, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
  }
  v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
  v49 = (void *)v73;
  v50 = (const void *)v74;
LABEL_8:
  memcpy(v49, v50, v48);
LABEL_15:
  a1[v85[11]] = a2[v85[11]];
  return a1;
}

char *initializeWithTake for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  v7 = a3[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[7]], &a2[a3[7]], v10);
  v12 = a3[8];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v16(&a1[a3[9]], &a2[a3[9]], v15);
  v17 = a3[10];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, (uint64_t)v20))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v49 = v16;
    v50 = v15;
    v11(v18, v19, v10);
    v22 = v20[5];
    v23 = &v18[v22];
    v24 = &v19[v22];
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v51 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32);
    v52 = v25;
    v51(v23, v24, v25);
    v26 = v20[6];
    v27 = &v18[v26];
    v28 = &v19[v26];
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v27, v28, v29);
    v30 = v20[7];
    v31 = &v18[v30];
    v32 = &v19[v30];
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32);
    v34(v31, v32, v33);
    v34(&v18[v20[8]], &v19[v20[8]], v33);
    v35 = v20[9];
    v36 = &v18[v35];
    v37 = &v19[v35];
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
    v51(&v18[v20[10]], &v19[v20[10]], v52);
    v39 = v20[11];
    v40 = &v18[v39];
    v41 = &v19[v39];
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v40, v41, v42);
    v51(&v18[v20[12]], &v19[v20[12]], v52);
    v51(&v18[v20[13]], &v19[v20[13]], v52);
    v43 = v20[14];
    v44 = &v18[v43];
    v45 = &v19[v43];
    v46 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
    {
      v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
    }
    else
    {
      v49(v44, v45, v50);
      __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, (uint64_t)v20);
  }
  a1[a3[11]] = a2[a3[11]];
  return a1;
}

char *assignWithTake for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  int EnumTagSinglePayload;
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
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const void *v47;
  uint64_t v48;
  uint64_t v49;
  size_t v50;
  void *v51;
  const void *v52;
  uint64_t v53;
  uint64_t v54;
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
  void (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  void (*v82)(uint64_t, uint64_t, uint64_t);
  void (*v83)(uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int *v87;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  v13(&a1[a3[7]], &a2[a3[7]], v11);
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v85 = *(_QWORD *)(v17 - 8);
  v18 = *(void (**)(char *, char *, uint64_t))(v85 + 40);
  v18(v15, v16, v17);
  v86 = v17;
  v18(&a1[a3[9]], &a2[a3[9]], v17);
  v87 = a3;
  v19 = a3[10];
  v20 = (uint64_t)&a1[v19];
  v21 = (uint64_t)&a2[v19];
  v22 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(v17) = __swift_getEnumTagSinglePayload(v20, 1, (uint64_t)v22);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v21, 1, (uint64_t)v22);
  if ((_DWORD)v17)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v20, v21, v11);
      v24 = v22[5];
      v25 = v20 + v24;
      v26 = v21 + v24;
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32);
      v83(v25, v26, v27);
      v28 = v22[6];
      v29 = v20 + v28;
      v30 = v21 + v28;
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
      v32 = v22[7];
      v33 = v20 + v32;
      v34 = v21 + v32;
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 32);
      v36(v33, v34, v35);
      v36(v20 + v22[8], v21 + v22[8], v35);
      v37 = v22[9];
      v38 = v20 + v37;
      v39 = v21 + v37;
      v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 32))(v38, v39, v40);
      v83(v20 + v22[10], v21 + v22[10], v27);
      v41 = v22[11];
      v42 = v20 + v41;
      v43 = v21 + v41;
      v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
      v83(v20 + v22[12], v21 + v22[12], v27);
      v83(v20 + v22[13], v21 + v22[13], v27);
      v45 = v22[14];
      v46 = (void *)(v20 + v45);
      v47 = (const void *)(v21 + v45);
      v48 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v48))
      {
        v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v85 + 32))(v46, v47, v86);
        __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v48);
      }
      v79 = v20;
      v80 = (uint64_t)v22;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (EnumTagSinglePayload)
  {
    sub_23E180BA4(v20, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
LABEL_7:
    v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
    v51 = (void *)v20;
    v52 = (const void *)v21;
    goto LABEL_8;
  }
  v13((char *)v20, (char *)v21, v11);
  v53 = v22[5];
  v54 = v20 + v53;
  v55 = v21 + v53;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v82 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 40);
  v84 = v56;
  v82(v54, v55, v56);
  v57 = v22[6];
  v58 = v20 + v57;
  v59 = v21 + v57;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 40))(v58, v59, v60);
  v61 = v22[7];
  v62 = v20 + v61;
  v63 = v21 + v61;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 40);
  v65(v62, v63, v64);
  v65(v20 + v22[8], v21 + v22[8], v64);
  v66 = v22[9];
  v67 = v20 + v66;
  v68 = v21 + v66;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 40))(v67, v68, v69);
  v82(v20 + v22[10], v21 + v22[10], v84);
  v70 = v22[11];
  v71 = v20 + v70;
  v72 = v21 + v70;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 40))(v71, v72, v73);
  v82(v20 + v22[12], v21 + v22[12], v84);
  v82(v20 + v22[13], v21 + v22[13], v84);
  v74 = v22[14];
  v75 = v20 + v74;
  v76 = v21 + v74;
  v77 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v71) = __swift_getEnumTagSinglePayload(v75, 1, v77);
  v78 = __swift_getEnumTagSinglePayload(v76, 1, v77);
  if ((_DWORD)v71)
  {
    if (!v78)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 32))(v75, v76, v86);
      v79 = v75;
      v80 = v77;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v79, 0, 1, v80);
      goto LABEL_15;
    }
  }
  else
  {
    if (!v78)
    {
      v18((char *)v75, (char *)v76, v86);
      goto LABEL_15;
    }
    sub_23E180BA4(v75, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
  }
  v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
  v51 = (void *)v75;
  v52 = (const void *)v76;
LABEL_8:
  memcpy(v51, v52, v50);
LABEL_15:
  a1[v87[11]] = a2[v87[11]];
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E18DE18(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = a3[6];
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == (_DWORD)a2)
      {
        v9 = v11;
        v10 = a3[8];
      }
      else
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
        v10 = a3[10];
      }
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E18DEEC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = a4[6];
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
      {
        v9 = v11;
        v10 = a4[8];
      }
      else
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
        v10 = a4[10];
      }
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

void sub_23E18DFA8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23E18A750();
  if (v0 <= 0x3F)
  {
    sub_23E18E094(319, (unint64_t *)&qword_256D34EF8, (uint64_t (*)(uint64_t))sub_23E18B5A4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEABA78]);
    if (v1 <= 0x3F)
    {
      sub_23E18E094(319, qword_256D34F00, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_23E18E094(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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
  OUTLINED_FUNCTION_2_0();
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23E18E1B8 + 4 * byte_23E1BF1F5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23E18E1EC + 4 * byte_23E1BF1F0[v4]))();
}

uint64_t sub_23E18E1EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E18E1F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E18E1FCLL);
  return result;
}

uint64_t sub_23E18E208(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E18E210);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23E18E214(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E18E21C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.CodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.CodingKeys;
}

unint64_t sub_23E18E23C()
{
  unint64_t result;

  result = qword_256D34F48;
  if (!qword_256D34F48)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF3DC, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34F48);
  }
  return result;
}

unint64_t sub_23E18E27C()
{
  unint64_t result;

  result = qword_256D34F50;
  if (!qword_256D34F50)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF314, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34F50);
  }
  return result;
}

unint64_t sub_23E18E2BC()
{
  unint64_t result;

  result = qword_256D34F58;
  if (!qword_256D34F58)
  {
    result = MEMORY[0x24264D408](&unk_23E1BF33C, &type metadata for ConfirmationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D34F58);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return type metadata accessor for ConfirmationSnippetModel();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_23E1BE690();
}

uint64_t OUTLINED_FUNCTION_9_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_23E1BE63C();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return sub_23E1BE654();
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1)
{
  uint64_t v1;

  __swift_getEnumTagSinglePayload(v1, 1, a1);
  return sub_23E18BB30(v1);
}

uint64_t OUTLINED_FUNCTION_18_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 104) + 8))(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 184));
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = 0;
  *(_QWORD *)(v1 - 104) = v0;
  return sub_23E1BE5B8();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_23E1BE678();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_23E1BDD60();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_23E1BDD6C();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_23E1BDD54();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return sub_23E18AF78(v2 + a1, v1);
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_23E1BDDB4();
}

uint64_t sub_23E18E450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *(_QWORD *)(a2 + 24) = sub_23E1BDF04();
  *(_QWORD *)(a2 + 32) = v7;
  v8 = (int *)OUTLINED_FUNCTION_6_1();
  v9 = (uint64_t *)(a2 + v8[6]);
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  swift_storeEnumTagMultiPayload();
  v10 = a2 + v8[7];
  LOBYTE(v20) = 0;
  sub_23E1BE2A0();
  v11 = v22;
  *(_BYTE *)v10 = v21;
  *(_QWORD *)(v10 + 8) = v11;
  *(_QWORD *)a2 = OUTLINED_FUNCTION_13_3;
  *(_QWORD *)(a2 + 8) = a1;
  *(_BYTE *)(a2 + 16) = 0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_23E1BDE80();
  OUTLINED_FUNCTION_10_1();
  swift_release();
  v12 = (sub_23E1AC5E4() & 1) == 0 || (sub_23E1AC5D0() & 1) == 0;
  LOBYTE(v21) = v12;
  v13 = sub_23E1AC5F8();
  v14 = sub_23E1AC678();
  type metadata accessor for CompletionStyleSettings();
  swift_allocObject();
  v15 = sub_23E1A5F88((uint64_t)v6, (char *)&v21, v13 & 1, (v14 & 1) == 0);
  v16 = (_QWORD *)(a2 + v8[8]);
  v20 = v15;
  sub_23E1BE2A0();
  result = OUTLINED_FUNCTION_28_2();
  v18 = v22;
  *v16 = v21;
  v16[1] = v18;
  return result;
}

uint64_t CompletionSnippetView.snippetDetailsModel.getter()
{
  return sub_23E18E66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB790]);
}

uint64_t CompletionSnippetView.$snippetDetailsModel.getter()
{
  return sub_23E18E66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB798]);
}

uint64_t sub_23E18E66C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  v3 = v1[1];
  v4 = *((unsigned __int8 *)v1 + 16);
  v5 = type metadata accessor for SnippetDetailsModel();
  sub_23E187EEC(&qword_256D34F60, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  return a1(v2, v3, v4, v5, v6);
}

uint64_t CompletionSnippetView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void *v30;
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
  uint64_t KeyPath;
  void **v43;
  void *v44;
  uint64_t v45;
  int *v46;
  char *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  id v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  char v88;
  char v89;
  uint64_t result;
  _QWORD *v91;
  void *v92;
  id v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  _QWORD *v117;
  uint64_t v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v2 = v1;
  v117 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F68);
  OUTLINED_FUNCTION_15_2(v3, (uint64_t)&v128);
  v97 = v4;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3();
  v96 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F70);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3();
  v113 = v8;
  v9 = OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_15_2(v9, (uint64_t)&v137);
  v111 = v10;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3();
  v109 = v12;
  v13 = OUTLINED_FUNCTION_6_1();
  v14 = OUTLINED_FUNCTION_15_2(v13, (uint64_t)&v135);
  v118 = v15;
  v121 = *(_QWORD *)(v15 + 64);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v100 = (char *)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v99 = (uint64_t)&v95 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v95 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F78);
  OUTLINED_FUNCTION_15_2(v22, (uint64_t)&v136);
  v107 = v23;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_3();
  v104 = v25;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F80);
  OUTLINED_FUNCTION_15_2(v26, (uint64_t)&v134);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_3();
  v120 = v28;
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F88);
  v114 = *(_QWORD *)(v122 - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_3();
  v110 = v30;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F90);
  v115 = *(_QWORD *)(v31 - 8);
  v116 = (void *)v31;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_3();
  v123 = v33;
  type metadata accessor for SnippetDetailsModel();
  sub_23E187EEC(&qword_256D34F60, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  OUTLINED_FUNCTION_17_0();
  swift_getKeyPath();
  sub_23E1BDEEC();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_28_2();
  v128 = (uint64_t)v124;
  v129 = v125;
  v130 = v126;
  v131 = v127;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F98);
  MEMORY[0x24264CD24](&v132);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_0();
  swift_release();
  v35 = v132;
  v101 = v133;
  OUTLINED_FUNCTION_17_0();
  swift_getKeyPath();
  sub_23E1BDEEC();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_10_1();
  v128 = (uint64_t)v124;
  v129 = v125;
  v130 = v126;
  v131 = v127;
  MEMORY[0x24264CD24](&v132, v34);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_25_0();
  v36 = v132;
  v37 = v133;
  v102 = v2;
  v119 = v21;
  sub_23E1914B0(v2, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
  v103 = *(unsigned __int8 *)(v118 + 80);
  v38 = (v103 + 48) & ~v103;
  v118 = v103 | 7;
  v39 = (_QWORD *)swift_allocObject();
  v40 = v101;
  v39[2] = v35;
  v39[3] = v40;
  v39[4] = v36;
  v39[5] = v37;
  sub_23E19147C((uint64_t)v21, (uint64_t)v39 + v38, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
  sub_23E1BE3D8();
  sub_23E187EEC(&qword_256D34FA8, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
  v41 = v104;
  sub_23E1BE318();
  KeyPath = swift_getKeyPath();
  v43 = (void **)(v2 + *(int *)(v106 + 32));
  v44 = v43[1];
  v124 = *v43;
  v125 = (unint64_t)v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FB0);
  sub_23E1BE2AC();
  v45 = v109;
  sub_23E1A5FEC();
  OUTLINED_FUNCTION_10_1();
  v46 = v105;
  v47 = v120;
  v48 = (uint64_t *)&v120[v105[9]];
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FB8);
  v50 = v111;
  v51 = v112;
  (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))((char *)v48 + *(int *)(v49 + 28), v45, v112);
  *v48 = KeyPath;
  v52 = v107;
  v53 = v108;
  (*(void (**)(char *, uint64_t, uint64_t))(v107 + 16))(v47, v41, v108);
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v45, v51);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v41, v53);
  v54 = v43[1];
  v124 = *v43;
  v125 = (unint64_t)v54;
  sub_23E1BE2AC();
  v55 = v113;
  sub_23E1A6110(v113);
  OUTLINED_FUNCTION_10_1();
  v56 = sub_23E1BE330();
  __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v56);
  v57 = sub_23E190A10();
  v58 = v110;
  v59 = v46;
  v60 = (uint64_t)v120;
  MEMORY[0x24264CB5C](v55, v46, v57);
  sub_23E18829C((uint64_t)v55, &qword_256D34F70);
  sub_23E18829C(v60, &qword_256D34F80);
  type metadata accessor for CompletionSnippetModel();
  v61 = v102;
  v62 = (uint64_t)v119;
  sub_23E1914B0(v102, (uint64_t)v119, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
  v63 = (uint64_t *)((v103 + 16) & ~v103);
  v120 = (char *)v63 + v121;
  v64 = swift_allocObject();
  v113 = v63;
  sub_23E19147C(v62, (uint64_t)v63 + v64, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
  v124 = v59;
  v125 = v57;
  v65 = OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_27_2(&qword_256D34FD8);
  OUTLINED_FUNCTION_27_2(&qword_256D34FE0);
  v67 = v66;
  OUTLINED_FUNCTION_27_2(&qword_256D34FE8);
  v68 = v122;
  v121 = v65;
  sub_23E1BE120();
  swift_release();
  (*(void (**)(void *, uint64_t))(v114 + 8))(v58, v68);
  v69 = *(void **)(v61 + 24);
  if (v69)
  {
    v70 = v69;
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_13_4();
    if ((sub_23E1BE564() & 1) != 0)
    {
      OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_1_1();
      v128 = OUTLINED_FUNCTION_8_2();
      LOBYTE(v129) = 0;
LABEL_10:
      swift_retain();
      sub_23E1BE018();
      v128 = (uint64_t)v124;
      LOWORD(v129) = v125;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FF0);
      sub_23E190ADC();
      sub_23E1BE018();
      OUTLINED_FUNCTION_28_2();
LABEL_11:
      v87 = v124;
      v88 = v125;
      v89 = BYTE1(v125);
      result = (*(uint64_t (**)(uint64_t, void *))(v115 + 8))(v67, v58);
      v91 = v117;
      *v117 = v87;
      *((_BYTE *)v91 + 8) = v88;
      *((_BYTE *)v91 + 9) = v89;
      return result;
    }
    v71 = v58;
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_13_4();
    v72 = sub_23E1BE570();
    v73 = v99;
    sub_23E1914B0(v61, v99, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
    if ((v72 & 1) != 0)
    {
      sub_23E187F20(v73, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
      v74 = OUTLINED_FUNCTION_20_2();
      sub_23E1914B0(v74, v75, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
LABEL_8:
      sub_23E187F20(v73, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
LABEL_9:
      v81 = (uint64_t)v119;
      sub_23E1914B0(v61, (uint64_t)v119, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
      v82 = swift_allocObject();
      sub_23E19147C(v81, (uint64_t)v113 + v82, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
      OUTLINED_FUNCTION_3_2();
      v83 = OUTLINED_FUNCTION_1_1();
      v84 = v96;
      v58 = v116;
      v67 = v123;
      sub_23E1BE0FC();
      swift_release();
      v124 = v58;
      v125 = v83;
      OUTLINED_FUNCTION_1_1();
      v85 = v98;
      v86 = sub_23E1BE0D8();
      (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v84, v85);
      v128 = v86;
      LOBYTE(v129) = 1;
      goto LABEL_10;
    }
    v76 = *(void **)(v73 + 24);
    if (v76)
    {
      v77 = v76;
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_13_4();
      v78 = sub_23E1BE540();
      sub_23E187F20(v73, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
      v79 = OUTLINED_FUNCTION_20_2();
      sub_23E1914B0(v79, v80, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
      if ((v78 & 1) != 0)
        goto LABEL_8;
      v92 = *(void **)(v73 + 24);
      if (v92)
      {
        v93 = v92;
        OUTLINED_FUNCTION_14_2();
        OUTLINED_FUNCTION_13_4();
        v94 = sub_23E1BE558();
        sub_23E187F20(v73, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
        if ((v94 & 1) == 0)
        {
          OUTLINED_FUNCTION_3_2();
          OUTLINED_FUNCTION_1_1();
          v128 = OUTLINED_FUNCTION_8_2();
          LOWORD(v129) = 256;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FF0);
          sub_23E190ADC();
          sub_23E1BE018();
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
  }
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  result = sub_23E1BDEF8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CompletionSnippetView()
{
  uint64_t result;

  result = qword_256D35060;
  if (!qword_256D35060)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E18F174()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_18_2();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E18F190()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_18_2();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E18F1AC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23E18F218(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23E1AC378);
}

void sub_23E18F1B8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23E18F218(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23E1AC378);
}

void sub_23E18F1D4()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_19_2();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E18F1F0()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_19_2();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E18F20C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23E18F218(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23E1AC38C);
}

void sub_23E18F218(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  swift_bridgeObjectRetain();
  a5(v7, v6);
  OUTLINED_FUNCTION_2_0();
}

void sub_23E18F250(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23E18F218(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_23E1AC38C);
}

uint64_t sub_23E18F26C()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23E18F440();
  return sub_23E1BE3CC();
}

uint64_t sub_23E18F31C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_6_1() - 8) + 80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23E18F3F0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (OUTLINED_FUNCTION_21_2() == 1)
  {
    v2 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_12_3(v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return OUTLINED_FUNCTION_2_3();
}

uint64_t sub_23E18F3F0()
{
  return swift_release();
}

uint64_t sub_23E18F3F8()
{
  OUTLINED_FUNCTION_6_1();
  return sub_23E18F26C();
}

uint64_t sub_23E18F440()
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
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t result;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;

  v1 = v0;
  v2 = type metadata accessor for CompletionSnippetView();
  v74 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v75 = v3;
  v77 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350D8);
  MEMORY[0x24BDAC7A8](v4);
  v73 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E1BDDA8();
  MEMORY[0x24BDAC7A8](v6);
  v53 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_23E1BE2F4();
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v56 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B68);
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v59 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350E0);
  MEMORY[0x24BDAC7A8](v55);
  v54 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350E8);
  MEMORY[0x24BDAC7A8](v62);
  v67 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350F0);
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v49 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350F8);
  v65 = *(_QWORD *)(v13 - 8);
  v66 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v52 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35100);
  MEMORY[0x24BDAC7A8](v69);
  v68 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35108);
  v71 = *(_QWORD *)(v16 - 8);
  v72 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v70 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35110);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (uint64_t *)(v1 + *(int *)(v2 + 32));
  v22 = v21[1];
  v79 = *v21;
  v23 = v79;
  v80 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FB0);
  sub_23E1BE2AC();
  v24 = sub_23E1A6528();
  v26 = v25;
  swift_release();
  v79 = v23;
  v80 = v22;
  sub_23E1BE2AC();
  v76 = v1;
  v27 = *(void **)(v1 + 24);
  if (v27)
  {
    v28 = (uint64_t)&v20[*(int *)(v18 + 48)];
    v29 = v27;
    v30 = sub_23E1BE3E4();
    v78 = v20;
    v31 = v30;

    sub_23E1A6268((uint64_t)v78, v28, v31);
    swift_release();
    v79 = v23;
    v80 = v22;
    sub_23E1BE2AC();
    sub_23E1A683C((char *)&v79);
    swift_release();
    v48 = v79;
    sub_23E1914D0(v26);
    v32 = sub_23E1A85AC(v26);
    v64 = v26;
    sub_23E1914E0(v26);
    v79 = v32;
    LOWORD(v80) = 256;
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35118);
    sub_23E18819C(&qword_256D35120, &qword_256D35118);
    v35 = v34;
    v36 = v49;
    sub_23E1BE0F0();
    swift_release();
    v79 = v33;
    v80 = v35;
    swift_getOpaqueTypeConformance2();
    v37 = v51;
    sub_23E1BE0E4();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v36, v37);
    v79 = v23;
    v80 = v22;
    sub_23E1BE2AC();
    sub_23E1A69E4();
    swift_release();
    sub_23E1BDD9C();
    swift_bridgeObjectRelease();
    v38 = v56;
    sub_23E1BE300();
    sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v39 = v59;
    v40 = v58;
    sub_23E1BE0E4();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v38, v40);
    sub_23E1914D0(v24);
    v41 = sub_23E1A85AC(v24);
    sub_23E1914E0(v24);
    v42 = v60;
    v43 = v54;
    v44 = v61;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v54, v39, v61);
    *(_QWORD *)&v43[*(int *)(v55 + 36)] = v41;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v44);
    v45 = (char *)&loc_23E18FA8C + 4 * byte_23E1BF460[v48];
    v63 = v24;
    __asm { BR              X9 }
  }
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  result = sub_23E1BDEF8();
  __break(1u);
  return result;
}

void sub_23E18FD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *);
  Swift::String v16;
  uint64_t v17;
  char countAndFlagsBits;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char v30;
  void *v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Swift::String v40;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for IconConfiguration();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v35 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v36 = (uint64_t)&v34 - v9;
  v10 = sub_23E1BDE50();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D34820 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)qword_256D3AF00);
  v15 = *(void (**)(char *))(v11 + 16);
  v38 = v14;
  v15(v13);
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_23E1BE5B8();
  sub_23E1BE480();
  CompletionSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v37 = (unint64_t)"Received tap on the snippet.";
  v16._object = (void *)0x800000023E1C2400;
  v16._countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v40, 0, v16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  type metadata accessor for SnippetDetailsModel();
  sub_23E187EEC(&qword_256D34F60, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_23E1BDEC8();
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  sub_23E1AC38C();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_23E18829C((uint64_t)v5, &qword_256D34E20);
  }
  else
  {
    v17 = v36;
    sub_23E19147C((uint64_t)v5, v36, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    sub_23E1BDDCC();
    countAndFlagsBits = v40._countAndFlagsBits;
    if (LOBYTE(v40._countAndFlagsBits) == 2)
    {
      v19 = v17;
    }
    else
    {
      v20 = v35;
      sub_23E1914B0(v17, v35, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      sub_23E1BDDCC();
      if (LOBYTE(v40._countAndFlagsBits))
        v21 = (countAndFlagsBits & 1) == 0;
      else
        v21 = 2;
      LOBYTE(v40._countAndFlagsBits) = v21;
      sub_23E1BDDCC();
      v22 = v39;
      sub_23E1BDDCC();
      v23 = v39;
      type metadata accessor for CompletionStyleSettings();
      swift_allocObject();
      v24 = sub_23E1A5F88(v20, (char *)&v40, v22, (v23 & 1) == 0);
      v25 = type metadata accessor for CompletionSnippetView();
      v26 = (uint64_t *)(a2 + *(int *)(v25 + 32));
      v28 = *v26;
      v27 = (void *)v26[1];
      v40._countAndFlagsBits = v28;
      v40._object = v27;
      v39 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FB0);
      sub_23E1BE2B8();
      v29 = (char *)(a2 + *(int *)(v25 + 28));
      v30 = *v29;
      v31 = (void *)*((_QWORD *)v29 + 1);
      LOBYTE(v40._countAndFlagsBits) = v30;
      v40._object = v31;
      LOBYTE(v39) = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D350D0);
      sub_23E1BE2B8();
      v19 = v17;
    }
    sub_23E187F20(v19, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  }
  v32._countAndFlagsBits = 0xD000000000000015;
  v32._object = (void *)0x800000023E1C24F0;
  v33._object = (void *)(v37 | 0x8000000000000000);
  v33._countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v32, 0, v33);
}

void sub_23E1901D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  char *v23;
  Swift::String v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  Swift::String v29;

  v2 = sub_23E1BDE50();
  v28 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E1BDD0C();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D34820 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v2, (uint64_t)qword_256D3AF00);
  v11._countAndFlagsBits = 0xD00000000000001CLL;
  v11._object = (void *)0x800000023E1C23E0;
  v25 = (unint64_t)"Received tap on the snippet.";
  v12._object = (void *)0x800000023E1C2400;
  v12._countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v11, 0, v12);
  type metadata accessor for SnippetDetailsModel();
  sub_23E187EEC(&qword_256D34F60, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_23E1BDEC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23E1BDE80();
  swift_release();
  swift_release();
  swift_release();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_23E18829C((uint64_t)v6, &qword_256D34CE0);
  }
  else
  {
    v13 = v26;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v9, v6, v7);
    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
    v15 = *(void **)(a1 + 24);
    if (v15)
    {
      v16 = v14;
      v17 = v15;
      sub_23E1BE3E4();

      sub_23E1BE570();
      v18 = (void *)sub_23E1BE420();
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_setBundleId_, v18);

      v19 = (void *)sub_23E1BDCF4();
      objc_msgSend(v16, sel_setPunchOutUri_, v19);

      v20 = v17;
      v21 = v16;
      sub_23E1BE3F0();

      v23 = v27;
      v22 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v27, v10, v2);
      strcpy((char *)&v29, "Punchout to ");
      BYTE5(v29._object) = 0;
      HIWORD(v29._object) = -5120;
      sub_23E187EEC(&qword_256D350C0, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      sub_23E1BE6A8();
      sub_23E1BE480();
      swift_bridgeObjectRelease();
      sub_23E1BE480();
      v24._object = (void *)(v25 | 0x8000000000000000);
      v24._countAndFlagsBits = 0xD000000000000075;
      Logger.debug(output:test:caller:)(v29, 0, v24);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v2);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
    }
    else
    {
      sub_23E1BE408();
      sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
      sub_23E1BDEF8();
      __break(1u);
    }
  }
}

void sub_23E190638(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  id v25;
  Swift::String v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  Swift::String v36;

  v2 = sub_23E1BDE50();
  v34 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v33 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D34820 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v2, (uint64_t)qword_256D3AF00);
  v8._countAndFlagsBits = 0xD000000000000035;
  v8._object = (void *)0x800000023E1C2510;
  v31 = (unint64_t)"Received tap on the snippet.";
  v9._object = (void *)0x800000023E1C2400;
  v9._countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v8, 0, v9);
  v10 = type metadata accessor for CompletionSnippetView();
  v11 = a1 + *(int *)(v10 + 28);
  v12 = *(void **)(v11 + 8);
  LOBYTE(v36._countAndFlagsBits) = *(_BYTE *)v11;
  v36._object = v12;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350D0);
  sub_23E1BE2AC();
  if ((v35 & 1) == 0)
  {
    v13 = (uint64_t *)(a1 + *(int *)(v10 + 32));
    v14 = *v13;
    v15 = (void *)v13[1];
    v36._countAndFlagsBits = *v13;
    v36._object = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FB0);
    sub_23E1BE2AC();
    v16 = sub_23E1A6A6C();
    swift_release();
    if ((v16 & 1) == 0)
    {
      v17 = a1;
      v36._countAndFlagsBits = v14;
      v36._object = v15;
      sub_23E1BE2AC();
      v18 = v35;
      v19 = OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig;
      v20 = type metadata accessor for IconConfiguration();
      sub_23E191784(v18 + *(int *)(v20 + 56) + v19, (uint64_t)v6, &qword_256D34E88);
      swift_release();
      v21 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v21) == 1)
      {
        sub_23E18829C((uint64_t)v6, &qword_256D34E88);
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        v22 = (void *)sub_23E1BDD60();
        sub_23E187F20((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
        v24 = v33;
        v23 = v34;
        (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, v7, v2);
        v36._countAndFlagsBits = 0;
        v36._object = (void *)0xE000000000000000;
        sub_23E1BE5B8();
        sub_23E1BE480();
        v25 = objc_msgSend(v22, sel_debugDescription);
        sub_23E1BE42C();

        sub_23E1BE480();
        swift_bridgeObjectRelease();
        v26._object = (void *)(v31 | 0x8000000000000000);
        v26._countAndFlagsBits = 0xD000000000000075;
        Logger.debug(output:test:caller:)(v36, 0, v26);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v2);
        v27 = *(void **)(v11 + 8);
        LOBYTE(v36._countAndFlagsBits) = *(_BYTE *)v11;
        v36._object = v27;
        LOBYTE(v35) = 1;
        sub_23E1BE2B8();
        v28 = *(void **)(v17 + 24);
        if (v28)
        {
          v29 = v28;
          sub_23E1BE3FC();

        }
        else
        {
          sub_23E1BE408();
          sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
          sub_23E1BDEF8();
          __break(1u);
        }
      }
    }
  }
}

unint64_t sub_23E190A10()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256D34FC0;
  if (!qword_256D34FC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34F80);
    sub_23E18819C(&qword_256D34FC8, &qword_256D34F78);
    v3 = v2;
    sub_23E18819C(&qword_256D34FD0, &qword_256D34FB8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256D34FC0);
  }
  return result;
}

void sub_23E190AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_23_2();
  sub_23E18FD3C(a1, v1 + v3);
}

unint64_t sub_23E190ADC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D34FF8;
  if (!qword_256D34FF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34FF0);
    v2[0] = MEMORY[0x24BDF4760];
    v2[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D34FF8);
  }
  return result;
}

uint64_t sub_23E190B3C()
{
  return sub_23E191664((uint64_t (*)(uint64_t))sub_23E1901D4);
}

uint64_t sub_23E190B48()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for CompletionSnippetView(_QWORD *a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    sub_23E190C98();
    *v4 = v7;
    v4[1] = v8;
    *((_BYTE *)v4 + 16) = v9;
    v10 = (void *)a2[3];
    v11 = a2[4];
    v4[3] = v10;
    v4[4] = v11;
    v12 = a3[6];
    v13 = (_QWORD *)((char *)v4 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_23E1BDEB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = a3[7];
    v19 = a3[8];
    v20 = (char *)v4 + v18;
    v21 = (char *)a2 + v18;
    *v20 = *v21;
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    v22 = (_QWORD *)((char *)v4 + v19);
    v23 = (uint64_t *)((char *)a2 + v19);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_23E190C98()
{
  return swift_retain();
}

uint64_t destroy for CompletionSnippetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_23E18F3F0();

  v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_23E1BDEB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CompletionSnippetView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23E190C98();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = (void *)a2[3];
  v10 = a2[4];
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_23E1BDEB0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v16 = a3[7];
  v17 = a3[8];
  v18 = a1 + v16;
  v19 = (uint64_t)a2 + v16;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  v20 = (_QWORD *)(a1 + v17);
  v21 = (uint64_t *)((char *)a2 + v17);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompletionSnippetView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23E190C98();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23E18F3F0();
  v9 = *(void **)(a1 + 24);
  v10 = (void *)a2[3];
  *(_QWORD *)(a1 + 24) = v10;
  v11 = v10;

  *(_QWORD *)(a1 + 32) = a2[4];
  if ((uint64_t *)a1 != a2)
  {
    v12 = a3[6];
    v13 = (_QWORD *)(a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_23E18829C(a1 + v12, &qword_256D34FA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_23E1BDEB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = (uint64_t)a2 + v16;
  *(_BYTE *)v17 = *(_BYTE *)v18;
  *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
  swift_retain();
  swift_release();
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = (uint64_t)a2 + v19;
  *(_QWORD *)(a1 + v19) = *(uint64_t *)((char *)a2 + v19);
  swift_retain();
  swift_release();
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CompletionSnippetView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23E1BDEB0();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for CompletionSnippetView(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23E18F3F0();
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (a1 != a2)
  {
    v8 = a3[6];
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_23E18829C(a1 + v8, &qword_256D34FA0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23E1BDEB0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  swift_release();
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = (_QWORD *)(a2 + v16);
  *(_QWORD *)(a1 + v16) = *v18;
  swift_release();
  *(_QWORD *)(v17 + 8) = v18[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionSnippetView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E191218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35000);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E1912A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35000);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 24), a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
}

void sub_23E191318()
{
  unint64_t v0;

  sub_23E1913A0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23E1913A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D35070)
  {
    sub_23E1BDEB0();
    v0 = sub_23E1BDEBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D35070);
  }
}

unint64_t sub_23E1913F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D350B0;
  if (!qword_256D350B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D350B8);
    v2[0] = sub_23E190ADC();
    v2[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D350B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return swift_retain();
}

void sub_23E19147C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_7(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_9();
}

void sub_23E1914B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_7(a1, a2, a3);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_9();
}

unint64_t sub_23E1914D0(unint64_t result)
{
  if (result >= 4)
    return swift_retain();
  return result;
}

unint64_t sub_23E1914E0(unint64_t result)
{
  if (result >= 4)
    return swift_release();
  return result;
}

void sub_23E1914F0()
{
  sub_23E1BDF58();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19150C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350D8);
  MEMORY[0x24BDAC7A8](v2);
  sub_23E191784(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256D350D8);
  return sub_23E1BDF64();
}

uint64_t objectdestroy_10Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_6_1() - 8) + 80);
  sub_23E18F3F0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (OUTLINED_FUNCTION_21_2() == 1)
  {
    v2 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_12_3(v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return OUTLINED_FUNCTION_2_3();
}

uint64_t sub_23E191658()
{
  return sub_23E191664((uint64_t (*)(uint64_t))sub_23E190638);
}

uint64_t sub_23E191664(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_23_2();
  return a1(v1 + v2);
}

unint64_t sub_23E191690()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_256D35138;
  if (!qword_256D35138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35100);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D350F0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35118);
    sub_23E18819C(&qword_256D35120, &qword_256D35118);
    v5[2] = v2;
    v5[3] = swift_getOpaqueTypeConformance2();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23E18819C(&qword_256D35140, &qword_256D35130);
    v5[0] = OpaqueTypeConformance2;
    v5[1] = v4;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256D35138);
  }
  return result;
}

void sub_23E191784(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_1(v3);
  OUTLINED_FUNCTION_9();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_3_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 184) = *(_QWORD *)(v4 - 200);
  *(_QWORD *)(v4 - 176) = v1;
  *(_QWORD *)(v4 - 168) = *(_QWORD *)(v4 - 208);
  *(_QWORD *)(v4 - 160) = v0;
  *(_QWORD *)(v4 - 152) = v2;
  *(_QWORD *)(v4 - 144) = v3;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return type metadata accessor for CompletionSnippetView();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_23E1BE0D8();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_12_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void OUTLINED_FUNCTION_13_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return sub_23E1BE3E4();
}

uint64_t OUTLINED_FUNCTION_15_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_23E1BDED4();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_23E1AC550();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return sub_23E1AC564();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_23E1BDEB0();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_27_2(_QWORD *a1)
{
  void (*v1)(uint64_t);

  sub_23E187EEC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return swift_release();
}

uint64_t CompletionSnippetViewTVOS.snippetDetailsModel.getter()
{
  return sub_23E18E66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB790]);
}

uint64_t CompletionSnippetViewTVOS.$snippetDetailsModel.getter()
{
  return sub_23E18E66C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB798]);
}

void CompletionSnippetViewTVOS.body.getter(uint64_t *a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
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

  v68 = a1;
  v2 = OUTLINED_FUNCTION_5_0();
  v62 = *(_QWORD *)(v2 - 8);
  v69 = *(_QWORD *)(v62 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v61 = (uint64_t)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35148);
  v5 = *(_QWORD *)(v4 - 8);
  v64 = v4;
  v65 = v5;
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3();
  v70 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35150);
  v8 = *(_QWORD *)(v7 - 8);
  v66 = v7;
  v67 = v8;
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3();
  v63 = v9;
  v10 = OUTLINED_FUNCTION_24();
  v60 = *(_QWORD *)(v10 - 8);
  v59 = *(_QWORD *)(v60 + 64);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v58 = (uint64_t)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v49 - v13;
  type metadata accessor for SnippetDetailsModel();
  sub_23E187EEC(&qword_256D34F60, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_23E1BDED4();
  swift_getKeyPath();
  OUTLINED_FUNCTION_17_1();
  swift_release();
  OUTLINED_FUNCTION_10_1();
  v77 = v71;
  v78 = v72;
  v79 = v73;
  v80 = v74;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F98);
  MEMORY[0x24264CD24](&v81);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_3();
  swift_release();
  v56 = v81;
  OUTLINED_FUNCTION_13_5(v82);
  sub_23E1BDED4();
  swift_getKeyPath();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_10_1();
  v77 = v71;
  v78 = v72;
  v79 = v73;
  v80 = v74;
  MEMORY[0x24264CD24](&v81, v15);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_14_3();
  v54 = v81;
  OUTLINED_FUNCTION_13_5(v82);
  sub_23E1BDEC8();
  swift_getKeyPath();
  swift_getKeyPath();
  v57 = v14;
  sub_23E1BDE80();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_14_3();
  swift_release();
  v52 = v1;
  OUTLINED_FUNCTION_1_2();
  v16 = sub_23E1AC5E4();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_2();
  v17 = sub_23E1AC5D0();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1_2();
  v51 = sub_23E1AC5F8();
  OUTLINED_FUNCTION_10_1();
  v50 = v16 & v17;
  v18 = v58;
  sub_23E180B78((uint64_t)v14, v58, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  v19 = v61;
  sub_23E180B78(v1, v61, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetViewTVOS);
  v20 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  v21 = v20 + v59;
  v22 = (((v20 + v59) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  v23 = *(unsigned __int8 *)(v62 + 80);
  v60 = v23 + 16;
  v24 = (v23 + 16 + v22) & ~v23;
  v25 = v24 + v69;
  v62 = v23 | 7;
  v26 = swift_allocObject();
  v27 = (v21 & 0xFFFFFFFFFFFFFFF8) + v26;
  sub_23E180B4C(v18, v26 + v20, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  *(_BYTE *)(v26 + v21) = (v50 & 1) == 0;
  v28 = v55;
  *(_QWORD *)(v27 + 8) = v56;
  *(_QWORD *)(v27 + 16) = v28;
  v29 = (_QWORD *)(v26 + v22);
  v30 = v53;
  *v29 = v54;
  v29[1] = v30;
  sub_23E180B4C(v19, v26 + v24, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetViewTVOS);
  *(_BYTE *)(v26 + v25) = v51 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35158);
  v31 = sub_23E1BE3D8();
  sub_23E187EEC(&qword_256D34FA8, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
  v71 = v31;
  v72 = v32;
  OUTLINED_FUNCTION_1_1();
  sub_23E1BE318();
  v33 = type metadata accessor for CompletionSnippetModel();
  sub_23E180B78(v52, v19, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetViewTVOS);
  v34 = v60 & ~v23;
  v35 = swift_allocObject();
  sub_23E180B4C(v19, v35 + v34, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetViewTVOS);
  sub_23E18819C(&qword_256D35160, &qword_256D35148);
  v37 = v36;
  OUTLINED_FUNCTION_21_3(&qword_256D34FD8);
  v39 = v38;
  OUTLINED_FUNCTION_21_3(&qword_256D34FE0);
  v41 = v40;
  OUTLINED_FUNCTION_21_3(&qword_256D34FE8);
  v43 = v42;
  v44 = v63;
  v45 = v64;
  v46 = v70;
  sub_23E1BE120();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v46, v45);
  v71 = v45;
  v72 = v33;
  v73 = v37;
  v74 = v39;
  v75 = v41;
  v76 = v43;
  OUTLINED_FUNCTION_1_1();
  v47 = v66;
  v48 = sub_23E1BE0D8();
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v44, v47);
  sub_23E187F20((uint64_t)v57, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  *v68 = v48;
}

uint64_t type metadata accessor for CompletionSnippetViewTVOS()
{
  uint64_t result;

  result = qword_256D351C0;
  if (!qword_256D351C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E191F68@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v72[6];
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  v89 = a8;
  v85 = a7;
  v81 = a6;
  v80 = a5;
  v97 = a4;
  v96 = a3;
  LODWORD(v78) = a2;
  v93 = a9;
  v10 = type metadata accessor for IconConfiguration();
  v86 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v87 = v11;
  v88 = (uint64_t)v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CompletionSnippetViewTVOS();
  v82 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v83 = v13;
  v84 = (uint64_t)v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_23E1BE3D8();
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v90 = (char *)v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34C00);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_23E1BDD3C();
  v18 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v20 = (char *)v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35200);
  v74 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35208);
  v79 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v25 = (char *)v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35210);
  MEMORY[0x24BDAC7A8](v76);
  v75 = (char *)v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  v72[5] = v110;
  v72[4] = v111;
  v72[3] = v10;
  v27 = *(int *)(v10 + 20);
  v94 = a1;
  v28 = a1 + v27;
  v72[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v72[2] = v28;
  sub_23E1BDDCC();
  swift_bridgeObjectRelease();
  v110 = sub_23E1BE204();
  LOWORD(v111) = 256;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35218);
  sub_23E18819C(&qword_256D35220, &qword_256D35218);
  v31 = v30;
  sub_23E1BE0F0();
  swift_release();
  v32 = v73;
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BEAAB68], v73);
  v110 = v29;
  v111 = v31;
  swift_getOpaqueTypeConformance2();
  v77 = v25;
  sub_23E1BE0E4();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v32);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v23, v21);
  v74 = sub_23E1BE288();
  v33 = sub_23E1BE078();
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v33);
  v34 = sub_23E1BE084();
  sub_23E18829C((uint64_t)v17, &qword_256D34C00);
  KeyPath = swift_getKeyPath();
  if ((v78 & 1) != 0)
  {
    v110 = sub_23E1BE1EC();
    v111 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D35248);
    sub_23E18819C(&qword_256D35250, &qword_256D35248);
  }
  else
  {
    sub_23E1BDDCC();
    v36 = v110;
    v37 = v111;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    sub_23E1BDDCC();
    v38 = static ColorUtils.getColor(colorString:colorDict:)(v36, v37, v110);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v110 = v38;
  }
  v39 = sub_23E1BDEE0();
  v40 = sub_23E1BE2E8();
  v42 = v41;
  v43 = v79;
  v44 = (uint64_t)v75;
  v45 = v77;
  v46 = v95;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v75, v77, v95);
  v47 = (uint64_t *)(v44 + *(int *)(v76 + 36));
  *v47 = v74;
  v47[1] = KeyPath;
  v47[2] = v34;
  v47[3] = v39;
  v47[4] = v40;
  v47[5] = v42;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v46);
  sub_23E193DF4();
  v95 = sub_23E1BE0D8();
  sub_23E18829C(v44, &qword_256D35210);
  v110 = v96;
  v111 = v97;
  sub_23E193EE8();
  swift_bridgeObjectRetain();
  v48 = sub_23E1BE0CC();
  v96 = v49;
  v97 = v50;
  LODWORD(v45) = v51 & 1;
  v110 = v80;
  v111 = v81;
  swift_bridgeObjectRetain();
  v52 = sub_23E1BE0CC();
  v54 = v53;
  v56 = v55;
  v57 = MEMORY[0x24BEAD6B0];
  v59 = v58 & 1;
  v112 = MEMORY[0x24BDF1FA8];
  v113 = MEMORY[0x24BEAD6B0];
  v60 = swift_allocObject();
  v110 = v60;
  v78 = v48;
  v61 = v96;
  *(_QWORD *)(v60 + 16) = v48;
  *(_QWORD *)(v60 + 24) = v61;
  *(_BYTE *)(v60 + 32) = (_BYTE)v45;
  LODWORD(v79) = (_DWORD)v45;
  *(_QWORD *)(v60 + 40) = v97;
  v108 = MEMORY[0x24BDF1FA8];
  v109 = v57;
  v62 = swift_allocObject();
  v106 = 0;
  v107 = v62;
  v80 = v52;
  *(_QWORD *)(v62 + 16) = v52;
  *(_QWORD *)(v62 + 24) = v54;
  LODWORD(v77) = v59;
  *(_BYTE *)(v62 + 32) = v59;
  v81 = v56;
  *(_QWORD *)(v62 + 40) = v56;
  v104 = 0u;
  v105 = 0u;
  v103 = 0;
  v101 = 0u;
  v102 = 0u;
  v100 = MEMORY[0x24BEAD938];
  v99 = MEMORY[0x24BDF4780];
  v98 = v95;
  sub_23E193F64(v48, v61, (char)v45);
  swift_bridgeObjectRetain();
  sub_23E193F64(v52, v54, v59);
  swift_bridgeObjectRetain();
  swift_retain();
  v63 = v90;
  sub_23E1BE3CC();
  v64 = v84;
  sub_23E180B78(v85, v84, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetViewTVOS);
  v65 = v88;
  sub_23E180B78(v94, v88, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  v66 = (*(unsigned __int8 *)(v82 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
  v67 = v66 + v83;
  v68 = (*(unsigned __int8 *)(v86 + 80) + v66 + v83 + 1) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
  v69 = swift_allocObject();
  sub_23E180B4C(v64, v69 + v66, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetViewTVOS);
  *(_BYTE *)(v69 + v67) = v89 & 1;
  sub_23E180B4C(v65, v69 + v68, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  sub_23E187EEC(&qword_256D34FA8, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
  v70 = v92;
  sub_23E1BE0FC();
  swift_release();
  swift_release();
  sub_23E193F54(v80, v54, (char)v77);
  swift_bridgeObjectRelease();
  sub_23E193F54(v78, v96, v79);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v91 + 8))(v63, v70);
}

void sub_23E1928C4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  id v22;
  Swift::String v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  char v35;

  v6 = sub_23E1BDE50();
  v32 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DirectInvocationConfig();
  MEMORY[0x24BDAC7A8](v11);
  v33 = (uint64_t)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D34820 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v6, (uint64_t)qword_256D3AF00);
  v14._countAndFlagsBits = 0xD000000000000035;
  v14._object = (void *)0x800000023E1C2510;
  v15._object = (void *)0x800000023E1C2590;
  v15._countAndFlagsBits = 0xD000000000000079;
  Logger.debug(output:test:caller:)(v14, 0, v15);
  v16 = *(int *)(type metadata accessor for CompletionSnippetViewTVOS() + 28);
  v31 = a1;
  v17 = a1 + v16;
  v18 = *(void **)(v17 + 8);
  LOBYTE(v34._countAndFlagsBits) = *(_BYTE *)v17;
  v34._object = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350D0);
  sub_23E1BE2AC();
  if ((v35 & 1) == 0 && (a2 & 1) == 0)
  {
    v19 = type metadata accessor for IconConfiguration();
    sub_23E1941D4(a3 + *(int *)(v19 + 56), (uint64_t)v10);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
    {
      sub_23E18829C((uint64_t)v10, &qword_256D34E88);
    }
    else
    {
      sub_23E180B4C((uint64_t)v10, v33, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
      v20 = v30;
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v30, v13, v6);
      v34._countAndFlagsBits = 0;
      v34._object = (void *)0xE000000000000000;
      sub_23E1BE5B8();
      swift_bridgeObjectRelease();
      v34._countAndFlagsBits = 0xD000000000000029;
      v34._object = (void *)0x800000023E1C2610;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      v21 = (void *)sub_23E1BDD60();
      v22 = objc_msgSend(v21, sel_debugDescription);

      sub_23E1BE42C();
      sub_23E1BE480();
      swift_bridgeObjectRelease();
      v23._object = (void *)0x800000023E1C2590;
      v23._countAndFlagsBits = 0xD000000000000079;
      Logger.debug(output:test:caller:)(v34, 0, v23);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v20, v6);
      v24 = *(void **)(v17 + 8);
      LOBYTE(v34._countAndFlagsBits) = *(_BYTE *)v17;
      v34._object = v24;
      v35 = 1;
      sub_23E1BE2B8();
      v25 = *(void **)(v31 + 24);
      if (v25)
      {
        v26 = v25;
        v27 = v33;
        v28 = (void *)sub_23E1BDD60();
        sub_23E1BE3FC();

        sub_23E187F20(v27, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
      }
      else
      {
        sub_23E1BE408();
        sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
        sub_23E1BDEF8();
        __break(1u);
      }
    }
  }
}

void sub_23E192C90(uint64_t a1, uint64_t *a2)
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
  void (*v14)(char *);
  Swift::String v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  _QWORD v27[2];
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t *v36;
  char v37;
  Swift::String v38;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = type metadata accessor for IconConfiguration();
  v6 = MEMORY[0x24BDAC7A8](v33);
  v29 = (uint64_t)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v30 = (uint64_t)v27 - v8;
  v9 = sub_23E1BDE50();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D34820 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v9, (uint64_t)qword_256D3AF00);
  v14 = *(void (**)(char *))(v10 + 16);
  v35 = v13;
  v14(v12);
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_23E1BE5B8();
  sub_23E1BE480();
  CompletionSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v32 = (unint64_t)"on for the toggle. ";
  v15._object = (void *)0x800000023E1C2590;
  v15._countAndFlagsBits = 0xD000000000000079;
  Logger.debug(output:test:caller:)(v38, 0, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v16 = *a2;
  v36 = a2;
  v17 = *((unsigned __int8 *)a2 + 16);
  type metadata accessor for SnippetDetailsModel();
  sub_23E187EEC(&qword_256D34F60, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_23E1BDEC8();
  v18 = type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDCC();
  sub_23E1AC420();
  swift_release();
  sub_23E1BDEC8();
  sub_23E1BDDCC();
  sub_23E1AC434();
  swift_release();
  sub_23E1BDEC8();
  v31 = a1 + *(int *)(v18 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  sub_23E1BDDCC();
  sub_23E1AC40C();
  swift_release();
  sub_23E1BDEC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  sub_23E1AC38C();
  swift_release();
  v27[1] = v16;
  v28 = v17;
  sub_23E1BDEC8();
  sub_23E1BDDCC();
  sub_23E1AC40C();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  v19 = (uint64_t)v34;
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload(v19, 1, v33) == 1)
  {
    sub_23E18829C(v19, &qword_256D34E20);
  }
  else
  {
    v20 = v30;
    sub_23E180B4C(v19, v30, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    sub_23E1BDEC8();
    v21 = v29;
    sub_23E180B78(v20, v29, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    sub_23E1AC2FC(v21);
    swift_release();
    sub_23E187F20(v20, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  }
  v22 = (char *)v36 + *(int *)(type metadata accessor for CompletionSnippetViewTVOS() + 28);
  v23 = *v22;
  v24 = (void *)*((_QWORD *)v22 + 1);
  LOBYTE(v38._countAndFlagsBits) = v23;
  v38._object = v24;
  v37 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350D0);
  sub_23E1BE2B8();
  v25._countAndFlagsBits = 0xD000000000000015;
  v25._object = (void *)0x800000023E1C24F0;
  v26._object = (void *)(v32 | 0x8000000000000000);
  v26._countAndFlagsBits = 0xD000000000000079;
  Logger.debug(output:test:caller:)(v25, 0, v26);
}

void sub_23E1931B8()
{
  sub_23E1AC53C();
  OUTLINED_FUNCTION_9();
}

void sub_23E1931D4()
{
  sub_23E1AC53C();
  OUTLINED_FUNCTION_9();
}

void sub_23E1931F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;

  v2 = OUTLINED_FUNCTION_24();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E180B78(a1, (uint64_t)v4, v5);
  sub_23E1AC2FC((uint64_t)v4);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E193268()
{
  uint64_t v0;
  int *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = (int *)OUTLINED_FUNCTION_24();
  v2 = (*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  OUTLINED_FUNCTION_5_0();
  v3 = v0 + v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_12_4(v4);
  v5 = v3 + v1[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_4_3(v7);
  v8 = v3 + v1[7];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v3 + v1[8], v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  OUTLINED_FUNCTION_4_3(v11);
  OUTLINED_FUNCTION_10_2(v1[10]);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  OUTLINED_FUNCTION_4_3(v12);
  OUTLINED_FUNCTION_10_2(v1[12]);
  OUTLINED_FUNCTION_10_2(v1[13]);
  v13 = v3 + v1[14];
  v14 = type metadata accessor for DirectInvocationConfig();
  if (!__swift_getEnumTagSinglePayload(v13, 1, v14))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    OUTLINED_FUNCTION_12_3(v15);
  }
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_15_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (OUTLINED_FUNCTION_21_2() == 1)
  {
    v16 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_12_3(v16);
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_19_3();
  return swift_deallocObject();
}

uint64_t sub_23E19348C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *(_QWORD *)(OUTLINED_FUNCTION_24() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = ((v5 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(OUTLINED_FUNCTION_5_0() - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + v6 + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return sub_23E191F68(v1 + v4, *(unsigned __int8 *)(v1 + v5), *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFFF8) + v1 + 8), *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFFF8) + v1 + 16), *(_QWORD *)(v1 + v6), *(_QWORD *)(v1 + v6 + 8), v1 + v8, *(unsigned __int8 *)(v1 + v8 + *(_QWORD *)(v7 + 64)), a1);
}

uint64_t sub_23E193524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_5_0() - 8) + 80);
  sub_23E18F3F0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (OUTLINED_FUNCTION_21_2() == 1)
  {
    v2 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_12_3(v2);
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_19_3();
  return swift_deallocObject();
}

void sub_23E1935DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_5_0() - 8) + 80);
  sub_23E192C90(a1, (uint64_t *)(v1 + ((v3 + 16) & ~v3)));
}

uint64_t sub_23E193614()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for CompletionSnippetViewTVOS(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    sub_23E190C98();
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    v10 = (void *)a2[3];
    v11 = a2[4];
    *(_QWORD *)(a1 + 24) = v10;
    *(_QWORD *)(a1 + 32) = v11;
    v12 = *(int *)(a3 + 24);
    v13 = (_QWORD *)(a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_23E1BDEB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = *(int *)(a3 + 28);
    v19 = a1 + v18;
    v20 = (uint64_t)a2 + v18;
    *(_BYTE *)v19 = *(_BYTE *)v20;
    *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_23E18F3F0();

  v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_23E1BDEB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t initializeWithCopy for CompletionSnippetViewTVOS(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23E190C98();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  v9 = (void *)a2[3];
  v10 = a2[4];
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_23E1BDEB0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v16 = *(int *)(a3 + 28);
  v17 = a1 + v16;
  v18 = (uint64_t)a2 + v16;
  *(_BYTE *)v17 = *(_BYTE *)v18;
  *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompletionSnippetViewTVOS(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  sub_23E190C98();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  sub_23E18F3F0();
  v9 = *(void **)(a1 + 24);
  v10 = (void *)a2[3];
  *(_QWORD *)(a1 + 24) = v10;
  v11 = v10;

  *(_QWORD *)(a1 + 32) = a2[4];
  if ((uint64_t *)a1 != a2)
  {
    v12 = *(int *)(a3 + 24);
    v13 = (_QWORD *)(a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_23E18829C(a1 + v12, &qword_256D34FA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_23E1BDEB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v16 = *(int *)(a3 + 28);
  v17 = a1 + v16;
  v18 = (uint64_t)a2 + v16;
  *(_BYTE *)v17 = *(_BYTE *)v18;
  *(_QWORD *)(v17 + 8) = *(_QWORD *)(v18 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_23E1BDEB0();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithTake for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  sub_23E18F3F0();
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 24);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_23E18829C(a1 + v8, &qword_256D34FA0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_23E1BDEB0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 28);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionSnippetViewTVOS()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E193C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35000);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetViewTVOS()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E193CA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 2147483646)
  {
    *(_QWORD *)(a1 + 24) = a2;
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35000);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

void sub_23E193D0C()
{
  unint64_t v0;

  sub_23E1913A0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_23E193D88()
{
  return MEMORY[0x24BDF4760];
}

void sub_23E193D94()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_9();
}

void sub_23E193DB0()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_9();
}

void sub_23E193DCC()
{
  swift_retain();
  sub_23E1BDF7C();
  OUTLINED_FUNCTION_9();
}

unint64_t sub_23E193DF4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_256D35228;
  if (!qword_256D35228)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35210);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35200);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35218);
    sub_23E18819C(&qword_256D35220, &qword_256D35218);
    v5[2] = v2;
    v5[3] = swift_getOpaqueTypeConformance2();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23E18819C(&qword_256D35230, &qword_256D35238);
    v5[0] = OpaqueTypeConformance2;
    v5[1] = v4;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256D35228);
  }
  return result;
}

unint64_t sub_23E193EE8()
{
  unint64_t result;

  result = qword_256D35240;
  if (!qword_256D35240)
  {
    result = MEMORY[0x24264D408](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256D35240);
  }
  return result;
}

uint64_t sub_23E193F24()
{
  uint64_t v0;

  sub_23E193F54(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23E193F54(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_23E193F64(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_23E193F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(unint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_5_0() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = (int *)OUTLINED_FUNCTION_24();
  v5 = (v3 + *(unsigned __int8 *)(*((_QWORD *)v4 - 1) + 80) + ((v2 + 16) & ~v2) + 1) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v4 - 1) + 80);
  OUTLINED_FUNCTION_15_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_12_4(v6);
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_19_3();
  v7 = v0 + v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_12_3(v8);
  v9 = v0 + v5 + v4[5];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_2_4(v11);
  v12 = v0 + v5 + v4[7];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v14 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  v14(v7 + v4[8], v13);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  OUTLINED_FUNCTION_2_4(v15);
  OUTLINED_FUNCTION_11_2(v4[10]);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  OUTLINED_FUNCTION_2_4(v16);
  OUTLINED_FUNCTION_11_2(v4[12]);
  OUTLINED_FUNCTION_11_2(v4[13]);
  v17 = v7 + v4[14];
  v18 = type metadata accessor for DirectInvocationConfig();
  if (!__swift_getEnumTagSinglePayload(v17, 1, v18))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    OUTLINED_FUNCTION_13_0(v19);
  }
  return swift_deallocObject();
}

void sub_23E194174()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_5_0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v2 + *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_24() - 8) + 80);
  sub_23E1928C4(v0 + v2, *(_BYTE *)(v0 + v3), v0 + ((v3 + v4 + 1) & ~v4));
}

uint64_t sub_23E1941D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_23E1BDEC8();
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return type metadata accessor for CompletionSnippetViewTVOS();
}

uint64_t OUTLINED_FUNCTION_10_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_11_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_12_4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 256) = a1;
  return *(_QWORD *)v2;
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return swift_release();
}

void OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;
  uint64_t v1;

  sub_23E18F3F0();

}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_23E1BDEEC();
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_21_3(_QWORD *a1)
{
  void (*v1)(uint64_t);

  sub_23E187EEC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return sub_23E1BDF70();
}

void ConfirmationView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  Swift::String v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v4 = OUTLINED_FUNCTION_11_1();
  v20 = *(_QWORD *)(v4 - 8);
  v21 = v4;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v7 = v6 - v5;
  v8 = sub_23E1BDE50();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v12 = v11 - v10;
  v13 = OUTLINED_FUNCTION_1_3();
  v14 = (uint64_t *)(a2 + *(int *)(v13 + 20));
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v14 = sub_23E1BDF04();
  v14[1] = v15;
  if (qword_256D34820 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v8, (uint64_t)qword_256D3AF00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, v16, v8);
  sub_23E1BE5B8();
  sub_23E1BE480();
  ConfirmationSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0;
  v18._countAndFlagsBits = 0xD000000000000069;
  v18._object = (void *)0x800000023E1C2680;
  v17._object = (void *)0xE000000000000000;
  Logger.debug(output:test:caller:)(v17, 0, v18);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  sub_23E181E98(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationSnippetModel);
  if (qword_256D34828 != -1)
    swift_once();
  v19 = (id)qword_256D3AF18;
  sub_23E1BDE2C();
  sub_23E1BE534();
  sub_23E1BDE20();
  sub_23E187F20(a1, (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationSnippetModel);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(a2 + *(int *)(v13 + 24), v7, v21);
  OUTLINED_FUNCTION_0_3();
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result;

  result = qword_256D352D8;
  if (!qword_256D352D8)
    return swift_getSingletonMetadata();
  return result;
}

void ConfirmationView.body.getter(uint64_t a1@<X8>)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t *v15;
  uint64_t v16;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_1_3();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35258);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  sub_23E181E98(v2, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationView);
  v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = swift_allocObject();
  sub_23E194E5C((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35260);
  sub_23E194EC8();
  sub_23E1BE318();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v11, v7);
  v15 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D35278) + 36));
  *v15 = KeyPath;
  v15[1] = 1;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_23E194700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t (**v17)();
  _QWORD v19[10];

  v4 = type metadata accessor for ConfirmationView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = sub_23E1BE348();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23E194878();
  v12 = MEMORY[0x24BDF4780];
  v13 = MEMORY[0x24BEAD938];
  v19[8] = MEMORY[0x24BDF4780];
  v19[9] = MEMORY[0x24BEAD938];
  v19[5] = v11;
  v14 = sub_23E194A0C();
  v19[3] = v12;
  v19[4] = v13;
  v19[0] = v14;
  sub_23E1BE33C();
  sub_23E181E98(a1, (uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationView);
  v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v16 = swift_allocObject();
  sub_23E194E5C((uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2, v10, v7);
  v17 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D35260) + 36));
  *v17 = sub_23E196BCC;
  v17[1] = (uint64_t (*)())v16;
  v17[2] = 0;
  v17[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23E194878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = type metadata accessor for ConfirmationView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35338);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E181E98(v0, (uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationView);
  v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = swift_allocObject();
  sub_23E194E5C((uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  sub_23E193EE8();
  sub_23E1BE2C4();
  sub_23E18819C(&qword_256D35340, &qword_256D35338);
  v10 = sub_23E1BE0D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_23E194A0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = type metadata accessor for ConfirmationView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35338);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E181E98(v0, (uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for ConfirmationView);
  v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = swift_allocObject();
  sub_23E194E5C((uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  sub_23E193EE8();
  sub_23E1BE2C4();
  sub_23E18819C(&qword_256D35340, &qword_256D35338);
  v10 = sub_23E1BE0D8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void sub_23E194BA0()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_256D34828 != -1)
    swift_once();
  type metadata accessor for ConfirmationView();
  sub_23E1BE528();
  sub_23E1BDE14();
  if (qword_256D34820 != -1)
    swift_once();
  v0 = sub_23E1BDE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  v1._countAndFlagsBits = 0xD000000000000069;
  v2._object = (void *)0x800000023E1C2710;
  v1._object = (void *)0x800000023E1C2680;
  v2._countAndFlagsBits = 0xD000000000000029;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

void sub_23E194CCC(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + *(int *)(type metadata accessor for ConfirmationView() + 20));
  if (v1)
  {
    type metadata accessor for ConfirmationSnippetModel();
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    v3 = (id)sub_23E1BDD60();
    sub_23E1BE3FC();

  }
  else
  {
    sub_23E1BE408();
    sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_23E1BDEF8();
    __break(1u);
  }
}

void sub_23E194D90(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + *(int *)(type metadata accessor for ConfirmationView() + 20));
  if (v1)
  {
    type metadata accessor for ConfirmationSnippetModel();
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    v3 = (id)sub_23E1BDD60();
    sub_23E1BE3FC();

  }
  else
  {
    sub_23E1BE408();
    sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_23E1BDEF8();
    __break(1u);
  }
}

uint64_t sub_23E194E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E194EA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_1_3();
  v3 = OUTLINED_FUNCTION_9_1(v2);
  return sub_23E194700(v3, a1);
}

unint64_t sub_23E194EC8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D35268;
  if (!qword_256D35268)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35260);
    sub_23E187EEC(&qword_256D35270, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D35268);
  }
  return result;
}

uint64_t sub_23E194F4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1BDF10();
  *a1 = result;
  return result;
}

uint64_t sub_23E194F74()
{
  return sub_23E1BDF1C();
}

uint64_t sub_23E194F98()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  char *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  id v62;
  void (*v64)(char *, char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  void (*v68)(char *, char *, uint64_t);
  int *v69;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a3;
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = *((_QWORD *)a2 + 3);
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = v8;
    v9 = (int *)type metadata accessor for ConfirmationSnippetModel();
    v10 = v9[6];
    v11 = &v4[v10];
    v12 = &a2[v10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v67 = v14;
    v14(&v4[v9[7]], &a2[v9[7]], v13);
    v15 = v9[8];
    v16 = &v4[v15];
    v17 = &a2[v15];
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
    v19(v16, v17, v18);
    v19(&v4[v9[9]], &a2[v9[9]], v18);
    v69 = v9;
    v20 = v9[10];
    v21 = &v4[v20];
    v22 = &a2[v20];
    v23 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, (uint64_t)v23))
    {
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      v64 = v19;
      v65 = v18;
      v66 = v6;
      v67(v21, v22, v13);
      v26 = v23[5];
      v27 = &v21[v26];
      v28 = &v22[v26];
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v68 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
      v68(v27, v28, v29);
      v30 = v23[6];
      v31 = &v21[v30];
      v32 = &v22[v30];
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
      v34 = v23[7];
      v35 = &v21[v34];
      v36 = &v22[v34];
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v38 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16);
      v38(v35, v36, v37);
      v38(&v21[v23[8]], &v22[v23[8]], v37);
      v39 = v23[9];
      v40 = &v21[v39];
      v41 = &v22[v39];
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v40, v41, v42);
      v68(&v21[v23[10]], &v22[v23[10]], v29);
      v43 = v23[11];
      v44 = &v21[v43];
      v45 = &v22[v43];
      v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 16))(v44, v45, v46);
      v68(&v21[v23[12]], &v22[v23[12]], v29);
      v68(&v21[v23[13]], &v22[v23[13]], v29);
      v47 = v23[14];
      v48 = &v21[v47];
      v49 = &v22[v47];
      v50 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50))
      {
        v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
      }
      else
      {
        v64(v48, v49, v65);
        __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
      }
      v6 = v66;
      __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, (uint64_t)v23);
    }
    v4[v69[11]] = a2[v69[11]];
    v52 = *(int *)(v6 + 20);
    v53 = *(int *)(v6 + 24);
    v54 = &v4[v52];
    v55 = &a2[v52];
    v57 = *(void **)v55;
    v56 = *((_QWORD *)v55 + 1);
    *(_QWORD *)v54 = v57;
    *((_QWORD *)v54 + 1) = v56;
    v58 = &v4[v53];
    v59 = &a2[v53];
    v60 = sub_23E1BDE38();
    v61 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v60 - 8) + 16);
    v62 = v57;
    v61(v58, v59, v60);
  }
  return v4;
}

uint64_t destroy for ConfirmationView(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v29)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for ConfirmationSnippetModel();
  v5 = a1 + v4[6];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + v4[7], v6);
  v8 = a1 + v4[8];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(a1 + v4[9], v9);
  v11 = a1 + v4[10];
  v12 = (int *)type metadata accessor for IconConfiguration();
  if (!__swift_getEnumTagSinglePayload(v11, 1, (uint64_t)v12))
  {
    v7(v11, v6);
    v13 = v11 + v12[5];
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v29 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
    v29(v13, v14);
    v15 = v11 + v12[6];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    v17 = v11 + v12[7];
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v19 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8);
    v19(v17, v18);
    v19(v11 + v12[8], v18);
    v20 = v11 + v12[9];
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
    v29(v11 + v12[10], v14);
    v22 = v11 + v12[11];
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
    v29(v11 + v12[12], v14);
    v29(v11 + v12[13], v14);
    v24 = v11 + v12[14];
    v25 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v24, 1, v25))
      v10(v24, v9);
  }

  v26 = a1 + *(int *)(a2 + 24);
  v27 = sub_23E1BDE38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v26, v27);
}

char *initializeWithCopy for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  id v59;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  int *v64;

  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v5;
  v6 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v6;
  v7 = (int *)type metadata accessor for ConfirmationSnippetModel();
  v8 = v7[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  v12(&a1[v7[7]], &a2[v7[7]], v11);
  v13 = v7[8];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  v17(v14, v15, v16);
  v17(&a1[v7[9]], &a2[v7[9]], v16);
  v64 = v7;
  v18 = v7[10];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v21))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v61 = v17;
    v62 = v16;
    v12(v19, v20, v11);
    v23 = v21[5];
    v24 = &v19[v23];
    v25 = &v20[v23];
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v63 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
    v63(v24, v25, v26);
    v27 = v21[6];
    v28 = &v19[v27];
    v29 = &v20[v27];
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
    v31 = v21[7];
    v32 = &v19[v31];
    v33 = &v20[v31];
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
    v35(v32, v33, v34);
    v35(&v19[v21[8]], &v20[v21[8]], v34);
    v36 = v21[9];
    v37 = &v19[v36];
    v38 = &v20[v36];
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v37, v38, v39);
    v63(&v19[v21[10]], &v20[v21[10]], v26);
    v40 = v21[11];
    v41 = &v19[v40];
    v42 = &v20[v40];
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v41, v42, v43);
    v63(&v19[v21[12]], &v20[v21[12]], v26);
    v63(&v19[v21[13]], &v20[v21[13]], v26);
    v44 = v21[14];
    v45 = &v19[v44];
    v46 = &v20[v44];
    v47 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
    {
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v61(v45, v46, v62);
      __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, (uint64_t)v21);
  }
  a1[v64[11]] = a2[v64[11]];
  v49 = *(int *)(a3 + 20);
  v50 = *(int *)(a3 + 24);
  v51 = &a1[v49];
  v52 = &a2[v49];
  v54 = *(void **)v52;
  v53 = *((_QWORD *)v52 + 1);
  *(_QWORD *)v51 = v54;
  *((_QWORD *)v51 + 1) = v53;
  v55 = &a1[v50];
  v56 = &a2[v50];
  v57 = sub_23E1BDE38();
  v58 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 16);
  v59 = v54;
  v58(v55, v56, v57);
  return a1;
}

char *assignWithCopy for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int EnumTagSinglePayload;
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
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  void *v49;
  const void *v50;
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
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  void (*v90)(uint64_t, uint64_t, uint64_t);
  void (*v91)(uint64_t, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int *v95;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for ConfirmationSnippetModel();
  v6 = v5[6];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v11(&a1[v5[7]], &a2[v5[7]], v9);
  v12 = v5[8];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v93 = *(_QWORD *)(v15 - 8);
  v16 = *(void (**)(char *, char *, uint64_t))(v93 + 24);
  v16(v13, v14, v15);
  v94 = v15;
  v16(&a1[v5[9]], &a2[v5[9]], v15);
  v95 = v5;
  v17 = v5[10];
  v18 = (uint64_t)&a1[v17];
  v19 = (uint64_t)&a2[v17];
  v20 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(v15) = __swift_getEnumTagSinglePayload(v18, 1, (uint64_t)v20);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v19, 1, (uint64_t)v20);
  if ((_DWORD)v15)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v18, v19, v9);
      v22 = v20[5];
      v23 = v18 + v22;
      v24 = v19 + v22;
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v91 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
      v91(v23, v24, v25);
      v26 = v20[6];
      v27 = v18 + v26;
      v28 = v19 + v26;
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
      v30 = v20[7];
      v31 = v18 + v30;
      v32 = v19 + v30;
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
      v34(v31, v32, v33);
      v34(v18 + v20[8], v19 + v20[8], v33);
      v35 = v20[9];
      v36 = v18 + v35;
      v37 = v19 + v35;
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
      v91(v18 + v20[10], v19 + v20[10], v25);
      v39 = v20[11];
      v40 = v18 + v39;
      v41 = v19 + v39;
      v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 16))(v40, v41, v42);
      v91(v18 + v20[12], v19 + v20[12], v25);
      v91(v18 + v20[13], v19 + v20[13], v25);
      v43 = v20[14];
      v44 = (void *)(v18 + v43);
      v45 = (const void *)(v19 + v43);
      v46 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
      {
        v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v93 + 16))(v44, v45, v94);
        __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
      }
      v77 = v18;
      v78 = (uint64_t)v20;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (EnumTagSinglePayload)
  {
    sub_23E187F20(v18, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
LABEL_7:
    v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
    v49 = (void *)v18;
    v50 = (const void *)v19;
    goto LABEL_8;
  }
  v11((char *)v18, (char *)v19, v9);
  v51 = v20[5];
  v52 = v18 + v51;
  v53 = v19 + v51;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 24);
  v92 = v54;
  v90(v52, v53, v54);
  v55 = v20[6];
  v56 = v18 + v55;
  v57 = v19 + v55;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 24))(v56, v57, v58);
  v59 = v20[7];
  v60 = v18 + v59;
  v61 = v19 + v59;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 24);
  v63(v60, v61, v62);
  v63(v18 + v20[8], v19 + v20[8], v62);
  v64 = v20[9];
  v65 = v18 + v64;
  v66 = v19 + v64;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 24))(v65, v66, v67);
  v90(v18 + v20[10], v19 + v20[10], v92);
  v68 = v20[11];
  v69 = v18 + v68;
  v70 = v19 + v68;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 24))(v69, v70, v71);
  v90(v18 + v20[12], v19 + v20[12], v92);
  v90(v18 + v20[13], v19 + v20[13], v92);
  v72 = v20[14];
  v73 = v18 + v72;
  v74 = v19 + v72;
  v75 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v69) = __swift_getEnumTagSinglePayload(v73, 1, v75);
  v76 = __swift_getEnumTagSinglePayload(v74, 1, v75);
  if ((_DWORD)v69)
  {
    if (!v76)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 16))(v73, v74, v94);
      v77 = v73;
      v78 = v75;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v77, 0, 1, v78);
      goto LABEL_15;
    }
  }
  else
  {
    if (!v76)
    {
      v16((char *)v73, (char *)v74, v94);
      goto LABEL_15;
    }
    sub_23E187F20(v73, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
  }
  v48 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
  v49 = (void *)v73;
  v50 = (const void *)v74;
LABEL_8:
  memcpy(v49, v50, v48);
LABEL_15:
  a1[v95[11]] = a2[v95[11]];
  v79 = *(int *)(a3 + 20);
  v80 = &a1[v79];
  v81 = &a2[v79];
  v82 = *(void **)&a1[v79];
  v83 = *(void **)&a2[v79];
  *(_QWORD *)v80 = v83;
  v84 = v83;

  *((_QWORD *)v80 + 1) = *((_QWORD *)v81 + 1);
  v85 = *(int *)(a3 + 24);
  v86 = &a1[v85];
  v87 = &a2[v85];
  v88 = sub_23E1BDE38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v88 - 8) + 24))(v86, v87, v88);
  return a1;
}

char *initializeWithTake for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  uint64_t v57;
  int *v58;

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  v7 = (int *)type metadata accessor for ConfirmationSnippetModel();
  v8 = v7[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(&a1[v7[7]], &a2[v7[7]], v11);
  v13 = v7[8];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
  v17(v14, v15, v16);
  v17(&a1[v7[9]], &a2[v7[9]], v16);
  v58 = v7;
  v18 = v7[10];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v21))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v54 = v17;
    v55 = v16;
    v57 = a3;
    v12(v19, v20, v11);
    v23 = v21[5];
    v24 = &v19[v23];
    v25 = &v20[v23];
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v56 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32);
    v56(v24, v25, v26);
    v27 = v21[6];
    v28 = &v19[v27];
    v29 = &v20[v27];
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v28, v29, v30);
    v31 = v21[7];
    v32 = &v19[v31];
    v33 = &v20[v31];
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v35 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 32);
    v35(v32, v33, v34);
    v35(&v19[v21[8]], &v20[v21[8]], v34);
    v36 = v21[9];
    v37 = &v19[v36];
    v38 = &v20[v36];
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v37, v38, v39);
    v56(&v19[v21[10]], &v20[v21[10]], v26);
    v40 = v21[11];
    v41 = &v19[v40];
    v42 = &v20[v40];
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
    v56(&v19[v21[12]], &v20[v21[12]], v26);
    v56(&v19[v21[13]], &v20[v21[13]], v26);
    v44 = v21[14];
    v45 = &v19[v44];
    v46 = &v20[v44];
    v47 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
    {
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v54(v45, v46, v55);
      __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, (uint64_t)v21);
    a3 = v57;
  }
  a1[v58[11]] = a2[v58[11]];
  v49 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  v50 = &a1[v49];
  v51 = &a2[v49];
  v52 = sub_23E1BDE38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v50, v51, v52);
  return a1;
}

char *assignWithTake for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  int EnumTagSinglePayload;
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
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const void *v47;
  uint64_t v48;
  uint64_t v49;
  size_t v50;
  void *v51;
  const void *v52;
  uint64_t v53;
  uint64_t v54;
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
  void (*v66)(uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  void *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  void (*v92)(uint64_t, uint64_t, uint64_t);
  void (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int *v97;

  v5 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  v6 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v6;
  swift_bridgeObjectRelease();
  v7 = (int *)type metadata accessor for ConfirmationSnippetModel();
  v8 = v7[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  v13(&a1[v7[7]], &a2[v7[7]], v11);
  v14 = v7[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v95 = *(_QWORD *)(v17 - 8);
  v18 = *(void (**)(char *, char *, uint64_t))(v95 + 40);
  v18(v15, v16, v17);
  v96 = v17;
  v18(&a1[v7[9]], &a2[v7[9]], v17);
  v97 = v7;
  v19 = v7[10];
  v20 = (uint64_t)&a1[v19];
  v21 = (uint64_t)&a2[v19];
  v22 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(v17) = __swift_getEnumTagSinglePayload(v20, 1, (uint64_t)v22);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v21, 1, (uint64_t)v22);
  if ((_DWORD)v17)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v20, v21, v11);
      v24 = v22[5];
      v25 = v20 + v24;
      v26 = v21 + v24;
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v93 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32);
      v93(v25, v26, v27);
      v28 = v22[6];
      v29 = v20 + v28;
      v30 = v21 + v28;
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
      v32 = v22[7];
      v33 = v20 + v32;
      v34 = v21 + v32;
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 32);
      v36(v33, v34, v35);
      v36(v20 + v22[8], v21 + v22[8], v35);
      v37 = v22[9];
      v38 = v20 + v37;
      v39 = v21 + v37;
      v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 32))(v38, v39, v40);
      v93(v20 + v22[10], v21 + v22[10], v27);
      v41 = v22[11];
      v42 = v20 + v41;
      v43 = v21 + v41;
      v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
      v93(v20 + v22[12], v21 + v22[12], v27);
      v93(v20 + v22[13], v21 + v22[13], v27);
      v45 = v22[14];
      v46 = (void *)(v20 + v45);
      v47 = (const void *)(v21 + v45);
      v48 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v48))
      {
        v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v95 + 32))(v46, v47, v96);
        __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v48);
      }
      v53 = a3;
      v81 = v20;
      v82 = (uint64_t)v22;
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  if (EnumTagSinglePayload)
  {
    sub_23E187F20(v20, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
LABEL_7:
    v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
    v51 = (void *)v20;
    v52 = (const void *)v21;
    goto LABEL_8;
  }
  v13((char *)v20, (char *)v21, v11);
  v54 = v22[5];
  v55 = v20 + v54;
  v56 = v21 + v54;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v92 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 40);
  v94 = v57;
  v92(v55, v56, v57);
  v58 = v22[6];
  v59 = v20 + v58;
  v60 = v21 + v58;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 40))(v59, v60, v61);
  v62 = v22[7];
  v63 = v20 + v62;
  v64 = v21 + v62;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 40);
  v66(v63, v64, v65);
  v66(v20 + v22[8], v21 + v22[8], v65);
  v67 = v22[9];
  v68 = v20 + v67;
  v69 = v21 + v67;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 40))(v68, v69, v70);
  v92(v20 + v22[10], v21 + v22[10], v94);
  v71 = v22[11];
  v72 = v20 + v71;
  v73 = v21 + v71;
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 40))(v72, v73, v74);
  v92(v20 + v22[12], v21 + v22[12], v94);
  v92(v20 + v22[13], v21 + v22[13], v94);
  v75 = v22[14];
  v76 = (char *)(v20 + v75);
  v77 = (char *)(v21 + v75);
  v78 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v72) = __swift_getEnumTagSinglePayload((uint64_t)v76, 1, v78);
  v79 = __swift_getEnumTagSinglePayload((uint64_t)v77, 1, v78);
  if (!(_DWORD)v72)
  {
    if (!v79)
    {
      v18(v76, v77, v96);
      goto LABEL_9;
    }
    sub_23E187F20((uint64_t)v76, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
    v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
    v51 = v76;
    v52 = v77;
LABEL_8:
    memcpy(v51, v52, v50);
LABEL_9:
    v53 = a3;
    goto LABEL_16;
  }
  v53 = a3;
  if (!v79)
  {
    (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v76, v77, v96);
    v81 = (uint64_t)v76;
    v82 = v78;
LABEL_15:
    __swift_storeEnumTagSinglePayload(v81, 0, 1, v82);
    goto LABEL_16;
  }
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  memcpy(v76, v77, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
LABEL_16:
  a1[v97[11]] = a2[v97[11]];
  v83 = *(int *)(v53 + 20);
  v84 = &a1[v83];
  v85 = &a2[v83];
  v86 = *(void **)&a1[v83];
  *(_QWORD *)v84 = *(_QWORD *)v85;

  *((_QWORD *)v84 + 1) = *((_QWORD *)v85 + 1);
  v87 = *(int *)(v53 + 24);
  v88 = &a1[v87];
  v89 = &a2[v87];
  v90 = sub_23E1BDE38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v90 - 8) + 40))(v88, v89, v90);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E196970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = OUTLINED_FUNCTION_8_3();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 2147483646)
  {
    v7 = OUTLINED_FUNCTION_11_1();
    v8 = v4 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfirmationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E196A14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_8_3();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20)) = v4;
      return result;
    }
    v9 = OUTLINED_FUNCTION_11_1();
    v10 = v5 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t sub_23E196A9C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for ConfirmationSnippetModel();
  if (v1 <= 0x3F)
  {
    result = sub_23E1BDE38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23E196B2C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_256D35318;
  if (!qword_256D35318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35278);
    sub_23E18819C(&qword_256D35320, &qword_256D35258);
    v3 = v2;
    sub_23E18819C(&qword_256D35328, &qword_256D35330);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256D35318);
  }
  return result;
}

uint64_t sub_23E196BCC()
{
  return sub_23E196E90((uint64_t (*)(uint64_t))sub_23E194BA0);
}

uint64_t sub_23E196BDC()
{
  return sub_23E196E90((uint64_t (*)(uint64_t))sub_23E194D90);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v26)(uint64_t, uint64_t);

  v1 = OUTLINED_FUNCTION_1_3();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for ConfirmationSnippetModel();
  v5 = v3 + v4[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_4_4(v5);
  OUTLINED_FUNCTION_4_4(v3 + v4[7]);
  v6 = v3 + v4[8];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v3 + v4[9], v7);
  v9 = v3 + v4[10];
  v10 = (int *)type metadata accessor for IconConfiguration();
  if (!__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10))
  {
    OUTLINED_FUNCTION_4_4(v9);
    v11 = v9 + v10[5];
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
    v26(v11, v12);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    OUTLINED_FUNCTION_2_5(v13);
    v14 = v9 + v10[7];
    v15 = v1;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8);
    v17(v14, v16);
    v18 = v16;
    v1 = v15;
    v17(v9 + v10[8], v18);
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    OUTLINED_FUNCTION_2_5(v19);
    v26(v9 + v10[10], v12);
    v20 = v9 + v10[11];
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
    OUTLINED_FUNCTION_4_4(v9 + v10[12]);
    OUTLINED_FUNCTION_4_4(v9 + v10[13]);
    v22 = v9 + v10[14];
    v23 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v22, 1, v23))
      v8(v22, v7);
  }

  v24 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_13_0(v24);
  return swift_deallocObject();
}

uint64_t sub_23E196E84()
{
  return sub_23E196E90((uint64_t (*)(uint64_t))sub_23E194CCC);
}

uint64_t sub_23E196E90(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_1_3();
  v2 = OUTLINED_FUNCTION_9_1(v1);
  return a1(v2);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return type metadata accessor for ConfirmationView();
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return type metadata accessor for ConfirmationSnippetModel();
}

void TemperatureView.init(model:)()
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;

  OUTLINED_FUNCTION_15_4();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_11_1();
  v15 = *(_QWORD *)(v5 - 8);
  v16 = v5;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_14_4();
  v6 = sub_23E1BDE50();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_3_3();
  v11 = (uint64_t *)(v4 + *(int *)(v10 + 20));
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v11 = sub_23E1BDF04();
  v11[1] = v12;
  sub_23E181E98(v2, v4, (uint64_t (*)(_QWORD))type metadata accessor for TemperatureSnippetModel);
  if (qword_256D34820 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v6, (uint64_t)qword_256D3AF00);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0xD000000000000030;
  v17._object = (void *)0x800000023E1C2740;
  TemperatureSnippetModel.description.getter();
  sub_23E1BE480();
  OUTLINED_FUNCTION_17_2();
  v14._countAndFlagsBits = 0xD000000000000068;
  v14._object = (void *)0x800000023E1C2780;
  Logger.debug(output:test:caller:)(v17, 0, v14);
  OUTLINED_FUNCTION_17_2();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (qword_256D34828 != -1)
    swift_once();
  (id)qword_256D3AF18;
  sub_23E1BDE2C();
  sub_23E1BE534();
  sub_23E1BDE20();
  sub_23E189298(v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v4 + *(int *)(v10 + 24), v0, v16);
  OUTLINED_FUNCTION_0_3();
}

uint64_t type metadata accessor for TemperatureView()
{
  uint64_t result;

  result = qword_256D353B8;
  if (!qword_256D353B8)
    return swift_getSingletonMetadata();
  return result;
}

void TemperatureView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (**v53)();
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58[2];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  unint64_t v77;

  OUTLINED_FUNCTION_15_4();
  v75 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F70);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3();
  v71 = v4;
  v5 = sub_23E1BDEB0();
  v65 = *(_QWORD *)(v5 - 8);
  v66 = v5;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3();
  v63 = v7;
  v8 = OUTLINED_FUNCTION_3_3();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F78);
  v61 = *(_QWORD *)(v11 - 8);
  v62 = v11;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_14_4();
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F80);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34F88);
  v68 = *(_QWORD *)(v16 - 8);
  v69 = v16;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_3();
  v67 = v18;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35348);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3();
  v70 = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35350);
  v74 = *(_QWORD *)(v21 - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_3();
  v72 = v23;
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  v24 = v77;
  if (v77)
  {
    v60 = v21;
    v25 = v76;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    sub_23E1BDDCC();
    if (v76 != 2)
    {
      v27 = v76 & 1;
      v59 = v0;
      v58[0] = (uint64_t)v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_23E181E98(v0, v58[0], (uint64_t (*)(_QWORD))type metadata accessor for TemperatureView);
      v28 = *(unsigned __int8 *)(v9 + 80);
      v58[1] = v28 | 7;
      v29 = swift_allocObject();
      *(_BYTE *)(v29 + 16) = v27;
      *(_QWORD *)(v29 + 24) = v25;
      *(_QWORD *)(v29 + 32) = v24;
      sub_23E198134((uint64_t)v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + ((v28 + 40) & ~v28));
      sub_23E1BE3D8();
      sub_23E187EEC(&qword_256D34FA8, (void (*)(uint64_t))MEMORY[0x24BEAE228]);
      sub_23E1BE318();
      KeyPath = swift_getKeyPath();
      v32 = v65;
      v31 = v66;
      v33 = v63;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v65 + 104))(v63, *MEMORY[0x24BDEB400], v66);
      v34 = v64;
      v35 = (uint64_t *)&v15[*(int *)(v64 + 36)];
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FB8);
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))((char *)v35 + *(int *)(v36 + 28), v33, v31);
      *v35 = KeyPath;
      v38 = v61;
      v37 = v62;
      (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v15, v1, v62);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v31);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v1, v37);
      v39 = sub_23E1BE21C();
      v40 = (uint64_t)v71;
      *v71 = v39;
      v41 = *MEMORY[0x24BEADC28];
      v42 = sub_23E1BE330();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v40, v41, v42);
      __swift_storeEnumTagSinglePayload(v40, 0, 1, v42);
      v43 = sub_23E190A10();
      v44 = v67;
      MEMORY[0x24264CB5C](v40, v34, v43);
      sub_23E198DD0(v40, &qword_256D34F70);
      sub_23E198DD0((uint64_t)v15, &qword_256D34F80);
      v45 = v10;
      v46 = v59;
      v47 = v58[0];
      sub_23E181E98(v59, v58[0], (uint64_t (*)(_QWORD))type metadata accessor for TemperatureView);
      v71 = (uint64_t *)(((v28 + 16) & ~v28) + v45);
      v48 = swift_allocObject();
      OUTLINED_FUNCTION_19_4(v48);
      v50 = v68;
      v49 = v69;
      v51 = v70;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16))(v70, v44, v69);
      v52 = v73;
      v53 = (uint64_t (**)())(v51 + *(int *)(v73 + 36));
      *v53 = sub_23E1981C4;
      v53[1] = (uint64_t (*)())v48;
      v53[2] = 0;
      v53[3] = 0;
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v44, v49);
      sub_23E181E98(v46, v47, (uint64_t (*)(_QWORD))type metadata accessor for TemperatureView);
      v54 = swift_allocObject();
      OUTLINED_FUNCTION_19_4(v54);
      v55 = sub_23E1982E0();
      v56 = v72;
      sub_23E1BE0FC();
      swift_release();
      sub_23E198DD0(v51, &qword_256D35348);
      v76 = v52;
      v77 = v55;
      swift_getOpaqueTypeConformance2();
      v57 = v60;
      v26 = sub_23E1BE0D8();
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v56, v57);
      goto LABEL_6;
    }
    OUTLINED_FUNCTION_17_2();
  }
  v26 = 0;
LABEL_6:
  *v75 = v26;
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_23E1976B4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = sub_23E1BDFB8();
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  if ((a1 & 1) != 0)
    sub_23E1BE234();
  else
    sub_23E1BE1B0();
  sub_23E193EE8();
  swift_bridgeObjectRetain();
  v4 = sub_23E1BE0CC();
  v6 = v5;
  v8 = v7 & 1;
  sub_23E1BE090();
  v9 = sub_23E1BE0B4();
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_23E193F54(v4, v6, v8);
  swift_bridgeObjectRelease();
  v14 = sub_23E1BE09C();
  v16 = v15;
  v18 = v17 & 1;
  sub_23E193F54(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  v19 = sub_23E1BE0A8();
  v21 = v20;
  v23 = v22 & 1;
  sub_23E193F54(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_23E1BE0D8();
  sub_23E193F54(v19, v21, v23);
  swift_bridgeObjectRelease();
  sub_23E1BDFAC();
  sub_23E1BDFA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BDF94();
  swift_bridgeObjectRelease();
  sub_23E1BDFA0();
  sub_23E1BDFC4();
  v24 = sub_23E1BE0C0();
  v26 = v25;
  v28 = v27;
  v38 = v29;
  sub_23E1BDFAC();
  sub_23E1BDFA0();
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  result = sub_23E1BDDCC();
  if (v21)
  {
    sub_23E1BDF94();
    swift_bridgeObjectRelease();
    sub_23E1BDFA0();
    sub_23E1BDFC4();
    v31 = sub_23E1BE0C0();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = v24;
    *(_QWORD *)(v40 + 24) = v26;
    *(_BYTE *)(v40 + 32) = v28 & 1;
    *(_QWORD *)(v40 + 40) = v38;
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = v31;
    *(_QWORD *)(v39 + 24) = v33;
    *(_BYTE *)(v39 + 32) = v35 & 1;
    *(_QWORD *)(v39 + 40) = v37;
    sub_23E1BE3CC();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23E197B3C()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_256D34820 != -1)
    swift_once();
  v0 = sub_23E1BDE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  v1._countAndFlagsBits = 0xD000000000000068;
  v2._object = (void *)0x800000023E1C2810;
  v1._object = (void *)0x800000023E1C2780;
  v2._countAndFlagsBits = 0xD000000000000028;
  Logger.debug(output:test:caller:)(v2, 0, v1);
  if (qword_256D34828 != -1)
    swift_once();
  type metadata accessor for TemperatureView();
  sub_23E1BE528();
  return sub_23E1BDE14();
}

void sub_23E197C68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  Swift::String v13;
  Swift::String v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;

  v2 = sub_23E1BDE50();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23E1BDD0C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D34820 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v2, (uint64_t)qword_256D3AF00);
  v13._countAndFlagsBits = 0xD00000000000001CLL;
  v13._object = (void *)0x800000023E1C23E0;
  v14._object = (void *)0x800000023E1C2780;
  v14._countAndFlagsBits = 0xD000000000000068;
  Logger.debug(output:test:caller:)(v13, 0, v14);
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_23E198DD0((uint64_t)v7, &qword_256D34CE0);
  }
  else
  {
    v24 = v9;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
    v16 = *(void **)(a1 + *(int *)(type metadata accessor for TemperatureView() + 20));
    if (v16)
    {
      v17 = v16;
      sub_23E1BE3E4();

      sub_23E1BE570();
      v18 = (void *)sub_23E1BE420();
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_setBundleId_, v18);

      v19 = (void *)sub_23E1BDCF4();
      objc_msgSend(v15, sel_setPunchOutUri_, v19);

      v20 = v17;
      v21 = v15;
      sub_23E1BE3F0();

      v22 = v25;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v4, v12, v2);
      strcpy((char *)&v26, "Punchout to ");
      BYTE5(v26._object) = 0;
      HIWORD(v26._object) = -5120;
      sub_23E187EEC(&qword_256D350C0, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
      sub_23E1BE6A8();
      sub_23E1BE480();
      swift_bridgeObjectRelease();
      sub_23E1BE480();
      v23._object = (void *)0x800000023E1C2780;
      v23._countAndFlagsBits = 0xD000000000000068;
      Logger.debug(output:test:caller:)(v26, 0, v23);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v2);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v8);
    }
    else
    {
      sub_23E1BE408();
      sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
      sub_23E1BDEF8();
      __break(1u);
    }
  }
}

uint64_t sub_23E198064()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_3_3();
  swift_bridgeObjectRelease();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_0_1();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_5_1(v1);
  OUTLINED_FUNCTION_12_5();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_2_5(v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  OUTLINED_FUNCTION_4_3(v3);
  OUTLINED_FUNCTION_16_1();
  v4 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_12_4(v4);
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_23E198134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TemperatureView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E198178()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_3();
  return sub_23E1976B4(*(_BYTE *)(v0 + 16));
}

uint64_t sub_23E1981C4()
{
  return sub_23E1982A8((uint64_t (*)(uint64_t))sub_23E197B3C);
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_3_3();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_0_1();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_5_1(v1);
  OUTLINED_FUNCTION_12_5();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_2_5(v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  OUTLINED_FUNCTION_4_3(v3);
  OUTLINED_FUNCTION_16_1();
  v4 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_12_4(v4);
  return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_23E19829C()
{
  return sub_23E1982A8((uint64_t (*)(uint64_t))sub_23E197C68);
}

uint64_t sub_23E1982A8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_3_3() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

unint64_t sub_23E1982E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256D35358;
  if (!qword_256D35358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35348);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34F80);
    v2[3] = sub_23E190A10();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D35358);
  }
  return result;
}

uint64_t sub_23E198374()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for TemperatureView(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  id v32;
  uint64_t v33;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v33 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for TemperatureSnippetModel();
    v9 = v8[5];
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    v13(&a1[v8[6]], (char *)a2 + v8[6], v12);
    v14 = v8[7];
    v15 = &a1[v14];
    v16 = (char *)a2 + v14;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    v18 = v8[8];
    v19 = &a1[v18];
    v20 = (char *)a2 + v18;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = *(int *)(a3 + 20);
    v23 = *(int *)(a3 + 24);
    v24 = &a1[v22];
    v25 = (char *)a2 + v22;
    v27 = *(void **)v25;
    v26 = *((_QWORD *)v25 + 1);
    *(_QWORD *)v24 = v27;
    *((_QWORD *)v24 + 1) = v26;
    v28 = &a1[v23];
    v29 = (char *)a2 + v23;
    v30 = sub_23E1BDE38();
    v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
    v32 = v27;
    v31(v28, v29, v30);
  }
  return a1;
}

uint64_t destroy for TemperatureView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (int *)type metadata accessor for TemperatureSnippetModel();
  v6 = a1 + v5[5];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + v5[6], v7);
  v9 = a1 + v5[7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = a1 + v5[8];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);

  v13 = a1 + *(int *)(a2 + 24);
  v14 = sub_23E1BDE38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

uint64_t initializeWithCopy for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
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
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  id v31;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  v13 = v7[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  v17 = v7[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = *(int *)(a3 + 20);
  v22 = *(int *)(a3 + 24);
  v23 = (_QWORD *)(a1 + v21);
  v24 = a2 + v21;
  v26 = *(void **)v24;
  v25 = *(_QWORD *)(v24 + 8);
  *v23 = v26;
  v23[1] = v25;
  v27 = a1 + v22;
  v28 = a2 + v22;
  v29 = sub_23E1BDE38();
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
  v31 = v26;
  v30(v27, v28, v29);
  return a1;
}

uint64_t assignWithCopy for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  v13 = v7[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = v7[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  v21 = *(int *)(a3 + 20);
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  v24 = *(void **)(a1 + v21);
  v25 = *(void **)(a2 + v21);
  *v22 = v25;
  v26 = v25;

  v22[1] = *(_QWORD *)(v23 + 8);
  v27 = *(int *)(a3 + 24);
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v28, v29, v30);
  return a1;
}

uint64_t initializeWithTake for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  v13 = v7[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = v7[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  v21 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  return a1;
}

uint64_t assignWithTake for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  v13 = v7[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = v7[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = *(int *)(a3 + 20);
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  v24 = *(void **)(a1 + v21);
  *v22 = *v23;

  v22[1] = v23[1];
  v25 = *(int *)(a3 + 24);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for TemperatureView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E198BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = OUTLINED_FUNCTION_0_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v7 = OUTLINED_FUNCTION_11_1();
    v8 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for TemperatureView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E198C54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_0_1();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
      return result;
    }
    v9 = OUTLINED_FUNCTION_11_1();
    v10 = a1 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t sub_23E198CE4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for TemperatureSnippetModel();
  if (v1 <= 0x3F)
  {
    result = sub_23E1BDE38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23E198D74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256D353F8;
  if (!qword_256D353F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35400);
    v2 = MEMORY[0x24BDF4760];
    result = MEMORY[0x24264D408](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D353F8);
  }
  return result;
}

void sub_23E198DD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E198E08()
{
  uint64_t v0;

  sub_23E193F54(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return type metadata accessor for TemperatureView();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v0 + *(int *)(v1 + 24), v2);
}

void OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;
  uint64_t v1;

}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_23E198134(v2, a1 + v1);
}

Swift::Void __swiftcall Logger.debug(output:test:caller:)(Swift::String output, Swift::Bool test, Swift::String caller)
{
  unint64_t v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  _DWORD *v12;
  _DWORD *v13;
  _BYTE v14[16];
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;

  v16 = 46;
  v17 = 0xE100000000000000;
  v15 = &v16;
  v3 = OUTLINED_FUNCTION_24_1(sub_23E19A26C, (uint64_t)v14, test, caller._countAndFlagsBits, (unint64_t)caller._object);
  if ((v4 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_4();
    v3 = OUTLINED_FUNCTION_10_3();
  }
  v5 = v3;
  v16 = 47;
  v17 = 0xE100000000000000;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_30_1(sub_23E19A344, v6);
  v8 = v7;
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  v9 = (void *)sub_23E1BDE44();
  v10 = sub_23E1BE510();
  v11 = OUTLINED_FUNCTION_23_4(v10);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      v13 = (_DWORD *)OUTLINED_FUNCTION_4_5();
      v16 = OUTLINED_FUNCTION_4_5();
      *v13 = 136446466;
      OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_29_0();
    }
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    OUTLINED_FUNCTION_2_6();
    OUTLINED_FUNCTION_0_4();

    OUTLINED_FUNCTION_0_3();
    return;
  }
  v12 = (_DWORD *)OUTLINED_FUNCTION_4_5();
  v16 = OUTLINED_FUNCTION_4_5();
  *v12 = 136446466;
  if (v5 >> 14 >= (unint64_t)OUTLINED_FUNCTION_10_3() >> 14)
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_29_0();
  }
  __break(1u);
}

uint64_t sub_23E19915C()
{
  uint64_t v0;
  id v1;

  v0 = sub_23E1BDE50();
  __swift_allocate_value_buffer(v0, qword_256D3AF00);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  if (qword_256D34828 != -1)
    swift_once();
  v1 = (id)qword_256D3AF18;
  return sub_23E1BDE5C();
}

uint64_t sub_23E1991DC()
{
  uint64_t result;

  sub_23E19A2C8();
  if (qword_256D34830 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_23E1BE57C();
  qword_256D3AF18 = result;
  return result;
}

void sub_23E199270()
{
  qword_256D3AF20 = 26997;
  *(_QWORD *)algn_256D3AF28 = 0xE200000000000000;
}

Swift::Void __swiftcall Logger.info(output:addToSummary:test:caller:)(Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  void *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v4 = 0x65725F7261646172;
  v22 = 46;
  v23 = 0xE100000000000000;
  v20 = &v22;
  if (!addToSummary)
    v4 = 0;
  v18 = v4;
  v5 = sub_23E19A144(sub_23E19A344, (uint64_t)v19, caller._countAndFlagsBits, (unint64_t)caller._object);
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_4();
    v5 = OUTLINED_FUNCTION_10_3();
  }
  v7 = v5;
  v22 = 47;
  v23 = 0xE100000000000000;
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_30_1(sub_23E19A344, v8);
  v10 = v9;
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_20_4();
  v11 = (void *)sub_23E1BDE44();
  v12 = sub_23E1BE504();
  v13 = OUTLINED_FUNCTION_23_4(v12);
  if ((v10 & 1) != 0)
  {
    if (v13)
    {
      v16 = OUTLINED_FUNCTION_4_5();
      v22 = OUTLINED_FUNCTION_4_5();
      *(_DWORD *)v16 = 136315650;
      OUTLINED_FUNCTION_20_4();
      v21 = OUTLINED_FUNCTION_13_6(v18, v17, &v22);
      OUTLINED_FUNCTION_1_5();
      OUTLINED_FUNCTION_11_3();
      *(_WORD *)(v16 + 12) = 2082;
      OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_29_0();
    }
    goto LABEL_11;
  }
  if (!v13)
  {
LABEL_11:
    OUTLINED_FUNCTION_2_6();
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_2_6();

    OUTLINED_FUNCTION_0_3();
    return;
  }
  v14 = OUTLINED_FUNCTION_4_5();
  v22 = OUTLINED_FUNCTION_4_5();
  *(_DWORD *)v14 = 136315650;
  OUTLINED_FUNCTION_20_4();
  v21 = OUTLINED_FUNCTION_13_6(v18, v15, &v22);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_11_3();
  *(_WORD *)(v14 + 12) = 2082;
  if (v7 >> 14 >= (unint64_t)OUTLINED_FUNCTION_10_3() >> 14)
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_27_3();
  }
  __break(1u);
}

Swift::Void __swiftcall Logger.error(output:test:file:function:line:)(Swift::String output, Swift::Bool test, Swift::String file, Swift::String function, Swift::Int line)
{
  unint64_t object;
  uint64_t countAndFlagsBits;
  char v7;
  char v8;
  NSObject *v9;
  int v10;
  _BOOL4 v11;
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
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[16];
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60[2];

  object = (unint64_t)file._object;
  countAndFlagsBits = file._countAndFlagsBits;
  v56 = output._countAndFlagsBits;
  v60[0] = 47;
  v60[1] = 0xE100000000000000;
  v58 = v60;
  OUTLINED_FUNCTION_24_1(sub_23E19A344, (uint64_t)v57, test, file._countAndFlagsBits, (unint64_t)file._object);
  v8 = v7;
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  v9 = sub_23E1BDE44();
  v10 = sub_23E1BE51C();
  v11 = os_log_type_enabled(v9, (os_log_type_t)v10);
  if ((v8 & 1) != 0)
  {
    if (v11)
    {
      v32 = OUTLINED_FUNCTION_4_5();
      v33 = OUTLINED_FUNCTION_4_5();
      v60[0] = v33;
      *(_DWORD *)v32 = 136316162;
      HIDWORD(v53) = v10;
      v59 = OUTLINED_FUNCTION_5_2(v33, v34, v35, v36, v37, v38, v39, v40, v50, v53);
      OUTLINED_FUNCTION_8_4();
      v41 = OUTLINED_FUNCTION_18_3();
      v59 = OUTLINED_FUNCTION_22_2(v41, v42, v43, v44, v45, v46, v47, v48, v52, v55);
      OUTLINED_FUNCTION_8_4();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_17_3();
      v59 = OUTLINED_FUNCTION_13_6(v56, v49, v60);
      OUTLINED_FUNCTION_8_4();
      OUTLINED_FUNCTION_11_3();
      *(_WORD *)(v32 + 32) = 2082;
      OUTLINED_FUNCTION_9_4();
      OUTLINED_FUNCTION_6_2();
      OUTLINED_FUNCTION_27_3();
    }
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_2_6();
    OUTLINED_FUNCTION_2_6();

    return;
  }
  HIDWORD(v53) = v10;
  v12 = OUTLINED_FUNCTION_4_5();
  v13 = OUTLINED_FUNCTION_4_5();
  v60[0] = v13;
  *(_DWORD *)v12 = 136316162;
  v59 = OUTLINED_FUNCTION_5_2(v13, v14, v15, v16, v17, v18, v19, v20, v13, v53);
  OUTLINED_FUNCTION_7_2();
  v21 = OUTLINED_FUNCTION_18_3();
  v59 = OUTLINED_FUNCTION_22_2(v21, v22, v23, v24, v25, v26, v27, v28, v51, v54);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_17_3();
  v59 = OUTLINED_FUNCTION_13_6(v56, v29, v60);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_11_3();
  *(_WORD *)(v12 + 32) = 2082;
  v30 = OUTLINED_FUNCTION_10_3();
  v31 = HIBYTE(object) & 0xF;
  if ((object & 0x2000000000000000) == 0)
    v31 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (4 * v31 >= v30 >> 14)
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_27_3();
  }
  __break(1u);
}

uint64_t sub_23E19999C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_23E199A6C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23E19A288((uint64_t)v12, *a3);
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
      sub_23E19A288((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23E199A6C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23E199BC0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23E1BE5A0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23E199C84(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23E1BE5E8();
    if (!v8)
    {
      result = sub_23E1BE600();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23E199BC0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23E1BE60C();
  __break(1u);
  return result;
}

uint64_t sub_23E199C84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23E199D18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23E199EEC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23E199EEC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23E199D18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23E1BE498();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_23E199E88(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23E1BE5C4();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23E1BE60C();
  __break(1u);
LABEL_14:
  result = sub_23E1BE600();
  __break(1u);
  return result;
}

_QWORD *sub_23E199E88(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35408);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23E199EEC(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D35408);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23E19A084(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23E199FC0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23E199FC0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23E1BE60C();
  __break(1u);
  return result;
}

char *sub_23E19A084(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23E1BE60C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_23E19A104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_23E1BE6B4() & 1;
}

unint64_t sub_23E19A144(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD v12[2];

  v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v5 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v5)
    return 0;
  while (1)
  {
    v7 = sub_23E1BE468();
    v12[0] = sub_23E1BE4BC();
    v12[1] = v8;
    v9 = a1(v12);
    if (v4)
      break;
    v10 = v9;
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v7;
    if (v7 < 0x4000)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_23E19A244(uint64_t *a1, uint64_t *a2)
{
  return sub_23E19A104(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_23E19A26C(uint64_t *a1)
{
  uint64_t v1;

  return sub_23E19A244(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_23E19A288(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23E19A2C8()
{
  unint64_t result;

  result = qword_256D35410;
  if (!qword_256D35410)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256D35410);
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

uint64_t sub_23E19A344(uint64_t *a1)
{
  return sub_23E19A26C(a1) & 1;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return sub_23E1BE594();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_3_4()
{
  JUMPOUT(0x24264D480);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_23E19999C(0x65725F7261646172, 0xEF202D2074726F70, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_23E1BE4C8();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_23E1BE594();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_23E1BE594();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_23E1BE474();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_6(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_23E19999C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_15_5()
{
  uint64_t v0;

  *(_WORD *)(v0 + 42) = 2050;
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  uint64_t v0;

  *(_WORD *)(v0 + 22) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2082;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_5(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_21_4(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x34u);
}

uint64_t OUTLINED_FUNCTION_22_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  unint64_t v11;
  va_list va;

  va_start(va, a10);
  return sub_23E19999C(v10, v11, (uint64_t *)va);
}

BOOL OUTLINED_FUNCTION_23_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

unint64_t OUTLINED_FUNCTION_24_1(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_23E19A144(a1, a2, a4, a5);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23E19999C(*(_QWORD *)(v1 - 160), v0, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_27_3()
{
  JUMPOUT(0x24264CEA4);
}

void OUTLINED_FUNCTION_29_0()
{
  JUMPOUT(0x24264CEA4);
}

unint64_t OUTLINED_FUNCTION_30_1(uint64_t (*a1)(_QWORD *), uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  return sub_23E19A144(a1, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t IconConfiguration.description.getter()
{
  sub_23E1BE5B8();
  sub_23E1BE480();
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_41();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42();
  sub_23E1BE480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_41();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42();
  sub_23E1BE480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t IconConfiguration.iconName.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_16();
  return v1;
}

void IconConfiguration.iconColor.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

uint64_t IconConfiguration.init(iconName:iconColor:circleColor:onStateIconName:offStateIconName:action:rgbIconColor:deviceType:onStateMode:offStateMode:)@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void (*v16)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v7 = (int *)OUTLINED_FUNCTION_24();
  v8 = a2 + v7[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  v19 = v8;
  OUTLINED_FUNCTION_14_6();
  v18 = a2 + v7[6];
  sub_23E1BDDB4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35418);
  sub_23E1BDDB4();
  v9 = a2 + v7[10];
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_6();
  v10 = a2 + v7[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35420);
  sub_23E1BDDB4();
  v11 = a2 + v7[12];
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_6();
  v12 = a2 + v7[13];
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_14_6();
  v13 = a2 + v7[14];
  v14 = type metadata accessor for DirectInvocationConfig();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_30_2(v9);
  OUTLINED_FUNCTION_14_6();
  if (a1)
    swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_5_3();
  v15(v18);
  sub_23E1BDDB4();
  sub_23E19B2DC(a5, v13);
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_30_2(v19);
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_30_2(v11);
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_30_2(v12);
  OUTLINED_FUNCTION_14_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  OUTLINED_FUNCTION_5_3();
  v16(v10);
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_45();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  sub_23E1BDDD8();
  return sub_23E19B324(a5);
}

uint64_t IconConfiguration.rgbIconColor.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  sub_23E1BDDCC();
  return v1;
}

uint64_t static IconConfiguration.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = IconConfiguration.description.getter();
  v2 = v1;
  if (v0 == IconConfiguration.description.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23E1BE6B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void IconConfiguration.circleColor.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.shouldRenderCircle.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

uint64_t IconConfiguration.iconName.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  return OUTLINED_FUNCTION_14();
}

void IconConfiguration.iconColor.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.onStateIconName.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.offStateIconName.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.rgbIconColor.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  sub_23E1BDDD8();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.onStateMode.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.offStateMode.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.deviceType.setter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

uint64_t IconConfiguration.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_23E1BDD30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_8();
  v4 = v3 - v2;
  sub_23E1BDD24();
  v5 = sub_23E1BDD18();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  return v5;
}

uint64_t sub_23E19AE50()
{
  swift_bridgeObjectRetain();
  return IconConfiguration.iconName.setter();
}

void IconConfiguration.iconName.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.iconColor.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t IconConfiguration.shouldRenderCircle.getter()
{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDCC();
  return v1;
}

uint64_t type metadata accessor for IconConfiguration()
{
  uint64_t result;

  result = qword_256D354F8;
  if (!qword_256D354F8)
    return swift_getSingletonMetadata();
  return result;
}

void IconConfiguration.shouldRenderCircle.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.onStateMode.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_9();
}

void sub_23E19B014(_BYTE *a1@<X8>)
{
  char v2;

  IconConfiguration.onStateMode.getter();
  *a1 = v2;
}

void sub_23E19B04C()
{
  IconConfiguration.onStateMode.setter();
}

void IconConfiguration.onStateMode.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.offStateMode.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_9();
}

void sub_23E19B100(_BYTE *a1@<X8>)
{
  char v2;

  IconConfiguration.offStateMode.getter();
  *a1 = v2;
}

void sub_23E19B138()
{
  IconConfiguration.offStateMode.setter();
}

void IconConfiguration.offStateMode.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.deviceType.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_9();
}

void sub_23E19B1EC(_BYTE *a1@<X8>)
{
  char v2;

  IconConfiguration.deviceType.getter();
  *a1 = v2;
}

void sub_23E19B224()
{
  IconConfiguration.deviceType.setter();
}

void IconConfiguration.deviceType.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.circleColor.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23E19B2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E19B324(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void IconConfiguration.circleColor.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E19B3B0()
{
  swift_bridgeObjectRetain();
  IconConfiguration.rgbIconColor.setter();
}

void IconConfiguration.rgbIconColor.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.onStateIconName.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

void IconConfiguration.onStateIconName.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void IconConfiguration.offStateIconName.getter()
{
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_23E19B4E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  v7 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v6, v7);
}

void IconConfiguration.offStateIconName.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t IconConfiguration.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_24() + 56);
  return sub_23E1941D4(v3, a1);
}

uint64_t IconConfiguration.action.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_24() + 56);
  return sub_23E19B5C4(a1, v3);
}

uint64_t sub_23E19B5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*IconConfiguration.action.modify())()
{
  OUTLINED_FUNCTION_24();
  return nullsub_1;
}

uint64_t sub_23E19B630()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB)
    return 11;
  else
    return v0;
}

uint64_t sub_23E19B67C()
{
  return 11;
}

uint64_t sub_23E19B684(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E19B6BC + 4 * byte_23E1BF980[a1]))(0xD000000000000010, 0x800000023E1C1CA0);
}

uint64_t sub_23E19B6BC()
{
  return 0x4965746174536E6FLL;
}

uint64_t sub_23E19B6E0()
{
  return 0x4D65746174536E6FLL;
}

uint64_t sub_23E19B700()
{
  return 0x657461745366666FLL;
}

uint64_t sub_23E19B720()
{
  return 0x7954656369766564;
}

uint64_t sub_23E19B73C(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_23E19B754()
{
  return 0x6F43656C63726963;
}

uint64_t sub_23E19B774()
{
  return 0x6E6F69746361;
}

uint64_t sub_23E19B788()
{
  return 0x6F6C6F436E6F6369;
}

uint64_t sub_23E19B7A4()
{
  return 0x436E6F6349626772;
}

uint64_t sub_23E19B7C4()
{
  return 0x656D614E6E6F6369;
}

uint64_t sub_23E19B7DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E19B814 + 4 * byte_23E1BF98B[a1]))(0xD000000000000010, 0x800000023E1C1CA0);
}

uint64_t sub_23E19B814()
{
  return 0x4965746174536E6FLL;
}

uint64_t sub_23E19B838()
{
  return 0x4D65746174536E6FLL;
}

uint64_t sub_23E19B858()
{
  return 0x657461745366666FLL;
}

uint64_t sub_23E19B878()
{
  return 0x7954656369766564;
}

uint64_t sub_23E19B894(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_23E19B8AC()
{
  return 0x6F43656C63726963;
}

uint64_t sub_23E19B8CC()
{
  return 0x6E6F69746361;
}

uint64_t sub_23E19B8E0()
{
  return 0x6F6C6F436E6F6369;
}

uint64_t sub_23E19B8FC()
{
  return 0x436E6F6349626772;
}

uint64_t sub_23E19B91C()
{
  return 0x656D614E6E6F6369;
}

void sub_23E19B934(unsigned __int8 *a1, unsigned __int8 *a2)
{
  sub_23E1B5BF4(*a1, *a2);
}

void sub_23E19B940()
{
  unsigned __int8 *v0;

  sub_23E1B5D74(*v0);
}

uint64_t sub_23E19B948(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23E1B5FB8(a1, *v1);
}

void sub_23E19B950(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23E1B60F8(a1, *v1);
}

uint64_t sub_23E19B958@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19B630();
  *a1 = result;
  return result;
}

void sub_23E19B984(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_23E19B684(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19B9A8()
{
  unsigned __int8 *v0;

  return sub_23E19B7DC(*v0);
}

uint64_t sub_23E19B9B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19B678();
  *a1 = result;
  return result;
}

uint64_t sub_23E19B9D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19B67C();
  *a1 = result;
  return result;
}

uint64_t sub_23E19B9F8()
{
  sub_23E19C1EC();
  return sub_23E1BE708();
}

uint64_t sub_23E19BA20()
{
  sub_23E19C1EC();
  return sub_23E1BE714();
}

void IconConfiguration.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
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
  void (*v21)(uint64_t);
  void (*v22)(uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  void (*v27)(uint64_t);
  void (*v28)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v30 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35428);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v7 = (int *)type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  v13 = v10 - v9 + *(int *)(v12 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  v39 = v13;
  OUTLINED_FUNCTION_21_5();
  v35 = v11 + v7[6];
  sub_23E1BDDB4();
  v14 = v11 + v7[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35418);
  v38 = v14;
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_29_1();
  v36 = v15;
  OUTLINED_FUNCTION_21_5();
  v16 = v11 + v7[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35420);
  v37 = v16;
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_29_1();
  v34 = v17;
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_29_1();
  v33 = v18;
  OUTLINED_FUNCTION_21_5();
  v19 = v11 + v7[14];
  v20 = type metadata accessor for DirectInvocationConfig();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  v31 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E19C1EC();
  sub_23E1BE6F0();
  if (v32)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_32_0(v39);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    OUTLINED_FUNCTION_5_3();
    v21(v35);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    OUTLINED_FUNCTION_5_3();
    v22(v38);
    OUTLINED_FUNCTION_32_0(v36);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    OUTLINED_FUNCTION_5_3();
    v23(v37);
    OUTLINED_FUNCTION_32_0(v34);
    OUTLINED_FUNCTION_32_0(v33);
    sub_23E19B324(v19);
  }
  else
  {
    OUTLINED_FUNCTION_40_0(8);
    OUTLINED_FUNCTION_39_0();
    sub_23E1BDDB4();
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_34_1();
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v25 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8);
    v25(v39, v24);
    OUTLINED_FUNCTION_21_5();
    OUTLINED_FUNCTION_40_0(5);
    sub_23E1BE648();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    OUTLINED_FUNCTION_5_3();
    v26(v35);
    sub_23E1BDDB4();
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_34_1();
    v25(v36, v24);
    OUTLINED_FUNCTION_12_7();
    OUTLINED_FUNCTION_28_4();
    OUTLINED_FUNCTION_34_1();
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_12_7();
    OUTLINED_FUNCTION_28_4();
    OUTLINED_FUNCTION_34_1();
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_12_7();
    sub_23E19C798(&qword_256D35438, (uint64_t)&protocol conformance descriptor for DirectInvocationConfig);
    sub_23E1BE654();
    __swift_storeEnumTagSinglePayload(v30, 0, 1, 0);
    sub_23E19B5C4(v30, v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D35440);
    sub_23E19C85C(&qword_256D35448, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1400], MEMORY[0x24BEE04E0]);
    OUTLINED_FUNCTION_33_2();
    sub_23E1BE654();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    OUTLINED_FUNCTION_5_3();
    v27(v37);
    sub_23E1BDDB4();
    sub_23E19C228();
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_43_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    OUTLINED_FUNCTION_5_3();
    v28(v38);
    sub_23E1BDDB4();
    sub_23E19C264();
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_21_5();
    OUTLINED_FUNCTION_33_2();
    sub_23E1BE654();
    sub_23E1BDDB4();
    OUTLINED_FUNCTION_26_3();
    sub_23E19C2A0(v11, a2);
    __swift_destroy_boxed_opaque_existential_1(v31);
    sub_23E19D480(v11, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E19C1EC()
{
  unint64_t result;

  result = qword_256D35430;
  if (!qword_256D35430)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFB70, &type metadata for IconConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35430);
  }
  return result;
}

unint64_t sub_23E19C228()
{
  unint64_t result;

  result = qword_256D35450;
  if (!qword_256D35450)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetHomeDeviceType, &type metadata for SnippetHomeDeviceType);
    atomic_store(result, (unint64_t *)&qword_256D35450);
  }
  return result;
}

unint64_t sub_23E19C264()
{
  unint64_t result;

  result = qword_256D35458;
  if (!qword_256D35458)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetRenderingMode, &type metadata for SnippetRenderingMode);
    atomic_store(result, (unint64_t *)&qword_256D35458);
  }
  return result;
}

uint64_t sub_23E19C2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IconConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void IconConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35460);
  v9 = *(_QWORD *)(v2 - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v6 = v5 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E19C1EC();
  sub_23E1BE6FC();
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_25_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  sub_23E18BF90();
  OUTLINED_FUNCTION_36_0();
  sub_23E1BE690();
  if (v8)
    OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_19_6(1);
  OUTLINED_FUNCTION_9_5();
  v7 = v8;
  if (v8)
  {
    OUTLINED_FUNCTION_10_4();
    v7 = 0;
  }
  OUTLINED_FUNCTION_35_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_25_2();
  sub_23E1BE684();
  if (v7)
    OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_31_2();
  OUTLINED_FUNCTION_19_6(6);
  OUTLINED_FUNCTION_9_5();
  if (v7)
    OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_35_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE678();
  swift_bridgeObjectRelease();
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_19_6(9);
  sub_23E1BE690();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
  sub_23E19C724();
  OUTLINED_FUNCTION_9_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  OUTLINED_FUNCTION_25_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35420);
  sub_23E19C7D8();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_9_5();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  OUTLINED_FUNCTION_25_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35418);
  sub_23E19C8C0();
  OUTLINED_FUNCTION_9_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  OUTLINED_FUNCTION_25_2();
  sub_23E19C960();
  OUTLINED_FUNCTION_17_4();
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_17_4();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v2);
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E19C724()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256D35468;
  if (!qword_256D35468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34E88);
    v2 = sub_23E19C798(&qword_256D35470, (uint64_t)&protocol conformance descriptor for DirectInvocationConfig);
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D35468);
  }
  return result;
}

uint64_t sub_23E19C798(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for DirectInvocationConfig();
    result = MEMORY[0x24264D408](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23E19C7D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256D35478;
  if (!qword_256D35478)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35420);
    v2 = sub_23E19C85C(&qword_256D35480, MEMORY[0x24BEE0D08], MEMORY[0x24BEE13D8], MEMORY[0x24BEE04C0]);
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D35478);
  }
  return result;
}

uint64_t sub_23E19C85C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35440);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x24264D408](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23E19C8C0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256D35488;
  if (!qword_256D35488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35418);
    v2 = sub_23E19C924();
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D35488);
  }
  return result;
}

unint64_t sub_23E19C924()
{
  unint64_t result;

  result = qword_256D35490;
  if (!qword_256D35490)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetHomeDeviceType, &type metadata for SnippetHomeDeviceType);
    atomic_store(result, (unint64_t *)&qword_256D35490);
  }
  return result;
}

unint64_t sub_23E19C960()
{
  unint64_t result;

  result = qword_256D35498;
  if (!qword_256D35498)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetRenderingMode, &type metadata for SnippetRenderingMode);
    atomic_store(result, (unint64_t *)&qword_256D35498);
  }
  return result;
}

void sub_23E19C99C(_QWORD *a1)
{
  IconConfiguration.encode(to:)(a1);
}

void sub_23E19C9B0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  IconConfiguration.init(from:)(a1, a2);
}

uint64_t sub_23E19C9C4()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_23E19C9D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = IconConfiguration.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23E19C9F8()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  *v0 = IconConfiguration.iconName.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E19CA1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  IconConfiguration.iconColor.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19CA3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23E19B4E0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.iconColor.setter);
}

void sub_23E19CA58()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_20();
  *v0 = IconConfiguration.shouldRenderCircle.getter() & 1;
  OUTLINED_FUNCTION_9();
}

void sub_23E19CA7C()
{
  IconConfiguration.shouldRenderCircle.setter();
  OUTLINED_FUNCTION_9();
}

void sub_23E19CAB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  IconConfiguration.circleColor.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19CAD4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23E19B4E0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.circleColor.setter);
}

void sub_23E19CAF0()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_20();
  *v0 = IconConfiguration.rgbIconColor.getter();
  OUTLINED_FUNCTION_9();
}

void sub_23E19CB14()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  IconConfiguration.onStateIconName.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19CB34(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23E19B4E0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.onStateIconName.setter);
}

void sub_23E19CB50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20();
  IconConfiguration.offStateIconName.getter();
  *v0 = v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19CB70(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23E19B4E0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.offStateIconName.setter);
}

char *initializeBufferWithCopyOfBuffer for IconConfiguration(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v35 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v35 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = &a1[v13];
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = a3[7];
    v18 = &a1[v17];
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21(&a1[a3[8]], (char *)a2 + a3[8], v20);
    v22 = a3[9];
    v23 = &a1[v22];
    v24 = (char *)a2 + v22;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    v12(&a1[a3[10]], (char *)a2 + a3[10], v11);
    v26 = a3[11];
    v27 = &a1[v26];
    v28 = (char *)a2 + v26;
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
    v12(&a1[a3[12]], (char *)a2 + a3[12], v11);
    v12(&a1[a3[13]], (char *)a2 + a3[13], v11);
    v30 = a3[14];
    v31 = &a1[v30];
    v32 = (char *)a2 + v30;
    v33 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
    {
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v31, v32, v36);
      __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
    }
  }
  return a1;
}

uint64_t destroy for IconConfiguration(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = a1 + a2[6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + a2[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(a1 + a2[8], v11);
  v13 = a1 + a2[9];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v7(a1 + a2[10], v6);
  v15 = a1 + a2[11];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v7(a1 + a2[12], v6);
  v7(a1 + a2[13], v6);
  v17 = a1 + a2[14];
  v18 = type metadata accessor for DirectInvocationConfig();
  result = __swift_getEnumTagSinglePayload(v17, 1, v18);
  if (!(_DWORD)result)
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v17, v20);
  }
  return result;
}

uint64_t initializeWithCopy for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  v20(v17, v18, v19);
  v20(a1 + a3[8], a2 + a3[8], v19);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v11(a1 + a3[10], a2 + a3[10], v10);
  v25 = a3[11];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v29 = a3[14];
  v30 = (void *)(a1 + v29);
  v31 = (const void *)(a2 + v29);
  v32 = type metadata accessor for DirectInvocationConfig();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v30, v31, v34);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  }
  return a1;
}

uint64_t assignWithCopy for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  int EnumTagSinglePayload;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v20(a1 + a3[8], a2 + a3[8], v19);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v11(a1 + a3[10], a2 + a3[10], v10);
  v25 = a3[11];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v26, v27, v28);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v29 = a3[14];
  v30 = (void *)(a1 + v29);
  v31 = (const void *)(a2 + v29);
  v32 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v26) = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v32);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32);
  if (!(_DWORD)v26)
  {
    if (!EnumTagSinglePayload)
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v37 - 8) + 24))(v30, v31, v37);
      return a1;
    }
    sub_23E19D480((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    return a1;
  }
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v30, v31, v34);
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  return a1;
}

uint64_t sub_23E19D480(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithTake for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
  v20(v17, v18, v19);
  v20(a1 + a3[8], a2 + a3[8], v19);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  v11(a1 + a3[10], a2 + a3[10], v10);
  v25 = a3[11];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v29 = a3[14];
  v30 = (void *)(a1 + v29);
  v31 = (const void *)(a2 + v29);
  v32 = type metadata accessor for DirectInvocationConfig();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v30, v31, v34);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  }
  return a1;
}

uint64_t assignWithTake for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  int EnumTagSinglePayload;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40);
  v20(v17, v18, v19);
  v20(a1 + a3[8], a2 + a3[8], v19);
  v21 = a3[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v11(a1 + a3[10], a2 + a3[10], v10);
  v25 = a3[11];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  v11(a1 + a3[12], a2 + a3[12], v10);
  v11(a1 + a3[13], a2 + a3[13], v10);
  v29 = a3[14];
  v30 = (void *)(a1 + v29);
  v31 = (const void *)(a2 + v29);
  v32 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v26) = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v32);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32);
  if (!(_DWORD)v26)
  {
    if (!EnumTagSinglePayload)
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v37 - 8) + 40))(v30, v31, v37);
      return a1;
    }
    sub_23E19D480((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    return a1;
  }
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v30, v31, v34);
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconConfiguration()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E19D994(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_17();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_17();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      OUTLINED_FUNCTION_17();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        OUTLINED_FUNCTION_17();
        if (v14)
        {
          v7 = v15;
          v11 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
          OUTLINED_FUNCTION_17();
          if (v16)
          {
            v7 = v17;
            v11 = a3[9];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
            OUTLINED_FUNCTION_17();
            if (v18)
            {
              v7 = v19;
              v11 = a3[11];
            }
            else
            {
              v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
              v11 = a3[14];
            }
          }
        }
      }
    }
    v8 = a1 + v11;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for IconConfiguration()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E19DAA8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_18();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_18();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      OUTLINED_FUNCTION_18();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        OUTLINED_FUNCTION_18();
        if (v15)
        {
          v8 = v16;
          v12 = a4[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
          OUTLINED_FUNCTION_18();
          if (v17)
          {
            v8 = v18;
            v12 = a4[9];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
            OUTLINED_FUNCTION_18();
            if (v19)
            {
              v8 = v20;
              v12 = a4[11];
            }
            else
            {
              v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
              v12 = a4[14];
            }
          }
        }
      }
    }
    v9 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

void sub_23E19DBB8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  sub_23E18353C(319, (unint64_t *)&qword_256D34980);
  if (v0 <= 0x3F)
  {
    sub_23E18A798(319, &qword_256D34DB0, &qword_256D34CE8);
    if (v1 <= 0x3F)
    {
      sub_23E18353C(319, qword_256D34998);
      if (v2 <= 0x3F)
      {
        sub_23E18353C(319, &qword_256D35508);
        if (v3 <= 0x3F)
        {
          sub_23E18A798(319, &qword_256D35510, &qword_256D35418);
          if (v4 <= 0x3F)
          {
            sub_23E18A798(319, &qword_256D35518, &qword_256D35420);
            if (v5 <= 0x3F)
            {
              sub_23E19DD2C();
              if (v6 <= 0x3F)
                swift_initStructMetadata();
            }
          }
        }
      }
    }
  }
}

void sub_23E19DD2C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D35520)
  {
    type metadata accessor for DirectInvocationConfig();
    v0 = sub_23E1BE588();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D35520);
  }
}

uint64_t getEnumTagSinglePayload for IconConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF6)
  {
    if (a2 + 10 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 10) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v5 = v6 - 11;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IconConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_23E19DE54 + 4 * byte_23E1BF99B[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_23E19DE88 + 4 * byte_23E1BF996[v4]))();
}

uint64_t sub_23E19DE88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E19DE90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E19DE98);
  return result;
}

uint64_t sub_23E19DEA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E19DEACLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_23E19DEB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E19DEB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IconConfiguration.CodingKeys()
{
  return &type metadata for IconConfiguration.CodingKeys;
}

unint64_t sub_23E19DED8()
{
  unint64_t result;

  result = qword_256D35578;
  if (!qword_256D35578)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFB48, &type metadata for IconConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35578);
  }
  return result;
}

unint64_t sub_23E19DF18()
{
  unint64_t result;

  result = qword_256D35580;
  if (!qword_256D35580)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFA80, &type metadata for IconConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35580);
  }
  return result;
}

unint64_t sub_23E19DF58()
{
  unint64_t result;

  result = qword_256D35588;
  if (!qword_256D35588)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFAA8, &type metadata for IconConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35588);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_23E1BE690();
}

void OUTLINED_FUNCTION_10_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_12_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = v0;
  *(_QWORD *)(v2 - 96) = v1;
  return sub_23E1BDDB4();
}

uint64_t OUTLINED_FUNCTION_14_6()
{
  return sub_23E1BDDB4();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return sub_23E1BE690();
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return sub_23E1BDDD8();
}

uint64_t OUTLINED_FUNCTION_19_6@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  return sub_23E1BDDB4();
}

void OUTLINED_FUNCTION_23_5()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 216) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return sub_23E1BE63C();
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = 0;
  *(_QWORD *)(v0 - 96) = 0;
  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_23E1BE63C();
}

uint64_t OUTLINED_FUNCTION_40_0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return 0x6E6F6369202CLL;
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return sub_23E1BE654();
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_23E1BDDB4();
}

void DisambiguationOption.action.setter()
{
  OUTLINED_FUNCTION_39_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  sub_23E1BDD6C();
  OUTLINED_FUNCTION_9();
}

uint64_t type metadata accessor for DisambiguationOption(uint64_t a1)
{
  return sub_23E19EC20(a1, qword_256D35660);
}

uint64_t DisambiguationOption.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void DisambiguationOption.label.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*DisambiguationOption.label.modify())()
{
  return nullsub_1;
}

void DisambiguationOption.iconConfig.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DisambiguationOption(0);
  sub_23E18827C(v1 + *(int *)(v3 + 20), a1, &qword_256D34E20);
  OUTLINED_FUNCTION_9();
}

void DisambiguationOption.iconConfig.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DisambiguationOption(0);
  sub_23E19ED0C(a1, v1 + *(int *)(v3 + 20), &qword_256D34E20);
  OUTLINED_FUNCTION_9();
}

uint64_t (*DisambiguationOption.iconConfig.modify())()
{
  type metadata accessor for DisambiguationOption(0);
  return nullsub_1;
}

void DisambiguationOption.action.getter()
{
  OUTLINED_FUNCTION_39_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  sub_23E1BDD60();
  OUTLINED_FUNCTION_9();
}

void sub_23E19E298(id *a1)
{
  id v1;

  v1 = *a1;
  DisambiguationOption.action.setter();
}

void DisambiguationOption.action.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_39_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v1[4] = sub_23E1BDD54();
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E19E30C()
{
  return sub_23E19ED68();
}

uint64_t sub_23E19E328()
{
  return 3;
}

uint64_t sub_23E19E330(char a1)
{
  return *(_QWORD *)&aLabel_1[8 * a1];
}

void sub_23E19E350()
{
  sub_23E1B5B9C();
}

void sub_23E19E35C()
{
  sub_23E1B5D80();
}

uint64_t sub_23E19E364()
{
  return sub_23E1B5F80();
}

void sub_23E19E36C()
{
  sub_23E1B6104();
}

uint64_t sub_23E19E374@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19ED68();
  *a1 = result;
  return result;
}

void sub_23E19E3A8(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = sub_23E19E330(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19E3CC()
{
  char *v0;

  return sub_23E19E330(*v0);
}

uint64_t sub_23E19E3D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19E30C();
  *a1 = result;
  return result;
}

uint64_t sub_23E19E3F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19E328();
  *a1 = result;
  return result;
}

uint64_t sub_23E19E41C()
{
  sub_23E19E784();
  return sub_23E1BE708();
}

uint64_t sub_23E19E444()
{
  sub_23E19E784();
  return sub_23E1BE714();
}

void DisambiguationOption.init(from:)()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[2];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_12_8();
  v3 = v2;
  v28 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_24_2(v7, v25[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35590);
  v34 = *(_QWORD *)(v31 - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_19_1();
  v11 = OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_10_5();
  v14 = (uint64_t)v1 + *(int *)(v13 + 20);
  v15 = type metadata accessor for IconConfiguration();
  v35 = v14;
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23E19E784();
  sub_23E1BE6F0();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_23E18829C(v35, &qword_256D34E20);
  }
  else
  {
    v25[1] = v11;
    v26 = v15;
    v16 = (uint64_t)v30;
    v27 = v1;
    v17 = v32;
    v18 = v33;
    v19 = sub_23E1BE63C();
    v20 = v27;
    *v27 = v19;
    v20[1] = v21;
    sub_23E187EEC(&qword_256D348D8, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    sub_23E1BE654();
    v22 = (uint64_t)v3;
    __swift_storeEnumTagSinglePayload(v16, 0, 1, v26);
    sub_23E19ED0C(v16, v35, &qword_256D34E20);
    sub_23E18C068(&qword_256D34E40);
    v23 = v29;
    sub_23E1BE654();
    sub_23E1BDD60();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v23, v18);
    v24 = (uint64_t)v27;
    sub_23E18B5A4();
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_27_4();
    sub_23E186F18(v24, v28, type metadata accessor for DisambiguationOption);
    __swift_destroy_boxed_opaque_existential_1(v22);
    OUTLINED_FUNCTION_44_1();
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E19E784()
{
  unint64_t result;

  result = qword_256D35598;
  if (!qword_256D35598)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFF88, &type metadata for DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35598);
  }
  return result;
}

void DisambiguationOption.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_12_8();
  v3 = v2;
  v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18) - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_33();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A0);
  v7 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9_6();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23E19E784();
  sub_23E1BE6FC();
  sub_23E1BE678();
  if (v0)
    OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_15_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  sub_23E18BFEC();
  OUTLINED_FUNCTION_42_0();
  if (v0)
    OUTLINED_FUNCTION_46();
  sub_23E1BDD60();
  sub_23E18B5A4();
  OUTLINED_FUNCTION_38();
  sub_23E18C068(&qword_256D34E58);
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_25_3(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_23E19E97C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_19_1();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_52();
  v6 = v2;
  swift_bridgeObjectRetain();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_3();
  v3 = type metadata accessor for DisambiguationOption(0);
  sub_23E18827C(v1 + *(int *)(v3 + 20), v0, &qword_256D34E20);
  v4 = type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload(v0, 1, v4) == 1)
  {
    sub_23E18829C(v0, &qword_256D34E20);
  }
  else
  {
    IconConfiguration.description.getter();
    sub_23E187F20(v0, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  }
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  return v6;
}

void sub_23E19EAB8()
{
  DisambiguationOption.encode(to:)();
}

void sub_23E19EACC()
{
  DisambiguationOption.init(from:)();
}

uint64_t sub_23E19EAE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DisambiguationOption.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t DisambiguationSnippetModel.displayText.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  return sub_23E1BDDD8();
}

uint64_t DisambiguationSnippetModel.displayText.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  return v1;
}

uint64_t sub_23E19EB68()
{
  swift_bridgeObjectRetain();
  return DisambiguationSnippetModel.displayText.setter();
}

void DisambiguationSnippetModel.displayText.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = sub_23E1BDDC0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t DisambiguationSnippetModel.options.getter()
{
  type metadata accessor for DisambiguationSnippetModel(0);
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for DisambiguationSnippetModel(uint64_t a1)
{
  return sub_23E19EC20(a1, (uint64_t *)&unk_256D356F8);
}

uint64_t sub_23E19EC20(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void DisambiguationSnippetModel.options.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(int *)(OUTLINED_FUNCTION_55() + 20);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v2) = v0;
  OUTLINED_FUNCTION_2_0();
}

uint64_t (*DisambiguationSnippetModel.options.modify())()
{
  type metadata accessor for DisambiguationSnippetModel(0);
  return nullsub_1;
}

void DisambiguationSnippetModel.defaultOption.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DisambiguationSnippetModel(0);
  sub_23E18827C(v1 + *(int *)(v3 + 24), a1, &qword_256D355A8);
  OUTLINED_FUNCTION_9();
}

void DisambiguationSnippetModel.defaultOption.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_55();
  sub_23E19ED0C(v0, v1 + *(int *)(v2 + 24), &qword_256D355A8);
  OUTLINED_FUNCTION_9();
}

void sub_23E19ED0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_10_0(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v3, v4, v5);
  OUTLINED_FUNCTION_9();
}

uint64_t (*DisambiguationSnippetModel.defaultOption.modify())()
{
  type metadata accessor for DisambiguationSnippetModel(0);
  return nullsub_1;
}

uint64_t sub_23E19ED68()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  OUTLINED_FUNCTION_31();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_23E19EDA8()
{
  return sub_23E19ED68();
}

uint64_t sub_23E19EDC4(char a1)
{
  return *(_QWORD *)&aDisplaytoption[8 * a1];
}

void sub_23E19EDE4()
{
  sub_23E1B59BC();
}

void sub_23E19EDF0()
{
  sub_23E1B5D8C();
}

uint64_t sub_23E19EDF8()
{
  return sub_23E1B5E4C();
}

void sub_23E19EE00()
{
  sub_23E1B62A8();
}

uint64_t sub_23E19EE08@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19ED68();
  *a1 = result;
  return result;
}

void sub_23E19EE3C(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = sub_23E19EDC4(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E19EE60()
{
  char *v0;

  return sub_23E19EDC4(*v0);
}

uint64_t sub_23E19EE68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E19EDA8();
  *a1 = result;
  return result;
}

uint64_t sub_23E19EE8C()
{
  sub_23E19F178();
  return sub_23E1BE708();
}

uint64_t sub_23E19EEB4()
{
  sub_23E19F178();
  return sub_23E1BE714();
}

void DisambiguationSnippetModel.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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

  OUTLINED_FUNCTION_12_8();
  v3 = v2;
  v11 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_24_2(v6, v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355B0);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_10_5();
  v7 = type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_19_1();
  v10 = v0 + *(int *)(v9 + 24);
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_41_0(v10, 1);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_23E19F178();
  sub_23E1BE6F0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_23E18829C(v10, &qword_256D355A8);
  }
  else
  {
    v15 = sub_23E1BE63C();
    sub_23E1BDDB4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D355C0);
    sub_23E19F1B4();
    OUTLINED_FUNCTION_57();
    *(_QWORD *)(v0 + *(int *)(v7 + 20)) = v15;
    sub_23E187EEC(&qword_256D355D0, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_41_0(v13, 0);
    sub_23E19ED0C(v13, v10, &qword_256D355A8);
    sub_23E186F18(v0, v12, type metadata accessor for DisambiguationSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    OUTLINED_FUNCTION_44_1();
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E19F178()
{
  unint64_t result;

  result = qword_256D355B8;
  if (!qword_256D355B8)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFF38, &type metadata for DisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D355B8);
  }
  return result;
}

unint64_t sub_23E19F1B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256D355C8;
  if (!qword_256D355C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D355C0);
    sub_23E187EEC(&qword_256D355D0, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    v3 = v2;
    result = MEMORY[0x24264D408](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256D355C8);
  }
  return result;
}

uint64_t DisambiguationSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355D8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_33();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E19F178();
  sub_23E1BE6FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE678();
  if (v1)
  {
    OUTLINED_FUNCTION_25_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DisambiguationSnippetModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D355C0);
    sub_23E19F3E4();
    OUTLINED_FUNCTION_49();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    sub_23E19F460();
    OUTLINED_FUNCTION_49();
    return OUTLINED_FUNCTION_25_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  }
}

unint64_t sub_23E19F3E4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256D355E0;
  if (!qword_256D355E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D355C0);
    sub_23E187EEC(&qword_256D355E8, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    v3 = v2;
    result = MEMORY[0x24264D408](MEMORY[0x24BEE12A0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256D355E0);
  }
  return result;
}

unint64_t sub_23E19F460()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256D355F0;
  if (!qword_256D355F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D355A8);
    sub_23E187EEC(&qword_256D355E8, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    v3 = v2;
    result = MEMORY[0x24264D408](MEMORY[0x24BEE4AA8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256D355F0);
  }
  return result;
}

void sub_23E19F4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22[4];

  v3 = v0;
  v4 = type metadata accessor for DisambiguationOption(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_33_3();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v22[2] = 0x5379616C70736964;
  v22[3] = 0xEF203A676E697274;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_31();
  sub_23E1BE480();
  v7 = type metadata accessor for DisambiguationSnippetModel(0);
  v22[0] = *(_QWORD *)(v3 + *(int *)(v7 + 20));
  OUTLINED_FUNCTION_53();
  sub_23E1A003C(v22);
  OUTLINED_FUNCTION_31();
  v8 = v22[0];
  v9 = *(_QWORD *)(v22[0] + 16);
  if (v9)
  {
    v18 = v3;
    v19 = v2;
    v20 = v4;
    v22[0] = MEMORY[0x24BEE4AF8];
    sub_23E1A1134(0, v9, 0);
    v10 = v8 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v21 = *(_QWORD *)(v5 + 72);
    v11 = v22[0];
    do
    {
      sub_23E186F18(v10, v1, type metadata accessor for DisambiguationOption);
      v12 = sub_23E19E97C();
      v14 = v13;
      sub_23E187F20(v1, type metadata accessor for DisambiguationOption);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_31_3(0, *(_QWORD *)(v11 + 16) + 1);
        v11 = v22[0];
      }
      v16 = *(_QWORD *)(v11 + 16);
      v15 = *(_QWORD *)(v11 + 24);
      if (v16 >= v15 >> 1)
      {
        OUTLINED_FUNCTION_31_3((char *)(v15 > 1), v16 + 1);
        v11 = v22[0];
      }
      *(_QWORD *)(v11 + 16) = v16 + 1;
      v17 = v11 + 16 * v16;
      *(_QWORD *)(v17 + 32) = v12;
      *(_QWORD *)(v17 + 40) = v14;
      v10 += v21;
      --v9;
    }
    while (v9);
    swift_release();
    v2 = v19;
    v4 = v20;
    v3 = v18;
  }
  else
  {
    swift_release();
    v11 = MEMORY[0x24BEE4AF8];
  }
  MEMORY[0x24264CF40](v11, MEMORY[0x24BEE0D00]);
  sub_23E1BE480();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_31();
  sub_23E1BE480();
  sub_23E18827C(v3 + *(int *)(v7 + 24), v2, &qword_256D355A8);
  if (__swift_getEnumTagSinglePayload(v2, 1, v4) == 1)
  {
    sub_23E18829C(v2, &qword_256D355A8);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23E187F20(v2, type metadata accessor for DisambiguationOption);
  }
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0_3();
}

void DisambiguationSnippetModel.stringId.getter()
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
  size_t v9;
  int64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v4 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_9_6();
  v22 = type metadata accessor for DisambiguationOption(0);
  v6 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_33_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_5();
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v28 = 0xD000000000000010;
  v29 = 0x800000023E1C2BB0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_31();
  v26 = 0x736E6F6974706F23;
  v27 = 0xEA0000000000203ALL;
  v8 = type metadata accessor for DisambiguationSnippetModel(0);
  v23 = *(_QWORD *)(v4 + *(int *)(v8 + 20));
  OUTLINED_FUNCTION_53();
  sub_23E1A003C(&v23);
  v20 = v3;
  OUTLINED_FUNCTION_31();
  v9 = v23;
  v10 = *(_QWORD *)(v23 + 16);
  if (v10)
  {
    v25 = MEMORY[0x24BEE4AF8];
    sub_23E1A1134(0, v10, 0);
    v11 = v9 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v21 = *(_QWORD *)(v6 + 72);
    do
    {
      sub_23E186F18(v11, v2, type metadata accessor for DisambiguationOption);
      v23 = 0;
      v24 = 0xE000000000000000;
      sub_23E1BE5B8();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_52();
      v23 = v12;
      v24 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_17_2();
      OUTLINED_FUNCTION_7_3();
      sub_23E18827C(v2 + *(int *)(v22 + 20), v1, &qword_256D34E20);
      v13 = type metadata accessor for IconConfiguration();
      if (__swift_getEnumTagSinglePayload(v1, 1, v13) == 1)
      {
        sub_23E18829C(v1, &qword_256D34E20);
      }
      else
      {
        IconConfiguration.description.getter();
        sub_23E187F20(v1, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
      }
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_17_2();
      v14 = v23;
      v15 = v24;
      sub_23E187F20(v2, type metadata accessor for DisambiguationOption);
      v16 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_31_3(0, *(_QWORD *)(v16 + 16) + 1);
        v16 = v25;
      }
      v18 = *(_QWORD *)(v16 + 16);
      v17 = *(_QWORD *)(v16 + 24);
      if (v18 >= v17 >> 1)
      {
        OUTLINED_FUNCTION_31_3((char *)(v17 > 1), v18 + 1);
        v16 = v25;
      }
      *(_QWORD *)(v16 + 16) = v18 + 1;
      v19 = v16 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v14;
      *(_QWORD *)(v19 + 40) = v15;
      v11 += v21;
      --v10;
    }
    while (v10);
    swift_release();
  }
  else
  {
    swift_release();
    v16 = MEMORY[0x24BEE4AF8];
  }
  MEMORY[0x24264CF40](v16, MEMORY[0x24BEE0D00]);
  sub_23E1BE480();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_31();
  v26 = 0;
  v27 = 0xE000000000000000;
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v26 = 0xD000000000000010;
  v27 = 0x800000023E1C2BD0;
  sub_23E18827C(v4 + *(int *)(v8 + 24), v20, &qword_256D355A8);
  if (__swift_getEnumTagSinglePayload(v20, 1, v22) == 1)
  {
    sub_23E18829C(v20, &qword_256D355A8);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_23E187F20(v20, type metadata accessor for DisambiguationOption);
  }
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0_3();
}

void sub_23E19FC18()
{
  DisambiguationSnippetModel.init(from:)();
}

uint64_t sub_23E19FC2C(_QWORD *a1)
{
  return DisambiguationSnippetModel.encode(to:)(a1);
}

uint64_t sub_23E19FC40(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_23E1BE600();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for DisambiguationOption(0);
      v2 = sub_23E1BE4F8();
      *(_QWORD *)(v2 + 16) = a1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
    }
    type metadata accessor for DisambiguationOption(0);
    return v2;
  }
  return result;
}

char *sub_23E19FCFC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23E1BE60C();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_23E19FD80(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_23E1BE60C();
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for DisambiguationOption(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for DisambiguationOption(0);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_23E19FE7C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_23E1BE60C();
  __break(1u);
  return result;
}

uint64_t sub_23E19FF48(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for DisambiguationOption(0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_23E1BE60C();
  __break(1u);
  return result;
}

void sub_23E1A003C(size_t *a1)
{
  size_t v2;

  OUTLINED_FUNCTION_15_6();
  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23E1A4F9C(v2);
  sub_23E1A00B8();
  *a1 = v2;
}

void sub_23E1A00B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  BOOL v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  char v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD *v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t *v151;

  OUTLINED_FUNCTION_12_8();
  v1 = v0;
  v3 = v2;
  v144 = OUTLINED_FUNCTION_15_6();
  v4 = *(_QWORD *)(v144 - 8);
  MEMORY[0x24BDAC7A8](v144);
  v138 = (uint64_t)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_43_1();
  v149 = v7;
  OUTLINED_FUNCTION_12();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char **)((char *)&v130 - v10);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v130 - v13;
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_43_1();
  v141 = (_QWORD *)v15;
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_43_1();
  v140 = (_QWORD *)v17;
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_43_1();
  v136 = (_QWORD *)v19;
  OUTLINED_FUNCTION_12();
  MEMORY[0x24BDAC7A8](v20);
  v135 = (char **)((char *)&v130 - v21);
  v151 = v3;
  v22 = v3[1];
  v23 = sub_23E1BE69C();
  if (v23 >= v22)
  {
    if ((v22 & 0x8000000000000000) == 0)
    {
      if (v22)
        sub_23E1A0A20();
      goto LABEL_138;
    }
    goto LABEL_160;
  }
  v24 = v23;
  v132 = sub_23E19FC40(v22 / 2);
  v133 = v22;
  v142 = v25;
  v143 = v4;
  if (v22 <= 0)
  {
LABEL_124:
    v27 = (char *)MEMORY[0x24BEE4AF8];
    v72 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_125:
    if (v72 < 2)
    {
LABEL_136:
      swift_bridgeObjectRelease();
      if (v133 >= -1)
        goto LABEL_137;
      goto LABEL_164;
    }
    v123 = *v151;
    while (1)
    {
      v124 = v72 - 2;
      if (v72 < 2)
        break;
      if (!v123)
        goto LABEL_168;
      v125 = v27;
      v126 = *(_QWORD *)&v27[16 * v124 + 32];
      v127 = *(_QWORD *)&v27[16 * v72 + 24];
      sub_23E1A0C3C();
      if (v1)
        goto LABEL_122;
      if (v127 < v126)
        goto LABEL_155;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v125 = sub_23E1A1120((uint64_t)v27);
      if (v124 >= *((_QWORD *)v125 + 2))
        goto LABEL_156;
      v128 = &v125[16 * v124 + 32];
      *(_QWORD *)v128 = v126;
      *((_QWORD *)v128 + 1) = v127;
      v129 = *((_QWORD *)v125 + 2);
      if (v72 > v129)
        goto LABEL_157;
      memmove(&v125[16 * v72 + 16], &v125[16 * v72 + 32], 16 * (v129 - v72));
      *((_QWORD *)v125 + 2) = v129 - 1;
      v72 = v129 - 1;
      v27 = v125;
      if (v129 <= 2)
        goto LABEL_136;
    }
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
    return;
  }
  v131 = v24;
  v26 = 0;
  v27 = (char *)MEMORY[0x24BEE4AF8];
  v28 = v22;
  v148 = v11;
  v145 = v14;
  while (1)
  {
    v29 = v26;
    v30 = v26 + 1;
    v139 = v26;
    v31 = v28;
    if (v26 + 1 < v28)
    {
      v147 = v28;
      v134 = v1;
      v32 = *v151;
      v33 = *(_QWORD *)(v4 + 72);
      v34 = v135;
      OUTLINED_FUNCTION_37_2(*v151 + v33 * v30, (uint64_t)v135);
      v146 = v32;
      v150 = v33;
      v35 = v32 + v33 * v29;
      v36 = v136;
      OUTLINED_FUNCTION_37_2(v35, (uint64_t)v136);
      if (*v34 == *v36 && v34[1] == v36[1])
        v38 = 0;
      else
        v38 = OUTLINED_FUNCTION_19_7();
      v40 = v147;
      OUTLINED_FUNCTION_32_1((uint64_t)v136);
      OUTLINED_FUNCTION_32_1((uint64_t)v135);
      if (v29 + 2 >= v40)
      {
        v43 = v29 + 2;
        if ((v38 & 1) != 0)
          goto LABEL_27;
      }
      else
      {
        v41 = v150 * v30;
        v42 = v146;
        v43 = v29 + 2;
        v44 = v150 * (v29 + 2);
        while (1)
        {
          v45 = v140;
          OUTLINED_FUNCTION_37_2(v42 + v44, (uint64_t)v140);
          v46 = v141;
          OUTLINED_FUNCTION_37_2(v42 + v41, (uint64_t)v141);
          v47 = *v45 == *v46 && v45[1] == v46[1];
          v48 = v47 ? 0 : OUTLINED_FUNCTION_19_7();
          OUTLINED_FUNCTION_32_1((uint64_t)v141);
          OUTLINED_FUNCTION_32_1((uint64_t)v140);
          if (((v38 ^ v48) & 1) != 0)
            break;
          v42 += v150;
          ++v43;
          v11 = v148;
          if (v43 >= v147)
          {
            v43 = v147;
            v4 = v143;
            goto LABEL_26;
          }
        }
        v4 = v143;
        v11 = v148;
LABEL_26:
        v29 = v139;
        if ((v38 & 1) != 0)
        {
LABEL_27:
          if (v43 < v29)
            goto LABEL_161;
          v39 = v43;
          if (v29 < v43)
          {
            v130 = v27;
            v49 = 0;
            v50 = v150 * (v43 - 1);
            v51 = v43 * v150;
            v52 = v29;
            v53 = v29 * v150;
            do
            {
              if (v52 != v39 + v49 - 1)
              {
                v54 = v146;
                if (!v146)
                  goto LABEL_167;
                v55 = v146 + v53;
                sub_23E1A4FB0(v146 + v53, v138);
                if (v53 < v50 || v55 >= v54 + v51)
                {
                  OUTLINED_FUNCTION_45_0();
                  swift_arrayInitWithTakeFrontToBack();
                }
                else if (v53 != v50)
                {
                  OUTLINED_FUNCTION_45_0();
                  swift_arrayInitWithTakeBackToFront();
                }
                sub_23E1A4FB0(v138, v54 + v50);
                v11 = v148;
                v39 = v43;
              }
              ++v52;
              --v49;
              v50 -= v150;
              v51 -= v150;
              v53 += v150;
            }
            while (v52 < v39 + v49);
            v1 = v134;
            v4 = v143;
            v27 = v130;
            v29 = v139;
            goto LABEL_44;
          }
LABEL_43:
          v1 = v134;
LABEL_44:
          v31 = v147;
          goto LABEL_45;
        }
      }
      v39 = v43;
      goto LABEL_43;
    }
    v39 = v26 + 1;
LABEL_45:
    if (v39 < v31)
    {
      if (__OFSUB__(v39, v29))
        goto LABEL_159;
      if (v39 - v29 < v131)
      {
        if (__OFADD__(v29, v131))
          goto LABEL_162;
        if (v29 + v131 >= v31)
          v57 = v31;
        else
          v57 = v29 + v131;
        if (v57 < v29)
          goto LABEL_163;
        if (v39 != v57)
        {
          v130 = v27;
          v134 = v1;
          v58 = *(_QWORD *)(v4 + 72);
          v150 = v58 * (v39 - 1);
          v146 = v58;
          v59 = v39 * v58;
          v137 = v57;
          do
          {
            v60 = 0;
            v61 = v29;
            v147 = v39;
            while (1)
            {
              v62 = *v151;
              v63 = v145;
              OUTLINED_FUNCTION_36_1(v59 + v60 + *v151, (uint64_t)v145);
              OUTLINED_FUNCTION_36_1(v150 + v60 + v62, (uint64_t)v11);
              if (*v63 == *v11 && v63[1] == v11[1])
                break;
              v65 = OUTLINED_FUNCTION_19_7();
              OUTLINED_FUNCTION_6_3((uint64_t)v11);
              OUTLINED_FUNCTION_6_3((uint64_t)v63);
              if ((v65 & 1) == 0)
                goto LABEL_65;
              v66 = *v151;
              if (!*v151)
                goto LABEL_165;
              v67 = v66 + v150 + v60;
              sub_23E1A4FB0(v66 + v59 + v60, v149);
              swift_arrayInitWithTakeFrontToBack();
              sub_23E1A4FB0(v149, v67);
              v68 = v147;
              v60 -= v146;
              ++v61;
              v11 = v148;
              if (v147 == v61)
                goto LABEL_66;
            }
            OUTLINED_FUNCTION_6_3((uint64_t)v11);
            OUTLINED_FUNCTION_6_3((uint64_t)v63);
LABEL_65:
            v68 = v147;
LABEL_66:
            v39 = v68 + 1;
            v150 += v146;
            v59 += v146;
            v29 = v139;
          }
          while (v39 != v137);
          v39 = v137;
          v1 = v134;
          v27 = v130;
        }
      }
    }
    if (v39 < v29)
      goto LABEL_158;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v147 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v27 = OUTLINED_FUNCTION_40_1(0, *((_QWORD *)v27 + 2) + 1);
    v71 = *((_QWORD *)v27 + 2);
    v70 = *((_QWORD *)v27 + 3);
    v72 = v71 + 1;
    if (v71 >= v70 >> 1)
      v27 = OUTLINED_FUNCTION_40_1((char *)(v70 > 1), v71 + 1);
    v73 = v1;
    *((_QWORD *)v27 + 2) = v72;
    v74 = v27 + 32;
    v75 = &v27[16 * v71 + 32];
    v76 = v147;
    *(_QWORD *)v75 = v139;
    *((_QWORD *)v75 + 1) = v76;
    if (v71)
      break;
    v72 = 1;
LABEL_116:
    v28 = v151[1];
    v26 = v147;
    v1 = v73;
    v4 = v143;
    if (v147 >= v28)
      goto LABEL_125;
  }
  while (1)
  {
    v77 = v72 - 1;
    if (v72 >= 4)
    {
      v82 = &v74[16 * v72];
      v83 = *((_QWORD *)v82 - 8);
      v84 = *((_QWORD *)v82 - 7);
      v88 = __OFSUB__(v84, v83);
      v85 = v84 - v83;
      if (v88)
        goto LABEL_143;
      v87 = *((_QWORD *)v82 - 6);
      v86 = *((_QWORD *)v82 - 5);
      v88 = __OFSUB__(v86, v87);
      v80 = v86 - v87;
      v81 = v88;
      if (v88)
        goto LABEL_144;
      v89 = v72 - 2;
      v90 = &v74[16 * v72 - 32];
      v92 = *(_QWORD *)v90;
      v91 = *((_QWORD *)v90 + 1);
      v88 = __OFSUB__(v91, v92);
      v93 = v91 - v92;
      if (v88)
        goto LABEL_145;
      v88 = __OFADD__(v80, v93);
      v94 = v80 + v93;
      if (v88)
        goto LABEL_147;
      if (v94 >= v85)
      {
        v112 = &v74[16 * v77];
        v114 = *(_QWORD *)v112;
        v113 = *((_QWORD *)v112 + 1);
        v88 = __OFSUB__(v113, v114);
        v115 = v113 - v114;
        if (v88)
          goto LABEL_153;
        v105 = v80 < v115;
        goto LABEL_105;
      }
    }
    else
    {
      if (v72 != 3)
      {
        v106 = *((_QWORD *)v27 + 4);
        v107 = *((_QWORD *)v27 + 5);
        v88 = __OFSUB__(v107, v106);
        v99 = v107 - v106;
        v100 = v88;
        goto LABEL_99;
      }
      v79 = *((_QWORD *)v27 + 4);
      v78 = *((_QWORD *)v27 + 5);
      v88 = __OFSUB__(v78, v79);
      v80 = v78 - v79;
      v81 = v88;
    }
    if ((v81 & 1) != 0)
      goto LABEL_146;
    v89 = v72 - 2;
    v95 = &v74[16 * v72 - 32];
    v97 = *(_QWORD *)v95;
    v96 = *((_QWORD *)v95 + 1);
    v98 = __OFSUB__(v96, v97);
    v99 = v96 - v97;
    v100 = v98;
    if (v98)
      goto LABEL_148;
    v101 = &v74[16 * v77];
    v103 = *(_QWORD *)v101;
    v102 = *((_QWORD *)v101 + 1);
    v88 = __OFSUB__(v102, v103);
    v104 = v102 - v103;
    if (v88)
      goto LABEL_150;
    if (__OFADD__(v99, v104))
      goto LABEL_152;
    if (v99 + v104 >= v80)
    {
      v105 = v80 < v104;
LABEL_105:
      if (v105)
        v77 = v89;
      goto LABEL_107;
    }
LABEL_99:
    if ((v100 & 1) != 0)
      goto LABEL_149;
    v108 = &v74[16 * v77];
    v110 = *(_QWORD *)v108;
    v109 = *((_QWORD *)v108 + 1);
    v88 = __OFSUB__(v109, v110);
    v111 = v109 - v110;
    if (v88)
      goto LABEL_151;
    if (v111 < v99)
      goto LABEL_116;
LABEL_107:
    v116 = v77 - 1;
    if (v77 - 1 >= v72)
    {
      __break(1u);
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
      goto LABEL_154;
    }
    if (!*v151)
      goto LABEL_166;
    v117 = v27;
    v118 = &v74[16 * v116];
    v119 = *(_QWORD *)v118;
    v120 = &v74[16 * v77];
    v121 = *((_QWORD *)v120 + 1);
    sub_23E1A0C3C();
    if (v73)
      break;
    if (v121 < v119)
      goto LABEL_140;
    if (v77 > *((_QWORD *)v117 + 2))
      goto LABEL_141;
    *(_QWORD *)v118 = v119;
    *(_QWORD *)&v74[16 * v116 + 8] = v121;
    v122 = *((_QWORD *)v117 + 2);
    if (v77 >= v122)
      goto LABEL_142;
    v27 = v117;
    v72 = v122 - 1;
    memmove(&v74[16 * v77], v120 + 16, 16 * (v122 - 1 - v77));
    *((_QWORD *)v117 + 2) = v122 - 1;
    v11 = v148;
    if (v122 <= 2)
      goto LABEL_116;
  }
  v1 = v73;
LABEL_122:
  swift_bridgeObjectRelease();
  if (v133 < -1)
  {
    __break(1u);
    goto LABEL_124;
  }
LABEL_137:
  *(_QWORD *)(v132 + 16) = 0;
  swift_bridgeObjectRelease();
LABEL_138:
  OUTLINED_FUNCTION_9_0();
}

void sub_23E1A0A20()
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
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(uint64_t);
  _QWORD *v24;
  uint64_t v25;
  _BYTE v26[16];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_12_8();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v28 = v6;
  v29 = OUTLINED_FUNCTION_15_6();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v33 = &v26[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_12();
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = &v26[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v13 = &v26[-v12];
  v32 = v3;
  v27 = v5;
  if (v3 != v5)
  {
    v14 = *(_QWORD *)(v11 + 72);
    v35 = v14 * (v32 - 1);
    v30 = &v26[-v12];
    v31 = v14;
    v34 = v14 * v32;
    v15 = type metadata accessor for DisambiguationOption;
    while (2)
    {
      v16 = 0;
      v17 = v28;
      while (1)
      {
        v18 = *v1;
        sub_23E186F18(v34 + v16 + *v1, (uint64_t)v13, v15);
        sub_23E186F18(v35 + v16 + v18, (uint64_t)v10, v15);
        if (*v13 == *v10 && v13[1] == v10[1])
          break;
        v20 = OUTLINED_FUNCTION_19_7();
        OUTLINED_FUNCTION_30_3((uint64_t)v10);
        OUTLINED_FUNCTION_30_3((uint64_t)v13);
        if ((v20 & 1) != 0)
        {
          v21 = *v1;
          if (!*v1)
          {
            __break(1u);
            return;
          }
          v22 = v10;
          v23 = v15;
          v24 = v1;
          v25 = v21 + v35 + v16;
          sub_23E1A4FB0(v21 + v34 + v16, (uint64_t)v33);
          swift_arrayInitWithTakeFrontToBack();
          sub_23E1A4FB0((uint64_t)v33, v25);
          v16 -= v31;
          ++v17;
          v1 = v24;
          v15 = v23;
          v10 = v22;
          v13 = v30;
          if (v32 != v17)
            continue;
        }
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_30_3((uint64_t)v10);
      OUTLINED_FUNCTION_30_3((uint64_t)v13);
LABEL_13:
      v35 += v31;
      v34 += v31;
      if (++v32 != v27)
        continue;
      break;
    }
  }
  OUTLINED_FUNCTION_9_0();
}

void sub_23E1A0C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  int64_t v21;
  int64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v36;
  BOOL v38;
  unint64_t v39;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  char v48;
  int64_t v52;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;

  OUTLINED_FUNCTION_12_8();
  v61 = v1;
  v62 = v2;
  v54 = v0;
  v55 = v3;
  v57 = v4;
  v6 = v5;
  v8 = v7;
  v56 = OUTLINED_FUNCTION_15_6();
  v9 = MEMORY[0x24BDAC7A8](v56);
  v11 = (uint64_t *)((char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v60 = (uint64_t *)((char *)&v54 - v12);
  OUTLINED_FUNCTION_12();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v54 - v15);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (uint64_t *)((char *)&v54 - v18);
  v20 = *(_QWORD *)(v17 + 72);
  if (!v20)
  {
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v21 = v6 - v8;
  if (v6 - v8 == 0x8000000000000000 && v20 == -1)
    goto LABEL_88;
  v23 = v57 - v6;
  if (v57 - v6 == 0x8000000000000000 && v20 == -1)
    goto LABEL_89;
  v25 = v21 / v20;
  v26 = v23 / v20;
  v59 = *(_QWORD *)(v17 + 72);
  if (v21 / v20 >= v23 / v20)
  {
    v39 = v55;
    sub_23E19FD80(v6, v23 / v20, v55);
    v29 = v39 + v26 * v20;
    if (v26 * v20 < 1 || v8 >= v6)
    {
      v27 = v55;
    }
    else
    {
      v58 = -v20;
      v41 = v57;
      do
      {
        v42 = v41;
        v57 = v29;
        v43 = v58;
        v44 = v29 + v58;
        v45 = v60;
        sub_23E186F18(v29 + v58, (uint64_t)v60, type metadata accessor for DisambiguationOption);
        v46 = v6 + v43;
        sub_23E186F18(v6 + v43, (uint64_t)v11, type metadata accessor for DisambiguationOption);
        if (*v45 == *v11 && v45[1] == v11[1])
          v48 = 0;
        else
          v48 = OUTLINED_FUNCTION_19_7();
        v41 = v42 + v58;
        OUTLINED_FUNCTION_6_3((uint64_t)v11);
        OUTLINED_FUNCTION_6_3((uint64_t)v60);
        if ((v48 & 1) != 0)
        {
          if (v42 < v6 || v41 >= v6)
          {
            OUTLINED_FUNCTION_17_5();
            v6 = v46;
            v29 = v57;
          }
          else
          {
            if (v42 != v6)
              OUTLINED_FUNCTION_16_2();
            v6 = v46;
            v29 = v57;
          }
        }
        else if (v42 < v57 || v41 >= v57)
        {
          OUTLINED_FUNCTION_17_5();
          v29 = v44;
        }
        else
        {
          if (v42 != v57)
            OUTLINED_FUNCTION_16_2();
          v29 = v44;
        }
      }
      while (v29 > v55 && v6 > v8);
      v27 = v55;
    }
  }
  else
  {
    v27 = v55;
    sub_23E19FD80(v8, v21 / v20, v55);
    v28 = v25 * v20;
    v29 = v27 + v25 * v20;
    if (v28 >= 1 && v6 < v57)
    {
      while (1)
      {
        OUTLINED_FUNCTION_36_1(v6, (uint64_t)v19);
        OUTLINED_FUNCTION_36_1(v27, (uint64_t)v16);
        if (*v19 == *v16 && v19[1] == v16[1])
          break;
        v32 = OUTLINED_FUNCTION_19_7();
        OUTLINED_FUNCTION_6_3((uint64_t)v16);
        OUTLINED_FUNCTION_6_3((uint64_t)v19);
        if ((v32 & 1) == 0)
          goto LABEL_27;
        v33 = v59;
        v34 = v6 + v59;
        if (v8 < v6 || v8 >= v34)
        {
          OUTLINED_FUNCTION_17_5();
LABEL_39:
          v33 = v59;
          goto LABEL_40;
        }
        if (v8 != v6)
        {
          OUTLINED_FUNCTION_16_2();
          goto LABEL_39;
        }
LABEL_40:
        v8 += v33;
        v38 = v27 >= v29 || v34 >= v57;
        v6 = v34;
        if (v38)
          goto LABEL_45;
      }
      OUTLINED_FUNCTION_6_3((uint64_t)v16);
      OUTLINED_FUNCTION_6_3((uint64_t)v19);
LABEL_27:
      v33 = v59;
      v36 = v27 + v59;
      if (v8 < v27 || v8 >= v36)
      {
        OUTLINED_FUNCTION_17_5();
      }
      else
      {
        if (v8 == v27)
        {
LABEL_36:
          v34 = v6;
          v27 = v36;
          goto LABEL_40;
        }
        OUTLINED_FUNCTION_16_2();
      }
      v33 = v59;
      goto LABEL_36;
    }
LABEL_45:
    v6 = v8;
  }
  v52 = v29 - v27;
  if (v59 != -1 || v52 != 0x8000000000000000)
  {
    sub_23E19FD80(v27, v52 / v59, v6);
    return;
  }
LABEL_90:
  __break(1u);
}

char *sub_23E1A102C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D35770);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23E1A1120(uint64_t a1)
{
  return sub_23E1A102C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_23E1A1134(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23E1A4D7C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_23E1A1150()
{
  sub_23E187EEC(&qword_256D355F8, (void (*)(uint64_t))type metadata accessor for DisambiguationSnippetModel);
}

void sub_23E1A117C()
{
  sub_23E187EEC(&qword_256D35600, (void (*)(uint64_t))type metadata accessor for DisambiguationSnippetModel);
}

void sub_23E1A11A8(_QWORD *a1@<X8>)
{
  uint64_t v2;

  DisambiguationOption.action.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E1A11D0(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = DisambiguationSnippetModel.displayText.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_9();
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationOption(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = (int *)type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, (uint64_t)v11))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v9, v10, v14);
      v15 = v11[5];
      v16 = &v9[v15];
      v17 = &v10[v15];
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v47 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
      v48 = v18;
      v47(v16, v17, v18);
      v19 = v11[6];
      v20 = &v9[v19];
      v21 = &v10[v19];
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
      v23 = v11[7];
      v24 = &v9[v23];
      v25 = &v10[v23];
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
      v27(v24, v25, v26);
      v27(&v9[v11[8]], &v10[v11[8]], v26);
      v28 = v11[9];
      v29 = &v9[v28];
      v30 = &v10[v28];
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
      v47(&v9[v11[10]], &v10[v11[10]], v48);
      v32 = v11[11];
      v33 = &v9[v32];
      v34 = &v10[v32];
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
      v47(&v9[v11[12]], &v10[v11[12]], v48);
      v47(&v9[v11[13]], &v10[v11[13]], v48);
      v36 = v11[14];
      v37 = &v9[v36];
      v38 = &v10[v36];
      v39 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v39))
      {
        v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v37, v38, v41);
        __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v39);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, (uint64_t)v11);
    }
    v42 = *(int *)(a3 + 24);
    v43 = (char *)v4 + v42;
    v44 = (char *)a2 + v42;
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v43, v44, v45);
  }
  return v4;
}

uint64_t destroy for DisambiguationOption(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = (int *)type metadata accessor for IconConfiguration();
  if (!__swift_getEnumTagSinglePayload(v4, 1, (uint64_t)v5))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    v7 = v4 + v5[5];
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v9(v7, v8);
    v10 = v4 + v5[6];
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
    v12 = v4 + v5[7];
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
    v14(v12, v13);
    v14(v4 + v5[8], v13);
    v15 = v4 + v5[9];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    v9(v4 + v5[10], v8);
    v17 = v4 + v5[11];
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
    v9(v4 + v5[12], v8);
    v9(v4 + v5[13], v8);
    v19 = v4 + v5[14];
    v20 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v19, 1, v20))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v19, v21);
    }
  }
  v22 = a1 + *(int *)(a2 + 24);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
}

_QWORD *initializeWithCopy for DisambiguationOption(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;

  v3 = a3;
  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = (int *)type metadata accessor for IconConfiguration();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, (uint64_t)v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v46 = v3;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    v13 = v10[5];
    v14 = &v8[v13];
    v15 = &v9[v13];
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    v45(v14, v15, v16);
    v17 = v10[6];
    v18 = &v8[v17];
    v19 = &v9[v17];
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = v10[7];
    v22 = &v8[v21];
    v23 = &v9[v21];
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    v25(v22, v23, v24);
    v25(&v8[v10[8]], &v9[v10[8]], v24);
    v26 = v10[9];
    v27 = &v8[v26];
    v28 = &v9[v26];
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
    v45(&v8[v10[10]], &v9[v10[10]], v16);
    v30 = v10[11];
    v31 = &v8[v30];
    v32 = &v9[v30];
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
    v45(&v8[v10[12]], &v9[v10[12]], v16);
    v45(&v8[v10[13]], &v9[v10[13]], v16);
    v34 = v10[14];
    v35 = &v8[v34];
    v36 = &v9[v34];
    v37 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v35, v36, v39);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, (uint64_t)v10);
    v3 = v46;
  }
  v40 = *(int *)(v3 + 24);
  v41 = (char *)a1 + v40;
  v42 = (char *)a2 + v40;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v41, v42, v43);
  return a1;
}

_QWORD *assignWithCopy for DisambiguationOption(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int EnumTagSinglePayload;
  int v11;
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
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  void *v40;
  const void *v41;
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
  void (*v55)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t, uint64_t);
  void (*v80)(uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (uint64_t)a1 + v6;
  v8 = (uint64_t)a2 + v6;
  v9 = (int *)type metadata accessor for IconConfiguration();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v7, 1, (uint64_t)v9);
  v11 = __swift_getEnumTagSinglePayload(v8, 1, (uint64_t)v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      v81 = a3;
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v7, v8, v12);
      v13 = v9[5];
      v14 = v7 + v13;
      v15 = v8 + v13;
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v79 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
      v79(v14, v15, v16);
      v17 = v9[6];
      v18 = v7 + v17;
      v19 = v8 + v17;
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      v21 = v9[7];
      v22 = v7 + v21;
      v23 = v8 + v21;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
      v25(v22, v23, v24);
      v25(v7 + v9[8], v8 + v9[8], v24);
      v26 = v9[9];
      v27 = v7 + v26;
      v28 = v8 + v26;
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
      v79(v7 + v9[10], v8 + v9[10], v16);
      v30 = v9[11];
      v31 = v7 + v30;
      v32 = v8 + v30;
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
      v79(v7 + v9[12], v8 + v9[12], v16);
      v79(v7 + v9[13], v8 + v9[13], v16);
      v34 = v9[14];
      v35 = (void *)(v7 + v34);
      v36 = (const void *)(v8 + v34);
      v37 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
      {
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      }
      else
      {
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v72 - 8) + 16))(v35, v36, v72);
        __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
      }
      a3 = v81;
      v70 = v7;
      v71 = (uint64_t)v9;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v11)
  {
    sub_23E187F20(v7, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
LABEL_7:
    v39 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
    v40 = (void *)v7;
    v41 = (const void *)v8;
    goto LABEL_8;
  }
  v82 = a3;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 24))(v7, v8, v42);
  v43 = v9[5];
  v44 = v7 + v43;
  v45 = v8 + v43;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 24);
  v80(v44, v45, v46);
  v47 = v9[6];
  v48 = v7 + v47;
  v49 = v8 + v47;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v48, v49, v50);
  v51 = v9[7];
  v52 = v7 + v51;
  v53 = v8 + v51;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 24);
  v55(v52, v53, v54);
  v55(v7 + v9[8], v8 + v9[8], v54);
  v56 = v9[9];
  v57 = v7 + v56;
  v58 = v8 + v56;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 24))(v57, v58, v59);
  v80(v7 + v9[10], v8 + v9[10], v46);
  v60 = v9[11];
  v61 = v7 + v60;
  v62 = v8 + v60;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 24))(v61, v62, v63);
  v80(v7 + v9[12], v8 + v9[12], v46);
  v80(v7 + v9[13], v8 + v9[13], v46);
  v64 = v9[14];
  v65 = v7 + v64;
  v66 = v8 + v64;
  v67 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v46) = __swift_getEnumTagSinglePayload(v65, 1, v67);
  v68 = __swift_getEnumTagSinglePayload(v66, 1, v67);
  if ((_DWORD)v46)
  {
    a3 = v82;
    if (!v68)
    {
      v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 16))(v65, v66, v69);
      v70 = v65;
      v71 = v67;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v70, 0, 1, v71);
      goto LABEL_15;
    }
  }
  else
  {
    a3 = v82;
    if (!v68)
    {
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 24))(v65, v66, v78);
      goto LABEL_15;
    }
    sub_23E187F20(v65, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
  }
  v39 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
  v40 = (void *)v65;
  v41 = (const void *)v66;
LABEL_8:
  memcpy(v40, v41, v39);
LABEL_15:
  v73 = *(int *)(a3 + 24);
  v74 = (char *)a1 + v73;
  v75 = (char *)a2 + v73;
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v76 - 8) + 24))(v74, v75, v76);
  return a1;
}

_OWORD *initializeWithTake for DisambiguationOption(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;

  v3 = a3;
  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v45 = v3;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v7, v8, v11);
    v12 = v9[5];
    v13 = &v7[v12];
    v14 = &v8[v12];
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v44 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32);
    v44(v13, v14, v15);
    v16 = v9[6];
    v17 = &v7[v16];
    v18 = &v8[v16];
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
    v20 = v9[7];
    v21 = &v7[v20];
    v22 = &v8[v20];
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32);
    v24(v21, v22, v23);
    v24(&v7[v9[8]], &v8[v9[8]], v23);
    v25 = v9[9];
    v26 = &v7[v25];
    v27 = &v8[v25];
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
    v44(&v7[v9[10]], &v8[v9[10]], v15);
    v29 = v9[11];
    v30 = &v7[v29];
    v31 = &v8[v29];
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v30, v31, v32);
    v44(&v7[v9[12]], &v8[v9[12]], v15);
    v44(&v7[v9[13]], &v8[v9[13]], v15);
    v33 = v9[14];
    v34 = &v7[v33];
    v35 = &v8[v33];
    v36 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v34, v35, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)v9);
    v3 = v45;
  }
  v39 = *(int *)(v3 + 24);
  v40 = (char *)a1 + v39;
  v41 = (char *)a2 + v39;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v40, v41, v42);
  return a1;
}

_QWORD *assignWithTake for DisambiguationOption(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int EnumTagSinglePayload;
  int v12;
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
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const void *v37;
  uint64_t v38;
  uint64_t v39;
  size_t v40;
  void *v41;
  const void *v42;
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
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  void (*v81)(uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t)a1 + v7;
  v9 = (uint64_t)a2 + v7;
  v10 = (int *)type metadata accessor for IconConfiguration();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v8, 1, (uint64_t)v10);
  v12 = __swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      v82 = a3;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v8, v9, v13);
      v14 = v10[5];
      v15 = v8 + v14;
      v16 = v9 + v14;
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32);
      v80(v15, v16, v17);
      v18 = v10[6];
      v19 = v8 + v18;
      v20 = v9 + v18;
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
      v22 = v10[7];
      v23 = v8 + v22;
      v24 = v9 + v22;
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32);
      v26(v23, v24, v25);
      v26(v8 + v10[8], v9 + v10[8], v25);
      v27 = v10[9];
      v28 = v8 + v27;
      v29 = v9 + v27;
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v28, v29, v30);
      v80(v8 + v10[10], v9 + v10[10], v17);
      v31 = v10[11];
      v32 = v8 + v31;
      v33 = v9 + v31;
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v32, v33, v34);
      v80(v8 + v10[12], v9 + v10[12], v17);
      v80(v8 + v10[13], v9 + v10[13], v17);
      v35 = v10[14];
      v36 = (void *)(v8 + v35);
      v37 = (const void *)(v9 + v35);
      v38 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38))
      {
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v73 - 8) + 32))(v36, v37, v73);
        __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
      }
      a3 = v82;
      v71 = v8;
      v72 = (uint64_t)v10;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v12)
  {
    sub_23E187F20(v8, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
LABEL_7:
    v40 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
    v41 = (void *)v8;
    v42 = (const void *)v9;
    goto LABEL_8;
  }
  v83 = a3;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 40))(v8, v9, v43);
  v44 = v10[5];
  v45 = v8 + v44;
  v46 = v9 + v44;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 40);
  v81(v45, v46, v47);
  v48 = v10[6];
  v49 = v8 + v48;
  v50 = v9 + v48;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 40))(v49, v50, v51);
  v52 = v10[7];
  v53 = v8 + v52;
  v54 = v9 + v52;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
  v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 40);
  v56(v53, v54, v55);
  v56(v8 + v10[8], v9 + v10[8], v55);
  v57 = v10[9];
  v58 = v8 + v57;
  v59 = v9 + v57;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 40))(v58, v59, v60);
  v81(v8 + v10[10], v9 + v10[10], v47);
  v61 = v10[11];
  v62 = v8 + v61;
  v63 = v9 + v61;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 40))(v62, v63, v64);
  v81(v8 + v10[12], v9 + v10[12], v47);
  v81(v8 + v10[13], v9 + v10[13], v47);
  v65 = v10[14];
  v66 = v8 + v65;
  v67 = v9 + v65;
  v68 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v47) = __swift_getEnumTagSinglePayload(v66, 1, v68);
  v69 = __swift_getEnumTagSinglePayload(v67, 1, v68);
  if ((_DWORD)v47)
  {
    a3 = v83;
    if (!v69)
    {
      v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(v66, v67, v70);
      v71 = v66;
      v72 = v68;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v71, 0, 1, v72);
      goto LABEL_15;
    }
  }
  else
  {
    a3 = v83;
    if (!v69)
    {
      v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 40))(v66, v67, v79);
      goto LABEL_15;
    }
    sub_23E187F20(v66, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
  }
  v40 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
  v41 = (void *)v66;
  v42 = (const void *)v67;
LABEL_8:
  memcpy(v41, v42, v40);
LABEL_15:
  v74 = *(int *)(a3 + 24);
  v75 = (char *)a1 + v74;
  v76 = (char *)a2 + v74;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v77 - 8) + 40))(v75, v76, v77);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationOption()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23E1A2814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_47(*(_QWORD *)(a1 + 8));
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v6;
      v8 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      v8 = *(int *)(a3 + 24);
    }
    OUTLINED_FUNCTION_20_5(a1 + v8, a2, v7);
  }
}

uint64_t storeEnumTagSinglePayload for DisambiguationOption()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E1A28A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      v10 = *(int *)(a4 + 24);
    }
    OUTLINED_FUNCTION_21_6(a1 + v10, a2, a2, v9);
  }
}

void sub_23E1A2930()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E18E094(319, qword_256D34F00, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
  {
    sub_23E18E094(319, (unint64_t *)&qword_256D34EF8, (uint64_t (*)(uint64_t))sub_23E18B5A4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEABA78]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  char *v51;
  char *v52;
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = type metadata accessor for DisambiguationOption(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v15 = v11[1];
      *v10 = *v11;
      v10[1] = v15;
      v16 = *(int *)(v12 + 20);
      v17 = (char *)v10 + v16;
      v18 = (char *)v11 + v16;
      v19 = (int *)type metadata accessor for IconConfiguration();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      else
      {
        v8((uint64_t *)v17, (uint64_t *)v18, v7);
        v21 = v19[5];
        v22 = &v17[v21];
        v23 = &v18[v21];
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
        v53 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
        v54 = v24;
        v53(v22, v23, v24);
        v25 = v19[6];
        v26 = &v17[v25];
        v27 = &v18[v25];
        v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
        v29 = v19[7];
        v51 = &v17[v29];
        v30 = &v18[v29];
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
        v32(v51, v30, v31);
        v32(&v17[v19[8]], &v18[v19[8]], v31);
        v33 = v19[9];
        v34 = &v17[v33];
        v35 = &v18[v33];
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
        v53(&v17[v19[10]], &v18[v19[10]], v54);
        v37 = v19[11];
        v52 = &v17[v37];
        v38 = &v18[v37];
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v52, v38, v39);
        v53(&v17[v19[12]], &v18[v19[12]], v54);
        v53(&v17[v19[13]], &v18[v19[13]], v54);
        v40 = v19[14];
        v41 = &v17[v40];
        v42 = &v18[v40];
        v43 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v42, 1, v43))
        {
          v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
          memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
        }
        else
        {
          v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v41, v42, v45);
          __swift_storeEnumTagSinglePayload((uint64_t)v41, 0, 1, v43);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, (uint64_t)v19);
      }
      v46 = *(int *)(v12 + 24);
      v47 = (char *)v10 + v46;
      v48 = (char *)v11 + v46;
      v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v47, v48, v49);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t destroy for DisambiguationSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 24);
  v7 = type metadata accessor for DisambiguationOption(0);
  result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v9 = v6 + *(int *)(v7 + 20);
    v10 = (int *)type metadata accessor for IconConfiguration();
    if (!__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10))
    {
      v5(v9, v4);
      v11 = v9 + v10[5];
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
      v13(v11, v12);
      v14 = v9 + v10[6];
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
      v16 = v9 + v10[7];
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8);
      v18(v16, v17);
      v18(v9 + v10[8], v17);
      v19 = v9 + v10[9];
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
      v13(v9 + v10[10], v12);
      v21 = v9 + v10[11];
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
      v13(v9 + v10[12], v12);
      v13(v9 + v10[13], v12);
      v23 = v9 + v10[14];
      v24 = type metadata accessor for DirectInvocationConfig();
      if (!__swift_getEnumTagSinglePayload(v23, 1, v24))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v23, v25);
      }
    }
    v26 = v6 + *(int *)(v7 + 24);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v26, v27);
  }
  return result;
}

uint64_t initializeWithCopy for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v49;
  char *v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for DisambiguationOption(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = v10[1];
    *v9 = *v10;
    v9[1] = v13;
    v14 = *(int *)(v11 + 20);
    v15 = (char *)v9 + v14;
    v16 = (char *)v10 + v14;
    v17 = (int *)type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v17))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v15, (uint64_t)v16, v6);
      v19 = v17[5];
      v20 = &v15[v19];
      v21 = &v16[v19];
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v51 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
      v52 = v22;
      v51(v20, v21, v22);
      v23 = v17[6];
      v24 = &v15[v23];
      v25 = &v16[v23];
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
      v27 = v17[7];
      v49 = &v15[v27];
      v28 = &v16[v27];
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
      v30(v49, v28, v29);
      v30(&v15[v17[8]], &v16[v17[8]], v29);
      v31 = v17[9];
      v32 = &v15[v31];
      v33 = &v16[v31];
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
      v51(&v15[v17[10]], &v16[v17[10]], v52);
      v35 = v17[11];
      v50 = &v15[v35];
      v36 = &v16[v35];
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v50, v36, v37);
      v51(&v15[v17[12]], &v16[v17[12]], v52);
      v51(&v15[v17[13]], &v16[v17[13]], v52);
      v38 = v17[14];
      v39 = &v15[v38];
      v40 = &v16[v38];
      v41 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v41))
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
      }
      else
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v39, v40, v43);
        __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v41);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v17);
    }
    v44 = *(int *)(v11 + 24);
    v45 = (char *)v9 + v44;
    v46 = (char *)v10 + v44;
    v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v46, v47);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithCopy for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  int v25;
  size_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  const void *v54;
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
  void (*v66)(uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(char *, char *, uint64_t);
  void (*v123)(uint64_t, uint64_t, uint64_t);
  void (*v124)(uint64_t, uint64_t, uint64_t);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 24);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = type metadata accessor for DisambiguationOption(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    if (v14)
    {
      sub_23E187F20((uint64_t)v10, type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    *v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21 = *(int *)(v12 + 20);
    v22 = (uint64_t)v10 + v21;
    v23 = (uint64_t)v11 + v21;
    v24 = (int *)type metadata accessor for IconConfiguration();
    v128 = v22;
    LODWORD(v22) = __swift_getEnumTagSinglePayload(v22, 1, (uint64_t)v24);
    v25 = __swift_getEnumTagSinglePayload(v23, 1, (uint64_t)v24);
    if ((_DWORD)v22)
    {
      if (v25)
      {
        v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
        v27 = (void *)v128;
LABEL_15:
        v54 = (const void *)v23;
LABEL_16:
        memcpy(v27, v54, v26);
LABEL_28:
        v112 = *(int *)(v12 + 24);
        v113 = (char *)v10 + v112;
        v114 = (char *)v11 + v112;
        v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v115 - 8) + 24))(v113, v114, v115);
        return a1;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v128, v23, v6);
      v55 = v24[5];
      v56 = v128 + v55;
      v57 = v23 + v55;
      v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v123 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 16);
      v126 = v58;
      v123(v56, v57, v58);
      v59 = v24[6];
      v60 = v128 + v59;
      v61 = v23 + v59;
      v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 16))(v60, v61, v62);
      v63 = v24[7];
      v118 = v128 + v63;
      v64 = v23 + v63;
      v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 16);
      v66(v118, v64, v65);
      v66(v128 + v24[8], v23 + v24[8], v65);
      v67 = v24[9];
      v68 = v128 + v67;
      v69 = v23 + v67;
      v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 16))(v68, v69, v70);
      v123(v128 + v24[10], v23 + v24[10], v126);
      v71 = v24[11];
      v72 = v128 + v71;
      v119 = v23 + v71;
      v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 16))(v72, v119, v73);
      v123(v128 + v24[12], v23 + v24[12], v126);
      v123(v128 + v24[13], v23 + v24[13], v126);
      v74 = v24[14];
      v75 = (void *)(v128 + v74);
      v76 = (const void *)(v23 + v74);
      v77 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v76, 1, v77))
      {
        v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v75, v76, *(_QWORD *)(*(_QWORD *)(v78 - 8) + 64));
      }
      else
      {
        v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v111 - 8) + 16))(v75, v76, v111);
        __swift_storeEnumTagSinglePayload((uint64_t)v75, 0, 1, v77);
      }
      v109 = v128;
      v110 = (uint64_t)v24;
LABEL_27:
      __swift_storeEnumTagSinglePayload(v109, 0, 1, v110);
      goto LABEL_28;
    }
    if (v25)
    {
      sub_23E187F20(v128, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
      v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
      v27 = (void *)v128;
      goto LABEL_15;
    }
    v8(v128, v23, v6);
    v84 = v24[5];
    v85 = v128 + v84;
    v86 = v23 + v84;
    v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v124 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 24);
    v127 = v87;
    v124(v85, v86, v87);
    v88 = v24[6];
    v89 = v128 + v88;
    v90 = v23 + v88;
    v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 24))(v89, v90, v91);
    v92 = v24[7];
    v120 = v128 + v92;
    v93 = v23 + v92;
    v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v95 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 24);
    v95(v120, v93, v94);
    v95(v128 + v24[8], v23 + v24[8], v94);
    v96 = v24[9];
    v97 = v128 + v96;
    v98 = v23 + v96;
    v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 24))(v97, v98, v99);
    v124(v128 + v24[10], v23 + v24[10], v127);
    v100 = v24[11];
    v101 = v128 + v100;
    v121 = v23 + v100;
    v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v102 - 8) + 24))(v101, v121, v102);
    v124(v128 + v24[12], v23 + v24[12], v127);
    v124(v128 + v24[13], v23 + v24[13], v127);
    v103 = v24[14];
    v104 = v128 + v103;
    v105 = v23 + v103;
    v106 = type metadata accessor for DirectInvocationConfig();
    LODWORD(v101) = __swift_getEnumTagSinglePayload(v104, 1, v106);
    v107 = __swift_getEnumTagSinglePayload(v105, 1, v106);
    if ((_DWORD)v101)
    {
      if (!v107)
      {
        v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v108 - 8) + 16))(v104, v105, v108);
        v109 = v104;
        v110 = v106;
        goto LABEL_27;
      }
    }
    else
    {
      if (!v107)
      {
        v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v117 - 8) + 24))(v104, v105, v117);
        goto LABEL_28;
      }
      sub_23E187F20(v104, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
    }
    v26 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
    v27 = (void *)v104;
    v54 = (const void *)v105;
    goto LABEL_16;
  }
  if (v14)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  *v10 = *v11;
  v10[1] = v11[1];
  v15 = *(int *)(v12 + 20);
  v16 = (char *)v10 + v15;
  v17 = (char *)v11 + v15;
  v18 = (int *)type metadata accessor for IconConfiguration();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v129 = v12;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v16, v17, v6);
    v28 = v18[5];
    v29 = &v16[v28];
    v30 = &v17[v28];
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v122 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
    v125 = v31;
    v122(v29, v30, v31);
    v32 = v18[6];
    v33 = &v16[v32];
    v34 = &v17[v32];
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
    v36 = v18[7];
    v37 = &v16[v36];
    v38 = &v17[v36];
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
    v40(v37, v38, v39);
    v40(&v16[v18[8]], &v17[v18[8]], v39);
    v41 = v18[9];
    v42 = &v16[v41];
    v43 = &v17[v41];
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
    v122(&v16[v18[10]], &v17[v18[10]], v125);
    v45 = v18[11];
    v46 = &v16[v45];
    v47 = &v17[v45];
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
    v122(&v16[v18[12]], &v17[v18[12]], v125);
    v122(&v16[v18[13]], &v17[v18[13]], v125);
    v49 = v18[14];
    v50 = &v16[v49];
    v51 = &v17[v49];
    v52 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v51, 1, v52))
    {
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v50, v51, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    }
    else
    {
      v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v79 - 8) + 16))(v50, v51, v79);
      __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v52);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, (uint64_t)v18);
    v12 = v129;
  }
  v80 = *(int *)(v12 + 24);
  v81 = (char *)v10 + v80;
  v82 = (char *)v11 + v80;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v83 - 8) + 16))(v81, v82, v83);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  return a1;
}

uint64_t initializeWithTake for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = type metadata accessor for DisambiguationOption(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    *v9 = *v10;
    v13 = *(int *)(v11 + 20);
    v14 = (char *)v9 + v13;
    v15 = (char *)v10 + v13;
    v16 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, (uint64_t)v16))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v14, (uint64_t)v15, v6);
      v18 = v16[5];
      v19 = &v14[v18];
      v20 = &v15[v18];
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v50 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32);
      v51 = v21;
      v50(v19, v20, v21);
      v22 = v16[6];
      v23 = &v14[v22];
      v24 = &v15[v22];
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
      v26 = v16[7];
      v48 = &v14[v26];
      v27 = &v15[v26];
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
      v29(v48, v27, v28);
      v29(&v14[v16[8]], &v15[v16[8]], v28);
      v30 = v16[9];
      v31 = &v14[v30];
      v32 = &v15[v30];
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
      v50(&v14[v16[10]], &v15[v16[10]], v51);
      v34 = v16[11];
      v49 = &v14[v34];
      v35 = &v15[v34];
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v49, v35, v36);
      v50(&v14[v16[12]], &v15[v16[12]], v51);
      v50(&v14[v16[13]], &v15[v16[13]], v51);
      v37 = v16[14];
      v38 = &v14[v37];
      v39 = &v15[v37];
      v40 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v40))
      {
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
      }
      else
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v38, v39, v42);
        __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v40);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, (uint64_t)v16);
    }
    v43 = *(int *)(v11 + 24);
    v44 = (char *)v9 + v43;
    v45 = (char *)v10 + v43;
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 32))(v44, v45, v46);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int v26;
  size_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  const void *v55;
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
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(char *, char *, uint64_t);
  void (*v124)(uint64_t, uint64_t, uint64_t);
  void (*v125)(uint64_t, uint64_t, uint64_t);
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD *v130;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 24);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = type metadata accessor for DisambiguationOption(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    if (v14)
    {
      sub_23E187F20((uint64_t)v10, type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    v21 = v11[1];
    *v10 = *v11;
    v10[1] = v21;
    swift_bridgeObjectRelease();
    v22 = *(int *)(v12 + 20);
    v23 = (uint64_t)v10 + v22;
    v24 = (uint64_t)v11 + v22;
    v25 = (int *)type metadata accessor for IconConfiguration();
    v129 = v23;
    LODWORD(v23) = __swift_getEnumTagSinglePayload(v23, 1, (uint64_t)v25);
    v26 = __swift_getEnumTagSinglePayload(v24, 1, (uint64_t)v25);
    if ((_DWORD)v23)
    {
      if (v26)
      {
        v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
        v28 = (void *)v129;
LABEL_15:
        v55 = (const void *)v24;
LABEL_16:
        memcpy(v28, v55, v27);
LABEL_28:
        v113 = *(int *)(v12 + 24);
        v114 = (char *)v10 + v113;
        v115 = (char *)v11 + v113;
        v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v116 - 8) + 40))(v114, v115, v116);
        return a1;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v129, v24, v6);
      v56 = v25[5];
      v57 = v129 + v56;
      v58 = v24 + v56;
      v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v124 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 32);
      v127 = v59;
      v124(v57, v58, v59);
      v60 = v25[6];
      v61 = v129 + v60;
      v62 = v24 + v60;
      v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v61, v62, v63);
      v64 = v25[7];
      v119 = v129 + v64;
      v65 = v24 + v64;
      v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 32);
      v67(v119, v65, v66);
      v67(v129 + v25[8], v24 + v25[8], v66);
      v68 = v25[9];
      v69 = v129 + v68;
      v70 = v24 + v68;
      v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(v69, v70, v71);
      v124(v129 + v25[10], v24 + v25[10], v127);
      v72 = v25[11];
      v73 = v129 + v72;
      v120 = v24 + v72;
      v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 32))(v73, v120, v74);
      v124(v129 + v25[12], v24 + v25[12], v127);
      v124(v129 + v25[13], v24 + v25[13], v127);
      v75 = v25[14];
      v76 = (void *)(v129 + v75);
      v77 = (const void *)(v24 + v75);
      v78 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v77, 1, v78))
      {
        v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v76, v77, *(_QWORD *)(*(_QWORD *)(v79 - 8) + 64));
      }
      else
      {
        v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v112 - 8) + 32))(v76, v77, v112);
        __swift_storeEnumTagSinglePayload((uint64_t)v76, 0, 1, v78);
      }
      v110 = v129;
      v111 = (uint64_t)v25;
LABEL_27:
      __swift_storeEnumTagSinglePayload(v110, 0, 1, v111);
      goto LABEL_28;
    }
    if (v26)
    {
      sub_23E187F20(v129, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
      v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
      v28 = (void *)v129;
      goto LABEL_15;
    }
    v8(v129, v24, v6);
    v85 = v25[5];
    v86 = v129 + v85;
    v87 = v24 + v85;
    v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v125 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 40);
    v128 = v88;
    v125(v86, v87, v88);
    v89 = v25[6];
    v90 = v129 + v89;
    v91 = v24 + v89;
    v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v92 - 8) + 40))(v90, v91, v92);
    v93 = v25[7];
    v121 = v129 + v93;
    v94 = v24 + v93;
    v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v96 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 40);
    v96(v121, v94, v95);
    v96(v129 + v25[8], v24 + v25[8], v95);
    v97 = v25[9];
    v98 = v129 + v97;
    v99 = v24 + v97;
    v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 40))(v98, v99, v100);
    v125(v129 + v25[10], v24 + v25[10], v128);
    v101 = v25[11];
    v102 = v129 + v101;
    v122 = v24 + v101;
    v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v103 - 8) + 40))(v102, v122, v103);
    v125(v129 + v25[12], v24 + v25[12], v128);
    v125(v129 + v25[13], v24 + v25[13], v128);
    v104 = v25[14];
    v105 = v129 + v104;
    v106 = v24 + v104;
    v107 = type metadata accessor for DirectInvocationConfig();
    LODWORD(v102) = __swift_getEnumTagSinglePayload(v105, 1, v107);
    v108 = __swift_getEnumTagSinglePayload(v106, 1, v107);
    if ((_DWORD)v102)
    {
      if (!v108)
      {
        v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v109 - 8) + 32))(v105, v106, v109);
        v110 = v105;
        v111 = v107;
        goto LABEL_27;
      }
    }
    else
    {
      if (!v108)
      {
        v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v118 - 8) + 40))(v105, v106, v118);
        goto LABEL_28;
      }
      sub_23E187F20(v105, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
    }
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
    v28 = (void *)v105;
    v55 = (const void *)v106;
    goto LABEL_16;
  }
  if (v14)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v10 = *(_OWORD *)v11;
  v15 = *(int *)(v12 + 20);
  v16 = (char *)v10 + v15;
  v17 = (char *)v11 + v15;
  v18 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v130 = v11;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
    v29 = v18[5];
    v30 = &v16[v29];
    v31 = &v17[v29];
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v123 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32);
    v126 = v32;
    v123(v30, v31, v32);
    v33 = v18[6];
    v34 = &v16[v33];
    v35 = &v17[v33];
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v34, v35, v36);
    v37 = v18[7];
    v38 = &v16[v37];
    v39 = &v17[v37];
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v41 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 32);
    v41(v38, v39, v40);
    v41(&v16[v18[8]], &v17[v18[8]], v40);
    v42 = v18[9];
    v43 = &v16[v42];
    v44 = &v17[v42];
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v43, v44, v45);
    v123(&v16[v18[10]], &v17[v18[10]], v126);
    v46 = v18[11];
    v47 = &v16[v46];
    v48 = &v17[v46];
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 32))(v47, v48, v49);
    v123(&v16[v18[12]], &v17[v18[12]], v126);
    v123(&v16[v18[13]], &v17[v18[13]], v126);
    v50 = v18[14];
    v51 = &v16[v50];
    v52 = &v17[v50];
    v53 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v52, 1, v53))
    {
      v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    }
    else
    {
      v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v80 - 8) + 32))(v51, v52, v80);
      __swift_storeEnumTagSinglePayload((uint64_t)v51, 0, 1, v53);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, (uint64_t)v18);
    v11 = v130;
  }
  v81 = *(int *)(v12 + 24);
  v82 = (char *)v10 + v81;
  v83 = (char *)v11 + v81;
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v84 - 8) + 32))(v82, v83, v84);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23E1A48C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    if ((_DWORD)a2 == 0x7FFFFFFF)
    {
      OUTLINED_FUNCTION_47(*(_QWORD *)(a1 + *(int *)(a3 + 20)));
      OUTLINED_FUNCTION_2_0();
      return;
    }
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    v8 = a1 + *(int *)(a3 + 24);
  }
  OUTLINED_FUNCTION_20_5(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for DisambiguationSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E1A4958(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      OUTLINED_FUNCTION_2_0();
      return;
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    v10 = a1 + *(int *)(a4 + 24);
  }
  OUTLINED_FUNCTION_21_6(v10, a2, a2, v9);
}

void sub_23E1A49E8()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E18A750();
  if (v0 <= 0x3F)
  {
    sub_23E18E094(319, qword_256D35708, type metadata accessor for DisambiguationOption, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for DisambiguationSnippetModel.CodingKeys()
{
  return &type metadata for DisambiguationSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SnippetState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s25HomeAutomationUIFramework26DisambiguationSnippetModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1A4B7C + 4 * byte_23E1BFBC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1A4BB0 + 4 * byte_23E1BFBC0[v4]))();
}

uint64_t sub_23E1A4BB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1A4BB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1A4BC0);
  return result;
}

uint64_t sub_23E1A4BCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1A4BD4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1A4BD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1A4BE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationOption.CodingKeys()
{
  return &type metadata for DisambiguationOption.CodingKeys;
}

unint64_t sub_23E1A4C00()
{
  unint64_t result;

  result = qword_256D35740;
  if (!qword_256D35740)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFE20, &type metadata for DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35740);
  }
  return result;
}

unint64_t sub_23E1A4C40()
{
  unint64_t result;

  result = qword_256D35748;
  if (!qword_256D35748)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFF10, &type metadata for DisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35748);
  }
  return result;
}

unint64_t sub_23E1A4C80()
{
  unint64_t result;

  result = qword_256D35750;
  if (!qword_256D35750)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFE48, &type metadata for DisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35750);
  }
  return result;
}

unint64_t sub_23E1A4CC0()
{
  unint64_t result;

  result = qword_256D35758;
  if (!qword_256D35758)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFE70, &type metadata for DisambiguationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35758);
  }
  return result;
}

unint64_t sub_23E1A4D00()
{
  unint64_t result;

  result = qword_256D35760;
  if (!qword_256D35760)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFD58, &type metadata for DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35760);
  }
  return result;
}

unint64_t sub_23E1A4D40()
{
  unint64_t result;

  result = qword_256D35768;
  if (!qword_256D35768)
  {
    result = MEMORY[0x24264D408](&unk_23E1BFD80, &type metadata for DisambiguationOption.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35768);
  }
  return result;
}

char *sub_23E1A4D7C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D35780);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23E19FCFC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23E19FE7C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_23E1A4E5C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35778);
  v10 = *(_QWORD *)(type metadata accessor for DisambiguationOption(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DisambiguationOption(0) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_23E19FD80(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23E19FF48(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

size_t sub_23E1A4F9C(uint64_t a1)
{
  return sub_23E1A4E5C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_23E1A4FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DisambiguationOption(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 120), v1);
}

void OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23E187F20(a1, v1);
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  return type metadata accessor for DisambiguationOption(0);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_19_7()
{
  return sub_23E1BE6B4();
}

uint64_t OUTLINED_FUNCTION_20_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_21_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_24_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_25_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

void OUTLINED_FUNCTION_30_3(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23E187F20(a1, v1);
}

char *OUTLINED_FUNCTION_31_3(char *a1, int64_t a2)
{
  return sub_23E1A1134(a1, a2, 1);
}

void OUTLINED_FUNCTION_32_1(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23E187F20(a1, v1);
}

void OUTLINED_FUNCTION_36_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23E186F18(a1, a2, v2);
}

void OUTLINED_FUNCTION_37_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23E186F18(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_23E1BDD48();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return type metadata accessor for DisambiguationOption(0);
}

char *OUTLINED_FUNCTION_40_1(char *a1, int64_t a2)
{
  char *v2;

  return sub_23E1A102C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_41_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_23E1BE690();
}

void OUTLINED_FUNCTION_44_1()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_23E187F20(v1, v0);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_46()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_47@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_23E1BE690();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return type metadata accessor for DisambiguationSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_23E1BE654();
}

uint64_t DirectInvocationConfig.action.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return sub_23E1BDD60();
}

uint64_t sub_23E1A5268(id *a1)
{
  id v1;

  v1 = *a1;
  return DirectInvocationConfig.action.setter();
}

uint64_t DirectInvocationConfig.action.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return sub_23E1BDD6C();
}

void (*DirectInvocationConfig.action.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v2[4] = sub_23E1BDD54();
  return sub_23E18145C;
}

uint64_t DirectInvocationConfig.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_23E1BDD30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_8();
  v4 = v3 - v2;
  sub_23E1BDD24();
  v5 = sub_23E1BDD18();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  return v5;
}

BOOL sub_23E1A53A0()
{
  uint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_23E1A53E4()
{
  return sub_23E1A53A0();
}

uint64_t sub_23E1A53FC()
{
  return 1;
}

uint64_t sub_23E1A5404()
{
  return 0x6E6F69746361;
}

BOOL sub_23E1A5428@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_23E1A53A0();
  *a1 = result;
  return result;
}

uint64_t sub_23E1A5458@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23E1A5404();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_23E1A5480@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_23E1A53E4();
  *a1 = result;
  return result;
}

uint64_t sub_23E1A54A8()
{
  return sub_23E1814E0();
}

uint64_t sub_23E1A54C0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1A53FC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23E1A54E8()
{
  sub_23E1A5720();
  return sub_23E1BE708();
}

uint64_t sub_23E1A5510()
{
  sub_23E1A5720();
  return sub_23E1BE714();
}

void DirectInvocationConfig.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v4 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_8();
  v14 = v6 - v5;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35788);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_33_3();
  v7 = type metadata accessor for DirectInvocationConfig();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1A5720();
  sub_23E1BE6F0();
  if (!v2)
  {
    sub_23E1A58F8(&qword_256D34E40, MEMORY[0x24BEABA90]);
    sub_23E1BE654();
    sub_23E1BDD60();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v12);
    sub_23E18B5A4();
    sub_23E1BDD48();
    OUTLINED_FUNCTION_2_7();
    sub_23E1A575C(v10, a2);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_9_0();
}

uint64_t type metadata accessor for DirectInvocationConfig()
{
  uint64_t result;

  result = qword_256D357F8;
  if (!qword_256D357F8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23E1A5720()
{
  unint64_t result;

  result = qword_256D35790;
  if (!qword_256D35790)
  {
    result = MEMORY[0x24264D408](&unk_23E1C01FC, &type metadata for DirectInvocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35790);
  }
  return result;
}

uint64_t sub_23E1A575C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DirectInvocationConfig();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void DirectInvocationConfig.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v9 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v6 = v5 - v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35798);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_33_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1A5720();
  sub_23E1BE6FC();
  sub_23E1BDD60();
  sub_23E18B5A4();
  sub_23E1BDD48();
  sub_23E1A58F8(&qword_256D34E58, MEMORY[0x24BEABA88]);
  sub_23E1BE690();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
  OUTLINED_FUNCTION_9_0();
}

uint64_t sub_23E1A58F8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34E18);
    result = MEMORY[0x24264D408](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t DirectInvocationConfig.Builder.init(action:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id DirectInvocationConfig.Builder.withAction(_:)@<X0>(id a1@<X0>, id *a2@<X8>)
{
  *a2 = a1;
  return a1;
}

uint64_t DirectInvocationConfig.Builder.build()()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_23E18B5A4();
  v2 = v1;
  return sub_23E1BDD48();
}

void sub_23E1A598C(_QWORD *a1)
{
  DirectInvocationConfig.encode(to:)(a1);
}

void sub_23E1A59A0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  DirectInvocationConfig.init(from:)(a1, a2);
}

uint64_t sub_23E1A59B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = DirectInvocationConfig.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23E1A59D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = DirectInvocationConfig.action.getter();
  *a1 = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for DirectInvocationConfig(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DirectInvocationConfig()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1A5BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DirectInvocationConfig()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1A5BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_23E1A5C28()
{
  unint64_t v0;

  sub_23E1A5C90();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23E1A5C90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D34EF8)
  {
    sub_23E18B5A4();
    v0 = sub_23E1BDD78();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D34EF8);
  }
}

ValueMetadata *type metadata accessor for DirectInvocationConfig.Builder()
{
  return &type metadata for DirectInvocationConfig.Builder;
}

uint64_t getEnumTagSinglePayload for DirectInvocationConfig.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DirectInvocationConfig.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23E1A5D88 + 4 * byte_23E1C0040[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23E1A5DA8 + 4 * byte_23E1C0045[v4]))();
}

_BYTE *sub_23E1A5D88(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23E1A5DA8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23E1A5DB0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23E1A5DB8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23E1A5DC0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23E1A5DC8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23E1A5DD4()
{
  return 0;
}

ValueMetadata *type metadata accessor for DirectInvocationConfig.CodingKeys()
{
  return &type metadata for DirectInvocationConfig.CodingKeys;
}

unint64_t sub_23E1A5DF0()
{
  unint64_t result;

  result = qword_256D35830;
  if (!qword_256D35830)
  {
    result = MEMORY[0x24264D408](&unk_23E1C01D4, &type metadata for DirectInvocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35830);
  }
  return result;
}

unint64_t sub_23E1A5E30()
{
  unint64_t result;

  result = qword_256D35838;
  if (!qword_256D35838)
  {
    result = MEMORY[0x24264D408](&unk_23E1C010C, &type metadata for DirectInvocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35838);
  }
  return result;
}

unint64_t sub_23E1A5E70()
{
  unint64_t result;

  result = qword_256D35840;
  if (!qword_256D35840)
  {
    result = MEMORY[0x24264D408](&unk_23E1C0134, &type metadata for DirectInvocationConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35840);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

HomeAutomationUIFramework::SnippetState_optional __swiftcall SnippetState.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  HomeAutomationUIFramework::SnippetState_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23E1BE618();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t SnippetState.rawValue.getter()
{
  char *v0;

  return qword_23E1C03A0[*v0];
}

void sub_23E1A5F34()
{
  sub_23E1B5C00();
}

void sub_23E1A5F40()
{
  sub_23E1B5DBC();
}

uint64_t sub_23E1A5F48()
{
  return sub_23E1B5FC4();
}

void sub_23E1A5F50()
{
  sub_23E1B60AC();
}

HomeAutomationUIFramework::SnippetState_optional sub_23E1A5F58(Swift::String *a1)
{
  return SnippetState.init(rawValue:)(*a1);
}

uint64_t sub_23E1A5F64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SnippetState.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23E1A5F88(uint64_t a1, char *a2, char a3, char a4)
{
  uint64_t v4;
  char v7;

  v7 = *a2;
  sub_23E1A6CE4(a1, v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  *(_BYTE *)(v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) = v7;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress) = a3;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) = a4;
  return v4;
}

uint64_t sub_23E1A5FEC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  if (!*(_BYTE *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state))
  {
    OUTLINED_FUNCTION_11_4();
    goto LABEL_7;
  }
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) == 1)
    OUTLINED_FUNCTION_3_5();
  else
    OUTLINED_FUNCTION_2_8();
  v1 = OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_9_7();
  if ((v1 & 1) != 0)
  {
LABEL_7:
    if (qword_256D34820 == -1)
      goto LABEL_10;
    goto LABEL_11;
  }
  if (qword_256D34820 != -1)
LABEL_11:
    swift_once();
LABEL_10:
  v2 = OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_5_5(v2, (uint64_t)qword_256D3AF00);
  OUTLINED_FUNCTION_19_8();
  OUTLINED_FUNCTION_1_6(v3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
  sub_23E1BDEB0();
  v4 = OUTLINED_FUNCTION_12_9();
  return OUTLINED_FUNCTION_8_5(v4, v5, v6, v7);
}

uint64_t sub_23E1A6110@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);

  if (!*(_BYTE *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state))
  {
    OUTLINED_FUNCTION_11_4();
    goto LABEL_7;
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) == 1)
    OUTLINED_FUNCTION_3_5();
  else
    OUTLINED_FUNCTION_2_8();
  v3 = OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_9_7();
  if ((v3 & 1) != 0)
  {
LABEL_7:
    if (qword_256D34820 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_14_7();
    OUTLINED_FUNCTION_5_5(v4, (uint64_t)qword_256D3AF00);
    OUTLINED_FUNCTION_19_8();
    OUTLINED_FUNCTION_1_6(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
    *a1 = sub_23E1BE21C();
    goto LABEL_13;
  }
  if (qword_256D34820 != -1)
    swift_once();
  v6 = OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_5_5(v6, (uint64_t)qword_256D3AF00);
  OUTLINED_FUNCTION_19_8();
  OUTLINED_FUNCTION_1_6(v7, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
  v8 = *MEMORY[0x24BEADC08];
  v9 = sub_23E1BE324();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(a1, v8, v9);
LABEL_13:
  sub_23E1BE330();
  v10 = OUTLINED_FUNCTION_12_9();
  return OUTLINED_FUNCTION_8_5(v10, v11, v12, v13);
}

uint64_t sub_23E1A6268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v7)(uint64_t, _QWORD, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  unsigned int *v17;
  _BYTE v19[16];

  v7 = (uint64_t (*)(uint64_t, _QWORD, uint64_t))OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23E19C2A0(v3 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  sub_23E1BDDCC();
  sub_23E1A6AA0((uint64_t)v10);
  if (v19[15] == 46)
    v11 = 0;
  else
    v11 = sub_23E1B5CD0();
  if (a3 == 1)
  {
    v14 = *MEMORY[0x24BEAAB78];
    v15 = OUTLINED_FUNCTION_20_6();
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104);
    v16(a1, v14, v15);
    if ((v11 & 1) != 0)
      v17 = (unsigned int *)MEMORY[0x24BEAAB70];
    else
      v17 = (unsigned int *)MEMORY[0x24BEAAB68];
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t))v16)(a2, *v17, v15);
  }
  else
  {
    v12 = OUTLINED_FUNCTION_20_6();
    OUTLINED_FUNCTION_4_7(v12);
    if (a3 == 4)
      v13 = (unsigned int *)MEMORY[0x24BEAAAC0];
    else
      v13 = (unsigned int *)MEMORY[0x24BEAAB58];
    return v7(a2, *v13, a3);
  }
}

uint64_t sub_23E1A63DC()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle))
    return 2;
  else
    return 1;
}

void sub_23E1A6400(unsigned __int8 *a1)
{
  uint64_t v1;
  int v2;
  int v3;

  v2 = *a1;
  switch(v2)
  {
    case 18:
      sub_23E1BE1C8();
      sub_23E1BE204();
      sub_23E1BE1C8();
      goto LABEL_7;
    case 35:
      sub_23E1BE21C();
      sub_23E1BE1E0();
      sub_23E1BE1E0();
LABEL_7:
      if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) == 1)
      {
        swift_release();
        OUTLINED_FUNCTION_25_0();
      }
      else
      {
        swift_release();
      }
      goto LABEL_16;
    case 39:
      sub_23E1BE1BC();
      sub_23E1BE204();
      sub_23E1BE1BC();
      goto LABEL_7;
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) == 1)
  {
    swift_retain();
  }
  else
  {
    v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress);
    sub_23E1BE21C();
    if (v3 == 1)
    {
      sub_23E1BE258();
      swift_release();
    }
    swift_retain();
  }
LABEL_16:
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1A6528()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[2];

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  v2 = v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig;
  OUTLINED_FUNCTION_10_6(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_10_6(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_7_4();
  v3 = OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state;
  v4 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state);
  if (v4 == 2)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle))
      return 2;
    else
      return 1;
  }
  if (v4 == 1)
    OUTLINED_FUNCTION_3_5();
  v5 = sub_23E1BE6B4();
  OUTLINED_FUNCTION_9_7();
  if ((v5 & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_10_6(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_7_4();
  v7 = static ColorUtils.getColor(colorString:colorDict:)(v12[0], v12[1], v12[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_BYTE *)(v0 + v3))
  {
    OUTLINED_FUNCTION_11_4();
LABEL_15:
    sub_23E1A6400((unsigned __int8 *)v12);
    v6 = v9;
LABEL_25:
    OUTLINED_FUNCTION_25_0();
    return v6;
  }
  if (*(_BYTE *)(v0 + v3) == 1)
    OUTLINED_FUNCTION_3_5();
  else
    OUTLINED_FUNCTION_2_8();
  v8 = OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_9_7();
  if ((v8 & 1) != 0)
    goto LABEL_15;
  switch(LOBYTE(v12[0]))
  {
    case 0x12u:
      v6 = sub_23E1BE1C8();
      sub_23E1BE204();
      sub_23E1BE1C8();
      goto LABEL_24;
    case 0x23u:
      v6 = sub_23E1BE21C();
      if (qword_256D34840 != -1)
        swift_once();
      swift_retain();
      sub_23E1BE1BC();
      goto LABEL_24;
    case 0x27u:
      sub_23E1BE21C();
      v6 = sub_23E1BE258();
      swift_release();
      sub_23E1BE204();
      sub_23E1BE21C();
      sub_23E1BE258();
      swift_release();
LABEL_24:
      swift_release();
      goto LABEL_25;
  }
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) != 1
    && *(_BYTE *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress) == 1)
  {
    v11 = sub_23E1BE21C();
    OUTLINED_FUNCTION_25_0();
    return v11;
  }
  return v7;
}

uint64_t sub_23E1A683C@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  unsigned __int8 v12;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_1();
  v4 = v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig;
  OUTLINED_FUNCTION_10_6(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
  sub_23E1BDDCC();
  OUTLINED_FUNCTION_7_4();
  v5 = OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state))
  {
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) == 1)
      OUTLINED_FUNCTION_3_5();
    else
      OUTLINED_FUNCTION_2_8();
    v7 = OUTLINED_FUNCTION_0_5();
    result = OUTLINED_FUNCTION_9_7();
    if ((v7 & 1) == 0)
    {
      if ((v12 | 4) != 0x27)
      {
LABEL_12:
        if (*(_BYTE *)(v1 + v5))
        {
          v9 = OUTLINED_FUNCTION_0_5();
          OUTLINED_FUNCTION_9_7();
          if ((v9 & 1) == 0)
          {
            OUTLINED_FUNCTION_10_6(v4);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
            sub_23E1BDDCC();
            result = OUTLINED_FUNCTION_7_4();
            v8 = v11;
            goto LABEL_17;
          }
        }
        else
        {
          OUTLINED_FUNCTION_11_4();
        }
        OUTLINED_FUNCTION_10_6(v4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        sub_23E1BDDCC();
        result = OUTLINED_FUNCTION_7_4();
        v8 = v10;
        goto LABEL_17;
      }
LABEL_11:
      v8 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    result = OUTLINED_FUNCTION_11_4();
  }
  if (v12 == 39)
    goto LABEL_11;
  if (v12 != 35)
    goto LABEL_12;
  v8 = 2;
LABEL_17:
  *a1 = v8;
  return result;
}

void sub_23E1A69E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E19C2A0(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1A6AA0((uint64_t)v3);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1A6A6C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress);
}

uint64_t CompletionStyleSettings.deinit()
{
  uint64_t v0;

  sub_23E1A6AA0(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  return v0;
}

uint64_t sub_23E1A6AA0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IconConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CompletionStyleSettings.__deallocating_deinit()
{
  uint64_t v0;

  sub_23E1A6AA0(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  return swift_deallocClassInstance();
}

unint64_t sub_23E1A6B10()
{
  unint64_t result;

  result = qword_256D35848;
  if (!qword_256D35848)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetState, &type metadata for SnippetState);
    atomic_store(result, (unint64_t *)&qword_256D35848);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SnippetState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1A6B98 + 4 * byte_23E1C0265[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1A6BCC + 4 * byte_23E1C0260[v4]))();
}

uint64_t sub_23E1A6BCC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1A6BD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1A6BDCLL);
  return result;
}

uint64_t sub_23E1A6BE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1A6BF0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1A6BF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1A6BFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetState()
{
  return &type metadata for SnippetState;
}

uint64_t sub_23E1A6C18()
{
  return type metadata accessor for CompletionStyleSettings();
}

uint64_t type metadata accessor for CompletionStyleSettings()
{
  uint64_t result;

  result = qword_256D35878;
  if (!qword_256D35878)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1A6C58()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for IconConfiguration();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CompletionStyleSettings()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23E1A6CE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IconConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_23E1BE6B4();
}

void OUTLINED_FUNCTION_1_6(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  Swift::String v3;

  v3._object = (void *)((a2 - 32) | 0x8000000000000000);
  v3._countAndFlagsBits = 0xD000000000000076;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, v3);
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return 0x64656C696166;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return 6710895;
}

uint64_t OUTLINED_FUNCTION_4_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_5(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;

  return sub_23E1A6AA0(v0);
}

uint64_t OUTLINED_FUNCTION_8_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_6(uint64_t a1)
{
  uint64_t v1;

  return sub_23E19C2A0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  return sub_23E1BDE50();
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  return sub_23E1BDD3C();
}

void CallToActionView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  Swift::String v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v4 = OUTLINED_FUNCTION_11_1();
  v20 = *(_QWORD *)(v4 - 8);
  v21 = v4;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v7 = v6 - v5;
  v8 = sub_23E1BDE50();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v12 = v11 - v10;
  v13 = OUTLINED_FUNCTION_1_7();
  v14 = (uint64_t *)(a2 + *(int *)(v13 + 20));
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v14 = sub_23E1BDF04();
  v14[1] = v15;
  sub_23E181E98(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for CallToActionSnippetModel);
  if (qword_256D34820 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v8, (uint64_t)qword_256D3AF00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, v16, v8);
  sub_23E1BE5B8();
  sub_23E1BE480();
  CallToActionSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0;
  v18._countAndFlagsBits = 0xD000000000000069;
  v18._object = (void *)0x800000023E1C2E20;
  v17._object = (void *)0xE000000000000000;
  Logger.debug(output:test:caller:)(v17, 0, v18);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  if (qword_256D34828 != -1)
    swift_once();
  v19 = (id)qword_256D3AF18;
  sub_23E1BDE2C();
  sub_23E1BE534();
  sub_23E1BDE20();
  sub_23E1A7808(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(a2 + *(int *)(v13 + 24), v7, v21);
  OUTLINED_FUNCTION_0_3();
}

uint64_t type metadata accessor for CallToActionView()
{
  uint64_t result;

  result = qword_256D35A60;
  if (!qword_256D35A60)
    return swift_getSingletonMetadata();
  return result;
}

void CallToActionView.body.getter(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)();
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v15 = a1;
  v3 = OUTLINED_FUNCTION_1_7();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  MEMORY[0x24BDAC7A8](v3);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D359D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8();
  v9 = v8 - v7;
  sub_23E181E98(v2, (uint64_t)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for CallToActionView);
  v10 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_9_8(v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D359D8);
  sub_23E1A78B4();
  sub_23E1BE318();
  sub_23E181E98(v2, (uint64_t)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for CallToActionView);
  v11 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_9_8(v11);
  v12 = v15;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v15, v9, v5);
  v13 = (uint64_t (**)())(v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D35A00) + 36));
  *v13 = sub_23E1A7A0C;
  v13[1] = (uint64_t (*)())v11;
  v13[2] = 0;
  v13[3] = 0;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_23E1A7228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a2;
  v3 = sub_23E1BE30C();
  v45 = *(_QWORD *)(v3 - 8);
  v46 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v44 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CallToActionView();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35338);
  v41 = *(_QWORD *)(v8 - 8);
  v42 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AB0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v43 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D359F0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v38 - v18;
  if (*(_BYTE *)(a1 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 24)) != 1)
    return __swift_storeEnumTagSinglePayload(v47, 1, 1, v14);
  v38 = v19;
  v39 = v17;
  v40 = v12;
  v20 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E181E98(a1, (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for CallToActionView);
  v21 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v22 = swift_allocObject();
  sub_23E1A7848((uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
  sub_23E193EE8();
  sub_23E1BE2C4();
  v23 = v44;
  sub_23E1BE024();
  sub_23E18819C(&qword_256D35340, &qword_256D35338);
  sub_23E187EEC(&qword_256D359F8, (void (*)(uint64_t))MEMORY[0x24BEADB88]);
  v25 = v42;
  v24 = v43;
  v26 = v46;
  sub_23E1BE144();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v26);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v25);
  LOBYTE(v23) = sub_23E1BE054();
  v27 = sub_23E1BE06C();
  v28 = sub_23E1BE060();
  sub_23E1BE060();
  if (sub_23E1BE060() != v23)
    v28 = sub_23E1BE060();
  sub_23E1BE060();
  v29 = sub_23E1BE060();
  v30 = v20;
  v31 = v14;
  v32 = v11;
  v34 = (uint64_t)v39;
  v33 = v40;
  v35 = (uint64_t)v38;
  if (v29 != v27)
    v28 = sub_23E1BE060();
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 16))(v34, v24, v32);
  v36 = v34 + *(int *)(v31 + 36);
  *(_BYTE *)v36 = v28;
  *(_OWORD *)(v36 + 8) = 0u;
  *(_OWORD *)(v36 + 24) = 0u;
  *(_BYTE *)(v36 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v32);
  sub_23E1A82D0(v34, v35);
  sub_23E1A82D0(v35, v30);
  return __swift_storeEnumTagSinglePayload(v30, 0, 1, v31);
}

void sub_23E1A7614(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + *(int *)(type metadata accessor for CallToActionView() + 20));
  if (v1)
  {
    type metadata accessor for CallToActionSnippetModel();
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    v3 = (id)sub_23E1BDD60();
    sub_23E1BE3FC();

  }
  else
  {
    sub_23E1BE408();
    sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_23E1BDEF8();
    __break(1u);
  }
}

void sub_23E1A76D8()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_256D34828 != -1)
    swift_once();
  type metadata accessor for CallToActionView();
  sub_23E1BE528();
  sub_23E1BDE14();
  if (qword_256D34820 != -1)
    swift_once();
  v0 = sub_23E1BDE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  v1._countAndFlagsBits = 0xD000000000000069;
  v2._object = (void *)0x800000023E1C2EB0;
  v1._object = (void *)0x800000023E1C2E20;
  v2._countAndFlagsBits = 0xD00000000000002BLL;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_23E1A7808(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CallToActionSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E1A7848(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CallToActionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E1A788C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_1_7();
  v3 = OUTLINED_FUNCTION_9_1(v2);
  return sub_23E1A7228(v3, a1);
}

unint64_t sub_23E1A78B4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256D359E0;
  if (!qword_256D359E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D359D8);
    v2 = sub_23E1A7918();
    result = MEMORY[0x24264D408](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D359E0);
  }
  return result;
}

unint64_t sub_23E1A7918()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  result = qword_256D359E8;
  if (!qword_256D359E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D359F0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35338);
    v3 = sub_23E1BE30C();
    v4 = (void (*)(uint64_t))MEMORY[0x24BEADB88];
    sub_23E18819C(&qword_256D35340, &qword_256D35338);
    v6 = v5;
    sub_23E187EEC(&qword_256D359F8, v4);
    v8[2] = v2;
    v8[3] = v3;
    v8[4] = v6;
    v8[5] = v7;
    v8[0] = swift_getOpaqueTypeConformance2();
    v8[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v8);
    atomic_store(result, (unint64_t *)&qword_256D359E8);
  }
  return result;
}

uint64_t sub_23E1A7A0C()
{
  return sub_23E1A82A8((uint64_t (*)(uint64_t))sub_23E1A76D8);
}

uint64_t sub_23E1A7A18()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for CallToActionView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  id v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for CallToActionSnippetModel();
    v9 = *(int *)(v8 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    *((_BYTE *)a1 + *(int *)(v8 + 24)) = *((_BYTE *)a2 + *(int *)(v8 + 24));
    v13 = *(int *)(a3 + 20);
    v14 = *(int *)(a3 + 24);
    v15 = (_QWORD *)((char *)a1 + v13);
    v16 = (char *)a2 + v13;
    v18 = *(void **)v16;
    v17 = *((_QWORD *)v16 + 1);
    *v15 = v18;
    v15[1] = v17;
    v19 = (char *)a1 + v14;
    v20 = (char *)a2 + v14;
    v21 = sub_23E1BDE38();
    v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
    v23 = v18;
    v22(v19, v20, v21);
  }
  return a1;
}

uint64_t destroy for CallToActionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  v7 = a1 + *(int *)(a2 + 24);
  v8 = sub_23E1BDE38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  id v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = type metadata accessor for CallToActionSnippetModel();
  v8 = *(int *)(v7 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  *(_BYTE *)(a1 + *(int *)(v7 + 24)) = *(_BYTE *)(a2 + *(int *)(v7 + 24));
  v12 = *(int *)(a3 + 20);
  v13 = *(int *)(a3 + 24);
  v14 = (_QWORD *)(a1 + v12);
  v15 = a2 + v12;
  v17 = *(void **)v15;
  v16 = *(_QWORD *)(v15 + 8);
  *v14 = v17;
  v14[1] = v16;
  v18 = a1 + v13;
  v19 = a2 + v13;
  v20 = sub_23E1BDE38();
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
  v22 = v17;
  v21(v18, v19, v20);
  return a1;
}

uint64_t assignWithCopy for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for CallToActionSnippetModel();
  v8 = *(int *)(v7 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  *(_BYTE *)(a1 + *(int *)(v7 + 24)) = *(_BYTE *)(a2 + *(int *)(v7 + 24));
  v12 = *(int *)(a3 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = a2 + v12;
  v15 = *(void **)(a1 + v12);
  v16 = *(void **)(a2 + v12);
  *v13 = v16;
  v17 = v16;

  v13[1] = *(_QWORD *)(v14 + 8);
  v18 = *(int *)(a3 + 24);
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

uint64_t initializeWithTake for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for CallToActionSnippetModel();
  v8 = *(int *)(v7 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  *(_BYTE *)(a1 + *(int *)(v7 + 24)) = *(_BYTE *)(a2 + *(int *)(v7 + 24));
  v12 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for CallToActionSnippetModel();
  v8 = *(int *)(v7 + 20);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  *(_BYTE *)(a1 + *(int *)(v7 + 24)) = *(_BYTE *)(a2 + *(int *)(v7 + 24));
  v12 = *(int *)(a3 + 20);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  v15 = *(void **)(a1 + v12);
  *v13 = *v14;

  v13[1] = v14[1];
  v16 = *(int *)(a3 + 24);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for CallToActionView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1A7F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 2147483646)
  {
    v7 = OUTLINED_FUNCTION_11_1();
    v8 = v4 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for CallToActionView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1A803C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_4_8();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20)) = v4;
      return result;
    }
    v9 = OUTLINED_FUNCTION_11_1();
    v10 = v5 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t sub_23E1A80C4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for CallToActionSnippetModel();
  if (v1 <= 0x3F)
  {
    result = sub_23E1BDE38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23E1A8154()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D35AA0;
  if (!qword_256D35AA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35A00);
    sub_23E18819C(&qword_256D35AA8, &qword_256D359D0);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D35AA0);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  void (*v8)(uint64_t);

  v1 = OUTLINED_FUNCTION_1_7();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_5_3();
  v4(v3);
  v5 = v3 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  OUTLINED_FUNCTION_5_3();
  v6(v5);

  v7 = v3 + *(int *)(v1 + 24);
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_5_3();
  v8(v7);
  return swift_deallocObject();
}

uint64_t sub_23E1A829C()
{
  return sub_23E1A82A8((uint64_t (*)(uint64_t))sub_23E1A7614);
}

uint64_t sub_23E1A82A8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_1_7();
  v2 = OUTLINED_FUNCTION_9_1(v1);
  return a1(v2);
}

uint64_t sub_23E1A82D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D359F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return type metadata accessor for CallToActionView();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return type metadata accessor for CallToActionSnippetModel();
}

uint64_t OUTLINED_FUNCTION_9_8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_23E1A7848(v2, a1 + v1);
}

uint64_t static ColorUtils.fromString(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  Swift::Bool v13;
  Swift::String v14;
  uint64_t v15;
  Swift::String v16;
  Swift::Bool v17;
  Swift::String v18;
  uint64_t v20;

  v0 = sub_23E1BDE50();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v20 - v5;
  v7 = sub_23E1BE444();
  v9 = v8;
  if (qword_256D34838 != -1)
    swift_once();
  v10 = qword_256D3AF50;
  swift_bridgeObjectRetain();
  sub_23E1A8EC4(v7, v9, v10);
  OUTLINED_FUNCTION_16_3();
  if (v10)
  {
    swift_bridgeObjectRelease();
    if (qword_256D34820 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v11, v0);
    OUTLINED_FUNCTION_7_5();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_9((uint64_t)"Icon color converted from ");
    OUTLINED_FUNCTION_10_7();
    sub_23E1BE180();
    OUTLINED_FUNCTION_17_6();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_2_9();
    OUTLINED_FUNCTION_20_7();
    Logger.debug(output:test:caller:)(v12, v13, v14);
  }
  else
  {
    sub_23E1A8F48();
    OUTLINED_FUNCTION_16_3();
    if (qword_256D34820 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v15, v0);
    OUTLINED_FUNCTION_7_5();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_9((uint64_t)"Icon color converted from ");
    OUTLINED_FUNCTION_10_7();
    sub_23E1BE180();
    OUTLINED_FUNCTION_17_6();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_2_9();
    OUTLINED_FUNCTION_20_7();
    Logger.debug(output:test:caller:)(v16, v17, v18);
    v6 = v4;
  }
  OUTLINED_FUNCTION_9_2();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v10;
}

uint64_t sub_23E1A85AC(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      sub_23E1BE204();
      break;
    case 1:
      sub_23E1BE21C();
      break;
    case 2:
      sub_23E1BE21C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D35248);
      sub_23E1A9384();
      break;
    case 3:
      if (qword_256D34840 != -1)
        swift_once();
      goto LABEL_8;
    default:
LABEL_8:
      swift_retain();
      break;
  }
  return sub_23E1BDEE0();
}

uint64_t SnippetRenderingMode.toUIMode()()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)&sub_23E1A869C + 4 * byte_23E1C0464[*v0]))();
}

uint64_t static ColorUtils.getColor(colorString:colorDict:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  Swift::String v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  char v21;
  char v22;
  char v23;
  char v24;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;

  v7 = sub_23E1BE18C();
  v28 = *(_QWORD *)(v7 - 8);
  v29 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v30 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23E1BDE50();
  OUTLINED_FUNCTION_11_5();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v31 = (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - v13;
  if (qword_256D34820 != -1)
    swift_once();
  __swift_project_value_buffer(v9, (uint64_t)qword_256D3AF00);
  OUTLINED_FUNCTION_19_9((uint64_t)v14);
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v35._countAndFlagsBits = 0xD000000000000015;
  v35._object = (void *)0x800000023E1C2F70;
  v32 = a1;
  v33 = a1;
  v34 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  sub_23E1BE438();
  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_2_9();
  v15._object = (void *)0x800000023E1C2F00;
  v15._countAndFlagsBits = 0xD000000000000069;
  Logger.debug(output:test:caller:)(v35, 0, v15);
  OUTLINED_FUNCTION_9_2();
  v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v14, v9);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((sub_23E1BE4A4() & 1) != 0)
    {
      v17 = sub_23E1BE174();
      if (v17)
      {
        v18 = v17;
        v19 = v31;
        OUTLINED_FUNCTION_19_9(v31);
        v35._countAndFlagsBits = 0;
        v35._object = (void *)0xE000000000000000;
        sub_23E1BE5B8();
        swift_bridgeObjectRelease();
        v35._countAndFlagsBits = 0xD000000000000013;
        v35._object = (void *)0x800000023E1C2F90;
        sub_23E1BE180();
        sub_23E1BE480();
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_2_9();
        v20._object = (void *)0x800000023E1C2F00;
        v20._countAndFlagsBits = 0xD000000000000069;
        Logger.debug(output:test:caller:)(v35, 0, v20);
        OUTLINED_FUNCTION_31();
        v16((char *)v19, v9);
        return v18;
      }
    }
    else
    {
      OUTLINED_FUNCTION_31();
    }
  }
  if (a3)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_5_6(114);
    if ((v21 & 1) != 0 || (OUTLINED_FUNCTION_5_6(103), (v22 & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_5_6(98);
      v24 = v23;
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
      {
        (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v30, *MEMORY[0x24BDF3C28], v29);
        OUTLINED_FUNCTION_1_8();
      }
    }
  }
  if (a2)
    return static ColorUtils.fromString(_:)();
  else
    return sub_23E1BE234();
}

uint64_t SnippetHomeDeviceType.onStateColorOverride.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  int v2;

  v2 = *v1;
  switch(v2)
  {
    case 18:
      sub_23E1BE1C8();
      OUTLINED_FUNCTION_14_8();
      sub_23E1BE1C8();
      break;
    case 35:
      v0 = sub_23E1BE21C();
      sub_23E1BE1E0();
      sub_23E1BE1E0();
      break;
    case 39:
      sub_23E1BE1BC();
      OUTLINED_FUNCTION_14_8();
      sub_23E1BE1BC();
      break;
    default:
      return 0;
  }
  return v0;
}

uint64_t SnippetHomeDeviceType.offStateColorOverride.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  int v2;

  v2 = *v1;
  switch(v2)
  {
    case 18:
      sub_23E1BE1C8();
      OUTLINED_FUNCTION_14_8();
      sub_23E1BE1C8();
      break;
    case 35:
      v0 = sub_23E1BE21C();
      if (qword_256D34840 != -1)
        swift_once();
      swift_retain();
      sub_23E1BE1BC();
      break;
    case 39:
      sub_23E1BE21C();
      v0 = sub_23E1BE258();
      swift_release();
      sub_23E1BE204();
      sub_23E1BE21C();
      sub_23E1BE258();
      OUTLINED_FUNCTION_18_6();
      break;
    default:
      return 0;
  }
  return v0;
}

void SnippetHomeDeviceType.onStateModeOverride.getter(char *a1@<X8>)
{
  unsigned __int8 *v1;
  int v2;
  char v3;
  char v4;

  v2 = *v1;
  if (v2 == 35)
    v3 = 2;
  else
    v3 = 4;
  if (v2 == 39)
    v4 = 0;
  else
    v4 = v3;
  *a1 = v4;
}

void SnippetHomeDeviceType.offStateModeOverride.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = 4 * (((*v1 - 35) & 0xFB) != 0);
}

uint64_t sub_23E1A8BD8()
{
  uint64_t inited;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AB8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23E1C0490;
  *(_QWORD *)(inited + 32) = 0x6B63616C62;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = sub_23E1BE1EC();
  *(_QWORD *)(inited + 56) = 1702194274;
  *(_QWORD *)(inited + 64) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = sub_23E1BE1A4();
  *(_QWORD *)(inited + 80) = 0x6E776F7262;
  *(_QWORD *)(inited + 88) = 0xE500000000000000;
  *(_QWORD *)(inited + 96) = sub_23E1BE1F8();
  *(_QWORD *)(inited + 104) = 0x7261656C63;
  *(_QWORD *)(inited + 112) = 0xE500000000000000;
  *(_QWORD *)(inited + 120) = sub_23E1BE204();
  *(_QWORD *)(inited + 128) = 1851881827;
  *(_QWORD *)(inited + 136) = 0xE400000000000000;
  *(_QWORD *)(inited + 144) = sub_23E1BE1B0();
  *(_QWORD *)(inited + 152) = 2036429415;
  *(_QWORD *)(inited + 160) = 0xE400000000000000;
  *(_QWORD *)(inited + 168) = sub_23E1BE1BC();
  *(_QWORD *)(inited + 176) = 0x6E65657267;
  *(_QWORD *)(inited + 184) = 0xE500000000000000;
  *(_QWORD *)(inited + 192) = sub_23E1BE210();
  *(_QWORD *)(inited + 200) = 0x6F6769646E69;
  *(_QWORD *)(inited + 208) = 0xE600000000000000;
  *(_QWORD *)(inited + 216) = sub_23E1BE228();
  *(_QWORD *)(inited + 224) = 1953393005;
  *(_QWORD *)(inited + 232) = 0xE400000000000000;
  *(_QWORD *)(inited + 240) = sub_23E1BE1C8();
  *(_QWORD *)(inited + 248) = 0x65676E61726FLL;
  *(_QWORD *)(inited + 256) = 0xE600000000000000;
  *(_QWORD *)(inited + 264) = sub_23E1BE234();
  *(_QWORD *)(inited + 272) = 1802398064;
  *(_QWORD *)(inited + 280) = 0xE400000000000000;
  *(_QWORD *)(inited + 288) = sub_23E1BE1D4();
  *(_QWORD *)(inited + 296) = 0x7972616D697270;
  *(_QWORD *)(inited + 304) = 0xE700000000000000;
  *(_QWORD *)(inited + 312) = sub_23E1BE264();
  *(_QWORD *)(inited + 320) = 0x656C70727570;
  *(_QWORD *)(inited + 328) = 0xE600000000000000;
  *(_QWORD *)(inited + 336) = sub_23E1BE240();
  *(_QWORD *)(inited + 344) = 6579570;
  *(_QWORD *)(inited + 352) = 0xE300000000000000;
  *(_QWORD *)(inited + 360) = sub_23E1BE198();
  *(_QWORD *)(inited + 368) = 1818322292;
  *(_QWORD *)(inited + 376) = 0xE400000000000000;
  *(_QWORD *)(inited + 384) = sub_23E1BE1E0();
  *(_QWORD *)(inited + 392) = 0x7261646E6F636573;
  *(_QWORD *)(inited + 400) = 0xE900000000000079;
  *(_QWORD *)(inited + 408) = sub_23E1BE270();
  *(_QWORD *)(inited + 416) = 0x6574696877;
  *(_QWORD *)(inited + 424) = 0xE500000000000000;
  *(_QWORD *)(inited + 432) = sub_23E1BE21C();
  *(_QWORD *)(inited + 440) = 0x776F6C6C6579;
  *(_QWORD *)(inited + 448) = 0xE600000000000000;
  *(_QWORD *)(inited + 456) = sub_23E1BE24C();
  result = sub_23E1BE414();
  qword_256D3AF50 = result;
  return result;
}

void static ColorUtils.fromRGBDictionary(_:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_11_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_19_1();
  if (v0)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_0_6(114);
    if ((v2 & 1) != 0 || (OUTLINED_FUNCTION_0_6(103), (v3 & 1) != 0))
    {
      OUTLINED_FUNCTION_26();
    }
    else
    {
      OUTLINED_FUNCTION_0_6(98);
      v5 = v4;
      v6 = OUTLINED_FUNCTION_26();
      if ((v5 & 1) == 0)
      {
        OUTLINED_FUNCTION_8_6(v6, *MEMORY[0x24BDF3C28]);
        OUTLINED_FUNCTION_1_8();
      }
    }
  }
  OUTLINED_FUNCTION_3_6();
}

uint64_t sub_23E1A8EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_23E1A9240(a1, a2), (v3 & 1) != 0))
    return swift_retain();
  else
    return 0;
}

uint64_t sub_23E1A8F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a3 + 16) && (v4 = sub_23E1A9240(a1, a2), (v5 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v4);
  else
    return 0;
}

uint64_t sub_23E1A8F48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v13;

  if (qword_256D34838 == -1)
    goto LABEL_2;
LABEL_28:
  swift_once();
LABEL_2:
  v0 = qword_256D3AF50;
  v1 = qword_256D3AF50 + 64;
  v2 = 1 << *(_BYTE *)(qword_256D3AF50 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(qword_256D3AF50 + 64);
  v13 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  v5 = 0;
  if (v4)
  {
LABEL_5:
    v6 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v7 = v6 | (v5 << 6);
    goto LABEL_20;
  }
  while (1)
  {
    v8 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    if (v8 >= v13)
      goto LABEL_24;
    v9 = *(_QWORD *)(v1 + 8 * v8);
    ++v5;
    if (!v9)
    {
      v5 = v8 + 1;
      if (v8 + 1 >= v13)
        goto LABEL_24;
      v9 = *(_QWORD *)(v1 + 8 * v5);
      if (!v9)
      {
        v5 = v8 + 2;
        if (v8 + 2 >= v13)
          goto LABEL_24;
        v9 = *(_QWORD *)(v1 + 8 * v5);
        if (!v9)
          break;
      }
    }
LABEL_19:
    v4 = (v9 - 1) & v9;
    v7 = __clz(__rbit64(v9)) + (v5 << 6);
LABEL_20:
    v11 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 8 * v7);
    sub_23E193EE8();
    swift_retain();
    if ((sub_23E1BE5AC() & 1) != 0)
    {
      OUTLINED_FUNCTION_18_6();
      return v11;
    }
    swift_release();
    if (v4)
      goto LABEL_5;
  }
  v10 = v8 + 3;
  if (v10 < v13)
  {
    v9 = *(_QWORD *)(v1 + 8 * v10);
    if (!v9)
    {
      while (1)
      {
        v5 = v10 + 1;
        if (__OFADD__(v10, 1))
          goto LABEL_27;
        if (v5 >= v13)
          goto LABEL_24;
        v9 = *(_QWORD *)(v1 + 8 * v5);
        ++v10;
        if (v9)
          goto LABEL_19;
      }
    }
    v5 = v10;
    goto LABEL_19;
  }
LABEL_24:
  OUTLINED_FUNCTION_18_6();
  return sub_23E1BE1EC();
}

void Color.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_11_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_19_1();
  if (v0)
  {
    OUTLINED_FUNCTION_0_6(114);
    if ((v2 & 1) != 0 || (OUTLINED_FUNCTION_0_6(103), (v3 & 1) != 0))
    {
      OUTLINED_FUNCTION_26();
    }
    else
    {
      OUTLINED_FUNCTION_0_6(98);
      v5 = v4;
      v6 = OUTLINED_FUNCTION_26();
      if ((v5 & 1) == 0)
      {
        OUTLINED_FUNCTION_8_6(v6, *MEMORY[0x24BDF3C28]);
        OUTLINED_FUNCTION_1_8();
      }
    }
  }
  OUTLINED_FUNCTION_3_6();
}

uint64_t sub_23E1A91F0()
{
  uint64_t v0;
  uint64_t result;

  sub_23E1BE1EC();
  v0 = sub_23E1BE258();
  result = swift_release();
  qword_256D3AF58 = v0;
  return result;
}

ValueMetadata *type metadata accessor for ColorUtils()
{
  return &type metadata for ColorUtils;
}

unint64_t sub_23E1A9240(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23E1BE6CC();
  sub_23E1BE45C();
  v4 = sub_23E1BE6E4();
  return sub_23E1A92A4(a1, a2, v4);
}

unint64_t sub_23E1A92A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23E1BE6B4() & 1) == 0)
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
      while (!v14 && (sub_23E1BE6B4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23E1A9384()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D35250;
  if (!qword_256D35250)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35248);
    result = MEMORY[0x24264D408](MEMORY[0x24BDF0F90], v1);
    atomic_store(result, (unint64_t *)&qword_256D35250);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6(uint64_t a1)
{
  uint64_t v1;

  return sub_23E1A8F04(a1, 0xE100000000000000, v1);
}

void OUTLINED_FUNCTION_1_8()
{
  JUMPOUT(0x24264CCD0);
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_4_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = (a1 - 32) | 0x8000000000000000;
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_5_6(uint64_t a1)
{
  uint64_t v1;

  return sub_23E1A8F04(a1, 0xE100000000000000, v1);
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
  return sub_23E1BE5B8();
}

uint64_t OUTLINED_FUNCTION_8_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_14_8()
{
  return sub_23E1BE204();
}

uint64_t OUTLINED_FUNCTION_15_7()
{
  return sub_23E1BE18C();
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_18_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_19_9(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

void CompletionView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;

  v4 = sub_23E1BDE50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)OUTLINED_FUNCTION_9_9();
  v9 = (uint64_t *)(a2 + v8[5]);
  OUTLINED_FUNCTION_31_4();
  sub_23E180C20(&qword_256D349F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *v9 = sub_23E1BDF04();
  v9[1] = v10;
  v11 = (uint64_t *)(a2 + v8[8]);
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  OUTLINED_FUNCTION_17_7();
  sub_23E180B78(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetModel);
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  sub_23E1BDDCC();
  v12 = a2 + v8[6];
  *(_BYTE *)v12 = v17._countAndFlagsBits;
  *(_QWORD *)(v12 + 8) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  sub_23E1BDDCC();
  v13 = a2 + v8[7];
  *(_BYTE *)v13 = (LOBYTE(v17._countAndFlagsBits) == 2) | v17._countAndFlagsBits & 1;
  *(_QWORD *)(v13 + 8) = 0;
  if (qword_256D34828 != -1)
    swift_once();
  v14 = (id)qword_256D3AF18;
  sub_23E1BDE2C();
  sub_23E1BE534();
  sub_23E1BDE20();
  if (qword_256D34820 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v4, (uint64_t)qword_256D3AF00);
  OUTLINED_FUNCTION_27_5((uint64_t)v7, v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0xD00000000000002FLL;
  v17._object = (void *)0x800000023E1C2FD0;
  CompletionSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0xD000000000000067;
  v16._object = (void *)0x800000023E1C3000;
  Logger.debug(output:test:caller:)(v17, 0, v16);
  swift_bridgeObjectRelease();
  sub_23E187F20(a1, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetModel);
  OUTLINED_FUNCTION_12_1((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_14_9();
}

uint64_t type metadata accessor for CompletionView()
{
  uint64_t result;

  result = qword_256D35B88;
  if (!qword_256D35B88)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E1A97C4()
{
  sub_23E1BDF28();
  OUTLINED_FUNCTION_9();
}

void sub_23E1A97E0()
{
  sub_23E1BDF28();
  OUTLINED_FUNCTION_9();
}

void sub_23E1A97FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23E1BDEB0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  sub_23E1BDF34();
  OUTLINED_FUNCTION_2_0();
}

void CompletionView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
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
  unint64_t v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (**v52)();
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  int v61;
  int v62;
  unsigned __int8 v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  char v68;
  uint64_t v69;
  uint64_t KeyPath;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  char v110[8];
  _OWORD v111[2];
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  v2 = v1;
  v103 = a1;
  v89 = sub_23E1BE3C0();
  v88 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_7(v3);
  v92 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_256D35AC0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_7(v5);
  v94 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_256D35AC8);
  v93 = *((_QWORD *)v94 - 1);
  MEMORY[0x24BDAC7A8](v94);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_7(v6);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AD0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3();
  v102 = v8;
  type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_7(v10);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AD8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_2();
  v84 = v12;
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_5_7((uint64_t)&v81 - v14);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3();
  v97 = v16;
  v87 = OUTLINED_FUNCTION_9_9();
  v99 = *(_QWORD *)(v87 - 8);
  v17 = *(_QWORD *)(v99 + 64);
  MEMORY[0x24BDAC7A8](v87);
  v81 = type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_7(v19);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AE8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_2();
  v82 = v21;
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_5_7((uint64_t)&v81 - v23);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35AF0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_7(v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v81 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v81 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v81 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v81 - v37;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32) == 1)
  {
    sub_23E18829C((uint64_t)v31, &qword_256D34E20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    OUTLINED_FUNCTION_26_4();
    v39 = MEMORY[0x24BEE0D00];
    v40 = MEMORY[0x24BEAE5B8];
    v119 = MEMORY[0x24BEE0D00];
    v120 = MEMORY[0x24BEAE5B8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    sub_23E1BDDCC();
    v41 = v113;
    v42 = v114;
    v115 = v39;
    v116 = v40;
    if (!v114)
    {
      v41 = 0;
      v42 = 0xE000000000000000;
    }
    v113 = v41;
    v114 = v42;
    v112 = 0;
    memset(v111, 0, sizeof(v111));
    v109 = 0;
    v107 = 0u;
    v108 = 0u;
    v106 = 0;
    v105 = 0u;
    v104 = 0u;
    v43 = v86;
    sub_23E1BE3B4();
    v44 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_23E180B78(v2, (uint64_t)v44, (uint64_t (*)(_QWORD))type metadata accessor for CompletionView);
    v45 = (*(unsigned __int8 *)(v99 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80);
    v99 = v45 + v17;
    v46 = swift_allocObject();
    sub_23E180B4C((uint64_t)v44, v46 + v45, (uint64_t (*)(_QWORD))type metadata accessor for CompletionView);
    v47 = v43;
    v48 = v2;
    v49 = v88;
    v50 = v90;
    OUTLINED_FUNCTION_27_5(v90, v47, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 16));
    v51 = (uint64_t)v92;
    v52 = (void (**)())(v50 + *((int *)v92 + 9));
    *v52 = sub_23E1AA8BC;
    v52[1] = (void (*)())v46;
    v52[2] = 0;
    v52[3] = 0;
    OUTLINED_FUNCTION_12_1(v47, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
    sub_23E180B78(v48, (uint64_t)v44, (uint64_t (*)(_QWORD))type metadata accessor for CompletionView);
    v53 = swift_allocObject();
    sub_23E180B4C((uint64_t)v44, v53 + v45, (uint64_t (*)(_QWORD))type metadata accessor for CompletionView);
    v54 = sub_23E1AA900();
    v55 = v91;
    sub_23E1BE0FC();
    swift_release();
    sub_23E18829C(v50, &qword_256D35AC0);
    v117 = v51;
    v118 = v54;
    swift_getOpaqueTypeConformance2();
    v56 = v94;
    v57 = sub_23E1BE0D8();
    (*(void (**)(uint64_t, char *))(v93 + 8))(v55, v56);
    *v102 = v57;
    OUTLINED_FUNCTION_34_2();
    sub_23E1AA984();
    OUTLINED_FUNCTION_28_5();
  }
  else
  {
    v93 = v17;
    v94 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_23E180B4C((uint64_t)v31, (uint64_t)v38, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    sub_23E180B78((uint64_t)v38, (uint64_t)v36, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    OUTLINED_FUNCTION_26_4();
    v92 = (char *)v117;
    v91 = v118;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_25_4();
    v58 = v117;
    if (!v118)
      v58 = 0;
    v90 = v58;
    v59 = 0xE000000000000000;
    if (v118)
      v59 = v118;
    v89 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    OUTLINED_FUNCTION_25_4();
    v60 = v117 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    OUTLINED_FUNCTION_25_4();
    v61 = v117;
    OUTLINED_FUNCTION_21_7();
    v62 = v117;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    sub_23E1BDDCC();
    OUTLINED_FUNCTION_21_7();
    v63 = v117;
    type metadata accessor for SnippetDetailsModel();
    swift_allocObject();
    v64 = sub_23E1AC010((uint64_t)v36, (uint64_t)v92, v91, v90, v89, v60, v61, v62, (uint64_t)v28, v63);
    v65 = *(void **)(v1 + *(int *)(v87 + 20));
    if (v65)
    {
      v66 = v64;
      v92 = v38;
      v67 = v65;
      sub_23E1BE3E4();

      v68 = sub_23E1BE54C();
      v69 = (uint64_t)v102;
      if ((v68 & 1) != 0)
      {
        KeyPath = swift_getKeyPath();
        v38 = (char *)v81;
        v71 = v83;
        *(_QWORD *)(v83 + *(int *)(v81 + 24)) = KeyPath;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
        OUTLINED_FUNCTION_17_7();
        *(_QWORD *)v71 = OUTLINED_FUNCTION_13_3;
        *(_QWORD *)(v71 + 8) = v66;
        *(_BYTE *)(v71 + 16) = 0;
        OUTLINED_FUNCTION_31_4();
        sub_23E180C20(&qword_256D349F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
        swift_retain();
        *(_QWORD *)(v71 + 24) = sub_23E1BDF04();
        *(_QWORD *)(v71 + 32) = v72;
        v73 = v71 + *((int *)v38 + 7);
        LOBYTE(v113) = 0;
        sub_23E1BE2A0();
        v74 = v118;
        *(_BYTE *)v73 = v117;
        *(_QWORD *)(v73 + 8) = v74;
        OUTLINED_FUNCTION_11_6(v2);
        OUTLINED_FUNCTION_4_10();
        v75 = swift_allocObject();
        OUTLINED_FUNCTION_13_7(v75);
        v76 = v82;
        OUTLINED_FUNCTION_11_6(v71);
        OUTLINED_FUNCTION_10_8((_QWORD *)(v76 + *(int *)(v95 + 36)));
        v77 = &qword_256D35AE8;
        OUTLINED_FUNCTION_15_8(v76, (uint64_t)v110);
        OUTLINED_FUNCTION_35_1(v71, v97);
        OUTLINED_FUNCTION_17_7();
      }
      else
      {
        v78 = swift_retain();
        v71 = v85;
        sub_23E18E450(v78, v85);
        OUTLINED_FUNCTION_11_6(v2);
        OUTLINED_FUNCTION_4_10();
        v79 = swift_allocObject();
        OUTLINED_FUNCTION_13_7(v79);
        v80 = v84;
        sub_23E180B78(v71, v84, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetView);
        OUTLINED_FUNCTION_10_8((_QWORD *)(v80 + *(int *)(v98 + 36)));
        v77 = &qword_256D35AD8;
        OUTLINED_FUNCTION_15_8(v80, (uint64_t)v111);
        OUTLINED_FUNCTION_35_1(v71, v97);
        OUTLINED_FUNCTION_34_2();
      }
      sub_23E1AA9F0();
      sub_23E1AAA74();
      OUTLINED_FUNCTION_23_6();
      sub_23E1BE018();
      sub_23E18829C(v71, v77);
      OUTLINED_FUNCTION_35_1((uint64_t)v38, v69);
      OUTLINED_FUNCTION_17_7();
      sub_23E1AA984();
      OUTLINED_FUNCTION_28_5();
      swift_release();
      sub_23E18829C((uint64_t)v38, &qword_256D35AF0);
      sub_23E187F20((uint64_t)v92, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    }
    else
    {
      OUTLINED_FUNCTION_31_4();
      sub_23E180C20(&qword_256D349F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
      sub_23E1BDEF8();
      __break(1u);
    }
  }
}

void sub_23E1AA38C()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_256D34828 != -1)
    swift_once();
  type metadata accessor for CompletionView();
  sub_23E1BE528();
  sub_23E1BDE14();
  if (qword_256D34820 != -1)
    swift_once();
  v0 = sub_23E1BDE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  v1._countAndFlagsBits = 0xD000000000000067;
  v2._object = (void *)0x800000023E1C3070;
  v1._object = (void *)0x800000023E1C3000;
  v2._countAndFlagsBits = 0xD00000000000002CLL;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

void sub_23E1AA4B8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;

  v4 = sub_23E1BDE50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_7_1();
  if (qword_256D34828 != -1)
    swift_once();
  OUTLINED_FUNCTION_9_9();
  sub_23E1BE528();
  sub_23E1BDE14();
  if (qword_256D34820 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v4, (uint64_t)qword_256D3AF00);
  OUTLINED_FUNCTION_27_5(v2, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  CompletionSnippetModel.description.getter();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0xD000000000000030;
  v8._countAndFlagsBits = 0xD000000000000067;
  v8._object = (void *)0x800000023E1C3000;
  v7._object = a2;
  Logger.debug(output:test:caller:)(v7, 0, v8);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_1(v2, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_14_9();
}

void sub_23E1AA668(uint64_t a1)
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
  void (*v12)(char *, uint64_t);
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v18 - v6;
  v8 = sub_23E1BDD0C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v8) == 1)
  {
    sub_23E18829C((uint64_t)v5, &qword_256D34CE0);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
LABEL_4:
    sub_23E18829C((uint64_t)v7, &qword_256D34CE0);
    return;
  }
  sub_23E1BDCDC();
  v12 = *(void (**)(char *, uint64_t))(v9 + 8);
  v12(v5, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
    goto LABEL_4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  v14 = (void *)sub_23E1BDCF4();
  objc_msgSend(v13, sel_setPunchOutUri_, v14);

  v15 = *(void **)(a1 + *(int *)(type metadata accessor for CompletionView() + 20));
  if (v15)
  {
    v16 = v15;
    v17 = v13;
    sub_23E1BE3F0();

    v12(v11, v8);
  }
  else
  {
    sub_23E1BE408();
    sub_23E180C20(&qword_256D349F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    sub_23E1BDEF8();
    __break(1u);
  }
}

void sub_23E1AA8BC()
{
  OUTLINED_FUNCTION_8_7((uint64_t)"Rendering default since no icon config present. ");
}

uint64_t sub_23E1AA8CC()
{
  return sub_23E1AA8D8((uint64_t (*)(uint64_t))sub_23E1AA668);
}

uint64_t sub_23E1AA8D8(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_9_9();
  v2 = OUTLINED_FUNCTION_9_1(v1);
  return a1(v2);
}

unint64_t sub_23E1AA900()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D35AF8;
  if (!qword_256D35AF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35AC0);
    sub_23E180C20(&qword_256D35B00, (uint64_t (*)(uint64_t))MEMORY[0x24BEADFF8], MEMORY[0x24BEADFE0]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D35AF8);
  }
  return result;
}

unint64_t sub_23E1AA984()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D35B08;
  if (!qword_256D35B08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35AF0);
    v2[0] = sub_23E1AA9F0();
    v2[1] = sub_23E1AAA74();
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D35B08);
  }
  return result;
}

unint64_t sub_23E1AA9F0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D35B10;
  if (!qword_256D35B10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35AE8);
    sub_23E180C20(&qword_256D35B18, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetViewTVOS, (uint64_t)&protocol conformance descriptor for CompletionSnippetViewTVOS);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D35B10);
  }
  return result;
}

unint64_t sub_23E1AAA74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D35B20;
  if (!qword_256D35B20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35AD8);
    sub_23E180C20(&qword_256D35B28, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetView, (uint64_t)&protocol conformance descriptor for CompletionSnippetView);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D35B20);
  }
  return result;
}

void sub_23E1AAAFC()
{
  OUTLINED_FUNCTION_8_7((uint64_t)"Completed rendering general completion snippet. ");
}

void sub_23E1AAB08(void *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_9_9();
  v3 = OUTLINED_FUNCTION_9_1(v2);
  sub_23E1AA4B8(v3, a1);
  OUTLINED_FUNCTION_9();
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = OUTLINED_FUNCTION_9_9();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (int *)OUTLINED_FUNCTION_12_10();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_2_4(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_2_4(v7);
  v8 = v3 + v5[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_22_4(v8);
  OUTLINED_FUNCTION_22_4(v3 + v5[8]);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  OUTLINED_FUNCTION_2_4(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  OUTLINED_FUNCTION_2_4(v10);
  OUTLINED_FUNCTION_22_4(v3 + v5[11]);

  OUTLINED_FUNCTION_29_2();
  OUTLINED_FUNCTION_29_2();
  v11 = v3 + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_23E1BDEB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  v13 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_13_0(v13);
  return swift_deallocObject();
}

uint64_t sub_23E1AACE4()
{
  return sub_23E1AA8D8((uint64_t (*)(uint64_t))sub_23E1AA38C);
}

void sub_23E1AACF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_10_0(a1, a2, a3);
  OUTLINED_FUNCTION_13(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_9();
}

void sub_23E1AAD1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_10_0(a1, a2, a3);
  OUTLINED_FUNCTION_13(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1AAD48()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for CompletionView(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v46 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v46 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for CompletionSnippetModel();
    v9 = v8[5];
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = v8[6];
    v14 = &a1[v13];
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = v8[7];
    v18 = &a1[v17];
    v19 = (char *)a2 + v17;
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21(&a1[v8[8]], (char *)a2 + v8[8], v20);
    v22 = v8[9];
    v23 = &a1[v22];
    v24 = (char *)a2 + v22;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    v26 = v8[10];
    v27 = &a1[v26];
    v28 = (char *)a2 + v26;
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
    v21(&a1[v8[11]], (char *)a2 + v8[11], v20);
    v30 = a3[5];
    v31 = a3[6];
    v32 = &a1[v30];
    v33 = (char *)a2 + v30;
    v35 = *(void **)v33;
    v34 = *((_QWORD *)v33 + 1);
    *(_QWORD *)v32 = v35;
    *((_QWORD *)v32 + 1) = v34;
    v36 = &a1[v31];
    v37 = (char *)a2 + v31;
    *v36 = *v37;
    *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
    v38 = a3[7];
    v39 = a3[8];
    v40 = &a1[v38];
    v41 = (char *)a2 + v38;
    *v40 = *v41;
    *((_QWORD *)v40 + 1) = *((_QWORD *)v41 + 1);
    v42 = &a1[v39];
    v43 = (uint64_t *)((char *)a2 + v39);
    v44 = v35;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v45 = sub_23E1BDEB0();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v42, v43, v45);
    }
    else
    {
      *(_QWORD *)v42 = *v43;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v47 = a3[9];
    v48 = &a1[v47];
    v49 = (char *)a2 + v47;
    v50 = sub_23E1BDE38();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
  }
  return a1;
}

uint64_t destroy for CompletionView(uint64_t a1, int *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (int *)type metadata accessor for CompletionSnippetModel();
  v6 = a1 + v5[5];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + v5[6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + v5[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(a1 + v5[8], v11);
  v13 = a1 + v5[9];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = a1 + v5[10];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v12(a1 + v5[11], v11);

  swift_release();
  swift_release();
  v17 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_23E1BDEB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  }
  else
  {
    swift_release();
  }
  v19 = a1 + a2[9];
  v20 = sub_23E1BDE38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
}

uint64_t initializeWithCopy for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
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
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = (int *)type metadata accessor for CompletionSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  v21 = v7[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = v7[10];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  v29 = a3[5];
  v30 = a3[6];
  v31 = (_QWORD *)(a1 + v29);
  v32 = a2 + v29;
  v34 = *(void **)v32;
  v33 = *(_QWORD *)(v32 + 8);
  *v31 = v34;
  v31[1] = v33;
  v35 = a1 + v30;
  v36 = a2 + v30;
  *(_BYTE *)v35 = *(_BYTE *)v36;
  *(_QWORD *)(v35 + 8) = *(_QWORD *)(v36 + 8);
  v37 = a3[7];
  v38 = a3[8];
  v39 = a1 + v37;
  v40 = a2 + v37;
  *(_BYTE *)v39 = *(_BYTE *)v40;
  *(_QWORD *)(v39 + 8) = *(_QWORD *)(v40 + 8);
  v41 = (_QWORD *)(a1 + v38);
  v42 = (_QWORD *)(a2 + v38);
  v43 = v34;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v44 = sub_23E1BDEB0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v41, v42, v44);
  }
  else
  {
    *v41 = *v42;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v45 = a3[9];
  v46 = a1 + v45;
  v47 = a2 + v45;
  v48 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
  return a1;
}

uint64_t assignWithCopy for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for CompletionSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  v21 = v7[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = v7[10];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  v29 = a3[5];
  v30 = (_QWORD *)(a1 + v29);
  v31 = a2 + v29;
  v32 = *(void **)(a1 + v29);
  v33 = *(void **)(a2 + v29);
  *v30 = v33;
  v34 = v33;

  v30[1] = *(_QWORD *)(v31 + 8);
  v35 = a3[6];
  v36 = a1 + v35;
  v37 = a2 + v35;
  *(_BYTE *)v36 = *(_BYTE *)v37;
  *(_QWORD *)(v36 + 8) = *(_QWORD *)(v37 + 8);
  swift_retain();
  swift_release();
  v38 = a3[7];
  v39 = a1 + v38;
  v40 = a2 + v38;
  *(_BYTE *)v39 = *(_BYTE *)v40;
  *(_QWORD *)(v39 + 8) = *(_QWORD *)(v40 + 8);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v41 = a3[8];
    v42 = (_QWORD *)(a1 + v41);
    v43 = (_QWORD *)(a2 + v41);
    sub_23E18829C(a1 + v41, &qword_256D34FA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v44 = sub_23E1BDEB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
    }
    else
    {
      *v42 = *v43;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v45 = a3[9];
  v46 = a1 + v45;
  v47 = a2 + v45;
  v48 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 24))(v46, v47, v48);
  return a1;
}

uint64_t initializeWithTake for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
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
  void *v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for CompletionSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  v21 = v7[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
  v25 = v7[10];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  v29 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v29) = *(_OWORD *)(a2 + v29);
  v30 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v31 = (void *)(a1 + v30);
  v32 = (const void *)(a2 + v30);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v34 = sub_23E1BDEB0();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v34 - 8) + 32))(v31, v32, v34);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  v35 = a3[9];
  v36 = a1 + v35;
  v37 = a2 + v35;
  v38 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
  return a1;
}

uint64_t assignWithTake for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  int *v7;
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for CompletionSnippetModel();
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = v7[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = v7[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  v21 = v7[9];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v25 = v7[10];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  v29 = a3[5];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  v32 = *(void **)(a1 + v29);
  *v30 = *v31;

  v30[1] = v31[1];
  v33 = a3[6];
  v34 = a1 + v33;
  v35 = a2 + v33;
  *(_BYTE *)v34 = *(_BYTE *)v35;
  *(_QWORD *)(v34 + 8) = *(_QWORD *)(v35 + 8);
  swift_release();
  v36 = a3[7];
  v37 = a1 + v36;
  v38 = a2 + v36;
  *(_BYTE *)v37 = *(_BYTE *)v38;
  *(_QWORD *)(v37 + 8) = *(_QWORD *)(v38 + 8);
  swift_release();
  if (a1 != a2)
  {
    v39 = a3[8];
    v40 = (void *)(a1 + v39);
    v41 = (const void *)(a2 + v39);
    sub_23E18829C(a1 + v39, &qword_256D34FA0);
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34FA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v43 = sub_23E1BDEB0();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v40, v41, v43);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    }
  }
  v44 = a3[9];
  v45 = a1 + v44;
  v46 = a2 + v44;
  v47 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 40))(v45, v46, v47);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1ABC40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;

  v6 = OUTLINED_FUNCTION_12_10();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35000);
    if (*(_DWORD *)(*(_QWORD *)(v12 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v12;
      v13 = a3[8];
    }
    else
    {
      v7 = OUTLINED_FUNCTION_11_1();
      v13 = a3[9];
    }
    v8 = a1 + v13;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + a3[5]);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for CompletionView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E1ABD14(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = OUTLINED_FUNCTION_12_10();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + a4[5]) = a2;
      OUTLINED_FUNCTION_2_0();
      return;
    }
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35000);
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = a4[8];
    }
    else
    {
      v9 = OUTLINED_FUNCTION_11_1();
      v12 = a4[9];
    }
    v10 = a1 + v12;
  }
  __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

void sub_23E1ABDC4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for CompletionSnippetModel();
  if (v0 <= 0x3F)
  {
    sub_23E1913A0();
    if (v1 <= 0x3F)
    {
      sub_23E1BDE38();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

unint64_t sub_23E1ABE74()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D35BD0;
  if (!qword_256D35BD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D35BD8);
    v2[0] = sub_23E1AA984();
    v2[1] = MEMORY[0x24BDF4760];
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D35BD0);
  }
  return result;
}

void OUTLINED_FUNCTION_5_7(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_8_7(uint64_t a1@<X8>)
{
  sub_23E1AAB08((void *)((a1 - 32) | 0x8000000000000000));
}

uint64_t OUTLINED_FUNCTION_9_9()
{
  return type metadata accessor for CompletionView();
}

void OUTLINED_FUNCTION_10_8(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;

  *a1 = v1;
  a1[1] = v3;
  a1[2] = 0;
  a1[3] = 0;
  sub_23E187F20(v4, v2);
}

void OUTLINED_FUNCTION_11_6(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_23E180B78(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_12_10()
{
  return type metadata accessor for CompletionSnippetModel();
}

void OUTLINED_FUNCTION_13_7(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;

  sub_23E180B4C(v3, a1 + v2, v1);
}

void OUTLINED_FUNCTION_15_8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_23E1AACF0(a1, *(_QWORD *)(a2 - 256), v2);
}

uint64_t OUTLINED_FUNCTION_17_7()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_21_7()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_22_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_27_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  return sub_23E1BE018();
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return sub_23E1BE408();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return swift_storeEnumTagMultiPayload();
}

void OUTLINED_FUNCTION_35_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23E1AAD1C(a1, a2, v2);
}

uint64_t sub_23E1AC010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v34 = a7;
  v35 = a8;
  v33 = a6;
  v31 = a4;
  v32 = a5;
  v29 = a2;
  v30 = a3;
  v38 = a1;
  v37 = a10;
  v36 = a9;
  v28[1] = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v28 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35C30);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_7_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  v21 = MEMORY[0x24BDAC7A8](v20);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v28 - v22;
  v24 = v10 + OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__punchout;
  v25 = sub_23E1BDD0C();
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 1, 1, v25);
  OUTLINED_FUNCTION_20_8();
  OUTLINED_FUNCTION_19_10();
  sub_23E188930((uint64_t)v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v24, v11, v18);
  sub_23E19C2A0(v38, (uint64_t)v17);
  OUTLINED_FUNCTION_0_7();
  sub_23E19C2A0((uint64_t)v17, (uint64_t)v15);
  sub_23E1BDE74();
  sub_23E1A6AA0((uint64_t)v17);
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_1_9();
  v39 = v29;
  v40 = v30;
  OUTLINED_FUNCTION_15_9();
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_1_9();
  v39 = v31;
  v40 = v32;
  OUTLINED_FUNCTION_15_9();
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_0_7();
  LOBYTE(v39) = v33;
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_0_7();
  LOBYTE(v39) = v34;
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_0_7();
  LOBYTE(v39) = v35;
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_8();
  v26 = v36;
  sub_23E1888E8(v36, (uint64_t)v23);
  OUTLINED_FUNCTION_1_9();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v24, v18);
  OUTLINED_FUNCTION_20_8();
  OUTLINED_FUNCTION_19_10();
  sub_23E188930((uint64_t)v23);
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_0_7();
  LOBYTE(v39) = v37;
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_5_8();
  sub_23E188930(v26);
  sub_23E1A6AA0(v38);
  return v10;
}

void sub_23E1AC2FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_1();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23E19C2A0(a1, v1);
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_9_10();
  sub_23E1A6AA0(a1);
  OUTLINED_FUNCTION_14_10();
}

uint64_t sub_23E1AC378()
{
  return sub_23E1AC3A0();
}

uint64_t sub_23E1AC38C()
{
  return sub_23E1AC3A0();
}

uint64_t sub_23E1AC3A0()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_13_3();
  return sub_23E1BDE8C();
}

uint64_t sub_23E1AC40C()
{
  return sub_23E1AC4DC();
}

uint64_t sub_23E1AC420()
{
  return sub_23E1AC4DC();
}

uint64_t sub_23E1AC434()
{
  return sub_23E1AC4DC();
}

void sub_23E1AC448(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_1();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23E1888E8(a1, v1);
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_9_10();
  sub_23E188930(a1);
  OUTLINED_FUNCTION_14_10();
}

uint64_t sub_23E1AC4C8()
{
  return sub_23E1AC4DC();
}

uint64_t sub_23E1AC4DC()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_13_3();
  return sub_23E1BDE8C();
}

uint64_t sub_23E1AC53C()
{
  return sub_23E1AC620();
}

uint64_t sub_23E1AC550()
{
  return sub_23E1AC578();
}

uint64_t sub_23E1AC564()
{
  return sub_23E1AC578();
}

uint64_t sub_23E1AC578()
{
  uint64_t v1;

  swift_getKeyPath();
  OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_12_11();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23E1AC5D0()
{
  return sub_23E1AC68C();
}

uint64_t sub_23E1AC5E4()
{
  return sub_23E1AC68C();
}

uint64_t sub_23E1AC5F8()
{
  return sub_23E1AC68C();
}

uint64_t sub_23E1AC60C()
{
  return sub_23E1AC620();
}

uint64_t sub_23E1AC620()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_11_7();
  sub_23E1BDE80();
  swift_release();
  return swift_release();
}

uint64_t sub_23E1AC678()
{
  return sub_23E1AC68C();
}

uint64_t sub_23E1AC68C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_12_11();
  swift_release();
  swift_release();
  return v1;
}

void sub_23E1AC6E4()
{
  sub_23E1AC60C();
  OUTLINED_FUNCTION_9();
}

void sub_23E1AC700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_1();
  sub_23E1888E8(a1, v1);
  sub_23E1AC448(v1);
}

uint64_t SnippetDetailsModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35BE8);
  OUTLINED_FUNCTION_13_0(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35BF8);
  OUTLINED_FUNCTION_8_8(v2);
  OUTLINED_FUNCTION_7_6(OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__secondaryText);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35C10);
  OUTLINED_FUNCTION_8_8(v3);
  OUTLINED_FUNCTION_7_6(OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__isSuccess);
  OUTLINED_FUNCTION_7_6(OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__inProgress);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35C30);
  OUTLINED_FUNCTION_13_0(v4);
  OUTLINED_FUNCTION_7_6(OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__toggleEnabled);
  return v0;
}

uint64_t SnippetDetailsModel.__deallocating_deinit()
{
  SnippetDetailsModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23E1AC84C()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_23E1AC858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SnippetDetailsModel();
  result = sub_23E1BDE68();
  *a1 = result;
  return result;
}

uint64_t sub_23E1AC894()
{
  return type metadata accessor for SnippetDetailsModel();
}

uint64_t type metadata accessor for SnippetDetailsModel()
{
  uint64_t result;

  result = qword_256D35C68;
  if (!qword_256D35C68)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23E1AC8D4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23E1AC9C0();
  if (v0 <= 0x3F)
  {
    sub_23E1ACA14(319, &qword_256D35C80);
    if (v1 <= 0x3F)
    {
      sub_23E1ACA14(319, &qword_256D35C88);
      if (v2 <= 0x3F)
      {
        sub_23E1ACA58();
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for SnippetDetailsModel()
{
  return swift_lookUpClassMethod();
}

void sub_23E1AC9C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D35C78)
  {
    type metadata accessor for IconConfiguration();
    v0 = sub_23E1BDE98();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D35C78);
  }
}

void sub_23E1ACA14(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23E1BDE98();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_23E1ACA58()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D35C90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D34CE0);
    v0 = sub_23E1BDE98();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D35C90);
  }
}

void sub_23E1ACAB0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_7();
  v0 = sub_23E1AC678();
  OUTLINED_FUNCTION_17_8(v0);
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACAD0(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_16_4(a1);
  sub_23E1AC4C8();
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACAEC()
{
  sub_23E1AC60C();
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACB0C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_7();
  v0 = sub_23E1AC5F8();
  OUTLINED_FUNCTION_17_8(v0);
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACB2C(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_16_4(a1);
  sub_23E1AC434();
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACB48()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_7();
  v0 = sub_23E1AC5E4();
  OUTLINED_FUNCTION_17_8(v0);
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACB68(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_16_4(a1);
  sub_23E1AC420();
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACB84()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_7();
  v0 = sub_23E1AC5D0();
  OUTLINED_FUNCTION_17_8(v0);
  OUTLINED_FUNCTION_9();
}

void sub_23E1ACBA4(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_16_4(a1);
  sub_23E1AC40C();
  OUTLINED_FUNCTION_9();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return sub_23E1BDE74();
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_7_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_8_8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_9_10()
{
  return sub_23E1BDE8C();
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_12_11()
{
  return sub_23E1BDE80();
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  return sub_23E1BDE74();
}

uint64_t OUTLINED_FUNCTION_16_4(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_17_8(uint64_t result)
{
  _BYTE *v1;

  *v1 = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_19_10()
{
  return sub_23E1BDE74();
}

uint64_t OUTLINED_FUNCTION_20_8()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23E1888E8(v1, v0);
}

void CompletionSnippetModel.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3();
  v2 = v0;
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_8_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE5B8();
  sub_23E1BE480();
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_25_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_25_4();
  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_31_5();
  OUTLINED_FUNCTION_26_2();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_43_2(0x6572676F72506E69);
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_31_5();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35_2();
  sub_23E1BE480();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  sub_23E1BE480();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_19();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_8_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  OUTLINED_FUNCTION_44_0();
  v1 = OUTLINED_FUNCTION_24();
  __swift_getEnumTagSinglePayload(v2, 1, v1);
  sub_23E18829C(v2, &qword_256D34E20);
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  OUTLINED_FUNCTION_0_3();
}

uint64_t CompletionSnippetModel.secondaryText.getter()
{
  uint64_t v1;

  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  sub_23E1BDDCC();
  return v1;
}

void CompletionSnippetModel.iconConfiguration.getter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_9();
}

void CompletionSnippetModel.isBooleanTrueResponse.getter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.isSuccess.getter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.inProgress.getter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.toggleEnabled.getter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_7_0();
}

uint64_t CompletionSnippetModel.primaryText.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  return v1;
}

uint64_t type metadata accessor for CompletionSnippetModel()
{
  uint64_t result;

  result = qword_256D35F38;
  if (!qword_256D35F38)
    return swift_getSingletonMetadata();
  return result;
}

void CompletionSnippetModel.punchOut.getter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_9();
}

void CompletionSnippetModel.init(primaryText:secondaryText:isBooleanTrueResponse:iconConfiguration:isSuccess:punchOut:inProgress:toggleEnabled:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, unsigned __int8 a11)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  void (*v37)(uint64_t);
  _QWORD v38[2];
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v49 = a8;
  v47 = a5;
  v48 = a7;
  v45 = a4;
  v46 = a6;
  v43 = a2;
  v44 = a3;
  v42 = a1;
  v50 = a10;
  v51 = a11;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v38 - v16;
  v38[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  v18 = MEMORY[0x24BDAC7A8](v38[0]);
  v20 = (char *)v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v38 - v21;
  v23 = (int *)OUTLINED_FUNCTION_12_10();
  v24 = a9 + v23[5];
  v53 = 0;
  v54 = 0;
  v38[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  sub_23E1BDDB4();
  v40 = a9 + v23[6];
  LOBYTE(v53) = 2;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  sub_23E1BDDB4();
  v25 = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_53_0((uint64_t)v22, v26, v27, v25);
  OUTLINED_FUNCTION_38_0((uint64_t)v22, (uint64_t)v20);
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_37_3((uint64_t)v22);
  v28 = a9 + v23[10];
  v29 = sub_23E1BDD0C();
  OUTLINED_FUNCTION_53_0((uint64_t)v17, v30, v31, v29);
  v39 = v15;
  OUTLINED_FUNCTION_38_0((uint64_t)v17, (uint64_t)v15);
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_37_3((uint64_t)v17);
  v53 = v42;
  v54 = v43;
  sub_23E1BDDB4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_5_3();
  v32(v24);
  v53 = v44;
  v54 = v45;
  sub_23E1BDDB4();
  v33 = v46;
  sub_23E1AD644(v46, (uint64_t)v22, &qword_256D34E20);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  OUTLINED_FUNCTION_13_0(v34);
  sub_23E1AD644((uint64_t)v22, (uint64_t)v20, &qword_256D34E20);
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_36_2((uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_5_3();
  v35(v40);
  OUTLINED_FUNCTION_41_1(v47);
  sub_23E1BDDB4();
  LOBYTE(v53) = v48;
  OUTLINED_FUNCTION_25_5();
  v36 = v49;
  OUTLINED_FUNCTION_38_0(v49, (uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  OUTLINED_FUNCTION_5_3();
  v37(v28);
  OUTLINED_FUNCTION_38_0((uint64_t)v17, (uint64_t)v39);
  sub_23E1BDDB4();
  OUTLINED_FUNCTION_37_3((uint64_t)v17);
  LOBYTE(v53) = v50;
  OUTLINED_FUNCTION_25_5();
  LOBYTE(v53) = v51;
  OUTLINED_FUNCTION_25_5();
  OUTLINED_FUNCTION_37_3(v36);
  OUTLINED_FUNCTION_36_2(v33);
}

void sub_23E1AD644(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1AD684()
{
  swift_bridgeObjectRetain();
  return CompletionSnippetModel.primaryText.setter();
}

uint64_t CompletionSnippetModel.primaryText.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  return OUTLINED_FUNCTION_14();
}

void CompletionSnippetModel.primaryText.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E1AD72C()
{
  swift_bridgeObjectRetain();
  CompletionSnippetModel.secondaryText.setter();
}

void CompletionSnippetModel.secondaryText.setter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.secondaryText.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.isBooleanTrueResponse.setter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.isBooleanTrueResponse.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.isSuccess.setter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.isSuccess.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.inProgress.setter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.inProgress.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.iconConfiguration.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_10_9(v3, v4);
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_36_2(a1);
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.iconConfiguration.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1ADA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1AD644(a1, (uint64_t)v11, a5);
  return a6(v11);
}

void CompletionSnippetModel.punchOut.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_10_9(v3, v4);
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_36_2(a1);
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.punchOut.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

void CompletionSnippetModel.toggleEnabled.setter()
{
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_7_0();
}

void CompletionSnippetModel.toggleEnabled.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v1[4] = OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1ADBE8()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t sub_23E1ADC34(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E1ADC70 + 4 * byte_23E1C0820[a1]))(0xD000000000000015, 0x800000023E1C1D70);
}

uint64_t sub_23E1ADC70()
{
  return 0x547972616D697270;
}

uint64_t sub_23E1ADC90()
{
  return 0x7261646E6F636573;
}

unint64_t sub_23E1ADCB4()
{
  return 0xD000000000000011;
}

uint64_t sub_23E1ADCD0()
{
  return 0x7365636375537369;
}

uint64_t sub_23E1ADCEC()
{
  return 0x74754F68636E7570;
}

uint64_t sub_23E1ADD04()
{
  return 0x6572676F72506E69;
}

uint64_t sub_23E1ADD20()
{
  return 0x6E45656C67676F74;
}

uint64_t sub_23E1ADD44(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E1ADD80 + 4 * byte_23E1C0828[a1]))(0xD000000000000015, 0x800000023E1C1D70);
}

uint64_t sub_23E1ADD80()
{
  return 0x547972616D697270;
}

uint64_t sub_23E1ADDA0()
{
  return 0x7261646E6F636573;
}

unint64_t sub_23E1ADDC4()
{
  return 0xD000000000000011;
}

uint64_t sub_23E1ADDE0()
{
  return 0x7365636375537369;
}

uint64_t sub_23E1ADDFC()
{
  return 0x74754F68636E7570;
}

uint64_t sub_23E1ADE14()
{
  return 0x6572676F72506E69;
}

uint64_t sub_23E1ADE30()
{
  return 0x6E45656C67676F74;
}

void sub_23E1ADE54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  sub_23E1B5B38(*a1, *a2);
}

void sub_23E1ADE60()
{
  unsigned __int8 *v0;

  sub_23E1B5DC8(*v0);
}

uint64_t sub_23E1ADE68(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_23E1B5F3C(a1, *v1);
}

void sub_23E1ADE70(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23E1B6178(a1, *v1);
}

uint64_t sub_23E1ADE78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1ADBE8();
  *a1 = result;
  return result;
}

void sub_23E1ADEA4(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_23E1ADC34(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1ADEC8()
{
  unsigned __int8 *v0;

  return sub_23E1ADD44(*v0);
}

uint64_t sub_23E1ADED0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1ADC30();
  *a1 = result;
  return result;
}

uint64_t sub_23E1ADEF4()
{
  sub_23E1AE694();
  return sub_23E1BE708();
}

uint64_t sub_23E1ADF1C()
{
  sub_23E1AE694();
  return sub_23E1BE714();
}

Swift::String __swiftcall CompletionSnippetModel.responseViewId()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x800000023E1C22E0;
  v1 = 0xD000000000000019;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

void CompletionSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v18;
  uint64_t v19;
  char *v20;
  int *v21;
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
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void (*v37)(uint64_t);
  void (*v38)(uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  uint64_t (*v46)(uint64_t);
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
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;

  v77 = a1;
  v62 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35EC8);
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3();
  v74 = v4;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2();
  v61 = v6;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v57 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v57 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2();
  v60 = v14;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v57 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v57 - v19;
  v21 = (int *)type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_19_1();
  v24 = v2 + *(int *)(v23 + 20);
  v75 = 0;
  v76 = 0;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
  v73 = v24;
  v63 = v25;
  sub_23E1BDDB4();
  v26 = v2 + v21[6];
  LOBYTE(v75) = 2;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  v72 = v26;
  v64 = v27;
  sub_23E1BDDB4();
  v28 = v2 + v21[9];
  v59 = type metadata accessor for IconConfiguration();
  __swift_storeEnumTagSinglePayload((uint64_t)v20, 1, 1, v59);
  sub_23E1AD644((uint64_t)v20, (uint64_t)v18, &qword_256D34E20);
  v67 = v28;
  sub_23E1BDDB4();
  sub_23E18829C((uint64_t)v20, &qword_256D34E20);
  v69 = v21;
  v29 = v2;
  v30 = v2 + v21[10];
  v31 = sub_23E1BDD0C();
  OUTLINED_FUNCTION_41_0((uint64_t)v12, 1);
  sub_23E1AD644((uint64_t)v12, (uint64_t)v10, &qword_256D34CE0);
  v68 = v30;
  v32 = v77;
  sub_23E1BDDB4();
  sub_23E18829C((uint64_t)v12, &qword_256D34CE0);
  __swift_project_boxed_opaque_existential_1(v32, v32[3]);
  sub_23E1AE694();
  v33 = v71;
  sub_23E1BE6F0();
  if (v33)
  {
    v35 = v67;
    v34 = v68;
    OUTLINED_FUNCTION_45_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_5_3();
    v36(v73);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    OUTLINED_FUNCTION_5_3();
    v37(v72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
    OUTLINED_FUNCTION_5_3();
    v38(v35);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    OUTLINED_FUNCTION_5_3();
    v39(v34);
  }
  else
  {
    v70 = (uint64_t)v12;
    v71 = v31;
    LOBYTE(v75) = 0;
    v75 = sub_23E1BE63C();
    v76 = v40;
    sub_23E1BDDB4();
    OUTLINED_FUNCTION_41_1(1);
    v41 = sub_23E1BE63C();
    v58 = v29;
    v42 = v41;
    v44 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_57_0(v45);
    v75 = v42;
    v76 = v44;
    sub_23E1BDDB4();
    OUTLINED_FUNCTION_41_1(2);
    LOBYTE(v44) = sub_23E1BE648() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    OUTLINED_FUNCTION_5_3();
    OUTLINED_FUNCTION_57_0(v46);
    LOBYTE(v75) = v44;
    sub_23E1BDDB4();
    OUTLINED_FUNCTION_41_1(4);
    v47 = sub_23E1BE648();
    OUTLINED_FUNCTION_34_3(v47);
    OUTLINED_FUNCTION_37();
    v48 = OUTLINED_FUNCTION_24_3(7);
    OUTLINED_FUNCTION_34_3(v48);
    OUTLINED_FUNCTION_37();
    v49 = OUTLINED_FUNCTION_24_3(6);
    OUTLINED_FUNCTION_34_3(v49);
    OUTLINED_FUNCTION_37();
    LOBYTE(v75) = 3;
    sub_23E180C20(&qword_256D348D8, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, (uint64_t)&protocol conformance descriptor for IconConfiguration);
    OUTLINED_FUNCTION_34_0();
    v50 = v59;
    v51 = v60;
    sub_23E1BE654();
    v52 = v65;
    v53 = v61;
    __swift_storeEnumTagSinglePayload(v51, 0, 1, v50);
    sub_23E1AD644(v51, (uint64_t)v20, &qword_256D34E20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
    sub_23E1BDDD8();
    sub_23E18829C(v51, &qword_256D34E20);
    LOBYTE(v75) = 5;
    sub_23E180C20(&qword_256D34D08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    OUTLINED_FUNCTION_34_0();
    sub_23E1BE654();
    v54 = v62;
    v55 = v70;
    OUTLINED_FUNCTION_41_0(v53, 0);
    sub_23E1AD644(v53, v55, &qword_256D34CE0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    sub_23E1BDDD8();
    sub_23E18829C(v53, &qword_256D34CE0);
    (*(void (**)(uint64_t, _QWORD))(v52 + 8))(v74, 0);
    v56 = v58;
    sub_23E1AE6D0(v58, v54);
    OUTLINED_FUNCTION_45_1();
    sub_23E187F20(v56, (uint64_t (*)(_QWORD))type metadata accessor for CompletionSnippetModel);
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E1AE694()
{
  unint64_t result;

  result = qword_256D35ED0;
  if (!qword_256D35ED0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C0A04, &type metadata for CompletionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35ED0);
  }
  return result;
}

uint64_t sub_23E1AE6D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompletionSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void CompletionSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3();
  v18 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_19_1();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35ED8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1AE694();
  sub_23E1BE6FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  LOBYTE(v21) = 0;
  v11 = v20;
  sub_23E1BE678();
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    OUTLINED_FUNCTION_26_2();
  }
  else
  {
    v15 = v5;
    v16 = v8;
    v17 = v1;
    OUTLINED_FUNCTION_26_2();
    v20 = type metadata accessor for CompletionSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_25_2();
    v22 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CE8);
    sub_23E189620((unint64_t *)&qword_256D34D18, &qword_256D34CE8, MEMORY[0x24BEE0D08]);
    sub_23E1BE690();
    v12 = v17;
    OUTLINED_FUNCTION_26_2();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    OUTLINED_FUNCTION_25_2();
    v22 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
    sub_23E189620(&qword_256D34D20, &qword_256D34CF0, MEMORY[0x24BEE1330]);
    OUTLINED_FUNCTION_26_5();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    OUTLINED_FUNCTION_25_2();
    LOBYTE(v21) = 4;
    sub_23E1BE684();
    OUTLINED_FUNCTION_30_4();
    OUTLINED_FUNCTION_18_8(7);
    OUTLINED_FUNCTION_30_4();
    OUTLINED_FUNCTION_18_8(6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
    sub_23E1BDDCC();
    LOBYTE(v21) = 3;
    sub_23E18BFEC();
    OUTLINED_FUNCTION_34_0();
    sub_23E1BE690();
    sub_23E18829C(v12, &qword_256D34E20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    v13 = v18;
    sub_23E1BDDCC();
    LOBYTE(v21) = 5;
    sub_23E189674();
    OUTLINED_FUNCTION_34_0();
    OUTLINED_FUNCTION_26_5();
    v14 = v16;
    sub_23E18829C(v13, &qword_256D34CE0);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v7);
  }
  OUTLINED_FUNCTION_9_0();
}

void CompletionSnippetModel.stringId.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_19_1();
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_23E1BE5B8();
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "#primaryText: ");
  HIBYTE(v8[1]) = -18;
  v6[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43_2(0x6563637553736923);
  OUTLINED_FUNCTION_12_10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  OUTLINED_FUNCTION_25_4();
  sub_23E1BE480();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_33_4();
  OUTLINED_FUNCTION_17_2();
  v7[0] = 0;
  v7[1] = 0xE000000000000000;
  sub_23E1BE5B8();
  sub_23E1BE480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  OUTLINED_FUNCTION_25_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CF0);
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_33_4();
  OUTLINED_FUNCTION_17_2();
  strcpy((char *)v7, "#inProgress: ");
  HIWORD(v7[1]) = -4864;
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  sub_23E1BDDCC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    sub_23E18829C((uint64_t)v3, &qword_256D34E20);
  }
  else
  {
    sub_23E1A6CE4((uint64_t)v3, v0);
    strcpy((char *)v7, "#iconName: ");
    HIDWORD(v7[1]) = -352321536;
    sub_23E1BDDCC();
    sub_23E1BE480();
    swift_bridgeObjectRelease();
    sub_23E1BE480();
    swift_bridgeObjectRelease();
    sub_23E187F20(v0, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  }
  OUTLINED_FUNCTION_0_3();
}

void sub_23E1AEE34()
{
  sub_23E180C20(&qword_256D34FE0, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
}

void sub_23E1AEE60()
{
  sub_23E180C20(&qword_256D34FE8, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
}

uint64_t sub_23E1AEE8C()
{
  sub_23E180C20(&qword_256D34FE0, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
  sub_23E180C20(&qword_256D34FE8, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
  return sub_23E1BDD90();
}

uint64_t sub_23E1AEF2C()
{
  sub_23E180C20(&qword_256D34FE0, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
  sub_23E180C20(&qword_256D34FE8, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
  return sub_23E1BDD84();
}

void sub_23E1AEFB4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CompletionSnippetModel.init(from:)(a1, a2);
}

void sub_23E1AEFC8(_QWORD *a1)
{
  CompletionSnippetModel.encode(to:)(a1);
}

void sub_23E1AEFDC()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  *v0 = CompletionSnippetModel.primaryText.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF000()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_20();
  *v0 = CompletionSnippetModel.secondaryText.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF024()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_20();
  CompletionSnippetModel.isBooleanTrueResponse.getter();
  *v0 = v1;
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF044(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_60(a1);
  CompletionSnippetModel.isBooleanTrueResponse.setter();
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF060()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_20();
  CompletionSnippetModel.isSuccess.getter();
  *v0 = v1 & 1;
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF084(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_60(a1);
  CompletionSnippetModel.isSuccess.setter();
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF0A0()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_20();
  CompletionSnippetModel.inProgress.getter();
  *v0 = v1 & 1;
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF0C4(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_60(a1);
  CompletionSnippetModel.inProgress.setter();
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF0E0()
{
  CompletionSnippetModel.iconConfiguration.getter();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1AF0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23E1ADA2C(a1, a2, a3, a4, &qword_256D34E20, (uint64_t (*)(char *))CompletionSnippetModel.iconConfiguration.setter);
}

void sub_23E1AF120()
{
  CompletionSnippetModel.punchOut.getter();
  OUTLINED_FUNCTION_9();
}

uint64_t sub_23E1AF13C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23E1ADA2C(a1, a2, a3, a4, &qword_256D34CE0, (uint64_t (*)(char *))CompletionSnippetModel.punchOut.setter);
}

void sub_23E1AF160()
{
  _BYTE *v0;
  char v1;

  OUTLINED_FUNCTION_20();
  CompletionSnippetModel.toggleEnabled.getter();
  *v0 = v1 & 1;
  OUTLINED_FUNCTION_9();
}

void sub_23E1AF184(unsigned __int8 *a1)
{
  OUTLINED_FUNCTION_60(a1);
  CompletionSnippetModel.toggleEnabled.setter();
  OUTLINED_FUNCTION_9();
}

char *initializeBufferWithCopyOfBuffer for CompletionSnippetModel(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = &a1[v12];
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = &a1[v16];
    v18 = (char *)a2 + v16;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    v20(v17, v18, v19);
    v20(&a1[a3[8]], (char *)a2 + a3[8], v19);
    v21 = a3[9];
    v22 = &a1[v21];
    v23 = (char *)a2 + v21;
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
    v25 = a3[10];
    v26 = &a1[v25];
    v27 = (char *)a2 + v25;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    v20(&a1[a3[11]], (char *)a2 + a3[11], v19);
  }
  return a1;
}

uint64_t destroy for CompletionSnippetModel(uint64_t a1, int *a2)
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
  void (*v16)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v16(v9, v10);
  v16(a1 + a2[8], v10);
  v11 = a1 + a2[9];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = a1 + a2[10];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  return ((uint64_t (*)(uint64_t, uint64_t))v16)(a1 + a2[11], v10);
}

uint64_t initializeWithCopy for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  v24 = a3[10];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t assignWithCopy for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 24))(v21, v22, v23);
  v24 = a3[10];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 24))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t initializeWithTake for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  v24 = a3[10];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t assignWithTake for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  v20 = a3[9];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  v24 = a3[10];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 40))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1AFAA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_17();
  if (v9)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_17();
    if (v9)
    {
      v7 = v10;
      v11 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
      OUTLINED_FUNCTION_17();
      if (v12)
      {
        v7 = v13;
        v11 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        OUTLINED_FUNCTION_17();
        if (v14)
        {
          v7 = v15;
          v11 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
          OUTLINED_FUNCTION_17();
          if (v16)
          {
            v7 = v17;
            v11 = a3[9];
          }
          else
          {
            v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
            v11 = a3[10];
          }
        }
      }
    }
    v8 = a1 + v11;
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1AFB94(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  OUTLINED_FUNCTION_18();
  if (v10)
  {
    v8 = v7;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    OUTLINED_FUNCTION_18();
    if (v10)
    {
      v8 = v11;
      v12 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
      OUTLINED_FUNCTION_18();
      if (v13)
      {
        v8 = v14;
        v12 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        OUTLINED_FUNCTION_18();
        if (v15)
        {
          v8 = v16;
          v12 = a4[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
          OUTLINED_FUNCTION_18();
          if (v17)
          {
            v8 = v18;
            v12 = a4[9];
          }
          else
          {
            v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
            v12 = a4[10];
          }
        }
      }
    }
    v9 = a1 + v12;
  }
  return __swift_storeEnumTagSinglePayload(v9, a2, a2, v8);
}

void sub_23E1AFC84()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_23E18353C(319, (unint64_t *)&qword_256D34980);
  if (v0 <= 0x3F)
  {
    sub_23E18A798(319, &qword_256D34DB0, &qword_256D34CE8);
    if (v1 <= 0x3F)
    {
      sub_23E18A798(319, &qword_256D34DB8, &qword_256D34CF0);
      if (v2 <= 0x3F)
      {
        sub_23E18353C(319, qword_256D34998);
        if (v3 <= 0x3F)
        {
          sub_23E18A798(319, qword_256D35F48, &qword_256D34E20);
          if (v4 <= 0x3F)
          {
            sub_23E18A798(319, qword_256D34DC0, &qword_256D34CE0);
            if (v5 <= 0x3F)
              swift_initStructMetadata();
          }
        }
      }
    }
  }
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23E1AFE24 + 4 * byte_23E1C0835[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23E1AFE58 + 4 * byte_23E1C0830[v4]))();
}

uint64_t sub_23E1AFE58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1AFE60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1AFE68);
  return result;
}

uint64_t sub_23E1AFE74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1AFE7CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23E1AFE80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1AFE88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CompletionSnippetModel.CodingKeys()
{
  return &type metadata for CompletionSnippetModel.CodingKeys;
}

unint64_t sub_23E1AFEA8()
{
  unint64_t result;

  result = qword_256D35F90;
  if (!qword_256D35F90)
  {
    result = MEMORY[0x24264D408](&unk_23E1C09DC, &type metadata for CompletionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35F90);
  }
  return result;
}

unint64_t sub_23E1AFEE8()
{
  unint64_t result;

  result = qword_256D35F98;
  if (!qword_256D35F98)
  {
    result = MEMORY[0x24264D408](&unk_23E1C0914, &type metadata for CompletionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35F98);
  }
  return result;
}

unint64_t sub_23E1AFF28()
{
  unint64_t result;

  result = qword_256D35FA0;
  if (!qword_256D35FA0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C093C, &type metadata for CompletionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D35FA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 176) + 8))(v0, v1);
}

void OUTLINED_FUNCTION_10_9(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;

  sub_23E1AD644(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_18_8@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_23E1BE684();
}

uint64_t OUTLINED_FUNCTION_24_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_23E1BE648();
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return sub_23E1BDDB4();
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  return sub_23E1BE690();
}

uint64_t OUTLINED_FUNCTION_30_4()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_33_4()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_34_3(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return sub_23E1BDDCC();
}

void OUTLINED_FUNCTION_36_2(uint64_t a1)
{
  uint64_t *v1;

  sub_23E18829C(a1, v1);
}

void OUTLINED_FUNCTION_37_3(uint64_t a1)
{
  uint64_t *v1;

  sub_23E18829C(a1, v1);
}

void OUTLINED_FUNCTION_38_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23E1AD644(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_39_2()
{
  return sub_23E1BDDCC();
}

uint64_t OUTLINED_FUNCTION_41_1@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_43_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  *(_QWORD *)(v1 - 104) = 0xEC000000203A7373;
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 72));
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_23E1BDDD8();
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return sub_23E1BE480();
}

uint64_t OUTLINED_FUNCTION_53_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return sub_23E1BE5F4();
}

uint64_t OUTLINED_FUNCTION_57_0@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_60(unsigned __int8 *a1)
{
  return *a1;
}

HomeAutomationUIFramework::SnippetRenderingMode_optional __swiftcall SnippetRenderingMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  HomeAutomationUIFramework::SnippetRenderingMode_optional result;

  v2 = v1;
  v3 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  v4 = 4;
  if (v3 < 4)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_2_0();
  return result;
}

uint64_t SnippetRenderingMode.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aHierarchmultic[8 * *v0];
}

void sub_23E1B0144()
{
  sub_23E1B5B44();
}

void sub_23E1B0150()
{
  sub_23E1B5E0C();
}

uint64_t sub_23E1B0158()
{
  return sub_23E1B5F48();
}

void sub_23E1B0160()
{
  sub_23E1B6150();
}

HomeAutomationUIFramework::SnippetRenderingMode_optional sub_23E1B0168(Swift::String *a1)
{
  return SnippetRenderingMode.init(rawValue:)(*a1);
}

uint64_t sub_23E1B0174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SnippetRenderingMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23E1B0198()
{
  sub_23E1B0CF8();
  return sub_23E1BE4D4();
}

uint64_t sub_23E1B01E4()
{
  sub_23E1B0CF8();
  return sub_23E1BE4E0();
}

HomeAutomationUIFramework::SnippetHomeDeviceType_optional __swiftcall SnippetHomeDeviceType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  char v4;
  char v5;
  HomeAutomationUIFramework::SnippetHomeDeviceType_optional result;

  v2 = v1;
  v3 = sub_23E1BE6C0();
  swift_bridgeObjectRelease();
  v4 = 0;
  v5 = 28;
  switch(v3)
  {
    case 0:
      goto LABEL_30;
    case 1:
      v4 = 1;
      goto LABEL_30;
    case 2:
      v4 = 2;
      goto LABEL_30;
    case 3:
      v4 = 3;
      goto LABEL_30;
    case 4:
      v4 = 4;
      goto LABEL_30;
    case 5:
      v4 = 5;
      goto LABEL_30;
    case 6:
      v4 = 6;
      goto LABEL_30;
    case 7:
      v4 = 7;
      goto LABEL_30;
    case 8:
      v4 = 8;
      goto LABEL_30;
    case 9:
      v4 = 9;
      goto LABEL_30;
    case 10:
      v4 = 10;
      goto LABEL_30;
    case 11:
      v4 = 11;
      goto LABEL_30;
    case 12:
      v4 = 12;
      goto LABEL_30;
    case 13:
      v4 = 13;
      goto LABEL_30;
    case 14:
      v4 = 14;
      goto LABEL_30;
    case 15:
      v4 = 15;
      goto LABEL_30;
    case 16:
      v4 = 16;
      goto LABEL_30;
    case 17:
      v4 = 17;
      goto LABEL_30;
    case 18:
      v4 = 18;
      goto LABEL_30;
    case 19:
      v4 = 19;
      goto LABEL_30;
    case 20:
      v4 = 20;
      goto LABEL_30;
    case 21:
      v4 = 21;
      goto LABEL_30;
    case 22:
      v4 = 22;
      goto LABEL_30;
    case 23:
      v4 = 23;
      goto LABEL_30;
    case 24:
      v4 = 24;
      goto LABEL_30;
    case 25:
      v4 = 25;
      goto LABEL_30;
    case 26:
      v4 = 26;
      goto LABEL_30;
    case 27:
      v4 = 27;
LABEL_30:
      v5 = v4;
      break;
    case 28:
      break;
    case 29:
      v5 = 29;
      break;
    case 30:
      v5 = 30;
      break;
    case 31:
      v5 = 31;
      break;
    case 32:
      v5 = 32;
      break;
    case 33:
      v5 = 33;
      break;
    case 34:
      v5 = 34;
      break;
    case 35:
      v5 = 35;
      break;
    case 36:
      v5 = 36;
      break;
    case 37:
      v5 = 37;
      break;
    case 38:
      v5 = 38;
      break;
    case 39:
      v5 = 39;
      break;
    case 40:
      v5 = 40;
      break;
    case 41:
      v5 = 41;
      break;
    case 42:
      v5 = 42;
      break;
    case 43:
      v5 = 43;
      break;
    case 44:
      v5 = 44;
      break;
    case 45:
      v5 = 45;
      break;
    default:
      v5 = 46;
      break;
  }
  *v2 = v5;
  OUTLINED_FUNCTION_2_0();
  return result;
}

uint64_t SnippetHomeDeviceType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E1B0450 + 4 * word_23E1C0A8E[*v0]))(0xD000000000000010, 0x800000023E1C1DF0);
}

uint64_t sub_23E1B0450()
{
  return 0x6C7562746867696CLL;
}

uint64_t sub_23E1B046C()
{
  return 0x686374697773;
}

uint64_t sub_23E1B0480()
{
  return 0x74736F6D72656874;
}

uint64_t sub_23E1B04A0()
{
  return 7233894;
}

uint64_t sub_23E1B04B0()
{
  return 0x74656C74756FLL;
}

uint64_t sub_23E1B0774()
{
  return 0x7265776F6873;
}

uint64_t sub_23E1B07F4()
{
  return 0x5654656C707061;
}

uint64_t sub_23E1B080C()
{
  return 0x65526172656D6163;
}

uint64_t sub_23E1B0830()
{
  return 1802398067;
}

uint64_t sub_23E1B0840()
{
  return 0x74726F70726961;
}

uint64_t sub_23E1B0858()
{
  return 0x726F736E6573;
}

uint64_t sub_23E1B086C()
{
  return 0x6D6F74737563;
}

uint64_t sub_23E1B0880()
{
  return 0x6E776F6E6B6E75;
}

unint64_t sub_23E1B089C()
{
  unint64_t result;

  result = qword_256D35FA8;
  if (!qword_256D35FA8)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetRenderingMode, &type metadata for SnippetRenderingMode);
    atomic_store(result, (unint64_t *)&qword_256D35FA8);
  }
  return result;
}

uint64_t sub_23E1B08D8()
{
  return sub_23E1B5CD0();
}

unint64_t sub_23E1B08E8()
{
  unint64_t result;

  result = qword_256D35FB0;
  if (!qword_256D35FB0)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetHomeDeviceType, &type metadata for SnippetHomeDeviceType);
    atomic_store(result, (unint64_t *)&qword_256D35FB0);
  }
  return result;
}

void sub_23E1B0924()
{
  sub_23E1B5E34();
}

uint64_t sub_23E1B092C()
{
  return sub_23E1B6030();
}

void sub_23E1B0934()
{
  sub_23E1B6068();
}

HomeAutomationUIFramework::SnippetHomeDeviceType_optional sub_23E1B093C(Swift::String *a1)
{
  return SnippetHomeDeviceType.init(rawValue:)(*a1);
}

uint64_t sub_23E1B0948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SnippetHomeDeviceType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23E1B096C()
{
  sub_23E1B0CBC();
  return sub_23E1BE4D4();
}

uint64_t sub_23E1B09B8()
{
  sub_23E1B0CBC();
  return sub_23E1BE4E0();
}

uint64_t getEnumTagSinglePayload for SnippetRenderingMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SnippetRenderingMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_23E1B0AE8 + 4 * byte_23E1C0AEF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23E1B0B1C + 4 * byte_23E1C0AEA[v4]))();
}

uint64_t sub_23E1B0B1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1B0B24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1B0B2CLL);
  return result;
}

uint64_t sub_23E1B0B38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1B0B40);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23E1B0B44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1B0B4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetRenderingMode()
{
  return &type metadata for SnippetRenderingMode;
}

uint64_t getEnumTagSinglePayload for SnippetHomeDeviceType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD3)
  {
    if (a2 + 45 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 45) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 46;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x2E;
  v5 = v6 - 46;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SnippetHomeDeviceType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 45 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 45) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD2)
    return ((uint64_t (*)(void))((char *)&loc_23E1B0C3C + 4 * byte_23E1C0AF9[v4]))();
  *a1 = a2 + 45;
  return ((uint64_t (*)(void))((char *)sub_23E1B0C70 + 4 * byte_23E1C0AF4[v4]))();
}

uint64_t sub_23E1B0C70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1B0C78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1B0C80);
  return result;
}

uint64_t sub_23E1B0C8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1B0C94);
  *(_BYTE *)result = a2 + 45;
  return result;
}

uint64_t sub_23E1B0C98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1B0CA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetHomeDeviceType()
{
  return &type metadata for SnippetHomeDeviceType;
}

unint64_t sub_23E1B0CBC()
{
  unint64_t result;

  result = qword_256D35FB8;
  if (!qword_256D35FB8)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetHomeDeviceType, &type metadata for SnippetHomeDeviceType);
    atomic_store(result, (unint64_t *)&qword_256D35FB8);
  }
  return result;
}

unint64_t sub_23E1B0CF8()
{
  unint64_t result;

  result = qword_256D35FC0;
  if (!qword_256D35FC0)
  {
    result = MEMORY[0x24264D408](&protocol conformance descriptor for SnippetRenderingMode, &type metadata for SnippetRenderingMode);
    atomic_store(result, (unint64_t *)&qword_256D35FC0);
  }
  return result;
}

uint64_t static Signpost.begin(logging:_:)(void *a1)
{
  id v1;

  v1 = a1;
  sub_23E1BDE2C();
  sub_23E1BE534();
  return sub_23E1BDE20();
}

uint64_t static Signpost.end(logging:_:_:_:)()
{
  sub_23E1BE528();
  return sub_23E1BDE14();
}

void static Signpost.general.getter()
{
  OUTLINED_FUNCTION_0_8();
}

void static Signpost.Name.temperatureView.getter()
{
  OUTLINED_FUNCTION_0_8();
}

void static Signpost.Name.completionView.getter()
{
  OUTLINED_FUNCTION_0_8();
}

void static Signpost.Name.automationView.getter()
{
  OUTLINED_FUNCTION_0_8();
}

void static Signpost.Name.disambiguationView.getter()
{
  OUTLINED_FUNCTION_0_8();
}

void static Signpost.Name.confirmationView.getter()
{
  OUTLINED_FUNCTION_0_8();
}

void static Signpost.Name.callToActionView.getter()
{
  OUTLINED_FUNCTION_0_8();
}

uint64_t static Signpost.generateSignpostID(for:)(void *a1)
{
  id v1;

  v1 = a1;
  return sub_23E1BDE2C();
}

ValueMetadata *type metadata accessor for Signpost()
{
  return &type metadata for Signpost;
}

ValueMetadata *type metadata accessor for Signpost.Name()
{
  return &type metadata for Signpost.Name;
}

uint64_t *sub_23E1B0EEC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  void *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  void (*v63)(char *, char *, uint64_t);
  id v64;
  char *v66;
  char *v67;
  char *v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  uint64_t v71;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = type metadata accessor for DisambiguationSnippetModel(0);
    *(uint64_t *)((char *)a1 + *(int *)(v9 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 20));
    v10 = *(int *)(v9 + 24);
    v11 = (uint64_t *)((char *)a1 + v10);
    v12 = (uint64_t *)((char *)a2 + v10);
    v13 = type metadata accessor for DisambiguationOption(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v16 = v12[1];
      *v11 = *v12;
      v11[1] = v16;
      v71 = v13;
      v17 = *(int *)(v13 + 20);
      v18 = (char *)v11 + v17;
      v19 = (char *)v12 + v17;
      v20 = type metadata accessor for IconConfiguration();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
        v22 = v71;
      }
      else
      {
        v8((uint64_t *)v18, (uint64_t *)v19, v7);
        v23 = *(int *)(v20 + 20);
        v24 = (int *)v20;
        v25 = &v18[v23];
        v26 = &v19[v23];
        v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
        v69 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
        v70 = v27;
        v69(v25, v26, v27);
        v28 = v24[6];
        v29 = &v18[v28];
        v30 = &v19[v28];
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
        v32 = v24[7];
        v66 = &v19[v32];
        v67 = &v18[v32];
        v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
        v34(v67, v66, v33);
        v34(&v18[v24[8]], &v19[v24[8]], v33);
        v35 = v24[9];
        v36 = &v18[v35];
        v37 = &v19[v35];
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v36, v37, v38);
        v69(&v18[v24[10]], &v19[v24[10]], v70);
        v39 = v24[11];
        v40 = &v18[v39];
        v68 = &v19[v39];
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
        v42 = v40;
        v43 = (uint64_t)v24;
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v42, v68, v41);
        v69(&v18[v24[12]], &v19[v24[12]], v70);
        v69(&v18[*(int *)(v43 + 52)], &v19[*(int *)(v43 + 52)], v70);
        v44 = v24[14];
        v45 = &v18[v44];
        v46 = &v19[v44];
        v47 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
        {
          v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
          memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
        }
        else
        {
          v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v45, v46, v49);
          __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
        }
        v22 = v71;
        __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v43);
      }
      v50 = *(int *)(v22 + 24);
      v51 = (char *)v11 + v50;
      v52 = (char *)v12 + v50;
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v53 - 8) + 16))(v51, v52, v53);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v22);
    }
    v54 = *(int *)(a3 + 20);
    v55 = *(int *)(a3 + 24);
    v56 = (uint64_t *)((char *)a1 + v54);
    v57 = (char *)a2 + v54;
    v59 = *(void **)v57;
    v58 = *((_QWORD *)v57 + 1);
    *v56 = v59;
    v56[1] = v58;
    v60 = (char *)a1 + v55;
    v61 = (char *)a2 + v55;
    v62 = sub_23E1BDE38();
    v63 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v62 - 8) + 16);
    v64 = v59;
    v63(v60, v61, v62);
  }
  return a1;
}

uint64_t sub_23E1B12F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
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
  void (*v30)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = type metadata accessor for DisambiguationSnippetModel(0);
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(v6 + 24);
  v8 = type metadata accessor for DisambiguationOption(0);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    v9 = v7 + *(int *)(v8 + 20);
    v10 = (int *)type metadata accessor for IconConfiguration();
    if (!__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10))
    {
      v5(v9, v4);
      v11 = v9 + v10[5];
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v30 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
      v30(v11, v12);
      v13 = v9 + v10[6];
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
      v15 = v9 + v10[7];
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8);
      v17(v15, v16);
      v17(v9 + v10[8], v16);
      v18 = v9 + v10[9];
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
      v30(v9 + v10[10], v12);
      v20 = v9 + v10[11];
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
      v30(v9 + v10[12], v12);
      v30(v9 + v10[13], v12);
      v22 = v9 + v10[14];
      v23 = type metadata accessor for DirectInvocationConfig();
      if (!__swift_getEnumTagSinglePayload(v22, 1, v23))
      {
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v22, v24);
      }
    }
    v25 = v7 + *(int *)(v8 + 24);
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v25, v26);
  }

  v27 = a1 + *(int *)(a2 + 24);
  v28 = sub_23E1BDE38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
}

uint64_t sub_23E1B1590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t, uint64_t);
  id v61;
  char *v63;
  char *v64;
  char *v65;
  void (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  uint64_t v68;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = type metadata accessor for DisambiguationSnippetModel(0);
  *(_QWORD *)(a1 + *(int *)(v8 + 20)) = *(_QWORD *)(a2 + *(int *)(v8 + 20));
  v9 = *(int *)(v8 + 24);
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  v12 = type metadata accessor for DisambiguationOption(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v68 = a3;
    v14 = v11[1];
    *v10 = *v11;
    v10[1] = v14;
    v15 = *(int *)(v12 + 20);
    v16 = (char *)v10 + v15;
    v17 = (char *)v11 + v15;
    v18 = type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v16, (uint64_t)v17, v6);
      v20 = *(int *)(v18 + 20);
      v21 = (int *)v18;
      v22 = &v16[v20];
      v23 = &v17[v20];
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v66 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
      v67 = v24;
      v66(v22, v23, v24);
      v25 = v21[6];
      v26 = &v16[v25];
      v27 = &v17[v25];
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
      v29 = v21[7];
      v63 = &v17[v29];
      v64 = &v16[v29];
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
      v31(v64, v63, v30);
      v31(&v16[v21[8]], &v17[v21[8]], v30);
      v32 = v21[9];
      v33 = &v16[v32];
      v34 = &v17[v32];
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
      v66(&v16[v21[10]], &v17[v21[10]], v67);
      v36 = v21[11];
      v37 = &v16[v36];
      v65 = &v17[v36];
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      v39 = v37;
      v40 = (uint64_t)v21;
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v39, v65, v38);
      v66(&v16[v21[12]], &v17[v21[12]], v67);
      v66(&v16[*(int *)(v40 + 52)], &v17[*(int *)(v40 + 52)], v67);
      v41 = v21[14];
      v42 = &v16[v41];
      v43 = &v17[v41];
      v44 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v43, 1, v44))
      {
        v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
      }
      else
      {
        v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 16))(v42, v43, v46);
        __swift_storeEnumTagSinglePayload((uint64_t)v42, 0, 1, v44);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v40);
    }
    v47 = *(int *)(v12 + 24);
    v48 = (char *)v10 + v47;
    v49 = (char *)v11 + v47;
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    a3 = v68;
  }
  v51 = *(int *)(a3 + 20);
  v52 = *(int *)(a3 + 24);
  v53 = (_QWORD *)(a1 + v51);
  v54 = a2 + v51;
  v56 = *(void **)v54;
  v55 = *(_QWORD *)(v54 + 8);
  *v53 = v56;
  v53[1] = v55;
  v57 = a1 + v52;
  v58 = a2 + v52;
  v59 = sub_23E1BDE38();
  v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 16);
  v61 = v56;
  v60(v57, v58, v59);
  return a1;
}

uint64_t sub_23E1B196C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  int *v25;
  int v26;
  int v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  void (*v92)(char *, char *, uint64_t);
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  void (*v100)(char *, char *, uint64_t);
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v134;
  char *v135;
  void (*v136)(char *, char *, uint64_t);
  char *v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = type metadata accessor for DisambiguationSnippetModel(0);
  *(_QWORD *)(a1 + *(int *)(v9 + 20)) = *(_QWORD *)(a2 + *(int *)(v9 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(v9 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = type metadata accessor for DisambiguationOption(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    if (v15)
    {
      sub_23E187F20((uint64_t)v11, type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    v138 = a2;
    v145 = a3;
    *v11 = *v12;
    v11[1] = v12[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v140 = v12;
    v143 = v13;
    v22 = *(int *)(v13 + 20);
    v23 = (char *)v11 + v22;
    v24 = (char *)v12 + v22;
    v25 = (int *)type metadata accessor for IconConfiguration();
    v26 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, (uint64_t)v25);
    v27 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, (uint64_t)v25);
    if (v26)
    {
      if (!v27)
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v23, v24, v6);
        v28 = v25[5];
        v29 = &v23[v28];
        v30 = &v24[v28];
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
        v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
        v32(v29, v30, v31);
        v33 = v25[6];
        v34 = &v23[v33];
        v35 = &v24[v33];
        v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
        v37 = v25[7];
        v135 = &v23[v37];
        v38 = &v24[v37];
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        v40 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 16);
        v40(v135, v38, v39);
        v40(&v23[v25[8]], &v24[v25[8]], v39);
        v41 = v25[9];
        v42 = &v23[v41];
        v43 = &v24[v41];
        v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
        v32(&v23[v25[10]], &v24[v25[10]], v31);
        v45 = v25[11];
        v46 = &v23[v45];
        v47 = &v24[v45];
        v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
        v32(&v23[v25[12]], &v24[v25[12]], v31);
        v32(&v23[v25[13]], &v24[v25[13]], v31);
        v49 = v25[14];
        v50 = (uint64_t)v23;
        v51 = &v23[v49];
        v52 = &v24[v49];
        v53 = type metadata accessor for DirectInvocationConfig();
        a2 = v138;
        if (__swift_getEnumTagSinglePayload((uint64_t)v52, 1, v53))
        {
          v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
          memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
        }
        else
        {
          v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v117 - 8) + 16))(v51, v52, v117);
          __swift_storeEnumTagSinglePayload((uint64_t)v51, 0, 1, v53);
        }
        v115 = v50;
        v116 = (uint64_t)v25;
        goto LABEL_25;
      }
    }
    else
    {
      if (!v27)
      {
        v8((uint64_t)v23, (uint64_t)v24, v6);
        v88 = v25[5];
        v89 = &v23[v88];
        v90 = &v24[v88];
        v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
        v92 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v91 - 8) + 24);
        v92(v89, v90, v91);
        v93 = v25[6];
        v94 = &v23[v93];
        v95 = &v24[v93];
        v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v96 - 8) + 24))(v94, v95, v96);
        v97 = v25[7];
        v137 = &v23[v97];
        v98 = &v24[v97];
        v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        v100 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v99 - 8) + 24);
        v100(v137, v98, v99);
        v100(&v23[v25[8]], &v24[v25[8]], v99);
        v101 = v25[9];
        v102 = &v23[v101];
        v103 = &v24[v101];
        v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v104 - 8) + 24))(v102, v103, v104);
        v92(&v23[v25[10]], &v24[v25[10]], v91);
        v105 = v25[11];
        v106 = &v23[v105];
        v107 = &v24[v105];
        v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v108 - 8) + 24))(v106, v107, v108);
        v92(&v23[v25[12]], &v24[v25[12]], v91);
        v92(&v23[v25[13]], &v24[v25[13]], v91);
        v109 = v25[14];
        v110 = &v23[v109];
        v111 = &v24[v109];
        v112 = type metadata accessor for DirectInvocationConfig();
        LODWORD(v107) = __swift_getEnumTagSinglePayload((uint64_t)v110, 1, v112);
        v113 = __swift_getEnumTagSinglePayload((uint64_t)v111, 1, v112);
        if ((_DWORD)v107)
        {
          a2 = v138;
          if (!v113)
          {
            v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v114 - 8) + 16))(v110, v111, v114);
            v115 = (uint64_t)v110;
            v116 = v112;
LABEL_25:
            __swift_storeEnumTagSinglePayload(v115, 0, 1, v116);
LABEL_29:
            v82 = v143;
            a3 = v145;
            v12 = v140;
            goto LABEL_30;
          }
        }
        else
        {
          a2 = v138;
          if (!v113)
          {
            v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v134 - 8) + 24))(v110, v111, v134);
            goto LABEL_29;
          }
          sub_23E187F20((uint64_t)v110, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
        }
        v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v110, v111, *(_QWORD *)(*(_QWORD *)(v118 - 8) + 64));
        goto LABEL_29;
      }
      sub_23E187F20((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    }
    v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v81 - 8) + 64));
    v82 = v143;
    a3 = v145;
    a2 = v138;
LABEL_30:
    v119 = *(int *)(v82 + 24);
    v120 = (char *)v11 + v119;
    v121 = (char *)v12 + v119;
    v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v122 - 8) + 24))(v120, v121, v122);
    goto LABEL_31;
  }
  if (v15)
  {
LABEL_7:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_31;
  }
  v142 = v13;
  v144 = a3;
  *v11 = *v12;
  v11[1] = v12[1];
  v16 = *(int *)(v13 + 20);
  v17 = (char *)v11 + v16;
  v18 = (char *)v12 + v16;
  v19 = (int *)type metadata accessor for IconConfiguration();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    a3 = v144;
  }
  else
  {
    v141 = v12;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v17, v18, v6);
    v55 = v19[5];
    v56 = &v17[v55];
    v57 = &v18[v55];
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v136 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v58 - 8) + 16);
    v139 = v58;
    v136(v56, v57, v58);
    v59 = v19[6];
    v60 = &v17[v59];
    v61 = &v18[v59];
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v62 - 8) + 16))(v60, v61, v62);
    v63 = v19[7];
    v64 = &v17[v63];
    v65 = &v18[v63];
    v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v67 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v66 - 8) + 16);
    v67(v64, v65, v66);
    v67(&v17[v19[8]], &v18[v19[8]], v66);
    v68 = v19[9];
    v69 = &v17[v68];
    v70 = &v18[v68];
    v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v71 - 8) + 16))(v69, v70, v71);
    v136(&v17[v19[10]], &v18[v19[10]], v139);
    v72 = v19[11];
    v73 = &v17[v72];
    v74 = &v18[v72];
    v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v75 - 8) + 16))(v73, v74, v75);
    v136(&v17[v19[12]], &v18[v19[12]], v139);
    v136(&v17[v19[13]], &v18[v19[13]], v139);
    v76 = v19[14];
    v77 = &v17[v76];
    v78 = &v18[v76];
    v79 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v78, 1, v79))
    {
      v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v77, v78, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
    }
    else
    {
      v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v83 - 8) + 16))(v77, v78, v83);
      __swift_storeEnumTagSinglePayload((uint64_t)v77, 0, 1, v79);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, (uint64_t)v19);
    a3 = v144;
    v12 = v141;
  }
  v84 = *(int *)(v142 + 24);
  v85 = (char *)v11 + v84;
  v86 = (char *)v12 + v84;
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v87 - 8) + 16))(v85, v86, v87);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v142);
LABEL_31:
  v123 = *(int *)(a3 + 20);
  v124 = (_QWORD *)(a1 + v123);
  v125 = a2 + v123;
  v126 = *(void **)(a1 + v123);
  v127 = *(void **)(a2 + v123);
  *v124 = v127;
  v128 = v127;

  v124[1] = *(_QWORD *)(v125 + 8);
  v129 = *(int *)(a3 + 24);
  v130 = a1 + v129;
  v131 = a2 + v129;
  v132 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v132 - 8) + 24))(v130, v131, v132);
  return a1;
}

uint64_t sub_23E1B22CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  void (*v55)(char *, char *, uint64_t);
  uint64_t v56;
  uint64_t v57;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = type metadata accessor for DisambiguationSnippetModel(0);
  *(_QWORD *)(a1 + *(int *)(v8 + 20)) = *(_QWORD *)(a2 + *(int *)(v8 + 20));
  v9 = *(int *)(v8 + 24);
  v10 = (_OWORD *)(a1 + v9);
  v11 = (_OWORD *)(a2 + v9);
  v12 = type metadata accessor for DisambiguationOption(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v57 = a3;
    *v10 = *v11;
    v14 = *(int *)(v12 + 20);
    v15 = (char *)v10 + v14;
    v16 = (char *)v11 + v14;
    v17 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v17))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v15, (uint64_t)v16, v6);
      v19 = v17[5];
      v20 = &v15[v19];
      v21 = &v16[v19];
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v55 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32);
      v56 = v22;
      v55(v20, v21, v22);
      v23 = v17[6];
      v24 = &v15[v23];
      v25 = &v16[v23];
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
      v27 = v17[7];
      v51 = &v16[v27];
      v53 = &v15[v27];
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
      v29(v53, v51, v28);
      v29(&v15[v17[8]], &v16[v17[8]], v28);
      v30 = v17[9];
      v31 = &v15[v30];
      v32 = &v16[v30];
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
      v55(&v15[v17[10]], &v16[v17[10]], v56);
      v34 = v17[11];
      v52 = &v16[v34];
      v54 = &v15[v34];
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 32))(v54, v52, v35);
      v55(&v15[v17[12]], &v16[v17[12]], v56);
      v55(&v15[v17[13]], &v16[v17[13]], v56);
      v36 = v17[14];
      v37 = &v15[v36];
      v38 = &v16[v36];
      v39 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v39))
      {
        v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 32))(v37, v38, v41);
        __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v39);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v17);
    }
    v42 = *(int *)(v12 + 24);
    v43 = (char *)v10 + v42;
    v44 = (char *)v11 + v42;
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v43, v44, v45);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    a3 = v57;
  }
  v46 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v47 = a1 + v46;
  v48 = a2 + v46;
  v49 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 32))(v47, v48, v49);
  return a1;
}

uint64_t sub_23E1B2678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  int v27;
  size_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(uint64_t, uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(char *, char *, uint64_t);
  void (*v133)(uint64_t, uint64_t, uint64_t);
  void (*v134)(uint64_t, uint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  _QWORD *v143;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = type metadata accessor for DisambiguationSnippetModel(0);
  *(_QWORD *)(a1 + *(int *)(v9 + 20)) = *(_QWORD *)(a2 + *(int *)(v9 + 20));
  swift_bridgeObjectRelease();
  v10 = *(int *)(v9 + 24);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = type metadata accessor for DisambiguationOption(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    if (v15)
    {
      sub_23E187F20((uint64_t)v11, type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    v22 = v12[1];
    *v11 = *v12;
    v11[1] = v22;
    swift_bridgeObjectRelease();
    v141 = v13;
    v143 = v12;
    v23 = *(int *)(v13 + 20);
    v24 = (uint64_t)v11 + v23;
    v25 = (uint64_t)v12 + v23;
    v26 = (int *)type metadata accessor for IconConfiguration();
    v138 = v24;
    LODWORD(v24) = __swift_getEnumTagSinglePayload(v24, 1, (uint64_t)v26);
    v27 = __swift_getEnumTagSinglePayload(v25, 1, (uint64_t)v26);
    if ((_DWORD)v24)
    {
      if (v27)
      {
        v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
        v29 = (void *)v138;
LABEL_15:
        v56 = (const void *)v25;
LABEL_16:
        memcpy(v29, v56, v28);
LABEL_28:
        v114 = *(int *)(v141 + 24);
        v115 = (char *)v11 + v114;
        v116 = (char *)v143 + v114;
        v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v117 - 8) + 40))(v115, v116, v117);
        goto LABEL_29;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v138, v25, v6);
      v57 = v26[5];
      v58 = v138 + v57;
      v59 = v25 + v57;
      v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v133 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 32);
      v136 = v60;
      v133(v58, v59, v60);
      v61 = v26[6];
      v62 = v138 + v61;
      v63 = v25 + v61;
      v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 32))(v62, v63, v64);
      v65 = v26[7];
      v128 = v138 + v65;
      v66 = v25 + v65;
      v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 32);
      v68(v128, v66, v67);
      v68(v138 + v26[8], v25 + v26[8], v67);
      v69 = v26[9];
      v70 = v138 + v69;
      v71 = v25 + v69;
      v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 32))(v70, v71, v72);
      v133(v138 + v26[10], v25 + v26[10], v136);
      v73 = v26[11];
      v129 = v138 + v73;
      v74 = v25 + v73;
      v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 32))(v129, v74, v75);
      v133(v138 + v26[12], v25 + v26[12], v136);
      v133(v138 + v26[13], v25 + v26[13], v136);
      v76 = v26[14];
      v77 = (void *)(v138 + v76);
      v78 = (const void *)(v25 + v76);
      v79 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v78, 1, v79))
      {
        v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v77, v78, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
      }
      else
      {
        v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v113 - 8) + 32))(v77, v78, v113);
        __swift_storeEnumTagSinglePayload((uint64_t)v77, 0, 1, v79);
      }
      v111 = v138;
      v112 = (uint64_t)v26;
LABEL_27:
      __swift_storeEnumTagSinglePayload(v111, 0, 1, v112);
      goto LABEL_28;
    }
    if (v27)
    {
      sub_23E187F20(v138, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
      v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20) - 8) + 64);
      v29 = (void *)v138;
      goto LABEL_15;
    }
    v8(v138, v25, v6);
    v86 = v26[5];
    v87 = v138 + v86;
    v88 = v25 + v86;
    v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v134 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 40);
    v137 = v89;
    v134(v87, v88, v89);
    v90 = v26[6];
    v91 = v138 + v90;
    v92 = v25 + v90;
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 40))(v91, v92, v93);
    v94 = v26[7];
    v130 = v138 + v94;
    v95 = v25 + v94;
    v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v97 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v96 - 8) + 40);
    v97(v130, v95, v96);
    v97(v138 + v26[8], v25 + v26[8], v96);
    v98 = v26[9];
    v99 = v138 + v98;
    v100 = v25 + v98;
    v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 40))(v99, v100, v101);
    v134(v138 + v26[10], v25 + v26[10], v137);
    v102 = v26[11];
    v131 = v138 + v102;
    v103 = v25 + v102;
    v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v104 - 8) + 40))(v131, v103, v104);
    v134(v138 + v26[12], v25 + v26[12], v137);
    v134(v138 + v26[13], v25 + v26[13], v137);
    v105 = v26[14];
    v106 = v138 + v105;
    v107 = v25 + v105;
    v108 = type metadata accessor for DirectInvocationConfig();
    LODWORD(v103) = __swift_getEnumTagSinglePayload(v106, 1, v108);
    v109 = __swift_getEnumTagSinglePayload(v107, 1, v108);
    if ((_DWORD)v103)
    {
      if (!v109)
      {
        v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v110 - 8) + 32))(v106, v107, v110);
        v111 = v106;
        v112 = v108;
        goto LABEL_27;
      }
    }
    else
    {
      if (!v109)
      {
        v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v127 - 8) + 40))(v106, v107, v127);
        goto LABEL_28;
      }
      sub_23E187F20(v106, (uint64_t (*)(_QWORD))type metadata accessor for DirectInvocationConfig);
    }
    v28 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88) - 8) + 64);
    v29 = (void *)v106;
    v56 = (const void *)v107;
    goto LABEL_16;
  }
  if (v15)
  {
LABEL_7:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_29;
  }
  *(_OWORD *)v11 = *(_OWORD *)v12;
  v140 = v13;
  v142 = v12;
  v16 = *(int *)(v13 + 20);
  v17 = (char *)v11 + v16;
  v18 = (char *)v12 + v16;
  v19 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v139 = a3;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v18, v6);
    v30 = v19[5];
    v31 = &v17[v30];
    v32 = &v18[v30];
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v132 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32);
    v135 = v33;
    v132(v31, v32, v33);
    v34 = v19[6];
    v35 = &v17[v34];
    v36 = &v18[v34];
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 32))(v35, v36, v37);
    v38 = v19[7];
    v39 = &v17[v38];
    v40 = &v18[v38];
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v42 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 32);
    v42(v39, v40, v41);
    v42(&v17[v19[8]], &v18[v19[8]], v41);
    v43 = v19[9];
    v44 = &v17[v43];
    v45 = &v18[v43];
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 32))(v44, v45, v46);
    v132(&v17[v19[10]], &v18[v19[10]], v135);
    v47 = v19[11];
    v48 = &v17[v47];
    v49 = &v18[v47];
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v48, v49, v50);
    v132(&v17[v19[12]], &v18[v19[12]], v135);
    v132(&v17[v19[13]], &v18[v19[13]], v135);
    v51 = v19[14];
    v52 = &v17[v51];
    v53 = &v18[v51];
    v54 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v53, 1, v54))
    {
      v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
      memcpy(v52, v53, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
    }
    else
    {
      v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v81 - 8) + 32))(v52, v53, v81);
      __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v54);
    }
    a3 = v139;
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, (uint64_t)v19);
  }
  v82 = *(int *)(v140 + 24);
  v83 = (char *)v11 + v82;
  v84 = (char *)v142 + v82;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v85 - 8) + 32))(v83, v84, v85);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v140);
LABEL_29:
  v118 = *(int *)(a3 + 20);
  v119 = (_QWORD *)(a1 + v118);
  v120 = (_QWORD *)(a2 + v118);
  v121 = *(void **)(a1 + v118);
  *v119 = *v120;

  v119[1] = v120[1];
  v122 = *(int *)(a3 + 24);
  v123 = a1 + v122;
  v124 = a2 + v122;
  v125 = sub_23E1BDE38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v125 - 8) + 40))(v123, v124, v125);
  return a1;
}

uint64_t sub_23E1B2FB8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1B2FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v6 = OUTLINED_FUNCTION_14_11();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v7 = OUTLINED_FUNCTION_11_1();
    v8 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_23E1B3064()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23E1B3070(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_14_11();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
      OUTLINED_FUNCTION_2_0();
      return;
    }
    v9 = OUTLINED_FUNCTION_11_1();
    v10 = a1 + *(int *)(a4 + 24);
  }
  __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t type metadata accessor for DisambiguationView()
{
  uint64_t result;

  result = qword_256D36020;
  if (!qword_256D36020)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1B3130()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for DisambiguationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    result = sub_23E1BDE38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23E1B31BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E1B31CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;

  v5 = sub_23E1BDE50();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_33();
  v7 = (uint64_t *)(a2 + *(int *)(OUTLINED_FUNCTION_3_7() + 20));
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v7 = sub_23E1BDF04();
  v7[1] = v8;
  sub_23E1914B0(a1, a2, type metadata accessor for DisambiguationSnippetModel);
  if (qword_256D34828 != -1)
    swift_once();
  v9 = (id)qword_256D3AF18;
  sub_23E1BDE2C();
  sub_23E1BE534();
  sub_23E1BDE20();
  if (qword_256D34820 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v5, (uint64_t)qword_256D3AF00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v10, v5);
  sub_23E1BE5B8();
  sub_23E1BE480();
  sub_23E19F4DC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0;
  v12._countAndFlagsBits = 0xD00000000000006BLL;
  v12._object = (void *)0x800000023E1C3280;
  v11._object = (void *)0xE000000000000000;
  Logger.debug(output:test:caller:)(v11, 0, v12);
  swift_bridgeObjectRelease();
  sub_23E187F20(a1, type metadata accessor for DisambiguationSnippetModel);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
}

uint64_t sub_23E1B33F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)();
  uint64_t v16;
  uint64_t v17;

  v3 = v1;
  v17 = a1;
  v4 = OUTLINED_FUNCTION_3_7();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36060);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_33();
  sub_23E1914B0(v3, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v11 = OUTLINED_FUNCTION_16_0();
  sub_23E19147C((uint64_t)v7, v11 + v10, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36068);
  sub_23E18819C(&qword_256D36070, &qword_256D36068);
  sub_23E1BE318();
  sub_23E1914B0(v16, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  v12 = OUTLINED_FUNCTION_16_0();
  sub_23E19147C((uint64_t)v7, v12 + v10, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  v13 = v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v17, v2, v8);
  v14 = (void (**)())(v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D36078) + 36));
  *v14 = sub_23E1B4F88;
  v14[1] = (void (*)())v12;
  v14[2] = 0;
  v14[3] = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
}

uint64_t sub_23E1B35B4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t result;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v51 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
  MEMORY[0x24BDAC7A8](v3);
  v46 = (uint64_t)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = type metadata accessor for DisambiguationOption(0);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (uint64_t *)((char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36080);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v50 = (uint64_t)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v44 - v9;
  v10 = type metadata accessor for DisambiguationView();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = sub_23E1BE384();
  MEMORY[0x24BDAC7A8](v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36088);
  v48 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v49 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v44 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  v19 = v55;
  v20 = v56;
  v57 = MEMORY[0x24BDF1FA8];
  v58 = MEMORY[0x24BEAD6B0];
  v21 = swift_allocObject();
  v55 = v21;
  *(_QWORD *)(v21 + 16) = v19;
  *(_QWORD *)(v21 + 24) = v20;
  v22 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v21 + 32) = 0;
  *(_QWORD *)(v21 + 40) = v22;
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  sub_23E1BE378();
  sub_23E1914B0(a1, (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  v23 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v24 = swift_allocObject();
  sub_23E19147C((uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36090);
  sub_23E18819C(&qword_256D36098, &qword_256D36090);
  sub_23E1BE354();
  v25 = *(void **)(a1 + *(int *)(v10 + 20));
  if (v25)
  {
    v26 = v25;
    sub_23E1BE3E4();

    v27 = sub_23E1BE564();
    v28 = (uint64_t)v47;
    if ((v27 & 1) == 0)
    {
      v29 = type metadata accessor for DisambiguationSnippetModel(0);
      v30 = v46;
      sub_23E191784(a1 + *(int *)(v29 + 24), v46, &qword_256D355A8);
      if (__swift_getEnumTagSinglePayload(v30, 1, v45) != 1)
      {
        v32 = v30;
        v33 = v44;
        sub_23E19147C(v32, (uint64_t)v44, type metadata accessor for DisambiguationOption);
        *(_QWORD *)v28 = sub_23E1BDF88();
        *(_QWORD *)(v28 + 8) = 0;
        *(_BYTE *)(v28 + 16) = 1;
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360B0);
        sub_23E1B4BEC(v33, a1, (_QWORD *)(v28 + *(int *)(v34 + 44)));
        v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360A0);
        __swift_storeEnumTagSinglePayload(v28, 0, 1, v35);
        sub_23E187F20((uint64_t)v33, type metadata accessor for DisambiguationOption);
        goto LABEL_7;
      }
      sub_23E18829C(v30, &qword_256D355A8);
    }
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360A0);
    __swift_storeEnumTagSinglePayload(v28, 1, 1, v31);
LABEL_7:
    v37 = v48;
    v36 = v49;
    v38 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
    v38(v49, v18, v14);
    v39 = v50;
    sub_23E191784(v28, v50, &qword_256D36080);
    v40 = v51;
    v38(v51, v36, v14);
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360A8);
    sub_23E191784(v39, (uint64_t)&v40[*(int *)(v41 + 48)], &qword_256D36080);
    sub_23E18829C(v28, &qword_256D36080);
    v42 = *(void (**)(char *, uint64_t))(v37 + 8);
    v42(v18, v14);
    sub_23E18829C(v39, &qword_256D36080);
    return ((uint64_t (*)(char *, uint64_t))v42)(v36, v14);
  }
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  result = sub_23E1BDEF8();
  __break(1u);
  return result;
}

uint64_t sub_23E1B3AB0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v76 = a2;
  v3 = sub_23E1BE36C();
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v64 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360C0);
  v63 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v62 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
  MEMORY[0x24BDAC7A8](v6);
  v68 = (uint64_t)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = type metadata accessor for DisambiguationOption(0);
  v58 = *(_QWORD *)(v67 - 8);
  v8 = MEMORY[0x24BDAC7A8](v67);
  v59 = v9;
  v60 = (uint64_t)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v61 = (uint64_t *)((char *)&v53 - v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360C8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v74 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v73 = (char *)&v53 - v14;
  v15 = type metadata accessor for DisambiguationView();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360D0);
  v71 = *(_QWORD *)(v69 - 8);
  v18 = MEMORY[0x24BDAC7A8](v69);
  v72 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v53 - v20;
  v22 = type metadata accessor for DisambiguationSnippetModel(0);
  v101 = *(_QWORD *)(a1 + *(int *)(v22 + 20));
  sub_23E1914B0(a1, (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  v23 = *(unsigned __int8 *)(v16 + 80);
  v24 = (v23 + 16) & ~v23;
  v54 = v24 + v17;
  v55 = v23 | 7;
  v25 = swift_allocObject();
  v56 = v24;
  v57 = (uint64_t)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E19147C(v57, v25 + v24, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D355C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D360D8);
  sub_23E18819C(&qword_256D360E0, &qword_256D355C0);
  sub_23E1B52B8();
  sub_23E187EEC(&qword_256D360F8, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
  v70 = v21;
  v26 = MEMORY[0x24BEE0D00];
  sub_23E1BE2DC();
  v27 = *(void **)(a1 + *(int *)(v15 + 20));
  if (v27)
  {
    v28 = v27;
    sub_23E1BE3E4();

    if ((sub_23E1BE564() & 1) != 0)
    {
      v29 = v68;
      sub_23E191784(a1 + *(int *)(v22 + 24), v68, &qword_256D355A8);
      if (__swift_getEnumTagSinglePayload(v29, 1, v67) != 1)
      {
        v35 = v61;
        sub_23E19147C(v29, (uint64_t)v61, type metadata accessor for DisambiguationOption);
        v37 = *v35;
        v36 = v35[1];
        v103 = v26;
        v104 = MEMORY[0x24BEAE5B8];
        v101 = v37;
        v102 = v36;
        v100 = 0;
        v98 = 0u;
        v99 = 0u;
        v97 = 0;
        v95 = 0u;
        v96 = 0u;
        v94 = 0;
        v92 = 0u;
        v93 = 0u;
        v91 = 0;
        v89 = 0u;
        v90 = 0u;
        v88 = 0;
        v86 = 0u;
        v87 = 0u;
        v85 = 0;
        v83 = 0u;
        v84 = 0u;
        v82 = 0;
        v80 = 0u;
        v81 = 0u;
        v79 = 0;
        v77 = 0u;
        v78 = 0u;
        swift_bridgeObjectRetain();
        v38 = v64;
        sub_23E1BE360();
        v39 = v57;
        sub_23E1914B0(a1, v57, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
        v40 = v60;
        sub_23E1914B0((uint64_t)v35, v60, type metadata accessor for DisambiguationOption);
        v41 = (v54 + *(unsigned __int8 *)(v58 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
        v42 = swift_allocObject();
        sub_23E19147C(v39, v42 + v56, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
        sub_23E19147C(v40, v42 + v41, type metadata accessor for DisambiguationOption);
        sub_23E187EEC(&qword_256D360F0, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
        v43 = v62;
        v44 = v66;
        sub_23E1BE0FC();
        swift_release();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v44);
        sub_23E187F20((uint64_t)v35, type metadata accessor for DisambiguationOption);
        v34 = (uint64_t)v73;
        v31 = v75;
        (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v73, v43, v75);
        v30 = 0;
        v32 = v76;
        v33 = (uint64_t)v74;
        goto LABEL_7;
      }
      sub_23E18829C(v29, &qword_256D355A8);
    }
    v30 = 1;
    v31 = v75;
    v32 = v76;
    v34 = (uint64_t)v73;
    v33 = (uint64_t)v74;
LABEL_7:
    __swift_storeEnumTagSinglePayload(v34, v30, 1, v31);
    v46 = v71;
    v45 = v72;
    v47 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
    v49 = v69;
    v48 = v70;
    v47(v72, v70, v69);
    sub_23E191784(v34, v33, &qword_256D360C8);
    v47(v32, v45, v49);
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36100);
    sub_23E191784(v33, (uint64_t)&v32[*(int *)(v50 + 48)], &qword_256D360C8);
    sub_23E18829C(v34, &qword_256D360C8);
    v51 = *(void (**)(char *, uint64_t))(v46 + 8);
    v51(v48, v49);
    sub_23E18829C(v33, &qword_256D360C8);
    return ((uint64_t (*)(char *, uint64_t))v51)(v45, v49);
  }
  sub_23E1BE408();
  sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  result = sub_23E1BDEF8();
  __break(1u);
  return result;
}

void sub_23E1B416C(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  _QWORD v75[2];
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  v88 = a2;
  v103 = a3;
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36108);
  MEMORY[0x24BDAC7A8](v101);
  v102 = (char *)v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DisambiguationOption(0);
  v89 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v90 = v6;
  v93 = (uint64_t)v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DisambiguationView();
  v86 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v87 = v8;
  v92 = (uint64_t)v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23E1BE36C();
  v96 = *(_QWORD *)(v9 - 8);
  v97 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v95 = (char *)v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360C0);
  v99 = *(_QWORD *)(v11 - 8);
  v100 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v94 = (char *)v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v98 = (char *)v75 - v14;
  v15 = sub_23E1BE294();
  v84 = *(_QWORD *)(v15 - 8);
  v85 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v83 = (char *)v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23E1BDDA8();
  MEMORY[0x24BDAC7A8](v17);
  v18 = sub_23E1BE2F4();
  v77 = *(_QWORD *)(v18 - 8);
  v78 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36110);
  v81 = *(_QWORD *)(v21 - 8);
  v82 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v79 = (char *)v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36118);
  MEMORY[0x24BDAC7A8](v80);
  v24 = (char *)v75 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)v75 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for IconConfiguration();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)v75 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = *(int *)(v5 + 20);
  v91 = a1;
  sub_23E191784((uint64_t)a1 + v31, (uint64_t)v27, &qword_256D34E20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28) == 1)
  {
    sub_23E18829C((uint64_t)v27, &qword_256D34E20);
  }
  else
  {
    sub_23E19147C((uint64_t)v27, (uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    sub_23E1BDDCC();
    if (v129)
    {
      v75[1] = v128;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      sub_23E1BDDCC();
      sub_23E1BDD9C();
      swift_bridgeObjectRelease();
      sub_23E1BE300();
      v33 = v83;
      v32 = v84;
      v34 = v85;
      (*(void (**)(char *, _QWORD, uint64_t))(v84 + 104))(v83, *MEMORY[0x24BDF4060], v85);
      sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
      v35 = v79;
      v76 = v30;
      v36 = v78;
      sub_23E1BE114();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
      (*(void (**)(char *, uint64_t))(v77 + 8))(v20, v36);
      v37 = static ColorUtils.fromString(_:)();
      swift_bridgeObjectRelease();
      KeyPath = swift_getKeyPath();
      v40 = v81;
      v39 = v82;
      (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v24, v35, v82);
      v41 = (uint64_t *)&v24[*(int *)(v80 + 36)];
      *v41 = KeyPath;
      v41[1] = v37;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v39);
      sub_23E1B53B4();
      v42 = sub_23E1BE0D8();
      sub_23E18829C((uint64_t)v24, &qword_256D36118);
      v43 = (uint64_t)v91;
      v45 = *v91;
      v44 = v91[1];
      v130 = MEMORY[0x24BEE0D00];
      v131 = MEMORY[0x24BEAE5B8];
      v128 = v45;
      v129 = v44;
      v127 = 0;
      v125 = 0u;
      v126 = 0u;
      v124 = 0;
      v122 = 0u;
      v123 = 0u;
      v121 = 0;
      v119 = 0u;
      v120 = 0u;
      v118 = 0;
      v116 = 0u;
      v117 = 0u;
      v115 = 0;
      v113 = 0u;
      v114 = 0u;
      v112 = 0;
      v110 = 0u;
      v111 = 0u;
      v109 = 0;
      v107 = 0u;
      v108 = 0u;
      *((_QWORD *)&v105 + 1) = MEMORY[0x24BDF4780];
      v106 = MEMORY[0x24BEAD938];
      *(_QWORD *)&v104 = v42;
      swift_bridgeObjectRetain();
      swift_retain();
      v46 = v95;
      sub_23E1BE360();
      v47 = v92;
      sub_23E1914B0(v88, v92, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
      v48 = v93;
      sub_23E1914B0(v43, v93, type metadata accessor for DisambiguationOption);
      v49 = (*(unsigned __int8 *)(v86 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
      v50 = (v87 + *(unsigned __int8 *)(v89 + 80) + v49) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
      v51 = swift_allocObject();
      sub_23E19147C(v47, v51 + v49, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
      sub_23E19147C(v48, v51 + v50, type metadata accessor for DisambiguationOption);
      sub_23E187EEC(&qword_256D360F0, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
      v53 = v52;
      v54 = v94;
      v55 = v97;
      sub_23E1BE0FC();
      swift_release();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v46, v55);
      v57 = v98;
      v56 = v99;
      v58 = v100;
      (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v98, v54, v100);
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v102, v57, v58);
      swift_storeEnumTagMultiPayload();
      v128 = v55;
      v129 = v53;
      swift_getOpaqueTypeConformance2();
      sub_23E1BE018();
      swift_release();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v58);
      sub_23E187F20((uint64_t)v76, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
      return;
    }
    sub_23E187F20((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for IconConfiguration);
  }
  v59 = (uint64_t)v91;
  v61 = *v91;
  v60 = v91[1];
  v130 = MEMORY[0x24BEE0D00];
  v131 = MEMORY[0x24BEAE5B8];
  v128 = v61;
  v129 = v60;
  v127 = 0;
  v125 = 0u;
  v126 = 0u;
  v124 = 0;
  v122 = 0u;
  v123 = 0u;
  v121 = 0;
  v119 = 0u;
  v120 = 0u;
  v118 = 0;
  v116 = 0u;
  v117 = 0u;
  v115 = 0;
  v113 = 0u;
  v114 = 0u;
  v112 = 0;
  v110 = 0u;
  v111 = 0u;
  v109 = 0;
  v107 = 0u;
  v108 = 0u;
  v106 = 0;
  v104 = 0u;
  v105 = 0u;
  swift_bridgeObjectRetain();
  v62 = v95;
  sub_23E1BE360();
  v63 = v92;
  sub_23E1914B0(v88, v92, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  v64 = v93;
  sub_23E1914B0(v59, v93, type metadata accessor for DisambiguationOption);
  v65 = (*(unsigned __int8 *)(v86 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
  v66 = (v87 + *(unsigned __int8 *)(v89 + 80) + v65) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
  v67 = swift_allocObject();
  sub_23E19147C(v63, v67 + v65, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  sub_23E19147C(v64, v67 + v66, type metadata accessor for DisambiguationOption);
  sub_23E187EEC(&qword_256D360F0, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v69 = v68;
  v70 = v94;
  v71 = v97;
  sub_23E1BE0FC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v62, v71);
  v73 = v98;
  v72 = v99;
  v74 = v100;
  (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v98, v70, v100);
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v102, v73, v74);
  swift_storeEnumTagMultiPayload();
  v128 = v71;
  v129 = v69;
  swift_getOpaqueTypeConformance2();
  sub_23E1BE018();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v74);
}

void sub_23E1B4B2C(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + *(int *)(OUTLINED_FUNCTION_3_7() + 20));
  if (v1)
  {
    OUTLINED_FUNCTION_15_6();
    v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    v3 = (id)sub_23E1BDD60();
    sub_23E1BE3FC();

  }
  else
  {
    sub_23E1BE408();
    sub_23E187EEC(&qword_256D349F0, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_23E1BDEF8();
    __break(1u);
  }
}

uint64_t sub_23E1B4BEC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v29 = a2;
  v32 = a3;
  v4 = type metadata accessor for DisambiguationOption(0);
  v30 = *(_QWORD *)(v4 - 8);
  v5 = *(_QWORD *)(v30 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DisambiguationView();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D35338);
  v31 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  v17 = a1[1];
  v33 = *a1;
  v34 = v17;
  sub_23E1914B0(v29, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  sub_23E1914B0((uint64_t)a1, (uint64_t)v6, type metadata accessor for DisambiguationOption);
  v18 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v19 = (v9 + *(unsigned __int8 *)(v30 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  v20 = swift_allocObject();
  sub_23E19147C((uint64_t)v10, v20 + v18, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguationView);
  sub_23E19147C((uint64_t)v6, v20 + v19, type metadata accessor for DisambiguationOption);
  sub_23E193EE8();
  swift_bridgeObjectRetain();
  sub_23E1BE2C4();
  v21 = v31;
  v22 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v22(v14, v16, v11);
  v23 = v32;
  *v32 = 0;
  *((_BYTE *)v23 + 8) = 1;
  v24 = (char *)v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D360B8);
  v22(&v24[*(int *)(v25 + 48)], v14, v11);
  v26 = &v24[*(int *)(v25 + 64)];
  *(_QWORD *)v26 = 0;
  v26[8] = 1;
  v27 = *(void (**)(char *, uint64_t))(v21 + 8);
  v27(v16, v11);
  return ((uint64_t (*)(char *, uint64_t))v27)(v14, v11);
}

void sub_23E1B4E44()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;

  if (qword_256D34828 != -1)
    swift_once();
  type metadata accessor for DisambiguationView();
  sub_23E1BE528();
  sub_23E1BDE14();
  if (qword_256D34820 != -1)
    swift_once();
  v0 = sub_23E1BDE50();
  __swift_project_value_buffer(v0, (uint64_t)qword_256D3AF00);
  v1._countAndFlagsBits = 0xD00000000000006BLL;
  v2._object = (void *)0x800000023E1C3250;
  v1._object = (void *)0x800000023E1C3280;
  v2._countAndFlagsBits = 0xD00000000000002BLL;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_23E1B4F78()
{
  return sub_23E1B4FE0((uint64_t (*)(uint64_t))sub_23E1B35B4);
}

void sub_23E1B4F88()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_9_1(v0);
  sub_23E1B4E44();
}

uint64_t sub_23E1B4FA0()
{
  uint64_t v0;

  sub_23E193F54(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23E1B4FD4()
{
  return sub_23E1B4FE0((uint64_t (*)(uint64_t))sub_23E1B3AB0);
}

uint64_t sub_23E1B4FE0(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_3_7();
  v2 = OUTLINED_FUNCTION_9_1(v1);
  return a1(v2);
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  void (*v16)(uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v2 = OUTLINED_FUNCTION_3_7();
  v3 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = OUTLINED_FUNCTION_14_11();
  swift_bridgeObjectRelease();
  v7 = v3 + *(int *)(v6 + 24);
  v8 = OUTLINED_FUNCTION_15_6();
  if (!OUTLINED_FUNCTION_6_4(v8))
  {
    swift_bridgeObjectRelease();
    v9 = v7 + *(int *)(v1 + 20);
    v10 = (int *)OUTLINED_FUNCTION_24();
    if (!__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10))
    {
      v5(v9, v4);
      v11 = v9 + v10[5];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      OUTLINED_FUNCTION_5_3();
      v12(v11);
      v13 = v9 + v10[6];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      OUTLINED_FUNCTION_5_3();
      v14(v13);
      v25 = v9 + v10[7];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      OUTLINED_FUNCTION_7_7(v25);
      OUTLINED_FUNCTION_7_7(v9 + v10[8]);
      v15 = v9 + v10[9];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      OUTLINED_FUNCTION_5_3();
      v16(v15);
      OUTLINED_FUNCTION_7_7(v9 + v10[10]);
      v26 = v9 + v10[11];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      OUTLINED_FUNCTION_5_3();
      v17(v26);
      OUTLINED_FUNCTION_7_7(v9 + v10[12]);
      OUTLINED_FUNCTION_7_7(v9 + v10[13]);
      v18 = v9 + v10[14];
      v19 = OUTLINED_FUNCTION_19_11();
      if (!OUTLINED_FUNCTION_18_9(v18, v20, v19))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        OUTLINED_FUNCTION_4_3(v21);
      }
    }
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    OUTLINED_FUNCTION_12_4(v22);
  }

  v23 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_13_0(v23);
  return swift_deallocObject();
}

void sub_23E1B5270(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_3_7() - 8) + 80);
  sub_23E1B416C(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_23E1B52B8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_256D360E8;
  if (!qword_256D360E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D360D8);
    v2 = sub_23E1BE36C();
    sub_23E187EEC(&qword_256D360F0, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
    v4[2] = v2;
    v4[3] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = v4[0];
    result = MEMORY[0x24264D408](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_256D360E8);
  }
  return result;
}

uint64_t sub_23E1B5360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1BDF40();
  *a1 = result;
  return result;
}

uint64_t sub_23E1B5388()
{
  swift_retain();
  return sub_23E1BDF4C();
}

unint64_t sub_23E1B53B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_256D36120;
  if (!qword_256D36120)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D36118);
    v2 = sub_23E1BE2F4();
    sub_23E187EEC(&qword_256D34B38, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_23E18819C(&qword_256D36128, &qword_256D36130);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_256D36120);
  }
  return result;
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  uint64_t v37;
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
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  uint64_t v67;

  v1 = v0;
  v2 = OUTLINED_FUNCTION_3_7();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = OUTLINED_FUNCTION_15_6();
  v7 = (v4 + v5 + *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (int *)(v0 + v4);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v66 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v66(v0 + v4, v9);
  v10 = OUTLINED_FUNCTION_14_11();
  swift_bridgeObjectRelease();
  v11 = v0 + v4 + *(int *)(v10 + 24);
  if (!__swift_getEnumTagSinglePayload(v11, 1, v6))
  {
    v63 = v7;
    swift_bridgeObjectRelease();
    v12 = v11 + *(int *)(v6 + 20);
    v13 = (int *)OUTLINED_FUNCTION_24();
    if (!__swift_getEnumTagSinglePayload(v12, 1, (uint64_t)v13))
    {
      OUTLINED_FUNCTION_16_6(v12, v14, v15, v16, v17, v18, v19, v20, v61, (uint64_t)v62, v63, v65, v66);
      v65 = v0;
      v21 = v12 + v13[5];
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      OUTLINED_FUNCTION_5_3();
      v62 = v22;
      v23 = v21;
      v25 = v24;
      ((void (*)(uint64_t))v22)(v23);
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      OUTLINED_FUNCTION_8_9(v26);
      v61 = v12 + v13[7];
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v28 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8);
      v28(v61, v27);
      v28(v12 + v13[8], v27);
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      OUTLINED_FUNCTION_8_9(v29);
      v62(v12 + v13[10], v25);
      v30 = v12 + v13[11];
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      v32 = v30;
      v1 = v65;
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(v32, v31);
      OUTLINED_FUNCTION_17_9(v13[12]);
      OUTLINED_FUNCTION_17_9(v13[13]);
      v33 = v12 + v13[14];
      v34 = OUTLINED_FUNCTION_19_11();
      if (!OUTLINED_FUNCTION_18_9(v33, v35, v34))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        OUTLINED_FUNCTION_5_3();
        v36(v33);
      }
    }
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    OUTLINED_FUNCTION_4_3(v37);
    v7 = v63;
  }

  v38 = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_12_4(v38);
  swift_bridgeObjectRelease();
  v39 = v1 + v7 + *(int *)(v6 + 20);
  v40 = OUTLINED_FUNCTION_24();
  if (!OUTLINED_FUNCTION_6_4(v40))
  {
    OUTLINED_FUNCTION_16_6(v39, v41, v42, v43, v44, v45, v46, v47, v61, (uint64_t)v62, v63, v65, v66);
    v48 = v39 + v8[5];
    v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
    v64 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 8);
    v64(v48, v67);
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
    OUTLINED_FUNCTION_4_3(v49);
    v50 = v39 + v8[7];
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
    v52 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 8);
    v52(v50, v51);
    v52(v39 + v8[8], v51);
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
    OUTLINED_FUNCTION_4_3(v53);
    v64(v39 + v8[10], v67);
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
    OUTLINED_FUNCTION_4_3(v54);
    OUTLINED_FUNCTION_21_8(v8[12]);
    OUTLINED_FUNCTION_21_8(v8[13]);
    v55 = v39 + v8[14];
    v56 = OUTLINED_FUNCTION_19_11();
    if (!OUTLINED_FUNCTION_18_9(v55, v57, v56))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      OUTLINED_FUNCTION_5_3();
      v58(v55);
    }
  }
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  OUTLINED_FUNCTION_13_0(v59);
  return swift_deallocObject();
}

void sub_23E1B586C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = OUTLINED_FUNCTION_3_7();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  OUTLINED_FUNCTION_15_6();
  sub_23E1B4B2C(v0 + v2);
  OUTLINED_FUNCTION_2_0();
}

unint64_t sub_23E1B58C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_256D36138;
  if (!qword_256D36138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D36078);
    sub_23E18819C(&qword_256D36140, &qword_256D36060);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24264D408](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D36138);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return type metadata accessor for DisambiguationView();
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_7_7(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_8_9(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_11()
{
  return type metadata accessor for DisambiguationSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_16_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t (*a13)(uint64_t, uint64_t))
{
  uint64_t v13;

  return a13(a1, v13);
}

uint64_t OUTLINED_FUNCTION_17_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v2 + a1, v1);
}

uint64_t OUTLINED_FUNCTION_18_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, 1, a3);
}

uint64_t OUTLINED_FUNCTION_19_11()
{
  return type metadata accessor for DirectInvocationConfig();
}

uint64_t OUTLINED_FUNCTION_21_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  return v2(v3 + a1, v1);
}

void sub_23E1B59BC()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_4_12();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E1B5A14(uint64_t a1, uint64_t a2)
{
  sub_23E1B5C64(a1, a2, (uint64_t (*)(void))sub_23E18B110);
}

uint64_t sub_23E1B5A20(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  char v8;

  v2 = 0xD000000000000017;
  v3 = 0x800000023E1C2000;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD00000000000001CLL;
    else
      v5 = 0x6944646C756F6873;
    if (v4 == 1)
      v6 = 0x800000023E1C2020;
    else
      v6 = 0xED000079616C7073;
  }
  else
  {
    v5 = 0xD000000000000017;
    v6 = 0x800000023E1C2000;
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 0xD00000000000001CLL;
    else
      v2 = 0x6944646C756F6873;
    if (a2 == 1)
      v3 = 0x800000023E1C2020;
    else
      v3 = 0xED000079616C7073;
  }
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_23E1BE6B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_23E1B5B2C(uint64_t a1, uint64_t a2)
{
  sub_23E1B5C64(a1, a2, (uint64_t (*)(void))sub_23E188A10);
}

void sub_23E1B5B38(uint64_t a1, uint64_t a2)
{
  sub_23E1B5C64(a1, a2, (uint64_t (*)(void))sub_23E1ADC34);
}

void sub_23E1B5B44()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_4_12();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E1B5B9C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_4_12();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E1B5BF4(uint64_t a1, uint64_t a2)
{
  sub_23E1B5C64(a1, a2, (uint64_t (*)(void))sub_23E19B684);
}

void sub_23E1B5C00()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_4_12();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E1B5C58(uint64_t a1, uint64_t a2)
{
  sub_23E1B5C64(a1, a2, (uint64_t (*)(void))sub_23E1814EC);
}

void sub_23E1B5C64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3();
  v7 = v6;
  if (v5 != ((uint64_t (*)(uint64_t))a3)(a2) || v7 != v8)
    OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_9_7();
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_23E1B5CD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = SnippetHomeDeviceType.rawValue.getter();
  v2 = v1;
  if (v0 == SnippetHomeDeviceType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_9_7();
  return v5 & 1;
}

void sub_23E1B5D50(uint64_t a1)
{
  sub_23E1B5DD4(a1, (void (*)(uint64_t))sub_23E1814EC);
}

void sub_23E1B5D5C(uint64_t a1)
{
  sub_23E1B5DD4(a1, (void (*)(uint64_t))sub_23E188A10);
}

void sub_23E1B5D68(uint64_t a1)
{
  sub_23E1B5DD4(a1, (void (*)(uint64_t))sub_23E18B110);
}

void sub_23E1B5D74(uint64_t a1)
{
  sub_23E1B5DD4(a1, (void (*)(uint64_t))sub_23E19B684);
}

void sub_23E1B5D80()
{
  sub_23E1B6104();
}

void sub_23E1B5D8C()
{
  sub_23E1B62A8();
}

void sub_23E1B5D98()
{
  OUTLINED_FUNCTION_17_10();
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B5DBC()
{
  sub_23E1B60AC();
}

void sub_23E1B5DC8(uint64_t a1)
{
  sub_23E1B5DD4(a1, (void (*)(uint64_t))sub_23E1ADC34);
}

void sub_23E1B5DD4(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_17_10();
  a2(a1);
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B5E0C()
{
  OUTLINED_FUNCTION_17_10();
  OUTLINED_FUNCTION_25_6();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B5E34()
{
  sub_23E1B6068();
}

uint64_t sub_23E1B5E40()
{
  return sub_23E1B61B4();
}

uint64_t sub_23E1B5E4C()
{
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_1_10();
}

uint64_t sub_23E1B5E84(uint64_t a1, uint64_t a2)
{
  return sub_23E1B6008(a1, a2, (void (*)(uint64_t))sub_23E18B110);
}

uint64_t sub_23E1B5E90()
{
  sub_23E1BE45C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E1B5F1C(uint64_t a1, uint64_t a2)
{
  return sub_23E1B6008(a1, a2, (void (*)(uint64_t))sub_23E188A10);
}

uint64_t sub_23E1B5F28()
{
  return sub_23E1BE45C();
}

uint64_t sub_23E1B5F3C(uint64_t a1, uint64_t a2)
{
  return sub_23E1B6008(a1, a2, (void (*)(uint64_t))sub_23E1ADC34);
}

uint64_t sub_23E1B5F48()
{
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_1_10();
}

uint64_t sub_23E1B5F80()
{
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_1_10();
}

uint64_t sub_23E1B5FB8(uint64_t a1, uint64_t a2)
{
  return sub_23E1B6008(a1, a2, (void (*)(uint64_t))sub_23E19B684);
}

uint64_t sub_23E1B5FC4()
{
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_1_10();
}

uint64_t sub_23E1B5FFC(uint64_t a1, uint64_t a2)
{
  return sub_23E1B6008(a1, a2, (void (*)(uint64_t))sub_23E1814EC);
}

uint64_t sub_23E1B6008(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  OUTLINED_FUNCTION_13_8();
  return OUTLINED_FUNCTION_1_10();
}

uint64_t sub_23E1B6030()
{
  SnippetHomeDeviceType.rawValue.getter();
  OUTLINED_FUNCTION_13_8();
  return swift_bridgeObjectRelease();
}

void sub_23E1B6068()
{
  OUTLINED_FUNCTION_12_12();
  SnippetHomeDeviceType.rawValue.getter();
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B60A0(uint64_t a1, uint64_t a2)
{
  sub_23E1B6270(a1, a2, (void (*)(uint64_t))sub_23E1814EC);
}

void sub_23E1B60AC()
{
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B60F8(uint64_t a1, uint64_t a2)
{
  sub_23E1B6270(a1, a2, (void (*)(uint64_t))sub_23E19B684);
}

void sub_23E1B6104()
{
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B6150()
{
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_25_6();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B6178(uint64_t a1, uint64_t a2)
{
  sub_23E1B6270(a1, a2, (void (*)(uint64_t))sub_23E1ADC34);
}

void sub_23E1B6184()
{
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_16_7();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B61A8(uint64_t a1, uint64_t a2)
{
  sub_23E1B6270(a1, a2, (void (*)(uint64_t))sub_23E188A10);
}

uint64_t sub_23E1B61B4()
{
  sub_23E1BE6CC();
  sub_23E1BE45C();
  swift_bridgeObjectRelease();
  return sub_23E1BE6E4();
}

void sub_23E1B6264(uint64_t a1, uint64_t a2)
{
  sub_23E1B6270(a1, a2, (void (*)(uint64_t))sub_23E18B110);
}

void sub_23E1B6270(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_12_12();
  a3(a2);
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

void sub_23E1B62A8()
{
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_0_9();
}

unint64_t CallToActionSnippetModel.description.getter()
{
  void *v0;
  id v1;

  sub_23E1BE5B8();
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_11_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v0 = (void *)sub_23E1BDD60();
  v1 = objc_msgSend(v0, sel_description);
  sub_23E1BE42C();

  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE480();
  swift_bridgeObjectRelease();
  sub_23E1BE5B8();
  OUTLINED_FUNCTION_25();
  sub_23E1BE480();
  OUTLINED_FUNCTION_31();
  sub_23E1BE480();
  OUTLINED_FUNCTION_31();
  sub_23E1BE480();
  return 0xD000000000000019;
}

uint64_t CallToActionSnippetModel.callToActionButtonLabel.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  return v1;
}

void CallToActionSnippetModel.callToActionDirectInvocation.getter()
{
  OUTLINED_FUNCTION_11_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  sub_23E1BDD60();
  OUTLINED_FUNCTION_9();
}

uint64_t type metadata accessor for CallToActionSnippetModel()
{
  uint64_t result;

  result = qword_256D361C8;
  if (!qword_256D361C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CallToActionSnippetModel.init(callToActionButtonLabel:callToActionDirectInvocation:shouldDisplay:)@<X0>(char a1@<W3>, uint64_t a2@<X8>)
{
  *(_BYTE *)(a2 + *(int *)(OUTLINED_FUNCTION_11_8() + 24)) = a1;
  sub_23E1BDDB4();
  sub_23E18B5A4();
  return sub_23E1BDD48();
}

uint64_t sub_23E1B6630()
{
  swift_bridgeObjectRetain();
  return CallToActionSnippetModel.callToActionButtonLabel.setter();
}

uint64_t CallToActionSnippetModel.callToActionButtonLabel.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  return sub_23E1BDDD8();
}

void CallToActionSnippetModel.callToActionButtonLabel.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v1[4] = sub_23E1BDDC0();
  OUTLINED_FUNCTION_2_0();
}

void sub_23E1B66E8(id *a1)
{
  id v1;

  v1 = *a1;
  CallToActionSnippetModel.callToActionDirectInvocation.setter();
}

void CallToActionSnippetModel.callToActionDirectInvocation.setter()
{
  OUTLINED_FUNCTION_11_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  sub_23E1BDD6C();
  OUTLINED_FUNCTION_9();
}

void CallToActionSnippetModel.callToActionDirectInvocation.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_3_0();
  *v0 = v1;
  OUTLINED_FUNCTION_11_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v1[4] = sub_23E1BDD54();
  OUTLINED_FUNCTION_2_0();
}

uint64_t CallToActionSnippetModel.shouldDisplay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_11_8() + 24));
}

void CallToActionSnippetModel.shouldDisplay.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_11_8() + 24)) = a1;
  OUTLINED_FUNCTION_9();
}

uint64_t (*CallToActionSnippetModel.shouldDisplay.modify())()
{
  OUTLINED_FUNCTION_11_8();
  return nullsub_1;
}

uint64_t sub_23E1B6804()
{
  unint64_t v0;

  v0 = sub_23E1BE618();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_23E1B6850(char a1)
{
  uint64_t result;

  result = 0xD000000000000017;
  if (a1)
  {
    if (a1 == 1)
      return 0xD00000000000001CLL;
    else
      return 0x6944646C756F6873;
  }
  return result;
}

uint64_t sub_23E1B68BC(unsigned __int8 *a1, char *a2)
{
  return sub_23E1B5A20(*a1, *a2);
}

uint64_t sub_23E1B68C8()
{
  return sub_23E1B5E40();
}

uint64_t sub_23E1B68D0()
{
  return sub_23E1B5E90();
}

uint64_t sub_23E1B68D8()
{
  return sub_23E1B61B4();
}

uint64_t sub_23E1B68E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1B6804();
  *a1 = result;
  return result;
}

uint64_t sub_23E1B690C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23E1B6850(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23E1B6934()
{
  char *v0;

  return sub_23E1B6850(*v0);
}

uint64_t sub_23E1B693C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23E1B684C();
  *a1 = result;
  return result;
}

uint64_t sub_23E1B6960()
{
  sub_23E1B6C9C();
  return sub_23E1BE708();
}

uint64_t sub_23E1B6988()
{
  sub_23E1B6C9C();
  return sub_23E1BE714();
}

Swift::String __swiftcall CallToActionSnippetModel.responseViewId()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x800000023E1C3390;
  v1 = 0xD00000000000001BLL;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

void CallToActionSnippetModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v13 = *(_QWORD *)(v3 - 8);
  v14 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v6 = v5 - v4;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36148);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8();
  v7 = type metadata accessor for CallToActionSnippetModel();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1B6C9C();
  sub_23E1BE6F0();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_23E1BE63C();
    sub_23E1BDDB4();
    sub_23E18C068(&qword_256D34E40);
    sub_23E1BE654();
    sub_23E1BDD60();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v6, v14);
    sub_23E18B5A4();
    sub_23E1BDD48();
    v11 = sub_23E1BE648();
    OUTLINED_FUNCTION_9_12();
    *(_BYTE *)(v10 + *(int *)(v7 + 24)) = v11 & 1;
    sub_23E1B6CD8(v10, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_23E1A7808(v10);
  }
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E1B6C9C()
{
  unint64_t result;

  result = qword_256D36150;
  if (!qword_256D36150)
  {
    result = MEMORY[0x24264D408](&unk_23E1C10D4, &type metadata for CallToActionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36150);
  }
  return result;
}

uint64_t sub_23E1B6CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CallToActionSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void CallToActionSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  v7 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36158);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1B6C9C();
  sub_23E1BE6FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  sub_23E1BDDCC();
  sub_23E1BE678();
  if (v8)
  {
    OUTLINED_FUNCTION_19_12();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for CallToActionSnippetModel();
    sub_23E1BDD60();
    sub_23E18B5A4();
    sub_23E1BDD48();
    sub_23E18C068(&qword_256D34E58);
    sub_23E1BE690();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v2);
    sub_23E1BE684();
    OUTLINED_FUNCTION_19_12();
  }
  OUTLINED_FUNCTION_9_0();
}

uint64_t CallToActionSnippetModel.stringId.getter()
{
  return 0;
}

void sub_23E1B6F20()
{
  sub_23E1B6F68(&qword_256D36160);
}

void sub_23E1B6F44()
{
  sub_23E1B6F68(&qword_256D36168);
}

void sub_23E1B6F68(_QWORD *a1)
{
  if (!*a1)
  {
    type metadata accessor for CallToActionSnippetModel();
    OUTLINED_FUNCTION_14_0();
  }
  OUTLINED_FUNCTION_9();
}

void sub_23E1B6F9C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CallToActionSnippetModel.init(from:)(a1, a2);
}

void sub_23E1B6FB0(_QWORD *a1)
{
  CallToActionSnippetModel.encode(to:)(a1);
}

void sub_23E1B6FC4(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = CallToActionSnippetModel.callToActionButtonLabel.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_9();
}

void sub_23E1B6FEC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  CallToActionSnippetModel.callToActionDirectInvocation.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_9();
}

_QWORD *initializeBufferWithCopyOfBuffer for CallToActionSnippetModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for CallToActionSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for CallToActionSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23E1B73A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
LABEL_5:
    __swift_getEnumTagSinglePayload(v8, a2, v7);
    return;
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_2_0();
}

uint64_t storeEnumTagSinglePayload for CallToActionSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1B7464(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

void sub_23E1B7508()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E18A750();
  if (v0 <= 0x3F)
  {
    sub_23E1A5C90();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t storeEnumTagSinglePayload for CallToActionSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1B75E0 + 4 * byte_23E1C0F05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1B7614 + 4 * byte_23E1C0F00[v4]))();
}

uint64_t sub_23E1B7614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1B761C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1B7624);
  return result;
}

uint64_t sub_23E1B7630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1B7638);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1B763C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1B7644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CallToActionSnippetModel.CodingKeys()
{
  return &type metadata for CallToActionSnippetModel.CodingKeys;
}

unint64_t sub_23E1B7664()
{
  unint64_t result;

  result = qword_256D36208;
  if (!qword_256D36208)
  {
    result = MEMORY[0x24264D408](&unk_23E1C10AC, &type metadata for CallToActionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36208);
  }
  return result;
}

unint64_t sub_23E1B76A4()
{
  unint64_t result;

  result = qword_256D36210;
  if (!qword_256D36210)
  {
    result = MEMORY[0x24264D408](&unk_23E1C0FE4, &type metadata for CallToActionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36210);
  }
  return result;
}

unint64_t sub_23E1B76E4()
{
  unint64_t result;

  result = qword_256D36218;
  if (!qword_256D36218)
  {
    result = MEMORY[0x24264D408](&unk_23E1C100C, &type metadata for CallToActionSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36218);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return sub_23E1BE6B4();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return sub_23E1BE45C();
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return sub_23E1BE45C();
}

uint64_t OUTLINED_FUNCTION_8_10()
{
  return sub_23E1BE6E4();
}

uint64_t OUTLINED_FUNCTION_9_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 104), v1);
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return type metadata accessor for CallToActionSnippetModel();
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return sub_23E1BE6CC();
}

uint64_t OUTLINED_FUNCTION_13_8()
{
  return sub_23E1BE45C();
}

uint64_t OUTLINED_FUNCTION_16_7()
{
  return sub_23E1BE45C();
}

uint64_t OUTLINED_FUNCTION_17_10()
{
  return sub_23E1BE6CC();
}

uint64_t OUTLINED_FUNCTION_19_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_25_6()
{
  return sub_23E1B5F48();
}

unint64_t static HomeAutomationSnippetModels.bundleName.getter()
{
  return 0xD000000000000016;
}

uint64_t HomeAutomationSnippetModels.snippetHidden(for:idiom:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = sub_23E1BDE08();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8();
  v6 = v5 - v4;
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_33();
  sub_23E1B7958(v0, v1);
  if ((swift_getEnumCaseMultiPayload() | 2) == 2)
  {
    v8 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEA8968], v2);
    v8 = sub_23E1BDDFC();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  sub_23E180BA4(v1, (uint64_t (*)(_QWORD))type metadata accessor for HomeAutomationSnippetModels);
  return v8 & 1;
}

uint64_t type metadata accessor for HomeAutomationSnippetModels()
{
  uint64_t result;

  result = qword_256D36350;
  if (!qword_256D36350)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1B7958(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeAutomationSnippetModels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void HomeAutomationSnippetModels.description.getter()
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

  type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8();
  type metadata accessor for CallToActionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_33();
  type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_19_13();
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9_6();
  type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_5();
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_33_3();
  sub_23E1B7958(v0, v1);
  v9 = (char *)sub_23E1B7AC4 + 4 * byte_23E1C1200[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E1B7AC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_7_9(v1, v2);
  sub_23E19F4DC();
  OUTLINED_FUNCTION_15_10();
  sub_23E180BA4(v2, type metadata accessor for DisambiguationSnippetModel);
  return v0;
}

uint64_t sub_23E1B7BE4()
{
  return sub_23E1BE6D8();
}

uint64_t sub_23E1B7C08()
{
  return 12383;
}

void sub_23E1B7C14()
{
  sub_23E1B8050();
}

BOOL sub_23E1B7C30(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23E1B7C40()
{
  return sub_23E1BE6D8();
}

uint64_t sub_23E1B7C64(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  BOOL v6;
  char v8;

  if (a1 == 0xD000000000000012 && a2 == 0x800000023E1C3400 || (sub_23E1BE6B4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023E1C3420 || (sub_23E1BE6B4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = a1 == 0x6974656C706D6F63 && a2 == 0xEE00776569566E6FLL;
    if (v5 || (sub_23E1BE6B4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v6 = a1 == 0x6974616D6F747561 && a2 == 0xEE00776569566E6FLL;
      if (v6 || (sub_23E1BE6B4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x800000023E1C3440 || (sub_23E1BE6B4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0x74617265706D6574 && a2 == 0xEF77656956657275)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        v8 = sub_23E1BE6B4();
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
          return 5;
        else
          return 6;
      }
    }
  }
}

uint64_t sub_23E1B7EE4()
{
  sub_23E1BE6CC();
  sub_23E1BE6D8();
  return sub_23E1BE6E4();
}

uint64_t sub_23E1B7F28(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E1B7F64 + 4 * byte_23E1C1206[a1]))(0xD000000000000012, 0x800000023E1C3400);
}

unint64_t sub_23E1B7F64()
{
  return 0xD000000000000010;
}

uint64_t sub_23E1B7FC0()
{
  return 0x74617265706D6574;
}

uint64_t sub_23E1B7FE4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23E1BE6B4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_23E1B8050()
{
  sub_23E1BE6CC();
  OUTLINED_FUNCTION_29_3();
  sub_23E1BE6E4();
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_23E1B8084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1B7FE4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23E1B80AC()
{
  sub_23E1B8AB8();
  return sub_23E1BE708();
}

uint64_t sub_23E1B80D4()
{
  sub_23E1B8AB8();
  return sub_23E1BE714();
}

uint64_t sub_23E1B80FC()
{
  sub_23E1B8A7C();
  return sub_23E1BE708();
}

uint64_t sub_23E1B8124()
{
  sub_23E1B8A7C();
  return sub_23E1BE714();
}

BOOL sub_23E1B814C(char *a1, char *a2)
{
  return sub_23E1B7C30(*a1, *a2);
}

uint64_t sub_23E1B8158()
{
  return sub_23E1B7EE4();
}

uint64_t sub_23E1B8160()
{
  return sub_23E1B7C40();
}

uint64_t sub_23E1B8168()
{
  sub_23E1BE6CC();
  sub_23E1BE6D8();
  return sub_23E1BE6E4();
}

uint64_t sub_23E1B81A8()
{
  unsigned __int8 *v0;

  return sub_23E1B7F28(*v0);
}

uint64_t sub_23E1B81B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1B7C64(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23E1B81D4()
{
  sub_23E1B8A04();
  return sub_23E1BE708();
}

uint64_t sub_23E1B81FC()
{
  sub_23E1B8A04();
  return sub_23E1BE714();
}

uint64_t sub_23E1B8224()
{
  sub_23E1B8AF4();
  return sub_23E1BE708();
}

uint64_t sub_23E1B824C()
{
  sub_23E1B8AF4();
  return sub_23E1BE714();
}

uint64_t sub_23E1B8274()
{
  sub_23E1B8B30();
  return sub_23E1BE708();
}

uint64_t sub_23E1B829C()
{
  sub_23E1B8B30();
  return sub_23E1BE714();
}

uint64_t sub_23E1B82C4()
{
  sub_23E1B8B6C();
  return sub_23E1BE708();
}

uint64_t sub_23E1B82EC()
{
  sub_23E1B8B6C();
  return sub_23E1BE714();
}

void sub_23E1B8314()
{
  sub_23E1BE6CC();
  OUTLINED_FUNCTION_29_3();
  sub_23E1BE6E4();
  OUTLINED_FUNCTION_0_9();
}

uint64_t sub_23E1B8340()
{
  sub_23E1B8A40();
  return sub_23E1BE708();
}

uint64_t sub_23E1B8368()
{
  sub_23E1B8A40();
  return sub_23E1BE714();
}

void HomeAutomationSnippetModels.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36220);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_17_11(v5, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36228);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18_10(v7, v24);
  type metadata accessor for CallToActionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36230);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36238);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_3();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36240);
  OUTLINED_FUNCTION_15_2(v13, (uint64_t)&v27);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36248);
  OUTLINED_FUNCTION_15_2(v16, (uint64_t)&v26);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v17);
  v18 = OUTLINED_FUNCTION_19_13();
  type metadata accessor for DisambiguationSnippetModel(v18);
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_8();
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_9_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D36250);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_10_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1B8A04();
  sub_23E1BE6FC();
  sub_23E1B7958(v25, v1);
  v22 = (char *)sub_23E1B8690 + 4 * byte_23E1C120C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_23E1B8690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_7_9(v1, v2);
  *(_BYTE *)(v3 - 70) = 0;
  sub_23E1B8B6C();
  v4 = *(_QWORD *)(v3 - 120);
  sub_23E1BE66C();
  OUTLINED_FUNCTION_14_12(&qword_256D35600, v5, (uint64_t)&protocol conformance descriptor for DisambiguationSnippetModel);
  v6 = *(_QWORD *)(v3 - 336);
  OUTLINED_FUNCTION_12_13();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 344) + 8))(v0, v6);
  sub_23E180BA4(v2, type metadata accessor for DisambiguationSnippetModel);
  OUTLINED_FUNCTION_9_13(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 128) + 8));
  OUTLINED_FUNCTION_9_0();
}

unint64_t sub_23E1B8A04()
{
  unint64_t result;

  result = qword_256D36258;
  if (!qword_256D36258)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1B14, &type metadata for HomeAutomationSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36258);
  }
  return result;
}

unint64_t sub_23E1B8A40()
{
  unint64_t result;

  result = qword_256D36260;
  if (!qword_256D36260)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1AC4, &type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36260);
  }
  return result;
}

unint64_t sub_23E1B8A7C()
{
  unint64_t result;

  result = qword_256D36268;
  if (!qword_256D36268)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1A74, &type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36268);
  }
  return result;
}

unint64_t sub_23E1B8AB8()
{
  unint64_t result;

  result = qword_256D36270;
  if (!qword_256D36270)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1A24, &type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36270);
  }
  return result;
}

unint64_t sub_23E1B8AF4()
{
  unint64_t result;

  result = qword_256D36278;
  if (!qword_256D36278)
  {
    result = MEMORY[0x24264D408](&unk_23E1C19D4, &type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36278);
  }
  return result;
}

unint64_t sub_23E1B8B30()
{
  unint64_t result;

  result = qword_256D36280;
  if (!qword_256D36280)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1984, &type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36280);
  }
  return result;
}

unint64_t sub_23E1B8B6C()
{
  unint64_t result;

  result = qword_256D36288;
  if (!qword_256D36288)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1934, &type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36288);
  }
  return result;
}

void HomeAutomationSnippetModels.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61[26];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v65 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36290);
  v5 = *(_QWORD *)(v4 - 8);
  v61[18] = v4;
  v61[19] = v5;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_17_11(v7, v61[0]);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D36298);
  v61[16] = *(_QWORD *)(v8 - 8);
  v61[17] = v8;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  v64 = v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D362A0);
  v61[14] = *(_QWORD *)(v11 - 8);
  v61[15] = v11;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_3();
  v61[23] = v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D362A8);
  v61[12] = *(_QWORD *)(v14 - 8);
  v61[13] = v14;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3();
  v61[22] = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D362B0);
  OUTLINED_FUNCTION_15_2(v17, (uint64_t)&v70);
  v61[10] = v18;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3();
  v61[21] = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D362B8);
  OUTLINED_FUNCTION_15_2(v21, (uint64_t)&v69);
  v61[8] = v22;
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_18_10(v24, v61[0]);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D362C0);
  v63 = *(_QWORD *)(v66 - 8);
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_33_3();
  v62 = type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v61[7] = (uint64_t)v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v61[25] = (uint64_t)v61 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v61 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)v61 - v35;
  v37 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)v61 - v38;
  v40 = MEMORY[0x24BDAC7A8](v37);
  v42 = (char *)v61 - v41;
  MEMORY[0x24BDAC7A8](v40);
  v44 = (char *)v61 - v43;
  v45 = a1[3];
  v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v45);
  sub_23E1B8A04();
  v46 = v68;
  sub_23E1BE6F0();
  if (!v46)
  {
    v61[3] = (uint64_t)v39;
    v61[4] = (uint64_t)v36;
    v61[5] = (uint64_t)v33;
    v61[2] = (uint64_t)v42;
    v61[6] = (uint64_t)v44;
    v47 = v66;
    v68 = v2;
    v48 = sub_23E1BE660();
    v49 = *(_QWORD *)(v48 + 16);
    if (v49)
    {
      v61[1] = 0;
      v50 = *(unsigned __int8 *)(v48 + 32);
      sub_23E1B9574(1, v49, v48, v48 + 32, 0, (2 * v49) | 1);
      v52 = v51;
      v54 = v53;
      swift_bridgeObjectRelease();
      if (v52 == v54 >> 1)
        __asm { BR              X9 }
      v55 = v66;
    }
    else
    {
      v55 = v47;
    }
    v56 = v62;
    v57 = sub_23E1BE5DC();
    swift_allocError();
    v59 = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D362C8);
    *v59 = v56;
    v60 = v68;
    sub_23E1BE630();
    sub_23E1BE5D0();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v59, *MEMORY[0x24BEE26D0], v57);
    swift_willThrow();
    OUTLINED_FUNCTION_6_5();
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v60, v55);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
  OUTLINED_FUNCTION_9_0();
}

void sub_23E1B9080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);

  OUTLINED_FUNCTION_34_4();
  OUTLINED_FUNCTION_5_10();
  if (!v0)
  {
    type metadata accessor for ConfirmationSnippetModel();
    sub_23E180C20(&qword_256D34E60, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel, (uint64_t)&protocol conformance descriptor for ConfirmationSnippetModel);
    v2 = *(_QWORD *)(v1 - 184);
    OUTLINED_FUNCTION_10_10();
    OUTLINED_FUNCTION_9_13(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 272) + 8));
    swift_unknownObjectRelease();
    v3 = OUTLINED_FUNCTION_36_3();
    v4(v3);
    OUTLINED_FUNCTION_21_9(v1 - 72);
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x23E1B9508);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_36_3();
  JUMPOUT(0x23E1B9064);
}

void sub_23E1B9138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_30_5();
  v2 = *(_QWORD *)(v1 - 96);
  OUTLINED_FUNCTION_5_10();
  if (!v0)
  {
    type metadata accessor for CompletionSnippetModel();
    sub_23E180C20(&qword_256D34FE0, (uint64_t (*)(uint64_t))type metadata accessor for CompletionSnippetModel, (uint64_t)&protocol conformance descriptor for CompletionSnippetModel);
    OUTLINED_FUNCTION_31_6();
    OUTLINED_FUNCTION_10_10();
    OUTLINED_FUNCTION_3_8(*(_QWORD *)(v1 - 256));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_9_13(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8));
    OUTLINED_FUNCTION_21_9(v1 - 64);
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x23E1B9508);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x23E1B9284);
}

void sub_23E1B91E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_28_6();
  v2 = *(_QWORD *)(v1 - 96);
  OUTLINED_FUNCTION_5_10();
  if (!v0)
  {
    type metadata accessor for AutomationSnippetModel();
    sub_23E180C20(&qword_256D34908, (uint64_t (*)(uint64_t))type metadata accessor for AutomationSnippetModel, (uint64_t)&protocol conformance descriptor for AutomationSnippetModel);
    OUTLINED_FUNCTION_31_6();
    OUTLINED_FUNCTION_10_10();
    OUTLINED_FUNCTION_3_8(*(_QWORD *)(v1 - 240));
    OUTLINED_FUNCTION_6_5();
    OUTLINED_FUNCTION_9_13(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 136) + 8));
    OUTLINED_FUNCTION_21_9(v1 - 56);
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x23E1B9508);
  }
  JUMPOUT(0x23E1B9274);
}

void sub_23E1B928C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_38_1();
  v2 = *(_QWORD *)(v1 - 112);
  v3 = *(_QWORD *)(v1 - 96);
  OUTLINED_FUNCTION_5_10();
  if (v0)
  {
    OUTLINED_FUNCTION_6_5();
    JUMPOUT(0x23E1B9064);
  }
  type metadata accessor for CallToActionSnippetModel();
  sub_23E180C20(&qword_256D36160, (uint64_t (*)(uint64_t))type metadata accessor for CallToActionSnippetModel, (uint64_t)&protocol conformance descriptor for CallToActionSnippetModel);
  OUTLINED_FUNCTION_10_10();
  v4 = *(_QWORD *)(v1 - 136);
  OUTLINED_FUNCTION_20_9();
  OUTLINED_FUNCTION_6_5();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  JUMPOUT(0x23E1B9500);
}

unint64_t sub_23E1B9528()
{
  static HomeAutomationSnippetModels.bundleName.getter();
  return 0xD000000000000016;
}

void sub_23E1B954C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  HomeAutomationSnippetModels.init(from:)(a1, a2);
}

void sub_23E1B9560(_QWORD *a1)
{
  HomeAutomationSnippetModels.encode(to:)(a1);
}

uint64_t sub_23E1B9574(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

void sub_23E1B95EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_9();
}

void sub_23E1B962C()
{
  sub_23E180C20(&qword_256D362D0, (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationSnippetModels, (uint64_t)&protocol conformance descriptor for HomeAutomationSnippetModels);
}

void sub_23E1B9658()
{
  sub_23E180C20(&qword_256D362D8, (uint64_t (*)(uint64_t))type metadata accessor for HomeAutomationSnippetModels, (uint64_t)&protocol conformance descriptor for HomeAutomationSnippetModels);
}

uint64_t initializeBufferWithCopyOfBuffer for HomeAutomationSnippetModels(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23E1B96E4 + 4 * word_23E1C1218[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for HomeAutomationSnippetModels(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int *v48;
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
  uint64_t (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  int *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v4(a1, v3);
      v5 = type metadata accessor for DisambiguationSnippetModel(0);
      swift_bridgeObjectRelease();
      a1 += *(int *)(v5 + 24);
      v6 = type metadata accessor for DisambiguationOption(0);
      result = __swift_getEnumTagSinglePayload(a1, 1, v6);
      if (!(_DWORD)result)
      {
        swift_bridgeObjectRelease();
        v7 = a1 + *(int *)(v6 + 20);
        v8 = (int *)type metadata accessor for IconConfiguration();
        if (!__swift_getEnumTagSinglePayload(v7, 1, (uint64_t)v8))
        {
          v4(v7, v3);
          v9 = v7 + v8[5];
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
          v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
          v11(v9, v10);
          v12 = v7 + v8[6];
          v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
          v14 = v7 + v8[7];
          v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
          v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8);
          v16(v14, v15);
          v16(v7 + v8[8], v15);
          v17 = v7 + v8[9];
          v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
          v11(v7 + v8[10], v10);
          v19 = v7 + v8[11];
          v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
          v11(v7 + v8[12], v10);
          v11(v7 + v8[13], v10);
          v21 = v7 + v8[14];
          v22 = type metadata accessor for DirectInvocationConfig();
          if (!__swift_getEnumTagSinglePayload(v21, 1, v22))
          {
            v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v21, v23);
          }
        }
        v24 = *(int *)(v6 + 24);
        goto LABEL_14;
      }
      return result;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v25 = (int *)type metadata accessor for ConfirmationSnippetModel();
      v26 = a1 + v25[6];
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      v28 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8);
      v28(v26, v27);
      v28(a1 + v25[7], v27);
      v29 = a1 + v25[8];
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
      v79 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8);
      v79(v29, v30);
      v79(a1 + v25[9], v30);
      v31 = a1 + v25[10];
      v32 = (int *)type metadata accessor for IconConfiguration();
      result = __swift_getEnumTagSinglePayload(v31, 1, (uint64_t)v32);
      if (!(_DWORD)result)
      {
        v28(v31, v27);
        v33 = v31 + v32[5];
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
        v35 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 8);
        v35(v33, v34);
        v36 = v31 + v32[6];
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 8))(v36, v37);
        v38 = v31 + v32[7];
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
        v40 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 8);
        v40(v38, v39);
        v40(v31 + v32[8], v39);
        v41 = v31 + v32[9];
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 8))(v41, v42);
        v35(v31 + v32[10], v34);
        v43 = v31 + v32[11];
        v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 8))(v43, v44);
        v35(v31 + v32[12], v34);
        v35(v31 + v32[13], v34);
        v45 = v31 + v32[14];
        v46 = type metadata accessor for DirectInvocationConfig();
        result = __swift_getEnumTagSinglePayload(v45, 1, v46);
        if (!(_DWORD)result)
        {
          v59 = v45;
          v60 = v30;
          goto LABEL_11;
        }
      }
      return result;
    case 2:
      v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 8))(a1, v47);
      v48 = (int *)type metadata accessor for CompletionSnippetModel();
      v49 = a1 + v48[5];
      v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 8))(v49, v50);
      v51 = a1 + v48[6];
      v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 8))(v51, v52);
      v53 = a1 + v48[7];
      v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      v79 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 8);
      v79(v53, v54);
      v79(a1 + v48[8], v54);
      v55 = a1 + v48[9];
      v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D350C8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 8))(v55, v56);
      v57 = a1 + v48[10];
      v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 8))(v57, v58);
      v59 = a1 + v48[11];
      v60 = v54;
LABEL_11:
      v61 = (uint64_t (*)(uint64_t, uint64_t))v79;
      goto LABEL_17;
    case 3:
      v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      v63 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 8);
      v63(a1, v62);
      v64 = (int *)type metadata accessor for AutomationSnippetModel();
      v65 = a1 + v64[5];
      v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 8))(v65, v66);
      v67 = a1 + v64[6];
      v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348A8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 8))(v67, v68);
      v63(a1 + v64[7], v62);
      v63(a1 + v64[8], v62);
      v69 = a1 + v64[9];
      v70 = &qword_256D348B0;
      goto LABEL_16;
    case 4:
      v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 8))(a1, v71);
      v24 = *(int *)(type metadata accessor for CallToActionSnippetModel() + 20);
LABEL_14:
      v69 = a1 + v24;
      v70 = &qword_256D34E18;
      goto LABEL_16;
    case 5:
      v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 8))(a1, v72);
      v73 = (int *)type metadata accessor for TemperatureSnippetModel();
      v74 = a1 + v73[5];
      v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v76 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 8);
      v76(v74, v75);
      v76(a1 + v73[6], v75);
      v77 = a1 + v73[7];
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34CD0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 8))(v77, v78);
      v69 = a1 + v73[8];
      v70 = &qword_256D34CD8;
LABEL_16:
      v60 = __swift_instantiateConcreteTypeFromMangledName(v70);
      v61 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 8);
      v59 = v69;
LABEL_17:
      result = v61(v59, v60);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for HomeAutomationSnippetModels()
{
  char *v0;

  v0 = (char *)sub_23E1BA914 + 4 * word_23E1C1230[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E1BA914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v46;
  char *v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16);
  v3(v0, v1, v2);
  v4 = type metadata accessor for DisambiguationSnippetModel(0);
  *(_QWORD *)(v0 + *(int *)(v4 + 20)) = *(_QWORD *)(v1 + *(int *)(v4 + 20));
  v5 = *(int *)(v4 + 24);
  v6 = (_QWORD *)(v0 + v5);
  v7 = (_QWORD *)(v1 + v5);
  v8 = type metadata accessor for DisambiguationOption(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    v10 = v7[1];
    *v6 = *v7;
    v6[1] = v10;
    v11 = *(int *)(v8 + 20);
    v12 = (char *)v6 + v11;
    v13 = (char *)v7 + v11;
    v14 = (int *)type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, (uint64_t)v14))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v3((uint64_t)v12, (uint64_t)v13, v2);
      v16 = v14[5];
      v17 = &v12[v16];
      v18 = &v13[v16];
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v48 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
      v49 = v19;
      v48(v17, v18, v19);
      v20 = v14[6];
      v21 = &v12[v20];
      v22 = &v13[v20];
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
      v24 = v14[7];
      v46 = &v12[v24];
      v25 = &v13[v24];
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
      v27(v46, v25, v26);
      v27(&v12[v14[8]], &v13[v14[8]], v26);
      v28 = v14[9];
      v29 = &v12[v28];
      v30 = &v13[v28];
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
      v48(&v12[v14[10]], &v13[v14[10]], v49);
      v32 = v14[11];
      v47 = &v12[v32];
      v33 = &v13[v32];
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v47, v33, v34);
      v48(&v12[v14[12]], &v13[v14[12]], v49);
      v48(&v12[v14[13]], &v13[v14[13]], v49);
      v35 = v14[14];
      v36 = &v12[v35];
      v37 = &v13[v35];
      v38 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38))
      {
        v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
      }
      else
      {
        v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 16))(v36, v37, v40);
        __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, (uint64_t)v14);
    }
    v41 = *(int *)(v8 + 24);
    v42 = (char *)v6 + v41;
    v43 = (char *)v7 + v41;
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for HomeAutomationSnippetModels(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23E180BA4(result, (uint64_t (*)(_QWORD))type metadata accessor for HomeAutomationSnippetModels);
    v2 = (char *)&loc_23E1BB3DC + 4 * word_23E1C123C[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void initializeWithTake for HomeAutomationSnippetModels()
{
  char *v0;

  v0 = (char *)sub_23E1BBE98 + 4 * word_23E1C1248[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23E1BBE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34898);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32);
  v3(v0, v1, v2);
  v4 = type metadata accessor for DisambiguationSnippetModel(0);
  *(_QWORD *)(v0 + *(int *)(v4 + 20)) = *(_QWORD *)(v1 + *(int *)(v4 + 20));
  v5 = *(int *)(v4 + 24);
  v6 = (_OWORD *)(v0 + v5);
  v7 = (_OWORD *)(v1 + v5);
  v8 = type metadata accessor for DisambiguationOption(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D355A8);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    *v6 = *v7;
    v10 = *(int *)(v8 + 20);
    v11 = (char *)v6 + v10;
    v12 = (char *)v7 + v10;
    v13 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, (uint64_t)v13))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E20);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v3((uint64_t)v11, (uint64_t)v12, v2);
      v15 = v13[5];
      v16 = &v11[v15];
      v17 = &v12[v15];
      v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34B60);
      v46 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32);
      v46(v16, v17, v47);
      v18 = v13[6];
      v19 = &v11[v18];
      v20 = &v12[v18];
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D348B0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
      v22 = v13[7];
      v44 = &v11[v22];
      v23 = &v12[v22];
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E70);
      v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32);
      v25(v44, v23, v24);
      v25(&v11[v13[8]], &v12[v13[8]], v24);
      v26 = v13[9];
      v27 = &v11[v26];
      v28 = &v12[v26];
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E78);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 32))(v27, v28, v29);
      v46(&v11[v13[10]], &v12[v13[10]], v47);
      v30 = v13[11];
      v45 = &v11[v30];
      v31 = &v12[v30];
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E80);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v45, v31, v32);
      v46(&v11[v13[12]], &v12[v13[12]], v47);
      v46(&v11[v13[13]], &v12[v13[13]], v47);
      v33 = v13[14];
      v34 = &v11[v33];
      v35 = &v12[v33];
      v36 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
      {
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E88);
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v34, v35, v38);
        __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, (uint64_t)v13);
    }
    v39 = *(int *)(v8 + 24);
    v40 = (char *)v6 + v39;
    v41 = (char *)v7 + v39;
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D34E18);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v42 - 8) + 32))(v40, v41, v42);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for HomeAutomationSnippetModels(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23E180BA4(result, (uint64_t (*)(_QWORD))type metadata accessor for HomeAutomationSnippetModels);
    v2 = (char *)&loc_23E1BC938 + 4 * word_23E1C1254[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_23E1BD360()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23E1BD370()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  result = type metadata accessor for DisambiguationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for ConfirmationSnippetModel();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for CompletionSnippetModel();
      if (v3 <= 0x3F)
      {
        result = type metadata accessor for AutomationSnippetModel();
        if (v4 <= 0x3F)
        {
          result = type metadata accessor for CallToActionSnippetModel();
          if (v5 <= 0x3F)
          {
            result = type metadata accessor for TemperatureSnippetModel();
            if (v6 <= 0x3F)
            {
              swift_initEnumMetadataMultiPayload();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for HomeAutomationSnippetModels.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1BD4AC + 4 * byte_23E1C1265[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23E1BD4E0 + 4 * byte_23E1C1260[v4]))();
}

uint64_t sub_23E1BD4E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1BD4E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1BD4F0);
  return result;
}

uint64_t sub_23E1BD4FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1BD504);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23E1BD508(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1BD510(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.CodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.CodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.DisambiguationViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.ConfirmationViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.CompletionViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.AutomationViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.CallToActionViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys;
}

uint64_t _s25HomeAutomationUIFramework27HomeAutomationSnippetModelsO28DisambiguationViewCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23E1BD5C4 + 4 * byte_23E1C126A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23E1BD5E4 + 4 * byte_23E1C126F[v4]))();
}

_BYTE *sub_23E1BD5C4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23E1BD5E4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23E1BD5EC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23E1BD5F4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23E1BD5FC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23E1BD604(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.TemperatureViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys;
}

unint64_t sub_23E1BD624()
{
  unint64_t result;

  result = qword_256D36388;
  if (!qword_256D36388)
  {
    result = MEMORY[0x24264D408](&unk_23E1C14BC, &type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36388);
  }
  return result;
}

unint64_t sub_23E1BD664()
{
  unint64_t result;

  result = qword_256D36390;
  if (!qword_256D36390)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1574, &type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36390);
  }
  return result;
}

unint64_t sub_23E1BD6A4()
{
  unint64_t result;

  result = qword_256D36398;
  if (!qword_256D36398)
  {
    result = MEMORY[0x24264D408](&unk_23E1C162C, &type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36398);
  }
  return result;
}

unint64_t sub_23E1BD6E4()
{
  unint64_t result;

  result = qword_256D363A0;
  if (!qword_256D363A0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C16E4, &type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363A0);
  }
  return result;
}

unint64_t sub_23E1BD724()
{
  unint64_t result;

  result = qword_256D363A8;
  if (!qword_256D363A8)
  {
    result = MEMORY[0x24264D408](&unk_23E1C179C, &type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363A8);
  }
  return result;
}

unint64_t sub_23E1BD764()
{
  unint64_t result;

  result = qword_256D363B0;
  if (!qword_256D363B0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1854, &type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363B0);
  }
  return result;
}

unint64_t sub_23E1BD7A4()
{
  unint64_t result;

  result = qword_256D363B8;
  if (!qword_256D363B8)
  {
    result = MEMORY[0x24264D408](&unk_23E1C190C, &type metadata for HomeAutomationSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363B8);
  }
  return result;
}

unint64_t sub_23E1BD7E4()
{
  unint64_t result;

  result = qword_256D363C0;
  if (!qword_256D363C0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C17C4, &type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363C0);
  }
  return result;
}

unint64_t sub_23E1BD824()
{
  unint64_t result;

  result = qword_256D363C8;
  if (!qword_256D363C8)
  {
    result = MEMORY[0x24264D408](&unk_23E1C17EC, &type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363C8);
  }
  return result;
}

unint64_t sub_23E1BD864()
{
  unint64_t result;

  result = qword_256D363D0;
  if (!qword_256D363D0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C170C, &type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363D0);
  }
  return result;
}

unint64_t sub_23E1BD8A4()
{
  unint64_t result;

  result = qword_256D363D8;
  if (!qword_256D363D8)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1734, &type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363D8);
  }
  return result;
}

unint64_t sub_23E1BD8E4()
{
  unint64_t result;

  result = qword_256D363E0;
  if (!qword_256D363E0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1654, &type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363E0);
  }
  return result;
}

unint64_t sub_23E1BD924()
{
  unint64_t result;

  result = qword_256D363E8;
  if (!qword_256D363E8)
  {
    result = MEMORY[0x24264D408](&unk_23E1C167C, &type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363E8);
  }
  return result;
}

unint64_t sub_23E1BD964()
{
  unint64_t result;

  result = qword_256D363F0;
  if (!qword_256D363F0)
  {
    result = MEMORY[0x24264D408](&unk_23E1C159C, &type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363F0);
  }
  return result;
}

unint64_t sub_23E1BD9A4()
{
  unint64_t result;

  result = qword_256D363F8;
  if (!qword_256D363F8)
  {
    result = MEMORY[0x24264D408](&unk_23E1C15C4, &type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D363F8);
  }
  return result;
}

unint64_t sub_23E1BD9E4()
{
  unint64_t result;

  result = qword_256D36400;
  if (!qword_256D36400)
  {
    result = MEMORY[0x24264D408](&unk_23E1C14E4, &type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36400);
  }
  return result;
}

unint64_t sub_23E1BDA24()
{
  unint64_t result;

  result = qword_256D36408;
  if (!qword_256D36408)
  {
    result = MEMORY[0x24264D408](&unk_23E1C150C, &type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36408);
  }
  return result;
}

unint64_t sub_23E1BDA64()
{
  unint64_t result;

  result = qword_256D36410;
  if (!qword_256D36410)
  {
    result = MEMORY[0x24264D408](&unk_23E1C142C, &type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36410);
  }
  return result;
}

unint64_t sub_23E1BDAA4()
{
  unint64_t result;

  result = qword_256D36418;
  if (!qword_256D36418)
  {
    result = MEMORY[0x24264D408](&unk_23E1C1454, &type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36418);
  }
  return result;
}

unint64_t sub_23E1BDAE4()
{
  unint64_t result;

  result = qword_256D36420;
  if (!qword_256D36420)
  {
    result = MEMORY[0x24264D408](&unk_23E1C187C, &type metadata for HomeAutomationSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36420);
  }
  return result;
}

unint64_t sub_23E1BDB24()
{
  unint64_t result;

  result = qword_256D36428;
  if (!qword_256D36428)
  {
    result = MEMORY[0x24264D408](&unk_23E1C18A4, &type metadata for HomeAutomationSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D36428);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return sub_23E1BE66C();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return sub_23E1BE624();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_7_9(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23E1B95EC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_8_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_9_13@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_10_10()
{
  return sub_23E1BE654();
}

uint64_t OUTLINED_FUNCTION_12_13()
{
  return sub_23E1BE690();
}

void OUTLINED_FUNCTION_14_12(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_23E180C20(a1, v3, a3);
}

void OUTLINED_FUNCTION_17_11(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_18_10(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_20_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 224) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_21_9@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

unint64_t OUTLINED_FUNCTION_28_6()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 3;
  return sub_23E1B8AB8();
}

uint64_t OUTLINED_FUNCTION_29_3()
{
  return sub_23E1BE6D8();
}

unint64_t OUTLINED_FUNCTION_30_5()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 2;
  return sub_23E1B8AF4();
}

unint64_t OUTLINED_FUNCTION_34_4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 1;
  return sub_23E1B8B30();
}

unint64_t OUTLINED_FUNCTION_35_3()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 5;
  return sub_23E1B8A40();
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37_4()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_38_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 4;
  return sub_23E1B8A7C();
}

uint64_t sub_23E1BDCDC()
{
  return MEMORY[0x24BDCD738]();
}

uint64_t sub_23E1BDCE8()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23E1BDCF4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23E1BDD00()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_23E1BDD0C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23E1BDD18()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23E1BDD24()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23E1BDD30()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23E1BDD3C()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_23E1BDD48()
{
  return MEMORY[0x24BEABA58]();
}

uint64_t sub_23E1BDD54()
{
  return MEMORY[0x24BEABA60]();
}

uint64_t sub_23E1BDD60()
{
  return MEMORY[0x24BEABA68]();
}

uint64_t sub_23E1BDD6C()
{
  return MEMORY[0x24BEABA70]();
}

uint64_t sub_23E1BDD78()
{
  return MEMORY[0x24BEABA78]();
}

uint64_t sub_23E1BDD84()
{
  return MEMORY[0x24BEAC738]();
}

uint64_t sub_23E1BDD90()
{
  return MEMORY[0x24BEAC740]();
}

uint64_t sub_23E1BDD9C()
{
  return MEMORY[0x24BEAD2C0]();
}

uint64_t sub_23E1BDDA8()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_23E1BDDB4()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_23E1BDDC0()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_23E1BDDCC()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_23E1BDDD8()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_23E1BDDE4()
{
  return MEMORY[0x24BEAD358]();
}

uint64_t sub_23E1BDDF0()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_23E1BDDFC()
{
  return MEMORY[0x24BEA8958]();
}

uint64_t sub_23E1BDE08()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t sub_23E1BDE14()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_23E1BDE20()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_23E1BDE2C()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_23E1BDE38()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23E1BDE44()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23E1BDE50()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23E1BDE5C()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_23E1BDE68()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_23E1BDE74()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23E1BDE80()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23E1BDE8C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23E1BDE98()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23E1BDEA4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_23E1BDEB0()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_23E1BDEBC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_23E1BDEC8()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_23E1BDED4()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_23E1BDEE0()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_23E1BDEEC()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_23E1BDEF8()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_23E1BDF04()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_23E1BDF10()
{
  return MEMORY[0x24BEAD640]();
}

uint64_t sub_23E1BDF1C()
{
  return MEMORY[0x24BEAD650]();
}

uint64_t sub_23E1BDF28()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_23E1BDF34()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_23E1BDF40()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_23E1BDF4C()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_23E1BDF58()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_23E1BDF64()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_23E1BDF70()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_23E1BDF7C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23E1BDF88()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_23E1BDF94()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_23E1BDFA0()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_23E1BDFAC()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_23E1BDFB8()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_23E1BDFC4()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_23E1BDFD0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_23E1BDFDC()
{
  return MEMORY[0x24BDEF0B0]();
}

uint64_t sub_23E1BDFE8()
{
  return MEMORY[0x24BDEF0B8]();
}

uint64_t sub_23E1BDFF4()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t sub_23E1BE000()
{
  return MEMORY[0x24BDEF0D8]();
}

uint64_t sub_23E1BE00C()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_23E1BE018()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23E1BE024()
{
  return MEMORY[0x24BEAD6A0]();
}

uint64_t sub_23E1BE030()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_23E1BE03C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_23E1BE048()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_23E1BE054()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_23E1BE060()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_23E1BE06C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_23E1BE078()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_23E1BE084()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_23E1BE090()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_23E1BE09C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_23E1BE0A8()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_23E1BE0B4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_23E1BE0C0()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_23E1BE0CC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23E1BE0D8()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_23E1BE0E4()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_23E1BE0F0()
{
  return MEMORY[0x24BEAD790]();
}

uint64_t sub_23E1BE0FC()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_23E1BE108()
{
  return MEMORY[0x24BEAD840]();
}

uint64_t sub_23E1BE114()
{
  return MEMORY[0x24BEAD860]();
}

uint64_t sub_23E1BE120()
{
  return MEMORY[0x24BEAD870]();
}

uint64_t sub_23E1BE12C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23E1BE138()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23E1BE144()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_23E1BE150()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_23E1BE15C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23E1BE168()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_23E1BE174()
{
  return MEMORY[0x24BEAD920]();
}

uint64_t sub_23E1BE180()
{
  return MEMORY[0x24BDF3C10]();
}

uint64_t sub_23E1BE18C()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_23E1BE198()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_23E1BE1A4()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_23E1BE1B0()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_23E1BE1BC()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_23E1BE1C8()
{
  return MEMORY[0x24BDF3CD0]();
}

uint64_t sub_23E1BE1D4()
{
  return MEMORY[0x24BDF3CD8]();
}

uint64_t sub_23E1BE1E0()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_23E1BE1EC()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_23E1BE1F8()
{
  return MEMORY[0x24BDF3D00]();
}

uint64_t sub_23E1BE204()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_23E1BE210()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_23E1BE21C()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_23E1BE228()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_23E1BE234()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_23E1BE240()
{
  return MEMORY[0x24BDF3D58]();
}

uint64_t sub_23E1BE24C()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_23E1BE258()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_23E1BE264()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_23E1BE270()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_23E1BE27C()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_23E1BE288()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_23E1BE294()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_23E1BE2A0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_23E1BE2AC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_23E1BE2B8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_23E1BE2C4()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_23E1BE2D0()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_23E1BE2DC()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_23E1BE2E8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_23E1BE2F4()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_23E1BE300()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_23E1BE30C()
{
  return MEMORY[0x24BEADB88]();
}

uint64_t sub_23E1BE318()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_23E1BE324()
{
  return MEMORY[0x24BEADC18]();
}

uint64_t sub_23E1BE330()
{
  return MEMORY[0x24BEADC38]();
}

uint64_t sub_23E1BE33C()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_23E1BE348()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_23E1BE354()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_23E1BE360()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_23E1BE36C()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_23E1BE378()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_23E1BE384()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_23E1BE390()
{
  return MEMORY[0x24BEADF98]();
}

uint64_t sub_23E1BE39C()
{
  return MEMORY[0x24BEADFB0]();
}

uint64_t sub_23E1BE3A8()
{
  return MEMORY[0x24BEADFC0]();
}

uint64_t sub_23E1BE3B4()
{
  return MEMORY[0x24BEADFF0]();
}

uint64_t sub_23E1BE3C0()
{
  return MEMORY[0x24BEADFF8]();
}

uint64_t sub_23E1BE3CC()
{
  return MEMORY[0x24BEAE220]();
}

uint64_t sub_23E1BE3D8()
{
  return MEMORY[0x24BEAE228]();
}

uint64_t sub_23E1BE3E4()
{
  return MEMORY[0x24BEAE468]();
}

uint64_t sub_23E1BE3F0()
{
  return MEMORY[0x24BEAE548]();
}

uint64_t sub_23E1BE3FC()
{
  return MEMORY[0x24BEAE570]();
}

uint64_t sub_23E1BE408()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_23E1BE414()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23E1BE420()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23E1BE42C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23E1BE438()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23E1BE444()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23E1BE450()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23E1BE45C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23E1BE468()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_23E1BE474()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_23E1BE480()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23E1BE48C()
{
  return MEMORY[0x24BEE0BE0]();
}

uint64_t sub_23E1BE498()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23E1BE4A4()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23E1BE4B0()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_23E1BE4BC()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_23E1BE4C8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23E1BE4D4()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23E1BE4E0()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23E1BE4EC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23E1BE4F8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23E1BE504()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23E1BE510()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23E1BE51C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23E1BE528()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23E1BE534()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23E1BE540()
{
  return MEMORY[0x24BEAE608]();
}

uint64_t sub_23E1BE54C()
{
  return MEMORY[0x24BEAE610]();
}

uint64_t sub_23E1BE558()
{
  return MEMORY[0x24BEAE618]();
}

uint64_t sub_23E1BE564()
{
  return MEMORY[0x24BEAE620]();
}

uint64_t sub_23E1BE570()
{
  return MEMORY[0x24BEAE638]();
}

uint64_t sub_23E1BE57C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23E1BE588()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23E1BE594()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23E1BE5A0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23E1BE5AC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23E1BE5B8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23E1BE5C4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23E1BE5D0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23E1BE5DC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23E1BE5E8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23E1BE5F4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23E1BE600()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23E1BE60C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23E1BE618()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23E1BE624()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23E1BE630()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23E1BE63C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23E1BE648()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23E1BE654()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23E1BE660()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23E1BE66C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23E1BE678()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23E1BE684()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23E1BE690()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23E1BE69C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23E1BE6A8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23E1BE6B4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23E1BE6C0()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23E1BE6CC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23E1BE6D8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23E1BE6E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23E1BE6F0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23E1BE6FC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23E1BE708()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23E1BE714()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

