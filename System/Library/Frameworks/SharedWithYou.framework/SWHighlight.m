@implementation SWHighlight

+ (id)highlightsForSLHighlights:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SWCollaborationHighlight *v11;
  SWHighlight *v12;
  SWCollaborationHighlight *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = -[SWCollaborationHighlight initWithSLCollaborationHighlight:]([SWCollaborationHighlight alloc], "initWithSLCollaborationHighlight:", v10);
        }
        else
        {
          v12 = [SWHighlight alloc];
          v11 = -[SWHighlight initWithSLHighlight:](v12, "initWithSLHighlight:", v10, (_QWORD)v16);
        }
        v13 = v11;
        objc_msgSend(v4, "addObject:", v11, (_QWORD)v16);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (SWHighlight)initWithSLHighlight:(id)a3
{
  id v4;
  SWHighlight *v5;
  SWHighlight *v6;
  SWHighlightIdentifier *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSecureCoding *identifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWHighlight;
  v5 = -[SWHighlight init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SWHighlight _setSLHighlight:](v5, "_setSLHighlight:", v4);
    v7 = [SWHighlightIdentifier alloc];
    -[SWHighlight slHighlight](v6, "slHighlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SWHighlightIdentifier initWithStringIdentifier:](v7, "initWithStringIdentifier:", v9);
    identifier = v6->_identifier;
    v6->_identifier = (NSSecureCoding *)v10;

  }
  return v6;
}

- (id)stringIdentifier
{
  void *v2;
  void *v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)URL
{
  void *v2;
  void *v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)attributions
{
  void *v2;
  void *v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timestamp
{
  void *v2;
  void *v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)requiredSpotlightAttributeKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0DA8878], "requiredSpotlightAttributeKeys");
}

- (SWHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  SWHighlight *v9;

  v6 = (objc_class *)MEMORY[0x1E0DA8878];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCSSearchableItem:error:", v7, a4);

  if (v8)
  {
    self = -[SWHighlight initWithSLHighlight:](self, "initWithSLHighlight:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SWHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  SWHighlight *v9;

  v6 = (objc_class *)MEMORY[0x1E0DA8878];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCSSearchableItemUniqueIdentifier:error:", v7, a4);

  if (v8)
  {
    self = -[SWHighlight initWithSLHighlight:](self, "initWithSLHighlight:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (SWHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  objc_class *v8;
  id v9;
  void *v10;
  SWHighlight *v11;

  v6 = a4;
  v8 = (objc_class *)MEMORY[0x1E0DA8878];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithCSSearchableItemUniqueIdentifier:forContentType:error:", v9, +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v6), a5);

  if (v10)
  {
    self = -[SWHighlight initWithSLHighlight:](self, "initWithSLHighlight:", v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isLocalResource
{
  void *v2;
  char v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocalResource");

  return v3;
}

- (BOOL)isSyndicatableMedia
{
  void *v2;
  char v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSyndicatableMedia");

  return v3;
}

- (id)livePhotoComplementURL
{
  void *v2;
  void *v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "livePhotoComplementURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resourceUTI
{
  void *v2;
  void *v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWHighlight slHighlight](self, "slHighlight");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("slh"));

}

- (SWHighlight)initWithCoder:(id)a3
{
  id v4;
  SWHighlight *v5;
  void *v6;
  SWHighlight *v7;
  SWHighlightIdentifier *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSecureCoding *identifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SWHighlight;
  v5 = -[SWHighlight init](&v14, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slh"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWHighlight _setSLHighlight:](v5, "_setSLHighlight:", v6);

  -[SWHighlight slHighlight](v5, "slHighlight");
  v7 = (SWHighlight *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [SWHighlightIdentifier alloc];
    -[SWHighlight slHighlight](v5, "slHighlight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SWHighlightIdentifier initWithStringIdentifier:](v8, "initWithStringIdentifier:", v10);
    identifier = v5->_identifier;
    v5->_identifier = (NSSecureCoding *)v11;

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SWHighlight slHighlight](self, "slHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "_setSLHighlight:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SWHighlight slHighlight](self, "slHighlight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "slHighlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SWHighlight slHighlight](self, "slHighlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (unsigned)highlightContentTypeForType:(unsigned __int8)a3
{
  return a3 == 1;
}

- (id)replyContextMenuWithPresentingViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SWHighlightContextMenu *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  SWHighlight *v25;
  id v26;

  v4 = a3;
  -[SWHighlight slHighlight](self, "slHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    v8 = objc_alloc_init(SWHighlightContextMenu);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __60__SWHighlight_replyContextMenuWithPresentingViewController___block_invoke;
    v24 = &unk_1E2873DD0;
    v25 = self;
    v26 = v4;
    v9 = _Block_copy(&v21);
    SWFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REPLY_CONTEXTMENU"), &stru_1E2875070, CFSTR("SharedWithYou"), v21, v22, v23, v24, v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWHighlightContextMenu setTitle:](v8, "setTitle:", v11);

    -[SWHighlightContextMenu setIdentifier:](v8, "setIdentifier:", *MEMORY[0x1E0CD7498]);
    -[SWHighlightContextMenu setActionBlock:](v8, "setActionBlock:", v9);

  }
  else
  {
    SWFrameworkLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SWHighlight replyContextMenuWithPresentingViewController:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v8 = 0;
  }

  return v8;
}

void __60__SWHighlight_replyContextMenuWithPresentingViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "attributions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "attachmentGUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0DA88A8]);
  objc_msgSend(v8, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:", v5, v3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "attributions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SLSendPortraitFeedbackTypeAppButtonForAttribution();

}

- (id)hideContextMenu
{
  void *v3;
  void *v4;
  uint64_t v5;
  SWHighlightContextMenu *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[SWHighlight slHighlight](self, "slHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc_init(SWHighlightContextMenu);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[SWHighlight slHighlight](self, "slHighlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length"))
            objc_msgSend(v7, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__SWHighlight_hideContextMenu__block_invoke;
    aBlock[3] = &unk_1E2873A08;
    v28 = v7;
    v15 = v7;
    v16 = _Block_copy(aBlock);
    SWFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("HIDE_CONTEXTMENU"), &stru_1E2875070, CFSTR("SharedWithYou"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWHighlightContextMenu setTitle:](v6, "setTitle:", v18);

    -[SWHighlightContextMenu setIdentifier:](v6, "setIdentifier:", *MEMORY[0x1E0CD7480]);
    -[SWHighlightContextMenu setActionBlock:](v6, "setActionBlock:", v16);

  }
  else
  {
    SWFrameworkLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SWHighlight hideContextMenu].cold.1(v15, v19, v20, v21, v22, v23, v24, v25);
    v6 = 0;
  }

  return v6;
}

void __30__SWHighlight_hideContextMenu__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        SWFrameworkLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_impl(&dword_18EAB1000, v7, OS_LOG_TYPE_INFO, "[SWHighlight] hideContextMenu invoked. Sending remove action for message guid: %@", buf, 0xCu);
        }

        if (objc_msgSend(v6, "length"))
        {
          objc_msgSend(MEMORY[0x1E0DA88A0], "sharedController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeMessageGUIDFromSyndication:", v6);

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v3);
  }

}

- (id)identifier
{
  return self->_identifier;
}

- (SLHighlight)slHighlight
{
  return self->_slHighlight;
}

- (void)_setSLHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_slHighlight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slHighlight, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)replyContextMenuWithPresentingViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18EAB1000, a1, a3, "[SWHighlight] replyContextMenu: Not generating context menu due to multiple or lack of attributions.", a5, a6, a7, a8, 0);
}

- (void)hideContextMenu
{
  OUTLINED_FUNCTION_0_0(&dword_18EAB1000, a1, a3, "[SWHighlight] hideContextMenu: Not generating context menu due to multiple or lack of attributions.", a5, a6, a7, a8, 0);
}

@end
