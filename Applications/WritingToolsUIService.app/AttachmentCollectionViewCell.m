@implementation AttachmentCollectionViewCell

- (_TtC21WritingToolsUIService28AttachmentCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC21WritingToolsUIService28AttachmentCollectionViewCell *)sub_10000CC90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21WritingToolsUIService28AttachmentCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10000D16C();
}

- (void)didTapCloseButton
{
  _TtC21WritingToolsUIService28AttachmentCollectionViewCell *v2;

  v2 = self;
  sub_10000CE14();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v9.receiver;
  -[AttachmentCollectionViewCell layoutSubviews](&v9, "layoutSubviews");
  v3 = (void *)objc_opt_self(AEMessagesShelfRoundButton);
  objc_msgSend(v3, "preferredTapRegionSizeForStyle:", 0, v9.receiver, v9.super_class);
  v5 = v4;
  v7 = v6;
  v8 = *(void **)&v2[OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_closeButton];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v8, "setFrame:", CGRectGetMaxX(v10) - v5, 0.0, v5, v7);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_collectionView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_closeButton));
  sub_10000D254((uint64_t)self + OBJC_IVAR____TtC21WritingToolsUIService28AttachmentCollectionViewCell_attachment);
}

@end
