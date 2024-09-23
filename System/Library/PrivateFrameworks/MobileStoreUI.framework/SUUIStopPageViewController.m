@implementation SUUIStopPageViewController

+ (BOOL)isStopPageEnabledForTabIdentifier:(id)a3
{
  return sub_241EC36B4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE7Enabled3forSbSS_tFZ_0);
}

+ (BOOL)isStopPageBagValueOverrideEnabledForTabIdentifier:(id)a3
{
  return sub_241EC36B4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE23BagValueOverrideEnabled3forSbSS_tFZ_0);
}

- (id)initForTabIdentifier:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artworkDictionary:(id)a7 deeplinkUrl:(id)a8 purchasesUrl:(id)a9 wishlistButtonTitle:(id)a10 showWishlistButton:(BOOL)a11 clientContext:(id)a12
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _TtC13MobileStoreUI26SUUIStopPageViewController *v53;

  v53 = self;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C830);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v44 - v21;
  v23 = sub_241ECB8DC();
  v51 = v24;
  v52 = v23;
  if (a4)
  {
    v25 = sub_241ECB8DC();
    v49 = v26;
    v50 = v25;
    if (a5)
    {
LABEL_3:
      v27 = sub_241ECB8DC();
      v47 = v28;
      v48 = v27;
      goto LABEL_6;
    }
  }
  else
  {
    v49 = 0;
    v50 = 0;
    if (a5)
      goto LABEL_3;
  }
  v47 = 0;
  v48 = 0;
LABEL_6:
  if (a6)
  {
    v29 = sub_241ECB8DC();
    v45 = v30;
    v46 = v29;
    if (!a7)
      goto LABEL_9;
    goto LABEL_8;
  }
  v45 = 0;
  v46 = 0;
  if (a7)
LABEL_8:
    a7 = (id)sub_241ECB87C();
LABEL_9:
  v31 = a8;
  v32 = a9;
  v33 = a10;
  v34 = a12;
  if (v31)
  {
    sub_241ECB7C8();

    v35 = sub_241ECB7E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v22, 0, 1, v35);
  }
  else
  {
    v36 = sub_241ECB7E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v22, 1, 1, v36);
  }
  if (v32)
  {
    sub_241ECB7C8();

    v37 = sub_241ECB7E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v20, 0, 1, v37);
  }
  else
  {
    v38 = sub_241ECB7E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v20, 1, 1, v38);
  }
  if (v33)
  {
    v39 = sub_241ECB8DC();
    v41 = v40;

  }
  else
  {
    v39 = 0;
    v41 = 0;
  }
  v42 = sub_241EC8278(v52, v51, v50, v49, v48, v47, v46, v45, (uint64_t)a7, (uint64_t)v22, (uint64_t)v20, v39, v41, a11, v34);

  return v42;
}

- (_TtC13MobileStoreUI26SUUIStopPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC13MobileStoreUI26SUUIStopPageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView) = 0;
  v4 = a3;

  result = (_TtC13MobileStoreUI26SUUIStopPageViewController *)sub_241ECB9D8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC13MobileStoreUI26SUUIStopPageViewController *v2;

  v2 = self;
  SUUIStopPageViewController.viewDidLoad()();

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  _TtC13MobileStoreUI26SUUIStopPageViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_currentDevice);
  v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6)
    return 30;
  else
    return 2;
}

- (void)viewDidLayoutSubviews
{
  _TtC13MobileStoreUI26SUUIStopPageViewController *v2;

  v2 = self;
  SUUIStopPageViewController.viewDidLayoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC13MobileStoreUI26SUUIStopPageViewController *v6;
  _TtC13MobileStoreUI26SUUIStopPageViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  SUUIStopPageViewController.traitCollectionDidChange(_:)(v8);

}

- (_TtC13MobileStoreUI26SUUIStopPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13MobileStoreUI26SUUIStopPageViewController *result;

  v4 = a4;
  result = (_TtC13MobileStoreUI26SUUIStopPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_241EC8A40((uint64_t)self + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageArtwork, &qword_25718C840);
  sub_241EC8A40((uint64_t)self + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_deeplinkUrl, &qword_25718C830);
  sub_241EC8A40((uint64_t)self + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_purchasesUrl, &qword_25718C830);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_clientContext));
}

@end
