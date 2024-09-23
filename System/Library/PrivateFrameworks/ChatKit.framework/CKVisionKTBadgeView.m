@implementation CKVisionKTBadgeView

- (CKVisionKTBadgeView)initWithConversation:(id)a3
{
  id v5;
  CKVisionKTBadgeView *v6;
  CKVisionKTBadgeView *v7;
  UIImageView *v8;
  UIImageView *badgeImageView;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVisionKTBadgeView;
  v6 = -[CKVisionKTBadgeView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversation, a3);
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    badgeImageView = v7->_badgeImageView;
    v7->_badgeImageView = v8;

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v7->_badgeImageView, "setTintColor:", v10);

    -[CKVisionKTBadgeView addSubview:](v7, "addSubview:", v7->_badgeImageView);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__updateBadge, *MEMORY[0x1E0D353E8], 0);

    -[CKVisionKTBadgeView _updateBadge](v7, "_updateBadge");
  }

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKVisionKTBadgeView;
  -[CKVisionKTBadgeView layoutSubviews](&v3, sel_layoutSubviews);
  -[CKVisionKTBadgeView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_badgeImageView, "setFrame:");
}

- (void)_updateBadge
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CKVisionKTBadgeView__updateBadge__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __35__CKVisionKTBadgeView__updateBadge__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyTransparencyStatusForAffectedHandles:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_ktImageForStatus:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "badgeImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

}

- (id)_ktImageForStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v5 = a3 - 4;
  if (a3 - 4 <= 7 && ((0xBFu >> v5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", off_1E2757A08[v5], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageView, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
}

@end
