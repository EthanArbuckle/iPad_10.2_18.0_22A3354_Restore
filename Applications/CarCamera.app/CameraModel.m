@implementation CameraModel

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC9CarCamera11CameraModel *v5;

  v4 = a3;
  v5 = self;
  sub_10000F8EC();

}

- (void)cameraGeneralService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v6;
  _TtC9CarCamera11CameraModel *v7;

  v6 = a3;
  v7 = self;
  sub_10000FACC(v6, a4);

}

- (void)cameraGeneralService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v6;
  _TtC9CarCamera11CameraModel *v7;

  v6 = a3;
  v7 = self;
  sub_10000A40C((uint64_t)v6, a4);

}

- (void)cameraButtonService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v6;
  _TtC9CarCamera11CameraModel *v7;

  v6 = a3;
  v7 = self;
  sub_10000FCA4(a4);

}

- (void)cameraButtonService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v6;
  _TtC9CarCamera11CameraModel *v7;

  v6 = a3;
  v7 = self;
  sub_10000FDB4(a4);

}

- (void)cameraButtonService:(id)a3 didUpdateChildrenIdentifiers:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9CarCamera11CameraModel *v8;

  if (a4)
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_10000A81C(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)cameraButtonService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4
{
  id v6;
  _TtC9CarCamera11CameraModel *v7;

  v6 = a3;
  v7 = self;
  sub_10000B100(v6, a4);

}

- (_TtC9CarCamera11CameraModel)init
{
  _TtC9CarCamera11CameraModel *result;

  result = (_TtC9CarCamera11CameraModel *)_swift_stdlib_reportUnimplementedInitializer("CarCamera.CameraModel", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__cameraCloseButton;
  v4 = sub_10000383C(&qword_100032E90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__visibleButtons;
  v6 = sub_10000383C(&qword_100032E88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9CarCamera11CameraModel__submenuParentIdentifier;
  v8 = sub_10000383C(&qword_100032E80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9CarCamera11CameraModel_layoutController));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
