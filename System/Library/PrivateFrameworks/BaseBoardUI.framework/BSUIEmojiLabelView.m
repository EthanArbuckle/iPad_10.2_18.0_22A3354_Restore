@implementation BSUIEmojiLabelView

- (BSUIEmojiLabelView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BSUIEmojiLabelView *v7;
  BSUIEmojiLabelView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[BSUIPartialStylingLabelView initWithTokenType:](self, "initWithTokenType:", 0);
  v8 = v7;
  if (v7)
    -[BSUIEmojiLabelView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

@end
