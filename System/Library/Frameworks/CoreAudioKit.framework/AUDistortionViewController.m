@implementation AUDistortionViewController

- (void)viewDidLoad
{
  _TtC12CoreAudioKit26AUDistortionViewController *v2;

  v2 = self;
  sub_2131D28BC();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12CoreAudioKit26AUDistortionViewController *v3;

  v3 = self;
  sub_2131D5844();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _TtC12CoreAudioKit26AUDistortionViewController *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = (void *)objc_opt_self();
  v6 = self;
  v7 = objc_msgSend(v5, sel_defaultCenter);
  objc_msgSend(v7, sel_removeObserver_, v6);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for AUDistortionViewController();
  -[AUAppleViewControllerBase viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);

}

- (void)tabSelectionChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131D3F78);
}

- (void)layoutChangedWithNotification:(id)a3
{
  sub_2131695C8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2131D4140);
}

- (_TtC12CoreAudioKit26AUDistortionViewController)init
{
  return (_TtC12CoreAudioKit26AUDistortionViewController *)sub_2131D4760();
}

- (_TtC12CoreAudioKit26AUDistortionViewController)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit26AUDistortionViewController *)sub_2131D483C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_tabView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_distortionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AUDistortionViewController_v3AU));
}

@end
