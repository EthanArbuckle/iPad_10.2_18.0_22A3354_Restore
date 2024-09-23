@implementation FloatingTabBarController

- (_TtC7NewsUI224FloatingTabBarController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6510FC0();
}

- (void)didReceiveMemoryWarning
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FloatingTabBarController();
  v2 = v3.receiver;
  -[FloatingTabBarController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
  swift_retain();
  sub_1D6E1AE64();

  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI224FloatingTabBarController *v2;

  v2 = self;
  sub_1D6507FF4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FloatingTabBarController();
  v4 = v5.receiver;
  -[FloatingTabBarController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  sub_1D650E4A8();
  sub_1D650E61C();
  sub_1D650E77C();

}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FloatingTabBarController();
  v2 = v3.receiver;
  -[FloatingTabBarController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_1D6507D08();
  sub_1D65084CC();

}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v6;
  _TtC7NewsUI224FloatingTabBarController *v7;
  id v8;
  _TtC7NewsUI224FloatingTabBarController *v9;
  _OWORD v10[2];

  if (a4)
  {
    v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1D6E27D04();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a3;
    v9 = self;
  }
  sub_1D65088B4(a3);

  sub_1D5E828A8((uint64_t)v10, (uint64_t)&qword_1ED5F4F00, MEMORY[0x1E0DEE9B8] + 8, (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD))sub_1D5E76DF0);
}

- (_TtC7NewsUI224FloatingTabBarController)initWithTabs:(id)a3
{
  _TtC7NewsUI224FloatingTabBarController *result;

  result = (_TtC7NewsUI224FloatingTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI224FloatingTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI224FloatingTabBarController *result;

  v4 = a4;
  result = (_TtC7NewsUI224FloatingTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);

  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1D5E828A8((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_layoutCoordinator, (uint64_t)&qword_1ED630750, (uint64_t)&unk_1ED630740, (uint64_t)&protocol descriptor for FloatingTabBarLayoutCoordinatorType, (uint64_t (*)(_QWORD))sub_1D5EE93F4);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_presentationContextCache;
  sub_1D6510B84();
  v5 = v4;
  v6 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_stagedModalContextCache, v5);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_overlayToolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController____lazy_storage___intrinsicTabBar));
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI224FloatingTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D650ADF0((uint64_t)v6, v7);

}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  char *v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  _TtC7NewsUI224FloatingTabBarController *v10;

  sub_1D6E26D80();
  v6 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate))
  {
    v7 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 56);
    v9 = a3;
    v10 = self;
    v8();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI224FloatingTabBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D6507D08();

}

- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5
{
  id v7;
  id v8;
  _TtC7NewsUI224FloatingTabBarController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  swift_retain();
  sub_1D6E1A618();

  swift_release();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  char *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  id v13;
  id v14;
  _TtC7NewsUI224FloatingTabBarController *v15;

  v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(void))(v10 + 8);
    v12 = a3;
    v13 = a4;
    v14 = a5;
    v15 = self;
    v11();

    swift_unknownObjectRelease();
  }
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  char *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  id v13;
  id v14;
  _TtC7NewsUI224FloatingTabBarController *v15;

  v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(void))(v10 + 16);
    v12 = a3;
    v13 = a4;
    v14 = a5;
    v15 = self;
    v11();

    swift_unknownObjectRelease();
  }
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5
{
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  id v12;
  id v13;
  id v14;
  _TtC7NewsUI224FloatingTabBarController *v15;
  void *v16;

  v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(uint64_t (**)(void))(v10 + 24);
    v12 = a3;
    v13 = a4;
    v14 = a5;
    v15 = self;
    v16 = (void *)v11();

    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  id v12;
  id v13;
  id v14;
  _TtC7NewsUI224FloatingTabBarController *v15;
  void *v16;

  v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(uint64_t (**)(void))(v10 + 32);
    v12 = a3;
    v13 = a4;
    v14 = a5;
    v15 = self;
    v16 = (void *)v11();

    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
  sub_1D650B7CC(self, (uint64_t)a2, a3, a4, a5, MEMORY[0x1E0DBBDB0]);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
  sub_1D650B7CC(self, (uint64_t)a2, a3, a4, a5, MEMORY[0x1E0DBBDA8]);
}

- (BOOL)tabBarController:(id)a3 shouldSelectTab:(id)a4
{
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  id v10;
  id v11;
  _TtC7NewsUI224FloatingTabBarController *v12;
  char v13;

  v7 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    v8 = *((_QWORD *)v7 + 1);
    swift_getObjectType();
    v9 = *(uint64_t (**)(void))(v8 + 112);
    v10 = a3;
    v11 = a4;
    v12 = self;
    v13 = v9();

    swift_unknownObjectRelease();
  }
  else
  {
    v13 = 1;
  }
  return v13 & 1;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI224FloatingTabBarController *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  char v15;
  char v16;
  uint64_t v17;
  void *v18;
  _TtC7NewsUI224FloatingTabBarController *v19;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[FloatingTabBarController selectedIndex](v8, sel_selectedIndex);
  v10 = -[FloatingTabBarController viewControllers](v8, sel_viewControllers);
  if (v10)
  {
    v11 = v10;
    sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4390);
    v12 = sub_1D6E26D80();

    sub_1D6B1F3FC((uint64_t)v7, v12);
    v14 = v13;
    v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0 && v9 == v14)
    {
      type metadata accessor for FloatingTabBarNavigationController();
      v17 = swift_dynamicCastClass();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = (_TtC7NewsUI224FloatingTabBarController *)v7;
        sub_1D650B140((uint64_t)v19, v18);

        v8 = v19;
      }
    }
  }

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  _QWORD *v4;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_previousSelectedElementIdentifier);
  *v4 = 0;
  v4[1] = 0;
  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  _TtC7NewsUI224FloatingTabBarController *v12;

  v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_searchElementIdentifier);
  v4 = *(_QWORD *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_searchElementIdentifier);
  v6 = a3;
  v12 = self;
  v7 = -[FloatingTabBarController viewControllers](v12, sel_viewControllers);
  if (v7)
  {
    v8 = v7;
    sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4390);
    v9 = sub_1D6E26D80();

    swift_bridgeObjectRetain();
    v10 = sub_1D651055C(v9, v5, v4);
    LOBYTE(v8) = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
      -[FloatingTabBarController setSelectedIndex:](v12, sel_setSelectedIndex_, v10);
  }
  sub_1D650BAAC(v6);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC7NewsUI224FloatingTabBarController *v10;

  v6 = sub_1D6E26978();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1D6511750(v6, v8);

  swift_bridgeObjectRelease();
}

- (NSArray)keyCommands
{
  _TtC7NewsUI224FloatingTabBarController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1D650EFEC();

  if (v3)
  {
    sub_1D5E6F04C(0, (unint64_t *)&unk_1ED5F4200);
    v4 = (void *)sub_1D6E26D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)keyCommandToggleSidebar
{
  _TtC7NewsUI224FloatingTabBarController *v2;
  id v3;
  unsigned int v4;
  id v5;

  v2 = self;
  v5 = -[FloatingTabBarController _uip_sidebar](v2, sel__uip_sidebar);
  v3 = -[FloatingTabBarController _uip_sidebar](v2, sel__uip_sidebar);
  v4 = objc_msgSend(v3, sel__isVisible);

  objc_msgSend(v5, sel__setVisible_, v4 ^ 1);
}

- (void)keyCommandOpenNewWindow
{
  id v0;
  id v1;
  void *v2;
  id v3;
  _QWORD v4[6];

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3BD0]), sel_init);
  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v4[4] = sub_1D650F258;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1D5E78658;
  v4[3] = &block_descriptor_9_6;
  v2 = _Block_copy(v4);
  v3 = v0;
  objc_msgSend(v1, sel_requestSceneSessionActivation_userActivity_options_errorHandler_, 0, 0, v3, v2);
  _Block_release(v2);

}

@end
