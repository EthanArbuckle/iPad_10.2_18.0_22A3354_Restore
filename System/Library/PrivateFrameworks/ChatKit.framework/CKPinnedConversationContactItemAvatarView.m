@implementation CKPinnedConversationContactItemAvatarView

- (CKPinnedConversationContactItemAvatarView)init
{
  CKPinnedConversationContactItemAvatarView *v2;
  CKPinnedConversationContactItemAvatarView *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKPinnedConversationContactItemAvatarView;
  v2 = -[CKAvatarView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CNAvatarView setAsynchronousRendering:](v2, "setAsynchronousRendering:", 1);
    -[CKPinnedConversationContactItemAvatarView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setShowsContactOnTap:](v3, "setShowsContactOnTap:", 0);
    -[CNAvatarView setBypassActionValidation:](v3, "setBypassActionValidation:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[CKPinnedConversationContactItemAvatarView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShadowColor:", v5);

    -[CKPinnedConversationContactItemAvatarView _updateContactItemViewShadows](v3, "_updateContactItemViewShadows");
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKPinnedConversationContactItemAvatarView;
  -[CNAvatarView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKPinnedConversationContactItemAvatarView _updateContactItemViewShadows](self, "_updateContactItemViewShadows");
}

- (void)_updateContactItemViewShadows
{
  void *v3;
  unint64_t v4;
  int v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  -[CKPinnedConversationContactItemAvatarView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 > 2)
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v5 = 0;
    v6 = 0.0;
  }
  else
  {
    v5 = dword_18E7CB600[v4];
    v6 = 4.0;
    v7 = 0.0;
    v8 = 3.0;
  }
  -[CKPinnedConversationContactItemAvatarView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v5;
  objc_msgSend(v9, "setShadowOpacity:", v10);

  -[CKPinnedConversationContactItemAvatarView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShadowRadius:", v6);

  -[CKPinnedConversationContactItemAvatarView layer](self, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShadowOffset:", v7, v8);

}

- (CKPinnedConversationContactItem)pinnedConversationContactItem
{
  return self->_pinnedConversationContactItem;
}

- (void)setPinnedConversationContactItem:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedConversationContactItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedConversationContactItem, 0);
}

@end
