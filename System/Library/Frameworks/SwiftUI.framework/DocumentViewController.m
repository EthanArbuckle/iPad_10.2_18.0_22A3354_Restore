@implementation DocumentViewController

- (_TtC7SwiftUI22DocumentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized DocumentViewController.init(coder:)();
}

- (UIDocument)document
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DocumentViewController();
  return -[UIDocumentViewController document](&v3, sel_document);
}

- (void)setDocument:(id)a3
{
  objc_class *v5;
  id v6;
  _TtC7SwiftUI22DocumentViewController *v7;
  UIDocument *v8;
  objc_super v9;
  objc_super v10;

  v5 = (objc_class *)type metadata accessor for DocumentViewController();
  v10.receiver = self;
  v10.super_class = v5;
  v6 = a3;
  v7 = self;
  v8 = -[UIDocumentViewController document](&v10, sel_document);
  v9.receiver = v7;
  v9.super_class = v5;
  -[UIDocumentViewController setDocument:](&v9, sel_setDocument_, v6);
  DocumentViewController.document.didset(v8);

}

- (void)loadView
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DocumentViewController();
  v2 = v4.receiver;
  v3 = -[UIDocumentViewController loadView](&v4, sel_loadView);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x110))(v3);

}

- (void)navigationItemDidUpdate
{
  _TtC7SwiftUI22DocumentViewController *v2;

  v2 = self;
  DocumentViewController.navigationItemDidUpdate()();

}

- (UINavigationItem)navigationItem
{
  _TtC7SwiftUI22DocumentViewController *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = -[DocumentViewController parentViewController](v2, sel_parentViewController);
  if (!v3
    || (v4 = v3, v5 = objc_msgSend(v3, sel_navigationItem), v4, !v5))
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3A48]), sel_init);
  }

  return (UINavigationItem *)v5;
}

- (_TtC7SwiftUI22DocumentViewController)initWithDocument:(id)a3
{
  id v3;
  _TtC7SwiftUI22DocumentViewController *result;

  v3 = a3;
  result = (_TtC7SwiftUI22DocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI22DocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7SwiftUI22DocumentViewController *result;

  v4 = a4;
  result = (_TtC7SwiftUI22DocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  outlined consume of NavigationItemDescription?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI22DocumentViewController_lastNavigationItemDescription), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI22DocumentViewController_lastNavigationItemDescription), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI22DocumentViewController_lastNavigationItemDescription));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI22DocumentViewController_onDocumentClose));
  outlined destroy of AccessibilityValueStorage?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22DocumentViewController_rootModifier, &lazy cache variable for type metadata for RootModifier?);
  swift_release();
  swift_unknownObjectRelease();
}

@end
