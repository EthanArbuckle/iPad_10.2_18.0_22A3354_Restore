@implementation CKTranscriptAvatarSupplementaryView

- (CKTranscriptAvatarSupplementaryView)initWithFrame:(CGRect)a3
{
  CKTranscriptAvatarSupplementaryView *v3;
  CKAvatarView *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CKAvatarView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptAvatarSupplementaryView;
  v3 = -[CKTranscriptAvatarSupplementaryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKAvatarView alloc];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transcriptContactImageDiameter");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transcriptContactImageDiameter");
    v10 = -[CKAvatarView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, v7, v9);

    -[CNAvatarView setShowsContactOnTap:](v10, "setShowsContactOnTap:", 0);
    -[CNAvatarView setForcePressView:](v10, "setForcePressView:", v10);
    -[CKTranscriptAvatarSupplementaryView addSubview:](v3, "addSubview:", v10);
    -[CKTranscriptAvatarSupplementaryView setAvatarView:](v3, "setAvatarView:", v10);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKTranscriptAvatarSupplementaryView avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptAvatarSupplementaryView;
  -[CKTranscriptAvatarSupplementaryView dealloc](&v4, sel_dealloc);
}

+ (id)supplementaryViewKindPrefix
{
  return CFSTR("a:");
}

- (void)configureForChatItem:(id)a3 context:(id)a4
{
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v15;
  if ((isKindOfClass & 1) != 0 || (objc_opt_class(), v7 = objc_opt_isKindOfClass(), v6 = v15, (v7 & 1) != 0))
  {
    objc_msgSend(v6, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "sender");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    -[CKTranscriptAvatarSupplementaryView avatarView](self, "avatarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreferredHandle:", v10);

    -[CKTranscriptAvatarSupplementaryView avatarView](self, "avatarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContact:", v8);

    v13 = objc_msgSend(v15, "hasTail") ^ 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v13 & (objc_msgSend(v15, "wantsTranscriptGroupMonograms") ^ 1);
    -[CKTranscriptAvatarSupplementaryView avatarView](self, "avatarView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", v13);

    v6 = v15;
  }

}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
