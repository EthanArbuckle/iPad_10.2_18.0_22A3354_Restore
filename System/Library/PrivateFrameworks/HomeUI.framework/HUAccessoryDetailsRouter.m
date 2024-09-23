@implementation HUAccessoryDetailsRouter

- (HUAccessoryDetailsRouter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccessoryDetailsRouter();
  return -[HUAccessoryDetailsRouter init](&v3, sel_init);
}

+ (id)detailsViewFor:(id)a3 navigationController:(id)a4 dismiss:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_1B8F07950;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = a4;
  if ((sub_1B8F074C8() & 1) != 0)
  {
    type metadata accessor for AccessoryDetailsRouter();
    v11 = sub_1B8F069C8(v9, (uint64_t)v7, v8, a4);
  }
  else
  {
    v11 = (uint64_t)sub_1B8F076BC(v9);
  }
  v12 = (void *)v11;
  sub_1B8E6FE50((uint64_t)v7);

  return v12;
}

@end
