@implementation GMBypass

+ (BOOL)gmEligibilityBypass
{
  void *v2;
  void *v3;

  if ((sub_1A5BBE504() & 1) == 0)
    return 0;
  if (qword_1ED1107B8 != -1)
    swift_once();
  v2 = (void *)qword_1ED1107B0;
  v3 = (void *)sub_1A5BC9B3C();
  LOBYTE(v2) = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return (char)v2;
}

+ (void)setGMEligibilityBypass:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  if ((sub_1A5BBE504() & 1) != 0)
  {
    if (qword_1ED1107B8 != -1)
      swift_once();
    v3 = (void *)qword_1ED1107B0;
    v4 = (void *)sub_1A5BC9CB0();
    v5 = (id)sub_1A5BC9B3C();
    objc_msgSend(v3, sel_setValue_forKey_, v4, v5);

  }
}

- (_TtC25CloudSubscriptionFeatures8GMBypass)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMBypass();
  return -[GMBypass init](&v3, sel_init);
}

@end
