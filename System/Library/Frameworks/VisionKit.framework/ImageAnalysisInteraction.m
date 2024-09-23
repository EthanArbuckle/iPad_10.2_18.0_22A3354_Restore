@implementation ImageAnalysisInteraction

- (UIView)view
{
  return (UIView *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction), sel_view);
}

- (_TtC9VisionKit24ImageAnalysisInteraction)init
{
  return (_TtC9VisionKit24ImageAnalysisInteraction *)ImageAnalysisInteraction.init()();
}

- (void)willMoveToView:(id)a3
{
  void *v3;
  _TtC9VisionKit24ImageAnalysisInteraction *v4;
  _TtC9VisionKit24ImageAnalysisInteraction *v5;
  _TtC9VisionKit24ImageAnalysisInteraction *v6;
  _TtC9VisionKit24ImageAnalysisInteraction *v7;

  if (!a3)
  {
    v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v7 = self;
    v4 = (_TtC9VisionKit24ImageAnalysisInteraction *)objc_msgSend(v3, sel_view);
    if (v4)
    {
      v5 = v4;
      -[ImageAnalysisInteraction removeInteraction:](v4, sel_removeInteraction_, v3);

      v6 = v5;
    }
    else
    {
      v6 = v7;
    }

  }
}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;
  _TtC9VisionKit24ImageAnalysisInteraction *v6;

  if (a3)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_interaction);
    v6 = self;
    v5 = a3;
    objc_msgSend(v5, sel_addInteraction_, v4);
    sub_20CF67D50(0, &qword_25499BE40);
    objc_msgSend(v4, sel_setWantsAutomaticContentsRectCalculation_, objc_msgSend(v5, sel_isKindOfClass_, swift_getObjCClassFromMetadata()));

  }
}

- (void).cxx_destruct
{

  sub_20CF688DC((uint64_t)self + OBJC_IVAR____TtC9VisionKit24ImageAnalysisInteraction_delegate);
  swift_release();
}

@end
