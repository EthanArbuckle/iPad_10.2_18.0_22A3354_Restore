int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  NSString *v11;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(TVRemoteApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(TVRemoteUIServiceAppDelegate);
  v10 = NSStringFromClass(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v8, v11);

  objc_autoreleasePoolPop(v5);
  return (int)argv;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id _TVRUIServiceLog()
{
  if (_TVRUIServiceLog_onceToken != -1)
    dispatch_once(&_TVRUIServiceLog_onceToken, &__block_literal_global_0);
  return (id)_TVRUIServiceLog_log;
}

id _TVRUIServiceAppLog()
{
  if (_TVRUIServiceAppLog_onceToken != -1)
    dispatch_once(&_TVRUIServiceAppLog_onceToken, &__block_literal_global_3);
  return (id)_TVRUIServiceAppLog_log;
}

void sub_100006A20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

unint64_t lazy protocol witness table accessor for type LaunchAppIntent and conformance LaunchAppIntent()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent;
  if (!lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent;
  if (!lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent;
  if (!lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent;
  if (!lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent;
  if (!lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppIntent, &type metadata for LaunchAppIntent);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppIntent and conformance LaunchAppIntent);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LaunchAppEnum and conformance LaunchAppEnum()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum;
  if (!lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LaunchAppEnum, &type metadata for LaunchAppEnum);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LaunchAppEnum and conformance LaunchAppEnum);
  }
  return result;
}

uint64_t one-time initialization function for title(uint64_t a1)
{
  return one-time initialization function for title(a1, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, static LaunchAppIntent.title, (uint64_t (*)(uint64_t, unint64_t))&LocalizedStringResource.init(stringLiteral:));
}

uint64_t one-time initialization function for authenticationPolicy()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for IntentAuthenticationPolicy(0);
  __swift_allocate_value_buffer(v0, static LaunchAppIntent.authenticationPolicy);
  v1 = __swift_project_value_buffer(v0, (uint64_t)static LaunchAppIntent.authenticationPolicy);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, enum case for IntentAuthenticationPolicy.alwaysAllowed(_:), v0);
}

uint64_t protocol witness for OpenIntent.target.getter in conformance LaunchAppIntent()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t protocol witness for OpenIntent.target.setter in conformance LaunchAppIntent()
{
  return IntentParameter.wrappedValue.setter();
}

void (*protocol witness for OpenIntent.target.modify in conformance LaunchAppIntent(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return protocol witness for OpenIntent.target.modify in conformance LaunchAppIntent;
}

void protocol witness for OpenIntent.target.modify in conformance LaunchAppIntent(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t associated type witness table accessor for AppIntent.PerformResult : IntentResult in LaunchAppIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for AppIntent.PerformResult : IntentResult in LaunchAppIntent(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type LaunchAppIntent and conformance LaunchAppIntent, (uint64_t)&opaque type descriptor for <<opaque return type of OpenIntent.perform()>>);
}

uint64_t associated type witness table accessor for AppIntent.SummaryContent : ParameterSummary in LaunchAppIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for AppIntent.PerformResult : IntentResult in LaunchAppIntent(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type LaunchAppIntent and conformance LaunchAppIntent, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t protocol witness for static AppIntent.title.getter in conformance LaunchAppIntent@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static AppIntent.title.getter in conformance LaunchAppIntent(&one-time initialization token for title, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)static LaunchAppIntent.title, (uint64_t)one-time initialization function for title, a1);
}

uint64_t protocol witness for static AppIntent.openAppWhenRun.getter in conformance LaunchAppIntent(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type LaunchAppIntent and conformance LaunchAppIntent();
  return static OpenIntent.openAppWhenRun.getter(a1, v2);
}

uint64_t protocol witness for static AppIntent.authenticationPolicy.getter in conformance LaunchAppIntent@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static AppIntent.title.getter in conformance LaunchAppIntent(&one-time initialization token for authenticationPolicy, (uint64_t (*)(_QWORD))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)static LaunchAppIntent.authenticationPolicy, (uint64_t)one-time initialization function for authenticationPolicy, a1);
}

uint64_t protocol witness for static AppIntent.title.getter in conformance LaunchAppIntent@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = __swift_project_value_buffer(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t protocol witness for AppIntent.perform() in conformance LaunchAppIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to OpenIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = lazy protocol witness table accessor for type LaunchAppIntent and conformance LaunchAppIntent();
  *v5 = v2;
  v5[1] = protocol witness for AppIntent.perform() in conformance LaunchAppIntent;
  return OpenIntent.perform()(a1, a2, v6);
}

uint64_t protocol witness for AppIntent.perform() in conformance LaunchAppIntent()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t protocol witness for AppIntent.init() in conformance LaunchAppIntent@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = specialized LaunchAppIntent.init()();
  *a1 = result;
  return result;
}

uint64_t protocol witness for static PersistentlyIdentifiable.persistentIdentifier.getter in conformance LaunchAppIntent(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type LaunchAppIntent and conformance LaunchAppIntent();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t one-time initialization function for typeDisplayRepresentation(uint64_t a1)
{
  return one-time initialization function for title(a1, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, static LaunchAppEnum.typeDisplayRepresentation, (uint64_t (*)(uint64_t, unint64_t))&TypeDisplayRepresentation.init(stringLiteral:));
}

uint64_t one-time initialization function for title(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  uint64_t v6;

  v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  return a4(0x412068636E75614CLL, 0xEA00000000007070);
}

unint64_t one-time initialization function for caseDisplayRepresentations()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t result;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(LaunchAppEnum, DisplayRepresentation)>);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LaunchAppEnum, DisplayRepresentation));
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v1 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_10000DD80;
  DisplayRepresentation.init(stringLiteral:)(0x68636E75614CLL, 0xE600000000000000);
  result = specialized Dictionary.init(dictionaryLiteral:)(v2);
  static LaunchAppEnum.caseDisplayRepresentations = result;
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LaunchAppEnum, DisplayRepresentation));
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LaunchAppEnum, DisplayRepresentation>);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v12 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    outlined init with copy of (LaunchAppEnum, DisplayRepresentation)(v11, (uint64_t)v5);
    result = specialized __RawDictionaryStorage.find<A>(_:)();
    if ((v14 & 1) != 0)
      break;
    v15 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = v8[7];
    v17 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v15, v5, v17);
    v18 = v8[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    v8[2] = v20;
    v11 += v12;
    if (!--v9)
    {
      swift_release(v8);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LaunchAppEnum@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance LaunchAppEnum, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance LaunchAppEnum@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = specialized LaunchAppEnum.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *associated type witness table accessor for RawRepresentable.RawValue : LosslessStringConvertible in LaunchAppEnum()
{
  return &protocol witness table for String;
}

uint64_t protocol witness for static TypeDisplayRepresentable.typeDisplayRepresentation.getter in conformance LaunchAppEnum@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static AppIntent.title.getter in conformance LaunchAppIntent(&one-time initialization token for typeDisplayRepresentation, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)static LaunchAppEnum.typeDisplayRepresentation, (uint64_t)one-time initialization function for typeDisplayRepresentation, a1);
}

uint64_t associated type witness table accessor for _IntentValue.Specification : ResolverSpecification in LaunchAppEnum(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return associated type witness table accessor for AppIntent.PerformResult : IntentResult in LaunchAppIntent(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type LaunchAppEnum and conformance LaunchAppEnum, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t associated type witness table accessor for AppIntent.PerformResult : IntentResult in LaunchAppIntent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

uint64_t protocol witness for static _IntentValue.defaultResolverSpecification.getter in conformance LaunchAppEnum(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type LaunchAppEnum and conformance LaunchAppEnum();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t protocol witness for static CaseDisplayRepresentable.caseDisplayRepresentations.getter in conformance LaunchAppEnum()
{
  if (one-time initialization token for caseDisplayRepresentations != -1)
    swift_once(&one-time initialization token for caseDisplayRepresentations, one-time initialization function for caseDisplayRepresentations);
  return swift_bridgeObjectRetain(static LaunchAppEnum.caseDisplayRepresentations);
}

uint64_t protocol witness for CustomLocalizedStringResourceConvertible.localizedStringResource.getter in conformance LaunchAppEnum(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type LaunchAppEnum and conformance LaunchAppEnum();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t lazy protocol witness table accessor for type [LaunchAppEnum] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [LaunchAppEnum] and conformance [A];
  if (!lazy protocol witness table cache variable for type [LaunchAppEnum] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [LaunchAppEnum]);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [LaunchAppEnum] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance LaunchAppEnum(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance LaunchAppEnum;
}

uint64_t getEnumTagSinglePayload for LaunchAppEnum(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LaunchAppEnum(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000088BC + 4 * byte_10000DD90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000088DC + 4 * byte_10000DD95[v4]))();
}

_BYTE *sub_1000088BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000088DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000088E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000088EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000088F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000088FC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for LaunchAppEnum()
{
  return 0;
}

ValueMetadata *type metadata accessor for LaunchAppEnum()
{
  return &type metadata for LaunchAppEnum;
}

ValueMetadata *type metadata accessor for LaunchAppIntent()
{
  return &type metadata for LaunchAppIntent;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized LaunchAppIntent.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t, uint64_t, uint64_t);
  unint64_t v18;
  _BYTE v20[15];
  char v21;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = &v20[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentDialog?);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v20[-v7];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LocalizedStringResource?);
  __chkstk_darwin(v9);
  v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = &v20[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for IntentParameter<LaunchAppEnum>);
  LocalizedStringResource.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000012, 0x800000010000F320);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  v21 = 1;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v8, 1, 1, v16);
  v17(v6, 1, 1, v16);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v18 = lazy protocol witness table accessor for type LaunchAppEnum and conformance LaunchAppEnum();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v21, v8, v6, v3, &outlined read-only object #0 of LaunchAppIntent.init(), v18);
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:)()
{
  uint64_t v0;
  Swift::Int v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v0 + 40));
  String.hash(into:)(v3, 0x68636E75616CLL, 0xE600000000000000);
  v1 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(v1);
}

uint64_t outlined init with copy of (LaunchAppEnum, DisplayRepresentation)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (LaunchAppEnum, DisplayRepresentation));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t specialized LaunchAppEnum.rawValue.getter()
{
  return 0x68636E75616CLL;
}

uint64_t specialized == infix<A>(_:_:)()
{
  return 1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1)
{
  return String.hash(into:)(a1, 0x68636E75616CLL, 0xE600000000000000);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x68636E75616CLL, 0xE600000000000000);
  return Hasher._finalize()();
}

uint64_t one-time initialization function for log()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v0, log);
  v1 = __swift_project_value_buffer(v0, (uint64_t)log);
  if (one-time initialization token for tip != -1)
    swift_once(&one-time initialization token for tip, one-time initialization function for tip);
  v2 = __swift_project_value_buffer(v0, (uint64_t)static Logger.tip);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id TipsManager.popoverPresentationConductor.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  objc_class *v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v1 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager____lazy_storage___popoverPresentationConductor);
  }
  else
  {
    v4 = (objc_class *)type metadata accessor for TipPopoverPresentationConductor();
    v5 = (char *)objc_allocWithZone(v4);
    v6 = swift_unknownObjectWeakInit(&v5[OBJC_IVAR____TtC17TVRemoteUIService31TipPopoverPresentationConductor_tipManager], 0);
    swift_unknownObjectWeakAssign(v6, v0);
    v11.receiver = v5;
    v11.super_class = v4;
    v7 = objc_msgSendSuper2(&v11, "init");
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id one-time initialization function for shared()
{
  id result;

  result = closure #1 in variable initialization expression of static TipsManager.shared();
  static TipsManager.shared = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static TipsManager.shared()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v0 = type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine(0);
  v18 = *(_QWORD *)(v0 - 8);
  v19 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation(0);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Tips.ConfigurationOption.DisplayFrequency(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TipsManager()), "init");
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Tips.ConfigurationOption>);
  v11 = *(_QWORD *)(type metadata accessor for Tips.ConfigurationOption(0) - 8);
  v12 = swift_allocObject(v10, ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ 3 * *(_QWORD *)(v11 + 72), *(unsigned __int8 *)(v11 + 80) | 7);
  *(_OWORD *)(v12 + 16) = xmmword_10000E1C0;
  static Tips.ConfigurationOption.DisplayFrequency.immediate.getter();
  static Tips.ConfigurationOption.displayFrequency(_:)(v9);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter(v13);
  static Tips.ConfigurationOption.datastoreLocation(_:)(v5);
  v14 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter(v14);
  static Tips.ConfigurationOption.analyticsEngine(_:)(v2);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v2, v19);
  static Tips.configure(_:)(v12);
  swift_bridgeObjectRelease(v12);
  return v20;
}

uint64_t TipsManager.setupTipsObserver()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  result = __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation])
  {
    if (one-time initialization token for log != -1)
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    v7 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v7, (uint64_t)log);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Setting up find my remote tip observer", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
    type metadata accessor for MainActor(0);
    v12 = v1;
    v13 = static MainActor.shared.getter();
    v14 = (_QWORD *)swift_allocObject(&unk_100014EF8, 40, 7);
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v12;
    v15 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&async function pointer to partial apply for closure #1 in TipsManager.setupTipsObserver(), (uint64_t)v14);
    v16 = *(_QWORD *)&v1[v6];
    *(_QWORD *)&v1[v6] = v15;
    return swift_release(v16);
  }
  return result;
}

uint64_t closure #1 in TipsManager.setupTipsObserver()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4[12] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Tips.Status?);
  v4[13] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Tips.Status(0);
  v4[14] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[15] = v7;
  v4[16] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<Tips.Status>);
  v4[17] = v8;
  v4[18] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<Tips.Status>.Iterator);
  v4[19] = v9;
  v4[20] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncStream<Tips.Status>, Bool>);
  v4[21] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v4[22] = v11;
  v4[23] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AsyncStream<Tips.Status>, Bool>.Iterator);
  v4[24] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v4[25] = v13;
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[26] = swift_task_alloc(v14);
  v4[27] = swift_task_alloc(v14);
  v15 = type metadata accessor for MainActor(0);
  v4[28] = v15;
  v4[29] = static MainActor.shared.getter(v15);
  v16 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  v4[30] = v16;
  v4[31] = v17;
  return swift_task_switch(closure #1 in TipsManager.setupTipsObserver(), v16);
}

uint64_t closure #1 in TipsManager.setupTipsObserver()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t MyTip;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(v0 + 176);
  v1 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 136);
  *(_BYTE *)(v0 + 328) = *(_BYTE *)(*(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tip);
  MyTip = lazy protocol witness table accessor for type FindMyTip and conformance FindMyTip();
  Tip.shouldDisplayUpdates.getter(&type metadata for FindMyTip, MyTip);
  AsyncMapSequence.base.getter(v4);
  v7 = lazy protocol witness table accessor for type AsyncStream<Tips.Status> and conformance AsyncStream<A>(&lazy protocol witness table cache variable for type AsyncStream<Tips.Status> and conformance AsyncStream<A>, &demangling cache variable for type metadata for AsyncStream<Tips.Status>, (uint64_t)&protocol conformance descriptor for AsyncStream<A>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v5, v7);
  v8 = AsyncMapSequence.transform.getter(v4);
  v10 = v9;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  v11 = AsyncMapSequence.Iterator.init(_:transform:)(v3, v8, v10, v5, &type metadata for Bool, v7);
  v12 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController;
  *(_QWORD *)(v0 + 256) = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController;
  *(_QWORD *)(v0 + 264) = v12;
  v13 = static MainActor.shared.getter(v11);
  *(_QWORD *)(v0 + 272) = v13;
  if (v13)
  {
    ObjectType = swift_getObjectType(v13);
    v15 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, &protocol witness table for MainActor);
    v17 = v16;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  *(_QWORD *)(v0 + 280) = v15;
  *(_QWORD *)(v0 + 288) = v17;
  return swift_task_switch(closure #1 in TipsManager.setupTipsObserver(), v15);
}

{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[34];
  v0[37] = AsyncMapSequence.Iterator.baseIterator.modify(v0 + 8, v0[24]);
  lazy protocol witness table accessor for type AsyncStream<Tips.Status> and conformance AsyncStream<A>(&lazy protocol witness table cache variable for type AsyncStream<Tips.Status>.Iterator and conformance AsyncStream<A>.Iterator, &demangling cache variable for type metadata for AsyncStream<Tips.Status>.Iterator, (uint64_t)&protocol conformance descriptor for AsyncStream<A>.Iterator);
  v2 = (_QWORD *)swift_task_alloc(_sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTjTu[1]);
  v0[38] = v2;
  *v2 = v0;
  v2[1] = closure #1 in TipsManager.setupTipsObserver();
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0[13], v1, &protocol witness table for MainActor);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 304));
  if (v0)
  {
    v3 = *(_QWORD *)(v2 + 280);
    v4 = closure #1 in TipsManager.setupTipsObserver();
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 296))(v2 + 64, 0);
    v3 = *(_QWORD *)(v2 + 280);
    v4 = closure #1 in TipsManager.setupTipsObserver();
  }
  return swift_task_switch(v4, v3);
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  int *v13;

  v1 = v0[14];
  v2 = v0[15];
  v3 = v0[13];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = v0[34];
    outlined destroy of TaskPriority?(v3, &demangling cache variable for type metadata for Tips.Status?);
    swift_release(v4);
    return swift_task_switch(closure #1 in TipsManager.setupTipsObserver(), v0[30]);
  }
  else
  {
    v7 = v0[26];
    v6 = v0[27];
    v8 = v0[24];
    v9 = v0[25];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[16], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    v10 = (int *)AsyncMapSequence.Iterator.transform.getter(v8);
    v0[39] = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    v13 = (int *)((char *)v10 + *v10);
    v12 = (_QWORD *)swift_task_alloc(v10[1]);
    v0[40] = v12;
    *v12 = v0;
    v12[1] = closure #1 in TipsManager.setupTipsObserver();
    return ((uint64_t (*)(char *, _QWORD))v13)((char *)v0 + 329, v0[16]);
  }
}

{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 296))(v0 + 64, 1);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 312);
  v4 = *(_QWORD *)(*v0 + 120);
  v3 = *(_QWORD *)(*v0 + 128);
  v5 = *(_QWORD *)(*v0 + 112);
  swift_task_dealloc(*(_QWORD *)(*v0 + 320));
  swift_release(v2);
  *(_BYTE *)(v1 + 330) = *(_BYTE *)(v1 + 329);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch(closure #1 in TipsManager.setupTipsObserver(), *(_QWORD *)(v1 + 280));
}

{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 272));
  return swift_task_switch(closure #1 in TipsManager.setupTipsObserver(), *(_QWORD *)(v0 + 240));
}

{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((*((_BYTE *)v0 + 330) & 1) != 0)
  {
    TipsManager.showTip()();
  }
  else if (*(_QWORD *)(v0[12] + v0[32]))
  {
    if (one-time initialization token for log != -1)
      swift_once(&one-time initialization token for log, one-time initialization function for log);
    v1 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v1, (uint64_t)log);
    v2 = Logger.logObject.getter();
    v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Hide find my tip", v4, 2u);
      swift_slowDealloc(v4, -1, -1);
    }
    v5 = v0[33];
    v6 = v0[12];

    v7 = *(void **)(v6 + v5);
    if (v7)
    {
      v8 = swift_allocObject(&unk_100014F48, 32, 7);
      *(_QWORD *)(v8 + 16) = 0;
      *(_QWORD *)(v8 + 24) = 0;
      v0[6] = closure #1 in TipsManager.hideTip(animated:completion:)partial apply;
      v0[7] = v8;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = thunk for @escaping @callee_guaranteed () -> ();
      v0[5] = &block_descriptor_25;
      v9 = _Block_copy(v0 + 2);
      v10 = v0[7];
      v11 = v7;
      swift_release(v10);
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v9);
      _Block_release(v9);

    }
  }
  v12 = static MainActor.shared.getter();
  v0[34] = v12;
  if (v12)
  {
    ObjectType = swift_getObjectType(v12);
    v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, &protocol witness table for MainActor);
    v16 = v15;
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v0[35] = v14;
  v0[36] = v16;
  return swift_task_switch(closure #1 in TipsManager.setupTipsObserver(), v14);
}

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

  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 104);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(v2, *(_QWORD *)(v0 + 192));
  swift_release(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    outlined destroy of TaskPriority?(a1, &demangling cache variable for type metadata for TaskPriority?);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_100014F20, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATu, v16);
}

Swift::Void __swiftcall TipsManager.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v1 = v0;
  if (one-time initialization token for log != -1)
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  v2 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v2, (uint64_t)log);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Invalidating find my tip", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = swift_allocObject(&unk_100014ED0, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v1);
  swift_retain(v6);
  TipsManager.hideTip(animated:completion:)(1, partial apply for closure #1 in TipsManager.invalidate(), v6);
  swift_release_n(v6, 2);
}

void closure #1 in TipsManager.invalidate()(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (char *)Strong;
    v4 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation;
    v5 = *(_QWORD *)(Strong + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation);
    if (v5)
    {
      swift_retain(*(_QWORD *)(Strong + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation));
      Task.cancel()();
      swift_release(v5);
      v6 = *(_QWORD *)&v3[v4];
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)&v3[v4] = 0;
    swift_release(v6);
    v7 = *(void **)&v3[OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController];
    *(_QWORD *)&v3[OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController] = 0;

  }
}

Swift::Void __swiftcall TipsManager.showTip()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  unsigned __int8 v21[24];
  ValueMetadata *v22;
  unint64_t MyTip;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController);
  if (!v1)
    return;
  v2 = v0;
  v20 = v1;
  v3 = objc_msgSend(v20, "tipSourceView");

  if (!v3
    || !objc_msgSend(v20, "canPresentTip")
    || (v4 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController,
        *(_QWORD *)(v2 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController)))
  {

    return;
  }
  if (one-time initialization token for log != -1)
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  v5 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v5, (uint64_t)log);
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Show find my tip", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  if ((objc_msgSend(v20, "respondsToSelector:", "tipSourceSupportsSiri") & 1) != 0)
    v9 = objc_msgSend(v20, "tipSourceSupportsSiri");
  else
    v9 = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tip) = v9;
  v22 = &type metadata for FindMyTip;
  MyTip = lazy protocol witness table accessor for type FindMyTip and conformance FindMyTip();
  v21[0] = v9;
  v10 = objc_msgSend(v20, "tipSourceView");
  if (!v10)
  {
    __break(1u);
    goto LABEL_20;
  }
  v11 = v10;
  type metadata accessor for TipUIPopoverViewController(0);
  v12 = (void *)TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)(v21, v11, destructiveProjectEnumData for LaunchAppEnum, 0);
  v13 = objc_msgSend(v12, "view");
  if (!v13)
  {
LABEL_20:
    __break(1u);
    return;
  }
  v14 = v13;
  v15 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
  objc_msgSend(v14, "setTintColor:", v15);

  v16 = (void *)TipUIPopoverViewController.popoverPresentationController.getter(objc_msgSend(v12, "setOverrideUserInterfaceStyle:", 2));
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, "setPermittedArrowDirections:", objc_msgSend(v20, "permittedArrowDirections"));

  }
  v18 = TipsManager.popoverPresentationConductor.getter();
  TipUIPopoverViewController.presentationDelegate.setter(v18);
  objc_msgSend(v20, "presentViewController:animated:completion:", v12, 1, 0);
  v19 = *(void **)(v2 + v4);
  *(_QWORD *)(v2 + v4) = v12;

}

void TipsManager.hideTip(animated:completion:)(char a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;

  if (!*(_QWORD *)(v3 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipsViewController))
    goto LABEL_8;
  v6 = v3;
  if (one-time initialization token for log != -1)
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  v8 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v8, (uint64_t)log);
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Hide find my tip", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  v12 = *(void **)(v6 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_presentingViewController);
  if (v12)
  {
    v13 = swift_allocObject(&unk_100014E80, 32, 7);
    *(_QWORD *)(v13 + 16) = a2;
    *(_QWORD *)(v13 + 24) = a3;
    v17[4] = partial apply for closure #1 in TipsManager.hideTip(animated:completion:);
    v18 = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    v17[2] = thunk for @escaping @callee_guaranteed () -> ();
    v17[3] = &block_descriptor;
    v14 = _Block_copy(v17);
    v15 = v18;
    v16 = v12;
    outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a2, a3);
    swift_release(v15);
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", a1 & 1, v14);
    _Block_release(v14);

  }
  else
  {
LABEL_8:
    if (a2)
      a2();
  }
}

void closure #1 in TipsManager.hideTip(animated:completion:)(void (*a1)(void))
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (one-time initialization token for log != -1)
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  v2 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v2, (uint64_t)log);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Dismissed find my tip", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  if (a1)
    a1();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

id TipsManager.__deallocating_deinit()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation];
  if (v2)
  {
    swift_retain(*(_QWORD *)&v0[OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tipObservation]);
    Task.cancel()();
    swift_release(v2);
    v3 = *(_QWORD *)&v0[v1];
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)&v0[v1] = 0;
  swift_release(v3);
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TipsManager();
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t type metadata accessor for TipsManager()
{
  return objc_opt_self(_TtC17TVRemoteUIService11TipsManager);
}

uint64_t closure #1 in TipPopoverPresentationConductor.presentationControllerDidDismiss(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  unint64_t MyTip;
  _BYTE v8[16];

  v2 = type metadata accessor for Tips.InvalidationReason(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8[15] = *(_BYTE *)(a1 + OBJC_IVAR____TtC17TVRemoteUIService11TipsManager_tip);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for Tips.InvalidationReason.tipClosed(_:), v2);
  MyTip = lazy protocol witness table accessor for type FindMyTip and conformance FindMyTip();
  Tip.invalidate(reason:)(v5, &type metadata for FindMyTip, MyTip);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
}

id TipPopoverPresentationConductor.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipPopoverPresentationConductor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TipPopoverPresentationConductor()
{
  return objc_opt_self(_TtC17TVRemoteUIService31TipPopoverPresentationConductor);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FindMyTip(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FindMyTip(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000ABD8 + 4 * byte_10000E1E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000AC0C + 4 * byte_10000E1E0[v4]))();
}

uint64_t sub_10000AC0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AC14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000AC1CLL);
  return result;
}

uint64_t sub_10000AC28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000AC30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000AC34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AC3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FindMyTip()
{
  return &type metadata for FindMyTip;
}

void *associated type witness table accessor for Identifiable.ID : Hashable in FindMyTip()
{
  return &protocol witness table for String;
}

uint64_t FindMyTip.message.getter(char a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  if ((a1 & 1) != 0)
  {
    v1 = 0x5353454D5F504954;
    v2 = 0xEB00000000454741;
  }
  else
  {
    v2 = 0x800000010000F570;
    v1 = 0xD000000000000013;
  }
  v3 = LocalizedStringKey.init(stringLiteral:)(v1, v2);
  return Text.init(_:tableName:bundle:comment:)(v3);
}

unint64_t protocol witness for Tip.id.getter in conformance FindMyTip()
{
  return 0xD000000000000026;
}

uint64_t protocol witness for Tip.title.getter in conformance FindMyTip()
{
  return specialized FindMyTip.title.getter();
}

uint64_t protocol witness for Tip.message.getter in conformance FindMyTip()
{
  char *v0;

  return FindMyTip.message.getter(*v0);
}

uint64_t protocol witness for Tip.image.getter in conformance FindMyTip()
{
  return Image.init(systemName:)(0xD000000000000017, 0x800000010000F550);
}

uint64_t protocol witness for Tip.options.getter in conformance FindMyTip()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t OpaqueTypeConformance2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static Tips.OptionsBuilder.buildPartialBlock<A>(first:)>>.0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Tips.MaxDisplayCount(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static Tips.OptionsBuilder.buildExpression<A>(_:)>>.0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Tips.MaxDisplayCount.init(_:)(1);
  static Tips.OptionsBuilder.buildExpression<A>(_:)(v7, v4, &protocol witness table for Tips.MaxDisplayCount);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = v4;
  v17 = &protocol witness table for Tips.MaxDisplayCount;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v16, &opaque type descriptor for <<opaque return type of static Tips.OptionsBuilder.buildExpression<A>(_:)>>, 1);
  static Tips.OptionsBuilder.buildPartialBlock<A>(first:)(v11, v8, OpaqueTypeConformance2);
  v16 = v8;
  v17 = (void *)OpaqueTypeConformance2;
  v13 = swift_getOpaqueTypeConformance2(&v16, &opaque type descriptor for <<opaque return type of static Tips.OptionsBuilder.buildPartialBlock<A>(first:)>>, 1);
  v14 = static Tips.OptionsBuilder.buildFinalResult<A>(_:)(v3, v0, v13);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

void protocol witness for Identifiable.id.getter in conformance FindMyTip(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000010000F590;
}

unint64_t lazy protocol witness table accessor for type FindMyTip and conformance FindMyTip()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FindMyTip and conformance FindMyTip;
  if (!lazy protocol witness table cache variable for type FindMyTip and conformance FindMyTip)
  {
    result = swift_getWitnessTable("um", &type metadata for FindMyTip);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FindMyTip and conformance FindMyTip);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FindMyTip and conformance FindMyTip;
  if (!lazy protocol witness table cache variable for type FindMyTip and conformance FindMyTip)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for FindMyTip, &type metadata for FindMyTip);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FindMyTip and conformance FindMyTip);
  }
  return result;
}

void one-time initialization function for tip()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v0, static Logger.tip);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.tip);
  v1 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v2 = objc_msgSend(v1, "bundleIdentifier");

  if (v2)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v5 = v4;

    Logger.init(subsystem:category:)(v3, v5, 0x6954794D646E6946, 0xE900000000000070);
  }
  else
  {
    __break(1u);
  }
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void specialized TipPopoverPresentationConductor.presentationControllerDidDismiss(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  id v9;

  v1 = v0;
  if (one-time initialization token for log != -1)
    swift_once(&one-time initialization token for log, one-time initialization function for log);
  v2 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v2, (uint64_t)log);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "User dismissed popover", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  Strong = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC17TVRemoteUIService31TipPopoverPresentationConductor_tipManager);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = swift_allocObject(&unk_100014E58, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v9 = v7;
    TipsManager.hideTip(animated:completion:)(1, (void (*)(void))partial apply for closure #1 in TipPopoverPresentationConductor.presentationControllerDidDismiss(_:), v8);
    swift_release(v8);

  }
}

uint64_t specialized FindMyTip.title.getter()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0x4C5449545F504954, 0xE900000000000045);
  return Text.init(_:tableName:bundle:comment:)(v0);
}

uint64_t sub_10000B288()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t partial apply for closure #1 in TipPopoverPresentationConductor.presentationControllerDidDismiss(_:)()
{
  uint64_t v0;

  return closure #1 in TipPopoverPresentationConductor.presentationControllerDidDismiss(_:)(*(_QWORD *)(v0 + 16));
}

void partial apply for closure #1 in TipsManager.hideTip(animated:completion:)()
{
  uint64_t v0;

  closure #1 in TipsManager.hideTip(animated:completion:)(*(void (**)(void))(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10000B32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void partial apply for closure #1 in TipsManager.invalidate()()
{
  uint64_t v0;

  closure #1 in TipsManager.invalidate()(v0);
}

uint64_t sub_10000B358()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t partial apply for closure #1 in TipsManager.setupTipsObserver()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10001B0E4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = protocol witness for AppIntent.perform() in conformance LaunchAppIntent;
  return closure #1 in TipsManager.setupTipsObserver()(a1, v4, v5, v6);
}

uint64_t sub_10000B3F0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10001B0F4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = protocol witness for AppIntent.perform() in conformance LaunchAppIntent;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))(a1, v4);
}

uint64_t lazy protocol witness table accessor for type AsyncStream<Tips.Status> and conformance AsyncStream<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t outlined consume of (@escaping @callee_guaranteed () -> ())?(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000B540()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC17TVRemoteUIServiceP33_38F991E8B5809FCB65F249B9D113484B19ResourceBundleClass);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLContexts");
}

id objc_msgSend__acquireAppSwitcherAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acquireAppSwitcherAssertion");
}

id objc_msgSend__configureWithDefaultContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureWithDefaultContext");
}

id objc_msgSend__disconnectUserInitiated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectUserInitiated");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__dismissHintsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissHintsAnimated:");
}

id objc_msgSend__dismissPresentedContentAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissPresentedContentAnimated:");
}

id objc_msgSend__initWithLaunchContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithLaunchContext:");
}

id objc_msgSend__initWithUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithUserInfo:");
}

id objc_msgSend__mainViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mainViewController");
}

id objc_msgSend__releaseAppSwitcherAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_releaseAppSwitcherAssertion");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCompletionHandler:");
}

id objc_msgSend__setFromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFromView:");
}

id objc_msgSend__setToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setToView:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_activationReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationReason");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_alertDidFinishDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertDidFinishDismissal:");
}

id objc_msgSend_alertDidFinishPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertDidFinishPresentation:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allTouches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allTouches");
}

id objc_msgSend_allowsSwipeToDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsSwipeToDismiss");
}

id objc_msgSend_allowsTapToDismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsTapToDismiss");
}

id objc_msgSend_animateTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateTransition:");
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotation");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_backgroundMaterialView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundMaterialView");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bs_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_addChildViewController:");
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSendResponse");
}

id objc_msgSend_configureWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithContext:");
}

id objc_msgSend_configureWithDeviceIdentifier_identifierType_deviceType_launchContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivate");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultSceneDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSceneDelegate");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_device_supportsSiri_volume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:supportsSiri:volume:");
}

id objc_msgSend_device_supportsVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device:supportsVolume:");
}

id objc_msgSend_deviceHasRoundedCorners(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceHasRoundedCorners");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_deviceIdentifierType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifierType");
}

id objc_msgSend_devicePickerWillExpand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePickerWillExpand");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissHints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissHints");
}

id objc_msgSend_dismissPresentedContentAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissPresentedContentAnimated:completion:");
}

id objc_msgSend_dismissalAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissalAction");
}

id objc_msgSend_dismissalType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissalType");
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayCornerRadius");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "events");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_frameForParentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameForParentView:");
}

id objc_msgSend_hasPresentedContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPresentedContent");
}

id objc_msgSend_hintsViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintsViewController");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "info");
}

id objc_msgSend_initWithAnimationType_visualStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAnimationType:visualStyle:");
}

id objc_msgSend_initWithInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:error:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isConfigured(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConfigured");
}

id objc_msgSend_isConnectedToDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnectedToDevice");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInSecureWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInSecureWindow");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isWakingToLockScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWakingToLockScreen");
}

id objc_msgSend_lastActiveEndpointIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastActiveEndpointIdentifier");
}

id objc_msgSend_launchContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchContext");
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadViewIfNeeded");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_lockScreenRemoteDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenRemoteDelegate");
}

id objc_msgSend_lockScreenSceneDelegateSceneDidDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenSceneDelegateSceneDidDisconnect:");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainViewController");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_maximizedCornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximizedCornerRadius");
}

id objc_msgSend_needsCompactLayoutForCurrentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsCompactLayoutForCurrentDevice");
}

id objc_msgSend_needsLandscapeOrientationForCurrentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsLandscapeOrientationForCurrentDevice");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForSetting:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phase");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_preferredDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredDeviceIdentifier");
}

id objc_msgSend_presentFindMyTip(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentFindMyTip");
}

id objc_msgSend_presentTip(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentTip");
}

id objc_msgSend_presentationAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationAction");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_recursiveDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recursiveDescription");
}

id objc_msgSend_remoteControlViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteControlViewController");
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteViewController");
}

id objc_msgSend_remoteWillBeDismissed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteWillBeDismissed");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_replayHints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayHints");
}

id objc_msgSend_resetRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetRootViewController");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:openURLContexts:");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_setActivationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationReason:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAppSwitcherAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppSwitcherAssertion:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundCornerRadius:");
}

id objc_msgSend_setBackgroundMaterialView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundMaterialView:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDeviceConnectionStatusDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceConnectionStatusDelegate:");
}

id objc_msgSend_setDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdentifier:");
}

id objc_msgSend_setDeviceIdentifierType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdentifierType:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDismissalAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissalAction:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHintsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHintsViewController:");
}

id objc_msgSend_setIsConnectedToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsConnectedToDevice:");
}

id objc_msgSend_setIsInSecureWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInSecureWindow:");
}

id objc_msgSend_setLastActiveEndpointIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastActiveEndpointIdentifier:");
}

id objc_msgSend_setLaunchContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchContext:");
}

id objc_msgSend_setMainViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainViewController:");
}

id objc_msgSend_setObject_forSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forSetting:");
}

id objc_msgSend_setPresentationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationAction:");
}

id objc_msgSend_setRemoteControlViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteControlViewController:");
}

id objc_msgSend_setRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteViewController:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setShouldReplayHints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldReplayHints:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setVisualStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualStyle:");
}

id objc_msgSend_setWeighting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWeighting:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldReplayHints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldReplayHints");
}

id objc_msgSend_startConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startConnections");
}

id objc_msgSend_stopConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopConnections");
}

id objc_msgSend_tipSourceViewProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipSourceViewProvider");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_updatePresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePresentingViewController:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_visualStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualStyle");
}

id objc_msgSend_visualStyleForIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualStyleForIdiom:");
}

id objc_msgSend_volumeDownEventGenerated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeDownEventGenerated");
}

id objc_msgSend_volumeUpEventGenerated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeUpEventGenerated");
}

id objc_msgSend_willEnterLockScreenScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willEnterLockScreenScene");
}

id objc_msgSend_willExitLockScreenScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willExitLockScreenScene");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}
