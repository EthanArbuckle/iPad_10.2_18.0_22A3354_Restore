@implementation PKTextAttachmentDrawingViewTouchRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (!-[PKTextAttachmentDrawingViewTouchRecognizer state](self, "state", a3, a4))
    -[PKTextAttachmentDrawingViewTouchRecognizer setState:](self, "setState:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PKTextAttachmentDrawingViewTouchRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[PKTextAttachmentDrawingViewTouchRecognizer setState:](self, "setState:", 3, a4);
}

@end
