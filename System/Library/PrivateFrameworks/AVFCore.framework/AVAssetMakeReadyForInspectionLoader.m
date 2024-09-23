@implementation AVAssetMakeReadyForInspectionLoader

- (AVAssetMakeReadyForInspectionLoader)initWithURL:(id)a3
{
  AVAssetMakeReadyForInspectionLoader *v4;
  AVAssetMakeReadyForInspectionLoader *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAssetMakeReadyForInspectionLoader;
  v4 = -[AVAssetInspectorLoader init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_status = 0;
    v4->_loadingMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v5->_URL = (NSURL *)objc_msgSend(a3, "copy");
  }
  return v5;
}

- (void)dealloc
{
  OpaqueFigFormatReader *formatReader;
  objc_super v4;

  formatReader = self->_formatReader;
  if (formatReader)
    CFRelease(formatReader);
  if (self->_loadingMutex)
    FigSimpleMutexDestroy();

  v4.receiver = self;
  v4.super_class = (Class)AVAssetMakeReadyForInspectionLoader;
  -[AVAssetInspectorLoader dealloc](&v4, sel_dealloc);
}

- (id)assetInspector
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (void)cancelLoading
{
  -[AVAssetMakeReadyForInspectionLoader _setStatus:figErrorCode:](self, "_setStatus:figErrorCode:", 4, 0);
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  OpaqueFigFormatReader *result;
  OpaqueFigFormatReader *v4;

  result = self->_formatReader;
  if (result)
    return (OpaqueFigFormatReader *)CFRetain(result);
  v4 = -[AVAssetMakeReadyForInspectionLoader _copyFormatReaderFromFigObjectWithFigErrorCode:](self, "_copyFormatReaderFromFigObjectWithFigErrorCode:", 0);
  if (v4)
    CFRelease(v4);
  -[AVAssetMakeReadyForInspectionLoader _setStatus:figErrorCode:](self, "_setStatus:figErrorCode:", 2, 0);
  result = self->_formatReader;
  if (result)
    return (OpaqueFigFormatReader *)CFRetain(result);
  return result;
}

- (OpaqueFigSimpleMutex)_loadingMutex
{
  return self->_loadingMutex;
}

- (BOOL)_providesAccurateTiming
{
  return 0;
}

- (OpaqueFigFormatReader)_copyFormatReaderFromFigObjectWithFigErrorCode:(int *)a3
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  if (a3)
    *a3 = 0;
  return 0;
}

- (BOOL)_inspectionRequiresAFormatReader
{
  return 1;
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return 0;
}

- (id)_statusOfValueForKeyThatIsAlwaysLoaded
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
}

- (id)_dictionaryOfSpecialGettersForKeyValueStatus
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int64_t)_statusOfValueWhileMutexLockedForKey:(id)a3 error:(id *)a4
{
  void *v6;
  int64_t status;
  id v8;
  uint64_t v10;

  v6 = (void *)objc_msgSend(-[AVAssetMakeReadyForInspectionLoader _dictionaryOfSpecialGettersForKeyValueStatus](self, "_dictionaryOfSpecialGettersForKeyValueStatus"), "objectForKey:", a3);
  if (v6)
  {
    v10 = 0;
    objc_msgSend(v6, "getValue:", &v10);
    status = (int)objc_msgSend((id)-[AVAssetMakeReadyForInspectionLoader performSelector:](self, "performSelector:", v10), "intValue");
    if (!a4)
      return status;
  }
  else
  {
    status = self->_status;
    if (!a4)
      return status;
  }
  if (status == 3)
    v8 = -[AVAssetInspectorLoader _createAVErrorForError:andFigErrorCode:](self, "_createAVErrorForError:andFigErrorCode:", 0, self->_basicInspectionFailureCode);
  else
    v8 = 0;
  *a4 = v8;
  return status;
}

- (BOOL)_statusOfValuesIsTerminalWhileMutexLockedForKeys:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        if (-[AVAssetMakeReadyForInspectionLoader _statusOfValueWhileMutexLockedForKey:error:](self, "_statusOfValueWhileMutexLockedForKey:error:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), 0) < 2)return 0;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 1;
}

- (id)_getAndPruneCompletionsWhileMutexLocked
{
  void *v3;
  void *v4;
  NSMutableArray *keysAwaitingCompletion;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  keysAwaitingCompletion = self->_keysAwaitingCompletion;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keysAwaitingCompletion, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(keysAwaitingCompletion);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[AVAssetMakeReadyForInspectionLoader _statusOfValuesIsTerminalWhileMutexLockedForKeys:](self, "_statusOfValuesIsTerminalWhileMutexLockedForKeys:", objc_msgSend(v10, "objectForKey:", CFSTR("keys"))))
        {
          v11 = objc_msgSend(v10, "objectForKey:", CFSTR("handler"));
          if (v11)
            objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](keysAwaitingCompletion, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  -[NSMutableArray removeObjectsInArray:](self->_keysAwaitingCompletion, "removeObjectsInArray:", v4);
  if (objc_msgSend(v3, "count"))
    return v3;
  else
    return 0;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  int64_t v7;

  MEMORY[0x194033BF8](self->_loadingMutex, a2);
  v7 = -[AVAssetMakeReadyForInspectionLoader _statusOfValueWhileMutexLockedForKey:error:](self, "_statusOfValueWhileMutexLockedForKey:error:", a3, a4);
  MEMORY[0x194033C04](self->_loadingMutex);
  return v7;
}

- (int64_t)_status
{
  return self->_status;
}

- (BOOL)_updateStatusWhileMutexLocked:(int64_t)a3 figErrorCode:(int)a4
{
  int64_t status;
  int64_t v6;
  OpaqueFigFormatReader *v7;
  int v9;

  v9 = a4;
  status = self->_status;
  switch(a3)
  {
    case 1:
      if (status <= 0)
      {
        v6 = 1;
        goto LABEL_13;
      }
      break;
    case 2:
      if (status <= 1)
      {
        if (self->_formatReader
          || (v7 = -[AVAssetMakeReadyForInspectionLoader _copyFormatReaderFromFigObjectWithFigErrorCode:](self, "_copyFormatReaderFromFigObjectWithFigErrorCode:", &v9), (self->_formatReader = v7) != 0)|| !-[AVAssetMakeReadyForInspectionLoader _inspectionRequiresAFormatReader](self, "_inspectionRequiresAFormatReader"))
        {
          v6 = 2;
LABEL_13:
          self->_status = v6;
        }
        else
        {
          self->_status = 3;
          self->_basicInspectionFailureCode = v9;
        }
      }
      break;
    case 3:
      self->_basicInspectionFailureCode = a4;
      goto LABEL_10;
    case 4:
LABEL_10:
      if (status <= 2)
        self->_status = a3;
      break;
    default:
      return status != self->_status;
  }
  return status != self->_status;
}

- (void)_setStatus:(int64_t)a3 figErrorCode:(int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = *(_QWORD *)&a4;
  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x194033BF8](self->_loadingMutex, a2);
  if (-[AVAssetMakeReadyForInspectionLoader _updateStatusWhileMutexLocked:figErrorCode:](self, "_updateStatusWhileMutexLocked:figErrorCode:", a3, v4))
  {
    v7 = -[AVAssetMakeReadyForInspectionLoader _getAndPruneCompletionsWhileMutexLocked](self, "_getAndPruneCompletionsWhileMutexLocked");
  }
  else
  {
    v7 = 0;
  }
  MEMORY[0x194033C04](self->_loadingMutex);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++) + 16))();
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (id)_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)_dictionaryOfSpecialLoadingMethodsForKeys
{
  if (getDictionaryOfSpecialLoadingMethodsForKeys_onceToken != -1)
    dispatch_once(&getDictionaryOfSpecialLoadingMethodsForKeys_onceToken, &__block_literal_global_30);
  return (id)getDictionaryOfSpecialLoadingMethodsForKeys_sSpecialLoadingMethodsForKeys;
}

- (id)_loadValuesWhileMutexLockedForKeys:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v8 = -[AVAssetMakeReadyForInspectionLoader _dictionaryOfSpecialLoadingMethodsForKeys](self, "_dictionaryOfSpecialLoadingMethodsForKeys");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(a3);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = objc_msgSend(v8, "objectForKey:", v13);
        if (v14)
        {
          v15 = v14;
          v16 = v6;
        }
        else
        {
          v16 = v7;
          v15 = v13;
        }
        objc_msgSend(v16, "addObject:", v15);
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }
  if (objc_msgSend(v7, "count"))
  {
    v17 = -[AVAssetMakeReadyForInspectionLoader _loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:](self, "_loadValuesUsingDefaultLoadingMethodWhileMutexLockedForKeys:", a3);
    if (v17)
      objc_msgSend(v5, "addObjectsFromArray:", v17);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v6);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        v25 = 0;
        objc_msgSend(v22, "getValue:", &v25);
        v23 = -[AVAssetMakeReadyForInspectionLoader performSelector:](self, "performSelector:", v25);
        if (v23)
          objc_msgSend(v5, "addObjectsFromArray:", v23);
      }
      v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }
  return v5;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_4;
  MEMORY[0x194033BF8](self->_loadingMutex, a2);
  if (-[AVAssetMakeReadyForInspectionLoader _statusOfValuesIsTerminalWhileMutexLockedForKeys:](self, "_statusOfValuesIsTerminalWhileMutexLockedForKeys:", a3))
  {
    MEMORY[0x194033C04](self->_loadingMutex);
LABEL_4:
    if (a4)
      (*((void (**)(id))a4 + 2))(a4);
    return;
  }
  if (!self->_keysAwaitingCompletion)
    self->_keysAwaitingCompletion = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v7 = (void *)objc_msgSend(a4, "copy");
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("keys"), v7, CFSTR("handler"), 0);

  -[NSMutableArray addObject:](self->_keysAwaitingCompletion, "addObject:", v8);
  if (objc_msgSend(-[AVAssetMakeReadyForInspectionLoader _loadValuesWhileMutexLockedForKeys:](self, "_loadValuesWhileMutexLockedForKeys:", a3), "count"))
  {
    v9 = -[AVAssetMakeReadyForInspectionLoader _getAndPruneCompletionsWhileMutexLocked](self, "_getAndPruneCompletionsWhileMutexLocked");
  }
  else
  {
    v9 = 0;
  }
  MEMORY[0x194033C04](self->_loadingMutex);
  if (objc_msgSend(v9, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVAssetMakeReadyForInspectionLoader assetInspector](self, "assetInspector");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](result, "duration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (id)lyrics
{
  return (id)objc_msgSend(-[AVAssetMakeReadyForInspectionLoader assetInspector](self, "assetInspector"), "lyrics");
}

- (id)figChapterGroupInfo
{
  return 0;
}

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)hasProtectedContent
{
  return 0;
}

- (BOOL)_isStreaming
{
  return 1;
}

- (int64_t)firstFragmentSequenceNumber
{
  return 0;
}

- (int64_t)fragmentCount
{
  return 0;
}

- (void)_serverHasDied
{
  -[AVAssetMakeReadyForInspectionLoader _setStatus:figErrorCode:](self, "_setStatus:figErrorCode:", 3, 268435459);
}

- (id)URL
{
  return self->_URL;
}

@end
