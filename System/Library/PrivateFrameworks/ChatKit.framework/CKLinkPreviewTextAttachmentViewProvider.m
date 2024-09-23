@implementation CKLinkPreviewTextAttachmentViewProvider

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  id v9;
  _TtC7ChatKit39CKLinkPreviewTextAttachmentViewProvider *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  sub_18E6B2A38(a5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  swift_unknownObjectRelease();

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)loadView
{
  -[NSTextAttachmentViewProvider setView:](self, sel_setView_, *(Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC7ChatKit39CKLinkPreviewTextAttachmentViewProvider_providedView));
}

- (_TtC7ChatKit39CKLinkPreviewTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v8;
  id v9;
  id v10;
  _TtC7ChatKit39CKLinkPreviewTextAttachmentViewProvider *result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  swift_unknownObjectRetain();
  result = (_TtC7ChatKit39CKLinkPreviewTextAttachmentViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7ChatKit39CKLinkPreviewTextAttachmentViewProvider_providedView));
}

@end
