@implementation CKFullScreenBalloonViewControllerQuicklook

- (void)showTapbackPicker
{
  CKFullScreenBalloonViewControllerQuicklook *v2;

  v2 = self;
  sub_18E5B1698();

}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  CKFullScreenBalloonViewControllerQuicklook *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE110660);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_18E765F18();
    v8 = sub_18E765F3C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_18E765F3C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_18E5B1CC0((uint64_t)v7);

  sub_18E00FA98((uint64_t)v7, &qword_1EE110660);
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithChatItem:(id)a3 title:(id)a4 interfaceActions:(id)a5 gradientReferenceView:(id)a6 pluginBalloonSnapshot:(id)a7 delegate:(id)a8
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v11 = (uint64_t)a5;
  if (!a4)
  {
    v13 = 0;
    v15 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = sub_18E768984();
  v15 = v14;
  if (v11)
  {
LABEL_3:
    sub_18E5B274C();
    v11 = sub_18E768AE0();
  }
LABEL_4:
  v16 = a3;
  v17 = a6;
  v18 = a7;
  swift_unknownObjectRetain();
  return (CKFullScreenBalloonViewControllerQuicklook *)FullScreenBalloonViewControllerQuicklook.init(chatItem:title:interfaceActions:gradientReferenceView:pluginBalloonSnapshot:delegate:)(a3, v13, v15, v11, a6, a7, (uint64_t)a8);
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithChatItem:(id)a3 gradientReferenceView:(id)a4 delegate:(id)a5
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FullScreenBalloonViewControllerQuicklook();
  return -[CKFullScreenBalloonViewController initWithChatItem:gradientReferenceView:delegate:](&v9, sel_initWithChatItem_gradientReferenceView_delegate_, a3, a4, a5);
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  CKFullScreenBalloonViewControllerQuicklook *v9;
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
  v11.super_class = (Class)type metadata accessor for FullScreenBalloonViewControllerQuicklook();
  v9 = -[CKFullScreenBalloonViewControllerQuicklook initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (CKFullScreenBalloonViewControllerQuicklook)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FullScreenBalloonViewControllerQuicklook();
  return -[CKFullScreenBalloonViewControllerQuicklook initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (BOOL)hideBalloonView
{
  return 1;
}

- (BOOL)wantsWindowedPresentation
{
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

@end
