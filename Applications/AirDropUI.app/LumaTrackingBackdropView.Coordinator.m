@implementation LumaTrackingBackdropView.Coordinator

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  void (*v4)(unint64_t);
  uint64_t v7;
  id v8;

  v4 = *(void (**)(unint64_t))self->onBackgroundLumaChanged;
  if (v4)
  {
    v7 = *(_QWORD *)&self->onBackgroundLumaChanged[8];
    v8 = a3;
    swift_retain(self);
    sub_100027028((uint64_t)v4, v7);
    v4(a4);
    sub_100026F80((uint64_t)v4, v7);

    swift_release(self);
  }
}

@end
