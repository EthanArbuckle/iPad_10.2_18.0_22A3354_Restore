@implementation MFAtomFieldEditor

void __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  _MFAtomViewTextSelectionRect *v16;

  v16 = objc_alloc_init(_MFAtomViewTextSelectionRect);
  -[_MFAtomViewTextSelectionRect setRect:](v16, "setRect:", a5, a6, a7, a8);
  -[_MFAtomViewTextSelectionRect setWritingDirection:](v16, "setWritingDirection:", a2);
  -[_MFAtomViewTextSelectionRect setContainsStart:](v16, "setContainsStart:", a3);
  -[_MFAtomViewTextSelectionRect setContainsEnd:](v16, "setContainsEnd:", a4);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);

}

void __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  BOOL v33;
  BOOL v34;
  objc_super v35;
  _QWORD aBlock[8];

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = a3 == v8;
  v10 = a3 + a4;
  v11 = *(_QWORD *)(a1 + 64) + v8;
  v12 = a3 + a4 == v11;
  v31 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "atomView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v14, "selectionBounds");
    objc_msgSend(v15, "convertRect:fromView:", v14);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_3;
    aBlock[3] = &__block_descriptor_64_e39__CGRect__CGPoint_dd__CGSize_dd__12__0B8l;
    aBlock[4] = v16;
    aBlock[5] = v17;
    aBlock[6] = v18;
    aBlock[7] = v19;
    v20 = (void (**)(_QWORD, _QWORD))_Block_copy(aBlock);
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v21, "beginningOfDocument");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "positionFromPosition:offset:", v22, a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "baseWritingDirectionForPosition:inDirection:", v23, 0);

    if (a3 == v8)
    {
      ((void (**)(_QWORD, BOOL))v20)[2](v20, v24 == 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    if (v10 == v11)
    {
      ((void (**)(_QWORD, BOOL))v20)[2](v20, v24 != 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v25 = *(void **)(a1 + 32);
    objc_msgSend(v25, "beginningOfDocument");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "positionFromPosition:offset:", v26, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "positionFromPosition:offset:", v14, a4);
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v14, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35.receiver = *(id *)(a1 + 32);
    v35.super_class = (Class)_MFAtomFieldEditor;
    objc_msgSendSuper2(&v35, sel_selectionRectsForRange_, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_4;
    v32[3] = &__block_descriptor_34_e29_B16__0__UITextSelectionRect_8l;
    v33 = v9;
    v34 = v12;
    objc_msgSend(v28, "ef_filter:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v29);
  }

}

double __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_3(uint64_t a1, int a2)
{
  double result;

  result = *(double *)(a1 + 32);
  if (a2)
    return result + *(double *)(a1 + 48);
  return result;
}

BOOL __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_4(uint64_t a1, void *a2)
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
