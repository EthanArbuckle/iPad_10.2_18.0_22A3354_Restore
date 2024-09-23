@implementation AccountsUIModel

- (_TtP8Settings20SettingsHostProtocol_)settingsHost
{
  swift_beginAccess();
  return (_TtP8Settings20SettingsHostProtocol_ *)(id)swift_unknownObjectRetain();
}

- (void)setSettingsHost:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel_settingsHost);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC18AccountsUISettings15AccountsUIModel)init
{
  return (_TtC18AccountsUISettings15AccountsUIModel *)AccountsUIModel.init()();
}

- (void)willSelect:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC18AccountsUISettings15AccountsUIModel *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

- (void)accountWasAdded:(id)a3
{
  _TtC18AccountsUISettings15AccountsUIModel *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_235DEAEF0(v5, 0);

}

- (void)accountWasRemoved:(id)a3
{
  _TtC18AccountsUISettings15AccountsUIModel *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_235DEAEF0(v5, 1);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__selectedAccount;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25429C1E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addAccountShown;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1C8);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__addOtherShown, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__deleteAccountShown, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__contactMergeAlertShown, v6);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__detailsPaneShown, v6);
  v8 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountSetupView;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C170);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__persistentDetailModel;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C148);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountView;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C160);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v7((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__showsAccountFooterView, v6);
  v14 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountGroups;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C188);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accountPath;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel____lazy_storage___monitoredStore));
  v18 = (char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__accounts;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429C1B8);
  v20 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8);
  v20(v18, v19);
  v20((char *)self + OBJC_IVAR____TtC18AccountsUISettings15AccountsUIModel__filteredAccounts, v19);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
