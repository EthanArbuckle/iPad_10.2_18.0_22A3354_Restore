@implementation AVMutableMediaSelection

- (BOOL)_isValidMediaSelectionOption:(id)a3 forMediaSelectionGroup:(id)a4
{
  int v4;

  if (!a3)
  {
    if ((objc_msgSend(a4, "allowsEmptySelection") & 1) == 0)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    goto LABEL_6;
  }
  if (!a4 || (v4 = objc_msgSend((id)objc_msgSend(a4, "options"), "containsObject:", a3)) != 0)
LABEL_6:
    LOBYTE(v4) = 1;
  return v4;
}

- (id)_validatedGroupIdentifierKey:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVMediaSelection _loadiVarsIfNeeded](self, "_loadiVarsIfNeeded");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *(void **)(-[AVMediaSelection _internal](self, "_internal", 0) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = (void *)*MEMORY[0x1E0CC5E88];
    v10 = (void *)*MEMORY[0x1E0CC5E98];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v9), "isEqual:", objc_msgSend(a3, "_groupID")))v13 = v9;
        else
          v13 = 0;
        if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v10), "isEqual:", objc_msgSend(a3, "_groupMediaType")))v14 = v10;
        else
          v14 = v13;
        if (v14)
        {
          v15 = v14;
          return v14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVMediaSelection _initWithAsset:selectedMediaArray:]([AVMediaSelection alloc], "_initWithAsset:selectedMediaArray:", -[AVMediaSelection asset](self, "asset"), -[AVMediaSelection _selectedMediaArray](self, "_selectedMediaArray"));
}

- (void)selectMediaOption:(AVMediaSelectionOption *)mediaSelectionOption inMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];

  -[AVMediaSelection _loadiVarsIfNeeded](self, "_loadiVarsIfNeeded");
  v7 = -[AVMutableMediaSelection _validatedGroupIdentifierKey:](self, "_validatedGroupIdentifierKey:", mediaSelectionGroup);
  if (v7)
  {
    v8 = v7;
    if (-[AVMutableMediaSelection _isValidMediaSelectionOption:forMediaSelectionGroup:](self, "_isValidMediaSelectionOption:forMediaSelectionGroup:", mediaSelectionOption, mediaSelectionGroup))
    {
      if (mediaSelectionOption)
        v9 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[AVMediaSelectionOption dictionary](mediaSelectionOption, "dictionary"));
      else
        v9 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)v9;
      v11 = *MEMORY[0x1E0CC5E98];
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC5E98]))
      {
        v12 = -[AVMediaSelectionGroup _groupMediaType](mediaSelectionGroup, "_groupMediaType");
        if (!v12)
        {
LABEL_14:
          v13 = *(void **)(-[AVMediaSelection _internal](self, "_internal") + 24);
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __67__AVMutableMediaSelection_selectMediaOption_inMediaSelectionGroup___block_invoke;
          v16[3] = &unk_1E3030948;
          v16[4] = v10;
          v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", v16);
          v15 = *(void **)(-[AVMediaSelection _internal](self, "_internal") + 24);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v15, "addObject:", v10);
          else
            objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v14, v10);
          return;
        }
      }
      else
      {
        v11 = *MEMORY[0x1E0CC5E88];
        if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC5E88])
          || !-[AVMediaSelectionGroup _groupID](mediaSelectionGroup, "_groupID"))
        {
          goto LABEL_14;
        }
        v12 = -[AVMediaSelectionGroup _groupID](mediaSelectionGroup, "_groupID");
      }
      objc_msgSend(v10, "setObject:forKey:", v12, v11);
      goto LABEL_14;
    }
  }
}

uint64_t __67__AVMutableMediaSelection_selectMediaOption_inMediaSelectionGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if ((objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CC5E88]), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0CC5E88])) & 1) != 0|| (result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CC5E98]), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0CC5E98])), (_DWORD)result))
  {
    result = 1;
    *a4 = 1;
  }
  return result;
}

@end
