@implementation PKScribbleInteractionWrapper

- (id)initWithScribbleInteraction:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKScribbleInteractionWrapper;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  PKScribbleInteractionWrapper *v4;
  id *v5;
  id WeakRetained;
  id v7;
  BOOL v8;

  v4 = (PKScribbleInteractionWrapper *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
      v7 = objc_loadWeakRetained(v5 + 1);

      v8 = WeakRetained == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKScribbleInteractionWrapper;
  -[PKScribbleInteractionWrapper description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (UIInteraction)interaction
{
  return (UIInteraction *)objc_loadWeakRetained((id *)&self->_interaction);
}

- (UIView)interactionView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)supportsShouldBegin
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)isElementContainer
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "elementSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isEditableElement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "_scribbleInteraction:isEditableElement:", WeakRetained, v4);
  else
    v7 = 1;

  return v7;
}

- (BOOL)isEnabled
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_scribbleInteractionIsEnabled:", WeakRetained);
  else
    v4 = 1;

  return v4;
}

- (void)didTargetElement:(id)a3 forTouches:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "_scribbleInteraction:didTargetElement:forTouches:event:", WeakRetained, v12, v8, v9);

}

- (CGRect)frameForElement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "elementSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_scribbleInteraction:frameForElement:", WeakRetained, v4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)beginSuppressingPlaceholderForElement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0)
    objc_msgSend(v6, "_scribbleInteraction:beginSuppressingPlaceholderForElement:", WeakRetained, v4);

  return v7 & 1;
}

- (void)endSuppressingPlaceholderForElement:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_scribbleInteraction:endSuppressingPlaceholderForElement:", WeakRetained, v6);

}

- (BOOL)focusWillTransformElement:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "_scribbleInteraction:focusWillTransformElement:", WeakRetained, v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)shouldBeginAtLocation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;
  char v7;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "_scribbleInteraction:shouldBeginAtLocation:", WeakRetained, x, y);
  else
    v7 = 1;

  return v7;
}

- (BOOL)supportsIsElementFocused
{
  return 0;
}

- (BOOL)isElementFocused:(id)a3
{
  return 0;
}

- (BOOL)shouldDisableInputAssistant
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_pkScribbleInteractionShouldDisableInputAssistant:", WeakRetained);
  else
    v4 = 0;

  return v4;
}

- (void)willBeginWritingInElement:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_scribbleInteraction:willBeginWritingInElement:", WeakRetained, v6);

}

- (void)didFinishWritingInElement:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_scribbleInteraction:didFinishWritingInElement:", WeakRetained, v6);

}

- (void)requestElementsInRect:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "elementSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke;
    v12[3] = &unk_1E7779290;
    v13 = WeakRetained;
    v14 = v9;
    objc_msgSend(v11, "_scribbleInteraction:requestElementsInRect:completion:", v13, v12, x, y, width, height);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL);
  }

}

void __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6 && *(_BYTE *)(v6 + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "debugElementFinderArtificialDelay");
    v9 = v8;

    v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2;
    block[3] = &unk_1E7779268;
    v13 = *(id *)(a1 + 40);
    v12 = v5;
    v14 = a3;
    dispatch_after(v10, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __65__PKScribbleInteractionWrapper_requestElementsInRect_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  void (**v9)(id, _QWORD);
  id WeakRetained;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "elementSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:", WeakRetained, v12, v9, x, y);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_scribbleInteraction:focusElement:completion:", WeakRetained, v12, v9);
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3 element:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "_scribbleInteraction:hitToleranceInsetsForElement:defaultInsets:", WeakRetained, v9, top, left, bottom, right);
    top = v12;
    left = v13;
    bottom = v14;
    right = v15;
  }

  v16 = top;
  v17 = left;
  v18 = bottom;
  v19 = right;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interaction);
}

@end
