@implementation AnyTextAnimation

- (_TtC7SwiftUI16AnyTextAnimation)init
{
  uint64_t v3;
  _TtC7SwiftUI16AnyTextAnimation *v4;
  objc_class *add64;
  objc_super v7;

  v3 = OBJC_IVAR____TtC7SwiftUI16AnyTextAnimation_id;
  swift_beginAccess();
  v4 = self;
  add64 = (objc_class *)_atomic_fetch_add64();
  swift_endAccess();
  *(Class *)((char *)&self->super.isa + v3) = add64;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AnyTextAnimation();
  return -[AnyTextAnimation init](&v7, sel_init);
}

- (NSString)name
{
  NSString *result;

  result = (NSString *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end
