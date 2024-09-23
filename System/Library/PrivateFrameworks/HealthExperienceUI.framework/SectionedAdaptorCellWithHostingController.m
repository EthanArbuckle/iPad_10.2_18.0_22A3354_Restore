@implementation SectionedAdaptorCellWithHostingController

- (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController)initWithFrame:(CGRect)a3
{
  char *v3;
  _TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *result;

  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_item;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;

  result = (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A969BB3C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  id *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SectionedAdaptorCellWithHostingController();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[SectionedAdaptorCellWithHostingController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v5);
  v6 = (id *)&v4[OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_hostingController];
  swift_beginAccess();
  v7 = objc_msgSend(*v6, sel_view);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_invalidateIntrinsicContentSize);

  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41SectionedAdaptorCellWithHostingController_hostingController));
}

@end
