@implementation FormatBorderLayer

- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[FormatBorderLayer init](&v3, sel_init);
}

- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer *v6;
  objc_super v8;
  _QWORD v9[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1BB873B64();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = sub_1BB874380();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[FormatBorderLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC8NewsFeedP33_777F7CE0D0BB06B491F265B7F8694DA417FormatBorderLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[FormatBorderLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
