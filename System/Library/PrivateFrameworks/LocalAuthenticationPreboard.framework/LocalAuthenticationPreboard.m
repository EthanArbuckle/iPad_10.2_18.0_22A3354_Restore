uint64_t static LocalizedStrings.confirmationAlertDeveloperModeMessage.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000029, (void *)0x8000000240AF5420);
}

uint64_t static LocalizedStrings.confirmationAlertEnable.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000019, (void *)0x8000000240AF5450);
}

uint64_t static LocalizedStrings.confirmationAlertInstall.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001ALL, (void *)0x8000000240AF5470);
}

uint64_t static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(uint64_t a1, uint64_t a2)
{
  return static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(a1, a2, 0xD00000000000002ALL, (void *)0x8000000240AF5490);
}

uint64_t static LocalizedStrings.confirmationAlertNotEnable.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001DLL, (void *)0x8000000240AF54C0);
}

uint64_t static LocalizedStrings.confirmationAlertNotInstall.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD00000000000001ELL, (void *)0x8000000240AF54E0);
}

uint64_t static LocalizedStrings.developerModeTitle.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000014, (void *)0x8000000240AF5500);
}

uint64_t static LocalizedStrings.developerModeMessage.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000016, (void *)0x8000000240AF5520);
}

uint64_t static LocalizedStrings.enterPasscode.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0x41505F5245544E45, (void *)0xEE0045444F435353);
}

uint64_t static LocalizedStrings.installProfileTitle.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000015, (void *)0x8000000240AF5540);
}

uint64_t static LocalizedStrings.installProfileMessage(teamName:)(uint64_t a1, uint64_t a2)
{
  return static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(a1, a2, 0xD000000000000017, (void *)0x8000000240AF5560);
}

uint64_t static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_240AF53C0;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  v9 = specialized static LocalizedStrings.localizedString(tableSuffix:key:_:)(a3, a4);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t static LocalizedStrings.passcodeRequiredInstallProfile.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000021, (void *)0x8000000240AF5580);
}

uint64_t static LocalizedStrings.passcodeRequiredDeveloperMode.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000020, (void *)0x8000000240AF55B0);
}

uint64_t static LocalizedStrings.pressHomeToContinue.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000016, (void *)0x8000000240AF55E0);
}

uint64_t static LocalizedStrings.swipeUpToContinue.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000014, (void *)0x8000000240AF5600);
}

uint64_t static LocalizedStrings.pressHomeForOptions.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000016, (void *)0x8000000240AF5620);
}

uint64_t static LocalizedStrings.swipeUpForOptions.getter()
{
  return specialized static LocalizedStrings.localizedString(tableSuffix:key:)(0xD000000000000014, (void *)0x8000000240AF5640);
}

uint64_t NSBundle.Sentinel.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

id one-time initialization function for current()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for NSBundle.Sentinel();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  static NSBundle.current = (uint64_t)result;
  return result;
}

uint64_t specialized static LocalizedStrings.localizedString(tableSuffix:key:)(uint64_t a1, void *a2)
{
  Swift::String v4;
  id v5;
  Swift::String v6;
  Swift::String_optional v7;
  Swift::String v8;
  uint64_t countAndFlagsBits;
  Swift::String v11;

  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  if (one-time initialization token for current != -1)
    swift_once();
  v5 = (id)static NSBundle.current;
  v11._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v11._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, (NSBundle)v5, v8, v11)._countAndFlagsBits;
  swift_bridgeObjectRelease();

  return countAndFlagsBits;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242688B90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x242688B9C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized static LocalizedStrings.localizedString(tableSuffix:key:_:)(uint64_t a1, void *a2)
{
  Swift::String v4;
  id v5;
  Swift::String v6;
  Swift::String_optional v7;
  Swift::String v8;
  uint64_t v9;
  Swift::String v11;

  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  if (one-time initialization token for current != -1)
    swift_once();
  v5 = (id)static NSBundle.current;
  v11._object = (void *)0xE000000000000000;
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  v7.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v7.value._object = (void *)0xEB00000000656C62;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  v11._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, v7, (NSBundle)v5, v8, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  v9 = String.init(format:_:)();
  swift_bridgeObjectRelease();
  return v9;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

uint64_t type metadata accessor for NSBundle.Sentinel()
{
  return objc_opt_self();
}

id LAPreboard.init(defaults:)()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDefaults);
}

{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v7;

  v1 = v0;
  type metadata accessor for LACPreboardACMContextProviderFactory();
  swift_allocObject();
  LACPreboardACMContextProviderFactory.init()();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60710]), sel_init);
  type metadata accessor for LACPreboardLauncher();
  type metadata accessor for LACPreboardPasscodeVerifier();
  swift_allocObject();
  LACPreboardPasscodeVerifier.init()();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60720]), sel_initWithBypassEntitlementChecks_, 1);
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60718]), sel_initWithConfig_, v2);

  type metadata accessor for LACPreboardUPPManager();
  swift_allocObject();
  LACPreboardUPPManager.init()();
  type metadata accessor for LACPreboardUseCaseProvider();
  swift_allocObject();
  v7 = LACPreboardUseCaseProvider.init()();
  v3 = objc_allocWithZone((Class)type metadata accessor for LACPreboardController());
  v4 = (void *)LACPreboardController.init(contextProviderFactory:launcher:passcodeVerifier:secureStorage:uppManager:useCaseProvider:)();
  v5 = objc_msgSend(v1, sel_initWithController_, v4, v7);

  return v5;
}

unint64_t type metadata accessor for LACPreboardLauncher()
{
  unint64_t result;

  result = lazy cache variable for type metadata for LACPreboardLauncher;
  if (!lazy cache variable for type metadata for LACPreboardLauncher)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for LACPreboardLauncher);
  }
  return result;
}

unint64_t LAPreboard.iconSystemName.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_useCase);
  v2 = 1918985575;
  if (v1 != (id)3)
    v2 = 0;
  if (v1 == (id)4)
    return 0xD000000000000034;
  else
    return v2;
}

uint64_t LAPreboard.title.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.installProfileTitle.getter, static LocalizedStrings.developerModeTitle.getter);
}

uint64_t LAPreboard.message.getter()
{
  return LAPreboard.message.getter((uint64_t (*)(uint64_t, unint64_t))static LocalizedStrings.installProfileMessage(teamName:), static LocalizedStrings.developerModeMessage.getter);
}

Swift::String __swiftcall LAPreboard.actionTitle(withHomeButton:)(Swift::Bool withHomeButton)
{
  void *v1;
  uint64_t v3;
  void *v4;
  Swift::String result;

  objc_msgSend(v1, sel_useCase);
  if (withHomeButton)
    v3 = static LocalizedStrings.pressHomeToContinue.getter();
  else
    v3 = static LocalizedStrings.swipeUpToContinue.getter();
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t LAPreboard.confirmationTitle.getter()
{
  return 0;
}

id @objc LAPreboard.message.getter(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a1;
  v5 = a3();
  v7 = v6;

  if (v7)
  {
    v8 = (void *)MEMORY[0x2426889BC](v5, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

uint64_t LAPreboard.confirmationMessage.getter()
{
  return LAPreboard.message.getter((uint64_t (*)(uint64_t, unint64_t))static LocalizedStrings.confirmationAlertInstallProfileMessage(teamName:), static LocalizedStrings.confirmationAlertDeveloperModeMessage.getter);
}

uint64_t LAPreboard.message.getter(uint64_t (*a1)(uint64_t, unint64_t), uint64_t (*a2)(void))
{
  void *v2;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(v2, sel_useCase);
  if (v5 == (id)4)
    return a2();
  if (v5 != (id)3)
    return 0;
  v6 = objc_msgSend(objc_msgSend(v2, sel_controller), sel_uppTeamName);
  swift_unknownObjectRelease();
  if (v6)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0xE000000000000000;
  }
  v10 = a1(v7, v9);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t LAPreboard.confirmationActionTitle.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.confirmationAlertInstall.getter, static LocalizedStrings.confirmationAlertEnable.getter);
}

uint64_t LAPreboard.confirmationCancelTitle.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.confirmationAlertNotInstall.getter, static LocalizedStrings.confirmationAlertNotEnable.getter);
}

id @objc LAPreboard.title.getter(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a1;
  v7 = objc_msgSend(v6, sel_useCase);
  if (v7 != (id)-1 && (v7 == (id)3 || (a3 = a4, v7 == (id)4)))
  {
    v8 = a3();
    v10 = v9;

    v11 = (void *)MEMORY[0x2426889BC](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {

    v11 = 0;
  }
  return v11;
}

uint64_t LAPreboard.passcodeSubtitle.getter()
{
  return LAPreboard.title.getter(static LocalizedStrings.passcodeRequiredInstallProfile.getter, static LocalizedStrings.passcodeRequiredDeveloperMode.getter);
}

uint64_t LAPreboard.title.getter(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  void *v2;
  id v5;

  v5 = objc_msgSend(v2, sel_useCase);
  if (v5 == (id)4)
    return a2();
  if (v5 == (id)3)
    return a1();
  return 0;
}

id LAPreboard.isRequired.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(objc_msgSend(v0, sel_controller), sel_isRequired);
  swift_unknownObjectRelease();
  return v1;
}

id LAPreboard.useCase.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(objc_msgSend(v0, sel_controller), sel_useCase);
  swift_unknownObjectRelease();
  return v1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LAPreboard.launch()()
{
  void *v0;
  unsigned int v1;
  id v2;
  id v3;
  id v4[2];

  v4[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v1 = objc_msgSend(objc_msgSend(v0, sel_controller), sel_launchPreboardWithError_, v4);
  swift_unknownObjectRelease();
  if (v1)
  {
    v2 = v4[0];
  }
  else
  {
    v3 = v4[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t LAPreboard.launch(completion:)(uint64_t a1, uint64_t a2)
{
  return LAPreboard.launch(completion:)(a1, a2, (uint64_t)&block_descriptor, (SEL *)&selRef_launchPreboardWithCompletion_);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

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

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void LAPreboard.setEnvironmentVariableWithPasscode(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v7 = (void *)MEMORY[0x2426889BC]();
  v9[4] = a3;
  v9[5] = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v9[3] = &block_descriptor_3;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_enableCurrentUseCaseWithPasscode_completion_, v7, v8);
  _Block_release(v8);

}

void LAPreboard.enableCurrentUseCase(withPasscode:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v9 = objc_msgSend(v4, sel_controller);
  v10 = (void *)MEMORY[0x2426889BC](a1, a2);
  v12[4] = a3;
  v12[5] = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v12[3] = &block_descriptor_6;
  v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_enableCurrentUseCaseWithPasscode_completion_, v10, v11);
  _Block_release(v11);
  swift_unknownObjectRelease();

}

uint64_t LAPreboard.terminate(completion:)(uint64_t a1, uint64_t a2)
{
  return LAPreboard.launch(completion:)(a1, a2, (uint64_t)&block_descriptor_9, (SEL *)&selRef_terminateWithCompletion_);
}

uint64_t LAPreboard.launch(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;
  id v9;
  void *v10;
  _QWORD v12[6];

  v9 = objc_msgSend(v4, sel_controller);
  v12[4] = a1;
  v12[5] = a2;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v12[3] = a3;
  v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v9, *a4, v10);
  _Block_release(v10);
  return swift_unknownObjectRelease();
}

uint64_t sub_240AF4F08()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(uint64_t a1)
{
  uint64_t v1;

  thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(a1, *(_QWORD *)(v1 + 16));
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5;
  void *v6;
  Swift::String result;

  v5 = MEMORY[0x24BDCC6D8](_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t LACPreboardController.init(contextProviderFactory:launcher:passcodeVerifier:secureStorage:uppManager:useCaseProvider:)()
{
  return MEMORY[0x24BE604A0]();
}

uint64_t type metadata accessor for LACPreboardController()
{
  return MEMORY[0x24BE604A8]();
}

uint64_t LACPreboardUPPManager.init()()
{
  return MEMORY[0x24BE604B8]();
}

uint64_t type metadata accessor for LACPreboardUPPManager()
{
  return MEMORY[0x24BE604C0]();
}

uint64_t LACPreboardUseCaseProvider.init()()
{
  return MEMORY[0x24BE604D0]();
}

uint64_t type metadata accessor for LACPreboardUseCaseProvider()
{
  return MEMORY[0x24BE604D8]();
}

uint64_t LACPreboardPasscodeVerifier.init()()
{
  return MEMORY[0x24BE604E8]();
}

uint64_t type metadata accessor for LACPreboardPasscodeVerifier()
{
  return MEMORY[0x24BE604F0]();
}

uint64_t LACPreboardACMContextProviderFactory.init()()
{
  return MEMORY[0x24BE604F8]();
}

uint64_t type metadata accessor for LACPreboardACMContextProviderFactory()
{
  return MEMORY[0x24BE60500]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

