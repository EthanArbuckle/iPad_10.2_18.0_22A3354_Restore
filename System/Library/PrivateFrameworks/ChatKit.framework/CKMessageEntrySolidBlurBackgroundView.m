@implementation CKMessageEntrySolidBlurBackgroundView

- (CKMessageEntrySolidBlurBackgroundView)init
{
  void *v3;
  CKMessageEntrySolidBlurBackgroundView *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntrySolidBlurBackgroundView;
  v4 = -[CKMessageEntrySolidBlurBackgroundView initWithEffect:](&v6, sel_initWithEffect_, v3);

  return v4;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[CKMessageEntrySolidBlurBackgroundView _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)setEntryViewTraitCollection:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_entryViewTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entryViewTraitCollection, a3);
    -[CKMessageEntrySolidBlurBackgroundView _updateBackgroundView](self, "_updateBackgroundView");
  }

}

- (void)_updateBackgroundView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CKMessageEntrySolidBlurBackgroundView style](self, "style");
  -[CKMessageEntrySolidBlurBackgroundView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntrySolidBlurBackgroundView entryViewTraitCollection](self, "entryViewTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CKMessageEntryViewStyleIsForDarkFullscreenMoment(v3))
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorForTraitCollection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v7);
  if (CKMessageEntryViewStyleIsForReply(v3))
    objc_msgSend(v8, "replyEntryViewBackagroundAlpha");
  else
    objc_msgSend(v8, "entryViewBackgroundAlpha");
  objc_msgSend(v4, "setAlpha:");

}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropGroupName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_backdropGroupName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    backdropGroupName = self->_backdropGroupName;
    self->_backdropGroupName = v4;

    -[CKMessageEntrySolidBlurBackgroundView _setGroupName:](self, "_setGroupName:", v6);
  }

}

- (id)inputAccessoryViewBackdropColor
{
  void *v2;
  void *v3;
  void *v4;

  -[CKMessageEntrySolidBlurBackgroundView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  objc_msgSend(v3, "colorWithAlphaComponent:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)inputAccessoryViewBackdropEffects
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  -[CKMessageEntrySolidBlurBackgroundView backgroundEffects](self, "backgroundEffects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->_entryViewTraitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewTraitCollection, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

@end
