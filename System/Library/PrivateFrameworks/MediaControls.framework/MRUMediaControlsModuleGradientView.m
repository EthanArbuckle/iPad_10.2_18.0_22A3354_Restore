@implementation MRUMediaControlsModuleGradientView

- (BOOL)isGradientEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MRUMediaControlsModuleGradientView_isGradientEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGradientEnabled:(BOOL)a3
{
  MRUMediaControlsModuleGradientView *v4;

  v4 = self;
  MediaControlsModuleGradientView.isGradientEnabled.setter(a3);

}

- (UIImage)backdropImage
{
  uint64_t (*v2)(void);
  MRUMediaControlsModuleGradientView *v3;
  void *v4;

  v2 = *(uint64_t (**)(void))((**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR___MRUMediaControlsModuleGradientView_backdropImageView) & *MEMORY[0x1E0DEEDD8])
                           + 0x60);
  v3 = self;
  v4 = (void *)v2();

  return (UIImage *)v4;
}

- (void)setBackdropImage:(id)a3
{
  void (*v5)(id);
  MRUMediaControlsModuleGradientView *v6;
  id v7;

  v5 = *(void (**)(id))((**(_QWORD **)((char *)&self->super.super.super.isa
                                                + OBJC_IVAR___MRUMediaControlsModuleGradientView_backdropImageView) & *MEMORY[0x1E0DEEDD8])
                                 + 0x78);
  v7 = a3;
  v6 = self;
  v5(a3);

}

- (MRUMediaControlsModuleGradientView)initWithFrame:(CGRect)a3
{
  return (MRUMediaControlsModuleGradientView *)sub_1AAAA4190(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MRUMediaControlsModuleGradientView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAAA4C24();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaControlsModuleGradientView();
  v2 = (char *)v5.receiver;
  -[MRUMediaControlsModuleGradientView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = (void *)objc_opt_self();
  objc_msgSend(v3, sel_begin, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setDisableActions_, 1);
  v4 = *(void **)&v2[OBJC_IVAR___MRUMediaControlsModuleGradientView_gradientLayer];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
  objc_msgSend(v3, sel_commit);

}

- (void)prepareForReuse
{
  MRUMediaControlsModuleGradientView *v2;

  v2 = self;
  MediaControlsModuleGradientView.prepareForReuse()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUMediaControlsModuleGradientView_backdropImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUMediaControlsModuleGradientView_gradientLayer));
}

@end
