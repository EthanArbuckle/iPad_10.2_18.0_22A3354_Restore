@implementation WKModelInteractionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[WKModelInteractionGestureRecognizer view](self, "view");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend((id)-[WKModelInteractionGestureRecognizer view](self, "view"), "preview"), "touchesBegan:withEvent:", a3, a4);
  else
    -[WKModelInteractionGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[WKModelInteractionGestureRecognizer setState:](self, "setState:", 2);
  objc_msgSend((id)objc_msgSend((id)-[WKModelInteractionGestureRecognizer view](self, "view"), "preview"), "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;

  if (objc_msgSend(a3, "isEqualToSet:", objc_msgSend(a4, "touchesForGestureRecognizer:", self)))
    v7 = 3;
  else
    v7 = 2;
  -[WKModelInteractionGestureRecognizer setState:](self, "setState:", v7);
  objc_msgSend((id)objc_msgSend((id)-[WKModelInteractionGestureRecognizer view](self, "view"), "preview"), "touchesEnded:withEvent:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v7;

  if (objc_msgSend(a3, "isEqualToSet:", objc_msgSend(a4, "touchesForGestureRecognizer:", self)))
    v7 = 4;
  else
    v7 = 2;
  -[WKModelInteractionGestureRecognizer setState:](self, "setState:", v7);
  objc_msgSend((id)objc_msgSend((id)-[WKModelInteractionGestureRecognizer view](self, "view"), "preview"), "touchesCancelled:withEvent:", a3, a4);
}

@end
