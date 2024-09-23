@implementation AdaptivePresentationControllerDelegate

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  sub_10001F658(self, (__n128)xmmword_100081A60, (uint64_t)a2, a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  sub_10001F658(self, (__n128)xmmword_100081A70, (uint64_t)a2, a3);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  sub_10001F658(self, (__n128)xmmword_100081A80, (uint64_t)a2, a3);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7;
  _TtC13PCViewService38AdaptivePresentationControllerDelegate *v8;
  uint64_t v9;
  _QWORD v10[3];

  v10[0] = a3;
  v10[1] = a4;
  v10[2] = a5;
  v7 = a3;
  swift_unknownObjectRetain(a5);
  v8 = self;
  PassthroughSubject.send(_:)(v10);

  swift_unknownObjectRelease(a5, v9);
}

- (_TtC13PCViewService38AdaptivePresentationControllerDelegate)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC13PCViewService38AdaptivePresentationControllerDelegate *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC13PCViewService38AdaptivePresentationControllerDelegate_subject;
  v4 = sub_100004B18(&qword_1000C78A8);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)PassthroughSubject.init()();
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC13PCViewService38AdaptivePresentationControllerDelegate____lazy_storage___publisher) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for AdaptivePresentationControllerDelegate();
  return -[AdaptivePresentationControllerDelegate init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13PCViewService38AdaptivePresentationControllerDelegate_subject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13PCViewService38AdaptivePresentationControllerDelegate____lazy_storage___publisher));
}

@end
