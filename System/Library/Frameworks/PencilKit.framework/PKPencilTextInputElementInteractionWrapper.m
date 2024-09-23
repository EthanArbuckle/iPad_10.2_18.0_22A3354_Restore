@implementation PKPencilTextInputElementInteractionWrapper

- (PKPencilTextInputElementInteractionWrapper)initWithElementInteraction:(id)a3
{
  id v4;
  PKPencilTextInputElementInteractionWrapper *v5;
  PKPencilTextInputElementInteractionWrapper *v6;
  uint64_t v7;
  NSMutableDictionary *knownElementsByID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPencilTextInputElementInteractionWrapper;
  v5 = -[PKPencilTextInputElementInteractionWrapper init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_elementInteraction, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    knownElementsByID = v6->_knownElementsByID;
    v6->_knownElementsByID = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
    v7 = objc_loadWeakRetained(v5 + 1);

    v8 = WeakRetained == v7;
  }
  else
  {
    v8 = 0;
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
  v7.super_class = (Class)PKPencilTextInputElementInteractionWrapper;
  -[PKPencilTextInputElementInteractionWrapper description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (UIInteraction)interaction
{
  return (UIInteraction *)objc_loadWeakRetained((id *)&self->_elementInteraction);
}

- (UIView)interactionView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)supportsShouldBegin
{
  return 0;
}

- (BOOL)supportsIsElementFocused
{
  return 0;
}

- (BOOL)isElementFocused:(id)a3
{
  return 0;
}

- (BOOL)isElementContainer
{
  return 1;
}

- (BOOL)isEnabled
{
  return 1;
}

- (CGRect)frameForElement:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_knownElementsByID, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "frame");
      v3 = v9;
      v4 = v10;
      v5 = v11;
      v6 = v12;
    }

  }
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)beginSuppressingPlaceholderForElement:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  void *v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_knownElementsByID, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (WeakRetained && v6)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pencilTextInputInteraction:beginSuppressingPlaceholderForElement:", WeakRetained, v7);

      v8 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (void)endSuppressingPlaceholderForElement:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_knownElementsByID, "objectForKeyedSubscript:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (WeakRetained)
    {
      if (v5)
      {
        objc_msgSend(WeakRetained, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "delegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "pencilTextInputInteraction:endSuppressingPlaceholderForElement:", WeakRetained, v6);

        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

}

- (BOOL)focusWillTransformElement:(id)a3
{
  return 1;
}

- (BOOL)shouldBeginAtLocation:(CGPoint)a3
{
  return 1;
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
  char v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke;
    v14[3] = &unk_1E7779928;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v13, "pencilTextInputInteraction:requestTextInputElementsInRect:completion:", WeakRetained, v14, x, y, width, height);

  }
}

void __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke_2;
  block[3] = &unk_1E7778880;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __79__PKPencilTextInputElementInteractionWrapper_requestElementsInRect_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
        objc_msgSend(v8, "identifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        objc_msgSend(v8, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)focusElement:(id)a3 initialFocusSelectionReferencePoint:(CGPoint)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(id, _QWORD);

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_elementInteraction);
  if (!v7)
  {
    v11 = 0;
LABEL_7:
    v8[2](v8, 0);
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_knownElementsByID, "objectForKeyedSubscript:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!WeakRetained)
    goto LABEL_7;
  if (!v10)
    goto LABEL_7;
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
    goto LABEL_7;
  objc_msgSend(WeakRetained, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __106__PKPencilTextInputElementInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
  v15[3] = &unk_1E7779950;
  v16 = v8;
  objc_msgSend(v14, "pencilTextInputInteraction:focusTextInputElement:completion:", WeakRetained, v11, v15);

LABEL_8:
}

uint64_t __106__PKPencilTextInputElementInteractionWrapper_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownElementsByID, 0);
  objc_destroyWeak((id *)&self->_elementInteraction);
}

@end
