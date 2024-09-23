@implementation ICBaseAttachmentView

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)addKVObserversForAttachment:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("title"), &compoundliteral_3);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("media"), &compoundliteral_3);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("mergeableData"), &compoundliteral_3);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, CFSTR("markedForDeletion"), &compoundliteral_3);

}

- (void)setAttachment:(id)a3
{
  id v3;
  ICAttachment **p_attachment;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  ICAttachment *v27;

  v3 = a3;
  p_attachment = &self->_attachment;
  v27 = (ICAttachment *)a3;
  if (*p_attachment != v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D63608];
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D63608], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D63660];
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0D63660], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D635F8];
    objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0D635F8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D63768];
    objc_msgSend(v12, "removeObserver:name:object:", self, *MEMORY[0x1E0D63768], 0);

    v14 = (_QWORD *)MEMORY[0x1E0D636D8];
    if (*p_attachment)
    {
      -[ICBaseAttachmentView removeKVOObserversForAttachment:](self, "removeKVOObserversForAttachment:");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", self, *v14, *p_attachment);

    }
    if (v27)
    {
      v26 = v3;
      -[ICAttachment ic_obtainPermanentObjectIDIfNecessary](v27, "ic_obtainPermanentObjectIDIfNecessary");
      -[ICBaseAttachmentView addKVObserversForAttachment:](self, "addKVObserversForAttachment:", v27);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment objectID](v27, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_attachmentDidLoad_, v7, v17);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment objectID](v27, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_attachmentPreviewImagesDidUpdate_, v9, v19);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment objectID](v27, "objectID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_attachmentDidChangeSize_, v11, v21);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", self, sel_attachmentWillBeDeleted_, *MEMORY[0x1E0D636D8], v27);

      -[ICAttachment media](v27, "media");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "ic_permanentObjectID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_mediaDidLoad_, v13, v25);

      }
      v3 = v26;
    }
    -[ICBaseAttachmentView willChangeAttachment](self, "willChangeAttachment");
    objc_storeStrong((id *)&self->_attachment, v3);
    -[ICBaseAttachmentView didChangeAttachment](self, "didChangeAttachment");
  }

}

- (void)updateHighlights
{
  _BOOL4 v3;
  double v4;

  v3 = -[ICBaseAttachmentView selected](self, "selected");
  -[ICBaseAttachmentView foregroundAlpha](self, "foregroundAlpha");
  if (v3)
    v4 = v4 * 0.5;
  -[UIView ic_setAlpha:](self, "ic_setAlpha:", v4);
}

- (ICTextAttachment)textAttachment
{
  ICTextAttachment **p_textAttachment;
  id WeakRetained;
  ICAttachment *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  ICAttachment *v10;
  _QWORD v12[4];
  ICAttachment *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  p_textAttachment = &self->_textAttachment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  if (WeakRetained)
  {

  }
  else if (self->_attachment)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__58;
    v19 = __Block_byref_object_dispose__58;
    v20 = 0;
    v5 = self->_attachment;
    -[ICAttachment note](v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "length");
    v9 = *MEMORY[0x1E0DC10F8];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__ICBaseAttachmentView_textAttachment__block_invoke;
    v12[3] = &unk_1E5C22AE8;
    v10 = v5;
    v13 = v10;
    v14 = &v15;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v12);
    objc_storeWeak((id *)p_textAttachment, (id)v16[5]);

    _Block_object_dispose(&v15, 8);
  }
  return (ICTextAttachment *)objc_loadWeakRetained((id *)p_textAttachment);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
  -[ICBaseAttachmentView updateHighlights](self, "updateHighlights");
}

- (BOOL)selected
{
  return self->_selected;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_attachment)
    -[ICBaseAttachmentView removeKVOObserversForAttachment:](self, "removeKVOObserversForAttachment:");
  v4.receiver = self;
  v4.super_class = (Class)ICBaseAttachmentView;
  -[ICBaseAttachmentView dealloc](&v4, sel_dealloc);
}

- (void)removeKVOObserversForAttachment:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("title"), &compoundliteral_3);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("media"), &compoundliteral_3);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("mergeableData"), &compoundliteral_3);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("markedForDeletion"), &compoundliteral_3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((-[ICBaseAttachmentView ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/Text/TextAttachments/ICBaseAttachmentView.m") & 1) != 0)
  {
    v13 = -[ICBaseAttachmentView ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v12, v10);

    if (a6 == &compoundliteral_3 && (v13 & 1) == 0)
    {
      -[ICBaseAttachmentView attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "faultingState");

      if (!v15)
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("media")))
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *MEMORY[0x1E0D63768];
          objc_msgSend(v16, "removeObserver:name:object:", self, *MEMORY[0x1E0D63768], 0);

          -[ICBaseAttachmentView attachment](self, "attachment");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "media");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v19, "ic_obtainPermanentObjectIDIfNecessary");
            objc_msgSend(v19, "objectID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_mediaDidLoad_, v17, v20);

          }
          if ((objc_msgSend(v19, "needsInitialFetchFromCloud") & 1) == 0)
            -[ICBaseAttachmentView didChangeMedia](self, "didChangeMedia");

        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("mergeableData")))
        {
          -[ICBaseAttachmentView didChangeMergeableData](self, "didChangeMergeableData");
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("title")))
        {
          -[ICBaseAttachmentView didChangeAttachmentTitle](self, "didChangeAttachmentTitle");
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("markedForDeletion")))
        {
          -[ICBaseAttachmentView didChangeMedia](self, "didChangeMedia");
        }
      }
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ICBaseAttachmentView;
    -[ICBaseAttachmentView observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v12, v11, a6);

  }
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[ICBaseAttachmentView updateHighlights](self, "updateHighlights");
}

void __38__ICBaseAttachmentView_textAttachment__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v10 = v13;
    objc_msgSend(v10, "attachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);

    if (v11 == v12)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a5 = 1;
    }

    v9 = v13;
  }

}

- (void)didChangeSize
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  objc_opt_class();
  -[ICBaseAttachmentView attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEditing") & 1) == 0)
  {
    v6 = *MEMORY[0x1E0DC10F8];
    v7 = objc_msgSend(v8, "length");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__ICBaseAttachmentView_didChangeSize__block_invoke;
    v9[3] = &unk_1E5C1EBC8;
    v9[4] = self;
    v10 = v8;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v9);

  }
}

void __37__ICBaseAttachmentView_didChangeSize__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        v28 = 0uLL;
        v29 = 0uLL;
        v26 = 0uLL;
        v27 = 0uLL;
        objc_msgSend(*(id *)(a1 + 40), "textLayoutManagers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v15, "ic_textRangeForRange:", a3, a4);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "invalidateLayoutForRange:", v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          }
          while (v12);
        }
      }
      else
      {
        v24 = 0uLL;
        v25 = 0uLL;
        v22 = 0uLL;
        v23 = 0uLL;
        objc_msgSend(*(id *)(a1 + 40), "layoutManagers", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v23 != v19)
                objc_enumerationMutation(v10);
              v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v21, "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
              objc_msgSend(v21, "ensureLayoutForCharacterRange:", a3, a4);
            }
            v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v18);
        }
      }

    }
  }

}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  return 0;
}

- (UIImage)imageForPrinting
{
  -[ICBaseAttachmentView layoutIfNeeded](self, "layoutIfNeeded");
  return (UIImage *)-[UIView ic_imageRenderedFromLayer](self, "ic_imageRenderedFromLayer");
}

- (void)mediaDidLoad:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[ICBaseAttachmentView didChangeMedia](self, "didChangeMedia");
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ICBaseAttachmentView mediaDidLoad:].cold.1(v8);

  }
}

- (void)attachmentWillBeDeleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICBaseAttachmentView attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[ICBaseAttachmentView willDeleteAttachment](self, "willDeleteAttachment");
    -[ICBaseAttachmentView setAttachment:](self, "setAttachment:", 0);
  }
}

- (CGSize)attachmentContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_attachmentContentSize.width;
  height = self->_attachmentContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAttachmentContentSize:(CGSize)a3
{
  self->_attachmentContentSize = a3;
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_storeStrong((id *)&self->_attachment, 0);
}

- (void)mediaDidLoad:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Got a media did change notification for the wrong media.", v1, 2u);
}

@end
