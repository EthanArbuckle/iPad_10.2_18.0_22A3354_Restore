@implementation PHHandsetDialerDeleteButton

- (void)updateImageViewAlpha
{
  double v3;
  double v4;
  id v5;

  if (-[PHHandsetDialerDeleteButton isHighlighted](self, "isHighlighted"))
    +[PHHandsetDialerNumberPadButton highlightedCircleViewAlpha](PHHandsetDialerNumberPadButton, "highlightedCircleViewAlpha");
  else
    +[PHHandsetDialerNumberPadButton unhighlightedCircleViewAlpha](PHHandsetDialerNumberPadButton, "unhighlightedCircleViewAlpha");
  v4 = v3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHHandsetDialerDeleteButton imageView](self, "imageView"));
  objc_msgSend(v5, "setAlpha:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerDeleteButton;
  -[PHHandsetDialerDeleteButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[PHHandsetDialerDeleteButton updateImageViewAlpha](self, "updateImageViewAlpha");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerDeleteButton;
  -[PHHandsetDialerDeleteButton traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[PHHandsetDialerDeleteButton updateImageViewAlpha](self, "updateImageViewAlpha");
}

@end
