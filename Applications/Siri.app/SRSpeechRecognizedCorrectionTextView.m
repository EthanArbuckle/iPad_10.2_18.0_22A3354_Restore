@implementation SRSpeechRecognizedCorrectionTextView

- (SRSpeechRecognizedCorrectionTextView)initWithFrame:(CGRect)a3
{
  SRSpeechRecognizedCorrectionTextView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SRSpeechRecognizedCorrectionTextView;
  v3 = -[SRSpeechRecognizedCorrectionTextView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
    -[SRSpeechRecognizedCorrectionTextView setFont:](v3, "setFont:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](UIColor, "siriui_lightTextColor"));
    -[SRSpeechRecognizedCorrectionTextView setTextColor:](v3, "setTextColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SRSpeechRecognizedCorrectionTextView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](v3, "setTextAlignment:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightInsertionPointColor](UIColor, "siriui_lightInsertionPointColor"));
    -[SRSpeechRecognizedCorrectionTextView setInsertionPointColor:](v3, "setInsertionPointColor:", v7);

    -[SRSpeechRecognizedCorrectionTextView setBounces:](v3, "setBounces:", 0);
    -[SRSpeechRecognizedCorrectionTextView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    -[SRSpeechRecognizedCorrectionTextView setScrollEnabled:](v3, "setScrollEnabled:", 0);
    -[SRSpeechRecognizedCorrectionTextView setReturnKeyType:](v3, "setReturnKeyType:", 9);
    -[SRSpeechRecognizedCorrectionTextView setKeyboardAppearance:](v3, "setKeyboardAppearance:", 1);
    -[SRSpeechRecognizedCorrectionTextView setTextDragOptions:](v3, "setTextDragOptions:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView textContainer](v3, "textContainer"));
    objc_msgSend(v8, "setLineFragmentPadding:", 0.0);

  }
  return v3;
}

- (void)clearDictationResults
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView text](self, "text"));
  -[SRSpeechRecognizedCorrectionTextView setText:](self, "setText:", v3);

}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v18.receiver = self;
  v18.super_class = (Class)SRSpeechRecognizedCorrectionTextView;
  v4 = a3;
  -[SRSpeechRecognizedCorrectionTextView setText:](&v18, "setText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "languageCode"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bestSupportedLanguageCodeForLanguageCode:", 0));

  }
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("th-TH"));
  v11 = -[SRSpeechRecognizedCorrectionTextView textAlignment](self, "textAlignment");
  if (v10)
    v12 = objc_claimAutoreleasedReturnValue(+[SiriUIFontScalingUtilities tallParagraphStyleForCurrentScaleWithTextAlignment:](SiriUIFontScalingUtilities, "tallParagraphStyleForCurrentScaleWithTextAlignment:", v11));
  else
    v12 = objc_claimAutoreleasedReturnValue(+[SiriUIFontScalingUtilities paragraphStyleForCurrentScaleWithTextAlignment:](SiriUIFontScalingUtilities, "paragraphStyleForCurrentScaleWithTextAlignment:", v11));
  v13 = (void *)v12;
  v20[0] = v12;
  v19[0] = NSParagraphStyleAttributeName;
  v19[1] = NSFontAttributeName;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView font](self, "font"));
  v20[1] = v14;
  v19[2] = NSForegroundColorAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView textColor](self, "textColor"));
  v19[3] = CFSTR("NSLanguage");
  v20[2] = v15;
  v20[3] = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));

  v17 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v4, v16);
  -[SRSpeechRecognizedCorrectionTextView setAttributedText:](self, "setAttributedText:", v17);

}

- (id)undoManager
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  unsigned int v3;
  objc_super v5;

  v3 = -[SRSpeechRecognizedCorrectionTextView isEditable](self, "isEditable");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SRSpeechRecognizedCorrectionTextView;
    LOBYTE(v3) = -[SRSpeechRecognizedCorrectionTextView canBecomeFirstResponder](&v5, "canBecomeFirstResponder");
  }
  return v3;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSpeechRecognizedCorrectionTextView;
  v3 = -[SRSpeechRecognizedCorrectionTextView becomeFirstResponder](&v6, "becomeFirstResponder");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
    objc_msgSend(v4, "utteranceTextDidBecomeFirstResponder:", self);

  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v3 = -[SRSpeechRecognizedCorrectionTextView isFirstResponder](self, "isFirstResponder");
  v8.receiver = self;
  v8.super_class = (Class)SRSpeechRecognizedCorrectionTextView;
  v4 = -[SRSpeechRecognizedCorrectionTextView resignFirstResponder](&v8, "resignFirstResponder");
  v5 = v4;
  if (v3 && v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
    objc_msgSend(v6, "utteranceTextDidResignFirstResponder:", self);

  }
  return v5;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
  v11 = objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___SRUtteranceCorrectionTextViewDelegate);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView delegate](self, "delegate"));
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("\n")))
      objc_msgSend(v12, "utteranceTextDidReceiveReturnKey:", self);

  }
  v15.receiver = self;
  v15.super_class = (Class)SRSpeechRecognizedCorrectionTextView;
  v13 = -[SRSpeechRecognizedCorrectionTextView keyboardInput:shouldInsertText:isMarkedText:](&v15, "keyboardInput:shouldInsertText:isMarkedText:", v8, v9, v5);

  return v13;
}

@end
