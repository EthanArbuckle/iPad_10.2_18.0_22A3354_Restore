@implementation GKMultiplayerPickerAddFriendsSupplementary

+ (NSString)reuseIdentifier
{
  void *v2;

  static GKMultiplayerPickerAddFriendsSupplementary.reuseIdentifier.getter();
  v2 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary *)GKMultiplayerPickerAddFriendsSupplementary.init(frame:)();
}

- (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary)initWithCoder:(id)a3
{
  sub_1AB4C36A4();
}

- (id)addFriendsHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = GKMultiplayerPickerAddFriendsSupplementary.addFriendsHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB4E2494;
  v6[3] = &block_descriptor_8;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setAddFriendsHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB48638C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  GKMultiplayerPickerAddFriendsSupplementary.addFriendsHandler.setter((uint64_t)v4, v5);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary *v2;

  v2 = self;
  GKMultiplayerPickerAddFriendsSupplementary.layoutSubviews()();

}

+ (double)preferredHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4
{
  double v5;
  double v6;

  swift_unknownObjectRetain();
  static GKMultiplayerPickerAddFriendsSupplementary.preferredHeight(fitting:in:)(a4);
  v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary_lockupView));
}

@end
