@implementation ICLockedTextAttachmentView

- (ICLockedTextAttachmentView)initWithFrame:(CGRect)a3 textAttachment:(id)a4 textContainer:(id)a5 forManualRendering:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  return (ICLockedTextAttachmentView *)LockedTextAttachmentView.init(frame:textAttachment:textContainer:forManualRendering:)(a4, a5, a6, x, y, width, height);
}

- (ICLockedTextAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  id v10;
  ICLockedTextAttachmentView *v11;

  v5 = a5;
  if (a3)
  {
    objc_opt_self();
    v9 = (void *)swift_dynamicCastObjCClass();
    if (v9)
      v10 = a3;
  }
  else
  {
    v9 = 0;
  }
  v11 = -[ICLockedTextAttachmentView initWithFrame:textAttachment:textContainer:forManualRendering:](self, sel_initWithFrame_textAttachment_textContainer_forManualRendering_, v9, a4, v5, 0.0, 0.0, 0.0, 0.0);

  return v11;
}

- (ICLockedTextAttachmentView)initWithCoder:(id)a3
{
  ICLockedTextAttachmentView *result;

  result = (ICLockedTextAttachmentView *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

- (BOOL)shouldAddMenuLongPressGesture
{
  return 0;
}

- (BOOL)shouldAddPanGesture
{
  return 0;
}

- (void)didTapAttachment:(id)a3
{
  ICLockedTextAttachmentView *v4;
  ICLockedTextAttachmentView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DD9D2AC4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  LockedTextAttachmentView.didTapAttachment(_:)();

  sub_1DD904DF4((uint64_t)v6);
}

- (void)openAttachment
{
  ICLockedTextAttachmentView *v2;

  v2 = self;
  LockedTextAttachmentView.openAttachment()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___ICLockedTextAttachmentView_lockedView));
}

@end
