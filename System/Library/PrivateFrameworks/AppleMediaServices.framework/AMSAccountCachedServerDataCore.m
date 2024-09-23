@implementation AMSAccountCachedServerDataCore

+ (AMSAccountCachedServerDataCore)sharedInstance
{
  return (AMSAccountCachedServerDataCore *)static AccountCachedServerData.shared.getter();
}

- (id)cancelUpdateBlockFor:(id)a3
{
  AMSAccountCachedServerDataCore *v5;
  void *v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)AccountCachedServerData.cancelUpdateBlock(for:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)dealloc
{
  AMSAccountCachedServerDataCore *v2;

  v2 = self;
  AccountCachedServerData.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___AMSAccountCachedServerDataCore_dataAccessor);
  OUTLINED_FUNCTION_0();
}

- (AMSAccountCachedServerDataCore)init
{
  AccountCachedServerData.init()();
}

- (id)BOOLForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  return sub_18C91D070(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E2527850, (uint64_t)sub_18C9215A8, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))AccountCachedServerData.BOOL(forKey:accountID:updateBlock:));
}

- (id)intForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  return sub_18C91D070(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E2527828, (uint64_t)sub_18C921EE8, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))AccountCachedServerData.int(forKey:accountID:updateBlock:));
}

- (id)stringForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  return sub_18C91D070(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E2527800, (uint64_t)sub_18C921EE8, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))AccountCachedServerData.string(forKey:accountID:updateBlock:));
}

- (id)accountFlagsForAccountID:(id)a3
{
  id v4;
  AMSAccountCachedServerDataCore *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  AccountCachedServerData.accountFlags(forAccountID:)(v4);

  type metadata accessor for AMSAccountFlag(0);
  sub_18C920544();
  sub_18C920580();
  v6 = (void *)sub_18CEC175C();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)setAutoPlayTo:(BOOL)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5
{
  sub_18C91F654(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E25277D8, (uint64_t)&unk_1EE055010);
}

- (void)setPersonalizationTo:(BOOL)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5
{
  sub_18C91F654(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E25277B0, (uint64_t)&unk_1EE055000);
}

- (void)setAccountFlags:(NSDictionary *)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSDictionary *v10;
  AMSAccountIdentity *v11;
  AMSAccountCachedServerDataCore *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_18C869ACC((uint64_t)&unk_1EE054FF0, (uint64_t)v9);
}

@end
