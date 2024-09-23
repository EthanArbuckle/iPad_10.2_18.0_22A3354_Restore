@implementation FreezeFramePageFlippingController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)singleTap:(id)a3
{
  void *v5;
  id v6;
  id v7;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v8;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v8 = self;
  v7 = objc_msgSend(v5, sel_defaultCenter);
  if (qword_2540B9F10 != -1)
    swift_once();
  objc_msgSend(v7, sel_postNotificationName_object_, qword_2540BD138, 0);

  sub_227312D90();
}

- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)init
{
  return (_TtC16MagnifierSupport33FreezeFramePageFlippingController *)sub_2273130F8();
}

- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227319094();
}

- (void)didTapPageControl:(id)a3
{
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v4;
  _BYTE v5[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_22758EAB4();
  swift_unknownObjectRelease();
  sub_22731469C((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
}

- (void)loadView
{
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v2;

  v2 = self;
  sub_2273148A0();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v2;

  v2 = self;
  sub_2273149EC();

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v6;

  v5 = a3;
  v6 = self;
  sub_227314D04((uint64_t)a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[FreezeFramePageFlippingController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_227314F08();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v4;

  v4 = self;
  sub_2273155B8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[FreezeFramePageFlippingController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_2274D92BC(0, 0xE000000000000000);

}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v8;

  sub_22730BA80(0, (unint64_t *)&unk_2540B9EB0);
  v6 = sub_22758E3DC();
  v7 = a3;
  v8 = self;
  sub_227319250(v6);

  swift_bridgeObjectRelease();
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  id v9;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v10;

  v9 = a3;
  v10 = self;
  sub_227319724(v9, a4, a6);

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_2273199F0(v7);

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6;
  id v7;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_227319B94(v7);

  return v9;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport33FreezeFramePageFlippingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *result;

  v4 = a4;
  result = (_TtC16MagnifierSupport33FreezeFramePageFlippingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_activePageIndexPath, &qword_2558D57E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController____lazy_storage___pageController));
  swift_bridgeObjectRelease();
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_pageControlPositionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_pageControl));
  swift_bridgeObjectRelease();
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_textOverlayDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController____lazy_storage___textReaderModeButtonItem));
}

- (void)shareButtonAction:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_227316ECC);
}

- (void)textReaderModeButtonAction:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_2273181F4);
}

- (void)handleNoTextDetected
{
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v3;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport33FreezeFramePageFlippingController_textOverlayDelegate, a2))
  {
    v3 = self;
    sub_2274F9FD8();

    swift_unknownObjectRelease();
  }
}

- (void)handleShareFreezeFrameMenuItemActionWithMenuLocation:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MagnifierSupport33FreezeFramePageFlippingController *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_227316390(x, y, width, height);

}

- (void)didActivateCameraTrayShareButton:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_227316ECC);
}

- (void)didActivateCameraTrayReaderButton:(id)a3
{
  sub_2273188BC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *))sub_2273181F4);
}

- (uint64_t)didTapDoneButton:
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_2558D4A20 != -1)
    swift_once();
  v0 = sub_22758CF9C();
  __swift_project_value_buffer(v0, (uint64_t)qword_2558D6188);
  v1 = sub_22758CF84();
  v2 = sub_22758E6B8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2272F4000, v1, v2, "didTapDoneButton", v3, 2u);
    MEMORY[0x2276B3D50](v3, -1, -1);
  }

  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_22758D1A0();
}

@end
