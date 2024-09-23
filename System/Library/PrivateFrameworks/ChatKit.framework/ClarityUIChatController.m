@implementation ClarityUIChatController

- (void)viewDidLoad
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClarityUIChatController();
  v2 = (char *)v4.receiver;
  -[CKChatController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter, v4.receiver, v4.super_class);
  if (qword_1EE1074F0 != -1)
    swift_once();
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v2, sel_sendCompositionWithNotification_, qword_1EE12E040, 0);

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_synthesizer], sel_setUsesApplicationAudioSession_, 0);
}

- (void)viewDidLayoutSubviews
{
  _TtC7ChatKit23ClarityUIChatController *v2;

  v2 = self;
  sub_18E58B84C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7ChatKit23ClarityUIChatController *v4;

  v4 = self;
  sub_18E58B968(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClarityUIChatController();
  v4 = v7.receiver;
  -[CKChatController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance, v7.receiver, v7.super_class);
  v6 = objc_msgSend(v4, sel_conversation);
  objc_msgSend(v5, sel_removeConversation_, v6);

}

- (void)sendCompositionWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC7ChatKit23ClarityUIChatController *v8;
  uint64_t v9;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  v8 = self;
  sub_18E58BB60();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)shouldDisplayTextEntry
{
  return 0;
}

- (BOOL)shouldShowDoneButton
{
  return 0;
}

- (UIEdgeInsets)navigationBarInsetsWithoutPalette
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_navigationBarTopInset);
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ClarityUIChatController();
  v6 = v9.receiver;
  -[CKChatController setEditing:animated:](&v9, sel_setEditing_animated_, v5, v4);
  v7 = objc_msgSend(v6, sel_navigationController, v9.receiver, v9.super_class);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_setToolbarHidden_animated_, 1, 0);

    v6 = v8;
  }

}

- (CKComposition)composition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClarityUIChatController();
  return -[CKChatController composition](&v3, sel_composition);
}

- (void)setComposition:(id)a3
{
  objc_class *v5;
  id v6;
  _TtC7ChatKit23ClarityUIChatController *v7;
  CKComposition *v8;
  objc_super v9;
  objc_super v10;

  v5 = (objc_class *)type metadata accessor for ClarityUIChatController();
  v10.receiver = self;
  v10.super_class = v5;
  v6 = a3;
  v7 = self;
  v8 = -[CKChatController composition](&v10, sel_composition);
  v9.receiver = v7;
  v9.super_class = v5;
  -[CKChatController setComposition:](&v9, sel_setComposition_, v6);
  sub_18E58C094(v8);

}

- (BOOL)_clickyOrbEnabled
{
  return 0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  sub_18E00F31C(0, &qword_1EE10AA48);
  return (id)sub_18E768AC8();
}

+ (Class)transcriptControllerClass
{
  type metadata accessor for ClarityUIChatController.TranscriptController();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)transcriptCollectionViewController:(id)a3 didScroll:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC7ChatKit23ClarityUIChatController *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  sub_18E58C5CC((uint64_t)v7, x, y);

}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC7ChatKit23ClarityUIChatController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_18E58D1CC(v10);

}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 doubleTappedItemAtIndexPath:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = sub_18E76644C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC7ChatKit23ClarityUIChatController)initWithConversation:(id)a3
{
  id v3;
  _TtC7ChatKit23ClarityUIChatController *v4;

  v3 = a3;
  v4 = (_TtC7ChatKit23ClarityUIChatController *)sub_18E58D30C((uint64_t)v3);

  return v4;
}

- (_TtC7ChatKit23ClarityUIChatController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_18E768984();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC7ChatKit23ClarityUIChatController *)sub_18E58CE9C(v5, v7, a4);
}

- (_TtC7ChatKit23ClarityUIChatController)initWithCoder:(id)a3
{
  return (_TtC7ChatKit23ClarityUIChatController *)sub_18E58D01C(a3);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_clarityUIDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23ClarityUIChatController_synthesizer));
  swift_release();
  swift_release();
}

@end
