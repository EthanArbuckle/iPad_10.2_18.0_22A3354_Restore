@implementation CKHyperlinkBalloonView

- (CKHyperlinkBalloonView)initWithFrame:(CGRect)a3
{
  CKHyperlinkBalloonView *v3;
  CKHyperlinkBalloonView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKHyperlinkBalloonView;
  v3 = -[CKTextBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKTextBalloonView textView](v3, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectable:", 1);
    objc_msgSend(v5, "_setInteractiveTextSelectionDisabled:", 1);
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);
    objc_msgSend(v5, "setDelegate:", v4);
    objc_msgSend(v5, "setClipsToBounds:", 0);

  }
  return v4;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  _BOOL4 v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("message"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openURL:options:completionHandler:", v5, MEMORY[0x1E0C9AA70], 0);
LABEL_5:
    LOBYTE(v9) = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "ckSMSURLFromBusinessChatURL:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:options:completionHandler:", v8, MEMORY[0x1E0C9AA70], 0);

    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CKTextBalloonView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v8)
    goto LABEL_2;
  -[CKBalloonView doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v6)
  {
    v10 = 0;
    goto LABEL_3;
  }
  -[CKBalloonView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v6)
  {
    objc_msgSend(v6, "locationInView:", v8);
    v10 = objc_msgSend(v8, "willInteractWithLinkAtPoint:");
  }
  else
  {
LABEL_2:
    v10 = 1;
  }
LABEL_3:

  return v10;
}

@end
