@implementation ActivityPickerViewController

- (_TtC14FamilyControls28ActivityPickerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC14FamilyControls28ActivityPickerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController) = 0;
  v4 = a3;

  result = (_TtC14FamilyControls28ActivityPickerViewController *)sub_1DD342A2C();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC14FamilyControls28ActivityPickerViewController *v4;
  id v5;
  uint64_t v6;
  _TtC14FamilyControls28ActivityPickerViewController *v7;

  v3 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  -[ActivityPickerViewController setView:](v4, sel_setView_, v5);
  type metadata accessor for ActivityPickerRemoteViewController();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  v7 = v4;
  sub_1DD30F660((uint64_t)sub_1DD32FFA4, v6);

  swift_release();
}

- (_TtC14FamilyControls28ActivityPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14FamilyControls28ActivityPickerViewController *result;

  v4 = a4;
  result = (_TtC14FamilyControls28ActivityPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14FamilyControls28ActivityPickerViewController_remoteViewController));
}

@end
