@implementation PKTextInputRecognitionManager

- (void)dealloc
{
  CHTextInputQuery *textInputQuery;
  objc_super v4;

  if (self)
  {
    -[CHRecognitionSession setDataSource:](self->__recognitionSession, "setDataSource:", 0);
    -[CHTextInputQuery setDelegate:](self->__textInputQuery, "setDelegate:", 0);
    textInputQuery = self->__textInputQuery;
  }
  else
  {
    objc_msgSend(0, "setDataSource:", 0);
    objc_msgSend(0, "setDelegate:", 0);
    textInputQuery = 0;
  }
  -[CHTextInputQuery setTextInputTargetsDataSource:](textInputQuery, "setTextInputTargetsDataSource:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PKTextInputRecognitionManager;
  -[PKTextInputRecognitionManager dealloc](&v4, sel_dealloc);
}

- (void)beginRecognitionRequestWithDataSource:(_QWORD *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[4];
    v9 = v3;
    v5 = v3;
    v6 = (void *)a1[3];
    a1[3] = v5;
    v7 = v4;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    a1[6] = v8;
    objc_msgSend(v7, "setNeedsRecognitionUpdate");

    v3 = v9;
  }

}

- (void)setRecognitionLocales:(uint64_t)a1
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v10 = v3;
    v5 = (unint64_t)v3;
    v6 = v4;
    v3 = v10;
    if (v5 | v6)
    {
      if (v5 && v6)
      {
        v7 = objc_msgSend((id)v5, "isEqual:", v6);

        v3 = v10;
        if ((v7 & 1) != 0)
          goto LABEL_9;
      }
      else
      {

      }
      v8 = objc_msgSend((id)v5, "copy");
      v9 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v8;

      -[PKTextInputRecognitionManager _updateRecognitionSession](a1);
      +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
      v3 = v10;
    }
  }
LABEL_9:

}

- (uint64_t)_updateRecognitionSession
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 16), "count");
  v3 = *(void **)(a1 + 32);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D16828]), "initWithMode:", 1);
    v8 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v7;

    objc_msgSend(*(id *)(a1 + 32), "setDataSource:", a1);
    objc_msgSend(*(id *)(a1 + 32), "setPriority:", 1);
  }
  else
  {
    if (v2)
      v5 = 1;
    else
      v5 = v3 == 0;
    if (!v5)
    {
      objc_msgSend(v3, "setDataSource:", 0);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v9 = (void *)MEMORY[0x1E0C99DE8];
    v10 = *(id *)(a1 + 16);
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 16);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__PKTextInputRecognitionManager__updateRecognitionSession__block_invoke;
    v25[3] = &unk_1E777CA98;
    v13 = v11;
    v26 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
    v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v28 = a1;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Recognition Manager %p: Set recognition locales: %@", buf, 0x16u);

    }
    v16 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + 16);
    objc_msgSend(v16, "setPreferredLocales:", v17);

    if (*(_BYTE *)(a1 + 8))
      v18 = 2;
    else
      v18 = 1;
    objc_msgSend(*(id *)(a1 + 32), "setRecognitionEnvironment:", v18);

  }
  v19 = *(id *)(a1 + 40);
  if (v19)
  {

  }
  else if (*(_QWORD *)(a1 + 32))
  {
    v20 = objc_alloc(MEMORY[0x1E0D16878]);
    v21 = *(id *)(a1 + 32);
    v22 = objc_msgSend(v20, "initWithRecognitionSession:", v21);
    v23 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v22;

    objc_msgSend(*(id *)(a1 + 40), "setDelegate:", a1);
    objc_msgSend(*(id *)(a1 + 40), "setTextInputTargetsDataSource:", a1);
    objc_msgSend(*(id *)(a1 + 40), "setPreferredUpdatesInterval:", 0.0);
    objc_msgSend(*(id *)(a1 + 40), "start");
  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  return +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
}

- (uint64_t)setPreferOutOfProcessRecognition:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned __int8 *)(result + 8) != a2)
    {
      *(_BYTE *)(result + 8) = a2;
      -[PKTextInputRecognitionManager _updateRecognitionSession](result);
      return +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    }
  }
  return result;
}

void __58__PKTextInputRecognitionManager__updateRecognitionSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(a2, "localeIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E777DEE8;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

- (void)queryDidUpdateResult:(id)a3
{
  CHTextInputQuery *v4;
  CHTextInputQuery *v5;
  CHTextInputQuery *textInputQuery;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  CHTextInputQuery *v13;
  uint8_t buf[4];
  PKTextInputRecognitionManager *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (CHTextInputQuery *)a3;
  v5 = v4;
  if (self)
    textInputQuery = self->__textInputQuery;
  else
    textInputQuery = 0;
  if (textInputQuery == v4)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "debugRecognitionRequestArtificialDelay");
    v9 = v8;

    if (v9 <= 0.01)
    {
      -[PKTextInputRecognitionManager _processQueryDidUpdateResult:]((uint64_t)self, v5);
    }
    else
    {
      v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v15 = self;
        v16 = 2048;
        v17 = v9;
        _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Recognition Manager %p: debug artificial delay for queryDidUpdateResult: %0.2f", buf, 0x16u);
      }

      v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__PKTextInputRecognitionManager_queryDidUpdateResult___block_invoke;
      v12[3] = &unk_1E7777C20;
      v12[4] = self;
      v13 = v5;
      dispatch_after(v11, MEMORY[0x1E0C80D38], v12);

    }
  }

}

void __54__PKTextInputRecognitionManager_queryDidUpdateResult___block_invoke(uint64_t a1)
{
  -[PKTextInputRecognitionManager _processQueryDidUpdateResult:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_processQueryDidUpdateResult:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 24);
    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    if (v3)
    {
      objc_msgSend(v14, "lastProcessedStrokeProviderVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      objc_msgSend(v3, "recognitionManagerStrokeProvider:", a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "strokeProviderVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v11 = v10 - *(double *)(a1 + 48);
      *(double *)(a1 + 56) = v11;
      if (v6 >= v9)
      {
        objc_msgSend(v14, "availableItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "recognitionManager:recognitionDidFinishWithQueryItems:duration:", a1, v13, v11);

      }
      else
      {
        objc_msgSend(v14, "lastProcessedStrokeProviderVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          objc_msgSend(v3, "recognitionManager:recognitionDidFinishWithQueryItems:duration:", a1, MEMORY[0x1E0C9AA60], v11);
      }

    }
  }

}

- (id)strokeProviderSnapshot
{
  PKTextInputRecognitionManagerDataSource *v3;
  PKDrawing *v4;
  PKTextInputStrokeProvider *v5;
  PKTextInputStrokeProvider *v6;

  if (self && (v3 = self->_currentDataSource) != 0)
  {
    v4 = (PKDrawing *)v3;
    -[PKTextInputRecognitionManagerDataSource recognitionManagerStrokeProvider:](v3, "recognitionManagerStrokeProvider:", self);
    v5 = (PKTextInputStrokeProvider *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(PKDrawing);
    v5 = -[PKTextInputStrokeProvider initWithDrawing:]([PKTextInputStrokeProvider alloc], "initWithDrawing:", v4);
  }
  v6 = v5;

  return v6;
}

- (NSArray)textInputTargets
{
  PKTextInputRecognitionManager *v2;
  void *v3;

  v2 = self;
  if (self)
    self = (PKTextInputRecognitionManager *)self->_currentDataSource;
  -[PKTextInputRecognitionManager recognitionManagerTextInputTargets:](self, "recognitionManagerTextInputTargets:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  return (NSArray *)v3;
}

- (id)textInputTargetForItemStableIdentifier:(id)a3 strokeIdentifiers:(id)a4
{
  return -[PKTextInputRecognitionManager textInputTargetForItemStableIdentifier:strokeIdentifiers:simultaneousItemStableIdentifiers:](self, "textInputTargetForItemStableIdentifier:strokeIdentifiers:simultaneousItemStableIdentifiers:", a3, a4, MEMORY[0x1E0C9AA60]);
}

- (id)textInputTargetForItemStableIdentifier:(id)a3 strokeIdentifiers:(id)a4 simultaneousItemStableIdentifiers:(id)a5
{
  PKTextInputRecognitionManager *v8;

  v8 = self;
  if (self)
    self = (PKTextInputRecognitionManager *)self->_currentDataSource;
  return (id)-[PKTextInputRecognitionManager recognitionManager:textInputTargetForItemStableIdentifier:strokeIdentifiers:simultaneousItemStableIdentifiers:](self, "recognitionManager:textInputTargetForItemStableIdentifier:strokeIdentifiers:simultaneousItemStableIdentifiers:", v8, a3, a4, a5);
}

- (void)fetchContentInfoForTextInputTarget:(id)a3 strokeIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  PKTextInputRecognitionManagerDataSource *currentDataSource;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (self && (currentDataSource = self->_currentDataSource) != 0)
    -[PKTextInputRecognitionManagerDataSource recognitionManager:fetchContentInfoForTextInputTarget:strokeIdentifiers:completion:](currentDataSource, "recognitionManager:fetchContentInfoForTextInputTarget:strokeIdentifiers:completion:", self, v11, v8, v9);
  else
    v9[2](v9, 0);

}

- (void)reportDebugStateDescription:(id)a3
{
  void (**v4)(id, const __CFString *, void *);
  NSArray *recognitionLocales;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  CHTextInputQuery *textInputQuery;
  void *v17;
  double lastRecognitionDuration;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, const __CFString *, void *))a3;
  if (self)
    recognitionLocales = self->_recognitionLocales;
  else
    recognitionLocales = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](recognitionLocales, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (self)
    v7 = self->_recognitionLocales;
  else
    v7 = 0;
  v8 = v7;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "localeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v6, "addObject:", v13);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Locales"), v14);
  if (self)
  {
    -[CHRecognitionSession description](self->__recognitionSession, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, CFSTR("Recognition session"), v15);

    textInputQuery = self->__textInputQuery;
  }
  else
  {
    objc_msgSend(0, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, CFSTR("Recognition session"), v20);

    textInputQuery = 0;
  }
  -[CHTextInputQuery description](textInputQuery, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Text input query"), v17);

  if (self)
    lastRecognitionDuration = self->__lastRecognitionDuration;
  else
    lastRecognitionDuration = 0.0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f s"), *(_QWORD *)&lastRecognitionDuration);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("Last request duration"), v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textInputQuery, 0);
  objc_storeStrong((id *)&self->__recognitionSession, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_recognitionLocales, 0);
}

@end
