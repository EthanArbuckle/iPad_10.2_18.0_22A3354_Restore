@implementation ICAttributionViewConfigurationSharedState

- (ICAttributionViewConfigurationSharedState)initWithTextView:(id)a3 note:(id)a4
{
  id v6;
  id v7;
  ICAttributionViewConfigurationSharedState *v8;
  ICAttributionViewConfigurationSharedState *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICAttributionViewConfigurationSharedState;
  v8 = -[ICAttributionViewConfigurationSharedState init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_textView, v6);
    objc_storeStrong((id *)&v9->_note, a4);
  }

  return v9;
}

- (ICTTTextStorage)noteTextStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICAttributionViewConfigurationSharedState textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfigurationSharedState note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v8))
  {
    objc_msgSend(v5, "textStorageWithoutCreating");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (ICTTTextStorage *)v9;
}

- (void)synchronouslyLoadDataForEditGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "userID", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ic_addNonNilObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[ICAttributionViewConfigurationSharedState updateHighlightColorsForUserIDs:](self, "updateHighlightColorsForUserIDs:", v5);
  -[ICAttributionViewConfigurationSharedState updateShortNamesForUserIDs:](self, "updateShortNamesForUserIDs:", v5);
  -[ICAttributionViewConfigurationSharedState updateFonts](self, "updateFonts");
  -[ICAttributionViewConfigurationSharedState updateImages](self, "updateImages");

}

- (void)updateFonts
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *MEMORY[0x1E0DC4A98];
  v4 = *MEMORY[0x1E0DC48D8];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForStyle:symbolicTraits:maxContentSizeCategory:", *MEMORY[0x1E0DC4A98], 2, *MEMORY[0x1E0DC48D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_fontWithSingleLineA");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfigurationSharedState setPrimaryFont:](self, "setPrimaryFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTextStyle:maxContentSizeCategory:", v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_fontWithSingleLineA");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfigurationSharedState setSecondaryFont:](self, "setSecondaryFont:", v8);

  -[ICAttributionViewConfigurationSharedState updateFontStorages](self, "updateFontStorages");
}

- (void)updateImages
{
  void *v3;
  id v4;

  -[ICAttributionViewConfigurationSharedState disclosureImageWithSymbolName:](self, "disclosureImageWithSymbolName:", CFSTR("chevron.down"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfigurationSharedState setExpandedDisclosureImage:](self, "setExpandedDisclosureImage:", v3);

  -[ICAttributionViewConfigurationSharedState disclosureImageWithSymbolName:](self, "disclosureImageWithSymbolName:", CFSTR("chevron.forward"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfigurationSharedState setCollapsedDisclosureImage:](self, "setCollapsedDisclosureImage:", v4);

}

- (id)disclosureImageWithSymbolName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0DC3888];
  v5 = a3;
  -[ICAttributionViewConfigurationSharedState primaryFont](self, "primaryFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:scale:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithTintColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {

    v10 = v6;
  }

  objc_msgSend(v11, "imageWithRenderingMode:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)updateHighlightColorsForUserIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[ICAttributionViewConfigurationSharedState textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__ICAttributionViewConfigurationSharedState_updateHighlightColorsForUserIDs___block_invoke;
  v11[3] = &unk_1EA7DDBF0;
  v11[4] = self;
  v12 = v4;
  v13 = v7;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

void __77__ICAttributionViewConfigurationSharedState_updateHighlightColorsForUserIDs___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setUserIDToHighlightColor:", v2);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a1[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(a1[6], "collaborationColorManager", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "highlightColorForUserID:note:", v8, a1[6]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "userIDToHighlightColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (id)highlightColorForUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[ICAttributionViewConfigurationSharedState userIDToHighlightColor](self, "userIDToHighlightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64BB8], "defaultColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)updateShortNamesForUserIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ICAttributionViewConfigurationSharedState note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__ICAttributionViewConfigurationSharedState_updateShortNamesForUserIDs___block_invoke;
  v8[3] = &unk_1EA7DD498;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __72__ICAttributionViewConfigurationSharedState_updateShortNamesForUserIDs___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUserIDToShortName:", v2);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "note", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "participantForUserID:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "ic_activityStreamDisplayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "userIDToShortName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (id)shortNameForUserID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[ICAttributionViewConfigurationSharedState userIDToShortName](self, "userIDToShortName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Somebody"), &stru_1EA7E9860, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isTimestampUnread:(id)a3 forUserID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[ICAttributionViewConfigurationSharedState note](self, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userRecordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  v12 = v11 ^ 1;
  -[ICAttributionViewConfigurationSharedState noteLastOpenedDate](self, "noteLastOpenedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ICAttributionViewConfigurationSharedState noteLastOpenedDate](self, "noteLastOpenedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 &= objc_msgSend(v6, "ic_isLaterThanDate:", v14);

  }
  -[ICAttributionViewConfigurationSharedState note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastAttributionsViewedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[ICAttributionViewConfigurationSharedState note](self, "note");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastAttributionsViewedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 &= objc_msgSend(v6, "ic_isLaterThanDate:", v18);

  }
  return v12;
}

- (ICBaseTextView)textView
{
  return (ICBaseTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (ICNote)note
{
  return self->_note;
}

- (NSDate)noteLastOpenedDate
{
  return self->_noteLastOpenedDate;
}

- (void)setNoteLastOpenedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)panelWidth
{
  return self->_panelWidth;
}

- (void)setPanelWidth:(double)a3
{
  self->_panelWidth = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)topTextViewInset
{
  return self->_topTextViewInset;
}

- (void)setTopTextViewInset:(double)a3
{
  self->_topTextViewInset = a3;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (void)setPrimaryFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (void)setSecondaryFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIImage)expandedDisclosureImage
{
  return self->_expandedDisclosureImage;
}

- (void)setExpandedDisclosureImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIImage)collapsedDisclosureImage
{
  return self->_collapsedDisclosureImage;
}

- (void)setCollapsedDisclosureImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)primaryFontStorage
{
  return self->_primaryFontStorage;
}

- (void)setPrimaryFontStorage:(id)a3
{
  objc_storeStrong(&self->_primaryFontStorage, a3);
}

- (id)secondaryFontStorage
{
  return self->_secondaryFontStorage;
}

- (void)setSecondaryFontStorage:(id)a3
{
  objc_storeStrong(&self->_secondaryFontStorage, a3);
}

- (NSMutableDictionary)userIDToHighlightColor
{
  return self->_userIDToHighlightColor;
}

- (void)setUserIDToHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_userIDToHighlightColor, a3);
}

- (NSMutableDictionary)userIDToShortName
{
  return self->_userIDToShortName;
}

- (void)setUserIDToShortName:(id)a3
{
  objc_storeStrong((id *)&self->_userIDToShortName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDToShortName, 0);
  objc_storeStrong((id *)&self->_userIDToHighlightColor, 0);
  objc_storeStrong(&self->_secondaryFontStorage, 0);
  objc_storeStrong(&self->_primaryFontStorage, 0);
  objc_storeStrong((id *)&self->_collapsedDisclosureImage, 0);
  objc_storeStrong((id *)&self->_expandedDisclosureImage, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_noteLastOpenedDate, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_destroyWeak((id *)&self->_textView);
}

- (void)updateFontStorages
{
  ICAttributionViewConfigurationSharedState *v2;

  v2 = self;
  sub_1DD978AD8();

}

@end
