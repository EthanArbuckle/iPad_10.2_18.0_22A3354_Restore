@implementation ImageEditingViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC7MusicUI26ImageEditingViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;
  _TtC7MusicUI26ImageEditingViewController *result;

  if (!a3)
  {
    ObjCClassMetadata = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata();
LABEL_6:
  sub_21D046688(ObjCClassMetadata, v6);
  return result;
}

- (_TtC7MusicUI26ImageEditingViewController)initWithRootViewController:(id)a3
{
  _TtC7MusicUI26ImageEditingViewController *result;

  sub_21D046750(a3);
  return result;
}

- (_TtC7MusicUI26ImageEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC7MusicUI26ImageEditingViewController *result;

  if (a3)
  {
    v5 = sub_21D7C50F4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_21D0467B0(v5, v7, a4);
  return result;
}

- (_TtC7MusicUI26ImageEditingViewController)initWithCoder:(id)a3
{
  _TtC7MusicUI26ImageEditingViewController *result;

  sub_21D04687C(a3);
  return result;
}

@end
