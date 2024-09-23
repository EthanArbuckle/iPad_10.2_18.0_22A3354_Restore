@implementation TapbackPickerEmojiTailView

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit26TapbackPickerEmojiTailView_delegate);
}

- (BOOL)pointInside:(CGFloat)a3 withEvent:(uint64_t)a4
{
  id v8;
  id v9;
  _BOOL8 v10;
  CGPoint v12;
  CGRect v13;
  CGRect v14;

  v8 = a5;
  v9 = a1;
  objc_msgSend(v9, sel_bounds);
  v14 = CGRectInset(v13, -4.0, -4.0);
  v12.x = a2;
  v12.y = a3;
  v10 = CGRectContainsPoint(v14, v12);

  return v10;
}

@end
