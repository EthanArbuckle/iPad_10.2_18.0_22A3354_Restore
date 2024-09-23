@implementation ICTextController

void __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke(double *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = *((_QWORD *)a1 + 5);
  v5 = *((_QWORD *)a1 + 7);
  v6 = *((_QWORD *)a1 + 8);
  v7 = a1[9];
  v8 = a1[10];
  v9 = a1[11];
  v10 = a1[12];
  v11 = a2;
  objc_msgSend(v3, "imageInfoForTrackedParagraph:textView:characterRangeToRender:visibleRectToRender:", v11, v4, v5, v6, v7, v8, v9, v10);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)a1 + 6);
  objc_msgSend(v11, "paragraph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "todo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ic_addKey:forNonNilObject:", v16, v17);

}

void __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "trackedToDoParagraphs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paragraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "todo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "imageInfoForTrackedParagraph:textView:characterRangeToRender:visibleRectToRender:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "ic_addKey:forNonNilObject:", v13, v12);

}

uint64_t __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFinalFramesForSortedInfos:textView:textContainerOrigin:todoUUIDsToImageViews:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __129__ICTextController_ICChecklistSortAnimation__performAnimatedSortForTrackedParagraphs_expandedRange_textView_sortChecklistsBlock___block_invoke_4(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "clearAllTodoSupplementalViews");
  objc_msgSend(a1[4], "cleanupStaleTodoButtons");
  objc_msgSend(a1[4], "updateVisibleSupplementalViews");
  objc_msgSend(a1[5], "removeFromSuperview");
  objc_msgSend(a1[6], "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  return objc_msgSend(a1[7], "unclampTextView");
}

void __147__ICTextController_ICChecklistSortAnimation__addImageViewsBeforeSortIfNecessaryForTrackedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "estimated") & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v5, "rect");
    v7 = (void *)objc_msgSend(v6, "initWithFrame:");
    objc_msgSend(v5, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

    objc_msgSend(v5, "rect");
    TSDAddPoints();
    objc_msgSend(v7, "setFrameOrigin:");
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v9);

  }
}

void __160__ICTextController_ICChecklistSortAnimation__addImageViewsAfterSortIfNecessaryForTrackedInfos_existingInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  if ((objc_msgSend(v21, "estimated") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v21, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v21, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v21, "rect");
        v11 = v10;
        v13 = v12;
        TSDAddPoints();
        v15 = v14;
        objc_msgSend(v9, "rect");
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v15, *(double *)(a1 + 64) + v16, v11, v13);
        objc_msgSend(v21, "image");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setImage:", v18);

        objc_msgSend(*(id *)(a1 + 48), "addSubview:", v17);
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v21, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v20);

      }
    }
  }

}

void __126__ICTextController_ICChecklistSortAnimation__setFinalFramesForSortedInfos_textView_textContainerOrigin_todoUUIDsToImageViews___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(*(id *)(a1 + 32), "trackedToDoParagraphs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "icLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackedToDoParagraphs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "ic_objectForNonNilKey:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "frame");
      v13 = v12;
      objc_msgSend(v5, "rect");
      v15 = *(double *)(a1 + 64) + v14;
      objc_msgSend(v11, "ic_animator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFrameOrigin:", v13, v15);

      objc_msgSend(v11, "setFrameOrigin:", v13, v15);
    }

  }
}

void __127__ICTextController_ICChecklistSortAnimation__imageInfoForTrackedParagraph_textView_characterRangeToRender_visibleRectToRender___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setShouldManuallyRenderSeparateSubviews:", 1);

    objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsDraggingChecklistItem:", 1);

    objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 40), "characterRange");
    objc_msgSend(v4, "updateSubviewsForCharacterRange:", v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "ic_rectForRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  objc_msgSend(*(id *)(a1 + 32), "ic_imageForRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldManuallyRenderSeparateSubviews:", 0);

    objc_msgSend(*(id *)(a1 + 32), "icLayoutManager");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIsDraggingChecklistItem:", 0);

  }
}

uint64_t __88__ICTextController_Checklist__removeChecklistItemsMarkedCompleted_inTextView_forRanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 > v6)
    return -1;
  else
    return 1;
}

uint64_t __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySortFromOriginalParagraphs:sortedTrackedParagraphs:forTextView:checklistRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "unclampTextView");
  return objc_msgSend(*(id *)(a1 + 32), "setIsDraggingChecklistItem:", 0);
}

uint64_t __89__ICTextController_Checklist__moveCheckedChecklistsToBottomInTextView_forRange_animated___block_invoke_66(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySortFromOriginalParagraphs:sortedTrackedParagraphs:forTextView:checklistRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(a2, "characterRange");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 + v3;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v3, v4);
}

void __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2(uint64_t a1, void *a2)
{
  ICParagraphInfoSortInfo *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a2, "object");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(ICParagraphInfoSortInfo);
  -[ICParagraphInfoSortInfo setTrackedParagraph:](v3, "setTrackedParagraph:", v15);
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v15, "characterRange");
  objc_msgSend(v4, "attributedSubstringFromRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICParagraphInfoSortInfo setAttributedString:](v3, "setAttributedString:", v7);

  v8 = objc_msgSend(v15, "characterRange");
  -[ICParagraphInfoSortInfo setCharacterRange:](v3, "setCharacterRange:", v8, v9);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v15, "paragraph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "todo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, v14);

}

void __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_72(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  objc_msgSend(a2, "object");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v15, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "characterRange");
  v12 = objc_msgSend(v9, "ic_safeCharacterRangeForRange:", v10, v11);
  v14 = v13;

  objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v12, v14);
}

void __114__ICTextController_Checklist__applySortFromOriginalParagraphs_sortedTrackedParagraphs_forTextView_checklistRange___block_invoke_2_73(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "object");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  v10 = objc_msgSend(v3, "index");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rangeValue");

  if (!v8)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((sortInfo) != nil)", "-[ICTextController(Checklist) applySortFromOriginalParagraphs:sortedTrackedParagraphs:forTextView:checklistRange:]_block_invoke_2", 1, 0, CFSTR("Expected non-nil value for '%s'"), "sortInfo");
  v13 = objc_msgSend(*(id *)(a1 + 48), "length");
  v14 = *(void **)(a1 + 48);
  if (v12 <= v13)
  {
    objc_msgSend(v8, "attributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v12, 0, v15);
  }
  else
  {
    objc_msgSend(v8, "attributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendAttributedString:", v15);
  }

}

uint64_t __79__ICTextController_Checklist__sortTrackedParagraphsMovingCheckedItemsToBottom___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "paragraph");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "done");

  return v4;
}

void __81__ICTextController_Checklist__rangesForTodosInRange_markedCompleted_textStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "todo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v12, "todo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "done");

    if (!v9)
    {
      if (*(_BYTE *)(a1 + 40))
        goto LABEL_5;
      goto LABEL_4;
    }
    if (*(_BYTE *)(a1 + 40))
    {
LABEL_4:
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }
LABEL_5:

}

void __76__ICTextController_Checklist__trackedParagraphsForTodosInRange_textStorage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "todo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "trackedToDoParagraphs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "todo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_addNonNilObject:", v7);
  }

}

void __86__ICTextController_Checklist__containsAnyTodoItemMarkedCompleted_inRange_textStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "todo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v11, "todo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "done") && *(_BYTE *)(a1 + 40))
    {

LABEL_8:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v11, "todo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "done"))
    {

    }
    else
    {
      v10 = *(unsigned __int8 *)(a1 + 40);

      if (!v10)
        goto LABEL_8;
    }
  }
LABEL_9:

}

void __105__ICTextController_Checklist__autoSortChecklistIfNecessaryForTrackedParagraph_textView_analyticsHandler___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if (objc_msgSend((id)objc_opt_class(), "checklistAutoSortEnabled"))
  {
    v2 = *(id *)(a1 + 40);
    v3 = *(id *)(a1 + 48);
    dispatchMainAfterDelay();

  }
}

uint64_t __105__ICTextController_Checklist__autoSortChecklistIfNecessaryForTrackedParagraph_textView_analyticsHandler___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = !UIAccessibilityIsVoiceOverRunning();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend(*(id *)(a1 + 48), "characterRange");
  return objc_msgSend(v3, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", v4, v5, v6, v2);
}

uint64_t __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend((id)objc_opt_class(), "setChecklistAutoAlertShown:", 1);
  objc_msgSend((id)objc_opt_class(), "setChecklistAutoSortEnabled:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __112__ICTextController_Checklist__showFirstTimeAutoSortEnabledAlertWithTextView_completionHandler_analyticsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend((id)objc_opt_class(), "setChecklistAutoAlertShown:", 1);
  objc_msgSend((id)objc_opt_class(), "setChecklistAutoSortEnabled:", 1);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __73__ICTextController_Checklist__analyticsInfoForChecklistAtIndex_textView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "paragraph");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "done");

  return v4;
}

@end
