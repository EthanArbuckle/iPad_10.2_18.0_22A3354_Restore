@implementation MRUCrossfadeImageView

- (UIImage)image
{
  void *v2;
  MRUCrossfadeImageView *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUCrossfadeImageView_primaryImageView);
  v3 = self;
  if (objc_msgSend(v2, sel_isHidden))
    v2 = *(Class *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView);
  v4 = objc_msgSend(v2, sel_image);

  return (UIImage *)v4;
}

- (int64_t)contentMode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CrossfadeImageView();
  return -[MRUCrossfadeImageView contentMode](&v3, sel_contentMode);
}

- (void)setContentMode:(int64_t)a3
{
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CrossfadeImageView();
  v4 = (char *)v5.receiver;
  -[MRUCrossfadeImageView setContentMode:](&v5, sel_setContentMode_, a3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR___MRUCrossfadeImageView_primaryImageView], sel_setContentMode_, objc_msgSend(v4, sel_contentMode, v5.receiver, v5.super_class));
  objc_msgSend(*(id *)&v4[OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView], sel_setContentMode_, objc_msgSend(v4, sel_contentMode));

}

- (MRUCrossfadeImageView)initWithFrame:(CGRect)a3
{
  return (MRUCrossfadeImageView *)sub_1AAAABD34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MRUCrossfadeImageView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  MRUCrossfadeImageView *result;

  v5 = OBJC_IVAR___MRUCrossfadeImageView_primaryImageView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);

  result = (MRUCrossfadeImageView *)sub_1AAABA7FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CrossfadeImageView();
  v2 = (char *)v5.receiver;
  -[MRUCrossfadeImageView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___MRUCrossfadeImageView_primaryImageView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR___MRUCrossfadeImageView_secondaryImageView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (void)transitionTo:(id)a3
{
  id v5;
  MRUCrossfadeImageView *v6;
  MRUCrossfadeImageView *v7;
  UIImage_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  CrossfadeImageView.transition(to:)(v8);

}

- (void).cxx_destruct
{

}

@end
