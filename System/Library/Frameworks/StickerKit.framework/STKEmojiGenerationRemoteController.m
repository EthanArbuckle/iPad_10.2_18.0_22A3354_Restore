@implementation STKEmojiGenerationRemoteController

- (id)activityType
{
  void *v2;

  sub_234717754();
  v2 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtP10StickerKit39EmojiGenerationRemoteControllerDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___STKEmojiGenerationRemoteController_delegate;
  swift_beginAccess();
  return (_TtP10StickerKit39EmojiGenerationRemoteControllerDelegate_ *)(id)MEMORY[0x234944A84](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (STKEmojiGenerationRemoteController)initWithNibName:(id)a3 bundle:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  STKEmojiGenerationRemoteController *v11;
  objc_super v13;

  if (a3)
  {
    sub_234717754();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___STKEmojiGenerationRemoteController_searchQuery);
    *v6 = 0;
    v6[1] = 0;
    swift_unknownObjectWeakInit();
    v7 = a4;
    v8 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___STKEmojiGenerationRemoteController_searchQuery);
    *v9 = 0;
    v9[1] = 0;
    swift_unknownObjectWeakInit();
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for EmojiGenerationRemoteController();
  v11 = -[RemoteBaseSceneHostingController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (STKEmojiGenerationRemoteController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_super v7;

  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___STKEmojiGenerationRemoteController_searchQuery);
  *v5 = 0;
  v5[1] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmojiGenerationRemoteController();
  return -[RemoteBaseSceneHostingController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_2345B0C20((uint64_t)self + OBJC_IVAR___STKEmojiGenerationRemoteController_delegate);
}

@end
