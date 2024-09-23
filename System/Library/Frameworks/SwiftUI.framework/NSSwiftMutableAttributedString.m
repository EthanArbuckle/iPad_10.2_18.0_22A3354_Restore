@implementation NSSwiftMutableAttributedString

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithCoder:(id)a3
{
  _TtC7SwiftUI30NSSwiftMutableAttributedString *result;

  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  @objc NSSwiftAttributedString.init(itemProviderData:typeIdentifier:)((uint64_t)self, (uint64_t)a2, a3, a4);
}

- (int64_t)length
{
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v2;
  int64_t v3;

  v2 = self;
  v3 = NSSwiftMutableAttributedString.length.getter();

  return v3;
}

- (NSString)string
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v3 = type metadata accessor for AttributedString.CharacterView();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEF10];
  MEMORY[0x1E0C80A78](v3, v5);
  v6 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
  swift_beginAccess();
  outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?((uint64_t)v10, (uint64_t)v9, type metadata accessor for _NSSwiftAttributedStringStorage);
  v11 = self;
  AttributedString.characters.getter();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type AttributedString.CharacterView and conformance AttributedString.CharacterView, v4, MEMORY[0x1E0CAEF28]);
  v12 = String.init<A>(_:)();
  v14 = v13;
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v9, type metadata accessor for _NSSwiftAttributedStringStorage);

  v15 = (void *)MEMORY[0x18D75CC88](v12, v14);
  swift_bridgeObjectRelease();
  return (NSString *)v15;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v11;
  void *v12;
  uint64_t v14;

  length = a3.length;
  location = a3.location;
  v6 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
  swift_beginAccess();
  outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?((uint64_t)v10, (uint64_t)v9, type metadata accessor for _NSSwiftAttributedStringStorage);
  v11 = self;
  v12 = (void *)_NSSwiftAttributedStringStorage.attributedSubstring(from:)(location, length);
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v9, type metadata accessor for _NSSwiftAttributedStringStorage);

  return v12;
}

- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;

  v7 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = self;
  if (NSNotFound.getter() == a3 || -[NSSwiftMutableAttributedString length](v11, sel_length) <= 0)
  {
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  }
  else
  {
    v12 = (uint64_t)v11 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?(v12, (uint64_t)v10, type metadata accessor for _NSSwiftAttributedStringStorage);
    _NSSwiftAttributedStringStorage.attributes(at:effectiveRange:)(a3, (uint64_t *)a4);
    outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v10, type metadata accessor for _NSSwiftAttributedStringStorage);
  }

  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)attributesAtIndex:(int64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v9;
  Class isa;

  length = a5.length;
  location = a5.location;
  v9 = self;
  NSSwiftMutableAttributedString.attributes(at:longestEffectiveRange:in:)(a3, a4, location, length);

  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 effectiveRange:(_NSRange *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  char *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v9 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3;
  v14 = self;
  if (NSNotFound.getter() == a4 || -[NSSwiftMutableAttributedString length](v14, sel_length) <= 0)
  {

  }
  else
  {
    v15 = (uint64_t)v14 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?(v15, (uint64_t)v12, type metadata accessor for _NSSwiftAttributedStringStorage);
    _NSSwiftAttributedStringStorage.attribute(_:at:effectiveRange:)(v13, a4, (uint64_t *)a5, &v25);
    outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v12, type metadata accessor for _NSSwiftAttributedStringStorage);

    v16 = v26;
    if (v26)
    {
      v17 = __swift_project_boxed_opaque_existential_1(&v25, v26);
      v18 = *(_QWORD *)(v16 - 8);
      v19 = MEMORY[0x1E0C80A78](v17, v17);
      v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v18 + 16))(v21, v19);
      v22 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      return v22;
    }
  }
  return 0;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  char *v24;
  void *v25;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  length = a6.length;
  location = a6.location;
  v12 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a3;
  v17 = self;
  if (NSNotFound.getter() == a4 || -[NSSwiftMutableAttributedString length](v17, sel_length) <= 0)
  {

  }
  else
  {
    v18 = (uint64_t)v17 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?(v18, (uint64_t)v15, type metadata accessor for _NSSwiftAttributedStringStorage);
    _NSSwiftAttributedStringStorage.attribute(_:at:longestEffectiveRange:in:)(v16, a4, a5, location, length, &v28);
    outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v15, type metadata accessor for _NSSwiftAttributedStringStorage);

    v19 = v29;
    if (v29)
    {
      v20 = __swift_project_boxed_opaque_existential_1(&v28, v29);
      v21 = *(_QWORD *)(v19 - 8);
      v22 = MEMORY[0x1E0C80A78](v20, v20);
      v24 = (char *)&v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v21 + 16))(v24, v22);
      v25 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
      return v25;
    }
  }
  return 0;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v11;
  uint64_t v13;

  v5 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
  swift_beginAccess();
  outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?((uint64_t)v9, (uint64_t)v8, type metadata accessor for _NSSwiftAttributedStringStorage);
  v10 = a3;
  v11 = self;
  LOBYTE(self) = _NSSwiftAttributedStringStorage.isEqual(to:)(v10);
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v8, type metadata accessor for _NSSwiftAttributedStringStorage);

  return self & 1;
}

- (void)enumerateAttributesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length;
  char *location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v15;
  uint64_t v16;
  uint64_t v17;

  length = a3.length;
  location = (char *)a3.location;
  v10 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  _Block_copy(v14);
  v15 = self;
  if (location == (char *)NSNotFound.getter() || -[NSSwiftMutableAttributedString length](v15, sel_length) < 1)
  {
    _Block_release(v14);

    _Block_release(v14);
  }
  else
  {
    v16 = (uint64_t)v15 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?(v16, (uint64_t)v13, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_copy(v14);
    specialized _NSSwiftAttributedStringStorage.enumerateAttributes(in:options:using:)(location, length, (void (*)(char *, uint64_t))a4, (uint64_t)v13, (uint64_t)v14);
    _Block_release(v14);
    outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v13, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_release(v14);

    _Block_release(v14);
  }
}

- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length;
  char *location;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v18;
  uint64_t v19;
  uint64_t v20;

  length = a4.length;
  location = (char *)a4.location;
  v12 = type metadata accessor for _NSSwiftAttributedStringStorage(0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a6);
  _Block_copy(v16);
  v17 = a3;
  v18 = self;
  if (location == (char *)NSNotFound.getter() || -[NSSwiftMutableAttributedString length](v18, sel_length) < 1)
  {
    _Block_release(v16);

    _Block_release(v16);
  }
  else
  {
    v19 = (uint64_t)v18 + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage;
    swift_beginAccess();
    outlined init with copy of _RowVisitationContext<TableDataSourceAdaptor>?(v19, (uint64_t)v15, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_copy(v16);
    specialized _NSSwiftAttributedStringStorage.enumerateAttribute(_:in:options:using:)(v17, location, length, a5, (uint64_t)v15, (uint64_t)v16);
    _Block_release(v16);
    outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v15, type metadata accessor for _NSSwiftAttributedStringStorage);
    _Block_release(v16);

    _Block_release(v16);
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  Swift::Int length;
  Swift::Int location;
  id v7;
  __C::_NSRange v8;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v9 = self;
  v8.location = location;
  v8.length = length;
  NSSwiftMutableAttributedString.replaceCharacters(in:with:)(v8, (NSAttributedString)v7);

}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v10;
  __C::_NSRange v11;
  Swift::String v12;

  length = a3.length;
  location = a3.location;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = self;
  v11.location = location;
  v11.length = length;
  v12._countAndFlagsBits = v7;
  v12._object = v9;
  NSSwiftMutableAttributedString.replaceCharacters(in:with:)(v11, v12);

  swift_bridgeObjectRelease();
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  Swift::Int length;
  char location;
  void *v6;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v8;
  __C::_NSRange v9;
  Swift::OpaquePointer_optional v10;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (a3)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    v6 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v8 = self;
  v10.value._rawValue = v6;
  v10.is_nil = location;
  v9.location = length;
  NSSwiftMutableAttributedString.setAttributes(_:range:)(v10, v9);

  swift_bridgeObjectRelease();
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v9;
  uint64_t inited;
  id v11;
  Class isa;
  _BYTE v13[32];

  length = a5.length;
  location = a5.location;
  v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (location == NSNotFound.getter())
  {

  }
  else
  {
    type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>(0, &lazy cache variable for type metadata for _ContiguousArrayStorage<(NSAttributedStringKey, Any)>, (uint64_t (*)(uint64_t))type metadata accessor for (NSAttributedStringKey, Any), (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_187BF9830;
    *(_QWORD *)(inited + 32) = v8;
    outlined init with copy of Any((uint64_t)v13, inited + 40);
    v11 = v8;
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    -[NSSwiftMutableAttributedString addAttributes:range:](v9, sel_addAttributes_range_, isa, location, length);

  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v7;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v8;
  __C::_NSRange v9;

  length = a4.length;
  location = a4.location;
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9.location = location;
  v9.length = length;
  NSSwiftMutableAttributedString.addAttributes(_:range:)((Swift::OpaquePointer)v7, v9);

  swift_bridgeObjectRelease();
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  void (*length)(char *, uint64_t, uint64_t);
  void (*location)(char *, char *, uint64_t);
  id v7;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v8;

  length = (void (*)(char *, uint64_t, uint64_t))a4.length;
  location = (void (*)(char *, char *, uint64_t))a4.location;
  v7 = a3;
  v8 = self;
  if (location != (void (*)(char *, char *, uint64_t))NSNotFound.getter())
  {
    swift_beginAccess();
    _NSSwiftAttributedStringStorage.remove(key:in:)((uint64_t)v7, location, length);
    swift_endAccess();
    -[NSSwiftMutableAttributedString edited:range:changeInLength:](v8, sel_edited_range_changeInLength_, 1, location, length, 0);
  }

}

- (void)insertAttributedString:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v7;

  v6 = a3;
  v7 = self;
  NSSwiftMutableAttributedString.insert(_:at:)((NSAttributedString)v6, a4);

}

- (void)appendAttributedString:(id)a3
{
  id v4;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v5;

  v4 = a3;
  v5 = self;
  NSSwiftMutableAttributedString.append(_:)((NSAttributedString)v4);

}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  __C::_NSRange v5;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v6;

  length = a3.length;
  location = a3.location;
  v6 = self;
  v5.location = location;
  v5.length = length;
  NSSwiftMutableAttributedString.deleteCharacters(in:)(v5);

}

- (void)setAttributedString:(id)a3
{
  id v4;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v5;

  v4 = a3;
  v5 = self;
  -[NSSwiftMutableAttributedString replaceCharactersInRange:withAttributedString:](v5, sel_replaceCharactersInRange_withAttributedString_, 0, -[NSSwiftMutableAttributedString length](v5, sel_length), v4);

}

- (id)_nsAttributedSubstringFromRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  _TtC7SwiftUI30NSSwiftMutableAttributedString *v5;
  __C::_NSRange v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6.location = location;
  v6.length = length;
  v7 = (void *)NSSwiftMutableAttributedString._nsAttributedSubstring(from:)(v6);

  return v7;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)init
{
  _TtC7SwiftUI30NSSwiftMutableAttributedString *result;

  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithHTML:(id)a3 options:(id)a4 documentAttributes:(id *)a5
{
  @objc NSSwiftAttributedString.init(html:options:documentAttributes:)((uint64_t)self, (uint64_t)a2, a3, a4);
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(fileURL:options:documentAttributes:)();
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(fileURL:options:documentAttributes:)();
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(data:options:documentAttributes:)((uint64_t)self, (uint64_t)a2, a3, a4);
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(__contentsOfMarkdownFileAt:options:baseURL:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5);
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(__markdown:options:baseURL:)((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(__markdownString:options:baseURL:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5);
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithString:(id)a3
{
  _TtC7SwiftUI30NSSwiftMutableAttributedString *result;

  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  _TtC7SwiftUI30NSSwiftMutableAttributedString *result;

  result = (_TtC7SwiftUI30NSSwiftMutableAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI30NSSwiftMutableAttributedString)initWithAttributedString:(id)a3
{
  @objc NSSwiftAttributedString.init(attributedString:)((uint64_t)self, (uint64_t)a2, a3);
}

- (void).cxx_destruct
{
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI30NSSwiftMutableAttributedString__storage, type metadata accessor for _NSSwiftAttributedStringStorage);
}

@end
