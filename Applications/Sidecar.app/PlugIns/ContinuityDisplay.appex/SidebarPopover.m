@implementation SidebarPopover

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17ContinuityDisplay14SidebarPopover)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001E920();
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (void)loadView
{
  _TtC17ContinuityDisplay14SidebarPopover *v2;

  v2 = self;
  sub_10001E9E4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC17ContinuityDisplay14SidebarPopover *v4;

  v4 = self;
  sub_10001EEF4(a3);

}

- (_TtC17ContinuityDisplay14SidebarPopover)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10001EFF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay14SidebarPopover_titleField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay14SidebarPopover_detailsField));
}

@end
