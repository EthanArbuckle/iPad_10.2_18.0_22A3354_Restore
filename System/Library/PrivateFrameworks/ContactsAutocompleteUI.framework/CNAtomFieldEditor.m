@implementation CNAtomFieldEditor

void __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  _CNAtomViewTextSelectionRect *v16;

  v16 = objc_alloc_init(_CNAtomViewTextSelectionRect);
  -[_CNAtomViewTextSelectionRect setRect:](v16, "setRect:", a5, a6, a7, a8);
  -[_CNAtomViewTextSelectionRect setWritingDirection:](v16, "setWritingDirection:", a2);
  -[_CNAtomViewTextSelectionRect setContainsStart:](v16, "setContainsStart:", a3);
  -[_CNAtomViewTextSelectionRect setContainsEnd:](v16, "setContainsEnd:", a4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);

}

void __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  BOOL v30;
  BOOL v31;
  objc_super v32;
  _QWORD v33[8];

  v7 = a3 + a4;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64) + v8;
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v10;
    objc_msgSend(v10, "atomView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "selectionBounds");
    objc_msgSend(v12, "convertRect:fromView:", v11);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke_3;
    v33[3] = &__block_descriptor_64_e39__CGRect__CGPoint_dd__CGSize_dd__12__0B8l;
    v33[4] = v13;
    v33[5] = v14;
    v33[6] = v15;
    v33[7] = v16;
    v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E16810](v33);
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v18, "beginningOfDocument");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "positionFromPosition:offset:", v19, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "baseWritingDirectionForPosition:inDirection:", v20, 0);

    if (a3 == v8)
    {
      ((void (**)(_QWORD, BOOL))v17)[2](v17, v21 == 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    v10 = v28;
    if (v7 == v9)
    {
      ((void (**)(_QWORD, BOOL))v17)[2](v17, v21 != 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v22 = a3 == v8;
    v23 = *(void **)(a1 + 32);
    objc_msgSend(v23, "beginningOfDocument");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "positionFromPosition:offset:", v24, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "positionFromPosition:offset:", v11, a4);
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v11, v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32.receiver = *(id *)(a1 + 32);
    v32.super_class = (Class)_CNAtomFieldEditor;
    objc_msgSendSuper2(&v32, sel_selectionRectsForRange_, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke_4;
    v29[3] = &__block_descriptor_34_e29_B16__0__UITextSelectionRect_8l;
    v30 = v22;
    v31 = v7 == v9;
    objc_msgSend(v26, "ef_filter:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v27);
  }

}

double __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke_3(uint64_t a1, int a2)
{
  double result;

  result = *(double *)(a1 + 32);
  if (a2)
    return result + *(double *)(a1 + 48);
  return result;
}

BOOL __45___CNAtomFieldEditor_selectionRectsForRange___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  v4 = v3;
  v5 = (*(_BYTE *)(a1 + 32) || (objc_msgSend(v3, "containsStart") & 1) == 0)
    && (*(_BYTE *)(a1 + 33) || (objc_msgSend(v4, "containsEnd") & 1) == 0);

  return v5;
}

@end
