uint64_t Logger.daemon.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7950, (uint64_t)static Logger.daemon);
}

uint64_t gp_isInternalBuild()
{
  if (gp_isInternalBuild_onceToken != -1)
    dispatch_once(&gp_isInternalBuild_onceToken, &__block_literal_global_1);
  return gp_isInternalBuild_isInternalBuild;
}

uint64_t sub_23C961168(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_23C976B04();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id _gpBundle()
{
  if (_gpBundle_onceToken != -1)
    dispatch_once(&_gpBundle_onceToken, &__block_literal_global);
  return (id)_bundle;
}

void ___gpBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundle;
  _bundle = v0;

}

id _gpConvertStringToLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _gpBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_250D97328, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t currentSourceVersion()
{
  if (currentSourceVersion_onceToken != -1)
    dispatch_once(&currentSourceVersion_onceToken, &__block_literal_global_0);
  return currentSourceVersion_versionStruct;
}

int8x8_t __currentSourceVersion_block_invoke()
{
  unsigned int *v0;
  uint64_t v1;
  unsigned int v2;
  unsigned int *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  unint64_t v8;
  int8x8_t result;

  v0 = (unsigned int *)dyld_image_header_containing_address();
  v1 = *v0;
  if ((_DWORD)v1 != -17958193)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GamePolicy Mach-O header has incorrect magic: %x"), v1);
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB0];
LABEL_7:
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v2 = v0[4];
  if (!v2)
  {
LABEL_6:
    v4 = (void *)MEMORY[0x24BDBCE88];
    v5 = *MEMORY[0x24BDBCAB0];
    v6 = CFSTR("GamePolicy Mach-O is missing LC_SOURCE_VERSION");
    goto LABEL_7;
  }
  v3 = v0 + 8;
  while (*v3 != 42)
  {
    v3 = (unsigned int *)((char *)v3 + v3[1]);
    if (!--v2)
      goto LABEL_6;
  }
  v8 = *((_QWORD *)v3 + 1);
  result = vand_s8((int8x8_t)vmovn_s64((int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(v8), (uint64x2_t)xmmword_23C977890)), (int8x8_t)0x3FF007FFFFFLL);
  currentSourceVersion_versionStruct = (uint64_t)result;
  dword_256BD8418 = (v8 >> 20) & 0x3FF;
  return result;
}

uint64_t __gp_isInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  gp_isInternalBuild_isInternalBuild = result;
  return result;
}

id getGPLogger()
{
  if (getGPLogger_onceToken != -1)
    dispatch_once(&getGPLogger_onceToken, &__block_literal_global_2);
  return (id)gpLogger;
}

void __getGPLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GamePolicy", "default");
  v1 = (void *)gpLogger;
  gpLogger = (uint64_t)v0;

}

unint64_t ConsoleModeEnablementStrategy.init(rawValue:)(unint64_t a1)
{
  return sub_23C962294(a1);
}

BOOL sub_23C9620B8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23C9620CC()
{
  sub_23C976D44();
  sub_23C976D50();
  return sub_23C976D5C();
}

uint64_t sub_23C962110()
{
  return sub_23C976D50();
}

uint64_t sub_23C962138()
{
  sub_23C976D44();
  sub_23C976D50();
  return sub_23C976D5C();
}

unint64_t sub_23C962178@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23C962294(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_23C9621A8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t variable initialization expression of DynamicSplitterStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of DynamicSplitterStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of DynamicSplitterStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254(type metadata accessor for DynamicSplitterStatus.Config, a1);
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.Config.policy()
{
  return 2;
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.policy()
{
  return 2;
}

uint64_t variable initialization expression of ModelManagerGameAssertionStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254(type metadata accessor for ModelManagerGameAssertionStatus.Config, a1);
}

uint64_t variable initialization expression of SustainedExecutionStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of SustainedExecutionStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of SustainedExecutionStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254(type metadata accessor for SustainedExecutionStatus.Config, a1);
}

uint64_t variable initialization expression of GameModeStatus.Config.enablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of GameModeStatus.Config.disablementDate@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t variable initialization expression of GameModeStatus.$__lazy_storage_$_config@<X0>(uint64_t a1@<X8>)
{
  return sub_23C962254(type metadata accessor for GameModeStatus.Config, a1);
}

uint64_t sub_23C962254@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
}

unint64_t sub_23C962294(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t sub_23C9622A8()
{
  unint64_t result;

  result = qword_256BD79B0;
  if (!qword_256BD79B0)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for ConsoleModeEnablementStrategy, &type metadata for ConsoleModeEnablementStrategy);
    atomic_store(result, (unint64_t *)&qword_256BD79B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConsoleModeEnablementStrategy()
{
  return &type metadata for ConsoleModeEnablementStrategy;
}

uint64_t sub_23C9622FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_23C96233C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23C96235C(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256BD79B8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256BD79B8);
  }
}

id static GamePolicyAppXPC.GamePolicyAppServerInterface()()
{
  return sub_23C962400(&protocolRef__TtP10GamePolicy19GamePolicyAppServer_);
}

id static GamePolicyAppXPC.GamePolicyAppClientInterface()()
{
  return sub_23C962400(&protocolRef__TtP10GamePolicy19GamePolicyAppClient_);
}

id sub_23C962400(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a1);
}

id sub_23C962448(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a3);
}

id GamePolicyAppXPC.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GamePolicyAppXPC.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyAppXPC();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GamePolicyAppXPC()
{
  return objc_opt_self();
}

id GamePolicyAppXPC.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyAppXPC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DynamicSplitterStatus.Config.enabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t DynamicSplitterStatus.Config.enabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.enabled.modify())()
{
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 20), a1, &qword_256BD79F0);
}

uint64_t type metadata accessor for DynamicSplitterStatus.Config(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD7B18);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242626EF4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t DynamicSplitterStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 20), &qword_256BD79F0);
}

uint64_t (*DynamicSplitterStatus.Config.enablementDate.modify())()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 24), a1, &qword_256BD79F0);
}

uint64_t DynamicSplitterStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for DynamicSplitterStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 24), &qword_256BD79F0);
}

uint64_t (*DynamicSplitterStatus.Config.disablementDate.modify())()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 28));
}

uint64_t DynamicSplitterStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DynamicSplitterStatus.Config(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.deviceSupported.modify())()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.impactedBundleIdentifiers.modify())()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.enablementStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for DynamicSplitterStatus.Config(0) + 40));
}

uint64_t DynamicSplitterStatus.Config.enablementStrategy.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DynamicSplitterStatus.Config(0);
  *(_QWORD *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*DynamicSplitterStatus.Config.enablementStrategy.modify())()
{
  type metadata accessor for DynamicSplitterStatus.Config(0);
  return nullsub_1;
}

uint64_t DynamicSplitterStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _BYTE *a8@<X8>)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t result;

  v13 = (int *)type metadata accessor for DynamicSplitterStatus.Config(0);
  v14 = (uint64_t)&a8[v13[5]];
  v15 = sub_23C976AEC();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  v17 = (uint64_t)&a8[v13[6]];
  v16(v17, 1, 1, v15);
  *a8 = a1;
  sub_23C963110(a2, v14, &qword_256BD79F0);
  result = sub_23C963110(a3, v17, &qword_256BD79F0);
  a8[v13[7]] = a4;
  *(_QWORD *)&a8[v13[8]] = a5;
  *(_QWORD *)&a8[v13[9]] = a6;
  *(_QWORD *)&a8[v13[10]] = a7;
  return result;
}

uint64_t DynamicSplitterStatus.enabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled);
}

uint64_t DynamicSplitterStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, a1, &qword_256BD79F0);
}

uint64_t DynamicSplitterStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, a1, &qword_256BD79F0);
}

uint64_t DynamicSplitterStatus.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported);
}

uint64_t DynamicSplitterStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DynamicSplitterStatus.enablementStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy);
}

id DynamicSplitterStatus.__allocating_init(config:)(_BYTE *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DynamicSplitterStatus.init(config:)(a1);
}

id DynamicSplitterStatus.init(config:)(_BYTE *a1)
{
  _BYTE *v1;
  char *v3;
  int *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config];
  v4 = (int *)type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((_QWORD *)v4 - 1) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled] = *a1;
  sub_23C962E2C((uint64_t)&a1[v4[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate], &qword_256BD79F0);
  sub_23C962E2C((uint64_t)&a1[v4[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate], &qword_256BD79F0);
  v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported] = a1[v4[7]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers] = *(_QWORD *)&a1[v4[8]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers] = *(_QWORD *)&a1[v4[9]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy] = *(_QWORD *)&a1[v4[10]];
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for DynamicSplitterStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_23C962C80((uint64_t)a1);
  return v5;
}

uint64_t type metadata accessor for DynamicSplitterStatus(uint64_t a1)
{
  return sub_23C962C4C(a1, (uint64_t *)&unk_256BD7AA0);
}

uint64_t sub_23C962C4C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23C962C80(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DynamicSplitterStatus.config.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD7A08);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C962E2C(v9, (uint64_t)v8, &qword_256BD7A08);
  v10 = type metadata accessor for DynamicSplitterStatus.Config(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return sub_23C963154((uint64_t)v8, (uint64_t)a1);
  sub_23C964EB8((uint64_t)v8, &qword_256BD7A08);
  sub_23C962E70(v1, a1);
  sub_23C9630CC((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_23C963110((uint64_t)v6, v9, &qword_256BD7A08);
  return swift_endAccess();
}

uint64_t sub_23C962E2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C962E70@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  int *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v4 = (int *)type metadata accessor for DynamicSplitterStatus.Config(0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  v12 = sub_23C976AEC();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  v13(v9, 1, 1, v12);
  v14 = (uint64_t)&v6[v4[5]];
  v13((char *)v14, 1, 1, v12);
  v15 = (uint64_t)&v6[v4[6]];
  v13((char *)v15, 1, 1, v12);
  *v6 = 0;
  sub_23C963110((uint64_t)v11, v14, &qword_256BD79F0);
  sub_23C963110((uint64_t)v9, v15, &qword_256BD79F0);
  v6[v4[7]] = 0;
  v16 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[8]] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[9]] = v16;
  *(_QWORD *)&v6[v4[10]] = 0;
  sub_23C963154((uint64_t)v6, (uint64_t)a2);
  *a2 = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, (uint64_t)&a2[v4[5]]);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, (uint64_t)&a2[v4[6]]);
  a2[v4[7]] = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported);
  v17 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers);
  v18 = v4[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v18] = v17;
  v19 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers);
  v20 = v4[9];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v20] = v19;
  *(_QWORD *)&a2[v4[10]] = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy);
  return result;
}

uint64_t sub_23C9630CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C963110(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_23C963154(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t DynamicSplitterStatus.config.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD7A08);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C963154(a1, (uint64_t)v4);
  v5 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  v6 = v1 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C963110((uint64_t)v4, v6, &qword_256BD7A08);
  return swift_endAccess();
}

void (*DynamicSplitterStatus.config.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _BYTE *v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD7A08);
  v3[7] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = type metadata accessor for DynamicSplitterStatus.Config(0);
  v3[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[10] = malloc(v7);
  v8 = malloc(v7);
  v3[11] = v8;
  DynamicSplitterStatus.config.getter(v8);
  return sub_23C963304;
}

void sub_23C963304(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  v3 = *(void **)(*(_QWORD *)a1 + 88);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v6 = v2[9];
    v8 = v2[6];
    v7 = (void *)v2[7];
    sub_23C9630CC(v2[11], v2[10]);
    sub_23C963154((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    v9 = v8 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v9, &qword_256BD7A08);
    swift_endAccess();
    sub_23C962C80((uint64_t)v3);
  }
  else
  {
    v10 = v2[8];
    v11 = v2[9];
    v12 = v2[6];
    v7 = (void *)v2[7];
    sub_23C963154(v2[11], (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v13 = v12 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v13, &qword_256BD7A08);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static DynamicSplitterStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall DynamicSplitterStatus.encode(with:)(NSCoder with)
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
  char *v15;
  uint64_t v16;
  void *v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v32 - v8;
  v10 = sub_23C976AEC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v33 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - v14;
  v16 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled);
  v17 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v16, v17);

  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, (uint64_t)v9, &qword_256BD79F0);
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v18(v9, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v9, &qword_256BD79F0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v9, v10);
    v19 = (void *)sub_23C976AE0();
    v20 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v19, v20);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, (uint64_t)v7, &qword_256BD79F0);
  if (v18(v7, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v7, &qword_256BD79F0);
  }
  else
  {
    v21 = v33;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v33, v7, v10);
    v22 = (void *)sub_23C976AE0();
    v23 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v22, v23);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v10);
  }
  v24 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported);
  v25 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v24, v25);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers));
  sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  v26 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v27 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v26, v27);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers));
  v28 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v28, v29);

  v30 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy);
  v31 = (void *)sub_23C976B34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v30, v31);

}

uint64_t sub_23C963894(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_23C976CE4();
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23C976B34();
      swift_bridgeObjectRelease();
      sub_23C976CCC();
      sub_23C976CF0();
      sub_23C976CFC();
      sub_23C976CD8();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

id DynamicSplitterStatus.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23C963B74(a1);

  return v4;
}

id DynamicSplitterStatus.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_23C963B74(a1);

  return v2;
}

id DynamicSplitterStatus.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DynamicSplitterStatus.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DynamicSplitterStatus.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DynamicSplitterStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C963B74(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  __objc2_class_ro *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  int v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  __objc2_class_ro *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  __objc2_class_ro *v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  objc_class *v53;
  __int128 v55;
  _BYTE v56[24];
  uint64_t v57;
  objc_super v58;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v56[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v56[-v7 - 16];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)&v55 = &v56[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v56[-v13 - 16];
  v15 = &v1[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config];
  v16 = type metadata accessor for DynamicSplitterStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = v1;
  v18 = (void *)sub_23C976B34();
  v19 = &GameModeCCUIStatusInfo;
  v20 = objc_msgSend(a1, sel_decodeBoolForKey_, v18);

  v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enabled] = v20;
  v21 = (void *)sub_23C976B34();
  v22 = objc_msgSend(a1, sel_containsValueForKey_, v21);

  if ((v22 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_23C977B90;
    *(_QWORD *)(v23 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
    sub_23C976C48();
    swift_bridgeObjectRelease();
    if (v57)
    {
      v24 = swift_dynamicCast();
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v25(v8, v24 ^ 1u, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
      {
        v26 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v26(v14, v8, v9);
        v27 = &v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate];
        v26(&v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate], v14, v9);
        v19 = &GameModeCCUIStatusInfo;
        v25(v27, 0, 1, v9);
        v28 = &GameModeCCUIStatusInfo;
        goto LABEL_9;
      }
    }
    else
    {
      sub_23C964EB8((uint64_t)v56, (uint64_t *)&unk_256BD83B0);
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v25(v8, 1, 1, v9);
    }
    sub_23C964EB8((uint64_t)v8, &qword_256BD79F0);
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  }
  v28 = &GameModeCCUIStatusInfo;
  v25(&v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate], 1, 1, v9);
LABEL_9:
  v29 = (void *)sub_23C976B34();
  v30 = objc_msgSend(a1, v28[56].name, v29);

  if (!v30)
  {
LABEL_15:
    v37 = &v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate];
    v38 = 1;
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v31 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v57)
  {
    sub_23C964EB8((uint64_t)v56, (uint64_t *)&unk_256BD83B0);
    v25(v6, 1, 1, v9);
    goto LABEL_14;
  }
  v32 = swift_dynamicCast();
  v25(v6, v32 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
LABEL_14:
    sub_23C964EB8((uint64_t)v6, &qword_256BD79F0);
    goto LABEL_15;
  }
  v33 = v19;
  v34 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v35 = (_BYTE *)v55;
  v34((char *)v55, v6, v9);
  v36 = &v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate];
  v34(&v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate], v35, v9);
  v19 = v33;
  v37 = v36;
  v38 = 0;
LABEL_16:
  v25(v37, v38, 1, v9);
  v39 = (void *)sub_23C976B34();
  v40 = objc_msgSend(a1, (SEL)v19[56].ivar_lyt, v39);

  v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_deviceSupported] = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v41 = swift_allocObject();
  v55 = xmmword_23C977B90;
  *(_OWORD *)(v41 + 16) = xmmword_23C977B90;
  v42 = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  *(_QWORD *)(v41 + 32) = v42;
  v43 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v44 = MEMORY[0x24BEE4AF8];
  if (v43)
  {
    v45 = sub_23C9674F8(v43);
    swift_bridgeObjectRelease();
    if (v45)
      v44 = v45;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_impactedBundleIdentifiers] = v44;
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = v55;
  *(_QWORD *)(v46 + 32) = v42;
  v47 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v48 = MEMORY[0x24BEE4AF8];
  if (v47)
  {
    v49 = sub_23C9674F8(v47);
    swift_bridgeObjectRelease();
    if (v49)
      v48 = v49;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_previouslyImpactedBundleIdentifiers] = v48;
  v50 = (void *)sub_23C976B34();
  v51 = objc_msgSend(a1, sel_decodeIntegerForKey_, v50);

  v52 = v51 == (id)1;
  if (v51 == (id)2)
    v52 = 2;
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementStrategy] = v52;

  v53 = (objc_class *)type metadata accessor for DynamicSplitterStatus(0);
  v58.receiver = v17;
  v58.super_class = v53;
  return objc_msgSendSuper2(&v58, sel_init);
}

uint64_t sub_23C964258()
{
  return type metadata accessor for DynamicSplitterStatus(0);
}

void sub_23C964260()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_23C964330(319, &qword_256BD7AB8, (void (*)(uint64_t))type metadata accessor for DynamicSplitterStatus.Config);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_23C964330(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_23C976C84();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for DynamicSplitterStatus.Config(char *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_23C976AEC();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = a3[6];
    v16 = (char *)v4 + v15;
    v17 = &a2[v15];
    if (v12(&a2[v15], 1, v10))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    v19 = a3[8];
    *((_BYTE *)v4 + a3[7]) = a2[a3[7]];
    *(_QWORD *)((char *)v4 + v19) = *(_QWORD *)&a2[v19];
    v20 = a3[10];
    *(_QWORD *)((char *)v4 + a3[9]) = *(_QWORD *)&a2[a3[9]];
    *(_QWORD *)((char *)v4 + v20) = *(_QWORD *)&a2[v20];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for DynamicSplitterStatus.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23C976AEC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for DynamicSplitterStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *assignWithCopy for DynamicSplitterStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  return a1;
}

_BYTE *initializeWithTake for DynamicSplitterStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  return a1;
}

_BYTE *assignWithTake for DynamicSplitterStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v21] = *(_QWORD *)&a2[v21];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicSplitterStatus.Config()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C964CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicSplitterStatus.Config()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C964D5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  return result;
}

void sub_23C964DDC()
{
  unint64_t v0;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_23C964E80(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23C964EB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23C964EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t static ConsoleModeUserDisabled.supportsSecureCoding.getter()
{
  return 1;
}

id ConsoleModeUserDisabled.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;

  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeUserDisabled.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeUserDisabled.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ConsoleModeUserDisabled.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeUserDisabled();
  return objc_msgSendSuper2(&v2, sel_init);
}

unint64_t ConsoleModeUserDisabled.description.getter()
{
  return 0xD000000000000019;
}

id ConsoleModeUserDisabled.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeUserDisabled();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConsoleModeUserDisabled()
{
  return objc_opt_self();
}

unint64_t ModeEnablementStrategy.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

unint64_t sub_23C965174()
{
  unint64_t result;

  result = qword_256BD7C08;
  if (!qword_256BD7C08)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for ModeEnablementStrategy, &type metadata for ModeEnablementStrategy);
    atomic_store(result, (unint64_t *)&qword_256BD7C08);
  }
  return result;
}

uint64_t *sub_23C9651B8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ModeEnablementStrategy()
{
  return &type metadata for ModeEnablementStrategy;
}

BOOL static audit_token_t.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;

  if (a1 != a5)
    return 0;
  v8 = HIDWORD(a4) == HIDWORD(a8);
  if ((_DWORD)a4 != (_DWORD)a8)
    v8 = 0;
  v9 = HIDWORD(a3) == HIDWORD(a7) && v8;
  if ((_DWORD)a3 != (_DWORD)a7)
    v9 = 0;
  v10 = HIDWORD(a2) == HIDWORD(a6) && v9;
  return (_DWORD)a2 == (_DWORD)a6 && v10;
}

BOOL sub_23C965244(int32x4_t *a1, int32x4_t *a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_s32(*a1, *a2)), 0xFuLL))) & 1) != 0
    && a1[1].i32[0] == a2[1].i32[0]
    && a1[1].i32[1] == a2[1].i32[1]
    && a1[1].i32[2] == a2[1].i32[2])
  {
    return a1[1].i32[3] == a2[1].i32[3];
  }
  return result;
}

uint64_t static GamePolicyTargetDescription.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall GamePolicyTargetDescription.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInt_, *(unsigned int *)(v1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid));
  v4 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  v5 = (void *)sub_23C976B34();
  v6 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  v7 = *(_OWORD *)(v1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken + 16);
  v10 = *(_OWORD *)(v1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken);
  v11 = v7;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE50]), sel_initWithBytes_length_, &v10, 32);
  v9 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9, v10, v11);

}

id GamePolicyTargetDescription.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GamePolicyTargetDescription.init(coder:)(a1);
}

id GamePolicyTargetDescription.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  id v14;
  objc_super v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v2 = v1;
  v20 = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v4 + 32) = sub_23C964E80(0, &qword_256BD7C40);
  v5 = v2;
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
    goto LABEL_8;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v6 = objc_msgSend(v17, sel_unsignedIntValue);

  *(_DWORD *)&v5[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v6;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v7 + 32) = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_8:

    sub_23C964EB8((uint64_t)&v18, (uint64_t *)&unk_256BD83B0);
LABEL_10:
    type metadata accessor for GamePolicyTargetDescription();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_9;
  v8 = sub_23C976B4C();
  v10 = v9;

  v11 = (uint64_t *)&v5[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *v11 = v8;
  v11[1] = v10;
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v12 + 32) = sub_23C964E80(0, &qword_256BD7C48);
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {

    sub_23C964EB8((uint64_t)&v18, (uint64_t *)&unk_256BD83B0);
LABEL_14:

    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_14;
  }
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v17, sel_getBytes_length_, &v18, 32);

  v13 = &v5[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_OWORD *)v13 = v18;
  *((_OWORD *)v13 + 1) = v19;

  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for GamePolicyTargetDescription();
  v14 = objc_msgSendSuper2(&v16, sel_init);

  return v14;
}

uint64_t static GamePolicyTargetDescription.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid) != *(_DWORD *)(a2 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid)
    || (vminv_u8((uint8x8_t)vcltz_s8(vshl_n_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32(*(int32x4_t *)(a1+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken), *(int32x4_t *)(a2+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken)), (int16x8_t)vceqq_s32(*(int32x4_t *)(a1+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken+ 16), *(int32x4_t *)(a2+ OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken+ 16)))), 7uLL))) & 1) == 0)
  {
    return 0;
  }
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription) == *(_QWORD *)(a2 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription)
    && *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription + 8) == *(_QWORD *)(a2 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription + 8))
  {
    return 1;
  }
  else
  {
    return sub_23C976D38();
  }
}

uint64_t GamePolicyTargetDescription.hash.getter()
{
  return sub_23C976BD0();
}

uint64_t GamePolicyTargetDescription.euid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid);
}

uint64_t GamePolicyTargetDescription.auditToken.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken);
}

uint64_t GamePolicyTargetDescription.targetDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription);
  swift_bridgeObjectRetain();
  return v1;
}

id GamePolicyTargetDescription.__allocating_init(with:)(_QWORD *a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  objc_super v26;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
  v8 = (char *)v4;
  *(_DWORD *)&v8[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v7(v5, v6);
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
  v12 = &v8[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_QWORD *)v12 = v11;
  *((_DWORD *)v12 + 2) = v13;
  *((_DWORD *)v12 + 3) = v14;
  *((_DWORD *)v12 + 4) = v15;
  *((_DWORD *)v12 + 5) = v16;
  *((_DWORD *)v12 + 6) = v17;
  *((_DWORD *)v12 + 7) = v18;
  v19 = a1[3];
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
  v22 = (uint64_t *)&v8[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *v22 = v21;
  v22[1] = v23;

  v26.receiver = v8;
  v26.super_class = v2;
  v24 = objc_msgSendSuper2(&v26, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v24;
}

id GamePolicyTargetDescription.init(with:)(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  objc_super v24;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  v6 = v1;
  *(_DWORD *)&v6[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v5(v3, v4);
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  v10 = &v6[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_QWORD *)v10 = v9;
  *((_DWORD *)v10 + 2) = v11;
  *((_DWORD *)v10 + 3) = v12;
  *((_DWORD *)v10 + 4) = v13;
  *((_DWORD *)v10 + 5) = v14;
  *((_DWORD *)v10 + 6) = v15;
  *((_DWORD *)v10 + 7) = v16;
  v17 = a1[3];
  v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v17);
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
  v20 = (uint64_t *)&v6[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *v20 = v19;
  v20[1] = v21;

  v24.receiver = v6;
  v24.super_class = (Class)type metadata accessor for GamePolicyTargetDescription();
  v22 = objc_msgSendSuper2(&v24, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v22;
}

id GamePolicyTargetDescription.__allocating_init(euid:auditToken:targetDescription:)(int a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  objc_super v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v13 = HIDWORD(a2);
  v14 = HIDWORD(a3);
  v15 = HIDWORD(a4);
  v16 = HIDWORD(a5);
  v17 = (char *)objc_allocWithZone(v7);
  *(_DWORD *)&v17[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = a1;
  v18 = &v17[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_DWORD *)v18 = v11;
  *((_DWORD *)v18 + 1) = v13;
  *((_DWORD *)v18 + 2) = v10;
  *((_DWORD *)v18 + 3) = v14;
  *((_DWORD *)v18 + 4) = v9;
  *((_DWORD *)v18 + 5) = v15;
  *((_DWORD *)v18 + 6) = v8;
  *((_DWORD *)v18 + 7) = v16;
  v19 = &v17[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *(_QWORD *)v19 = a6;
  *((_QWORD *)v19 + 1) = a7;
  v23.receiver = v17;
  v23.super_class = v7;
  return objc_msgSendSuper2(&v23, sel_init);
}

id GamePolicyTargetDescription.init(euid:auditToken:targetDescription:)(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  char *v8;
  char *v9;
  objc_super v11;

  *(_DWORD *)&v7[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = a1;
  v8 = &v7[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  *((_QWORD *)v8 + 2) = a4;
  *((_QWORD *)v8 + 3) = a5;
  v9 = &v7[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *(_QWORD *)v9 = a6;
  *((_QWORD *)v9 + 1) = a7;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for GamePolicyTargetDescription();
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t GamePolicyTargetDescription.description.getter()
{
  sub_23C976CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  return 0xD000000000000015;
}

id GamePolicyTargetDescription.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void GamePolicyTargetDescription.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GamePolicyTargetDescription.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyTargetDescription);
}

uint64_t sub_23C965E8C()
{
  _QWORD *v0;

  return *(unsigned int *)(*v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid);
}

uint64_t sub_23C965EA0()
{
  _QWORD *v0;

  return *(_QWORD *)(*v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken);
}

uint64_t sub_23C965EBC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static GamePolicyAssertion.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall GamePolicyAssertion.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  objc_super v31;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  v2 = v1;
  sub_23C967020(v1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target, (uint64_t)v32);
  v4 = (objc_class *)type metadata accessor for GamePolicyTargetDescription();
  v5 = objc_allocWithZone(v4);
  v6 = v33;
  v7 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 16);
  v9 = (char *)v5;
  *(_DWORD *)&v9[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_euid] = v8(v6, v7);
  v10 = v33;
  v11 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(v10, v11);
  v13 = &v9[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_auditToken];
  *(_QWORD *)v13 = v12;
  *((_DWORD *)v13 + 2) = v14;
  *((_DWORD *)v13 + 3) = v15;
  *((_DWORD *)v13 + 4) = v16;
  *((_DWORD *)v13 + 5) = v17;
  *((_DWORD *)v13 + 6) = v18;
  *((_DWORD *)v13 + 7) = v19;
  v20 = v33;
  v21 = v34;
  __swift_project_boxed_opaque_existential_1(v32, v33);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 32))(v20, v21);
  v23 = (uint64_t *)&v9[OBJC_IVAR____TtC10GamePolicy27GamePolicyTargetDescription_targetDescription];
  *v23 = v22;
  v23[1] = v24;

  v31.receiver = v9;
  v31.super_class = v4;
  v25 = objc_msgSendSuper2(&v31, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  v26 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v25, v26);

  type metadata accessor for GamePolicyAssertion.Attribute();
  v27 = (void *)sub_23C976BF4();
  v28 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v27, v28);

  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, *(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier));
  v30 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v29, v30);

}

id GamePolicyAssertion.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GamePolicyAssertion.init(coder:)(a1);
}

id GamePolicyAssertion.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  objc_super v15;
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23C977D00;
  v5 = type metadata accessor for GamePolicyTargetDescription();
  *(_QWORD *)(v4 + 32) = v5;
  v6 = sub_23C964E80(0, &qword_256BD7C40);
  *(_QWORD *)(v4 + 40) = v6;
  *(_QWORD *)(v4 + 48) = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  *(_QWORD *)(v4 + 56) = sub_23C964E80(0, &qword_256BD7C48);
  v7 = v2;
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v18)
  {

    sub_23C964EB8((uint64_t)v17, (uint64_t *)&unk_256BD83B0);
LABEL_10:

    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

LABEL_14:
    type metadata accessor for GamePolicyAssertion();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v8 = v16;
  v9 = &v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target];
  *(_QWORD *)&v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target + 24] = v5;
  *((_QWORD *)v9 + 4) = sub_23C967498(&qword_256BD7C68, (uint64_t)&protocol conformance descriptor for GamePolicyTargetDescription);
  *(_QWORD *)v9 = v8;
  type metadata accessor for GamePolicyAssertion.Attribute();
  v10 = sub_23C976C54();
  if (!v10)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    goto LABEL_10;
  }
  *(_QWORD *)&v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_attributes] = v10;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v11 + 32) = v6;
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v18)
  {

    sub_23C964EB8((uint64_t)v17, (uint64_t *)&unk_256BD83B0);
LABEL_13:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_13;
  }
  v12 = objc_msgSend(v16, sel_unsignedIntegerValue);

  *(_QWORD *)&v7[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier] = v12;
  v15.receiver = v7;
  v15.super_class = (Class)type metadata accessor for GamePolicyAssertion();
  v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

double sub_23C9664E8()
{
  double result;

  qword_256BD9440 = 0;
  result = 0.0;
  static GamePolicyAssertion.delegate = 0u;
  unk_256BD9430 = 0u;
  return result;
}

__int128 *GamePolicyAssertion.delegate.unsafeMutableAddressor()
{
  if (qword_256BD7940 != -1)
    swift_once();
  return &static GamePolicyAssertion.delegate;
}

uint64_t static GamePolicyAssertion.delegate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_256BD7940 != -1)
    swift_once();
  swift_beginAccess();
  return sub_23C966F90((uint64_t)&static GamePolicyAssertion.delegate, a1);
}

uint64_t static GamePolicyAssertion.delegate.setter(uint64_t a1)
{
  if (qword_256BD7940 != -1)
    swift_once();
  swift_beginAccess();
  sub_23C966FD8(a1, (uint64_t)&static GamePolicyAssertion.delegate);
  swift_endAccess();
  return sub_23C964EB8(a1, &qword_256BD7C70);
}

uint64_t (*static GamePolicyAssertion.delegate.modify())()
{
  if (qword_256BD7940 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

BOOL static GamePolicyAssertion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier) == *(_QWORD *)(a2 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
}

uint64_t GamePolicyAssertion.hash.getter()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
  if (result < 0)
    __break(1u);
  return result;
}

uint64_t GamePolicyAssertion.hasAttribute<A>(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  int v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v18[2];

  v4 = sub_23C976C84();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - v6;
  v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_attributes);
  if (v8 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    v9 = sub_23C976D14();
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v11 = i - 4;
        if ((v8 & 0xC000000000000001) != 0)
        {
          v12 = (id)MEMORY[0x242626B58](i - 4, v8);
          v13 = __OFADD__(v11, 1);
          v14 = i - 3;
          if (v13)
            goto LABEL_15;
        }
        else
        {
          v12 = *(id *)(v8 + 8 * i);
          v13 = __OFADD__(v11, 1);
          v14 = i - 3;
          if (v13)
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        v18[1] = v12;
        type metadata accessor for GamePolicyAssertion.Attribute();
        v15 = swift_dynamicCast();
        v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56);
        if (v15)
        {
          v9 = 1;
          v16(v7, 0, 1, a2);
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          break;
        }
        v16(v7, 1, 1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v14 == v9)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v9;
}

id sub_23C9668A0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  qword_256BD7C10 = (uint64_t)result;
  return result;
}

uint64_t GamePolicyAssertion.target.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C967020(v1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target, a1);
}

uint64_t GamePolicyAssertion.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAssertion.identifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
}

void GamePolicyAssertion.__allocating_init(target:attributes:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  GamePolicyAssertion.init(target:attributes:)(a1, a2);
}

void GamePolicyAssertion.init(target:attributes:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  objc_super v7;

  sub_23C967020(a1, (uint64_t)&v2[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target]);
  *(_QWORD *)&v2[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_attributes] = a2;
  v5 = qword_256BD7948;
  v6 = v2;
  if (v5 != -1)
    swift_once();
  objc_msgSend((id)qword_256BD7C10, sel_lock);
  *(_QWORD *)&v6[OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier] = qword_256BD7C18;

  if (qword_256BD7C18 == -1)
  {
    __break(1u);
  }
  else
  {
    ++qword_256BD7C18;
    objc_msgSend((id)qword_256BD7C10, sel_unlock);
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for GamePolicyAssertion();
    objc_msgSendSuper2(&v7, sel_init);
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
}

Swift::Void __swiftcall GamePolicyAssertion.acquire()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  if (qword_256BD7940 != -1)
    swift_once();
  swift_beginAccess();
  if (qword_256BD9438)
  {
    sub_23C967020((uint64_t)&static GamePolicyAssertion.delegate, (uint64_t)v3);
    v1 = v4;
    v2 = v5;
    __swift_project_boxed_opaque_existential_1(v3, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 8))(v0, v1, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
}

Swift::Void __swiftcall GamePolicyAssertion.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  if (qword_256BD7940 != -1)
    swift_once();
  swift_beginAccess();
  if (qword_256BD9438)
  {
    sub_23C967020((uint64_t)&static GamePolicyAssertion.delegate, (uint64_t)v3);
    v1 = v4;
    v2 = v5;
    __swift_project_boxed_opaque_existential_1(v3, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v1, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
}

id sub_23C966BC4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_23C976B34();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t GamePolicyAssertion.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23C976CA8();
  swift_bridgeObjectRelease();
  sub_23C976D2C();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target + 24);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target), v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  v3 = type metadata accessor for GamePolicyAssertion.Attribute();
  v4 = swift_bridgeObjectRetain();
  MEMORY[0x242626AB0](v4, v3);
  sub_23C976B88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  return 0xD000000000000011;
}

void GamePolicyAssertion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GamePolicyAssertion.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAssertion);
}

void sub_23C966E2C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *(_QWORD *)(*v1 + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
}

uint64_t static GamePolicyAssertion.Attribute.supportsSecureCoding.getter()
{
  return 1;
}

id GamePolicyAssertion.Attribute.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;

  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = v1;
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id GamePolicyAssertion.Attribute.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

uint64_t type metadata accessor for GamePolicyAssertion.Attribute()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for GamePolicyTargetDescription()
{
  return objc_opt_self();
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

uint64_t type metadata accessor for GamePolicyAssertion()
{
  return objc_opt_self();
}

uint64_t sub_23C966F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD7C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C966FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD7C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C967020(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t GamePolicyAssertion.Attribute.description.getter()
{
  return 0x756269727474413CLL;
}

uint64_t static GamePolicyAssertion.Attribute.Privileged.supportsSecureCoding.getter()
{
  return 1;
}

id GamePolicyAssertion.Attribute.Privileged.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute.Privileged();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GamePolicyAssertion.Attribute.Privileged()
{
  return objc_opt_self();
}

uint64_t GamePolicyAssertion.Attribute.Privileged.description.getter()
{
  return 0x656C69766972503CLL;
}

id GamePolicyAssertion.Attribute.Privileged.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAssertion.Attribute.Privileged);
}

id GamePolicyAssertion.Attribute.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAssertion.Attribute);
}

uint64_t static GamePolicyAssertion.Grant.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t GamePolicyAssertion.Grant.description.getter()
{
  return 0x3E746E6172473CLL;
}

id GamePolicyAssertion.Grant.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAssertion.Grant);
}

uint64_t type metadata accessor for GamePolicyAssertion.Grant()
{
  return objc_opt_self();
}

uint64_t static GamePolicyAssertion.Limitation.supportsSecureCoding.getter()
{
  return 1;
}

id _s10GamePolicy0aB9AssertionC9AttributeC10PrivilegedC5coderAGSgSo7NSCoderC_tcfC_0(void *a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;

  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id _s10GamePolicy0aB9AssertionC5GrantC5coderAESgSo7NSCoderC_tcfc_0(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id sub_23C96737C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t GamePolicyAssertion.Limitation.description.getter()
{
  return 0x746174696D694C3CLL;
}

id GamePolicyAssertion.Limitation.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAssertion.Limitation);
}

id sub_23C967414(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for GamePolicyAssertion.Limitation()
{
  return objc_opt_self();
}

uint64_t sub_23C967464(uint64_t a1)
{
  uint64_t result;

  result = sub_23C967498(&qword_256BD7C78, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23C967498(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for GamePolicyTargetDescription();
    result = MEMORY[0x242626F00](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23C9674D4()
{
  return MEMORY[0x24BEE1E98];
}

uint64_t sub_23C9674F8(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  sub_23C96A550(0, v2, 0);
  v3 = v12;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_23C96A988(i, (uint64_t)v11);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23C96A550(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v12;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23C96A550((char *)(v5 > 1), v6 + 1, 1);
        v3 = v12;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_23C96763C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  _BYTE v8[32];
  uint64_t v9;

  v9 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a1 + 16);
  sub_23C976CE4();
  if (!v4)
    return v9;
  for (i = a1 + 32; ; i += 32)
  {
    v6 = sub_23C96A988(i, (uint64_t)v8);
    a2(v6);
    if (!swift_dynamicCast())
      break;
    sub_23C976CCC();
    sub_23C976CF0();
    sub_23C976CFC();
    sub_23C976CD8();
    if (!--v4)
      return v9;
  }
  swift_release();

  return 0;
}

unint64_t GameModeCCUIStatusBundleState.init(rawValue:)(unint64_t a1)
{
  return sub_23C962294(a1);
}

char *GameModeCCUIStatusBundleInfo.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatusBundleInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundleInfo.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static GameModeCCUIStatusBundleInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundleInfo.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static GameModeCCUIStatusBundleInfo.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatusBundleInfo.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.bundleIdentifier.getter()
{
  return sub_23C9693E4(&OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
}

uint64_t GameModeCCUIStatusBundleInfo.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C969440(a1, a2, &OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
}

uint64_t (*GameModeCCUIStatusBundleInfo.bundleIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.executableDisplayName.getter()
{
  return sub_23C9693E4(&OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
}

uint64_t GameModeCCUIStatusBundleInfo.executableDisplayName.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C969440(a1, a2, &OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
}

uint64_t (*GameModeCCUIStatusBundleInfo.executableDisplayName.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.isSystemService.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundleInfo.isSystemService.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.isSystemService.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.isAAAGame.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundleInfo.isAAAGame.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.isAAAGame.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.usedRecently.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundleInfo.usedRecently.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.usedRecently.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundleInfo.state.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t GameModeCCUIStatusBundleInfo.state.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundleInfo.state.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id GameModeCCUIStatusBundleInfo.__allocating_init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8)
{
  objc_class *v8;
  _BYTE *v17;
  _QWORD *v18;
  _QWORD *v19;
  objc_super v21;

  v17 = objc_allocWithZone(v8);
  v18 = &v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName];
  *v18 = a1;
  v18[1] = a2;
  v19 = &v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier];
  *v19 = a3;
  v19[1] = a4;
  v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService] = a5;
  v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame] = a6;
  v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently] = a7;
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state] = a8;
  v21.receiver = v17;
  v21.super_class = v8;
  return objc_msgSendSuper2(&v21, sel_init);
}

id GameModeCCUIStatusBundleInfo.init(executableDisplayName:bundleIdentifier:isSystemService:isAAAGame:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8)
{
  _BYTE *v8;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  v9 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName];
  *v9 = a1;
  v9[1] = a2;
  v10 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier];
  *v10 = a3;
  v10[1] = a4;
  v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService] = a5;
  v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame] = a6;
  v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently] = a7;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state] = a8;
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for GameModeCCUIStatusBundleInfo();
  return objc_msgSendSuper2(&v12, sel_init);
}

id GameModeCCUIStatusBundleInfo.revlock.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  _BYTE *v9;
  uint64_t *v10;
  uint64_t v11;
  objc_class *v12;
  _BYTE *v13;
  _QWORD *v14;
  _QWORD *v15;
  objc_super v17;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
  swift_beginAccess();
  v3 = *v1;
  v2 = v1[1];
  v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
  swift_beginAccess();
  v6 = *v4;
  v5 = v4[1];
  v7 = (char *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  swift_beginAccess();
  v8 = *v7;
  v9 = (_BYTE *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  swift_beginAccess();
  LOBYTE(v9) = *v9;
  v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state);
  swift_beginAccess();
  v11 = *v10;
  v12 = (objc_class *)type metadata accessor for GameModeCCUIStatusBundle();
  v13 = objc_allocWithZone(v12);
  v14 = &v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
  *v14 = v3;
  v14[1] = v2;
  v15 = &v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
  *v15 = v6;
  v15[1] = v5;
  v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = v8;
  v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = (_BYTE)v9;
  *(_QWORD *)&v13[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = v11;
  v17.receiver = v13;
  v17.super_class = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v17, sel_init);
}

id GameModeCCUIStatusBundle.__allocating_init(executableDisplayName:bundleIdentifier:isSystemService:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7)
{
  objc_class *v7;
  _BYTE *v15;
  _QWORD *v16;
  _QWORD *v17;
  objc_super v19;

  v15 = objc_allocWithZone(v7);
  v16 = &v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
  *v16 = a1;
  v16[1] = a2;
  v17 = &v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
  *v17 = a3;
  v17[1] = a4;
  v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = a5;
  v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = a6;
  *(_QWORD *)&v15[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = a7;
  v19.receiver = v15;
  v19.super_class = v7;
  return objc_msgSendSuper2(&v19, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatusBundleInfo.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  void *v18;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23C976B34();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_23C976B34();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  v7 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService);
  swift_beginAccess();
  v8 = *v7;
  v9 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v8, v9);

  v10 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently);
  swift_beginAccess();
  v11 = *v10;
  v12 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v11, v12);

  v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state);
  swift_beginAccess();
  v14 = *v13;
  v15 = (void *)sub_23C976B34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v14, v15);

  v16 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame);
  swift_beginAccess();
  v17 = *v16;
  v18 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v17, v18);

}

uint64_t GameModeCCUIStatusBundleInfo.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatusBundleInfo.init(coder:)(a1);
}

uint64_t GameModeCCUIStatusBundleInfo.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v3 = v1;
  v4 = (void *)sub_23C976B34();
  objc_msgSend(a1, sel_decodeIntegerForKey_, v4);

  sub_23C96A6AC();
  v5 = sub_23C976C3C();
  if (v5)
  {
    v6 = (void *)v5;
    v8 = 0;
    sub_23C976B40();

  }
  type metadata accessor for GameModeCCUIStatusBundleInfo();
  swift_deallocPartialClassInstance();
  return 0;
}

void GameModeCCUIStatusBundleInfo.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GameModeCCUIStatusBundleInfo.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GameModeCCUIStatusBundleInfo);
}

char *GameModeCCUIStatusInfo.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatusInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusInfo.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static GameModeCCUIStatusInfo.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusInfo.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static GameModeCCUIStatusInfo.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatusInfo.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusInfo.state.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state);
}

uint64_t GameModeCCUIStatusInfo.bundles.getter()
{
  return sub_23C969F50();
}

uint64_t GameModeCCUIStatusInfo.bundles.setter(uint64_t a1)
{
  return sub_23C969FA0(a1, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles);
}

uint64_t (*GameModeCCUIStatusInfo.bundles.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id GameModeCCUIStatusInfo.__allocating_init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_23C968C38(a1, a2, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles);
}

id GameModeCCUIStatusInfo.init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_23C96A04C(a1, a2, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state, &OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles, type metadata accessor for GameModeCCUIStatusInfo);
}

id GameModeCCUIStatusInfo.revlock.getter()
{
  uint64_t v0;
  char v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  char *v17;
  char v18;
  char *v19;
  uint64_t v20;
  objc_class *v21;
  _BYTE *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  objc_class *v26;
  _BYTE *v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  objc_super v32;
  objc_super v33;
  uint64_t v34;

  v1 = *(_BYTE *)(v0 + OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state);
  v2 = (unint64_t *)(v0 + OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles);
  swift_beginAccess();
  v3 = *v2;
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    v25 = MEMORY[0x24BEE4AF8];
LABEL_12:
    v26 = (objc_class *)type metadata accessor for GameModeCCUIStatus();
    v27 = objc_allocWithZone(v26);
    v27[OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state] = v1;
    *(_QWORD *)&v27[OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles] = v25;
    v32.receiver = v27;
    v32.super_class = v26;
    return objc_msgSendSuper2(&v32, sel_init);
  }
  swift_bridgeObjectRetain();
  v4 = sub_23C976D14();
  if (!v4)
    goto LABEL_11;
LABEL_3:
  v34 = MEMORY[0x24BEE4AF8];
  result = (id)sub_23C976CE4();
  if ((v4 & 0x8000000000000000) == 0)
  {
    v28 = v1;
    v6 = 0;
    v29 = v3 & 0xC000000000000001;
    v30 = v4;
    v31 = v3;
    do
    {
      if (v29)
        v7 = (char *)MEMORY[0x242626B58](v6, v3);
      else
        v7 = (char *)*(id *)(v3 + 8 * v6 + 32);
      v8 = v7;
      ++v6;
      v9 = &v7[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName];
      swift_beginAccess();
      v11 = *(_QWORD *)v9;
      v10 = *((_QWORD *)v9 + 1);
      v12 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier];
      swift_beginAccess();
      v14 = *(_QWORD *)v12;
      v13 = *((_QWORD *)v12 + 1);
      v15 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService];
      swift_beginAccess();
      v16 = *v15;
      v17 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently];
      swift_beginAccess();
      v18 = *v17;
      v19 = &v8[OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state];
      swift_beginAccess();
      v20 = *(_QWORD *)v19;
      v21 = (objc_class *)type metadata accessor for GameModeCCUIStatusBundle();
      v22 = objc_allocWithZone(v21);
      v23 = &v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
      *v23 = v11;
      v23[1] = v10;
      v24 = &v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
      *v24 = v14;
      v24[1] = v13;
      v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = v16;
      v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = v18;
      *(_QWORD *)&v22[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = v20;
      v33.receiver = v22;
      v33.super_class = v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      objc_msgSendSuper2(&v33, sel_init);

      sub_23C976CCC();
      sub_23C976CF0();
      sub_23C976CFC();
      sub_23C976CD8();
      v3 = v31;
    }
    while (v30 != v6);
    v25 = v34;
    swift_bridgeObjectRelease();
    v1 = v28;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

id GameModeCCUIStatus.__allocating_init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_23C968C38(a1, a2, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles);
}

id sub_23C968C38(char a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  objc_class *v4;
  _BYTE *v9;
  objc_super v11;

  v9 = objc_allocWithZone(v4);
  v9[*a3] = a1;
  *(_QWORD *)&v9[*a4] = a2;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatusInfo.encode(with:)(NSCoder with)
{
  sub_23C96A0A8((uint64_t)with.super.isa, (uint64_t)&OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state);
}

uint64_t GameModeCCUIStatusState.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23C968CFC + 4 * byte_23C977E26[a1]))(0x664F646563726F66, 0xE900000000000066);
}

uint64_t sub_23C968CFC()
{
  return 0x616C696176616E75;
}

uint64_t sub_23C968D1C()
{
  return 0x6C62616C69617661;
}

uint64_t sub_23C968D38()
{
  return 0x64656C62616E65;
}

uint64_t sub_23C968D50()
{
  return 0x6E4F646563726F66;
}

uint64_t GameModeCCUIStatusInfo.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatusInfo.init(coder:)(a1);
}

uint64_t GameModeCCUIStatusInfo.init(coder:)(void *a1)
{
  return sub_23C96A300(a1, (uint64_t)type metadata accessor for GameModeCCUIStatusBundleInfo, (uint64_t)&OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_state, (uint64_t)&OBJC_IVAR____TtC10GamePolicy22GameModeCCUIStatusInfo_bundles, (void (*)(void))type metadata accessor for GameModeCCUIStatusInfo);
}

void GameModeCCUIStatusInfo.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GameModeCCUIStatusInfo.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GameModeCCUIStatusInfo);
}

void sub_23C968EAC(char *a1)
{
  sub_23C96A9D8(*a1);
}

void sub_23C968EB8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23C976D44();
  __asm { BR              X9 }
}

uint64_t sub_23C968F0C()
{
  sub_23C976B70();
  swift_bridgeObjectRelease();
  return sub_23C976D5C();
}

void sub_23C968FA0()
{
  __asm { BR              X10 }
}

uint64_t sub_23C968FE4()
{
  sub_23C976B70();
  return swift_bridgeObjectRelease();
}

void sub_23C969064()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23C976D44();
  __asm { BR              X9 }
}

uint64_t sub_23C9690B4()
{
  sub_23C976B70();
  swift_bridgeObjectRelease();
  return sub_23C976D5C();
}

uint64_t sub_23C969148@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s10GamePolicy0A19ModeCCUIStatusStateO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_23C969174()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23C9691AC + 4 * byte_23C977E3A[*v0]))();
}

void sub_23C9691AC(_QWORD *a1@<X8>)
{
  *a1 = 0x616C696176616E75;
  a1[1] = 0xEB00000000656C62;
}

void sub_23C9691D0(_QWORD *a1@<X8>)
{
  *a1 = 0x6C62616C69617661;
  a1[1] = 0xE900000000000065;
}

void sub_23C9691F0(_QWORD *a1@<X8>)
{
  *a1 = 0x64656C62616E65;
  a1[1] = 0xE700000000000000;
}

void sub_23C96920C(_QWORD *a1@<X8>)
{
  *a1 = 0x6E4F646563726F66;
  a1[1] = 0xE800000000000000;
}

char *GameModeCCUIStatusBundle.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatusBundle.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundle.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static GameModeCCUIStatusBundle.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatusBundle.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static GameModeCCUIStatusBundle.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatusBundle.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.bundleIdentifier.getter()
{
  return sub_23C9693E4(&OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier);
}

uint64_t GameModeCCUIStatusBundle.bundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C969440(a1, a2, &OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier);
}

uint64_t (*GameModeCCUIStatusBundle.bundleIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.executableDisplayName.getter()
{
  return sub_23C9693E4(&OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName);
}

uint64_t sub_23C9693E4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t GameModeCCUIStatusBundle.executableDisplayName.setter(uint64_t a1, uint64_t a2)
{
  return sub_23C969440(a1, a2, &OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName);
}

uint64_t sub_23C969440(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*GameModeCCUIStatusBundle.executableDisplayName.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.isSystemService.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundle.isSystemService.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundle.isSystemService.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.usedRecently.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently);
  swift_beginAccess();
  return *v1;
}

uint64_t GameModeCCUIStatusBundle.usedRecently.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundle.usedRecently.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GameModeCCUIStatusBundle.state.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t GameModeCCUIStatusBundle.state.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*GameModeCCUIStatusBundle.state.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id GameModeCCUIStatusBundle.init(executableDisplayName:bundleIdentifier:isSystemService:usedRecently:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, uint64_t a7)
{
  _BYTE *v7;
  _QWORD *v8;
  _QWORD *v9;
  objc_super v11;

  v8 = &v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_executableDisplayName];
  *v8 = a1;
  v8[1] = a2;
  v9 = &v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_bundleIdentifier];
  *v9 = a3;
  v9[1] = a4;
  v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService] = a5;
  v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently] = a6;
  *(_QWORD *)&v7[OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state] = a7;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for GameModeCCUIStatusBundle();
  return objc_msgSendSuper2(&v11, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatusBundle.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23C976B34();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = (void *)sub_23C976B34();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

  v7 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_isSystemService);
  swift_beginAccess();
  v8 = *v7;
  v9 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v8, v9);

  v10 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_usedRecently);
  swift_beginAccess();
  v11 = *v10;
  v12 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v11, v12);

  v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC10GamePolicy24GameModeCCUIStatusBundle_state);
  swift_beginAccess();
  v14 = *v13;
  v15 = (void *)sub_23C976B34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v14, v15);

}

uint64_t GameModeCCUIStatusBundle.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatusBundle.init(coder:)(a1);
}

uint64_t GameModeCCUIStatusBundle.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v3 = v1;
  v4 = (void *)sub_23C976B34();
  objc_msgSend(a1, sel_decodeIntegerForKey_, v4);

  sub_23C96A6AC();
  v5 = sub_23C976C3C();
  if (v5)
  {
    v6 = (void *)v5;
    v8 = 0;
    sub_23C976B40();

  }
  type metadata accessor for GameModeCCUIStatusBundle();
  swift_deallocPartialClassInstance();
  return 0;
}

void GameModeCCUIStatusBundle.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GameModeCCUIStatusBundle.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GameModeCCUIStatusBundle);
}

uint64_t sub_23C969DA4()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *GameModeCCUIStatus.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GameModeCCUIStatus.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatus.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static GameModeCCUIStatus.supportsSecureCoding;
}

uint64_t static GameModeCCUIStatus.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static GameModeCCUIStatus.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GameModeCCUIStatus.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t GameModeCCUIStatus.state.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state);
}

uint64_t GameModeCCUIStatus.bundles.getter()
{
  return sub_23C969F50();
}

uint64_t sub_23C969F50()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t GameModeCCUIStatus.bundles.setter(uint64_t a1)
{
  return sub_23C969FA0(a1, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles);
}

uint64_t sub_23C969FA0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*GameModeCCUIStatus.bundles.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id GameModeCCUIStatus.init(state:bundles:)(char a1, uint64_t a2)
{
  return sub_23C96A04C(a1, a2, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state, &OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles, type metadata accessor for GameModeCCUIStatus);
}

id sub_23C96A04C(char a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t (*a5)(void))
{
  _BYTE *v5;
  objc_super v7;

  v5[*a3] = a1;
  *(_QWORD *)&v5[*a4] = a2;
  v7.receiver = v5;
  v7.super_class = (Class)a5();
  return objc_msgSendSuper2(&v7, sel_init);
}

Swift::Void __swiftcall GameModeCCUIStatus.encode(with:)(NSCoder with)
{
  sub_23C96A0A8((uint64_t)with.super.isa, (uint64_t)&OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state);
}

void sub_23C96A0A8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

void sub_23C96A10C()
{
  void *v0;
  void (*v1)(uint64_t);
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)sub_23C976B34();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_23C976B34();
  objc_msgSend(v0, sel_encodeObject_forKey_, v2, v3);

  v4 = swift_beginAccess();
  v1(v4);
  swift_bridgeObjectRetain();
  v5 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23C976B34();
  objc_msgSend(v0, sel_encodeObject_forKey_, v5, v6);

}

uint64_t GameModeCCUIStatus.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GameModeCCUIStatus.init(coder:)(a1);
}

uint64_t GameModeCCUIStatus.init(coder:)(void *a1)
{
  return sub_23C96A300(a1, (uint64_t)type metadata accessor for GameModeCCUIStatusBundle, (uint64_t)&OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_state, (uint64_t)&OBJC_IVAR____TtC10GamePolicy18GameModeCCUIStatus_bundles, (void (*)(void))type metadata accessor for GameModeCCUIStatus);
}

uint64_t sub_23C96A300(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  void *v5;
  void *v7;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  v7 = v5;
  sub_23C96A6AC();
  v9 = v7;
  v10 = sub_23C976C3C();
  if (v10)
  {
    v11 = (void *)v10;
    v13 = 0;
    v14 = 0;
    sub_23C976B40();

  }
  a5();
  swift_deallocPartialClassInstance();
  return 0;
}

id GameModeCCUIStatus.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void GameModeCCUIStatus.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GameModeCCUIStatus.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GameModeCCUIStatus);
}

char *sub_23C96A550(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23C96A56C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23C96A56C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_256BD7EB0);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t type metadata accessor for GameModeCCUIStatusBundleInfo()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for GameModeCCUIStatusBundle()
{
  return objc_opt_self();
}

unint64_t sub_23C96A6AC()
{
  unint64_t result;

  result = qword_256BD7A10;
  if (!qword_256BD7A10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256BD7A10);
  }
  return result;
}

uint64_t type metadata accessor for GameModeCCUIStatusInfo()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for GameModeCCUIStatus()
{
  return objc_opt_self();
}

uint64_t _s10GamePolicy0A19ModeCCUIStatusStateO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_23C976D20();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_23C96A774()
{
  unint64_t result;

  result = qword_256BD7E00;
  if (!qword_256BD7E00)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for GameModeCCUIStatusBundleState, &type metadata for GameModeCCUIStatusBundleState);
    atomic_store(result, (unint64_t *)&qword_256BD7E00);
  }
  return result;
}

unint64_t sub_23C96A7BC()
{
  unint64_t result;

  result = qword_256BD7E08;
  if (!qword_256BD7E08)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for GameModeCCUIStatusState, &type metadata for GameModeCCUIStatusState);
    atomic_store(result, (unint64_t *)&qword_256BD7E08);
  }
  return result;
}

ValueMetadata *type metadata accessor for GameModeCCUIStatusBundleState()
{
  return &type metadata for GameModeCCUIStatusBundleState;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GameModeCCUIStatusState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for GameModeCCUIStatusState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C96A8F8 + 4 * byte_23C977E4E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23C96A92C + 4 * byte_23C977E49[v4]))();
}

uint64_t sub_23C96A92C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C96A934(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C96A93CLL);
  return result;
}

uint64_t sub_23C96A948(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C96A950);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23C96A954(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C96A95C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C96A968(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23C96A970(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GameModeCCUIStatusState()
{
  return &type metadata for GameModeCCUIStatusState;
}

uint64_t sub_23C96A988(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23C96A9D8(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23C96AA30(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23C96AAB8 + 4 * byte_23C978065[a2]))(0x616C696176616E75);
}

uint64_t sub_23C96AAB8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x616C696176616E75 && v1 == 0xEB00000000656C62)
    v2 = 1;
  else
    v2 = sub_23C976D38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_23C96AB88(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x4D656D6147414141;
  else
    v3 = 0xD000000000000010;
  if (v2)
    v4 = 0x800000023C978840;
  else
    v4 = 0xEB0000000065646FLL;
  if ((a2 & 1) != 0)
    v5 = 0x4D656D6147414141;
  else
    v5 = 0xD000000000000010;
  if ((a2 & 1) != 0)
    v6 = 0xEB0000000065646FLL;
  else
    v6 = 0x800000023C978840;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_23C976D38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t static ModelManagerGameAssertionPolicy.< infix(_:_:)(char a1, unsigned __int8 a2)
{
  return ((a1 & 1) == 0) & a2;
}

GamePolicy::ModelManagerGameAssertionPolicy_optional __swiftcall ModelManagerGameAssertionPolicy.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  GamePolicy::ModelManagerGameAssertionPolicy_optional v2;

  v1 = sub_23C976D20();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = GamePolicy_ModelManagerGameAssertionPolicy_aaaGameMode;
  else
    v2.value = GamePolicy_ModelManagerGameAssertionPolicy_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ModelManagerGameAssertionPolicy.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4D656D6147414141;
  else
    return 0xD000000000000010;
}

uint64_t sub_23C96ACDC(char *a1, char *a2)
{
  return sub_23C96AB88(*a1, *a2);
}

uint64_t sub_23C96ACE8()
{
  sub_23C976D44();
  sub_23C976B70();
  swift_bridgeObjectRelease();
  return sub_23C976D5C();
}

uint64_t sub_23C96AD74()
{
  sub_23C976B70();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23C96ADDC()
{
  sub_23C976D44();
  sub_23C976B70();
  swift_bridgeObjectRelease();
  return sub_23C976D5C();
}

uint64_t sub_23C96AE64@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23C976D20();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_23C96AEC0(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0xD000000000000010;
  if (*v1)
    v2 = 0x4D656D6147414141;
  v3 = 0x800000023C978840;
  if (*v1)
    v3 = 0xEB0000000065646FLL;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_23C96AF0C(_BYTE *a1, _BYTE *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t sub_23C96AF20(_BYTE *a1, _BYTE *a2)
{
  return *a2 & 1 | ((*a1 & 1) == 0);
}

uint64_t sub_23C96AF34(_BYTE *a1, _BYTE *a2)
{
  return *a1 & 1 | ((*a2 & 1) == 0);
}

uint64_t sub_23C96AF48(_BYTE *a1, _BYTE *a2)
{
  return *a1 & ~*a2 & 1;
}

unint64_t ModelManagerPolicyStrategy.init(rawValue:)(unint64_t a1)
{
  return sub_23C962294(a1);
}

uint64_t ModelManagerGameAssertionStatus.Config.policy.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ModelManagerGameAssertionStatus.Config.policy.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.policy.modify())()
{
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 20), a1, &qword_256BD79F0);
}

uint64_t ModelManagerGameAssertionStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 20), &qword_256BD79F0);
}

uint64_t (*ModelManagerGameAssertionStatus.Config.enablementDate.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 24), a1, &qword_256BD79F0);
}

uint64_t ModelManagerGameAssertionStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 24), &qword_256BD79F0);
}

uint64_t (*ModelManagerGameAssertionStatus.Config.disablementDate.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 28));
}

uint64_t ModelManagerGameAssertionStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.deviceSupported.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.aaaBundleIdentifiers.getter()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.Config.aaaBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.aaaBundleIdentifiers.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.impactedBundleIdentifiers.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.policyStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for ModelManagerGameAssertionStatus.Config(0) + 44));
}

uint64_t ModelManagerGameAssertionStatus.Config.policyStrategy.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  *(_QWORD *)(v1 + *(int *)(result + 44)) = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.Config.policyStrategy.modify())()
{
  type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  return nullsub_1;
}

uint64_t ModelManagerGameAssertionStatus.Config.init(policy:enablementDate:disablementDate:deviceSupported:aaaBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:policyStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _BYTE *a9@<X8>)
{
  int *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t result;

  v14 = (int *)type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  v15 = (uint64_t)&a9[v14[5]];
  v16 = sub_23C976AEC();
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  v18 = (uint64_t)&a9[v14[6]];
  v17(v18, 1, 1, v16);
  *a9 = a1;
  sub_23C963110(a2, v15, &qword_256BD79F0);
  result = sub_23C963110(a3, v18, &qword_256BD79F0);
  a9[v14[7]] = a4;
  *(_QWORD *)&a9[v14[8]] = a5;
  *(_QWORD *)&a9[v14[9]] = a6;
  *(_QWORD *)&a9[v14[10]] = a7;
  *(_QWORD *)&a9[v14[11]] = a8;
  return result;
}

uint64_t ModelManagerGameAssertionStatus.policy.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  swift_beginAccess();
  return *v1;
}

uint64_t ModelManagerGameAssertionStatus.policy.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*ModelManagerGameAssertionStatus.policy.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ModelManagerGameAssertionStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, a1, &qword_256BD79F0);
}

uint64_t ModelManagerGameAssertionStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, a1, &qword_256BD79F0);
}

uint64_t ModelManagerGameAssertionStatus.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported);
}

uint64_t ModelManagerGameAssertionStatus.aaaBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ModelManagerGameAssertionStatus.policyStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy);
}

id ModelManagerGameAssertionStatus.__allocating_init(config:)(_BYTE *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return ModelManagerGameAssertionStatus.init(config:)(a1);
}

id ModelManagerGameAssertionStatus.init(config:)(_BYTE *a1)
{
  _BYTE *v1;
  _BYTE *v3;
  char *v4;
  int *v5;
  id v6;
  objc_super v8;

  v3 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy];
  v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy] = 2;
  v4 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config];
  v5 = (int *)type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((_QWORD *)v5 - 1) + 56))(v4, 1, 1, v5);
  LOBYTE(v4) = *a1;
  swift_beginAccess();
  *v3 = (_BYTE)v4;
  sub_23C962E2C((uint64_t)&a1[v5[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], &qword_256BD79F0);
  sub_23C962E2C((uint64_t)&a1[v5[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate], &qword_256BD79F0);
  v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported] = a1[v5[7]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers] = *(_QWORD *)&a1[v5[8]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers] = *(_QWORD *)&a1[v5[9]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers] = *(_QWORD *)&a1[v5[10]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy] = *(_QWORD *)&a1[v5[11]];
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ModelManagerGameAssertionStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = objc_msgSendSuper2(&v8, sel_init);
  sub_23C96C5DC((uint64_t)a1);
  return v6;
}

uint64_t ModelManagerGameAssertionStatus.config.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD7ED8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C962E2C(v9, (uint64_t)v8, (uint64_t *)&unk_256BD7ED8);
  v10 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return sub_23C96C65C((uint64_t)v8, (uint64_t)a1);
  sub_23C964EB8((uint64_t)v8, (uint64_t *)&unk_256BD7ED8);
  sub_23C96B900(v1, a1);
  sub_23C96C618((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_23C963110((uint64_t)v6, v9, (uint64_t *)&unk_256BD7ED8);
  return swift_endAccess();
}

uint64_t sub_23C96B900@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  int *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;

  v4 = (int *)type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  v13 = sub_23C976AEC();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(v10, 1, 1, v13);
  v15 = (uint64_t)&v6[v4[5]];
  v14((char *)v15, 1, 1, v13);
  v16 = (uint64_t)&v6[v4[6]];
  v14((char *)v16, 1, 1, v13);
  *v6 = 2;
  sub_23C963110((uint64_t)v12, v15, &qword_256BD79F0);
  sub_23C963110((uint64_t)v10, v16, &qword_256BD79F0);
  v6[v4[7]] = 0;
  v17 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[8]] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[9]] = v17;
  *(_QWORD *)&v6[v4[10]] = v17;
  *(_QWORD *)&v6[v4[11]] = 0;
  sub_23C96C65C((uint64_t)v6, (uint64_t)a2);
  v18 = (_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  swift_beginAccess();
  *a2 = *v18;
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, (uint64_t)&a2[v4[5]]);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, (uint64_t)&a2[v4[6]]);
  a2[v4[7]] = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported);
  v19 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers);
  v20 = v4[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v20] = v19;
  v21 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers);
  v22 = v4[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v22] = v21;
  v23 = *(_QWORD *)(a1
                  + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers);
  v24 = v4[10];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v24] = v23;
  *(_QWORD *)&a2[v4[11]] = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy);
  return result;
}

uint64_t ModelManagerGameAssertionStatus.config.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD7ED8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C96C65C(a1, (uint64_t)v5);
  v6 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C963110((uint64_t)v5, v7, (uint64_t *)&unk_256BD7ED8);
  return swift_endAccess();
}

void (*ModelManagerGameAssertionStatus.config.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _BYTE *v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD7ED8);
  v3[7] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  v3[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[10] = malloc(v7);
  v8 = malloc(v7);
  v3[11] = v8;
  ModelManagerGameAssertionStatus.config.getter(v8);
  return sub_23C96BD18;
}

void sub_23C96BD18(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  v3 = *(void **)(*(_QWORD *)a1 + 88);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v6 = v2[9];
    v8 = v2[6];
    v7 = (void *)v2[7];
    sub_23C96C618(v2[11], v2[10]);
    sub_23C96C65C((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    v9 = v8 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v9, (uint64_t *)&unk_256BD7ED8);
    swift_endAccess();
    sub_23C96C5DC((uint64_t)v3);
  }
  else
  {
    v10 = v2[8];
    v11 = v2[9];
    v12 = v2[6];
    v7 = (void *)v2[7];
    sub_23C96C65C(v2[11], (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v13 = v12 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v13, (uint64_t *)&unk_256BD7ED8);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static ModelManagerGameAssertionStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall ModelManagerGameAssertionStatus.encode(with:)(NSCoder with)
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
  char *v14;
  uint64_t v15;
  char *v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  void *v21;
  void *v22;
  __objc2_class_ro *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v36 - v8;
  v10 = sub_23C976AEC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v36 - v15;
  v17 = (_BYTE *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy);
  swift_beginAccess();
  if (*v17 != 2)
  {
    v18 = (void *)sub_23C976B34();
    swift_bridgeObjectRelease();
    v19 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v18, v19);

  }
  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, (uint64_t)v9, &qword_256BD79F0);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v20(v9, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v9, &qword_256BD79F0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    v21 = (void *)sub_23C976AE0();
    v22 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v21, v22);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, (uint64_t)v7, &qword_256BD79F0);
  if (v20(v7, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v7, &qword_256BD79F0);
    v23 = &GameModeCCUIStatusInfo;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v7, v10);
    v24 = (void *)sub_23C976AE0();
    v25 = (void *)sub_23C976B34();
    v23 = &GameModeCCUIStatusInfo;
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v24, v25);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  v26 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported);
  v27 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v26, v27);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers));
  sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  v28 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_23C976B34();
  objc_msgSend(with.super.isa, *(SEL *)&v23[56].flags, v28, v29);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers));
  v30 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v31 = (void *)sub_23C976B34();
  objc_msgSend(with.super.isa, *(SEL *)&v23[56].flags, v30, v31);

  sub_23C963894(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers));
  v32 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v33 = (void *)sub_23C976B34();
  objc_msgSend(with.super.isa, *(SEL *)&v23[56].flags, v32, v33);

  v34 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy);
  v35 = (void *)sub_23C976B34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v34, v35);

}

id ModelManagerGameAssertionStatus.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23C96C6A0(a1);

  return v4;
}

id ModelManagerGameAssertionStatus.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_23C96C6A0(a1);

  return v2;
}

id ModelManagerGameAssertionStatus.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ModelManagerGameAssertionStatus.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ModelManagerGameAssertionStatus.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelManagerGameAssertionStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ModelManagerGameAssertionStatus.Config(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD7F98);
}

uint64_t type metadata accessor for ModelManagerGameAssertionStatus(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD7F20);
}

uint64_t sub_23C96C5DC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23C96C618(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C96C65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_23C96C6A0(void *a1)
{
  _BYTE *v1;
  uint64_t v3;
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
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  char v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  __objc2_class_ro *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void (*v37)(char *, uint64_t, uint64_t);
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  void *v42;
  unsigned __int8 v43;
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
  void *v56;
  id v57;
  id v58;
  objc_class *v59;
  uint64_t v61;
  char *v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v67;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  *(_QWORD *)&v63 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v61 - v6;
  v8 = sub_23C976AEC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v62 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v61 - v12;
  v14 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy];
  v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policy] = 2;
  v15 = &v1[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config];
  v16 = type metadata accessor for ModelManagerGameAssertionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  v18 = v1;
  v19 = sub_23C976C3C();
  if (v19 && (v20 = (void *)v19, v64 = 0, v65 = 0, sub_23C976B40(), v20, v65))
  {
    v21 = sub_23C976D20();
    swift_bridgeObjectRelease();
    if (v21 == 1)
      v22 = 1;
    else
      v22 = 2;
    if (v21)
      v23 = v22;
    else
      v23 = 0;
  }
  else
  {
    v23 = 2;
  }
  swift_beginAccess();
  *v14 = v23;
  v24 = (void *)sub_23C976B34();
  v25 = objc_msgSend(a1, sel_containsValueForKey_, v24);

  if ((v25 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_23C977B90;
    *(_QWORD *)(v26 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
    sub_23C976C48();
    swift_bridgeObjectRelease();
    if (v66)
    {
      v27 = swift_dynamicCast();
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      v28(v7, v27 ^ 1u, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        v29 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
        v29(v13, v7, v8);
        v30 = &v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate];
        v29(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], v13, v8);
        v28(v30, 0, 1, v8);
        v31 = &GameModeCCUIStatusInfo;
        goto LABEL_17;
      }
    }
    else
    {
      sub_23C964EB8((uint64_t)&v64, (uint64_t *)&unk_256BD83B0);
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      v28(v7, 1, 1, v8);
    }
    v31 = &GameModeCCUIStatusInfo;
    sub_23C964EB8((uint64_t)v7, &qword_256BD79F0);
    v28(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], 1, 1, v8);
  }
  else
  {
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v31 = &GameModeCCUIStatusInfo;
    v28(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate], 1, 1, v8);
  }
LABEL_17:
  v32 = (void *)sub_23C976B34();
  v33 = objc_msgSend(a1, v31[56].name, v32);

  if (!v33)
  {
LABEL_23:
    v40 = &v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate];
    v41 = 1;
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v34 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v66)
  {
    sub_23C964EB8((uint64_t)&v64, (uint64_t *)&unk_256BD83B0);
    v35 = v63;
    v28((char *)v63, 1, 1, v8);
    goto LABEL_22;
  }
  v35 = v63;
  v36 = swift_dynamicCast();
  v28((char *)v35, v36 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v35, 1, v8) == 1)
  {
LABEL_22:
    sub_23C964EB8(v35, &qword_256BD79F0);
    goto LABEL_23;
  }
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  v38 = v62;
  v37(v62, v35, v8);
  v39 = &v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate];
  v37(&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate], (uint64_t)v38, v8);
  v40 = v39;
  v41 = 0;
LABEL_24:
  v28(v40, v41, 1, v8);
  v42 = (void *)sub_23C976B34();
  v43 = objc_msgSend(a1, sel_decodeBoolForKey_, v42);

  v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_deviceSupported] = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v44 = swift_allocObject();
  v63 = xmmword_23C977B90;
  *(_OWORD *)(v44 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v44 + 32) = v17;
  v45 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v46 = MEMORY[0x24BEE4AF8];
  if (v45)
  {
    v47 = sub_23C9674F8(v45);
    swift_bridgeObjectRelease();
    if (v47)
      v46 = v47;
  }
  *(_QWORD *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_aaaBundleIdentifiers] = v46;
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = v63;
  *(_QWORD *)(v48 + 32) = v17;
  v49 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v50 = MEMORY[0x24BEE4AF8];
  if (v49)
  {
    v51 = sub_23C9674F8(v49);
    swift_bridgeObjectRelease();
    if (v51)
      v50 = v51;
  }
  *(_QWORD *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_impactedBundleIdentifiers] = v50;
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = v63;
  *(_QWORD *)(v52 + 32) = v17;
  v53 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v54 = MEMORY[0x24BEE4AF8];
  if (v53)
  {
    v55 = sub_23C9674F8(v53);
    swift_bridgeObjectRelease();
    if (v55)
      v54 = v55;
  }
  *(_QWORD *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_previouslyImpactedBundleIdentifiers] = v54;
  v56 = (void *)sub_23C976B34();
  v57 = objc_msgSend(a1, sel_decodeIntegerForKey_, v56);

  if ((unint64_t)v57 >= 4)
    v58 = 0;
  else
    v58 = v57;
  *(_QWORD *)&v18[OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_policyStrategy] = v58;

  v59 = (objc_class *)type metadata accessor for ModelManagerGameAssertionStatus(0);
  v67.receiver = v18;
  v67.super_class = v59;
  return objc_msgSendSuper2(&v67, sel_init);
}

unint64_t sub_23C96CE70()
{
  unint64_t result;

  result = qword_256BD7EE8;
  if (!qword_256BD7EE8)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for ModelManagerGameAssertionPolicy, &type metadata for ModelManagerGameAssertionPolicy);
    atomic_store(result, (unint64_t *)&qword_256BD7EE8);
  }
  return result;
}

unint64_t sub_23C96CEB8()
{
  unint64_t result;

  result = qword_256BD7EF0;
  if (!qword_256BD7EF0)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for ModelManagerPolicyStrategy, &type metadata for ModelManagerPolicyStrategy);
    atomic_store(result, (unint64_t *)&qword_256BD7EF0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ModelManagerGameAssertionPolicy(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ModelManagerGameAssertionPolicy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23C96CFD8 + 4 * byte_23C97806F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23C96D00C + 4 * byte_23C97806A[v4]))();
}

uint64_t sub_23C96D00C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C96D014(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23C96D01CLL);
  return result;
}

uint64_t sub_23C96D028(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23C96D030);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23C96D034(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23C96D03C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23C96D048(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ModelManagerGameAssertionPolicy()
{
  return &type metadata for ModelManagerGameAssertionPolicy;
}

ValueMetadata *type metadata accessor for ModelManagerPolicyStrategy()
{
  return &type metadata for ModelManagerPolicyStrategy;
}

uint64_t sub_23C96D074()
{
  return type metadata accessor for ModelManagerGameAssertionStatus(0);
}

void sub_23C96D07C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_23C964330(319, &qword_256BD7F38, (void (*)(uint64_t))type metadata accessor for ModelManagerGameAssertionStatus.Config);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for ModelManagerGameAssertionStatus.Config(char *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_23C976AEC();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = a3[6];
    v16 = (char *)v4 + v15;
    v17 = &a2[v15];
    if (v12(&a2[v15], 1, v10))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    v19 = a3[8];
    *((_BYTE *)v4 + a3[7]) = a2[a3[7]];
    *(_QWORD *)((char *)v4 + v19) = *(_QWORD *)&a2[v19];
    v20 = a3[10];
    *(_QWORD *)((char *)v4 + a3[9]) = *(_QWORD *)&a2[a3[9]];
    *(_QWORD *)((char *)v4 + v20) = *(_QWORD *)&a2[v20];
    *(_QWORD *)((char *)v4 + a3[11]) = *(_QWORD *)&a2[a3[11]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ModelManagerGameAssertionStatus.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23C976AEC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for ModelManagerGameAssertionStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *assignWithCopy for ModelManagerGameAssertionStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  return a1;
}

_BYTE *initializeWithTake for ModelManagerGameAssertionStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  return a1;
}

_BYTE *assignWithTake for ModelManagerGameAssertionStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v21] = *(_QWORD *)&a2[v21];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelManagerGameAssertionStatus.Config()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C96DB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelManagerGameAssertionStatus.Config()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C96DBA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  return result;
}

void sub_23C96DC28()
{
  unint64_t v0;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

Swift::String *kGamePolicyDaemonEntitlement.unsafeMutableAddressor()
{
  return &kGamePolicyDaemonEntitlement;
}

Swift::String *kGamePolicyMenuExtraBundleID.unsafeMutableAddressor()
{
  return &kGamePolicyMenuExtraBundleID;
}

Swift::String *kGamePolicyMenuExtraInstallPath.unsafeMutableAddressor()
{
  return &kGamePolicyMenuExtraInstallPath;
}

unint64_t ConsoleModeEnablementReason.init(rawValue:)(unint64_t a1)
{
  return sub_23C96F324(a1);
}

unint64_t sub_23C96DD18@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23C96F324(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t GamePolicyAgentUpdate.userIdentifiedGames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAgentUpdate.consoleModeSignalingGames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAgentUpdate.consoleModeUserDisabledGames.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GamePolicyAgentUpdate.consoleModeEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled);
}

uint64_t GamePolicyAgentUpdate.consoleModePausedByUser.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser);
}

id GamePolicyAgentUpdate.__allocating_init(userIdentifiedGames:consoleModeSignalingGames:consoleModeUserDisabledGames:consoleModeEnabled:consoleModePausedByUser:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  objc_class *v5;
  _BYTE *v11;
  objc_super v13;

  v11 = objc_allocWithZone(v5);
  *(_QWORD *)&v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_userIdentifiedGames] = a1;
  *(_QWORD *)&v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeSignalingGames] = a2;
  *(_QWORD *)&v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeUserDisabledGames] = a3;
  v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled] = a4;
  v11[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser] = a5;
  v13.receiver = v11;
  v13.super_class = v5;
  return objc_msgSendSuper2(&v13, sel_init);
}

id GamePolicyAgentUpdate.init(userIdentifiedGames:consoleModeSignalingGames:consoleModeUserDisabledGames:consoleModeEnabled:consoleModePausedByUser:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  _BYTE *v5;
  objc_super v7;

  *(_QWORD *)&v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_userIdentifiedGames] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeSignalingGames] = a2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeUserDisabledGames] = a3;
  v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled] = a4;
  v5[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser] = a5;
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for GamePolicyAgentUpdate();
  return objc_msgSendSuper2(&v7, sel_init);
}

id static GamePolicyAgentUpdate.emptyUpdate.getter()
{
  objc_class *v0;
  _BYTE *v1;
  uint64_t v2;
  objc_super v4;

  v0 = (objc_class *)type metadata accessor for GamePolicyAgentUpdate();
  v1 = objc_allocWithZone(v0);
  v2 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_userIdentifiedGames] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeSignalingGames] = v2;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeUserDisabledGames] = v2;
  v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModeEnabled] = 0;
  v1[OBJC_IVAR____TtC10GamePolicy21GamePolicyAgentUpdate_consoleModePausedByUser] = 0;
  v4.receiver = v1;
  v4.super_class = v0;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t GamePolicyAgentUpdate.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23C976CA8();
  sub_23C976B88();
  v0 = type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  v1 = swift_bridgeObjectRetain();
  MEMORY[0x242626AB0](v1, v0);
  sub_23C976B88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  v2 = swift_bridgeObjectRetain();
  MEMORY[0x242626AB0](v2, v0);
  sub_23C976B88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  return 0;
}

char *GamePolicyAgentUpdate.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GamePolicyAgentUpdate.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static GamePolicyAgentUpdate.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static GamePolicyAgentUpdate.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GamePolicyAgentUpdate.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall GamePolicyAgentUpdate.encode(with:)(NSCoder with)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  v2 = (void *)sub_23C976BF4();
  v3 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v2, v3);

  v4 = (void *)sub_23C976BF4();
  v5 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v4, v5);

  v6 = (void *)sub_23C976BF4();
  v7 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v6, v7);

  sub_23C964E80(0, &qword_256BD7C40);
  v8 = (void *)sub_23C976C6C();
  v9 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v8, v9);

  v10 = (void *)sub_23C976C6C();
  v11 = (id)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v10, v11);

}

uint64_t GamePolicyAgentUpdate.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GamePolicyAgentUpdate.init(coder:)(a1);
}

uint64_t GamePolicyAgentUpdate.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  id v5;
  id v7;
  _QWORD v8[4];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23C9782A0;
  *(_QWORD *)(v4 + 32) = type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  *(_QWORD *)(v4 + 40) = sub_23C964E80(0, (unint64_t *)&unk_256BD8020);
  v5 = v2;
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (v8[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v8[0] = 0;
      sub_23C976C00();

    }
  }
  else
  {

    sub_23C96F374((uint64_t)v8);
  }
  type metadata accessor for GamePolicyAgentUpdate();
  swift_deallocPartialClassInstance();
  return 0;
}

BOOL static GamePolicyAgentUpdate.GameEvent.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date), sel_compare_, *(_QWORD *)(a2 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date)) == (id)-1;
}

id GamePolicyAgentUpdate.GameEvent.auditTokenNSValue.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue);
}

id GamePolicyAgentUpdate.GameEvent.date.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
}

id GamePolicyAgentUpdate.GameEvent.__allocating_init(auditTokenNSValue:date:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue] = a1;
  *(_QWORD *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id GamePolicyAgentUpdate.GameEvent.init(auditTokenNSValue:date:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue] = a1;
  *(_QWORD *)&v2[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t GamePolicyAgentUpdate.GameEvent.description.getter()
{
  uint64_t v0;
  id v1;
  id v2;
  _OWORD v4[2];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v4[0] = 0;
  *((_QWORD *)&v4[0] + 1) = 0xE000000000000000;
  sub_23C976CA8();
  v5 = v4[0];
  sub_23C976B88();
  memset(v4, 0, sizeof(v4));
  objc_msgSend(*(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue), sel_getValue_size_, v4, 32);
  type metadata accessor for audit_token_t();
  sub_23C976D08();
  sub_23C976B88();
  v1 = *(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
  v2 = objc_msgSend(v1, sel_description);
  sub_23C976B4C();

  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  return v5;
}

uint64_t GamePolicyAgentUpdate.GameEvent.auditToken.getter()
{
  uint64_t v0;
  _OWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  memset(v2, 0, sizeof(v2));
  objc_msgSend(*(id *)(v0 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue), sel_getValue_size_, v2, 32);
  return *(_QWORD *)&v2[0];
}

char *GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.unsafeMutableAddressor()
{
  return &static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.getter()
{
  swift_beginAccess();
  return static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding;
}

uint64_t static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Void __swiftcall GamePolicyAgentUpdate.GameEvent.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date);
  v4 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

  v5 = *(_QWORD *)(v1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue);
  v6 = (id)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v5, v6);

}

id GamePolicyAgentUpdate.GameEvent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GamePolicyAgentUpdate.GameEvent.init(coder:)(a1);
}

id GamePolicyAgentUpdate.GameEvent.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v4 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
  v5 = v2;
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v14)
  {

    sub_23C96F374((uint64_t)v13);
LABEL_11:
    type metadata accessor for GamePolicyAgentUpdate.GameEvent();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_11;
  }
  v6 = OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date;
  *(_QWORD *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date] = v12;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v7 + 32) = sub_23C964E80(0, &qword_256BD8048);
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v14)
  {

    sub_23C96F374((uint64_t)v13);
LABEL_10:
    v9 = *(void **)&v5[v6];

    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_10;
  }
  *(_QWORD *)&v5[OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_auditTokenNSValue] = v12;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for GamePolicyAgentUpdate.GameEvent();
  v8 = objc_msgSendSuper2(&v11, sel_init);

  return v8;
}

id GamePolicyAgentUpdate.GameEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void GamePolicyAgentUpdate.GameEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GamePolicyAgentUpdate.GameEvent.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAgentUpdate.GameEvent);
}

BOOL sub_23C96F230(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a1 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date), sel_compare_, *(_QWORD *)(*a2 + OBJC_IVAR_____GamePolicyAgentUpdateGameEvent_date)) == (id)-1;
}

void GamePolicyAgentUpdate.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GamePolicyAgentUpdate.__deallocating_deinit()
{
  return sub_23C967414(type metadata accessor for GamePolicyAgentUpdate);
}

unint64_t sub_23C96F324(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

uint64_t type metadata accessor for GamePolicyAgentUpdate()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for GamePolicyAgentUpdate.GameEvent()
{
  return objc_opt_self();
}

uint64_t sub_23C96F374(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD83B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23C96F3B8()
{
  unint64_t result;

  result = qword_256BD8050;
  if (!qword_256BD8050)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for ConsoleModeEnablementReason, &type metadata for ConsoleModeEnablementReason);
    atomic_store(result, (unint64_t *)&qword_256BD8050);
  }
  return result;
}

unint64_t sub_23C96F400()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256BD8058;
  if (!qword_256BD8058)
  {
    v1 = type metadata accessor for GamePolicyAgentUpdate.GameEvent();
    result = MEMORY[0x242626F00](MEMORY[0x24BEE5BE0], v1);
    atomic_store(result, (unint64_t *)&qword_256BD8058);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConsoleModeEnablementReason()
{
  return &type metadata for ConsoleModeEnablementReason;
}

uint64_t static ConsoleModeLimitation.supportsSecureCoding.getter()
{
  return 1;
}

id ConsoleModeLimitation.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;

  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeLimitation.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeLimitation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ConsoleModeLimitation.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeLimitation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ConsoleModeLimitation()
{
  return objc_opt_self();
}

unint64_t ConsoleModeLimitation.description.getter()
{
  return 0xD000000000000017;
}

id ConsoleModeLimitation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeLimitation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23C96F678()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.daemon);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.daemon);
  return sub_23C976AF8();
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7950, (uint64_t)static Logger.daemon, a1);
}

uint64_t sub_23C96F704()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.policyCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.policyCoordinator);
  return sub_23C976AF8();
}

uint64_t Logger.policyCoordinator.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7958, (uint64_t)static Logger.policyCoordinator);
}

uint64_t static Logger.policyCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7958, (uint64_t)static Logger.policyCoordinator, a1);
}

uint64_t sub_23C96F7AC()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.agentCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.agentCoordinator);
  return sub_23C976AF8();
}

uint64_t Logger.agentCoordinator.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7960, (uint64_t)static Logger.agentCoordinator);
}

uint64_t static Logger.agentCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7960, (uint64_t)static Logger.agentCoordinator, a1);
}

uint64_t sub_23C96F854()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.appCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.appCoordinator);
  return sub_23C976AF8();
}

uint64_t Logger.appCoordinator.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7968, (uint64_t)static Logger.appCoordinator);
}

uint64_t static Logger.appCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7968, (uint64_t)static Logger.appCoordinator, a1);
}

uint64_t sub_23C96F8F8()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.toolCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.toolCoordinator);
  return sub_23C976AF8();
}

uint64_t Logger.toolCoordinator.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7970, (uint64_t)static Logger.toolCoordinator);
}

uint64_t static Logger.toolCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7970, (uint64_t)static Logger.toolCoordinator, a1);
}

uint64_t sub_23C96F99C()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.agent);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.agent);
  return sub_23C976AF8();
}

uint64_t Logger.agent.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7978, (uint64_t)static Logger.agent);
}

uint64_t static Logger.agent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7978, (uint64_t)static Logger.agent, a1);
}

uint64_t sub_23C96FA44()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.tool);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.tool);
  return sub_23C976AF8();
}

uint64_t Logger.tool.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7980, (uint64_t)static Logger.tool);
}

uint64_t static Logger.tool.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7980, (uint64_t)static Logger.tool, a1);
}

uint64_t sub_23C96FAE8()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.common);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  return sub_23C976AF8();
}

uint64_t Logger.common.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7988, (uint64_t)static Logger.common);
}

uint64_t static Logger.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7988, (uint64_t)static Logger.common, a1);
}

uint64_t sub_23C96FB90()
{
  uint64_t v0;

  v0 = sub_23C976B04();
  __swift_allocate_value_buffer(v0, static Logger.assets);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.assets);
  return sub_23C976AF8();
}

uint64_t Logger.assets.unsafeMutableAddressor()
{
  return sub_23C961168(&qword_256BD7990, (uint64_t)static Logger.assets);
}

uint64_t static Logger.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23C96FC38(&qword_256BD7990, (uint64_t)static Logger.assets, a1);
}

uint64_t sub_23C96FC38@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23C976B04();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_23C96FCA0()
{
  uint64_t result;

  sub_23C96FD88();
  result = sub_23C976C78();
  static Logger.stateTracking = result;
  return result;
}

uint64_t *Logger.stateTracking.unsafeMutableAddressor()
{
  if (qword_256BD7998 != -1)
    swift_once();
  return &static Logger.stateTracking;
}

id static Logger.stateTracking.getter()
{
  if (qword_256BD7998 != -1)
    swift_once();
  return (id)static Logger.stateTracking;
}

unint64_t sub_23C96FD88()
{
  unint64_t result;

  result = qword_256BD80D8;
  if (!qword_256BD80D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256BD80D8);
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

Swift::String *kGamePolicyToolEntitlement.unsafeMutableAddressor()
{
  return &kGamePolicyToolEntitlement;
}

Swift::String *kGamePolicyPrivilegedToolEntitlement.unsafeMutableAddressor()
{
  return &kGamePolicyPrivilegedToolEntitlement;
}

NSXPCInterface __swiftcall GamePolicyToolServerInterface()()
{
  return (NSXPCInterface)sub_23C962400(&protocolRef__TtP10GamePolicy20GamePolicyToolServer_);
}

NSXPCInterface __swiftcall GamePolicyToolClientInterface()()
{
  return (NSXPCInterface)sub_23C962400(&protocolRef__TtP10GamePolicy20GamePolicyToolClient_);
}

NSXPCInterface __swiftcall GamePolicyPrivilegedToolServerInterface()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSXPCInterface result;

  objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256BDB7E0);
  sub_23C964E80(0, &qword_256BD80E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD80E8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23C978410;
  v1 = type metadata accessor for DynamicSplitterStatus(0);
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD80F0);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = sub_23C964E80(0, (unint64_t *)&unk_256BD8020);
  *(_QWORD *)(v0 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD80F8);
  *(_QWORD *)(v0 + 64) = v2;
  v3 = sub_23C964E80(0, &qword_256BD7C40);
  *(_QWORD *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8100);
  *(_QWORD *)(v0 + 96) = v3;
  v4 = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  *(_QWORD *)(v0 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8108);
  *(_QWORD *)(v0 + 128) = v4;
  v5 = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
  *(_QWORD *)(v0 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8110);
  *(_QWORD *)(v0 + 160) = v5;
  MEMORY[0x242626AD4](v0);
  result.super.isa = (Class)sub_23C976C24();
  __break(1u);
  return result;
}

NSXPCInterface __swiftcall GamePolicyPrivilegedToolClientInterface()()
{
  return (NSXPCInterface)sub_23C962400(&protocolRef__TtP10GamePolicy30GamePolicyPrivilegedToolClient_);
}

uint64_t SustainedExecutionStatus.Config.enabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t SustainedExecutionStatus.Config.enabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.enabled.modify())()
{
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 20), a1, &qword_256BD79F0);
}

uint64_t type metadata accessor for SustainedExecutionStatus.Config(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD81D8);
}

uint64_t SustainedExecutionStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 20), &qword_256BD79F0);
}

uint64_t (*SustainedExecutionStatus.Config.enablementDate.modify())()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 24), a1, &qword_256BD79F0);
}

uint64_t SustainedExecutionStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SustainedExecutionStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 24), &qword_256BD79F0);
}

uint64_t (*SustainedExecutionStatus.Config.disablementDate.modify())()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 28));
}

uint64_t SustainedExecutionStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SustainedExecutionStatus.Config(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.deviceSupported.modify())()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.impactedBundleIdentifiers.modify())()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.enablementStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SustainedExecutionStatus.Config(0) + 40));
}

uint64_t SustainedExecutionStatus.Config.enablementStrategy.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SustainedExecutionStatus.Config(0);
  *(_QWORD *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*SustainedExecutionStatus.Config.enablementStrategy.modify())()
{
  type metadata accessor for SustainedExecutionStatus.Config(0);
  return nullsub_1;
}

uint64_t SustainedExecutionStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _BYTE *a8@<X8>)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t result;

  v13 = (int *)type metadata accessor for SustainedExecutionStatus.Config(0);
  v14 = (uint64_t)&a8[v13[5]];
  v15 = sub_23C976AEC();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v14, 1, 1, v15);
  v17 = (uint64_t)&a8[v13[6]];
  v16(v17, 1, 1, v15);
  *a8 = a1;
  sub_23C963110(a2, v14, &qword_256BD79F0);
  result = sub_23C963110(a3, v17, &qword_256BD79F0);
  a8[v13[7]] = a4;
  *(_QWORD *)&a8[v13[8]] = a5;
  *(_QWORD *)&a8[v13[9]] = a6;
  *(_QWORD *)&a8[v13[10]] = a7;
  return result;
}

uint64_t SustainedExecutionStatus.enabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled);
}

uint64_t SustainedExecutionStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, a1, &qword_256BD79F0);
}

uint64_t SustainedExecutionStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, a1, &qword_256BD79F0);
}

uint64_t SustainedExecutionStatus.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported);
}

uint64_t SustainedExecutionStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SustainedExecutionStatus.enablementStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy);
}

id SustainedExecutionStatus.__allocating_init(config:)(_BYTE *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SustainedExecutionStatus.init(config:)(a1);
}

id SustainedExecutionStatus.init(config:)(_BYTE *a1)
{
  _BYTE *v1;
  char *v3;
  int *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config];
  v4 = (int *)type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((_QWORD *)v4 - 1) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled] = *a1;
  sub_23C962E2C((uint64_t)&a1[v4[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate], &qword_256BD79F0);
  sub_23C962E2C((uint64_t)&a1[v4[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate], &qword_256BD79F0);
  v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported] = a1[v4[7]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers] = *(_QWORD *)&a1[v4[8]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers] = *(_QWORD *)&a1[v4[9]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy] = *(_QWORD *)&a1[v4[10]];
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for SustainedExecutionStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_23C9706E8((uint64_t)a1);
  return v5;
}

uint64_t type metadata accessor for SustainedExecutionStatus(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD8160);
}

uint64_t sub_23C9706E8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SustainedExecutionStatus.config.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD8128);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C962E2C(v9, (uint64_t)v8, (uint64_t *)&unk_256BD8128);
  v10 = type metadata accessor for SustainedExecutionStatus.Config(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return sub_23C970B34((uint64_t)v8, (uint64_t)a1);
  sub_23C964EB8((uint64_t)v8, (uint64_t *)&unk_256BD8128);
  sub_23C970894(v1, a1);
  sub_23C970AF0((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_23C963110((uint64_t)v6, v9, (uint64_t *)&unk_256BD8128);
  return swift_endAccess();
}

uint64_t sub_23C970894@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  int *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;

  v4 = (int *)type metadata accessor for SustainedExecutionStatus.Config(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v23 - v11;
  v13 = sub_23C976AEC();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(v10, 1, 1, v13);
  v15 = (uint64_t)&v6[v4[5]];
  v14((char *)v15, 1, 1, v13);
  v16 = (uint64_t)&v6[v4[6]];
  v14((char *)v16, 1, 1, v13);
  *v6 = 0;
  sub_23C963110((uint64_t)v12, v15, &qword_256BD79F0);
  sub_23C963110((uint64_t)v10, v16, &qword_256BD79F0);
  v6[v4[7]] = 0;
  v17 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[8]] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[9]] = v17;
  *(_QWORD *)&v6[v4[10]] = 0;
  sub_23C970B34((uint64_t)v6, (uint64_t)a2);
  *a2 = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, (uint64_t)&a2[v4[5]]);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, (uint64_t)&a2[v4[6]]);
  a2[v4[7]] = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported);
  v18 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers);
  v19 = v4[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v19] = v18;
  v20 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers);
  v21 = v4[9];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v21] = v20;
  *(_QWORD *)&a2[v4[10]] = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy);
  return result;
}

uint64_t sub_23C970AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C970B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SustainedExecutionStatus.config.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD8128);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C970B34(a1, (uint64_t)v5);
  v6 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C963110((uint64_t)v5, v7, (uint64_t *)&unk_256BD8128);
  return swift_endAccess();
}

void (*SustainedExecutionStatus.config.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _BYTE *v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD8128);
  v3[7] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = type metadata accessor for SustainedExecutionStatus.Config(0);
  v3[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[10] = malloc(v7);
  v8 = malloc(v7);
  v3[11] = v8;
  SustainedExecutionStatus.config.getter(v8);
  return sub_23C970CE4;
}

void sub_23C970CE4(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  v3 = *(void **)(*(_QWORD *)a1 + 88);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v6 = v2[9];
    v8 = v2[6];
    v7 = (void *)v2[7];
    sub_23C970AF0(v2[11], v2[10]);
    sub_23C970B34((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    v9 = v8 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v9, (uint64_t *)&unk_256BD8128);
    swift_endAccess();
    sub_23C9706E8((uint64_t)v3);
  }
  else
  {
    v10 = v2[8];
    v11 = v2[9];
    v12 = v2[6];
    v7 = (void *)v2[7];
    sub_23C970B34(v2[11], (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v13 = v12 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v13, (uint64_t *)&unk_256BD8128);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static SustainedExecutionStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall SustainedExecutionStatus.encode(with:)(NSCoder with)
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
  char *v15;
  uint64_t v16;
  void *v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v32 - v8;
  v10 = sub_23C976AEC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v33 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - v14;
  v16 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled);
  v17 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v16, v17);

  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, (uint64_t)v9, &qword_256BD79F0);
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v18(v9, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v9, &qword_256BD79F0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v9, v10);
    v19 = (void *)sub_23C976AE0();
    v20 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v19, v20);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, (uint64_t)v7, &qword_256BD79F0);
  if (v18(v7, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v7, &qword_256BD79F0);
  }
  else
  {
    v21 = v33;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v33, v7, v10);
    v22 = (void *)sub_23C976AE0();
    v23 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v22, v23);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v10);
  }
  v24 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported);
  v25 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v24, v25);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers));
  sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  v26 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v27 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v26, v27);

  sub_23C963894(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers));
  v28 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v28, v29);

  v30 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy);
  v31 = (void *)sub_23C976B34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v30, v31);

}

id SustainedExecutionStatus.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23C971494(a1);

  return v4;
}

id SustainedExecutionStatus.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_23C971494(a1);

  return v2;
}

id SustainedExecutionStatus.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SustainedExecutionStatus.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SustainedExecutionStatus.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SustainedExecutionStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C971494(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  __objc2_class_ro *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  int v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  __objc2_class_ro *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  __objc2_class_ro *v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  objc_class *v53;
  __int128 v55;
  _BYTE v56[24];
  uint64_t v57;
  objc_super v58;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v56[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v56[-v7 - 16];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)&v55 = &v56[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v56[-v13 - 16];
  v15 = &v1[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config];
  v16 = type metadata accessor for SustainedExecutionStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = v1;
  v18 = (void *)sub_23C976B34();
  v19 = &GameModeCCUIStatusInfo;
  v20 = objc_msgSend(a1, sel_decodeBoolForKey_, v18);

  v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enabled] = v20;
  v21 = (void *)sub_23C976B34();
  v22 = objc_msgSend(a1, sel_containsValueForKey_, v21);

  if ((v22 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_23C977B90;
    *(_QWORD *)(v23 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
    sub_23C976C48();
    swift_bridgeObjectRelease();
    if (v57)
    {
      v24 = swift_dynamicCast();
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v25(v8, v24 ^ 1u, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
      {
        v26 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v26(v14, v8, v9);
        v27 = &v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate];
        v26(&v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate], v14, v9);
        v19 = &GameModeCCUIStatusInfo;
        v25(v27, 0, 1, v9);
        v28 = &GameModeCCUIStatusInfo;
        goto LABEL_9;
      }
    }
    else
    {
      sub_23C964EB8((uint64_t)v56, (uint64_t *)&unk_256BD83B0);
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v25(v8, 1, 1, v9);
    }
    sub_23C964EB8((uint64_t)v8, &qword_256BD79F0);
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  }
  v28 = &GameModeCCUIStatusInfo;
  v25(&v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate], 1, 1, v9);
LABEL_9:
  v29 = (void *)sub_23C976B34();
  v30 = objc_msgSend(a1, v28[56].name, v29);

  if (!v30)
  {
LABEL_15:
    v37 = &v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate];
    v38 = 1;
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v31 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
  sub_23C976C48();
  swift_bridgeObjectRelease();
  if (!v57)
  {
    sub_23C964EB8((uint64_t)v56, (uint64_t *)&unk_256BD83B0);
    v25(v6, 1, 1, v9);
    goto LABEL_14;
  }
  v32 = swift_dynamicCast();
  v25(v6, v32 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
LABEL_14:
    sub_23C964EB8((uint64_t)v6, &qword_256BD79F0);
    goto LABEL_15;
  }
  v33 = v19;
  v34 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v35 = (char *)v55;
  v34((char *)v55, v6, v9);
  v36 = &v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate];
  v34(&v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate], v35, v9);
  v19 = v33;
  v37 = v36;
  v38 = 0;
LABEL_16:
  v25(v37, v38, 1, v9);
  v39 = (void *)sub_23C976B34();
  v40 = objc_msgSend(a1, (SEL)v19[56].ivar_lyt, v39);

  v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_deviceSupported] = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v41 = swift_allocObject();
  v55 = xmmword_23C977B90;
  *(_OWORD *)(v41 + 16) = xmmword_23C977B90;
  v42 = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  *(_QWORD *)(v41 + 32) = v42;
  v43 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v44 = MEMORY[0x24BEE4AF8];
  if (v43)
  {
    v45 = sub_23C9674F8(v43);
    swift_bridgeObjectRelease();
    if (v45)
      v44 = v45;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_impactedBundleIdentifiers] = v44;
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = v55;
  *(_QWORD *)(v46 + 32) = v42;
  v47 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v48 = MEMORY[0x24BEE4AF8];
  if (v47)
  {
    v49 = sub_23C9674F8(v47);
    swift_bridgeObjectRelease();
    if (v49)
      v48 = v49;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_previouslyImpactedBundleIdentifiers] = v48;
  v50 = (void *)sub_23C976B34();
  v51 = objc_msgSend(a1, sel_decodeIntegerForKey_, v50);

  v52 = v51 == (id)1;
  if (v51 == (id)2)
    v52 = 2;
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementStrategy] = v52;

  v53 = (objc_class *)type metadata accessor for SustainedExecutionStatus(0);
  v58.receiver = v17;
  v58.super_class = v53;
  return objc_msgSendSuper2(&v58, sel_init);
}

uint64_t sub_23C971B78()
{
  return type metadata accessor for SustainedExecutionStatus(0);
}

void sub_23C971B80()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_23C964330(319, &qword_256BD8178, (void (*)(uint64_t))type metadata accessor for SustainedExecutionStatus.Config);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t getEnumTagSinglePayload for SustainedExecutionStatus.Config()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C971C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SustainedExecutionStatus.Config()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C971CEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  return result;
}

void sub_23C971D6C()
{
  unint64_t v0;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t static ConsoleModeGrant.supportsSecureCoding.getter()
{
  return 1;
}

id ConsoleModeGrant.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;

  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeGrant.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id ConsoleModeGrant.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ConsoleModeGrant.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeGrant();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ConsoleModeGrant()
{
  return objc_opt_self();
}

unint64_t ConsoleModeGrant.description.getter()
{
  return 0xD000000000000012;
}

id ConsoleModeGrant.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConsoleModeGrant();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static IdentifiedGameGrant.supportsSecureCoding.getter()
{
  return 1;
}

id IdentifiedGameGrant.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  objc_super v5;

  v5.receiver = objc_allocWithZone(v1);
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id IdentifiedGameGrant.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  v3 = objc_msgSendSuper2(&v5, sel_init);

  return v3;
}

id IdentifiedGameGrant.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id IdentifiedGameGrant.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifiedGameGrant();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for IdentifiedGameGrant()
{
  return objc_opt_self();
}

unint64_t IdentifiedGameGrant.description.getter()
{
  return 0xD000000000000015;
}

id IdentifiedGameGrant.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifiedGameGrant();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GameModeStatus.Config.enabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t GameModeStatus.Config.enabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*GameModeStatus.Config.enabled.modify())()
{
  return nullsub_1;
}

uint64_t GameModeStatus.Config.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 20), a1, &qword_256BD79F0);
}

uint64_t type metadata accessor for GameModeStatus.Config(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD8338);
}

uint64_t GameModeStatus.Config.enablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 20), &qword_256BD79F0);
}

uint64_t (*GameModeStatus.Config.enablementDate.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_23C962E2C(v1 + *(int *)(v3 + 24), a1, &qword_256BD79F0);
}

uint64_t GameModeStatus.Config.disablementDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for GameModeStatus.Config(0);
  return sub_23C963110(a1, v1 + *(int *)(v3 + 24), &qword_256BD79F0);
}

uint64_t (*GameModeStatus.Config.disablementDate.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GameModeStatus.Config(0) + 28));
}

uint64_t GameModeStatus.Config.deviceSupported.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for GameModeStatus.Config(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.deviceSupported.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.jettisonCameraS2R.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GameModeStatus.Config(0) + 32));
}

uint64_t GameModeStatus.Config.jettisonCameraS2R.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for GameModeStatus.Config(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.jettisonCameraS2R.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.gameBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.gameBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.gameBundleIdentifiers.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.previousGameBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.previousGameBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.previousGameBundleIdentifiers.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.impactedBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.impactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 44);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.impactedBundleIdentifiers.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.previouslyImpactedBundleIdentifiers.getter()
{
  type metadata accessor for GameModeStatus.Config(0);
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.Config.previouslyImpactedBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for GameModeStatus.Config(0) + 48);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.previouslyImpactedBundleIdentifiers.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.enablementStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for GameModeStatus.Config(0) + 52));
}

uint64_t GameModeStatus.Config.enablementStrategy.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for GameModeStatus.Config(0);
  *(_QWORD *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*GameModeStatus.Config.enablementStrategy.modify())()
{
  type metadata accessor for GameModeStatus.Config(0);
  return nullsub_1;
}

uint64_t GameModeStatus.Config.init(enabled:enablementDate:disablementDate:deviceSupported:jettisonCameraS2R:gameBundleIdentifiers:previousGameBundleIdentifiers:impactedBundleIdentifiers:previouslyImpactedBundleIdentifiers:enablementStrategy:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _BYTE *a9@<X8>, uint64_t a10, uint64_t a11)
{
  int *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t result;

  v16 = (int *)type metadata accessor for GameModeStatus.Config(0);
  v17 = (uint64_t)&a9[v16[5]];
  v18 = sub_23C976AEC();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v17, 1, 1, v18);
  v20 = (uint64_t)&a9[v16[6]];
  v19(v20, 1, 1, v18);
  *a9 = a1;
  sub_23C963110(a2, v17, &qword_256BD79F0);
  result = sub_23C963110(a3, v20, &qword_256BD79F0);
  a9[v16[7]] = a4;
  a9[v16[8]] = a5;
  *(_QWORD *)&a9[v16[9]] = a6;
  *(_QWORD *)&a9[v16[10]] = a7;
  *(_QWORD *)&a9[v16[11]] = a8;
  *(_QWORD *)&a9[v16[12]] = a10;
  *(_QWORD *)&a9[v16[13]] = a11;
  return result;
}

uint64_t GameModeStatus.enabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled);
}

uint64_t GameModeStatus.enablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, a1, &qword_256BD79F0);
}

uint64_t GameModeStatus.disablementDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23C962E2C(v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, a1, &qword_256BD79F0);
}

uint64_t GameModeStatus.deviceSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported);
}

uint64_t GameModeStatus.jettisonCameraS2R.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R);
}

uint64_t GameModeStatus.gameBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.previousGameBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.impactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.previouslyImpactedBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GameModeStatus.enablementStrategy.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy);
}

id GameModeStatus.__allocating_init(config:)(_BYTE *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GameModeStatus.init(config:)(a1);
}

id GameModeStatus.init(config:)(_BYTE *a1)
{
  _BYTE *v1;
  char *v3;
  int *v4;
  id v5;
  objc_super v7;

  v3 = &v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config];
  v4 = (int *)type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, int *))(*((_QWORD *)v4 - 1) + 56))(v3, 1, 1, v4);
  v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled] = *a1;
  sub_23C962E2C((uint64_t)&a1[v4[5]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], &qword_256BD79F0);
  sub_23C962E2C((uint64_t)&a1[v4[6]], (uint64_t)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate], &qword_256BD79F0);
  v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported] = a1[v4[7]];
  v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R] = a1[v4[8]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers] = *(_QWORD *)&a1[v4[9]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers] = *(_QWORD *)&a1[v4[10]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers] = *(_QWORD *)&a1[v4[11]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers] = *(_QWORD *)&a1[v4[12]];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy] = *(_QWORD *)&a1[v4[13]];
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for GameModeStatus(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_23C972B2C((uint64_t)a1);
  return v5;
}

uint64_t type metadata accessor for GameModeStatus(uint64_t a1)
{
  return sub_23C962C4C(a1, qword_256BD82C0);
}

uint64_t sub_23C972B2C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t GameModeStatus.config.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD8288);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C962E2C(v9, (uint64_t)v8, (uint64_t *)&unk_256BD8288);
  v10 = type metadata accessor for GameModeStatus.Config(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return sub_23C972FF4((uint64_t)v8, (uint64_t)a1);
  sub_23C964EB8((uint64_t)v8, (uint64_t *)&unk_256BD8288);
  sub_23C972CD8(v1, a1);
  sub_23C972FB0((uint64_t)a1, (uint64_t)v6);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_23C963110((uint64_t)v6, v9, (uint64_t *)&unk_256BD8288);
  return swift_endAccess();
}

uint64_t sub_23C972CD8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  int *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
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
  uint64_t result;
  uint64_t v27;

  v4 = (int *)type metadata accessor for GameModeStatus.Config(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - v11;
  v13 = sub_23C976AEC();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(v10, 1, 1, v13);
  v15 = (uint64_t)&v6[v4[5]];
  v14((char *)v15, 1, 1, v13);
  v16 = (uint64_t)&v6[v4[6]];
  v14((char *)v16, 1, 1, v13);
  *v6 = 0;
  sub_23C963110((uint64_t)v12, v15, &qword_256BD79F0);
  sub_23C963110((uint64_t)v10, v16, &qword_256BD79F0);
  v6[v4[7]] = 0;
  v6[v4[8]] = 0;
  v17 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[9]] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v6[v4[10]] = v17;
  *(_QWORD *)&v6[v4[11]] = v17;
  *(_QWORD *)&v6[v4[12]] = v17;
  *(_QWORD *)&v6[v4[13]] = 0;
  sub_23C972FF4((uint64_t)v6, (uint64_t)a2);
  *a2 = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, (uint64_t)&a2[v4[5]]);
  sub_23C964EF4(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, (uint64_t)&a2[v4[6]]);
  a2[v4[7]] = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported);
  a2[v4[8]] = *(_BYTE *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R);
  v18 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers);
  v19 = v4[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v19] = v18;
  v20 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers);
  v21 = v4[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v21] = v20;
  v22 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers);
  v23 = v4[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v23] = v22;
  v24 = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers);
  v25 = v4[12];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)&a2[v25] = v24;
  *(_QWORD *)&a2[v4[13]] = *(_QWORD *)(a1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy);
  return result;
}

uint64_t sub_23C972FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23C972FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t GameModeStatus.config.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD8288);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23C972FF4(a1, (uint64_t)v5);
  v6 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
  swift_beginAccess();
  sub_23C963110((uint64_t)v5, v7, (uint64_t *)&unk_256BD8288);
  return swift_endAccess();
}

void (*GameModeStatus.config.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _BYTE *v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD8288);
  v3[7] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = type metadata accessor for GameModeStatus.Config(0);
  v3[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[10] = malloc(v7);
  v8 = malloc(v7);
  v3[11] = v8;
  GameModeStatus.config.getter(v8);
  return sub_23C9731A4;
}

void sub_23C9731A4(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  v3 = *(void **)(*(_QWORD *)a1 + 88);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v6 = v2[9];
    v8 = v2[6];
    v7 = (void *)v2[7];
    sub_23C972FB0(v2[11], v2[10]);
    sub_23C972FF4((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    v9 = v8 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v9, (uint64_t *)&unk_256BD8288);
    swift_endAccess();
    sub_23C972B2C((uint64_t)v3);
  }
  else
  {
    v10 = v2[8];
    v11 = v2[9];
    v12 = v2[6];
    v7 = (void *)v2[7];
    sub_23C972FF4(v2[11], (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v13 = v12 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config;
    swift_beginAccess();
    sub_23C963110((uint64_t)v7, v13, (uint64_t *)&unk_256BD8288);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t static GameModeStatus.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall GameModeStatus.encode(with:)(NSCoder with)
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
  char *v15;
  uint64_t v16;
  void *v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v38 - v8;
  v10 = sub_23C976AEC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v39 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v38 - v14;
  v16 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled);
  v17 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v16, v17);

  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, (uint64_t)v9, &qword_256BD79F0);
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v18(v9, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v9, &qword_256BD79F0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v9, v10);
    v19 = (void *)sub_23C976AE0();
    v20 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v19, v20);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
  sub_23C962E2C(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, (uint64_t)v7, &qword_256BD79F0);
  if (v18(v7, 1, v10) == 1)
  {
    sub_23C964EB8((uint64_t)v7, &qword_256BD79F0);
  }
  else
  {
    v21 = v39;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v39, v7, v10);
    v22 = (void *)sub_23C976AE0();
    v23 = (void *)sub_23C976B34();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v22, v23);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, v10);
  }
  v24 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported);
  v25 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v24, v25);

  v26 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R);
  v27 = (void *)sub_23C976B34();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v26, v27);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers));
  sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  v28 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v28, v29);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers));
  v30 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v31 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v30, v31);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers));
  v32 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v33 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v32, v33);

  sub_23C963894(*(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers));
  v34 = (void *)sub_23C976BF4();
  swift_bridgeObjectRelease();
  v35 = (void *)sub_23C976B34();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v34, v35);

  v36 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy);
  v37 = (void *)sub_23C976B34();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v36, v37);

}

id GameModeStatus.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23C973A74(a1);

  return v4;
}

id GameModeStatus.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_23C973A74(a1);

  return v2;
}

id GameModeStatus.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void GameModeStatus.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GameModeStatus.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GameModeStatus(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23C973A74(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  _OWORD *v22;
  uint64_t v23;
  int v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  __objc2_class_ro *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned __int8 v43;
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
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  objc_class *v62;
  __int128 v64;
  _QWORD v65[3];
  uint64_t v66;
  uint64_t v67;
  objc_super v68;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v65[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v65[-1] - v7;
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)&v64 = (char *)&v65[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v65[-1] - v13;
  v15 = &v1[OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config];
  v16 = type metadata accessor for GameModeStatus.Config(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = v1;
  v18 = (void *)sub_23C976B34();
  v19 = objc_msgSend(a1, sel_decodeBoolForKey_, v18);

  v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enabled] = v19;
  v20 = (void *)sub_23C976B34();
  v21 = objc_msgSend(a1, sel_containsValueForKey_, v20);

  v22 = &loc_23C977000;
  if ((v21 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_23C977B90;
    *(_QWORD *)(v23 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
    sub_23C976C48();
    swift_bridgeObjectRelease();
    if (v66)
    {
      v24 = swift_dynamicCast();
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v25(v8, v24 ^ 1u, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
      {
        v26 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v26(v14, v8, v9);
        v27 = &v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate];
        v26(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], v14, v9);
        v22 = (_OWORD *)&loc_23C977000;
        v25(v27, 0, 1, v9);
        v28 = &GameModeCCUIStatusInfo;
        goto LABEL_9;
      }
    }
    else
    {
      sub_23C964EB8((uint64_t)v65, (uint64_t *)&unk_256BD83B0);
      v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v25(v8, 1, 1, v9);
    }
    sub_23C964EB8((uint64_t)v8, &qword_256BD79F0);
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  }
  v28 = &GameModeCCUIStatusInfo;
  v25(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate], 1, 1, v9);
LABEL_9:
  v29 = (void *)sub_23C976B34();
  v30 = objc_msgSend(a1, sel_containsValueForKey_, v29);

  if (v30)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = v22[185];
    *(_QWORD *)(v31 + 32) = sub_23C964E80(0, (unint64_t *)&unk_256BD7B70);
    sub_23C976C48();
    swift_bridgeObjectRelease();
    if (v66)
    {
      v32 = swift_dynamicCast();
      v25(v6, v32 ^ 1u, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) != 1)
      {
        v33 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v34 = (char *)v64;
        v33((char *)v64, v6, v9);
        v35 = &v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate];
        v33(&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate], v34, v9);
        v36 = v35;
        v37 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      sub_23C964EB8((uint64_t)v65, (uint64_t *)&unk_256BD83B0);
      v25(v6, 1, 1, v9);
    }
    sub_23C964EB8((uint64_t)v6, &qword_256BD79F0);
  }
  v36 = &v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate];
  v37 = 1;
LABEL_16:
  v25(v36, v37, 1, v9);
  v38 = (void *)sub_23C976B34();
  v39 = objc_msgSend(a1, (SEL)v28[56].ivar_lyt, v38);

  v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_deviceSupported] = v39;
  v40 = (void *)sub_23C976B34();
  v41 = objc_msgSend(a1, sel_containsValueForKey_, v40);

  if (v41)
  {
    v42 = (void *)sub_23C976B34();
    v43 = objc_msgSend(a1, (SEL)v28[56].ivar_lyt, v42);

    v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R] = v43;
  }
  else
  {
    v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_jettisonCameraS2R] = 0;
  }
  v44 = sub_23C964E80(0, (unint64_t *)&qword_256BD7A10);
  v45 = sub_23C976C54();
  if (v45
    && (v65[0] = v45,
        __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8398),
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD83A0),
        swift_dynamicCast()))
  {
    v46 = v67;
  }
  else
  {
    v46 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_gameBundleIdentifiers] = v46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD8390);
  v47 = swift_allocObject();
  v64 = xmmword_23C977B90;
  *(_OWORD *)(v47 + 16) = xmmword_23C977B90;
  *(_QWORD *)(v47 + 32) = v44;
  v48 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v49 = MEMORY[0x24BEE4AF8];
  if (v48)
  {
    v50 = sub_23C9674F8(v48);
    swift_bridgeObjectRelease();
    if (v50)
      v49 = v50;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previousGameBundleIdentifiers] = v49;
  v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = v64;
  *(_QWORD *)(v51 + 32) = v44;
  v52 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v53 = MEMORY[0x24BEE4AF8];
  if (v52)
  {
    v54 = sub_23C9674F8(v52);
    swift_bridgeObjectRelease();
    if (v54)
      v53 = v54;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_impactedBundleIdentifiers] = v53;
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = v64;
  *(_QWORD *)(v55 + 32) = v44;
  v56 = sub_23C976C60();
  swift_bridgeObjectRelease();
  v57 = MEMORY[0x24BEE4AF8];
  if (v56)
  {
    v58 = sub_23C9674F8(v56);
    swift_bridgeObjectRelease();
    if (v58)
      v57 = v58;
  }
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_previouslyImpactedBundleIdentifiers] = v57;
  v59 = (void *)sub_23C976B34();
  v60 = objc_msgSend(a1, sel_decodeIntegerForKey_, v59);

  v61 = v60 == (id)1;
  if (v60 == (id)2)
    v61 = 2;
  *(_QWORD *)&v17[OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementStrategy] = v61;

  v62 = (objc_class *)type metadata accessor for GameModeStatus(0);
  v68.receiver = v17;
  v68.super_class = v62;
  return objc_msgSendSuper2(&v68, sel_init);
}

uint64_t sub_23C9742CC()
{
  return type metadata accessor for GameModeStatus(0);
}

void sub_23C9742D4()
{
  unint64_t v0;
  unint64_t v1;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_23C964330(319, &qword_256BD82D8, (void (*)(uint64_t))type metadata accessor for GameModeStatus.Config);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for GameModeStatus.Config(char *a1, char *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *v4 = *(_QWORD *)a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = sub_23C976AEC();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = a3[6];
    v16 = (char *)v4 + v15;
    v17 = &a2[v15];
    if (v12(&a2[v15], 1, v10))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
    v19 = a3[8];
    *((_BYTE *)v4 + a3[7]) = a2[a3[7]];
    *((_BYTE *)v4 + v19) = a2[v19];
    v20 = a3[10];
    *(_QWORD *)((char *)v4 + a3[9]) = *(_QWORD *)&a2[a3[9]];
    *(_QWORD *)((char *)v4 + v20) = *(_QWORD *)&a2[v20];
    v21 = a3[12];
    *(_QWORD *)((char *)v4 + a3[11]) = *(_QWORD *)&a2[a3[11]];
    *(_QWORD *)((char *)v4 + v21) = *(_QWORD *)&a2[v21];
    *(_QWORD *)((char *)v4 + a3[13]) = *(_QWORD *)&a2[a3[13]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for GameModeStatus.Config(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23C976AEC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for GameModeStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v17] = a2[v17];
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  v19 = a3[12];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *assignWithCopy for GameModeStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  a1[a3[7]] = a2[a3[7]];
  a1[a3[8]] = a2[a3[8]];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  return a1;
}

_BYTE *initializeWithTake for GameModeStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  v17 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v17] = a2[v17];
  v18 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  v19 = a3[12];
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  return a1;
}

_BYTE *assignWithTake for GameModeStatus.Config(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23C976AEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  v21 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v21] = a2[v21];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  return a1;
}

uint64_t getEnumTagSinglePayload for GameModeStatus.Config()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C974E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for GameModeStatus.Config()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23C974E9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_256BD79F0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  return result;
}

void sub_23C974F1C()
{
  unint64_t v0;

  sub_23C964330(319, &qword_256BD7AB0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_23C974FC8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  _BOOL4 v7;
  unsigned int v8;

  v7 = a2 != a5 || a6 >= a3;
  if (a5 < a2)
    v7 = 0;
  v8 = a1 != a4 || v7;
  if (a4 >= a1)
    return v8;
  else
    return 0;
}

uint64_t sub_23C974FF4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  _BOOL4 v7;
  unsigned int v8;

  v7 = a5 != a2 || a3 >= a6;
  if (a2 < a5)
    v7 = 0;
  v8 = a4 != a1 || v7;
  if (a1 >= a4)
    return v8;
  else
    return 0;
}

uint64_t sub_23C975020(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  _BOOL4 v7;
  unsigned int v8;

  v7 = a2 == a5 && a6 < a3;
  v8 = a5 < a2 || v7;
  if (a1 != a4)
    v8 = 0;
  if (a4 >= a1)
    return v8;
  else
    return 1;
}

Swift::Bool __swiftcall Version.isLessThanSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;
  BOOL v5;
  Swift::Bool v6;

  v5 = sourceVersion.minor == v2 && v3 < sourceVersion.patch;
  v6 = v2 < sourceVersion.minor || v5;
  if (sourceVersion.major != v1)
    v6 = 0;
  return v1 < sourceVersion.major || v6;
}

uint64_t Version.minor.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Version.patch.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_23C975098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v0 = sub_23C976AD4();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256BD83C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256BD83C0);
  sub_23C976ABC();
  sub_23C976AC8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

unint64_t sub_23C975150()
{
  unint64_t result;
  unsigned int v1;

  result = currentSourceVersion();
  static Version.currentSourceVersion = result;
  unk_256BD95E0 = HIDWORD(result);
  qword_256BD95E8 = v1;
  return result;
}

uint64_t *Version.currentSourceVersion.unsafeMutableAddressor()
{
  if (qword_256BD79A8 != -1)
    swift_once();
  return &static Version.currentSourceVersion;
}

uint64_t static Version.currentSourceVersion.getter()
{
  if (qword_256BD79A8 != -1)
    swift_once();
  swift_beginAccess();
  return static Version.currentSourceVersion;
}

uint64_t static Version.currentSourceVersion.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (qword_256BD79A8 != -1)
    swift_once();
  result = swift_beginAccess();
  static Version.currentSourceVersion = a1;
  unk_256BD95E0 = a2;
  qword_256BD95E8 = a3;
  return result;
}

uint64_t (*static Version.currentSourceVersion.modify())()
{
  if (qword_256BD79A8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

GamePolicy::Version_optional __swiftcall Version.init(versionString:)(Swift::String versionString)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  Swift::UInt v14;
  Swift::UInt v15;
  Swift::Bool v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  Swift::UInt v29;
  Swift::UInt v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unsigned __int8 *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  _QWORD v49[4];
  uint64_t v50;
  uint64_t v51;
  GamePolicy::Version_optional result;

  object = versionString._object;
  countAndFlagsBits = versionString._countAndFlagsBits;
  v3 = sub_23C976AD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256BD79A0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_256BD83C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v50 = countAndFlagsBits;
  v51 = (uint64_t)object;
  sub_23C9769C0();
  v8 = sub_23C976C9C();
  v10 = v9;
  swift_bridgeObjectRelease();
  v50 = v8;
  v51 = v10;
  v49[2] = 46;
  v49[3] = 0xE100000000000000;
  v11 = (_QWORD *)sub_23C976C90();
  swift_bridgeObjectRelease();
  v12 = v11[2];
  if (v12 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_75:
    v23 = 0;
    v30 = 0;
    v29 = 0;
    v16 = 1;
    goto LABEL_76;
  }
  swift_bridgeObjectRetain();
  v13 = sub_23C976B7C();
  v14 = swift_bridgeObjectRelease();
  if (v13 <= 0)
    goto LABEL_74;
  v17 = v11[4];
  v18 = v11[5];
  v19 = HIBYTE(v18) & 0xF;
  v20 = v17 & 0xFFFFFFFFFFFFLL;
  if (!((v18 & 0x2000000000000000) != 0 ? HIBYTE(v18) & 0xF : v17 & 0xFFFFFFFFFFFFLL))
    goto LABEL_74;
  if ((v18 & 0x1000000000000000) == 0)
  {
    if ((v18 & 0x2000000000000000) == 0)
    {
      if ((v17 & 0x1000000000000000) != 0)
        v22 = (unsigned __int8 *)((v18 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v22 = (unsigned __int8 *)sub_23C976CC0();
      v14 = (Swift::UInt)sub_23C97617C(v22, v20, 10);
      if ((v20 & 1) != 0)
        goto LABEL_74;
      v23 = v14;
      goto LABEL_42;
    }
    v50 = v11[4];
    v51 = v18 & 0xFFFFFFFFFFFFFFLL;
    if (v17 == 43)
    {
      if (!v19)
        goto LABEL_79;
      if (v19 != 1 && (BYTE1(v17) - 48) <= 9u)
      {
        v23 = (BYTE1(v17) - 48);
        if (v19 == 2)
          goto LABEL_40;
        if ((BYTE2(v17) - 48) <= 9u)
        {
          v23 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
          v25 = v19 - 3;
          if (v25)
          {
            v26 = (unsigned __int8 *)&v50 + 3;
            while (1)
            {
              v27 = *v26 - 48;
              if (v27 > 9)
                goto LABEL_38;
              v28 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63)
                goto LABEL_38;
              v23 = v28 + v27;
              if (__OFADD__(v28, v27))
                goto LABEL_38;
              v24 = 0;
              ++v26;
              if (!--v25)
                goto LABEL_41;
            }
          }
          goto LABEL_40;
        }
      }
    }
    else
    {
      if (v17 == 45)
      {
        if (v19)
        {
          if (v19 == 1 || (BYTE1(v17) - 48) > 9u)
            goto LABEL_38;
          if (v19 == 2)
          {
            v24 = 0;
            v23 = -(uint64_t)(BYTE1(v17) - 48);
            goto LABEL_41;
          }
          if ((BYTE2(v17) - 48) > 9u)
            goto LABEL_38;
          v23 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
          v38 = v19 - 3;
          if (v38)
          {
            v39 = (unsigned __int8 *)&v50 + 3;
            while (1)
            {
              v40 = *v39 - 48;
              if (v40 > 9)
                goto LABEL_38;
              v41 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63)
                goto LABEL_38;
              v23 = v41 - v40;
              if (__OFSUB__(v41, v40))
                goto LABEL_38;
              v24 = 0;
              ++v39;
              if (!--v38)
                goto LABEL_41;
            }
          }
LABEL_40:
          v24 = 0;
LABEL_41:
          if ((v24 & 1) == 0)
            goto LABEL_42;
LABEL_74:
          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
          swift_bridgeObjectRelease();
          goto LABEL_75;
        }
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
        goto LABEL_81;
      }
      if (v19 && (v17 - 48) <= 9u)
      {
        v23 = (v17 - 48);
        if (v19 == 1)
          goto LABEL_40;
        if ((BYTE1(v17) - 48) <= 9u)
        {
          v23 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
          v34 = v19 - 2;
          if (v34)
          {
            v35 = (unsigned __int8 *)&v50 + 2;
            while (1)
            {
              v36 = *v35 - 48;
              if (v36 > 9)
                goto LABEL_38;
              v37 = 10 * v23;
              if ((unsigned __int128)(v23 * (__int128)10) >> 64 != (10 * v23) >> 63)
                goto LABEL_38;
              v23 = v37 + v36;
              if (__OFADD__(v37, v36))
                goto LABEL_38;
              v24 = 0;
              ++v35;
              if (!--v34)
                goto LABEL_41;
            }
          }
          goto LABEL_40;
        }
      }
    }
LABEL_38:
    v23 = 0;
    v24 = 1;
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v23 = (uint64_t)sub_23C976098(v17, v18, 10);
  v48 = v47;
  v14 = swift_bridgeObjectRelease();
  if ((v48 & 1) != 0)
    goto LABEL_74;
LABEL_42:
  if (v23 <= 0)
    goto LABEL_74;
  if (v12 < 2)
  {
    swift_bridgeObjectRelease();
    v29 = 0;
    v30 = 0;
    goto LABEL_45;
  }
  if (v11[2] < 2uLL)
    goto LABEL_80;
  swift_bridgeObjectRetain();
  v31 = sub_23C976B7C();
  swift_bridgeObjectRelease();
  if (v31 <= 0)
    goto LABEL_74;
  v32 = v11[6];
  v33 = v11[7];
  swift_bridgeObjectRetain();
  v14 = sub_23C975894(v32, v33);
  if ((v20 & 1) != 0)
    goto LABEL_74;
  v30 = v14;
  if ((v14 & 0x8000000000000000) != 0)
    goto LABEL_74;
  if (v12 <= 2)
  {
    swift_bridgeObjectRelease();
    v29 = 0;
    goto LABEL_45;
  }
  if (v11[2] < 3uLL)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  swift_bridgeObjectRetain();
  v42 = sub_23C976B7C();
  swift_bridgeObjectRelease();
  if (v42 <= 0)
    goto LABEL_74;
  v43 = v11[8];
  v44 = v11[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v45 = sub_23C975894(v43, v44);
  if ((v46 & 1) != 0)
    goto LABEL_5;
  v29 = v45;
  if (v45 < 0)
    goto LABEL_5;
LABEL_45:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v16 = 0;
LABEL_76:
  v14 = v23;
  v20 = v30;
  v15 = v29;
LABEL_82:
  result.value.patch = v15;
  result.value.minor = v20;
  result.value.major = v14;
  result.is_nil = v16;
  return result;
}

uint64_t sub_23C975894(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_23C976CC0();
      v7 = (uint64_t)sub_23C97617C(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_23C976098(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

Swift::Bool __swiftcall Version.isEqualToSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v1 == sourceVersion.major && v2 == sourceVersion.minor && v3 == sourceVersion.patch;
}

BOOL static Version.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

Swift::Bool __swiftcall Version.isGreaterThanSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;
  BOOL v5;
  Swift::Bool v6;

  v5 = v2 == sourceVersion.minor && sourceVersion.patch < v3;
  v6 = sourceVersion.minor < v2 || v5;
  if (v1 != sourceVersion.major)
    v6 = 0;
  return sourceVersion.major < v1 || v6;
}

Swift::Bool __swiftcall Version.isGreaterThanOrEqualToSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;
  BOOL v5;
  Swift::Bool v6;

  v5 = v2 == sourceVersion.minor && v3 >= sourceVersion.patch;
  v6 = sourceVersion.minor < v2 || v5;
  if (v1 != sourceVersion.major)
    v6 = 0;
  return sourceVersion.major < v1 || v6;
}

Swift::Bool __swiftcall Version.isLessThanOrEqualToSourceVersion(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;
  BOOL v5;
  Swift::Bool v6;

  v5 = sourceVersion.minor == v2 && sourceVersion.patch >= v3;
  v6 = v2 < sourceVersion.minor || v5;
  if (sourceVersion.major != v1)
    v6 = 0;
  return v1 < sourceVersion.major || v6;
}

NSComparisonResult __swiftcall Version.compare(sourceVersion:)(GamePolicy::Version sourceVersion)
{
  Swift::UInt v1;
  Swift::UInt v2;
  Swift::UInt v3;
  BOOL v4;

  if (v1 < sourceVersion.major)
  {
    sourceVersion.major = -1;
    return sourceVersion.major;
  }
  if (sourceVersion.major != v1)
  {
    if (sourceVersion.major < v1)
    {
      sourceVersion.major = 1;
      return sourceVersion.major;
    }
    goto LABEL_15;
  }
  if (v2 < sourceVersion.minor)
  {
    sourceVersion.major = -1;
    return sourceVersion.major;
  }
  if (sourceVersion.minor == v2 && v3 < sourceVersion.patch)
  {
    sourceVersion.major = -1;
    return sourceVersion.major;
  }
  v4 = sourceVersion.minor == v2;
  if (sourceVersion.patch >= v3)
    v4 = 0;
  sourceVersion.major = 1;
  if (sourceVersion.minor >= v2 && !v4)
LABEL_15:
    sourceVersion.major = 0;
  return sourceVersion.major;
}

uint64_t Version.description.getter()
{
  uint64_t v1;

  v1 = sub_23C976D2C();
  sub_23C976B88();
  sub_23C976D2C();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  sub_23C976D2C();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t Version.debugDescription.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD83E0);
  sub_23C976B58();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  Version.description.getter();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  return 60;
}

uint64_t Version.hash(into:)()
{
  sub_23C976D50();
  sub_23C976D50();
  return sub_23C976D50();
}

uint64_t Version.hashValue.getter()
{
  sub_23C976D44();
  sub_23C976D50();
  sub_23C976D50();
  sub_23C976D50();
  return sub_23C976D5C();
}

uint64_t sub_23C975E4C()
{
  sub_23C976D44();
  sub_23C976D50();
  sub_23C976D50();
  sub_23C976D50();
  return sub_23C976D5C();
}

uint64_t sub_23C975EB4()
{
  sub_23C976D50();
  sub_23C976D50();
  return sub_23C976D50();
}

uint64_t sub_23C975EF8()
{
  sub_23C976D44();
  sub_23C976D50();
  sub_23C976D50();
  sub_23C976D50();
  return sub_23C976D5C();
}

uint64_t sub_23C975F5C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23C975F8C(a1, a2, a3, a4, _s10GamePolicy7VersionV1loiySbAC_ACtFZ_0);
}

uint64_t sub_23C975F68(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23C975F8C(a1, a2, a3, a4, sub_23C974FC8);
}

uint64_t sub_23C975F74(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23C975F8C(a1, a2, a3, a4, sub_23C974FF4);
}

uint64_t sub_23C975F80(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_23C975F8C(a1, a2, a3, a4, sub_23C975020);
}

uint64_t sub_23C975F8C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_23C975FAC()
{
  return Version.description.getter();
}

uint64_t sub_23C975FB8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256BD83E0);
  sub_23C976B58();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  sub_23C976B88();
  Version.description.getter();
  sub_23C976B88();
  swift_bridgeObjectRelease();
  return 60;
}

BOOL sub_23C976068(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

unsigned __int8 *sub_23C976098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_23C976BDC();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_23C9763F8();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_23C976CC0();
  }
LABEL_7:
  v11 = sub_23C97617C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_23C97617C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_23C9763F8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_23C976BE8();
  v4 = sub_23C976474(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23C976474(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_23C9765B8(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_23C9766A4(v9, 0);
      v12 = sub_23C976708((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x242626A08](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x242626A08);
LABEL_9:
      sub_23C976CC0();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x242626A08]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_23C9765B8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_23C976918(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_23C976918(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_23C976BAC();
  }
  __break(1u);
  return result;
}

_QWORD *sub_23C9766A4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256BD83F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_23C976708(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_23C976918(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_23C976BB8();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_23C976CC0();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_23C976918(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_23C976B94();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_23C976918(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_23C976BC4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x242626A44](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t _s10GamePolicy7VersionV1loiySbAC_ACtFZ_0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  _BOOL4 v7;
  unsigned int v8;

  v7 = a5 == a2 && a3 < a6;
  v8 = a2 < a5 || v7;
  if (a4 != a1)
    v8 = 0;
  if (a1 >= a4)
    return v8;
  else
    return 1;
}

unint64_t sub_23C9769C0()
{
  unint64_t result;

  result = qword_256BD83D8;
  if (!qword_256BD83D8)
  {
    result = MEMORY[0x242626F00](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256BD83D8);
  }
  return result;
}

unint64_t sub_23C976A08()
{
  unint64_t result;

  result = qword_256BD83E8;
  if (!qword_256BD83E8)
  {
    result = MEMORY[0x242626F00](&protocol conformance descriptor for Version, &type metadata for Version);
    atomic_store(result, (unint64_t *)&qword_256BD83E8);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Version(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Version(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Version()
{
  return &type metadata for Version;
}

uint64_t sub_23C976ABC()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_23C976AC8()
{
  return MEMORY[0x24BDCB720]();
}

uint64_t sub_23C976AD4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23C976AE0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23C976AEC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23C976AF8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23C976B04()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23C976B10()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_23C976B1C()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_23C976B28()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_23C976B34()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23C976B40()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23C976B4C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23C976B58()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23C976B64()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_23C976B70()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23C976B7C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23C976B88()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23C976B94()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23C976BA0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23C976BAC()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_23C976BB8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23C976BC4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23C976BD0()
{
  return MEMORY[0x24BEE0CD8]();
}

uint64_t sub_23C976BDC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23C976BE8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23C976BF4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23C976C00()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_23C976C0C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23C976C18()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23C976C24()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_23C976C30()
{
  return MEMORY[0x24BDD00F8]();
}

uint64_t sub_23C976C3C()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_23C976C48()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_23C976C54()
{
  return MEMORY[0x24BDD0190]();
}

uint64_t sub_23C976C60()
{
  return MEMORY[0x24BDD0198]();
}

uint64_t sub_23C976C6C()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_23C976C78()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23C976C84()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23C976C90()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23C976C9C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_23C976CA8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23C976CB4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23C976CC0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23C976CCC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23C976CD8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23C976CE4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23C976CF0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23C976CFC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23C976D08()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23C976D14()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23C976D20()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23C976D2C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23C976D38()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23C976D44()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23C976D50()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23C976D5C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x24BDAE100]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

