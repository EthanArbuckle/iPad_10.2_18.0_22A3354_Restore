@implementation UITextView(UITextViewDrawing)

- (void)setStylusDrawingEnabled:()UITextViewDrawing drawingClass:sixChannelBlending:
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id obja;
  _QWORD block[4];
  char v36;

  if (a3)
  {
    objc_msgSend(a1, "_drawingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();

    if ((void *)v9 == a4)
    {
      v10 = 0;
      obj = 0;
    }
    else
    {
      objc_msgSend(a1, "_pkTiledViewIfEnabled");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "drawingDelegate");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_pkTiledViewIfEnabled");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      objc_msgSend(a1, "_clearDrawingInfo");
    }
    if (objc_msgSend(a1, "isStylusDrawingEnabled", obj))
    {
      objc_msgSend(a1, "isStylusDrawingEnabled");

    }
    else
    {
      objc_msgSend(a1, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "screen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "expectsSecureRendering");

      dispatch_get_global_queue(25, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__UITextView_UITextViewDrawing__setStylusDrawingEnabled_drawingClass_sixChannelBlending___block_invoke;
      block[3] = &__block_descriptor_33_e5_v8__0l;
      v36 = v16;
      dispatch_async(v17, block);

      +[PKTextAttachmentDrawingViewProvider registerViewProviderClassIfNecessary](PKTextAttachmentDrawingViewProvider, "registerViewProviderClassIfNecessary");
      objc_msgSend(a1, "_drawingInfoCreateIfNecessary");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(+[PKTextAttachmentDrawingViewProvider tiledViewClassForDrawingClass:](PKTextAttachmentDrawingViewProvider, "tiledViewClassForDrawingClass:", a4)), "initInScrollView:sixChannelBlending:defaultDrawingClass:", a1, a5, a4);
      if (v18)
      {
        objc_storeStrong((id *)(v18 + 24), v19);

        v20 = a4;
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v20;
      }

      if (v10)
      {
        objc_msgSend(v10, "ink");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18 ? *(void **)(v18 + 24) : 0;
        objc_msgSend(v22, "setInk:", v21);

        v23 = objc_msgSend(v10, "cropDrawingAttachmentsWhenViewIsSmaller");
        v24 = v18 ? *(void **)(v18 + 24) : 0;
        objc_msgSend(v24, "setCropDrawingAttachmentsWhenViewIsSmaller:", v23);
        objc_msgSend(v10, "linedPaper");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v18 ? *(void **)(v18 + 24) : 0;
        objc_msgSend(v26, "setLinedPaper:", v25);

        v27 = objc_msgSend(v10, "rulerEnabled");
        if (v18)
        {
          objc_msgSend(*(id *)(v18 + 24), "setRulerEnabled:", v27);
          objc_storeWeak((id *)(v18 + 32), obja);
        }
        else
        {
          objc_msgSend(0, "setRulerEnabled:", v27);
        }
        if (objc_msgSend(v10, "overrideUserInterfaceStyle"))
        {
          v28 = objc_msgSend(v10, "overrideUserInterfaceStyle");
          if (v18)
            v29 = *(void **)(v18 + 24);
          else
            v29 = 0;
          objc_msgSend(v29, "setOverrideUserInterfaceStyle:", v28);
        }
      }
      objc_msgSend(a1, "_updateDrawingBackgroundColor");
      if (objc_msgSend(a1, "isPaperEnabled"))
      {
        if (v18)
        {
          objc_msgSend(*(id *)(v18 + 24), "canvasView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setOpaque:", 0);

          v31 = *(void **)(v18 + 24);
        }
        else
        {
          objc_msgSend(0, "canvasView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setOpaque:", 0);

          v31 = 0;
        }
        objc_msgSend(v31, "setCanvasViewZOrderPolicy:", 1);
      }

    }
  }
  else
  {
    objc_msgSend(a1, "isStylusDrawingEnabled");
    if (objc_msgSend(a1, "isStylusDrawingEnabled"))
    {
      objc_msgSend(a1, "_setContentScrollInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      objc_msgSend(a1, "_pkTiledViewIfEnabled");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      objc_msgSend(a1, "_clearDrawingInfo");
    }
  }
}

- (uint64_t)setPaperEnabled:()UITextViewDrawing
{
  return objc_msgSend(a1, "setStylusDrawingEnabled:drawingClass:sixChannelBlending:", a3, +[PKDrawing drawingClassForPaper](PKDrawing, "drawingClassForPaper"), PKIsSixChannelBlendEnabledInPaper() & a3);
}

- (void)setLinedPaper:()UITextViewDrawing
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLinedPaper:", v4);

}

- (void)setDrawingDelegate:()UITextViewDrawing
{
  uint64_t v4;
  void *v5;
  id obj;

  obj = a3;
  objc_msgSend(a1, "_drawingInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_storeWeak((id *)(v4 + 32), obj);

}

- (id)paperTexture
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paperTexture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isStylusDrawingEnabled
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)isPaperEnabled
{
  uint64_t v2;
  void *v3;
  objc_class *v4;
  _BOOL8 v5;

  if (!objc_msgSend(a1, "isStylusDrawingEnabled"))
    return 0;
  objc_msgSend(a1, "_drawingInfo");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(objc_class **)(v2 + 40);
  else
    v4 = 0;
  v5 = v4 == +[PKDrawing drawingClassForPaper](PKDrawing, "drawingClassForPaper");

  return v5;
}

- (id)drawingDelegate
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  objc_msgSend(a1, "_drawingInfo");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 32));
  else
    WeakRetained = 0;

  return WeakRetained;
}

- (void)_updateDrawingBackgroundColor
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a1, "paperTexture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if ((objc_msgSend(a1, "isPaperEnabled") & 1) != 0)
      return;
    objc_msgSend(a1, "backgroundColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alphaComponent");
    v4 = v3;
    objc_msgSend(a1, "_pkTiledViewIfEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 <= 0.0)
      v7 = 0;
    else
      v7 = v8;
    objc_msgSend(v6, "setCanvasBackgroundColor:", v7);

    v2 = v8;
  }

}

- (_QWORD)_pkTiledViewIfEnabled
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;

  objc_msgSend(a1, "_drawingInfo");
  v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v1 = (_QWORD *)v1[3];
  v3 = v1;

  return v3;
}

- (id)_drawingInfo
{
  return objc_getAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m");
}

- (id)_drawingInfoCreateIfNecessary
{
  uint64_t v2;
  UITextViewDrawingInfo *v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  objc_getAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [UITextViewDrawingInfo alloc];
    if (v3)
    {
      v8.receiver = v3;
      v8.super_class = (Class)UITextViewDrawingInfo;
      v4 = a1;
      v2 = (uint64_t)objc_msgSendSuper2(&v8, sel_init);
      objc_storeWeak((id *)(v2 + 16), v4);

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v8.receiver, v8.super_class);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = v5;

    }
    else
    {
      v2 = 0;
    }
    objc_setAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m", (id)v2, (void *)1);
  }
  return (id)v2;
}

- (void)_clearDrawingInfo
{
  objc_setAssociatedObject(a1, "/Library/Caches/com.apple.xbs/Sources/PencilKit/PencilKit/Text/UITextView_PencilKit.m", 0, (void *)1);
}

- (id)ink
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setInk:()UITextViewDrawing
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInk:", v4);

}

- (id)_tool
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ink");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[PKTool _toolWithInk:](PKTool, "_toolWithInk:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_setTool:()UITextViewDrawing
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ink");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInk:", v5);

}

- (void)_setSelectedInkColor:()UITextViewDrawing
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_hasSelection"))
    objc_msgSend(v4, "setSelectedStrokesColor:", v5);

}

- (uint64_t)_isHandwritingToolSelected
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "ink");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "_isHandwritingInk");
  else
    v3 = 0;

  return v3;
}

- (void)setRulerEnabled:()UITextViewDrawing
{
  id v4;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRulerEnabled:", a3);

}

- (uint64_t)isRulerEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rulerEnabled");

  return v2;
}

- (id)linedPaper
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "linedPaper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_cropDrawingAttachmentsWhenViewIsSmaller
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "cropDrawingAttachmentsWhenViewIsSmaller");

  return v2;
}

- (void)_setCropDrawingAttachmentsWhenViewIsSmaller:()UITextViewDrawing
{
  id v4;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCropDrawingAttachmentsWhenViewIsSmaller:", a3);

}

- (void)setPaperTexture:()UITextViewDrawing
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaperTexture:", v4);

}

- (uint64_t)setStylusDrawingEnabled:()UITextViewDrawing
{
  return objc_msgSend(a1, "setStylusDrawingEnabled:drawingClass:sixChannelBlending:", a3, objc_opt_class(), 0);
}

- (uint64_t)isFingerDrawingEnabled
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "isStylusDrawingEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "_pkTiledViewIfEnabled");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsFingerDrawing");

    return v4;
  }
  return result;
}

- (void)_willBeginInteractiveResize
{
  id v1;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_willBeginInteractiveResize");

}

- (void)_didEndInteractiveResize
{
  id v1;

  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didEndInteractiveResize");

}

- (double)_boundsForDrawingTextAttachment:()UITextViewDrawing characterIndex:layoutManager:
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "viewProviderForParentView:characterIndex:layoutManager:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "drawingTextAttachmentBounds");
    v6 = v5;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
  }

  return v6;
}

- (double)_pk_boundsForDrawingTextAttachment:()UITextViewDrawing characterIndex:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = a3;
  if (!objc_msgSend(v6, "pkInserting")
    || (objc_msgSend(a1, "textLayoutManager"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(a1, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v6, a4, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "drawingTextAttachmentBoundsForContainerView:", a1);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v11 = *MEMORY[0x1E0C9D628];
        goto LABEL_10;
      }
      objc_msgSend(v9, "drawingTextAttachmentBounds");
    }
    v11 = v10;
LABEL_10:

    goto LABEL_11;
  }
  v11 = *MEMORY[0x1E0C9D628];
LABEL_11:

  return v11;
}

- (id)_textRangeFromRange:()UITextViewDrawing
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "positionFromPosition:offset:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "positionFromPosition:offset:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textRangeFromPosition:toPosition:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_insertEmptyDrawingAttachmentAtLocation:()UITextViewDrawing
{
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (objc_msgSend(a1, "_canAddDrawingAtIndex:")
    && (objc_msgSend(a1, "textStorage"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(a1, "_drawingInfo");
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v6 = (_QWORD *)v6[5];
    objc_msgSend(v6, "fileType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "drawingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(a1, "drawingDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textView:willAddDrawingAtIndex:", a1, a3);

    }
    objc_msgSend(a1, "drawingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0
      || (objc_msgSend(a1, "drawingDelegate"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "textView:newAttachmentForFileType:", a1, v8),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          !v15))
    {
      v16 = (objc_class *)objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentClassForFileType:", v8);
      if (!v16)
        v16 = (objc_class *)objc_opt_class();
      v17 = [v16 alloc];
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v17, "initWithData:ofType:", v18, v8);

    }
    objc_msgSend(a1, "contentOffset");
    objc_msgSend(a1, "setContentOffset:");
    objc_msgSend(a1, "resignFirstResponder");
    objc_msgSend(a1, "bounds");
    objc_msgSend(v15, "setBounds:", 0.0, 0.0);
    objc_msgSend(v15, "setPkInserting:", 1);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(a1, "selectedRange");
    v22 = v21;
    objc_msgSend(a1, "setSelectedRange:", a3, 0);
    objc_msgSend(a1, "_pasteAttributedString:pasteAsRichText:", v19, 1);
    objc_msgSend(a1, "setSelectedRange:", v20, v22);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void)_removeDrawingAttachment:()UITextViewDrawing withView:forDeletion:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  id v19;
  char v20;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(a1, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__UITextView_UITextViewDrawing___removeDrawingAttachment_withView_forDeletion___block_invoke;
  v16[3] = &unk_1E777D2F8;
  v20 = a5;
  v17 = v8;
  v18 = a1;
  v19 = v9;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v13, 0, v16);

}

- (BOOL)_growView:()UITextViewDrawing textAttachment:atCharacterIndex:step:stop:
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  double v24;
  uint64_t v25;

  v11 = a4;
  v12 = a7;
  v13 = objc_opt_class();
  PKDynamicCast(v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "beginLiveResize");
    v16 = (void *)MEMORY[0x1E0C99E88];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __85__UITextView_UITextViewDrawing___growView_textAttachment_atCharacterIndex_step_stop___block_invoke;
    v19[3] = &unk_1E777D320;
    v24 = a2;
    v20 = v11;
    v21 = a1;
    v22 = v15;
    v25 = a6;
    v23 = v12;
    v17 = (id)objc_msgSend(v16, "scheduledTimerWithTimeInterval:repeats:block:", 1, v19, 0.0166666667);

  }
  return v15 != 0;
}

- (void)_undoDrawingBounds:()UITextViewDrawing viewBounds:ofAttachmentUUID:
{
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;

  v20 = a11;
  objc_msgSend(a1, "textContainer");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "textLayoutManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(a1, "layoutManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "textStorage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(a1, "textStorage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __80__UITextView_UITextViewDrawing___undoDrawingBounds_viewBounds_ofAttachmentUUID___block_invoke;
  v31[3] = &unk_1E777D348;
  v32 = v22;
  v33 = a1;
  v34 = v21;
  v35 = v20;
  v36 = a2;
  v37 = a3;
  v38 = a4;
  v39 = a5;
  v40 = a6;
  v41 = a7;
  v42 = a8;
  v43 = a9;
  v27 = v20;
  v28 = v21;
  v29 = v22;
  objc_msgSend(v23, "enumerateAttribute:inRange:options:usingBlock:", v24, 0, v26, 0, v31);

}

- (void)_upgradeDrawingAtCharacterIndex:()UITextViewDrawing itemProviders:insertionLocationInDrawing:
{
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a6;
  objc_msgSend(a1, "drawingDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(a1, "drawingDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textView:upgradeDrawingAtIndex:itemProviders:insertionLocationInDrawing:", a1, a5, v13, a2, a3);

  }
}

- (void)_canvasViewWillCreateSnapshot
{
  void *v2;
  id v3;

  objc_msgSend(a1, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pkTiledViewIfEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentSnapshottingView:", v3);

}

- (void)_willBeginNewStrokeForTouch:()UITextViewDrawing
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "_updateDrawingBackgroundColor");
  objc_msgSend(a1, "drawingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(a1, "drawingDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textViewWillBeginStroke:", a1);

  }
  objc_msgSend(a1, "drawingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(a1, "drawingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textViewWillBeginStroke:forTouch:", a1, v10);

  }
}

- (void)_didEndStroke
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(a1, "drawingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "drawingDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textViewDidEndStroke:", a1);

  }
}

- (uint64_t)_canAddStroke
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "drawingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 1;
  objc_msgSend(a1, "drawingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "textViewCanAddStroke:", a1);

  return v5;
}

- (uint64_t)_canAddDrawingAtIndex:()UITextViewDrawing
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "drawingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 1;
  objc_msgSend(a1, "drawingDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "textView:canAddDrawingAtIndex:", a1, a3);

  return v8;
}

- (uint64_t)_canInsertDrawing
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "selectedRange");
  return objc_msgSend(a1, "_canInsertDrawingInRange:", v2, v3);
}

- (BOOL)_canInsertDrawingInRange:()UITextViewDrawing
{
  _BOOL8 v7;
  void *v8;
  void *v9;

  v7 = 0;
  if (objc_msgSend(a1, "isStylusDrawingEnabled") && !a4)
  {
    objc_msgSend(a1, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(a1, "textStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a3 < objc_msgSend(v9, "length") - 1;

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_insertDrawing:()UITextViewDrawing
{
  id result;

  result = (id)objc_msgSend(a1, "selectedRange");
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
    return (id)objc_msgSend(a1, "_insertEmptyDrawingAttachmentAtLocation:", result);
  return result;
}

- (uint64_t)_canSelectDrawing
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "drawingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 1;
  objc_msgSend(a1, "drawingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "textViewCanSelectDrawing:", a1);

  return v5;
}

- (id)_pk_textRangeFromCharacterRange:()UITextViewDrawing textLayoutManager:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  objc_msgSend(v7, "documentRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationFromLocation:withOffset:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "locationFromLocation:withOffset:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v10, v11);
  return v12;
}

- (void)_pk_invalidateLayoutForCharacterRange:()UITextViewDrawing invalidateDisplay:ensureLayout:
{
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  int v22;
  uint64_t v23;
  NSRange v24;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || (objc_msgSend(a1, "layoutManager"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v24.location = a3;
      v24.length = a4;
      NSStringFromRange(v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v14;
      v21 = 1024;
      v22 = a6;
      _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "invalidateLayoutFor: %@, ensureLayout: %{BOOL}d", (uint8_t *)&v19, 0x12u);

    }
    objc_msgSend(a1, "_pk_textRangeFromCharacterRange:textLayoutManager:", a3, a4, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateLayoutForRange:", v15);
    if (a6)
    {
      objc_msgSend(v12, "textViewportLayoutController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutViewport");

    }
    v17 = 0;
  }
  else
  {
    v17 = v18;
    objc_msgSend(v18, "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
    if (a5)
      objc_msgSend(v17, "invalidateDisplayForCharacterRange:", a3, a4);
    if (a6)
      objc_msgSend(v17, "ensureLayoutForCharacterRange:", a3, a4);
  }

}

- (void)_pk_ensureLayoutForCharacterRange:()UITextViewDrawing
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(a1, "layoutManager"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17.location = a3;
      v17.length = a4;
      NSStringFromRange(v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "ensureLayoutFor: %@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(a1, "_pk_textRangeFromCharacterRange:textLayoutManager:", a3, a4, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateLayoutForRange:", v11);
    objc_msgSend(v8, "textViewportLayoutController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutViewport");

  }
  else
  {
    v11 = v13;
    objc_msgSend(v13, "ensureLayoutForCharacterRange:", a3, a4);
  }

}

- (double)_pk_lineFragmentRectForGlyphAtCharacterIndex:()UITextViewDrawing
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  objc_msgSend(a1, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(a1, "layoutManager"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v6, "documentRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationFromLocation:withOffset:", v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "textLayoutFragmentForLocation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutFragmentFrame");
    v12 = v11;

  }
  else
  {
    v9 = v13;
    objc_msgSend(v13, "lineFragmentRectForGlyphAtIndex:effectiveRange:", objc_msgSend(v13, "glyphIndexForCharacterAtIndex:", a3), 0);
    v12 = v14;
  }

  return v12;
}

- (id)_pk_viewProviderForAttachment:()UITextViewDrawing atCharacterIndex:createIfNeeded:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLayoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(a1, "layoutManager");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v13 = (void *)v17;
      objc_msgSend(v8, "viewProviderForParentView:characterIndex:layoutManager:", a1, a4, v17);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  objc_msgSend(v10, "documentRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationFromLocation:withOffset:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "viewProviderForTextAttachment:location:", v8, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 || !a5)
  {
LABEL_11:

    if (!v14)
      goto LABEL_22;
    goto LABEL_19;
  }
  objc_msgSend(a1, "_cachedViewProviderForTextAttachment:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = v15;
      v24 = 2048;
      v25 = a4;
      _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEFAULT, "Update location for cached view provider (%p) at %lu", (uint8_t *)&v22, 0x16u);
    }

    objc_msgSend(v15, "setUpdatedLocationForRecycledViewProvider:", v13);
    v14 = v15;
  }
  else
  {
    objc_msgSend(v8, "viewProviderForParentView:location:textContainer:", a1, v13, v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v18 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = v14;
      v24 = 2048;
      v25 = a4;
      _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Created view provider (%p) at: %lu", (uint8_t *)&v22, 0x16u);
    }

    if (!v14)
    {

      goto LABEL_22;
    }
  }
  v19 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134218240;
    v23 = v14;
    v24 = 2048;
    v25 = a4;
    _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Set viewProvider (%p) at %lu", (uint8_t *)&v22, 0x16u);
  }

  objc_msgSend(v10, "setViewProvider:forTextAttachment:location:", v14, v8, v13);
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    v20 = 0;
    goto LABEL_23;
  }
  objc_msgSend(a1, "_setCachedViewProvider:textAttachment:", v14, v8);
  v14 = v14;
  v20 = v14;
LABEL_23:

  return v20;
}

- (id)_cacheIdentifierForTextAttachment:()UITextViewDrawing
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v3, "fileType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.drawing")))
    {
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        objc_msgSend(v3, "viewIdentifier");
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    else
    {

    }
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "_paperIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v7 = (void *)v4;
LABEL_9:

  return v7;
}

- (void)_setCachedViewProvider:()UITextViewDrawing textAttachment:
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "_cacheIdentifierForTextAttachment:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "_drawingInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      objc_msgSend(*(id *)(v7 + 48), "setObject:forKeyedSubscript:", v9, v6);

  }
}

- (id)_cachedViewProviderForTextAttachment:()UITextViewDrawing
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_cacheIdentifierForTextAttachment:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_msgSend(a1, "_drawingInfo"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(v3 + 48), "objectForKeyedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_cleanupStaleCachedViewProviders
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_drawingInfo");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "textStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DC10F8];
    v6 = objc_msgSend(v4, "length");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__UITextView_UITextViewDrawing___cleanupStaleCachedViewProviders__block_invoke;
    v18[3] = &unk_1E777D370;
    v18[4] = a1;
    v7 = v3;
    v19 = v7;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v18);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v2[6], "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
            objc_msgSend(v2[6], "removeObjectForKey:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v10);
    }

  }
}

- (void)_pk_checkForTK2LostViewProviderInAttachment:()UITextViewDrawing atCharacterIndex:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "_pk_textRangeFromCharacterRange:textLayoutManager:", a4, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __94__UITextView_UITextViewDrawing___pk_checkForTK2LostViewProviderInAttachment_atCharacterIndex___block_invoke;
    v14[3] = &unk_1E777D398;
    v14[4] = &v15;
    v11 = (id)objc_msgSend(v8, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v10, 0, v14);

    if (*((_BYTE *)v16 + 24))
    {
      objc_msgSend(a1, "_cachedViewProviderForTextAttachment:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v20 = a4;
        v21 = 2048;
        v22 = v12;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Lost view provider at: %lu, cached: %p", buf, 0x16u);
      }

    }
    else
    {
      v12 = os_log_create("com.apple.pencilkit", "NSTextAttachmentViewProvider");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Did not detect a lost view provider", buf, 2u);
      }
    }

    _Block_object_dispose(&v15, 8);
  }

}

@end
