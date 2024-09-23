@implementation LightContentStatusBarEXHostViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  v2 = v6.receiver;
  -[_EXHostViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithConfiguration:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  return -[_EXHostViewController initWithConfiguration:](&v5, sel_initWithConfiguration_, a3);
}

- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_2330568B0();
    v6 = a4;
    v7 = (void *)sub_2330568A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  v9 = -[LightContentStatusBarEXHostViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC25AutomatedDeviceEnrollment41LightContentStatusBarEXHostViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  return -[LightContentStatusBarEXHostViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
