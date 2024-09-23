@implementation ClarityUIChatController.TranscriptController

- (BOOL)wantsDrawerLayout
{
  return 0;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  v2 = v4.receiver;
  -[CKTranscriptCollectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_collectionView, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setShowsVerticalScrollIndicator_, 0);

}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6
{
  double right;
  double bottom;
  double left;
  double top;
  objc_super v14;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  return -[CKTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:](&v14, sel_initWithConversation_delegate_balloonMaxWidth_marginInsets_, a3, a4, a5, top, left, bottom, right);
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 balloonMaxWidth:(double)a5 marginInsets:(UIEdgeInsets)a6 collectionViewSize:(CGSize)a7
{
  double height;
  double width;
  double right;
  double bottom;
  double left;
  double top;
  objc_super v17;

  height = a7.height;
  width = a7.width;
  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  return -[CKTranscriptCollectionViewController initWithConversation:delegate:balloonMaxWidth:marginInsets:collectionViewSize:](&v17, sel_initWithConversation_delegate_balloonMaxWidth_marginInsets_collectionViewSize_, a3, a4, a5, top, left, bottom, right, width, height);
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7
{
  double right;
  double bottom;
  double left;
  double top;
  id v15;
  void *v16;
  _TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController *v17;
  objc_super v19;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  sub_18E00F31C(0, &qword_1EE10AA30);
  sub_18E768AE0();
  v15 = a3;
  swift_unknownObjectRetain();
  v16 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  v17 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:](&v19, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_, v15, a4, v16, a6, top, left, bottom, right);

  swift_unknownObjectRelease();
  return v17;
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithConversation:(id)a3 delegate:(id)a4 notifications:(id)a5 balloonMaxWidth:(double)a6 marginInsets:(UIEdgeInsets)a7 collectionViewSize:(CGSize)a8
{
  double height;
  double width;
  double right;
  double bottom;
  double left;
  double top;
  id v18;
  void *v19;
  _TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController *v20;
  objc_super v22;

  height = a8.height;
  width = a8.width;
  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  sub_18E00F31C(0, &qword_1EE10AA30);
  sub_18E768AE0();
  v18 = a3;
  swift_unknownObjectRetain();
  v19 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  v20 = -[CKTranscriptCollectionViewController initWithConversation:delegate:notifications:balloonMaxWidth:marginInsets:collectionViewSize:](&v22, sel_initWithConversation_delegate_notifications_balloonMaxWidth_marginInsets_collectionViewSize_, v18, a4, v19, a6, top, left, bottom, right, width, height);

  swift_unknownObjectRelease();
  return v20;
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController *v9;
  objc_super v11;

  if (a3)
  {
    sub_18E768984();
    v6 = a4;
    v7 = (void *)sub_18E768954();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  v9 = -[ClarityUIChatController.TranscriptController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtCC7ChatKit23ClarityUIChatControllerP33_95E71DB35453CEDB4FA265025E24F84720TranscriptController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClarityUIChatController.TranscriptController();
  return -[ClarityUIChatController.TranscriptController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
