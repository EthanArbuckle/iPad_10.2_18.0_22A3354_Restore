@implementation MatchingFlowCustomView

- (_TtC16MusicRecognition22MatchingFlowCustomView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicRecognition22MatchingFlowCustomView *)sub_100082454(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC16MusicRecognition22MatchingFlowCustomView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC16MusicRecognition22MatchingFlowCustomView *)sub_100082C78(v3, v4);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_retryHandler]);
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_cancellationHandler]);
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_appleMusicURLHandler]);
  swift_release(*(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_displayMatchedMediaItemHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_matchedMediaItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_listeningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_matchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_noMatchView));
}

- (void)appleMusicButtonAction
{
  _TtC16MusicRecognition22MatchingFlowCustomView *v2;

  v2 = self;
  sub_10008364C();

}

- (void)cancelAction
{
  sub_10008384C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_cancellationHandler);
}

- (void)retryAction
{
  sub_10008384C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_retryHandler);
}

- (void)displayMatchedMediaItemAction
{
  void *v2;
  uint64_t v3;
  void (*v4)(id);
  _TtC16MusicRecognition22MatchingFlowCustomView *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_matchedMediaItem);
  if (v2)
  {
    v4 = *(void (**)(id))((char *)&self->super.super.super.isa
                                   + OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_displayMatchedMediaItemHandler);
    v3 = *(_QWORD *)&self->retryHandler[OBJC_IVAR____TtC16MusicRecognition22MatchingFlowCustomView_displayMatchedMediaItemHandler];
    v5 = self;
    v6 = v2;
    swift_retain(v3);
    v4(v6);

    swift_release(v3);
  }
}

@end
