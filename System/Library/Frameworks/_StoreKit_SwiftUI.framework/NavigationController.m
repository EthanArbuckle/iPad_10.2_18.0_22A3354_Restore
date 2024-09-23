@implementation NavigationController

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithCoder:(id)a3
{
  sub_2211F936C();
}

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  sub_2211F950C();
}

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithRootViewController:(id)a3
{
  id v3;

  v3 = a3;
  sub_2211F9540();
}

- (_TtC17_StoreKit_SwiftUI20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_2212F537C();
  v5 = a4;
  sub_2211F9578();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC17_StoreKit_SwiftUI20NavigationController_url;
  v3 = OUTLINED_FUNCTION_11_42();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
