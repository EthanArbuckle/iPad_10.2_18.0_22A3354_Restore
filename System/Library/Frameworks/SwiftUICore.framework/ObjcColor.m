@implementation ObjcColor

- (BOOL)isEqual:(id)a3
{
  _TtC7SwiftUI9ObjcColor *v4;
  _TtC7SwiftUI9ObjcColor *v5;
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
  v6 = ObjcColor.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  void (*v4)(_BYTE *);
  _TtC7SwiftUI9ObjcColor *v5;
  Swift::Int v6;
  _BYTE v8[72];

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI9ObjcColor_color);
  Hasher.init(_seed:)();
  v4 = *(void (**)(_BYTE *))(*(_QWORD *)v3 + 136);
  v5 = self;
  v4(v8);
  v6 = Hasher._finalize()();

  return v6;
}

- (_TtC7SwiftUI9ObjcColor)init
{
  _TtC7SwiftUI9ObjcColor *result;

  result = (_TtC7SwiftUI9ObjcColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
