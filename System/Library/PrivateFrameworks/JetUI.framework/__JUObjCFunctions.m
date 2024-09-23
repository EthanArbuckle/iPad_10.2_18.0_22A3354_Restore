@implementation __JUObjCFunctions

+ (id)placeableForButton:(id)a3
{
  return sub_1AC6A1B48((uint64_t)a1, (uint64_t)a2, a3, &qword_1EEC8A750, 0x1E0DC3518, (uint64_t)&protocol witness table for UIButton);
}

+ (id)placeableForImageView:(id)a3
{
  return sub_1AC6A1B48((uint64_t)a1, (uint64_t)a2, a3, &qword_1EEC8A758, 0x1E0DC3890, (uint64_t)&protocol witness table for UIImageView);
}

+ (id)placeableForLabel:(id)a3
{
  return sub_1AC6A1B48((uint64_t)a1, (uint64_t)a2, a3, (unint64_t *)&unk_1EEC8A760, 0x1E0DC3990, (uint64_t)&protocol witness table for UILabel);
}

- (__JUObjCFunctions)init
{
  __JUObjCFunctions *result;

  result = (__JUObjCFunctions *)sub_1AC726910();
  __break(1u);
  return result;
}

+ (id)makeLoadingViewControllerWithLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  uint64_t *v13;
  id v14;
  objc_super v16;

  v4 = type metadata accessor for JULoadingViewController.PresentationContext(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v7 = sub_1AC72622C();
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = qword_1ED0BDCA0;
  swift_bridgeObjectRetain();
  if (v9 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED0BDD20);
  sub_1AC68BB50(v10, (uint64_t)v6);
  v11 = (objc_class *)type metadata accessor for JULoadingViewController(0);
  v12 = (char *)objc_allocWithZone(v11);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtC5JetUI23JULoadingViewController_label];
  *v13 = v7;
  v13[1] = (uint64_t)a3;
  sub_1AC68BB50((uint64_t)v6, (uint64_t)&v12[OBJC_IVAR____TtC5JetUI23JULoadingViewController_presentationContext]);
  *(_QWORD *)&v12[OBJC_IVAR____TtC5JetUI23JULoadingViewController_pageRenderMetrics] = 0;
  v16.receiver = v12;
  v16.super_class = v11;
  v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC68BB14((uint64_t)v6);
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)traitCollectionForView:(id)a3
{
  return objc_msgSend(a3, sel_traitCollection);
}

+ (id)makeContentUnavailableViewControllerWithError:(id)a3 retryAction:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  id v16;
  objc_super v18;

  v6 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_1AC703CA4;
  }
  else
  {
    v10 = 0;
  }
  v11 = a3;
  sub_1AC6B83FC((uint64_t)v9);
  if (qword_1EEC897E0 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v6, (uint64_t)qword_1EEC8B630);
  sub_1AC702520(v12, (uint64_t)v8);
  v13 = (objc_class *)type metadata accessor for JUContentUnavailableViewController(0);
  v14 = (char *)objc_allocWithZone(v13);
  *(_QWORD *)&v14[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = v11;
  sub_1AC702520((uint64_t)v8, (uint64_t)&v14[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v15 = &v14[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *(_QWORD *)v15 = v9;
  *((_QWORD *)v15 + 1) = v10;
  v18.receiver = v14;
  v18.super_class = v13;
  v16 = objc_msgSendSuper2(&v18, sel_initWithNibName_bundle_, 0, 0);
  sub_1AC7027CC((uint64_t)v8);
  sub_1AC68AD94((uint64_t)v9);

  return v16;
}

@end
