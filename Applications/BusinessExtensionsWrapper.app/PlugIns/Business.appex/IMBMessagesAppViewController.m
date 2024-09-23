@implementation IMBMessagesAppViewController

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  IMBMessagesAppViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100076F6C((uint64_t)v4, (uint64_t)v5);

}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  IMBMessagesAppViewController *v4;

  v4 = self;
  sub_100077138(a3, (uint64_t)v4);

}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  uint64_t v7;
  uint64_t ObjectType;
  double (*v9)(uint64_t, uint64_t, double, double);
  IMBMessagesAppViewController *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController);
  if (v5)
  {
    v7 = *(_QWORD *)&self->featureFlagArbiter[OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController];
    ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.super.super.isa
                                              + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController));
    v9 = *(double (**)(uint64_t, uint64_t, double, double))(v7 + 16);
    v10 = self;
    v11 = v5;
    width = v9(ObjectType, v7, width, height);
    height = v12;

  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (IMBMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (IMBMessagesAppViewController *)sub_100078DC8(v5, v7, a4);
}

- (IMBMessagesAppViewController)initWithCoder:(id)a3
{
  return (IMBMessagesAppViewController *)sub_100078F3C(a3);
}

- (IMBMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  id v6;
  IMBMessagesAppViewController *v7;
  id v8;
  _QWORD *v9;
  objc_super v11;

  v3 = a3;
  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___IMBMessagesAppViewController_featureFlagArbiter);
  v6 = objc_allocWithZone((Class)BCFeatureFlag);
  v7 = self;
  v8 = objc_msgSend(v6, "init");
  v5[3] = sub_1000090C8(0, (unint64_t *)&unk_1000EF180, BCFeatureFlag_ptr);
  v5[4] = &off_1000D71A0;
  *v5 = v8;
  v9 = (Class *)((char *)&v7->super.super.super.super.isa
               + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController);
  *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&v7->super.super.super.super.isa
           + OBJC_IVAR___IMBMessagesAppViewController____lazy_storage___dismissalDelegator) = 0;

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for IMBMessagesAppViewController();
  return -[IMBMessagesAppViewController initWithShouldBeSheetPresentationControllerDelegate:](&v11, "initWithShouldBeSheetPresentationControllerDelegate:", v3);
}

- (void).cxx_destruct
{
  sub_100010C40((Class *)((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR___IMBMessagesAppViewController_featureFlagArbiter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___IMBMessagesAppViewController_embeddedTranscriptViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR___IMBMessagesAppViewController____lazy_storage___dismissalDelegator));
}

@end
