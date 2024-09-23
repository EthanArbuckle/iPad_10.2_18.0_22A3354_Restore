@implementation CustomizableDocumentViewController

- (_TtC7SwiftUI34CustomizableDocumentViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  _TtC7SwiftUI34CustomizableDocumentViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_cardTitle);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_screenBackground) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_backgroundAccessoryView);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_overlayAccessoryView);
  *v6 = 0;
  v6[1] = 0;
  v7 = a3;

  result = (_TtC7SwiftUI34CustomizableDocumentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_backgroundAccessoryView));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_overlayAccessoryView));
}

@end
