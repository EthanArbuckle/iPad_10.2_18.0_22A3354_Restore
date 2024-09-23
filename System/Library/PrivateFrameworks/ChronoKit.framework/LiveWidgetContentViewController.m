@implementation LiveWidgetContentViewController

- (_TtC9ChronoKit31LiveWidgetContentViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9ChronoKit31LiveWidgetContentViewController *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference) = 0;
  v4 = a3;

  result = (_TtC9ChronoKit31LiveWidgetContentViewController *)sub_1D26CE1D8();
  __break(1u);
  return result;
}

- (void)dealloc
{
  _TtC9ChronoKit31LiveWidgetContentViewController *v2;

  v2 = self;
  LiveWidgetContentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_widget));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_metrics));
  swift_release();
  swift_release();
  swift_release();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  v4 = v5.receiver;
  -[LiveWidgetContentViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1D26CC1EC();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  v4 = v5.receiver;
  -[LiveWidgetContentViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1D26CC1EC();

}

@end
