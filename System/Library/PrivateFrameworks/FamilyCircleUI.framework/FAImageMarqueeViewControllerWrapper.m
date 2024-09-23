@implementation FAImageMarqueeViewControllerWrapper

- (FAImageMarqueeViewControllerWrapper)initWithFamilyCircle:(id)a3
{
  id v4;
  FAImageMarqueeViewControllerWrapper *v5;
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *v6;
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *impl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAImageMarqueeViewControllerWrapper;
  v5 = -[FAImageMarqueeViewControllerWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = -[FAImageMarqueeViewWrapperImpl initWithFamilyCircle:]([_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl alloc], "initWithFamilyCircle:", v4);
    impl = v5->_impl;
    v5->_impl = v6;

  }
  return v5;
}

- (FAImageMarqueeViewControllerWrapper)initWithMembersToRender:(id)a3 familyCircle:(id)a4
{
  id v6;
  id v7;
  FAImageMarqueeViewControllerWrapper *v8;
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *v9;
  _TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl *impl;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAImageMarqueeViewControllerWrapper;
  v8 = -[FAImageMarqueeViewControllerWrapper init](&v12, sel_init);
  if (v8)
  {
    v9 = -[FAImageMarqueeViewWrapperImpl initWithMembersToRender:familyCircle:]([_TtC14FamilyCircleUI29FAImageMarqueeViewWrapperImpl alloc], "initWithMembersToRender:familyCircle:", v6, v7);
    impl = v8->_impl;
    v8->_impl = v9;

  }
  return v8;
}

- (id)viewController
{
  return -[FAImageMarqueeViewWrapperImpl viewController](self->_impl, "viewController");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
