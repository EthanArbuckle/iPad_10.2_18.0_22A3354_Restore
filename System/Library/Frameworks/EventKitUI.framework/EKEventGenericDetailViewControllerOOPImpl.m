@implementation EKEventGenericDetailViewControllerOOPImpl

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithHostViewID:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1AF9F7BF0();
  return (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *)EKEventGenericDetailViewControllerOOPImpl.init(hostViewID:)(v3, v4);
}

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithNibName:(id)a3 bundle:(id)a4
{
  char *v5;
  id v6;
  _TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_QWORD *)v5 + 10) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor) = 0;
  v6 = a4;

  result = (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *)sub_1AF9F7EF0();
  __break(1u);
  return result;
}

- (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_OWORD *)v4 + 3) = 0u;
  *((_OWORD *)v4 + 4) = 0u;
  *((_QWORD *)v4 + 10) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor) = 0;
  v5 = a3;

  result = (_TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *)sub_1AF9F7EF0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *v2;

  v2 = self;
  sub_1AF9CFFE0();

}

- (UIColor)oopContentBackgroundColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setOopContentBackgroundColor:(id)a3
{
  _TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AF9D27FC(a3);

}

- (void)leftBarButtonTapped:(id)a3
{
  sub_1AF9D10E4((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AF9C1C38);
}

- (void)rightBarButtonTapped:(id)a3
{
  sub_1AF9D10E4((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AF9C1DEC);
}

- (void)bottomStatusButtonTapped:(int64_t)a3
{
  uint64_t *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl *v16;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  if (v4)
  {
    v6 = v3[9];
    v5 = (void *)v3[10];
    v7 = v3[7];
    v8 = v3[8];
    v10 = v3[5];
    v9 = v3[6];
    v11 = v3[4];
    v14 = v3[3];
    v12 = v3[2];
    v13 = *v3;
    v16 = self;
    sub_1AF9D0A98(v13, v4, v12, v14, v11, v10, v9, v7, v8, v6, v5);
    sub_1AF9C1FA0(a3);
    sub_1AF9D01C8(v13, v4, v12, v14, v11, v10, v9, v7, v8, v6, v5);

  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController));
  sub_1AF9D01C8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tab+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._tabElement+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._navigationItem+ OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView), *(uint64_t *)((char *)&self->super._toolbarItems
               + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView),
    *(void **)((char *)&self->super._title
             + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor));
}

@end
