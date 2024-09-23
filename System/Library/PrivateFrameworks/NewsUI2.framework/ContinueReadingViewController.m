@implementation ContinueReadingViewController

- (_TtC7NewsUI229ContinueReadingViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7NewsUI229ContinueReadingViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_relativeTabBarController) = 0;
  v4 = a3;

  result = (_TtC7NewsUI229ContinueReadingViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC7NewsUI229ContinueReadingViewController *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _TtC7NewsUI229ContinueReadingViewController *v37;
  _QWORD v38[3];
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  objc_super v49;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1D60AD4A8();
  MEMORY[0x1E0C80A78](v6);
  v36 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49.receiver = self;
  v49.super_class = ObjectType;
  v8 = self;
  v37 = v8;
  -[AMSUIBaseMessageViewController viewDidAppear:](&v49, sel_viewDidAppear_, v3);
  v9 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler), *(uint64_t *)((char *)&v8->super.super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler));
  v10 = (char *)v8 + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content;
  v11 = *(uint64_t *)((char *)&v8->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v12 = *(_QWORD *)((char *)&v8->super.super.super.super._responderFlags
                  + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v13 = *(FBSSceneIdentityToken **)((char *)&v8->super.super.super.super.__layeringSceneIdentity
                                  + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v14 = *(uint64_t *)((char *)&v8->super.super.super._view
                   + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v15 = *(uint64_t *)((char *)&v8->super.super.super._tabBarItem
                   + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v34 = v14;
  v17 = *((_QWORD *)v10 + 6);
  v16 = *((_QWORD *)v10 + 7);
  v18 = (void *)*((_QWORD *)v10 + 8);
  v33 = *((_QWORD *)v10 + 9);
  v19 = *((_QWORD *)v10 + 10);
  v20 = (void *)*((_QWORD *)v10 + 11);
  v21 = *((_QWORD *)v10 + 12);
  v22 = v10[24];
  v35 = *__swift_project_boxed_opaque_existential_1((_QWORD *)(*v9 + 16), *(_QWORD *)(*v9 + 40));
  v38[0] = v11;
  v38[1] = v12;
  v38[2] = v13;
  v39 = v22;
  v40 = v34;
  v41 = v15;
  v42 = v17;
  v43 = v16;
  v23 = v18;
  v44 = v18;
  v45 = v33;
  v46 = v19;
  v47 = v20;
  v48 = v21;
  swift_bridgeObjectRetain();
  v24 = v13;
  sub_1D6001C0C(v13, v22);
  v25 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26 = v23;
  swift_bridgeObjectRetain();
  sub_1D6001C0C(v24, v22);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27 = v26;
  swift_bridgeObjectRetain();
  v28 = v25;
  v29 = v36;
  sub_1D642600C((uint64_t)v38, v36);
  v30 = type metadata accessor for ContinueReadingPromptExposureData();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 0, 1, v30);
  v31 = v35 + OBJC_IVAR____TtC7NewsUI225ContinueReadingInteractor_exposureData;
  swift_beginAccess();
  sub_1D60AD4FC(v29, v31);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1D6001CB0(v24, v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23[3];
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  objc_super v34;

  v3 = a3;
  v34.receiver = self;
  v34.super_class = (Class)swift_getObjectType();
  v22 = v34.receiver;
  -[ContinueReadingViewController viewDidDisappear:](&v34, sel_viewDidDisappear_, v3);
  v4 = __swift_project_boxed_opaque_existential_1(&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler], *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler + 24]);
  v6 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content];
  v5 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 8];
  v7 = *(void **)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 16];
  v9 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 32];
  v8 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 40];
  v10 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 56];
  v11 = *(void **)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 64];
  v20 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 72];
  v21 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 48];
  v12 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 80];
  v13 = *(void **)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 88];
  v14 = *(_QWORD *)&v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 96];
  v15 = v22[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 24];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*v4 + 16), *(_QWORD *)(*v4 + 40));
  v23[0] = v6;
  v23[1] = v5;
  v23[2] = (uint64_t)v7;
  v24 = v15;
  v25 = v9;
  v26 = v8;
  v27 = v21;
  v28 = v10;
  v16 = v11;
  v29 = v11;
  v30 = v20;
  v31 = v12;
  v32 = v13;
  v33 = v14;
  swift_bridgeObjectRetain();
  v17 = v7;
  sub_1D6001C0C(v7, v15);
  v18 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = v16;
  swift_bridgeObjectRetain();
  sub_1D6CE2DFC(v23, 2);
  swift_bridgeObjectRelease();
  sub_1D6001CB0(v17, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI229ContinueReadingViewController)initWithRequest:(id)a3
{
  id v3;
  _TtC7NewsUI229ContinueReadingViewController *result;

  v3 = a3;
  result = (_TtC7NewsUI229ContinueReadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI229ContinueReadingViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6;
  id v7;
  _TtC7NewsUI229ContinueReadingViewController *result;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = a5;
  result = (_TtC7NewsUI229ContinueReadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI229ContinueReadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI229ContinueReadingViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI229ContinueReadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v4 = *(UINavigationItem **)((char *)&self->super.super.super._navigationItem
                            + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v5 = *(NSString **)((char *)&self->super.super.super._nibName
                    + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  v6 = *((_BYTE *)&self->super.super.super._overrideTransitioningDelegate
       + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  swift_bridgeObjectRelease();
  sub_1D6001CB0(v3, v6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_dialogRequestFactory);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_relativeTabBarController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_styler);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI229ContinueReadingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D60AC9BC((uint64_t)v6, v7);

}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI229ContinueReadingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D60AD014((uint64_t)v6, v7);

}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5;
  _TtC7NewsUI229ContinueReadingViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1D60AD18C();

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC7NewsUI229ContinueReadingViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1D60AD318((uint64_t)v6, a4);

}

- (void)messageViewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC7NewsUI229ContinueReadingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D60ACD60((uint64_t)v4);

}

@end
