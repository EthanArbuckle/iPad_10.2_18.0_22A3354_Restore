@implementation PKTextInputFeedbackController

- (PKTextInputFeedbackController)init
{
  char *v2;
  PKTextInputFeedbackController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTextInputFeedbackController;
  v2 = -[PKTextInputFeedbackController init](&v6, sel_init);
  v3 = (PKTextInputFeedbackController *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 56) = xmmword_1BE4FE230;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__placeholderChanged_, *MEMORY[0x1E0DC5530], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputFeedbackController;
  -[PKTextInputFeedbackController dealloc](&v4, sel_dealloc);
}

- (BOOL)_shouldShowCustomFeedback
{
  int v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;

  v3 = 1;
  switch(-[PKTextInputFeedbackController feedbackType](self, "feedbackType"))
  {
    case 0:
      -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        goto LABEL_12;
      -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKTextInputElementContent configureSelectionStyleForNormalSelection]((uint64_t)v5);
      break;
    case 1:
      -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_12;
      -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKTextInputElementContent configureSelectionStyleForDeletionPreview]((uint64_t)v5);
      break;
    case 2:
      -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_12;
      -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PKTextInputElementContent configureSelectionStyleForHighlight]((uint64_t)v5);
      break;
    case 4:
    case 5:
      v3 = 0;
      goto LABEL_12;
    default:
      goto LABEL_12;
  }
  v9 = v6;

  if (v9)
    return 0;
  v3 = 1;
LABEL_12:
  -[PKTextInputFeedbackController referenceElementContent](self, "referenceElementContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && -[PKTextInputFeedbackController feedbackType](self, "feedbackType")
    && (!v3 || -[PKTextInputFeedbackController referenceTextRange](self, "referenceTextRange") != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[PKTextInputFeedbackController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_updateFeedbackState
{
  -[PKTextInputFeedbackController _setShowingCustomFeedback:](self, "_setShowingCustomFeedback:", -[PKTextInputFeedbackController _shouldShowCustomFeedback](self, "_shouldShowCustomFeedback"));
  -[PKTextInputFeedbackController _updateFeedbackView](self, "_updateFeedbackView");
}

- (void)_setShowingCustomFeedback:(BOOL)a3
{
  id v4;

  if (self->_showingCustomFeedback != a3)
  {
    self->_showingCustomFeedback = a3;
    -[PKTextInputFeedbackController _updateFeedbackView](self, "_updateFeedbackView");
    -[PKTextInputFeedbackController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedbackControllerShowingCustomFeedbackDidChange:", self);

  }
}

- (void)_updateFeedbackView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  PKTextInputGestureFeedbackView *v7;
  PKTextInputGestureFeedbackView *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v3 = -[PKTextInputFeedbackController showingCustomFeedback](self, "showingCustomFeedback");
  -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v4)
  {
    if (v4)
      v14 = v3;
    else
      v14 = 1;
    if ((v14 & 1) == 0)
    {
      -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

      -[PKTextInputFeedbackController set_feedbackView:](self, "set_feedbackView:", 0);
    }
  }
  else
  {
    -[PKTextInputFeedbackController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "feedbackControllerContainerView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [PKTextInputGestureFeedbackView alloc];
      objc_msgSend(v6, "bounds");
      v8 = -[PKTextInputGestureFeedbackView initWithFrame:](v7, "initWithFrame:");
      -[PKTextInputFeedbackController set_feedbackView:](self, "set_feedbackView:", v8);

      -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        objc_storeWeak((id *)(v9 + 424), self);

      -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoresizingMask:", 18);

      -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v12);

      -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sendSubviewToBack:", v13);

    }
  }
  if (v3)
  {
    -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTextInputGestureFeedbackView setNeedsRefreshFeedbackViews]((uint64_t)v16);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PKTextInputFeedbackController _updateFeedbackState](self, "_updateFeedbackState");
    v5 = obj;
  }

}

- (void)setReferenceElementContent:(id)a3 referenceRange:(_NSRange)a4 feedbackType:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  PKTextInputElementContent *v10;
  PKTextInputElementContent **p_referenceElementContent;
  BOOL v12;
  void *v13;
  PKTextInputElementContent *v14;
  PKTextInputElementContent *v15;

  length = a4.length;
  location = a4.location;
  v10 = (PKTextInputElementContent *)a3;
  p_referenceElementContent = &self->_referenceElementContent;
  if (self->_referenceElementContent != v10
    || (location == self->_referenceTextRange.location ? (v12 = length == self->_referenceTextRange.length) : (v12 = 0),
        !v12 || self->_feedbackType != a5))
  {
    self->_referenceTextRange.location = location;
    self->_referenceTextRange.length = length;
    self->_feedbackType = a5;
    v15 = v10;
    if (v10)
      objc_storeStrong((id *)&self->_referenceElementContent, a3);
    -[PKTextInputFeedbackController _updateFeedbackState](self, "_updateFeedbackState");
    if (a5 == 3)
    {
      -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputGestureFeedbackView beginShowingReserveSpaceIntro]((uint64_t)v13);

    }
    v10 = v15;
    if (!v15)
    {
      v14 = *p_referenceElementContent;
      *p_referenceElementContent = 0;

      v10 = 0;
    }
  }

}

- (void)cancelShowingReserveSpaceIntro
{
  id *v3;

  -[PKTextInputFeedbackController setFeedbackType:](self, "setFeedbackType:", 4);
  -[PKTextInputFeedbackController _feedbackView](self, "_feedbackView");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputGestureFeedbackView cancelShowingReserveSpaceIntro](v3);

  -[PKTextInputFeedbackController setFeedbackType:](self, "setFeedbackType:", 0);
  -[PKTextInputFeedbackController _updateFeedbackState](self, "_updateFeedbackState");
}

- (void)beginDisplayForReserveSpacePlaceholder:(id)a3
{
  -[PKTextInputFeedbackController setPlaceholder:](self, "setPlaceholder:", a3);
  -[PKTextInputFeedbackController setFeedbackType:](self, "setFeedbackType:", 5);
  -[PKTextInputFeedbackController _updateFeedbackState](self, "_updateFeedbackState");
}

- (void)endDisplayForReserveSpacePlaceholder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextInputFeedbackController placeholder](self, "placeholder");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PKTextInputFeedbackController setPlaceholder:](self, "setPlaceholder:", 0);
    -[PKTextInputFeedbackController setFeedbackType:](self, "setFeedbackType:", 0);
    -[PKTextInputFeedbackController _updateFeedbackState](self, "_updateFeedbackState");
  }
}

- (void)_placeholderChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC5538]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTextInputFeedbackController placeholder](self, "placeholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8 == v6)
  {
    -[PKTextInputFeedbackController _updateFeedbackState](self, "_updateFeedbackState");
    v7 = v8;
  }

}

- (PKTextInputFeedbackControllerDelegate)delegate
{
  return (PKTextInputFeedbackControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PKTextInputElementContent)referenceElementContent
{
  return self->_referenceElementContent;
}

- (void)setReferenceElementContent:(id)a3
{
  objc_storeStrong((id *)&self->_referenceElementContent, a3);
}

- (_NSRange)referenceTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_referenceTextRange.length;
  location = self->_referenceTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setReferenceTextRange:(_NSRange)a3
{
  self->_referenceTextRange = a3;
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (void)setFeedbackType:(int64_t)a3
{
  self->_feedbackType = a3;
}

- (BOOL)showingCustomFeedback
{
  return self->_showingCustomFeedback;
}

- (PKTextInputTextPlaceholder)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_placeholder, a3);
}

- (PKTextInputGestureFeedbackView)_feedbackView
{
  return self->__feedbackView;
}

- (void)set_feedbackView:(id)a3
{
  objc_storeStrong((id *)&self->__feedbackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__feedbackView, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_referenceElementContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
