@implementation CKVisionTranscriptTitleView

+ (id)titleViewWithConversation:(id)a3 tapHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConversation:tapHandler:", v6, v5);

  return v7;
}

- (CKVisionTranscriptTitleView)initWithConversation:(id)a3 tapHandler:(id)a4
{
  id v6;
  id v7;
  CKVisionTranscriptTitleView *v8;
  void *v9;
  void *v10;
  CKAvatarButton *v11;
  CKVisionKTBadgeView *v12;
  CKVisionKTBadgeView *ktBadgeImageView;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKVisionTranscriptTitleView;
  v8 = -[CKVisionTranscriptTitleView init](&v17, sel_init);
  if (v8)
  {
    +[StyleSupport transcriptTitleViewHeight](_TtC7ChatKit12StyleSupport, "transcriptTitleViewHeight");
    -[_UINavigationBarTitleView setHeight:](v8, "setHeight:");
    v9 = (void *)MEMORY[0x1E0CEA2A8];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__CKVisionTranscriptTitleView_initWithConversation_tapHandler___block_invoke;
    v15[3] = &unk_1E274EE40;
    v16 = v7;
    objc_msgSend(v9, "actionWithHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CKAvatarButton initWithPrimaryAction:]([CKAvatarButton alloc], "initWithPrimaryAction:", v10);
    -[CKAvatarButton updateWithConversation:](v11, "updateWithConversation:", v6);
    -[CKVisionTranscriptTitleView addSubview:](v8, "addSubview:", v11);
    -[CKVisionTranscriptTitleView setAvatarButton:](v8, "setAvatarButton:", v11);
    v12 = -[CKVisionKTBadgeView initWithConversation:]([CKVisionKTBadgeView alloc], "initWithConversation:", v6);
    ktBadgeImageView = v8->_ktBadgeImageView;
    v8->_ktBadgeImageView = v12;

    -[CKVisionTranscriptTitleView addSubview:](v8, "addSubview:", v8->_ktBadgeImageView);
  }

  return v8;
}

uint64_t __63__CKVisionTranscriptTitleView_initWithConversation_tapHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double MaxX;
  double v14;
  double v15;
  double Height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)CKVisionTranscriptTitleView;
  -[CKVisionTranscriptTitleView layoutSubviews](&v22, sel_layoutSubviews);
  +[StyleSupport transcriptTitleViewAvatarButtonDiameter](_TtC7ChatKit12StyleSupport, "transcriptTitleViewAvatarButtonDiameter");
  v4 = v3;
  +[StyleSupport transcriptTitleViewAvatarButtonDiameter](_TtC7ChatKit12StyleSupport, "transcriptTitleViewAvatarButtonDiameter");
  v6 = v5;
  -[CKVisionTranscriptTitleView avatarButton](self, "avatarButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, v4, v6);

  -[CKVisionTranscriptTitleView center](self, "center");
  v9 = v8;
  v11 = v10;
  -[CKVisionTranscriptTitleView avatarButton](self, "avatarButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

  -[CKAvatarButton frame](self->_avatarButton, "frame");
  MaxX = CGRectGetMaxX(v23);
  +[StyleSupport transcriptTitleViewKTBadgePadding](_TtC7ChatKit12StyleSupport, "transcriptTitleViewKTBadgePadding");
  v15 = MaxX + v14;
  -[CKVisionTranscriptTitleView bounds](self, "bounds");
  Height = CGRectGetHeight(v24);
  +[StyleSupport transcriptTitleViewKTBadgeDiameter](_TtC7ChatKit12StyleSupport, "transcriptTitleViewKTBadgeDiameter");
  v18 = (Height - v17) * 0.5;
  +[StyleSupport transcriptTitleViewKTBadgeDiameter](_TtC7ChatKit12StyleSupport, "transcriptTitleViewKTBadgeDiameter");
  v20 = v19;
  +[StyleSupport transcriptTitleViewKTBadgeDiameter](_TtC7ChatKit12StyleSupport, "transcriptTitleViewKTBadgeDiameter");
  -[CKVisionKTBadgeView setFrame:](self->_ktBadgeImageView, "setFrame:", v15, v18, v20, v21);
}

- (CKAvatarButton)avatarButton
{
  return self->_avatarButton;
}

- (void)setAvatarButton:(id)a3
{
  objc_storeStrong((id *)&self->_avatarButton, a3);
}

- (CKVisionKTBadgeView)ktBadgeImageView
{
  return self->_ktBadgeImageView;
}

- (void)setKtBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_ktBadgeImageView, a3);
}

- (id)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong((id *)&self->_ktBadgeImageView, 0);
  objc_storeStrong((id *)&self->_avatarButton, 0);
}

@end
