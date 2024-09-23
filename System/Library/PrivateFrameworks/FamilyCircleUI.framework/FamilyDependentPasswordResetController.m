@implementation FamilyDependentPasswordResetController

- (_TtC14FamilyCircleUI38FamilyDependentPasswordResetController)init
{
  _TtC14FamilyCircleUI38FamilyDependentPasswordResetController *result;

  result = (_TtC14FamilyCircleUI38FamilyDependentPasswordResetController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_parentAccount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_ruiController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_serverResourceLoader));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_serverHookHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI38FamilyDependentPasswordResetController_sessionConfiguration));
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC14FamilyCircleUI38FamilyDependentPasswordResetController *v15;

  v10 = _Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_20DEDDAE8;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_20DEDD078(a4, (uint64_t)a5, (void (*)(_QWORD, _QWORD))v10, v11);
  sub_20DEDDAB4((uint64_t)v10);

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC14FamilyCircleUI38FamilyDependentPasswordResetController *v16;
  uint64_t v17;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549F96F8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_20E07B840();
    v12 = sub_20E07B84C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_20E07B84C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_20DEDD2A8(a4, (uint64_t)v11);

  sub_20DE93FC8((uint64_t)v11, &qword_2549F96F8);
}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6;
  id v7;
  _TtC14FamilyCircleUI38FamilyDependentPasswordResetController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_20DEDD6C4((uint64_t)a4);

}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v8;
  id v9;
  _TtC14FamilyCircleUI38FamilyDependentPasswordResetController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_20DEDD7F4((uint64_t)a4, a5);

}

@end
