@implementation _NSSwiftLocale

- (BOOL)_doesNotRequireSpecialCaseHandling
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 480);
  v6 = self;
  swift_unknownObjectRetain();
  LOBYTE(v3) = v5(ObjectType, v3);

  swift_unknownObjectRelease();
  return v3 & 1;
}

- (Class)classForCoder
{
  _NSSwiftLocale *v2;

  v2 = self;
  _NSSwiftLocale.classForCoder.getter();

  return (Class)swift_getObjCClassFromMetadata();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)languageCode
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 152);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)calendarIdentifier
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;
  uint64_t v9;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 200);
  v6 = self;
  swift_unknownObjectRetain();
  v5(&v9, ObjectType, v3);
  swift_unknownObjectRelease();
  Calendar.Identifier.cfCalendarIdentifier.getter();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (BOOL)usesMetricSystem
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 216);
  v6 = self;
  swift_unknownObjectRetain();
  LOBYTE(v3) = v5(ObjectType, v3);

  swift_unknownObjectRelease();
  return v3 & 1;
}

- (NSString)scriptCode
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 160);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSString)currencyCode
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 248);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSString)decimalSeparator
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 224);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (id)objectForKey:(id)a3
{
  id v4;
  _NSSwiftLocale *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD v14[3];
  uint64_t v15;

  v4 = a3;
  v5 = self;
  _NSSwiftLocale.object(forKey:)(v4, (uint64_t)v14);

  v6 = v15;
  if (!v15)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v14, v15);
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v8 + 16))(v11, v9);
  v12 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v12;
}

- (id)_localeWithNewCalendarIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _NSSwiftLocale *v7;
  Swift::String_optional v8;
  void *v9;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = (uint64_t)v4;
  v8.value._object = v6;
  v9 = (void *)_NSSwiftLocale._localeWithNewCalendarIdentifier(_:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (NSString)localeIdentifier
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 64);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);

  swift_unknownObjectRelease();
  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (id)_prefForKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(_QWORD *__return_ptr, id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD v19[3];
  uint64_t v20;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(_QWORD *__return_ptr, id, uint64_t, uint64_t, uint64_t))(v7 + 488);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v19, v4, v6, ObjectType, v7);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v11 = v20;
  if (!v20)
    return 0;
  v12 = __swift_project_boxed_opaque_existential_1(v19, v20);
  v13 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v13 + 16))(v16, v14);
  v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return v17;
}

- (NSString)languageIdentifier
{
  _NSSwiftLocale *v2;
  void *v3;

  v2 = self;
  _NSSwiftLocale.languageIdentifier.getter();

  v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)collatorIdentifier
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 256);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _NSSwiftLocale *v5;

  v4 = a3;
  v5 = self;
  _NSSwiftLocale.encode(with:)((NSCoder)v4);

}

- (id)displayNameForKey:(id)a3 value:(id)a4
{
  id v5;
  _NSSwiftLocale *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[32];

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  _NSSwiftLocale.displayName(forKey:value:)(v5, (uint64_t)v11);
  v8 = v7;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if (!v8)
    return 0;
  v9 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)localizedStringForCountryCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 88);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (_NSSwiftLocale)initWithLocaleIdentifier:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_NSSwiftLocale *)_NSSwiftLocale.init(localeIdentifier:)((uint64_t)v3, v4);
}

- (_NSSwiftLocale)initWithCoder:(id)a3
{
  return (_NSSwiftLocale *)_NSSwiftLocale.init(coder:)(a3);
}

- (NSString)variantCode
{
  _NSSwiftLocale *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  _NSSwiftLocale.variantCode.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)collationIdentifier
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 208);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    v9 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSString)groupingSeparator
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 232);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)currencySymbol
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 240);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)quotationBeginDelimiter
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 264);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)quotationEndDelimiter
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 272);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)alternateQuotationBeginDelimiter
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 280);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)alternateQuotationEndDelimiter
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 288);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  swift_unknownObjectRelease();

  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSCharacterSet)exemplarCharacterSet
{
  _NSSwiftLocale *v2;
  void *v4;
  uint64_t v5;

  v2 = self;
  _NSSwiftLocale.exemplarCharacterSet.getter(&v5);

  objc_msgSend(*(id *)(v5 + 16), sel_copy);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  type metadata accessor for NSMorphologyPronoun(0, (unint64_t *)&lazy cache variable for type metadata for NSCharacterSet);
  swift_dynamicCast();
  swift_release();
  return (NSCharacterSet *)v4;
}

- (id)localizedStringForLocaleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  void *v11;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 72);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v11 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)localizedStringForLanguageCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 80);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)localizedStringForScriptCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 96);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)localizedStringForVariantCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 104);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)localizedStringForCalendarIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _NSSwiftLocale *v7;
  Swift::String v8;
  void *object;
  void *v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = (uint64_t)v4;
  v8._object = v6;
  object = _NSSwiftLocale.localizedString(forCalendarIdentifier:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)localizedStringForCollationIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 136);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)localizedStringForCurrencyCode:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 120);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)localizedStringForCurrencySymbol:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 128);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)localizedStringForCollatorIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(id, uint64_t, uint64_t, uint64_t);
  _NSSwiftLocale *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v9 = *(void (**)(id, uint64_t, uint64_t, uint64_t))(v7 + 144);
  v10 = self;
  swift_unknownObjectRetain();
  v9(v4, v6, ObjectType, v7);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (v12)
  {
    v13 = (void *)String._bridgeToObjectiveCImpl()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_numberingSystem
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t *__return_ptr, uint64_t, uint64_t);
  _NSSwiftLocale *v6;
  void *v7;
  uint64_t v9;

  v3 = *(_QWORD *)&self->locale[OBJC_IVAR____NSSwiftLocale_locale];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 312);
  v6 = self;
  swift_unknownObjectRetain();
  v5(&v9, ObjectType, v3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v7 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v7;
}

@end
