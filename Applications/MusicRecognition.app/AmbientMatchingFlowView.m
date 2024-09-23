@implementation AmbientMatchingFlowView

- (_TtC16MusicRecognition23AmbientMatchingFlowView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition23AmbientMatchingFlowView *)sub_10004EDC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC16MusicRecognition23AmbientMatchingFlowView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition23AmbientMatchingFlowView *)sub_10004F764(v3, v4);
}

- (void)appleMusicButtonAction
{
  _TtC16MusicRecognition23AmbientMatchingFlowView *v2;

  v2 = self;
  sub_100050398();

}

- (void)cancelAction
{
  uint64_t v2;
  void (*v3)(uint64_t);
  _TtC16MusicRecognition23AmbientMatchingFlowView *v4;
  uint64_t v5;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_cancellationHandler);
  v2 = *(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_cancellationHandler];
  v4 = self;
  v5 = swift_retain(v2);
  v3(v5);

  swift_release(v2);
}

- (void)retryAction
{
  _TtC16MusicRecognition23AmbientMatchingFlowView *v2;

  v2 = self;
  sub_1000505CC();

}

- (void)displayMatchedMediaItemAction
{
  void *v2;
  uint64_t v3;
  void (*v4)(id);
  _TtC16MusicRecognition23AmbientMatchingFlowView *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchedMediaItem);
  if (v2)
  {
    v4 = *(void (**)(id))((char *)&self->super.super.super.isa
                                   + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_displayMatchedMediaItemHandler);
    v3 = *(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_displayMatchedMediaItemHandler];
    v5 = self;
    v6 = v2;
    swift_retain(v3);
    v4(v6);

    swift_release(v3);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  objc_class *ObjectType;
  void *v9;
  id v10;
  _TtC16MusicRecognition23AmbientMatchingFlowView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  objc_super v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_listeningView)
                + OBJC_IVAR____TtC16MusicRecognition20AmbientListeningView_cancelButton);
  v10 = a4;
  v11 = self;
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v11, x, y);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v9, "bounds");
  v20.x = v13;
  v20.y = v15;
  if (CGRectContainsPoint(v21, v20))
  {
    v16 = objc_msgSend(v9, "hitTest:withEvent:", v10, v13, v15);
  }
  else
  {
    v19.receiver = v11;
    v19.super_class = ObjectType;
    v16 = -[AmbientMatchingFlowView hitTest:withEvent:](&v19, "hitTest:withEvent:", v10, x, y);
  }
  v17 = v16;

  return v17;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_retryHandler]);
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_cancellationHandler]);
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_appleMusicURLHandler]);
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_displayMatchedMediaItemHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_noMatchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView____lazy_storage___ambientSceneAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition23AmbientMatchingFlowView_matchedMediaItem));
}

@end
