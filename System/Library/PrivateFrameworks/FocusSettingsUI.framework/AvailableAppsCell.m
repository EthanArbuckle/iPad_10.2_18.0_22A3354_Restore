@implementation AvailableAppsCell

- (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell)initWithCoder:(id)a3
{
  return (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell *)sub_21561EDB4(a3);
}

- (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_215688AB0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell *)sub_21561EF34(a3, (uint64_t)a4, v6);
}

- (void)dealloc
{
  _TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell *v2;

  v2 = self;
  sub_21561FA44();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell_stateIconSelectedTintColor));
  sub_215505AD4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell_updateAppIcon));
  swift_release();
  sub_2155FB4A4((uint64_t)self+ OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell_changeObserver);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell____lazy_storage___stateIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell____lazy_storage___appIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell____lazy_storage___appNameLabel));
}

@end
