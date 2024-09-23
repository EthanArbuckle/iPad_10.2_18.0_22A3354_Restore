@implementation SharingAchievementMessage

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return sub_1AB5D34F8(self, (uint64_t)a2, a3, (void (*)(_QWORD *__return_ptr))SharingAchievementMessage.activityViewControllerPlaceholderItem(_:));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return sub_1AB5D3754(self, (uint64_t)a2, a3, a4, (void (*)(_QWORD *__return_ptr))SharingAchievementMessage.activityViewController(_:itemForActivityType:));
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6;
  id v7;
  _TtC12GameCenterUI25SharingAchievementMessage *v8;
  UIActivityType_optional v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  SharingAchievementMessage.activityViewController(_:subjectForActivityType:)((UIActivityViewController *)v8, v9);

  v10 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC12GameCenterUI25SharingAchievementMessage)init
{
  SharingAchievementMessage.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_25_19((uint64_t)self, OBJC_IVAR____TtC12GameCenterUI25SharingAchievementMessage_achievement);
}

@end
