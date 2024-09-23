@implementation LoggingCardCarouselLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  _TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  sub_2319315F8((uint64_t)a3, v7);

  sub_23190D608(v7, v7[3]);
  v5 = (void *)sub_231CA2BA4();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes *v4;
  _TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_231CA27D8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_231931720((uint64_t)v8);

  sub_23191BE84((uint64_t)v8);
  return v6 & 1;
}

- (_TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_zoomLevel) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_xTranslationFactor) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35LoggingCardCarouselLayoutAttributes_alphaValue) = (Class)0x3FF0000000000000;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[UICollectionViewLayoutAttributes init](&v5, sel_init);
}

@end
