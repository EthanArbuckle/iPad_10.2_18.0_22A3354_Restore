@implementation ImageAnalysisInteractionDelegateProxy

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y;
  double x;
  id v9;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = self;
  LOBYTE(a5) = sub_20CF685BC(a5, x, y);

  return a5 & 1;
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  id v4;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  v5 = self;
  v6 = sub_20CF686A4();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  id v4;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_20CF68784();

  return v6;
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_20CF68830();

  return v6;
}

- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  void (*v12)(void *, _BOOL8, uint64_t, uint64_t);
  id v13;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v14;

  v4 = a4;
  v7 = MEMORY[0x212B99358]((char *)self + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner, a2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v7 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x212B99358](v9))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      v12 = *(void (**)(void *, _BOOL8, uint64_t, uint64_t))(v10 + 40);
      v13 = a3;
      v14 = self;
      v12(v8, v4, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  void (*v12)(void *, _BOOL8, uint64_t, uint64_t);
  id v13;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v14;

  v4 = a4;
  v7 = MEMORY[0x212B99358]((char *)self + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner, a2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v7 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x212B99358](v9))
    {
      v10 = *(_QWORD *)(v9 + 8);
      ObjectType = swift_getObjectType();
      v12 = *(void (**)(void *, _BOOL8, uint64_t, uint64_t))(v10 + 48);
      v13 = a3;
      v14 = self;
      v12(v8, v4, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

- (void)textSelectionDidChangeForImageAnalysisInteraction:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(void *, uint64_t, uint64_t);
  id v11;
  _TtC9VisionKit37ImageAnalysisInteractionDelegateProxy *v12;

  v5 = MEMORY[0x212B99358]((char *)self + OBJC_IVAR____TtC9VisionKit37ImageAnalysisInteractionDelegateProxy_owner, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = v5 + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate;
    swift_beginAccess();
    if (MEMORY[0x212B99358](v7))
    {
      v8 = *(_QWORD *)(v7 + 8);
      ObjectType = swift_getObjectType();
      v10 = *(void (**)(void *, uint64_t, uint64_t))(v8 + 56);
      v11 = a3;
      v12 = self;
      v10(v6, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

- (_TtC9VisionKit37ImageAnalysisInteractionDelegateProxy)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ImageAnalysisInteractionDelegateProxy();
  return -[ImageAnalysisInteractionDelegateProxy init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
