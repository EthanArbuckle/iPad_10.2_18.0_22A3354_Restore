@implementation AVMediaSelection

- (id)_initWithAsset:(id)a3 selectedMediaArray:(id)a4
{
  AVMediaSelection *v6;
  AVMediaSelectionInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMediaSelection;
  v6 = -[AVMediaSelection init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVMediaSelectionInternal);
    v6->_mediaSelection = v7;
    if (v7)
    {
      v6->_mediaSelection->assetWeakReference = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
      v6->_mediaSelection->groupDictionaries = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "_mediaSelectionGroupDictionaries"), "copy");
      if (a4)
        v6->_mediaSelection->selectedMediaArray = (NSMutableArray *)objc_msgSend(a4, "mutableCopy");
      else
        -[AVMediaSelection _loadiVarsIfNeeded](v6, "_loadiVarsIfNeeded");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (AVMediaSelectionOption)selectedMediaOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  id v4;

  v4 = -[AVMediaSelection _propertyListForSelectedMediaOptionInMediaSelectionGroup:](self, "_propertyListForSelectedMediaOptionInMediaSelectionGroup:");
  if (v4)
    return -[AVMediaSelectionGroup mediaSelectionOptionWithPropertyList:](mediaSelectionGroup, "mediaSelectionOptionWithPropertyList:", v4);
  else
    return -[AVMediaSelectionGroup defaultOption](mediaSelectionGroup, "defaultOption");
}

- (id)_propertyListForSelectedMediaOptionInMediaSelectionGroup:(id)a3
{
  NSMutableArray *selectedMediaArray;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AVMediaSelection _loadiVarsIfNeeded](self, "_loadiVarsIfNeeded");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  selectedMediaArray = self->_mediaSelection->selectedMediaArray;
  v6 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](selectedMediaArray, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v8 = *(_QWORD *)v15;
    v9 = *MEMORY[0x1E0CC5E88];
    v10 = *MEMORY[0x1E0CC5E98];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(selectedMediaArray);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v9), "isEqual:", objc_msgSend(a3, "_groupID")) & 1) != 0
          || objc_msgSend((id)objc_msgSend(v12, "objectForKey:", v10), "isEqual:", objc_msgSend(a3, "_groupMediaType")))
        {
          v6 = (void *)objc_msgSend(v12, "copy");
          return v6;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](selectedMediaArray, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 = 0;
      if (v7)
        continue;
      break;
    }
  }
  return v6;
}

- (void)_loadiVarsIfNeeded
{
  AVMediaSelectionInternal *mediaSelection;

  mediaSelection = self->_mediaSelection;
  if (!mediaSelection->groupDictionaries)
  {
    self->_mediaSelection->groupDictionaries = (NSArray *)objc_msgSend(-[AVAsset _mediaSelectionGroupDictionaries](-[AVMediaSelection asset](self, "asset"), "_mediaSelectionGroupDictionaries"), "copy");
    mediaSelection = self->_mediaSelection;
  }
  if (!mediaSelection->selectedMediaArray)
    -[AVMediaSelection _createDefaultMediaSelectionOptions](self, "_createDefaultMediaSelectionOptions");
}

- (id)_initWithDeferredLoadingOfAsset:(id)a3 selectedMediaArray:(id)a4
{
  AVMediaSelection *v6;
  AVMediaSelectionInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMediaSelection;
  v6 = -[AVMediaSelection init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVMediaSelectionInternal);
    v6->_mediaSelection = v7;
    if (v7)
    {
      v6->_mediaSelection->assetWeakReference = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
      v6->_mediaSelection->groupDictionaries = 0;
      v6->_mediaSelection->selectedMediaArray = (NSMutableArray *)objc_msgSend(a4, "mutableCopy");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (id)_initWithAsset:(id)a3
{
  return -[AVMediaSelection _initWithAsset:selectedMediaArray:](self, "_initWithAsset:selectedMediaArray:", a3, 0);
}

- (id)_initWithAssetWithoutGroupDictionaries:(id)a3
{
  AVMediaSelection *v4;
  AVMediaSelectionInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMediaSelection;
  v4 = -[AVMediaSelection init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVMediaSelectionInternal);
    v4->_mediaSelection = v5;
    if (v5)
    {
      v4->_mediaSelection->assetWeakReference = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
      v4->_mediaSelection->groupDictionaries = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v4->_mediaSelection->selectedMediaArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)_selectedMediaArray
{
  -[AVMediaSelection _loadiVarsIfNeeded](self, "_loadiVarsIfNeeded");
  return (id)-[NSMutableArray copy](self->_mediaSelection->selectedMediaArray, "copy");
}

- (id)_groupDictionaries
{
  -[AVMediaSelection _loadiVarsIfNeeded](self, "_loadiVarsIfNeeded");
  return self->_mediaSelection->groupDictionaries;
}

- (void)_createDefaultMediaSelectionOptions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  AVMediaSelection *v17;
  NSArray *obj;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = self;
  obj = self->_mediaSelection->groupDictionaries;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    v23 = *MEMORY[0x1E0CC5E98];
    v3 = *MEMORY[0x1E0CC5E88];
    v20 = *MEMORY[0x1E0CC5EA0];
    v4 = *MEMORY[0x1E0CC5EF8];
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "objectForKey:", v23);
        v8 = objc_msgSend(v6, "objectForKey:", v3);
        v9 = (void *)objc_msgSend(v6, "objectForKey:", v20);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v4), "BOOLValue"))
              {
                v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v14);
                v16 = v15;
                if (v7)
                  objc_msgSend(v15, "setObject:forKey:", v7, v23);
                if (v8)
                  objc_msgSend(v16, "setObject:forKey:", v8, v3);
                objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AVMediaSelection_DefaultSelection"));
                -[NSMutableArray addObject:](v19, "addObject:", v16);
                goto LABEL_20;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_20:
        ;
      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }
  v17->_mediaSelection->selectedMediaArray = v19;
}

- (AVMediaSelection)initWithAsset:(id)a3 propertyList:(id)a4
{
  AVMediaSelection *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = self;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"[propertyList isKindOfClass:[NSArray class]]"), 0);
    objc_exception_throw(v15);
  }
  return (AVMediaSelection *)-[AVMediaSelection _initWithAsset:selectedMediaArray:](self, "_initWithAsset:selectedMediaArray:", a3, a4);
}

- (void)dealloc
{
  AVMediaSelectionInternal *mediaSelection;
  objc_super v4;

  mediaSelection = self->_mediaSelection;
  if (mediaSelection)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaSelection;
  -[AVMediaSelection dealloc](&v4, sel_dealloc);
}

- (id)_dictionaryGroupsWithSelectedOption
{
  void *v3;
  NSMutableArray *selectedMediaArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[AVMediaSelection _loadiVarsIfNeeded](self, "_loadiVarsIfNeeded");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  selectedMediaArray = self->_mediaSelection->selectedMediaArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](selectedMediaArray, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(selectedMediaArray);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = 0;
        v10 = -[AVAsset mediaSelectionGroupForPropertyList:mediaSelectionOption:](-[AVMediaSelection asset](self, "asset"), "mediaSelectionGroupForPropertyList:mediaSelectionOption:", v9, &v12);
        if (v12)
          objc_msgSend(v3, "setObject:forKey:", v12, v10);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](selectedMediaArray, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)description
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = -[AVMediaSelection _dictionaryGroupsWithSelectedOption](self, "_dictionaryGroupsWithSelectedOption");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    v7 = CFSTR("{");
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v5 + (int)i >= 1)
          v7 = (__CFString *)-[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR(","));
        v7 = (__CFString *)-[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR(" %@ : %@ "), objc_msgSend(v9, "_primaryMediaCharacteristic"), objc_msgSend(v2, "objectForKey:", v9));
      }
      v5 += v4;
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v7 = CFSTR("{");
  }
  v10 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("}"));
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, group characteristics and selected options = %@>"), NSStringFromClass(v12), self, v10);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVMediaSelection _dictionaryGroupsWithSelectedOption](self, "_dictionaryGroupsWithSelectedOption"), "isEqualToDictionary:", objc_msgSend(a3, "_dictionaryGroupsWithSelectedOption"));
  else
    return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[AVMediaSelection _dictionaryGroupsWithSelectedOption](self, "_dictionaryGroupsWithSelectedOption"), "hash");
}

- (id)_internal
{
  return self->_mediaSelection;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[AVMediaSelection _initWithAsset:selectedMediaArray:]([AVMutableMediaSelection alloc], "_initWithAsset:selectedMediaArray:", -[AVMediaSelection asset](self, "asset"), -[AVMediaSelection _selectedMediaArray](self, "_selectedMediaArray"));
}

- (AVAsset)asset
{
  return (AVAsset *)-[AVWeakReference referencedObject](self->_mediaSelection->assetWeakReference, "referencedObject");
}

- (BOOL)mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup
{
  id v3;
  void *v4;

  v3 = -[AVMediaSelection _propertyListForSelectedMediaOptionInMediaSelectionGroup:](self, "_propertyListForSelectedMediaOptionInMediaSelectionGroup:", mediaSelectionGroup);
  if (v3
    && (v4 = v3,
        (objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("AVMediaSelection_DefaultSelection")), "BOOLValue") & 1) == 0))
  {
    return objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CC5460]), "BOOLValue");
  }
  else
  {
    return 1;
  }
}

@end
