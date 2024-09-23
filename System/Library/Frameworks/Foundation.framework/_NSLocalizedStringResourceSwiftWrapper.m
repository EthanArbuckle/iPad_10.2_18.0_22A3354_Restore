@implementation _NSLocalizedStringResourceSwiftWrapper

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _NSLocalizedStringResourceSwiftWrapper *v5;

  v4 = a3;
  v5 = self;
  _NSLocalizedStringResourceSwiftWrapper.encode(with:)((NSCoder)v4);

}

- (NSString)table
{
  if (*(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40])
    return (NSString *)(id)String._bridgeToObjectiveCImpl()();
  else
    return (NSString *)0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (NSString)defaultValue
{
  return (NSString *)(id)String._bridgeToObjectiveCImpl()();
}

- (id)localizeWithOptions:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _NSLocalizedStringResourceSwiftWrapper *v17;
  id v18;
  void *v19;
  __int128 v21;
  char v22;
  char v23;
  __int128 v24;
  char v25;
  __int128 v26;
  char v27;
  char v28;
  __int128 v29;
  char v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;

  v5 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped);
  v7 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  v9 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 8];
  v8 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 16];
  v11 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 24];
  v10 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 32];
  v12 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40];
  v14 = *(void **)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 64];
  v13 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 72];
  v15 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 96];
  *(_QWORD *)&v31 = v6;
  *((_QWORD *)&v31 + 1) = v7;
  v32 = v9;
  v33 = v8;
  v34 = v11;
  v35 = v10;
  v37 = *(_OWORD *)(v5 + 56);
  v36 = v12;
  v38 = v14;
  v39 = v13;
  v40 = *(_OWORD *)(v5 + 88);
  v41 = v15;
  swift_bridgeObjectRetain();
  v16 = a3;
  v17 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v18 = v14;
  swift_retain();
  swift_retain();
  String.LocalizationOptions.init(nsOptions:)(v16, (uint64_t)&v26);
  v21 = v26;
  v22 = v27;
  v23 = v28;
  v24 = v29;
  v25 = v30;
  specialized String.init(localized:options:)(&v31, &v21);

  v19 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v19;
}

- (id)localize
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v2 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped);
  v4 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  v6 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 8];
  v5 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 16];
  v8 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 24];
  v7 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 32];
  v9 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40];
  v11 = *(void **)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 64];
  v10 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 72];
  v12 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 96];
  *(_QWORD *)&v21 = v3;
  *((_QWORD *)&v21 + 1) = v4;
  v22 = v6;
  v23 = v5;
  v24 = v8;
  v25 = v7;
  v26 = v9;
  v27 = *(_OWORD *)(v2 + 56);
  v28 = v11;
  v29 = v10;
  v30 = *(_OWORD *)(v2 + 88);
  v31 = v12;
  v16 = 0uLL;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v13 = v11;
  swift_retain();
  swift_retain();
  specialized String.init(localized:options:)(&v21, &v16);
  v14 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return v14;
}

- (NSString)key
{
  return (NSString *)(id)String._bridgeToObjectiveCImpl()();
}

- (void)setLocale:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;

  type metadata accessor for _NSSwiftLocale();
  v5 = swift_dynamicCastClass();
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + OBJC_IVAR____NSSwiftLocale_locale);
    v7 = *(_QWORD *)(v5 + OBJC_IVAR____NSSwiftLocale_locale + 8);
    swift_unknownObjectRetain();
  }
  else
  {
    type metadata accessor for _LocaleBridged();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a3;
    v7 = lazy protocol witness table accessor for type CFDictionaryRef and conformance CFDictionaryRef((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (uint64_t (*)(uint64_t))type metadata accessor for _LocaleBridged, (uint64_t)&protocol conformance descriptor for _LocaleBridged);
    v8 = a3;
  }
  v9 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  *((_QWORD *)v9 + 7) = v6;
  *((_QWORD *)v9 + 8) = v7;
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  objc_class *ObjectType;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  objc_super v23;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (char *)self + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped);
  v6 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  v8 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 8];
  v9 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 24];
  v19 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 32];
  v20 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 16];
  v10 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 40];
  v11 = *(void **)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 64];
  v12 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 72];
  v13 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 80];
  v21 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 88];
  v14 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 96];
  v22 = *(_OWORD *)(v5 + 56);
  v15 = (char *)objc_allocWithZone(ObjectType);
  v16 = &v15[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped];
  *(_QWORD *)v16 = v7;
  *((_QWORD *)v16 + 1) = v6;
  *((_QWORD *)v16 + 2) = v8;
  *((_QWORD *)v16 + 3) = v20;
  *((_QWORD *)v16 + 4) = v9;
  *((_QWORD *)v16 + 5) = v19;
  *((_QWORD *)v16 + 6) = v10;
  *(_OWORD *)(v16 + 56) = v22;
  *((_QWORD *)v16 + 9) = v11;
  *((_QWORD *)v16 + 10) = v12;
  *((_QWORD *)v16 + 11) = v13;
  *((_QWORD *)v16 + 12) = v21;
  *((_QWORD *)v16 + 13) = v14;
  v23.receiver = v15;
  v23.super_class = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v17 = v11;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return -[_NSLocalizedStringResourceSwiftWrapper init](&v23, sel_init);
}

- (_NSLocalizedStringResourceSwiftWrapper)initWithCoder:(id)a3
{
  return (_NSLocalizedStringResourceSwiftWrapper *)_NSLocalizedStringResourceSwiftWrapper.init(coder:)(a3);
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_retainAutoreleaseReturnValue(*(id *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped
                                                                        + 64]);
}

- (_NSLocalizedStringResourceSwiftWrapper)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v26;
  __int128 v27;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  if (a4)
  {
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v16 = v15;
    if (a5)
    {
LABEL_3:
      a5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
      v18 = v17;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
    if (a5)
      goto LABEL_3;
  }
  v18 = 0;
LABEL_6:
  type metadata accessor for _NSSwiftLocale();
  v19 = swift_dynamicCastClass();
  if (v19)
  {
    v21 = *(_QWORD *)(v19 + OBJC_IVAR____NSSwiftLocale_locale);
    v20 = *(_QWORD *)(v19 + OBJC_IVAR____NSSwiftLocale_locale + 8);
    v22 = a7;
    swift_unknownObjectRetain();
  }
  else
  {
    type metadata accessor for _LocaleBridged();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a6;
    v20 = lazy protocol witness table accessor for type CFDictionaryRef and conformance CFDictionaryRef((unint64_t *)&lazy protocol witness table cache variable for type _LocaleBridged and conformance _LocaleBridged, (uint64_t (*)(uint64_t))type metadata accessor for _LocaleBridged, (uint64_t)&protocol conformance descriptor for _LocaleBridged);
    v23 = a6;
    v24 = a7;
  }
  *(_QWORD *)&v27 = v21;
  *((_QWORD *)&v27 + 1) = v20;
  URL.init(reference:)(a7, &v26);

  return (_NSLocalizedStringResourceSwiftWrapper *)_NSLocalizedStringResourceSwiftWrapper.init(key:defaultValue:table:locale:bundleURL:)((uint64_t)v11, v13, (uint64_t)v14, v16, (uint64_t)a5, v18, &v27, &v26);
}

- (NSLocale)locale
{
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t (*v4)(uint64_t, uint64_t);
  void *v5;

  v2 = *(_QWORD *)&self->wrapped[OBJC_IVAR____NSLocalizedStringResourceSwiftWrapper_wrapped + 56];
  ObjectType = swift_getObjectType();
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 496);
  swift_unknownObjectRetain();
  v5 = (void *)v4(ObjectType, v2);
  swift_unknownObjectRelease();
  return (NSLocale *)v5;
}

- (NSString)description
{
  _NSLocalizedStringResourceSwiftWrapper *v2;
  Swift::String v3;
  Swift::String v4;
  void *v5;

  v2 = self;
  _StringGuts.grow(_:)(51);
  v3._object = (void *)0x800000018230C070;
  v3._countAndFlagsBits = 0xD000000000000030;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);

  v5 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  _NSLocalizedStringResourceSwiftWrapper *v4;
  _NSLocalizedStringResourceSwiftWrapper *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = _NSLocalizedStringResourceSwiftWrapper.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (_NSLocalizedStringResourceSwiftWrapper)init
{
  _NSLocalizedStringResourceSwiftWrapper *result;

  result = (_NSLocalizedStringResourceSwiftWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
