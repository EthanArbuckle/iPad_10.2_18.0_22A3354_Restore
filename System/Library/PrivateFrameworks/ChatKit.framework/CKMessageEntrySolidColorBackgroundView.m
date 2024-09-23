@implementation CKMessageEntrySolidColorBackgroundView

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[CKMessageEntrySolidColorBackgroundView _updateBackgroundView](self, "_updateBackgroundView");
  }
}

- (void)setEntryViewTraitCollection:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_entryViewTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entryViewTraitCollection, a3);
    -[CKMessageEntrySolidColorBackgroundView _updateBackgroundView](self, "_updateBackgroundView");
  }

}

- (void)_updateBackgroundView
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[CKMessageEntrySolidColorBackgroundView style](self, "style");
  -[CKMessageEntrySolidColorBackgroundView entryViewTraitCollection](self, "entryViewTraitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (CKMessageEntryViewStyleIsForDarkFullscreenMoment(v3))
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorForTraitCollection:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntrySolidColorBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v5);
}

- (id)inputAccessoryViewBackdropColor
{
  return 0;
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_backdropGroupName, a3);
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
