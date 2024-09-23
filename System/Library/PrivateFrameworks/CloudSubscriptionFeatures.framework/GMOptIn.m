@implementation GMOptIn

- (BOOL)isOptedInGlobalDomain
{
  _TtC25CloudSubscriptionFeatures7GMOptIn *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A5B72F14();

  return v3 & 1;
}

- (BOOL)isOptedIn
{
  _TtC25CloudSubscriptionFeatures7GMOptIn *v2;
  char v3;

  v2 = self;
  v3 = sub_1A5B73094();

  return v3 & 1;
}

- (void)setIsOptedIn:(BOOL)a3
{
  _TtC25CloudSubscriptionFeatures7GMOptIn *v4;

  v4 = self;
  sub_1A5B735CC(a3);

}

+ (id)current
{
  id v0;
  objc_class *v1;
  char *v2;
  uint64_t v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  objc_super v9;

  v0 = sub_1A5B74938();
  v1 = (objc_class *)type metadata accessor for GMOptIn();
  v2 = (char *)objc_allocWithZone(v1);
  v3 = OBJC_IVAR____TtC25CloudSubscriptionFeatures7GMOptIn_globalUserDefaults;
  v4 = (void *)objc_opt_self();
  v5 = v2;
  *(_QWORD *)&v2[v3] = objc_msgSend(v4, sel_standardUserDefaults);
  *(_QWORD *)&v5[OBJC_IVAR____TtC25CloudSubscriptionFeatures7GMOptIn_userDefaults] = v0;
  v6 = v0;

  v9.receiver = v5;
  v9.super_class = v1;
  v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

- (_TtC25CloudSubscriptionFeatures7GMOptIn)init
{
  _TtC25CloudSubscriptionFeatures7GMOptIn *result;

  result = (_TtC25CloudSubscriptionFeatures7GMOptIn *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
