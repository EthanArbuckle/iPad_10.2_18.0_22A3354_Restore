@implementation ICPaperDocumentTextAttachmentViewProvider

+ (void)registerIfNecessary
{
  void *v2;

  swift_getObjCClassMetadata();
  v2 = (void *)objc_opt_self();
  objc_msgSend(v2, sel_registerTextAttachmentViewProviderClass_forFileType_, swift_getObjCClassFromMetadata(), *MEMORY[0x1E0D640F0]);
}

- (ICPaperDocumentTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  swift_unknownObjectRetain();
  return (ICPaperDocumentTextAttachmentViewProvider *)sub_1DD9345C4(v9, a4, a5, (uint64_t)a6);
}

- (NSTextLocation)location
{
  NSTextLocation **v3;
  NSTextLocation *v4;
  ICPaperDocumentTextAttachmentViewProvider *v5;
  NSTextLocation *v6;
  ICPaperDocumentTextAttachmentViewProvider *v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR___ICPaperDocumentTextAttachmentViewProvider_updatedLocationForRecycledViewProvider);
  swift_beginAccess();
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for PaperDocumentTextAttachmentViewProvider();
    v7 = self;
    v6 = -[NSTextAttachmentViewProvider location](&v9, sel_location);
  }
  swift_unknownObjectRetain();

  return v6;
}

- (void)setLocation:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___ICPaperDocumentTextAttachmentViewProvider_updatedLocationForRecycledViewProvider);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSTextLocation)updatedLocationForRecycledViewProvider
{
  swift_beginAccess();
  return (NSTextLocation *)(id)swift_unknownObjectRetain();
}

- (void)setUpdatedLocationForRecycledViewProvider:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___ICPaperDocumentTextAttachmentViewProvider_updatedLocationForRecycledViewProvider);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)loadView
{
  ICPaperDocumentTextAttachmentViewProvider *v2;

  v2 = self;
  sub_1DD934A44();

}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(int64_t)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v12;
  ICPaperDocumentTextAttachmentViewProvider *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = self;
  sub_1DD9352CC(a3, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v13;
  ICPaperDocumentTextAttachmentViewProvider *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_1DD9352CC(a5, x, y, width, height);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  swift_unknownObjectRelease();

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
