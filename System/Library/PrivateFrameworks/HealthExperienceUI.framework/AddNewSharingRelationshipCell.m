@implementation AddNewSharingRelationshipCell

- (void)prepareForReuse
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AddNewSharingRelationshipCell();
  v2 = v4.receiver;
  -[AddNewSharingRelationshipCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = sub_1A98E49A8();
  objc_msgSend(v3, sel_startAnimating, v4.receiver, v4.super_class);

}

- (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell *)sub_1A98E4A94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI29AddNewSharingRelationshipCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell_syncObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell____lazy_storage___activitySpinner) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI29AddNewSharingRelationshipCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell____lazy_storage___activitySpinner));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29AddNewSharingRelationshipCell_item);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI29AddNewSharingRelationshipCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A98E54D8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
