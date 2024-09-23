@implementation HeaderWithRightAlignedButton

- (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1BC62C680();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton *)HeaderWithRightAlignedButton.init(reuseIdentifier:)(v3, v4);
}

- (_TtC15HealthRecordsUI28HeaderWithRightAlignedButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC537020();
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  _TtC15HealthRecordsUI28HeaderWithRightAlignedButton *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1BC5371C8(a4);
  swift_unknownObjectRelease();

}

- (void)buttonTapped:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC15HealthRecordsUI28HeaderWithRightAlignedButton *v10;

  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_delegate;
  swift_beginAccess();
  if (MEMORY[0x1BCCF37A4](v5))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BC359FDC((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28HeaderWithRightAlignedButton_delegate);
}

@end
