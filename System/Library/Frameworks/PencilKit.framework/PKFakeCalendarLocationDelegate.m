@implementation PKFakeCalendarLocationDelegate

- (PKFakeCalendarLocationDelegate)initWithCell:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  PKFakeCalendarLocationDelegate *v8;
  PKFakeCalendarLocationDelegate *v9;
  uint64_t v10;
  NSUUID *elementID;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKFakeCalendarLocationDelegate;
  v8 = -[PKFakeCalendarLocationDelegate init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_window, v7);
    objc_storeWeak((id *)&v9->_cell, v6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    elementID = v9->_elementID;
    v9->_elementID = (NSUUID *)v10;

    objc_msgSend(v6, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      do
      {
        objc_msgSend(v12, "superview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v12 = v13;
      }
      while ((objc_opt_isKindOfClass() & 1) == 0);
    }
    objc_storeWeak((id *)&v9->_tableView, v13);

  }
  return v9;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  id WeakRetained;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  if (WeakRetained)
  {
    v9[0] = self->_elementID;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8, 0x7FFFFFFFFFFFFFFFLL);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD block[5];
  id v15;
  id v16;

  v7 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  v9 = objc_loadWeakRetained((id *)&self->_window);
  v10 = v9;
  if (WeakRetained && v9)
  {
    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:didSelectRowAtIndexPath:", WeakRetained, v12);

    v13 = dispatch_time(0, 800000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__PKFakeCalendarLocationDelegate__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
    block[3] = &unk_1E7778880;
    block[4] = self;
    v15 = v10;
    v16 = v7;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

  }
}

void __115__PKFakeCalendarLocationDelegate__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_searchBarInView:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "searchField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "becomeFirstResponder");

    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v6, "searchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (id)_searchBarInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[PKFakeCalendarLocationDelegate _searchBarInView:](self, "_searchBarInView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementID, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_cell);
}

@end
