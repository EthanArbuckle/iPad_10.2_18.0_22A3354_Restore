@implementation AddACWGKeysToExistingHomesOperation

+ (NSPredicate)predicate
{
  return (NSPredicate *)objc_msgSend((id)objc_opt_self(), sel_predicateWithValue_, 1);
}

- (int64_t)qualityOfService
{
  return 17;
}

- (BOOL)mainWithError:(id *)a3
{
  _TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  AddACWGKeysToExistingHomesOperation.main()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_2225964BC();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (HMFFlow)flow
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation_flow);
  swift_beginAccess();
  return (HMFFlow *)*v2;
}

- (void)setFlow:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation_flow);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation)initWithUUID:(id)a3 userData:(id)a4 backGroundOpsManager:(id)a5 scheduledDate:(id)a6 expirationDate:(id)a7 dataSource:(id)a8 dependentOperations:(id)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  _TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation *v23;
  _QWORD v25[2];

  v25[1] = self;
  v11 = (uint64_t)a9;
  v12 = sub_22259660C();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v25 - v16;
  v18 = sub_222596678();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222596648();
  v21 = sub_222596C6C();
  sub_2225965F4();
  sub_2225965F4();
  if (a9)
    v11 = sub_222596F9C();
  v22 = a5;
  swift_unknownObjectRetain();
  v23 = (_TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation *)sub_22191C31C((uint64_t)v20, v21, (uint64_t)v22, (uint64_t)v17, (uint64_t)v15, (uint64_t)a8, v11);
  swift_unknownObjectRelease();

  return v23;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation_flow));
}

@end
