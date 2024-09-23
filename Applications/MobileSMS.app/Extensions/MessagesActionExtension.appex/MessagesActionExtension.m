uint64_t sub_100001A9C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100001F34();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100001B30();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_100001B30()
{
  unint64_t result;

  result = qword_100008020;
  if (!qword_100008020)
  {
    result = swift_getWitnessTable(&unk_1000039B8, &type metadata for MessagesActionExtension);
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

uint64_t variable initialization expression of ConversationListFocusFilterAction._enableFocusFiltering()
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
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  __chkstk_darwin();
  v27 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008028);
  __chkstk_darwin();
  v26 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008030);
  __chkstk_darwin();
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008038);
  __chkstk_darwin();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for LocalizedStringResource(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin();
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100001EB0(&qword_100008040);
  v19 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000052, 0x8000000100003800);
  static Locale.current.getter(v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0xD000000000000021, 0x8000000100003860, v12, v10, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v6, 1, 1, v15);
  v30[0] = 2;
  v20 = type metadata accessor for Bool.IntentDisplayName(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
  v21 = type metadata accessor for IntentDialog(0);
  v22 = v26;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v26, 1, 1, v21);
  v23 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v27, enum case for InputConnectionBehavior.default(_:), v29);
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v18, v6, v30, v4, v22, v23);
}

uint64_t sub_100001EB0(uint64_t *a1)
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

uint64_t sub_100001EF4(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100001F34();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

unint64_t sub_100001F34()
{
  unint64_t result;

  result = qword_100008048;
  if (!qword_100008048)
  {
    result = swift_getWitnessTable(&unk_100003990, &type metadata for MessagesActionExtension);
    atomic_store(result, (unint64_t *)&qword_100008048);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesActionExtension()
{
  return &type metadata for MessagesActionExtension;
}

uint64_t ConversationListFocusFilterAction.enableFocusFiltering.getter()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t ConversationListFocusFilterAction.enableFocusFiltering.setter(char a1)
{
  char v2;

  v2 = a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*ConversationListFocusFilterAction.enableFocusFiltering.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100002030;
}

void sub_100002030(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t ConversationListFocusFilterAction.$enableFocusFiltering.getter()
{
  return IntentParameter.projectedValue.getter();
}

char *ConversationListFocusFilterAction.openAppWhenRun.unsafeMutableAddressor()
{
  return &static ConversationListFocusFilterAction.openAppWhenRun;
}

uint64_t static ConversationListFocusFilterAction.openAppWhenRun.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static ConversationListFocusFilterAction.openAppWhenRun, v1, 0, 0);
  return static ConversationListFocusFilterAction.openAppWhenRun;
}

uint64_t static ConversationListFocusFilterAction.openAppWhenRun.setter(char a1)
{
  uint64_t result;
  _BYTE v3[24];

  result = swift_beginAccess(&static ConversationListFocusFilterAction.openAppWhenRun, v3, 1, 0);
  static ConversationListFocusFilterAction.openAppWhenRun = a1;
  return result;
}

void *static ConversationListFocusFilterAction.openAppWhenRun.modify(uint64_t a1)
{
  swift_beginAccess(&static ConversationListFocusFilterAction.openAppWhenRun, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_100002154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for LocalizedStringResource(0);
  sub_100003418(v8, static ConversationListFocusFilterAction.title);
  sub_100002324(v8, (uint64_t)static ConversationListFocusFilterAction.title);
  v9 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000002BLL, 0x8000000100003940);
  static Locale.current.getter(v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0xD000000000000021, 0x8000000100003A10, v5, v3, 0, 0, 256);
}

uint64_t ConversationListFocusFilterAction.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_100008010 != -1)
    swift_once(&qword_100008010, sub_100002154);
  v0 = type metadata accessor for LocalizedStringResource(0);
  return sub_100002324(v0, (uint64_t)static ConversationListFocusFilterAction.title);
}

uint64_t sub_100002324(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static ConversationListFocusFilterAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_100008010 != -1)
    swift_once(&qword_100008010, sub_100002154);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100002324(v2, (uint64_t)static ConversationListFocusFilterAction.title);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ConversationListFocusFilterAction.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];

  if (qword_100008010 != -1)
    swift_once(&qword_100008010, sub_100002154);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100002324(v2, (uint64_t)static ConversationListFocusFilterAction.title);
  swift_beginAccess(v3, v6, 33, 0);
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess(v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ConversationListFocusFilterAction.title.modify(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100008010 != -1)
    swift_once(&qword_100008010, sub_100002154);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100002324(v2, (uint64_t)static ConversationListFocusFilterAction.title);
  swift_beginAccess(v3, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t static ConversationListFocusFilterAction.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[16];

  sub_100001EB0(&qword_100008038);
  __chkstk_darwin();
  v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin();
  v15 = &v19[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000031, 0x8000000100003890);
  static Locale.current.getter(v16);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000021, 0x8000000100003A10, v9, v7, 0, 0, 256);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v3, 1, 1, v12);
  IntentDescription.init(_:categoryName:searchKeywords:)(v15, v3, &_swiftEmptyArrayStorage);
  v17 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 0, 1, v17);
}

uint64_t ConversationListFocusFilterAction.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[2] = a1;
  v2[3] = a2;
  v3 = type metadata accessor for MainActor(0);
  v2[4] = static MainActor.shared.getter();
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  return swift_task_switch(sub_100002794, v4, v5);
}

uint64_t sub_100002794()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  id v9;
  void *v10;

  swift_release(*(_QWORD *)(v0 + 32));
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v1 = *(unsigned __int8 *)(v0 + 40);
  if (v1 == 2)
  {
    if (qword_100008018 != -1)
      swift_once(&qword_100008018, sub_100002C14);
    v2 = type metadata accessor for Logger(0);
    sub_100002324(v2, (uint64_t)qword_1000084D0);
    v3 = Logger.logObject.getter();
    v4 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Focus filter action is not configured for the current focus", v5, 2u);
      v6 = 0;
LABEL_10:
      swift_slowDealloc(v5, -1, -1);
      goto LABEL_12;
    }
    v6 = 0;
  }
  else
  {
    v6 = v1 & 1;
    if (qword_100008018 != -1)
      swift_once(&qword_100008018, sub_100002C14);
    v7 = type metadata accessor for Logger(0);
    sub_100002324(v7, (uint64_t)qword_1000084D0);
    v3 = Logger.logObject.getter();
    v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v3, v8))
    {
      v5 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v5 = 67109120;
      *(_DWORD *)(v0 + 40) = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 44, v5 + 4);
      _os_log_impl((void *)&_mh_execute_header, v3, v8, "Focus filter action is configured for the current focus, with a value of %{BOOL}d", v5, 8u);
      goto LABEL_10;
    }
  }
LABEL_12:

  v9 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "messagesAppDomain");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setConversationListFocusFilterActionEnabled:", v6);

  }
  static IntentResult.result<>()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ConversationListFocusFilterAction.appContext.getter()
{
  return FocusFilterAppContext.init(notificationFilterPredicate:)(0);
}

uint64_t ConversationListFocusFilterAction.displayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];

  v20[0] = a1;
  sub_100001EB0(&qword_100008058);
  __chkstk_darwin();
  v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008038);
  __chkstk_darwin();
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin();
  v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000042, 0x80000001000038D0);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v12, 0xD000000000000021, 0x8000000100003A10, v10, v8, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v4, 1, 1, v13);
  v18 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v2, 1, 1, v18);
  return DisplayRepresentation.init(title:subtitle:image:)(v16, v4, v2);
}

uint64_t sub_100002C14()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100003418(v0, qword_1000084D0);
  sub_100002324(v0, (uint64_t)qword_1000084D0);
  return Logger.init(subsystem:category:)(0xD000000000000012, 0x8000000100003920, 0xD000000000000021, 0x8000000100003A10);
}

uint64_t sub_100002C90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to static SetFocusFilterIntent.suggestedFocusFilters(for:)[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100002CF8;
  return static SetFocusFilterIntent.suggestedFocusFilters(for:)(a1, a2, a3);
}

uint64_t sub_100002CF8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = *v1;
  v3 = *(_QWORD *)(v6 + 16);
  v4 = *v1;
  v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100002D58(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_100008054);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100002DB0;
  return ConversationListFocusFilterAction.perform()(a1, v4);
}

uint64_t sub_100002DB0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100002DF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s23MessagesActionExtension027ConversationListFocusFilterB0VACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_100002E20(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000031C0();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100002E48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003208();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t _s23MessagesActionExtension027ConversationListFocusFilterB0VACycfC_0()
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
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char v30[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  __chkstk_darwin();
  v27 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008028);
  __chkstk_darwin();
  v26 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008030);
  __chkstk_darwin();
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001EB0(&qword_100008038);
  __chkstk_darwin();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for LocalizedStringResource(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin();
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100001EB0(&qword_100008040);
  v19 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000052, 0x8000000100003800);
  static Locale.current.getter(v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0xD000000000000021, 0x8000000100003A10, v12, v10, 0, 0, 256);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v6, 1, 1, v15);
  v30[0] = 2;
  v20 = type metadata accessor for Bool.IntentDisplayName(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
  v21 = type metadata accessor for IntentDialog(0);
  v22 = v26;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v26, 1, 1, v21);
  v23 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v27, enum case for InputConnectionBehavior.default(_:), v29);
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v18, v6, v30, v4, v22, v23);
}

unint64_t sub_1000031C0()
{
  unint64_t result;

  result = qword_100008060;
  if (!qword_100008060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConversationListFocusFilterAction, &type metadata for ConversationListFocusFilterAction);
    atomic_store(result, (unint64_t *)&qword_100008060);
  }
  return result;
}

unint64_t sub_100003208()
{
  unint64_t result;

  result = qword_100008068;
  if (!qword_100008068)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConversationListFocusFilterAction, &type metadata for ConversationListFocusFilterAction);
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

unint64_t sub_100003250()
{
  unint64_t result;

  result = qword_100008078;
  if (!qword_100008078)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConversationListFocusFilterAction, &type metadata for ConversationListFocusFilterAction);
    atomic_store(result, (unint64_t *)&qword_100008078);
  }
  return result;
}

unint64_t sub_100003298()
{
  unint64_t result;

  result = qword_100008080;
  if (!qword_100008080)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConversationListFocusFilterAction, &type metadata for ConversationListFocusFilterAction);
    atomic_store(result, (unint64_t *)&qword_100008080);
  }
  return result;
}

uint64_t sub_1000032DC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of ConversationListFocusFilterAction.perform()>>, 1);
}

uint64_t sub_1000032EC(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000031C0();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

unint64_t sub_100003330()
{
  unint64_t result;

  result = qword_100008090;
  if (!qword_100008090)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ConversationListFocusFilterAction, &type metadata for ConversationListFocusFilterAction);
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationListFocusFilterAction()
{
  return &type metadata for ConversationListFocusFilterAction;
}

unint64_t sub_100003388()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008098;
  if (!qword_100008098)
  {
    v1 = sub_1000033D4((uint64_t *)&unk_1000080A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_100008098);
  }
  return result;
}

uint64_t sub_1000033D4(uint64_t *a1)
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

uint64_t *sub_100003418(uint64_t a1, uint64_t *a2)
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
