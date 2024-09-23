@implementation AccountStatusObserver

- (void)dealloc
{
  _TtC14FamilyCircleUI21AccountStatusObserver *v2;

  v2 = self;
  sub_20E016D80();
}

- (void).cxx_destruct
{
  sub_20DE93FC8((uint64_t)self + OBJC_IVAR____TtC14FamilyCircleUI21AccountStatusObserver_accountStore, (uint64_t *)&unk_253D2D058);
}

- (_TtC14FamilyCircleUI21AccountStatusObserver)init
{
  _TtC14FamilyCircleUI21AccountStatusObserver *result;

  result = (_TtC14FamilyCircleUI21AccountStatusObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)accountWasAdded:(void *)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = a1;
  v8 = objc_msgSend(v5, sel_defaultCenter);
  v9 = v8;
  if (qword_253D2DBB0 != -1)
  {
    swift_once();
    v8 = v9;
  }
  objc_msgSend(v8, sel_postNotificationName_object_userInfo_deliverImmediately_, qword_253D2FBE8, 0, 0, 1);

}

@end
