@implementation PDFReplicaBarVisibilityAnimatorForiOS

- (_TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS)init
{
  _TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS *result;

  result = (_TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS_tapGestureRecognizer));
  swift_release();
}

- (void)handleTapGesture
{
  _TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS *v2;

  v2 = self;
  sub_1B9F80D34();

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v4;

  objc_opt_self();
  v4 = (void *)swift_dynamicCastObjCClass();
  return !v4 || objc_msgSend(v4, sel_numberOfTapsRequired) == (id)1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  void *v4;

  objc_opt_self();
  v4 = (void *)swift_dynamicCastObjCClass();
  return !v4 || (uint64_t)objc_msgSend(v4, sel_numberOfTapsRequired) > 1;
}

@end
