@implementation ClinicalAccountsOverviewDataSourceAndDelegate

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *v11;
  uint64_t v12;

  v6 = sub_1D7B49474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7B49438();
  v10 = a3;
  v11 = self;
  sub_1D7AF87FC(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1D7AFB79C();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1D7B49474();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D7B49438();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1D7AFB80C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *v7;

  if (!a4
    && *(unint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate_accounts) >> 62)
  {
    v6 = a3;
    v7 = self;
    swift_bridgeObjectRetain();
    sub_1D7B4A8A8();

    swift_bridgeObjectRelease();
  }
  return 0;
}

- (_TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate)init
{
  _TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *result;

  result = (_TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate_context));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
