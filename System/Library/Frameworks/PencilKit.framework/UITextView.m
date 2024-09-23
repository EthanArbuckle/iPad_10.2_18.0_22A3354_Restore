@implementation UITextView

uint64_t __89__UITextView_UITextViewDrawing__setStylusDrawingEnabled_drawingClass_sixChannelBlending___block_invoke(uint64_t a1)
{
  return +[PKTiledCanvasView prewarmFutureCanvasesIfNecessarySecureRendering:prewarmSharedResourceHandler:](PKTiledCanvasView, "prewarmFutureCanvasesIfNecessarySecureRendering:prewarmSharedResourceHandler:", *(unsigned __int8 *)(a1 + 32), 1);
}

void __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  void (**v28)(_QWORD);
  _QWORD v29[4];
  id v30;
  _QWORD aBlock[4];
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v9 = a2;
  if (*(id *)(a1 + 32) == v9)
  {
    if (!*(_BYTE *)(a1 + 56))
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 40), "drawingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0
      || (objc_msgSend(*(id *)(a1 + 40), "drawingDelegate"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "textView:shouldDeleteDrawingAtIndex:", *(_QWORD *)(a1 + 40), a3),
          v12,
          v13))
    {
LABEL_5:
      objc_msgSend(*(id *)(a1 + 40), "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (a3 == v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "textStorage");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v16, "replaceCharactersInRange:withString:", a3, a4, &stru_1E777DEE8);

        objc_msgSend(*(id *)(a1 + 40), "drawingDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v16) = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "drawingDelegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "textView:didRemoveDrawingAtIndex:", *(_QWORD *)(a1 + 40), a3);

        }
        objc_msgSend(*(id *)(a1 + 40), "_pk_invalidateLayoutForCharacterRange:invalidateDisplay:ensureLayout:", a3 - 1, 1, 1, 0);
      }
      else
      {
        v19 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_2;
        aBlock[3] = &unk_1E777BBD8;
        v20 = *(id *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 40);
        v32 = v20;
        v33 = v21;
        v34 = a3;
        v35 = a4;
        v22 = _Block_copy(aBlock);
        v24 = *(void **)(a1 + 40);
        v23 = *(void **)(a1 + 48);
        v25 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v23, "bounds");
        v27 = v26 * -0.0166666667 / 0.3;
        v29[0] = v19;
        v29[1] = 3221225472;
        v29[2] = __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_3;
        v29[3] = &unk_1E777D2D0;
        v28 = v22;
        v30 = v28;
        if ((objc_msgSend(v24, "_growView:textAttachment:atCharacterIndex:step:stop:", v23, v25, a3, v29, v27) & 1) == 0)
          v28[2](v28);

      }
    }
    *a5 = 1;
  }

}

void __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "resignFirstResponder");
  objc_msgSend(*(id *)(a1 + 40), "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceCharactersInRange:withString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &stru_1E777DEE8);

  objc_msgSend(*(id *)(a1 + 40), "drawingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "drawingDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textView:didRemoveDrawingAtIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

BOOL __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a5 <= 10.0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return a5 <= 10.0;
}

void __85__UITextView_UITextViewDrawing___growView_textAttachment_atCharacterIndex_step_stop___block_invoke(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v17 = CGRectInset(v16, 0.0, *(double *)(a1 + 64) * -0.5);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  CGRectGetMinY(v17);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  CGRectGetMinY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  CGRectGetMaxY(v19);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  CGRectGetMaxY(v20);
  objc_msgSend(*(id *)(a1 + 40), "contentOffset");
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = *(double *)(a1 + 64) + v13;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v7);
  objc_msgSend(*(id *)(a1 + 48), "setLiveResizeAttachmentBounds:", v8, v10, v12, v14);
  objc_msgSend(*(id *)(a1 + 40), "_pk_invalidateLayoutForCharacterRange:invalidateDisplay:ensureLayout:", *(_QWORD *)(a1 + 72), 1, 1, 0);
  if ((*(unsigned int (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(v8, v10, v12, v14))
  {
    objc_msgSend(v15, "invalidate");
    objc_msgSend(*(id *)(a1 + 48), "endLiveResize");
  }

}

void __80__UITextView_UITextViewDrawing___undoDrawingBounds_viewBounds_ofAttachmentUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
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
  void *v38;
  id v39;

  v39 = a2;
  if (PKIsInlineDrawingOrPaperAttachment(v39))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v39, "viewProviderForParentView:characterIndex:layoutManager:", *(_QWORD *)(a1 + 40), a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(void **)(a1 + 48);
      objc_msgSend(v9, "documentRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationFromLocation:withOffset:", v11, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "viewProviderForTextAttachment:location:", v39, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = objc_opt_class();
    objc_msgSend(v8, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKDynamicCast(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "drawing");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", *(_QWORD *)(a1 + 56));

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 40), "undoManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "prepareWithInvocationTarget:", *(_QWORD *)(a1 + 40));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "drawing");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_canvasBounds");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v15, "bounds");
      objc_msgSend(v20, "_undoDrawingBounds:viewBounds:ofAttachmentUUID:", *(_QWORD *)(a1 + 56), v23, v25, v27, v29, v30, v31, v32, v33);

      v34 = *(double *)(a1 + 64);
      v35 = *(double *)(a1 + 72);
      v36 = *(double *)(a1 + 80);
      v37 = *(double *)(a1 + 88);
      objc_msgSend(v15, "drawing");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "set_canvasBounds:", v34, v35, v36, v37);

      objc_msgSend(v15, "setBounds:", *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
      objc_msgSend(v15, "updateFrameForTextContainer");
      objc_msgSend(v15, "drawingDidChange");
      *a5 = 1;
    }

  }
}

void __65__UITextView_UITextViewDrawing___cleanupStaleCachedViewProviders__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cacheIdentifierForTextAttachment:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __94__UITextView_UITextViewDrawing___pk_checkForTK2LostViewProviderInAttachment_atCharacterIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 3)
  {
    objc_msgSend(v3, "textAttachmentViewProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "count") == 0;

  }
  return 0;
}

@end
