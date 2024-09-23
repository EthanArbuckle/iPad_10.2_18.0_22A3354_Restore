@implementation IntroductionUIProvider.IntroductionCardContentViewController

- (void)viewDidLoad
{
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  v2 = (char *)v6.receiver;
  -[IntroductionUIProvider.IntroductionCardContentViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  if (v3)
  {
    v4 = *(_QWORD *)&v2[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler
                      + 8];
    v5 = swift_retain(v4);
    v3(v5);
    sub_10000B5A0((uint64_t)v3, v4);
  }

}

- (_TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_class *v6;
  objc_super v8;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler];
  v6 = (objc_class *)type metadata accessor for IntroductionUIProvider.IntroductionCardContentViewController();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[IntroductionUIProvider.IntroductionCardContentViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_10000B5A0(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler], *(_QWORD *)&self->viewDidLoadCompletionHandler[OBJC_IVAR____TtCC21TDGSharingViewService22IntroductionUIProvider37IntroductionCardContentViewController_viewDidLoadCompletionHandler]);
}

@end
