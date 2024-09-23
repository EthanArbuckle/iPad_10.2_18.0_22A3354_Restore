@implementation CKTextStorage

- (void)processEditing
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[CKTextStorage editedRange](self, "editedRange");
  v5 = v4;
  -[CKTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", v3, v4);
  v6 = -[CKTextStorage editedMask](self, "editedMask");
  v7 = -[CKTextStorage changeInLength](self, "changeInLength");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTextKit2Enabled");

  if (v9)
  {
    -[CKTextStorage textStorageObserver](self, "textStorageObserver");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, v6, v3, v5, v7, v3, v5);

  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CKTextStorage layoutManagers](self, "layoutManagers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, v6, v3, v5, v7, v3, v5);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

@end
