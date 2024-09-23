@implementation CKInlineMediaView

- (BOOL)isGenerativeAssetAppearance
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_isGenerativeAssetAppearance);
}

- (void)setIsGenerativeAssetAppearance:(BOOL)a3
{
  _TtC7ChatKit17CKInlineMediaView *v4;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_isGenerativeAssetAppearance) = a3;
  v4 = self;
  sub_18E6066C4(a3);

}

- (BOOL)showGenerativeButton
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_showGenerativeButton);
}

- (void)setShowGenerativeButton:(BOOL)a3
{
  _TtC7ChatKit17CKInlineMediaView *v3;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_showGenerativeButton) = a3;
  v3 = self;
  sub_18E64307C();

}

- (_TtC7ChatKit17CKInlineMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit17CKInlineMediaView *)sub_18E642CB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit17CKInlineMediaView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit17CKInlineMediaView *)sub_18E642E94(a3);
}

- (void)layoutSubviews
{
  _TtC7ChatKit17CKInlineMediaView *v2;

  v2 = self;
  sub_18E643338();

}

- (void)didTapGenerateButton:(id)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _TtC7ChatKit17CKInlineMediaView *v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v9 = self;
  v7 = objc_msgSend(v5, sel_sharedFeatureFlags);
  LODWORD(v5) = objc_msgSend(v7, sel_isGenPlaygroundSparkleButtonEnabled);

  if ((_DWORD)v5
    && (v8 = (void *)MEMORY[0x193FF501C]((char *)v9 + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_delegate)) != 0)
  {
    objc_msgSend(v8, sel_inlineMediaViewDidSelectGenerativeButton_, v9);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_delegate);

}

@end
