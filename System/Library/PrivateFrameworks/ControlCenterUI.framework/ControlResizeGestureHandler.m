@implementation ControlResizeGestureHandler

- (void)iconView:(id)a3 resizeGestureRecognizerDidUpdate:(id)a4
{
  id v6;
  void (*v7)(_TtC15ControlCenterUI27ControlResizeGestureHandler *);
  id v8;

  v8 = a3;
  v6 = a4;
  swift_retain();
  switch((unint64_t)objc_msgSend(v6, sel_state))
  {
    case 1uLL:
      sub_1CFBC5E5C();
      v7 = *(void (**)(_TtC15ControlCenterUI27ControlResizeGestureHandler *))self->onBegin;
      if (v7)
      {
        swift_retain();
        v7(self);
        sub_1CFBB8538((uint64_t)v7);
      }
      break;
    case 2uLL:
      sub_1CFBC4484(v6);
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      sub_1CFBC6464();
      break;
    default:
      break;
  }

  swift_release();
}

@end
