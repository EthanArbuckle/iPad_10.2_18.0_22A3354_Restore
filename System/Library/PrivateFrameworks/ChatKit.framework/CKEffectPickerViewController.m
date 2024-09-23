@implementation CKEffectPickerViewController

- (CKEffectPickerViewController)initWithComposition:(id)a3 sendButtonFrame:(CGRect)a4 balloonViewOrigin:(CGPoint)a5 color:(char)a6
{
  uint64_t v6;
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v14;
  CKEffectPickerViewController *v15;
  CKEffectPickerViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  __objc2_class **v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v61;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CKEffectPickerViewController;
  v15 = -[CKEffectPickerViewController init](&v61, sel_init);
  v16 = v15;
  if (v15)
  {
    -[CKEffectPickerViewController setSendButtonFrame:](v15, "setSendButtonFrame:", v12, v11, width, height);
    -[CKEffectPickerViewController setBalloonViewOrigin:](v16, "setBalloonViewOrigin:", x, y);
    -[CKEffectPickerViewController view](v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupBlending:", 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isAccessibilityPreferredContentSizeCategory");

    v21 = off_1E27330F0;
    if (!v20)
      v21 = off_1E27330F8;
    v22 = objc_alloc(*v21);
    -[CKEffectPickerViewController view](v16, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CKEffectPickerViewController sendButtonFrame](v16, "sendButtonFrame");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    -[CKEffectPickerViewController balloonViewOrigin](v16, "balloonViewOrigin");
    v42 = (void *)objc_msgSend(v22, "initWithFrame:sendButtonFrame:balloonViewOrigin:composition:color:", v14, v6, v25, v27, v29, v31, v33, v35, v37, v39, v40, v41);

    objc_msgSend(v42, "setAutoresizingMask:", 18);
    -[CKEffectPickerViewController view](v16, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    objc_msgSend(v42, "setFrame:");

    objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("EffectPickerView"));
    objc_msgSend(v42, "setDelegate:", v16);
    -[CKEffectPickerViewController setPickerView:](v16, "setPickerView:", v42);
    objc_msgSend(v17, "addSubview:", v42);
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      -[CKEffectPickerViewController setSemanticContentAttribute:forceLTR:](v16, "setSemanticContentAttribute:forceLTR:", v17, 1);
    CKFrameworkBundle();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_INVISIBLE_INK_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_INVISIBLE_INK_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addEffect:withDescriptiveText:withIdentifier:", v45, v47, CFSTR("com.apple.MobileSMS.expressivesend.invisibleink"));

    CKFrameworkBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_GENTLE_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_GENTLE_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addEffect:withDescriptiveText:withIdentifier:", v49, v51, CFSTR("com.apple.MobileSMS.expressivesend.gentle"));

    CKFrameworkBundle();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_LOUD_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_LOUD_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addEffect:withDescriptiveText:withIdentifier:", v53, v55, CFSTR("com.apple.MobileSMS.expressivesend.loud"));

    CKFrameworkBundle();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_IMPACT_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("IMPACT_PICKER_IMPACT_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addEffect:withDescriptiveText:withIdentifier:", v57, v59, CFSTR("com.apple.MobileSMS.expressivesend.impact"));

  }
  return v16;
}

- (void)setSemanticContentAttribute:(id)a3 forceLTR:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "subviews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = !a4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        v12 = objc_opt_isKindOfClass() | v9;
        if ((v12 & 1) != 0)
          v13 = 4;
        else
          v13 = 3;
        objc_msgSend(v11, "setSemanticContentAttribute:", v13);
        -[CKEffectPickerViewController setSemanticContentAttribute:forceLTR:](self, "setSemanticContentAttribute:forceLTR:", v11, (v12 & 1) == 0);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerViewController;
  -[CKEffectPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_adjustMainLabelAndTypeSegmentedControlIfNecessary");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEffectPickerViewController;
  -[CKEffectPickerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateAllAnimationTimers");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;

  -[CKEffectPickerViewController delegate](self, "delegate", a4, a3.width, a3.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectPickerViewControllerClose:animated:", self, 0);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)presentPicker
{
  id v2;

  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_animateIn");

}

- (void)updateHintTransition:(double)a3
{
  id v4;

  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHintTransition:", a3);

}

- (void)updateColor:(char)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateColor:", v3);

}

- (void)dismissViewControllerKeepingSideMount:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[CKEffectPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a4, a5);
}

- (void)handleTouchUp:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  y = a3.y;
  x = a3.x;
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleTouchUp:", v9, v11);

}

- (void)handleTouchMoved:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  y = a3.y;
  x = a3.x;
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleTouchMoved:", v9, v11);

}

- (void)setCloseButtonYPosition:(double)a3
{
  id v4;

  -[CKEffectPickerViewController pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloseButtonYPosition:", a3);

}

- (void)effectPickerViewDidFinishAnimatingIn:(id)a3
{
  id v3;

  -[CKEffectPickerViewController pickerView](self, "pickerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startSwitcherAnimationIfNecessary");

}

- (void)touchUpInsideCloseButton
{
  id v3;

  -[CKEffectPickerViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectPickerViewControllerClose:animated:", self, 0);

}

- (void)effectSelectedWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKEffectPickerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectPickerViewController:effectWithIdentifierSelected:", self, v4);

}

- (CKEffectPickerViewControllerDelegate)delegate
{
  return (CKEffectPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)effectPreviewOverlayView
{
  return self->_effectPreviewOverlayView;
}

- (void)setEffectPreviewOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_effectPreviewOverlayView, a3);
}

- (BOOL)isInlineReply
{
  return self->_isInlineReply;
}

- (void)setIsInlineReply:(BOOL)a3
{
  self->_isInlineReply = a3;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (CGRect)sendButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sendButtonFrame.origin.x;
  y = self->_sendButtonFrame.origin.y;
  width = self->_sendButtonFrame.size.width;
  height = self->_sendButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSendButtonFrame:(CGRect)a3
{
  self->_sendButtonFrame = a3;
}

- (CGPoint)balloonViewOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_balloonViewOrigin.x;
  y = self->_balloonViewOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBalloonViewOrigin:(CGPoint)a3
{
  self->_balloonViewOrigin = a3;
}

- (CKEffectPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_pickerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_effectPreviewOverlayView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
