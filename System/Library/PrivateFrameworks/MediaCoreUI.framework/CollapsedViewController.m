@implementation CollapsedViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[CollapsedViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2412DA58C();
    objc_msgSend(v4, sel_addSubview_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC23CollapsedViewController *v2;

  v2 = self;
  sub_2412DA3F8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC23CollapsedViewController____lazy_storage___miniPlayerContainer));
}

@end
