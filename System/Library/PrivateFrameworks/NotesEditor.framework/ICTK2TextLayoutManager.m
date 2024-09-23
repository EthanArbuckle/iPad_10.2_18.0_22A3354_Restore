@implementation ICTK2TextLayoutManager

- (id)renderingAttributesForLink:(id)a3 atLocation:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  float v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;

  v5 = (void *)MEMORY[0x1E0D64B60];
  v6 = a4;
  objc_msgSend(v5, "defaultLinkTextAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTK2TextLayoutManager documentRange](self, "documentRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICTK2TextLayoutManager offsetFromLocation:toLocation:](self, "offsetFromLocation:toLocation:", v12, v6);

  objc_msgSend(MEMORY[0x1E0D1CF68], "sharedController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredTextAttributesForLinkAtCharacterIndex:ofStorage:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "mutableCopy");
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v8;
  v19 = v18;

  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D30], v13, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  objc_opt_class();
  v23 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = fabs(v22);
  if (v26 >= 0.00999999978)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ic_colorBlendedWithColor:fraction:", v27, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v22 * 0.6 + 1.0;
    if (v29 < 0.0)
      v29 = 0.0;
    objc_msgSend(v28, "colorWithAlphaComponent:", fmin(v29, 1.0));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  -[ICTK2TextLayoutManager textContainer](self, "textContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "tk2TextView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v25, "resolvedColorWithTraitCollection:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v34;
  }
  objc_msgSend(v19, "ic_setNonNilObject:forKey:", v25, v23);
  if (v22 <= -0.1)
    v35 = &unk_1EA821E08;
  else
    v35 = &unk_1EA821DF0;
  v36 = *MEMORY[0x1E0DC1248];
  objc_msgSend(v19, "ic_setNonNilObject:forKey:", v35, *MEMORY[0x1E0DC1248]);
  objc_msgSend(v10, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v13, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v19, "removeObjectForKey:", v36);
  v38 = (void *)objc_msgSend(v19, "copy");

  return v38;
}

- (NSTextContentStorage)textContentStorage
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICTK2TextLayoutManager textContentManager](self, "textContentManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTextContentStorage *)v4;
}

void __53__ICTK2TextLayoutManager_zoomFactorOrInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableViewControllerForAttachment:createIfNeeded:", v4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "zoomFactorOrInsetsDidChange");

  }
}

void __55__ICTK2TextLayoutManager_todoButtonsForCharacterRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "trackedTodoParagraphAtIndex:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "todoButtonForTrackedParagraph:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v3);

}

- (void)zoomFactorOrInsetsDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v4, "ic_range");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__ICTK2TextLayoutManager_zoomFactorOrInsetsDidChange__block_invoke;
  v26[3] = &unk_1EA7DED88;
  v26[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, v6, v7, 0, v26);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ic_range");
  -[ICTK2TextLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "trackedParagraph");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "paragraph");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "todoTrackingUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "ic_removeObjectForNonNilKey:", v20);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v14);
  }

}

- (void)viewProviderForTextAttachment:(NSObject *)a3 parentView:location:ignoreCache:.cold.1(objc_class *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_DEBUG, "Creating new view provider of type %@ for attachment %@", v6, 0x16u);

}

- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5 ignoreCache:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  uint8_t v39[16];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v10, "viewIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v31 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_1DD7B0000, v31, OS_LOG_TYPE_INFO, "Requesting view provider for nil identifier", v39, 2u);
        }
        v14 = 0;
        goto LABEL_26;
      }
      if (!a6 && (ICInternalSettingsIsViewProviderCacheDisabled() & 1) == 0)
      {
        -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "textAttachment");
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v10)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v14, "setUpdatedLocationForRecycledViewProvider:", v12);
            goto LABEL_21;
          }
          v17 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[ICTK2TextLayoutManager viewProviderForTextAttachment:parentView:location:ignoreCache:].cold.2();

        }
      }
      v18 = -[ICTK2TextLayoutManager viewProviderClassForTextAttachment:](self, "viewProviderClassForTextAttachment:", v10);
      v19 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[ICTK2TextLayoutManager viewProviderForTextAttachment:parentView:location:ignoreCache:].cold.1(v18, (uint64_t)v13, v19);

      v38 = v12;
      v14 = (void *)objc_msgSend([v18 alloc], "initWithTextAttachment:parentView:textLayoutManager:location:", v10, v11, self, v12);
      -[ICTK2TextLayoutManager highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ICDynamicCast();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setHighlightPatternRegexFinder:", v20);

      objc_opt_class();
      -[ICTK2TextLayoutManager textContainer](self, "textContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "tk2TextView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_opt_class();
        objc_msgSend(v10, "attachment");
        v37 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "documentMergeController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "tk2TextView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addTextView:", v28);

        v11 = v37;
      }
      if (!a6)
      {
        -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v14, v13);

      }
      v12 = v38;
LABEL_21:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_27;
      objc_opt_class();
      objc_msgSend(v14, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v31 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "todo");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setDone:](v31, "setDone:", objc_msgSend(v32, "done"));
      -[ICTK2TextLayoutManager trackedToDoParagraphs](self, "trackedToDoParagraphs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "uuid");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ic_objectForNonNilKey:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTrackedParagraph:](v31, "setTrackedParagraph:", v35);

LABEL_26:
      goto LABEL_27;
    }
  }
  v13 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD7B0000, v13, OS_LOG_TYPE_INFO, "Requesting view provider for nil text attachment", buf, 2u);
  }
  v14 = 0;
LABEL_27:

  return v14;
}

- (id)viewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5
{
  return -[ICTK2TextLayoutManager viewProviderForTextAttachment:parentView:location:ignoreCache:](self, "viewProviderForTextAttachment:parentView:location:ignoreCache:", a3, a4, a5, 0);
}

- (Class)viewProviderClassForTextAttachment:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0DC12B0];
    objc_msgSend(v3, "fileType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "textAttachmentViewProviderClassForFileType:", v6);

    if (v7)
    {
      v4 = v7;
      goto LABEL_5;
    }
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_opt_class();
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = v4;

  return (Class)v8;
}

- (NSMutableDictionary)viewProviderCache
{
  return self->_viewProviderCache;
}

- (id)trackedTodoParagraphForTrackingUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTK2TextLayoutManager trackedToDoParagraphs](self, "trackedToDoParagraphs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_objectForNonNilKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)trackedTodoParagraphAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ICTK2TextLayoutManager paragraphStyleForCharacterIndex:](self, "paragraphStyleForCharacterIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todoTrackingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextLayoutManager trackedTodoParagraphForTrackingUUID:](self, "trackedTodoParagraphForTrackingUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)trackedToDoParagraphs
{
  void *v2;
  void *v3;

  -[ICTK2TextLayoutManager textController](self, "textController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackedToDoParagraphs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)todoButtonsForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  ICTK2TextLayoutManager *v17;
  id v18;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D63928];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __55__ICTK2TextLayoutManager_todoButtonsForCharacterRange___block_invoke;
  v16 = &unk_1EA7DE148;
  v17 = self;
  v18 = v6;
  v10 = v6;
  objc_msgSend(v8, "ic_enumerateUnclampedAttribute:inRange:options:usingBlock:", v9, location, length, 0, &v13);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16, v17);
  return v11;
}

- (id)todoButtonForTrackedParagraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todoTrackingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[ICTK2TextLayoutManager existingAttachmentViewForIdentifier:](self, "existingAttachmentViewForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ICTK2TextController)textController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "styler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTK2TextController *)v7;
}

- (NSMutableDictionary)tableAttachmentViewControllers
{
  return self->_tableAttachmentViewControllers;
}

- (void)setTextContentManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICTK2TextLayoutManager tableAttachmentViewControllers](self, "tableAttachmentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "willMoveToParentViewController:", 0);
        objc_msgSend(v11, "removeFromParentViewController");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICTK2TextLayoutManager tableAttachmentViewControllers](self, "tableAttachmentViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[ICTK2TextLayoutManager clearCachedViewProvidersMatchingPredicate:](self, "clearCachedViewProvidersMatchingPredicate:", 0);
  v13.receiver = self;
  v13.super_class = (Class)ICTK2TextLayoutManager;
  -[ICTK2TextLayoutManager setTextContentManager:](&v13, sel_setTextContentManager_, v4);

}

- (void)setTextContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  ICKeyPathFromSelectors();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextLayoutManager textContainer](self, "textContainer", sel_editorController, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICTK2TextLayoutManager textContainer](self, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_removeObserver:forKeyPath:context:", self, v5, &compoundliteral_1);

  }
  v9.receiver = self;
  v9.super_class = (Class)ICTK2TextLayoutManager;
  -[ICTK2TextLayoutManager setTextContainer:](&v9, sel_setTextContainer_, v4);
  -[ICTK2TextLayoutManager textContainer](self, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_addObserver:forKeyPath:context:", self, v5, &compoundliteral_1);

}

- (void)setNeedsLayout
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[ICTK2TextLayoutManager textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tk2TextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setAttachmentViewDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_storeWeak((id *)&self->_attachmentViewDelegate, v4);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        ICDynamicCast();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setDelegate:", v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)paragraphStyleForCharacterIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[ICTK2TextLayoutManager ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/ICTK2TextLayoutManager.m") & 1) != 0)
  {
    v13 = -[ICTK2TextLayoutManager ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v12, v11, v10);
    if (a6 == &compoundliteral_1 && (v13 & 1) == 0)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[ICTK2TextLayoutManager tableAttachmentViewControllers](self, "tableAttachmentViewControllers", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v15);
            -[ICTK2TextLayoutManager updateParentForTableAttachmentViewController:](self, "updateParentForTableAttachmentViewController:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++));
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v17);
      }

    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)ICTK2TextLayoutManager;
    -[ICTK2TextLayoutManager observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)invalidateLayoutForRanges:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "Invalidating text layout for %lu ranges", v3, 0xCu);
}

- (void)invalidateLayoutForRanges:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICTK2TextLayoutManager invalidateLayoutForRanges:].cold.1(v4, v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12.receiver = self;
        v12.super_class = (Class)ICTK2TextLayoutManager;
        -[ICTK2TextLayoutManager invalidateLayoutForRange:](&v12, sel_invalidateLayoutForRange_, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
    -[ICTK2TextLayoutManager setNeedsLayout](self, "setNeedsLayout");

}

- (void)invalidateLayoutForRange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "isEmpty");
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTK2TextLayoutManager invalidateLayoutForRanges:](self, "invalidateLayoutForRanges:", v7);

      v5 = v8;
    }
  }

}

- (ICTK2TextLayoutManager)init
{
  ICTK2TextLayoutManager *v2;
  uint64_t v3;
  NSMutableDictionary *tableAttachmentViewControllers;
  uint64_t v5;
  NSMutableDictionary *viewProviderCache;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICTK2TextLayoutManager;
  v2 = -[ICTK2TextLayoutManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    tableAttachmentViewControllers = v2->_tableAttachmentViewControllers;
    v2->_tableAttachmentViewControllers = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    viewProviderCache = v2->_viewProviderCache;
    v2->_viewProviderCache = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_attachmentPreferredSizeDidChange_, *MEMORY[0x1E0D635F0], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_attachmentWillBeDeleted_, *MEMORY[0x1E0D636D8], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_noteEditorControllerSelectionDidChange_, CFSTR("ICNoteEditorViewControllerSelectionDidChangeNotification"), 0);

  }
  return v2;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (id)existingAttachmentViewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v4 = a3;
  if (v4)
  {
    -[ICTK2TextLayoutManager existingAttachmentViewProviderForIdentifier:](self, "existingAttachmentViewProviderForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ICTK2TextLayoutManager tableAttachmentViewControllers](self, "tableAttachmentViewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD7B0000, v9, OS_LOG_TYPE_INFO, "Requesting existing attachment view for nil identifier", v11, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)clearCachedViewProvidersMatchingPredicate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Clearing all cached view providers", v1, 2u);
}

- (void)clearCachedViewProvidersMatchingPredicate:(id)a3
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v4[2](v4, v12);

          if (v13)
            objc_msgSend(v19, "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    v14 = os_log_create("com.apple.notes", "UI");
    v15 = v19;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICTK2TextLayoutManager clearCachedViewProvidersMatchingPredicate:].cold.2();

    -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsForKeys:", v17);

  }
  else
  {
    v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ICTK2TextLayoutManager clearCachedViewProvidersMatchingPredicate:].cold.1(v18);

    -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllObjects");
  }

}

- (ICAttachmentViewDelegate)attachmentViewDelegate
{
  return (ICAttachmentViewDelegate *)objc_loadWeakRetained((id *)&self->_attachmentViewDelegate);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICTK2TextLayoutManager;
  -[ICTK2TextLayoutManager dealloc](&v4, sel_dealloc);
}

- (id)existingAttachmentViewProviderForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_INFO, "Requesting existing attachment view provider for nil identifier", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)newViewProviderForTextAttachment:(id)a3 parentView:(id)a4 location:(id)a5
{
  -[ICTK2TextLayoutManager viewProviderForTextAttachment:parentView:location:ignoreCache:](self, "viewProviderForTextAttachment:parentView:location:ignoreCache:", a3, a4, a5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableViewControllerForAttachment:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  ICiOSTableAttachmentViewController *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_INFO, "Requesting table view controller for nil text attachment", buf, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v6, "viewIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v15 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DD7B0000, v15, OS_LOG_TYPE_INFO, "Requesting table view controller for nil identifier", v17, 2u);
    }

LABEL_12:
    v10 = 0;
    goto LABEL_15;
  }
  -[ICTK2TextLayoutManager tableAttachmentViewControllers](self, "tableAttachmentViewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (ICiOSTableAttachmentViewController *)objc_claimAutoreleasedReturnValue();

  if (!v10 && v4)
  {
    -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "ic_containsTextAttachment:", v7);

    if (v13)
    {
      v10 = -[ICTableAttachmentViewController initWithTextAttachment:forManualRendering:textLayoutManager:]([ICiOSTableAttachmentViewController alloc], "initWithTextAttachment:forManualRendering:textLayoutManager:", v7, 0, self);
      -[ICTK2TextLayoutManager tableAttachmentViewControllers](self, "tableAttachmentViewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v8);

    }
    else
    {
      v10 = 0;
    }
  }
  -[ICTK2TextLayoutManager updateParentForTableAttachmentViewController:](self, "updateParentForTableAttachmentViewController:", v10);
LABEL_15:

  return v10;
}

- (_NSRange)rangeForAttachment:(id)a3 withTextAttachment:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v6 = a3;
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ic_rangeForAttachment:withTextAttachment:", v6, a4);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)enumerateAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__ICTK2TextLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke;
  v12[3] = &unk_1EA7DE318;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v12);

}

void __69__ICTK2TextLayoutManager_enumerateAttachmentViewsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char isKindOfClass;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v17;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = v17;
    objc_opt_class();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "viewIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "existingAttachmentViewForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(uint64_t, void *, id, uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v15, v11, a3, a4, a5);
    }

    v10 = v17;
  }

}

- (void)enumerateInlineAttachmentViewsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__ICTK2TextLayoutManager_enumerateInlineAttachmentViewsInRange_usingBlock___block_invoke;
  v12[3] = &unk_1EA7DE318;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v12);

}

void __75__ICTK2TextLayoutManager_enumerateInlineAttachmentViewsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char isKindOfClass;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v17;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = v17;
    objc_opt_class();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "viewIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "existingAttachmentViewForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(uint64_t, void *, id, uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v15, v11, a3, a4, a5);
    }

    v10 = v17;
  }

}

- (id)todoButtonAtCharacterIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[ICTK2TextLayoutManager todoButtonsForCharacterRange:](self, "todoButtonsForCharacterRange:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)lineCountForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  length = a3.length;
  location = a3.location;
  -[ICTK2TextLayoutManager documentRange](self, "documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextLayoutManager locationFromLocation:withOffset:](self, "locationFromLocation:withOffset:", v7, location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTK2TextLayoutManager locationFromLocation:withOffset:](self, "locationFromLocation:withOffset:", v8, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v8, v9);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0xBFF0000000000000;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__ICTK2TextLayoutManager_lineCountForCharacterRange___block_invoke;
  v14[3] = &unk_1EA7DED38;
  v11 = v10;
  v15 = v11;
  v16 = v18;
  v17 = &v19;
  -[ICTK2TextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](self, "enumerateTextSegmentsInRange:type:options:usingBlock:", v11, 0, 0, v14);
  v12 = v20[3];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v12;
}

uint64_t __53__ICTK2TextLayoutManager_lineCountForCharacterRange___block_invoke(_QWORD *a1, void *a2, double a3, double a4)
{
  uint64_t result;
  uint64_t v7;

  result = objc_msgSend(a2, "intersectsWithTextRange:", a1[4]);
  if ((_DWORD)result)
  {
    v7 = *(_QWORD *)(a1[5] + 8);
    if (*(double *)(v7 + 24) != a4)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v7 = *(_QWORD *)(a1[5] + 8);
    }
    *(double *)(v7 + 24) = a4;
  }
  return result;
}

- (_NSRange)characterRangeForBoundingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _QWORD v15[10];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _NSRange result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  -[ICTK2TextLayoutManager documentRange](self, "documentRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__ICTK2TextLayoutManager_characterRangeForBoundingRect___block_invoke;
  v15[3] = &unk_1EA7DED60;
  *(CGFloat *)&v15[6] = x;
  *(CGFloat *)&v15[7] = y;
  *(CGFloat *)&v15[8] = width;
  *(CGFloat *)&v15[9] = height;
  v15[4] = &v22;
  v15[5] = &v16;
  -[ICTK2TextLayoutManager enumerateTextSegmentsInRange:type:options:usingBlock:](self, "enumerateTextSegmentsInRange:type:options:usingBlock:", v8, 0, 0, v15);

  if (v23[5] && v17[5])
  {
    -[ICTK2TextLayoutManager documentRange](self, "documentRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICTK2TextLayoutManager offsetFromLocation:toLocation:](self, "offsetFromLocation:toLocation:", v10, v23[5]);

    v12 = -[ICTK2TextLayoutManager offsetFromLocation:toLocation:](self, "offsetFromLocation:toLocation:", v23[5], v17[5]);
  }
  else
  {
    v12 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  v13 = v11;
  v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

BOOL __56__ICTK2TextLayoutManager_characterRangeForBoundingRect___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v8;
  id v9;
  double v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v8 = a2;
  v9 = a3;
  v10 = *(double *)(a1 + 56);
  v11 = v10 + *(double *)(a1 + 72);
  if (a5 >= v10 && a5 <= v11)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      objc_msgSend(v8, "location");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    objc_msgSend(v8, "endLocation");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  return a5 <= v11;
}

- (int64_t)characterIndexForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  int64_t v23;

  y = a3.y;
  x = a3.x;
  objc_opt_class();
  -[ICTK2TextLayoutManager textContainer](self, "textContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tk2TextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "textContainerInset");
  v10 = x - v9;
  objc_msgSend(v8, "textContainerInset");
  v12 = y - v11;
  -[ICTK2TextLayoutManager textLayoutFragmentForPosition:](self, "textLayoutFragmentForPosition:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutFragmentFrame");
  v15 = v10 - v14;
  v17 = v12 - v16;
  objc_msgSend(v13, "textLineFragmentForVerticalOffset:requiresExactMatch:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "typographicBounds");
  v21 = objc_msgSend(v18, "characterIndexForPoint:", v15 - v19, v17 - v20);
  objc_msgSend(v13, "rangeInElement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ICTK2TextLayoutManager ic_rangeForTextRange:](self, "ic_rangeForTextRange:", v22) + v21;

  return v23;
}

- (void)reloadInlineAttachments
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v13;
  ICTK2TextLayoutManager *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_range");
  v8 = v7;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __49__ICTK2TextLayoutManager_reloadInlineAttachments__block_invoke;
  v13 = &unk_1EA7DEDB0;
  v14 = self;
  v15 = v3;
  v9 = v3;
  -[ICTK2TextLayoutManager enumerateInlineAttachmentViewsInRange:usingBlock:](self, "enumerateInlineAttachmentViewsInRange:usingBlock:", v6, v8, &v10);

  -[ICTK2TextLayoutManager invalidateLayoutForRanges:](self, "invalidateLayoutForRanges:", v9, v10, v11, v12, v13, v14);
}

void __49__ICTK2TextLayoutManager_reloadInlineAttachments__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "ic_textRangeForRange:", a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v6);

}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        ICDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setHighlightPatternRegexFinder:", v5);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "ic_range");
  v17 = v16;
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke;
  v28[3] = &unk_1EA7DE368;
  v19 = v5;
  v29 = v19;
  -[ICTK2TextLayoutManager enumerateAttachmentViewsInRange:usingBlock:](self, "enumerateAttachmentViewsInRange:usingBlock:", v15, v17, v28);

  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "ic_range");
  v24 = v23;
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke_2;
  v26[3] = &unk_1EA7DEDD8;
  v27 = v19;
  v25 = v19;
  -[ICTK2TextLayoutManager enumerateInlineAttachmentViewsInRange:usingBlock:](self, "enumerateInlineAttachmentViewsInRange:usingBlock:", v22, v24, v26);

}

uint64_t __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHighlightPatternRegexFinder:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__ICTK2TextLayoutManager_setHighlightPatternRegexFinder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHighlightPatternRegexFinder:", *(_QWORD *)(a1 + 32));
}

- (void)textController:(id)a3 addedTrackedAttribute:(id)a4
{
  -[ICTK2TextLayoutManager updateExistingTodoViewProviderForTrackedParagraph:](self, "updateExistingTodoViewProviderForTrackedParagraph:", a4);
}

- (void)textController:(id)a3 updatedTrackedAttribute:(id)a4
{
  -[ICTK2TextLayoutManager updateExistingTodoViewProviderForTrackedParagraph:](self, "updateExistingTodoViewProviderForTrackedParagraph:", a4);
}

- (void)attachmentPreferredSizeDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31;
  ICTK2TextLayoutManager *v32;
  uint8_t *v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  NSObject *v41;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "ic_isModernNoteType");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v25 = v4;
      objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "workerManagedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v9;
      v38[0] = v9;
      v38[1] = 3221225472;
      v38[2] = __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke;
      v38[3] = &unk_1EA7DDBF0;
      v39 = v11;
      v40 = v6;
      v41 = v7;
      v13 = v11;
      objc_msgSend(v13, "performBlockAndWait:", v38);

    }
    else
    {
      if (!objc_msgSend(v6, "ic_isAttachmentType"))
      {
        v24 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD7B0000, v24, OS_LOG_TYPE_INFO, "Ignoring preferred size change notification for unknown type", buf, 2u);
        }
        goto LABEL_9;
      }
      v12 = v9;
      v25 = v4;
      -[NSObject addObject:](v7, "addObject:", v6);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x2020000000;
    v37 = 0;
    v18 = objc_msgSend(v17, "ic_range");
    v20 = v19;
    v21 = *MEMORY[0x1E0DC10F8];
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_59;
    v28[3] = &unk_1EA7DEE00;
    v29 = v7;
    v22 = v14;
    v30 = v22;
    v23 = v15;
    v31 = v23;
    v32 = self;
    v33 = buf;
    objc_msgSend(v17, "enumerateAttribute:inRange:options:usingBlock:", v21, v18, v20, 0, v28);
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_2;
    v26[3] = &unk_1EA7DEE28;
    v24 = v22;
    v27 = v24;
    -[ICTK2TextLayoutManager clearCachedViewProvidersMatchingPredicate:](self, "clearCachedViewProvidersMatchingPredicate:", v26);
    -[ICTK2TextLayoutManager invalidateLayoutForRanges:](self, "invalidateLayoutForRanges:", v23);

    _Block_object_dispose(buf, 8);
    v4 = v25;
LABEL_9:

    goto LABEL_10;
  }
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_INFO, "Ignoring preferred size change notification with nil object ID", buf, 2u);
  }
LABEL_10:

}

void __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "attachments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_59(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11))
  {
    if (objc_msgSend(v15, "supportsMultiplePresentationSizes"))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
      v12 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "ic_textRangeForRange:", a3, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_addNonNilObject:", v13);

    }
    v14 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *a5 = v14 == objc_msgSend(*(id *)(a1 + 32), "count");
  }

}

uint64_t __59__ICTK2TextLayoutManager_attachmentPreferredSizeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)attachmentWillBeDeleted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8 = v6;
    performBlockOnMainThread();

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_INFO, "Ignoring attachment deleted notification with nil identifier", buf, 2u);
    }

  }
}

void __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = (_QWORD *)(a1 + 40);
  v2 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_2;
  v15[3] = &unk_1EA7DEE28;
  v16 = v2;
  objc_msgSend(v4, "clearCachedViewProvidersMatchingPredicate:", v15);
  objc_msgSend((id)*(v3 - 1), "tableAttachmentViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(*(id *)(a1 + 32), "tableAttachmentViewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(v6, "willMoveToParentViewController:", 0);
    objc_msgSend(v6, "removeFromParentViewController");
  }

}

uint64_t __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v7;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0DC10F8];
  v6 = objc_msgSend(v8, "ic_range");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICTK2TextLayoutManager_contentSizeCategoryDidChange___block_invoke;
  v9[3] = &unk_1EA7DED88;
  v9[4] = self;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v5, v6, v7, 0, v9);

}

void __55__ICTK2TextLayoutManager_contentSizeCategoryDidChange___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "tableViewControllerForAttachment:createIfNeeded:", v7, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "viewIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "existingAttachmentViewForIdentifier:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    objc_msgSend(v5, "contentSizeCategoryDidChange");
    goto LABEL_6;
  }
LABEL_7:

}

- (void)noteEditorControllerSelectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[ICTK2TextLayoutManager textContainer](self, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tk2TextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedRange");
  v9 = v8;

  -[ICTK2TextLayoutManager textController](self, "textController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTK2TextLayoutManager textContentStorage](self, "textContentStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tk2TextView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAttachmentsSelectionStateInTextStorage:forSelectedRanges:textView:", v12, v14, v15);

}

- (void)updateExistingTodoViewProviderForTrackedParagraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "todo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTK2TextLayoutManager viewProviderCache](self, "viewProviderCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "textAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v9, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setDone:", objc_msgSend(v5, "done"));
      objc_msgSend(v13, "setTrackedParagraph:", v14);

    }
  }

}

- (void)updateParentForTableAttachmentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  -[ICTK2TextLayoutManager textContainer](self, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tk2TextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v7)
    {
      objc_msgSend(v9, "parentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v7)
      {
        objc_msgSend(v7, "addChildViewController:", v9);
        objc_msgSend(v9, "didMoveToParentViewController:", v7);
      }
    }
  }

}

- (void)setTableAttachmentViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_tableAttachmentViewControllers, a3);
}

- (void)setViewProviderCache:(id)a3
{
  objc_storeStrong((id *)&self->_viewProviderCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewProviderCache, 0);
  objc_storeStrong((id *)&self->_tableAttachmentViewControllers, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_destroyWeak((id *)&self->_attachmentViewDelegate);
}

void __50__ICTK2TextLayoutManager_attachmentWillBeDeleted___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1DD7B0000, a2, a3, "Clearing table view controller cache for identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)viewProviderForTextAttachment:parentView:location:ignoreCache:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1DD7B0000, v0, v1, "Attachment for identifier %@ has changed. Assigning new view provider.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)clearCachedViewProvidersMatchingPredicate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1DD7B0000, v0, v1, "Clearing cached view providers with identifiers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
