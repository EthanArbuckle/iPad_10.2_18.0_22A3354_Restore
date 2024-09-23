@implementation AnnotationViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)sub_100001E10();
}

- (void)dealloc
{
  AnnotationViewController *v2;

  v2 = self;
  sub_100001E20();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___AnnotationViewController_rootController);
  sub_1000055A0(OBJC_IVAR___AnnotationViewController_markupViewController);
  sub_1000055A0(OBJC_IVAR___AnnotationViewController_doneButton);
  sub_1000055A0(OBJC_IVAR___AnnotationViewController__navigationItem);
  sub_1000055A0(OBJC_IVAR___AnnotationViewController_akStream);

}

- (void)viewDidLoad
{
  AnnotationViewController *v2;

  v2 = self;
  sub_100001F1C();

}

- (void)done:(id)a3
{
  AnnotationViewController *v5;
  uint64_t v6;
  AnnotationViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1000031F0();

  sub_1000047B8((uint64_t)v8);
}

- (AnnotationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (AnnotationViewController *)sub_100004254((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100003B80);
}

- (AnnotationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (AnnotationViewController *)sub_100003CB8();
}

- (void)sidecarController:(id)a3 sendOPACKObject:(id)a4
{
  id v6;
  AnnotationViewController *v7;
  uint64_t v8;
  _QWORD v9[4];

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v9, a4);
  v8 = swift_unknownObjectRelease(a4);
  sub_100003DE4(v8, (uint64_t)v9);

  sub_10000456C(v9);
}

- (void)sidecarControllerCancelled:(id)a3
{
  id v4;
  AnnotationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100003F54();

}

@end
