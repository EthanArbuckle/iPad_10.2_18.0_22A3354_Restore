@implementation MainButton

- (_TtC12MobileSafari10MainButton)initWithCoder:(id)a3
{
  id v4;
  _TtC12MobileSafari10MainButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC12MobileSafari10MainButton_cornerRadius) = 0;
  v4 = a3;

  result = (_TtC12MobileSafari10MainButton *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC12MobileSafari10MainButton *v7;
  objc_super v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFE97A0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for MainButton();
  v8.receiver = self;
  v8.super_class = v6;
  v7 = self;
  -[MainButton updateConfiguration](&v8, sel_updateConfiguration);
  sub_18BABCB58(v7, (uint64_t)v5);
  sub_18BAC15C4();

}

- (_TtC12MobileSafari10MainButton)initWithFrame:(CGRect)a3
{
  _TtC12MobileSafari10MainButton *result;

  result = (_TtC12MobileSafari10MainButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
