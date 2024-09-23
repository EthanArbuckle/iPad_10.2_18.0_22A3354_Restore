@implementation MescalSigner.Contract

- (_TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract_bag;
  v5 = self;
  v6 = (void *)sub_1A5F6410C();
  v7 = (void *)sub_1A5F6410C();
  v8 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_bagForProfile_profileVersion_, v6, v7);

  *(Class *)((char *)&self->super.isa + v4) = v8;
  v10.receiver = v5;
  v10.super_class = ObjectType;
  return -[MescalSigner.Contract init](&v10, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract_bag));
}

@end
