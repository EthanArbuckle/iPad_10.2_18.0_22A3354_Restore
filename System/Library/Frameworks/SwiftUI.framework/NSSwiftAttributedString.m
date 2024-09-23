@implementation NSSwiftAttributedString

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithCoder:(id)a3
{
  _TtC7SwiftUI23NSSwiftAttributedString *result;

  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  @objc NSSwiftAttributedString.init(itemProviderData:typeIdentifier:)((uint64_t)self, (uint64_t)a2, a3, a4);
}

- (NSString)string
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  _TtC7SwiftUI23NSSwiftAttributedString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = type metadata accessor for AttributedString.CharacterView();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEF10];
  MEMORY[0x1E0C80A78](v3, v5);
  v6 = self;
  AttributedString.characters.getter();
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey(&lazy protocol witness table cache variable for type AttributedString.CharacterView and conformance AttributedString.CharacterView, v4, MEMORY[0x1E0CAEF28]);
  v7 = String.init<A>(_:)();
  v9 = v8;

  v10 = (void *)MEMORY[0x18D75CC88](v7, v9);
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC7SwiftUI23NSSwiftAttributedString *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = (void *)_NSSwiftAttributedStringStorage.attributedSubstring(from:)(location, length);

  return v6;
}

- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  _TtC7SwiftUI23NSSwiftAttributedString *v6;
  Class isa;

  v6 = self;
  if (NSNotFound.getter() == a3 || (uint64_t)-[NSSwiftAttributedString length](v6, sel_length) <= 0)
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  else
    _NSSwiftAttributedStringStorage.attributes(at:effectiveRange:)(a3, (uint64_t *)a4);

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
  _TtC7SwiftUI23NSSwiftAttributedString *v9;
  Class isa;
  NSRange v12;

  length = a5.length;
  location = a5.location;
  v9 = self;
  if (NSNotFound.getter() == a3 || (uint64_t)-[NSSwiftAttributedString length](v9, sel_length) <= 0)
  {
    specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  }
  else
  {
    _NSSwiftAttributedStringStorage.attributes(at:effectiveRange:)(a3, (uint64_t *)a4);
    if (a4)
    {
      v12.location = location;
      v12.length = length;
      *a4 = NSIntersectionRange(*a4, v12);
    }
  }

  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSAttributedStringKey and conformance NSAttributedStringKey, (uint64_t (*)(uint64_t))type metadata accessor for NSAttributedStringKey, (uint64_t)&protocol conformance descriptor for NSAttributedStringKey);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8;
  _TtC7SwiftUI23NSSwiftAttributedString *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  __int128 v18;
  uint64_t v19;

  v8 = a3;
  v9 = self;
  if (NSNotFound.getter() == a4 || (uint64_t)-[NSSwiftAttributedString length](v9, sel_length) <= 0)
  {

  }
  else
  {
    _NSSwiftAttributedStringStorage.attribute(_:at:effectiveRange:)(v8, a4, (uint64_t *)a5, &v18);

    v10 = v19;
    if (v19)
    {
      v11 = __swift_project_boxed_opaque_existential_1(&v18, v19);
      v12 = *(_QWORD *)(v10 - 8);
      v13 = MEMORY[0x1E0C80A78](v11, v11);
      v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v12 + 16))(v15, v13);
      v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
      return v16;
    }
  }
  return 0;
}

- (id)attribute:(id)a3 atIndex:(int64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  _TtC7SwiftUI23NSSwiftAttributedString *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  char *v18;
  void *v19;
  __int128 v21;
  uint64_t v22;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v12 = self;
  if (NSNotFound.getter() == a4 || (uint64_t)-[NSSwiftAttributedString length](v12, sel_length) <= 0)
  {

  }
  else
  {
    _NSSwiftAttributedStringStorage.attribute(_:at:longestEffectiveRange:in:)(v11, a4, a5, location, length, &v21);

    v13 = v22;
    if (v22)
    {
      v14 = __swift_project_boxed_opaque_existential_1(&v21, v22);
      v15 = *(_QWORD *)(v13 - 8);
      v16 = MEMORY[0x1E0C80A78](v14, v14);
      v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v15 + 16))(v18, v16);
      v19 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v21);
      return v19;
    }
  }
  return 0;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  id v4;
  _TtC7SwiftUI23NSSwiftAttributedString *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = _NSSwiftAttributedStringStorage.isEqual(to:)(v4);

  return v6 & 1;
}

- (void)enumerateAttributesInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length;
  char *location;
  void *v9;
  _TtC7SwiftUI23NSSwiftAttributedString *v10;
  uint64_t v11;

  length = a3.length;
  location = (char *)a3.location;
  v9 = _Block_copy(a5);
  _Block_copy(v9);
  v10 = self;
  if (location != (char *)NSNotFound.getter() && (uint64_t)-[NSSwiftAttributedString length](v10, sel_length) > 0)
  {
    v11 = (uint64_t)v10 + OBJC_IVAR____TtC7SwiftUI23NSSwiftAttributedString__storage;
    _Block_copy(v9);
    specialized _NSSwiftAttributedStringStorage.enumerateAttributes(in:options:using:)(location, length, (void (*)(char *, uint64_t))a4, v11, (uint64_t)v9);
    _Block_release(v9);
  }
  _Block_release(v9);

  _Block_release(v9);
}

- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  NSUInteger length;
  char *location;
  void *v11;
  id v12;
  _TtC7SwiftUI23NSSwiftAttributedString *v13;
  uint64_t v14;

  length = a4.length;
  location = (char *)a4.location;
  v11 = _Block_copy(a6);
  _Block_copy(v11);
  v12 = a3;
  v13 = self;
  if (location != (char *)NSNotFound.getter() && (uint64_t)-[NSSwiftAttributedString length](v13, sel_length) > 0)
  {
    v14 = (uint64_t)v13 + OBJC_IVAR____TtC7SwiftUI23NSSwiftAttributedString__storage;
    _Block_copy(v11);
    specialized _NSSwiftAttributedStringStorage.enumerateAttribute(_:in:options:using:)(v12, location, length, a5, v14, (uint64_t)v11);
    _Block_release(v11);
  }
  _Block_release(v11);

  _Block_release(v11);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)init
{
  _TtC7SwiftUI23NSSwiftAttributedString *result;

  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithHTML:(id)a3 options:(id)a4 documentAttributes:(id *)a5
{
  @objc NSSwiftAttributedString.init(html:options:documentAttributes:)((uint64_t)self, (uint64_t)a2, a3, a4);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithFileURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(fileURL:options:documentAttributes:)();
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithURL:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(fileURL:options:documentAttributes:)();
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(data:options:documentAttributes:)((uint64_t)self, (uint64_t)a2, a3, a4);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithContentsOfMarkdownFileAtURL:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(__contentsOfMarkdownFileAt:options:baseURL:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithMarkdown:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(__markdown:options:baseURL:)((uint64_t)self, (uint64_t)a2, a3, a4, a5);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithMarkdownString:(id)a3 options:(id)a4 baseURL:(id)a5 error:(id *)a6
{
  @objc NSSwiftAttributedString.init(__markdownString:options:baseURL:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5);
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithString:(id)a3
{
  _TtC7SwiftUI23NSSwiftAttributedString *result;

  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  _TtC7SwiftUI23NSSwiftAttributedString *result;

  result = (_TtC7SwiftUI23NSSwiftAttributedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23NSSwiftAttributedString)initWithAttributedString:(id)a3
{
  @objc NSSwiftAttributedString.init(attributedString:)((uint64_t)self, (uint64_t)a2, a3);
}

- (void).cxx_destruct
{
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23NSSwiftAttributedString__storage, type metadata accessor for _NSSwiftAttributedStringStorage);
}

@end
