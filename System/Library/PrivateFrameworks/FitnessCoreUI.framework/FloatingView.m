@implementation FloatingView

- (_TtC13FitnessCoreUI12FloatingView)initWithFrame:(CGRect)a3
{
  _TtC13FitnessCoreUI12FloatingView *result;

  FloatingView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC13FitnessCoreUI12FloatingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s13FitnessCoreUI12FloatingViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)handleSelectionGesture:(id)a3
{
  id v4;
  _TtC13FitnessCoreUI12FloatingView *v5;

  v4 = a3;
  v5 = self;
  sub_23C050428(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_animationAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_backgroundVisuallEffectView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI12FloatingView_selectionGestureRecognizer));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

@end
