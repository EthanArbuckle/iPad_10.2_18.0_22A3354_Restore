@implementation AirTagErrorViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService25AirTagErrorViewController *v4;

  v4 = self;
  sub_1000DE118(a3);

}

- (_TtC18SharingViewService25AirTagErrorViewController)initWithContentView:(id)a3
{
  id v4;
  _TtC18SharingViewService25AirTagErrorViewController *v5;

  v4 = a3;
  v5 = (_TtC18SharingViewService25AirTagErrorViewController *)sub_1000DEC98((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  uint64_t v3;

  sub_100012F60(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_onDoneAction], *(_QWORD *)&self->onDoneAction[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_onDoneAction]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->onDoneAction[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_message]);
  swift_errorRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_error]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->onDoneAction[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_errorTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->onDoneAction[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_defaultBtnTitle]);
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagErrorViewController_mainController], v3);
}

@end
