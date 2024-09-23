@implementation CoordinationDataModel

- (_TtC13HomeDataModel21CoordinationDataModel)init
{
  return (_TtC13HomeDataModel21CoordinationDataModel *)sub_23E1F2468();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel21CoordinationDataModel__currentStateSnapshot;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254332B88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeDataModel21CoordinationDataModel_incomingCoordinationMessagesQueue));
}

+ (_TtC13HomeDataModel21CoordinationDataModel)shared
{
  if (qword_2543327B8 != -1)
    swift_once();
  return (_TtC13HomeDataModel21CoordinationDataModel *)(id)qword_254332710;
}

@end
