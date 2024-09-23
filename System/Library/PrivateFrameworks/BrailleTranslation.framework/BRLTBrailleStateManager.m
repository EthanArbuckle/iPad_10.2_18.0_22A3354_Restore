@implementation BRLTBrailleStateManager

- (BRLTBrailleStateManager)initWithDelegate:(id)a3 translationDelegate:(id)a4
{
  id v5;
  id v6;
  char *v7;
  BRLTBrailleBuffer *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BRLTBrailleStateManager;
  v5 = a4;
  v6 = a3;
  v7 = -[BRLTBrailleStateManager init](&v15, sel_init);
  v8 = objc_alloc_init(BRLTBrailleBuffer);
  v9 = (void *)*((_QWORD *)v7 + 2);
  *((_QWORD *)v7 + 2) = v8;

  objc_storeWeak((id *)v7 + 27, v6);
  objc_storeWeak((id *)v7 + 28, v5);

  *((_OWORD *)v7 + 10) = xmmword_2114E7BB0;
  *((_OWORD *)v7 + 11) = xmmword_2114E7BB0;
  *((_OWORD *)v7 + 12) = xmmword_2114E7BB0;
  *(_OWORD *)(v7 + 232) = xmmword_2114E7BB0;
  v10 = objc_alloc_init(MEMORY[0x24BDD1788]);
  v11 = (void *)*((_QWORD *)v7 + 31);
  *((_QWORD *)v7 + 31) = v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v15.receiver, v15.super_class);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)*((_QWORD *)v7 + 32);
  *((_QWORD *)v7 + 32) = v12;

  return (BRLTBrailleStateManager *)v7;
}

- (void)setDelegate:(id)a3
{
  NSRecursiveLock *apiLock;
  id v5;

  apiLock = self->_apiLock;
  v5 = a3;
  -[NSRecursiveLock lock](apiLock, "lock");
  objc_storeWeak((id *)&self->_delegate, v5);

  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
}

- (void)setTranslationDelegate:(id)a3
{
  NSRecursiveLock *apiLock;
  id v5;

  apiLock = self->_apiLock;
  v5 = a3;
  -[NSRecursiveLock lock](apiLock, "lock");
  objc_storeWeak((id *)&self->_translationDelegate, v5);

  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
}

- (id)translationDelegate
{
  return objc_loadWeakRetained((id *)&self->_translationDelegate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id WeakRetained;
  BRLTBrailleTranslationDelegateProtocol **p_translationDelegate;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  p_translationDelegate = &self->_translationDelegate;
  v8 = objc_loadWeakRetained((id *)&self->_translationDelegate);
  v9 = objc_msgSend(v5, "initWithDelegate:translationDelegate:", WeakRetained, v8);

  objc_storeStrong((id *)(v9 + 8), self->_scriptString);
  v10 = -[BRLTBrailleBuffer copyWithZone:](self->_brailleBuffer, "copyWithZone:", a3);
  v11 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v10;

  objc_storeStrong((id *)(v9 + 24), self->_staticBrailleString);
  *(_NSRange *)(v9 + 32) = self->_scriptForwardEditingRegion;
  *(_NSRange *)(v9 + 48) = self->_scriptBackwardEditingRegion;
  *(_NSRange *)(v9 + 64) = self->_scriptMergeEditingRegion;
  *(_NSRange *)(v9 + 80) = self->_brailleForwardEditingRegion;
  *(_NSRange *)(v9 + 96) = self->_brailleBackwardEditingRegion;
  *(_NSRange *)(v9 + 112) = self->_brailleMergeEditingRegion;
  *(_NSRange *)(v9 + 128) = self->_activeScriptEditingRegion;
  *(_NSRange *)(v9 + 144) = self->_activeBrailleEditingRegion;
  *(_NSRange *)(v9 + 160) = self->_brailleSelection;
  *(_NSRange *)(v9 + 176) = self->_brailleFocus;
  *(_NSRange *)(v9 + 160) = self->_brailleSelection;
  *(_BYTE *)(v9 + 208) = self->_brailleDirty;
  *(_BYTE *)(v9 + 209) = self->_scriptDirty;
  *(_QWORD *)(v9 + 280) = self->_inputTranslationMode;
  *(_QWORD *)(v9 + 288) = self->_outputTranslationMode;
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)(v9 + 216), v12);

  v13 = objc_loadWeakRetained((id *)p_translationDelegate);
  objc_storeWeak((id *)(v9 + 224), v13);

  return (id)v9;
}

- (BRLTBrailleBuffer)brailleBuffer
{
  return self->_brailleBuffer;
}

- (void)setScriptString:(id)a3
{
  id v5;
  void *v6;
  BRLTScriptString **p_scriptString;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  NSMutableArray *runningScriptStringHistory;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  BRLTScriptString *v28;
  BRLTScriptString *scriptString;
  NSObject *v30;
  char v31;
  uint8_t v32[8];
  _QWORD v33[5];
  id v34;
  uint8_t *v35;
  uint8_t buf[8];
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;

  v5 = a3;
  -[NSRecursiveLock lock](self->_apiLock, "lock");
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_scriptString = &self->_scriptString;
  -[BRLTScriptString string](self->_scriptString, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v8))
  {
    v9 = objc_msgSend(v5, "selection");
    v11 = v10;
    v14 = v9 != -[BRLTScriptString selection](*p_scriptString, "selection") || v11 != v12;
  }
  else
  {
    v14 = 1;
  }

  v15 = self->_pendingScriptSelection.location != 0x7FFFFFFFFFFFFFFFLL
     && (objc_msgSend(v5, "selection") != self->_pendingScriptSelection.location
      || v16 != self->_pendingScriptSelection.length);
  if (!v14 && !v15 && !self->_scriptDirty)
  {
    BRLTLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2114B8000, v27, OS_LOG_TYPE_INFO, "setScriptString: not processing the input since it is identical to the current script string.", buf, 2u);
    }

    v28 = (BRLTScriptString *)objc_msgSend(v5, "copy");
    scriptString = self->_scriptString;
    self->_scriptString = v28;

    -[NSMutableArray removeAllObjects](self->_runningScriptStringHistory, "removeAllObjects");
    goto LABEL_34;
  }
  if (self->_brailleDirty)
    goto LABEL_34;
  if (CFAbsoluteTimeGetCurrent() - self->_lastScriptStringOutputTime >= 5.0)
  {
LABEL_23:
    objc_msgSend(v5, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRLTScriptString string](*p_scriptString, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", v20)
      && objc_msgSend(v5, "selection") == self->_pendingScriptSelection.location
      && v21 == self->_pendingScriptSelection.length)
    {
      objc_msgSend(v5, "textFormattingRanges");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTScriptString textFormattingRanges](*p_scriptString, "textFormattingRanges");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v23)
      {

        goto LABEL_34;
      }
      v24 = (void *)v23;
      objc_msgSend(v5, "textFormattingRanges");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRLTScriptString textFormattingRanges](*p_scriptString, "textFormattingRanges");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v25, "isEqual:", v26);

      if ((v31 & 1) != 0)
        goto LABEL_34;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_scriptString, a3);
    self->_scriptDirty = 1;
    self->_pendingScriptSelection = (_NSRange)xmmword_2114E7BB0;
    -[BRLTBrailleStateManager translate](self, "translate");
LABEL_34:
    -[NSRecursiveLock unlock](self->_apiLock, "unlock");
    goto LABEL_35;
  }
  *(_QWORD *)buf = 0;
  v37 = buf;
  v38 = 0x2020000000;
  v39 = 0x7FFFFFFFFFFFFFFFLL;
  runningScriptStringHistory = self->_runningScriptStringHistory;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __43__BRLTBrailleStateManager_setScriptString___block_invoke;
  v33[3] = &unk_24CBF1058;
  v33[4] = self;
  v34 = v5;
  v35 = buf;
  -[NSMutableArray enumerateObjectsUsingBlock:](runningScriptStringHistory, "enumerateObjectsUsingBlock:", v33);
  if (*((_QWORD *)v37 + 3) == 0x7FFFFFFFFFFFFFFFLL)
  {

    _Block_object_dispose(buf, 8);
    goto LABEL_23;
  }
  BRLTLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_2114B8000, v30, OS_LOG_TYPE_INFO, "setScriptString: not processing the input since it is found in the running history of script strings.", v32, 2u);
  }

  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  -[NSMutableArray removeObjectsInRange:](self->_runningScriptStringHistory, "removeObjectsInRange:", 0, *((_QWORD *)v37 + 3) + 1);

  _Block_object_dispose(buf, 8);
LABEL_35:

}

void __43__BRLTBrailleStateManager_setScriptString___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1[4] + 256), "count") - 1 == a3)
    goto LABEL_4;
  if (objc_msgSend(v7, "isEqual:", a1[5]))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
LABEL_4:
    *a4 = 1;
  }

}

- (void)insertBrailleChar:(id)a3
{
  -[BRLTBrailleStateManager insertBrailleChar:modifiers:](self, "insertBrailleChar:modifiers:", a3, 0);
}

- (void)insertBrailleChar:(id)a3 modifiers:(id)a4
{
  NSRecursiveLock *apiLock;
  id v7;
  id v8;

  apiLock = self->_apiLock;
  v7 = a4;
  v8 = a3;
  -[NSRecursiveLock lock](apiLock, "lock");
  -[BRLTBrailleStateManager insertBrailleChar:modifiers:silently:](self, "insertBrailleChar:modifiers:silently:", v8, v7, 0);

  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
}

- (void)insertBrailleChar:(id)a3 silently:(BOOL)a4
{
  -[BRLTBrailleStateManager insertBrailleChar:modifiers:silently:](self, "insertBrailleChar:modifiers:silently:", a3, 0, a4);
}

- (void)insertBrailleChar:(id)a3 modifiers:(id)a4 silently:(BOOL)a5
{
  id v8;
  NSUInteger location;
  NSUInteger length;
  BOOL v11;
  uint64_t v12;
  id WeakRetained;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  -[NSRecursiveLock lock](self->_apiLock, "lock");
  -[BRLTBrailleStateManager _generateBrailleBufferForInsert](self, "_generateBrailleBufferForInsert");
  -[BRLTBrailleBuffer insertBrailleChar:modifiers:inputMode:](self->_brailleBuffer, "insertBrailleChar:modifiers:inputMode:", v16, v8, self->_inputTranslationMode);
  location = self->_brailleSelection.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = self->_brailleSelection.length;
    v11 = length == 0;
    if (length)
      location = self->_brailleSelection.length;
    v12 = 168;
    if (v11)
      v12 = 160;
    *(Class *)((char *)&self->super.isa + v12) = (Class)(location + 1);
  }
  self->_brailleDirty = 1;
  if (!a5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "brailleDisplayInsertedCharacter:modifiers:", v16, v8);

  }
  v14 = objc_loadWeakRetained((id *)&self->_delegate);
  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v15, self->_brailleSelection.location, self->_brailleSelection.length, v8);

  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
}

- (void)_generateBrailleBufferForInsert
{
  -[BRLTBrailleStateManager _generateBrailleBuffer:](self, "_generateBrailleBuffer:", 0);
}

- (BOOL)_generateBrailleBufferForDelete
{
  return -[BRLTBrailleStateManager _generateBrailleBuffer:](self, "_generateBrailleBuffer:", 1);
}

- (_NSRange)forwardEditingAtomForScriptString:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  if (self->_inputTranslationMode == 2)
    v3 = objc_msgSend(a3, "selection");
  else
    v3 = objc_msgSend(a3, "forwardEditingAtom");
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)backwardEditingAtomForScriptString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a3;
  v5 = v4;
  if (self->_inputTranslationMode == 2)
  {
    if (objc_msgSend(v4, "selection"))
    {
      objc_msgSend(v5, "selection");
      if (!v6)
      {
        v9 = objc_msgSend(v5, "selection") - 1;
        v10 = 1;
        goto LABEL_7;
      }
    }
    v7 = objc_msgSend(v5, "selection");
  }
  else
  {
    v7 = objc_msgSend(v4, "backwardEditingAtom");
  }
  v9 = v7;
  v10 = v8;
LABEL_7:

  v11 = v9;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (_NSRange)deleteMergeAtomForScriptString:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  if (self->_inputTranslationMode == 2)
    v3 = -[BRLTBrailleStateManager backwardEditingAtomForScriptString:](self, "backwardEditingAtomForScriptString:", a3);
  else
    v3 = objc_msgSend(a3, "deleteMergeAtom");
  result.length = v4;
  result.location = v3;
  return result;
}

- (BOOL)_selectionIsValidForDelete
{
  void *v3;
  uint64_t v4;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger length;
  BOOL v14;

  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    location = self->_activeBrailleEditingRegion.location;
    -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = self->_brailleSelection.location;
    if (location != 0x7FFFFFFFFFFFFFFELL && location + 1 <= v8)
      return v7 + location >= v8;
    return 0;
  }
  v11 = self->_brailleBackwardEditingRegion.location;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v12 = self->_brailleSelection.location;
  length = self->_brailleBackwardEditingRegion.length;
  if (!length)
    return v11 == v12;
  v14 = length + v11 >= v12;
  return v11 < v12 && v14;
}

- (BOOL)_selectionIsValidForInsert
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  BOOL result;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;

  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    location = self->_brailleSelection.location;
    v11 = self->_brailleForwardEditingRegion.location;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v11 > location)
      return 0;
    v10 = self->_brailleForwardEditingRegion.length + v11;
    return v10 >= location;
  }
  v5 = self->_activeBrailleEditingRegion.location;
  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  result = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    location = self->_brailleSelection.location;
    if (v5 <= location)
    {
      v10 = v7 + v5;
      return v10 >= location;
    }
  }
  return result;
}

- (BOOL)_generateBrailleBuffer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger length;
  uint64_t v9;
  uint64_t v10;
  _NSRange v11;
  void *v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  BRLTBrailleString *v20;
  NSUInteger location;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BRLTBrailleBuffer *brailleBuffer;
  NSUInteger v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  NSRange v41;

  v3 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = v6;
  if (v3)
  {
    if (v6 && -[BRLTBrailleBuffer cursor](self->_brailleBuffer, "cursor"))
    {
      length = self->_brailleSelection.length;

      if (!length)
        return 0;
    }
    else
    {

    }
    v10 = 96;
    if (self->_brailleBackwardEditingRegion.length == 1)
      v10 = 112;
    v9 = 48;
    if (self->_brailleBackwardEditingRegion.length == 1)
      v9 = 64;
  }
  else
  {

    if (v7)
      return 0;
    v9 = 32;
    v10 = 80;
  }
  v11 = *(_NSRange *)((char *)&self->super.isa + v10);
  self->_activeScriptEditingRegion = *(_NSRange *)((char *)&self->super.isa + v9);
  self->_activeBrailleEditingRegion = v11;
  if (!self->_activeBrailleEditingRegion.length)
    return 0;
  if (self->_activeBrailleEditingRegion.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
    return 0;
  if (self->_inputTranslationMode == self->_outputTranslationMode)
  {
    -[BRLTBrailleString brailleChars](self->_staticBrailleString, "brailleChars");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subarrayWithRange:", self->_activeBrailleEditingRegion.location, self->_activeBrailleEditingRegion.length);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[BRLTScriptString string](self->_scriptString, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringWithRange:", self->_activeScriptEditingRegion.location, self->_activeScriptEditingRegion.length);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
    objc_msgSend(WeakRetained, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v15, 0, self->_inputTranslationMode, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[BRLTBrailleString initWithUnicode:]([BRLTBrailleString alloc], "initWithUnicode:", v19);
    -[BRLTBrailleString brailleChars](v20, "brailleChars");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  location = self->_activeBrailleEditingRegion.location;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v22 = v16;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v36;
    do
    {
      v27 = 0;
      v28 = v25;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v22);
        v41.location = location + v27;
        v29 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v27);
        v25 = 1;
        v41.length = 1;
        if (!NSIntersectionRange((NSRange)self[160], v41).length)
        {
          -[BRLTBrailleBuffer insertBrailleChar:modifiers:inputMode:](self->_brailleBuffer, "insertBrailleChar:modifiers:inputMode:", v29, 0, self->_inputTranslationMode);
          v25 = v28;
        }
        ++v27;
        v28 = v25;
      }
      while (v24 != v27);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      location += v27;
    }
    while (v24);
  }
  else
  {
    LOBYTE(v25) = 0;
  }

  brailleBuffer = self->_brailleBuffer;
  v31 = self->_brailleSelection.location - self->_activeBrailleEditingRegion.location;
  -[BRLTBrailleBuffer brailleString](brailleBuffer, "brailleString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v31 >= v33)
    v34 = v33;
  else
    v34 = v31;
  -[BRLTBrailleBuffer setCursor:](brailleBuffer, "setCursor:", v34);

  return v25 & 1;
}

- (BOOL)deleteBrailleChar
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v3 = -[BRLTBrailleStateManager _deleteBrailleCharSilently:](self, "_deleteBrailleCharSilently:", 0);
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v3;
}

- (BOOL)deleteBrailleCharSilently
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v3 = -[BRLTBrailleStateManager _deleteBrailleCharSilently:](self, "_deleteBrailleCharSilently:", 1);
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v3;
}

- (BOOL)_deleteBrailleCharSilently:(BOOL)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;

  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

    goto LABEL_4;
  }
  v6 = -[BRLTBrailleString length](self->_staticBrailleString, "length");

  if (v6)
  {
LABEL_4:
    -[BRLTScriptString selection](self->_scriptString, "selection");
    if (v7)
      return 0;
    if (!-[BRLTBrailleStateManager _selectionIsValidForDelete](self, "_selectionIsValidForDelete"))
      -[BRLTBrailleStateManager translate](self, "translate");
    if (-[BRLTBrailleStateManager _generateBrailleBufferForDelete](self, "_generateBrailleBufferForDelete"))
    {
      self->_brailleDirty = 1;
LABEL_15:
      -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (!v16)
        -[BRLTBrailleStateManager translate](self, "translate");
      v8 = 1;
      goto LABEL_20;
    }
    -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v10 = -[BRLTBrailleBuffer cursor](self->_brailleBuffer, "cursor");

      if (v10)
      {
        -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "brailleChars");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", -[BRLTBrailleBuffer cursor](self->_brailleBuffer, "cursor") - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[BRLTBrailleBuffer deleteBrailleChar](self->_brailleBuffer, "deleteBrailleChar");
        --self->_brailleSelection.location;
        self->_brailleDirty = 1;
        if (!a3)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "brailleDisplayDeletedCharacter:", v13);

        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    v8 = 0;
LABEL_20:
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v18, self->_brailleSelection.location, self->_brailleSelection.length, 0);

    return v8;
  }
  return 0;
}

- (BOOL)forwardDeleteBrailleChar
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v3 = -[BRLTBrailleStateManager _forwardDeleteBrailleCharSilently:](self, "_forwardDeleteBrailleCharSilently:", 0);
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v3;
}

- (BOOL)forwardDeleteBrailleCharSilently
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v3 = -[BRLTBrailleStateManager _forwardDeleteBrailleCharSilently:](self, "_forwardDeleteBrailleCharSilently:", 1);
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v3;
}

- (BOOL)_forwardDeleteBrailleCharSilently:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  if (-[BRLTBrailleStateManager brailleSelection](self, "brailleSelection") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = -[BRLTBrailleStateManager brailleSelection](self, "brailleSelection");
  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v5 >= v7)
    return 0;
  -[BRLTBrailleStateManager setBrailleSelection:](self, "setBrailleSelection:", -[BRLTBrailleStateManager brailleSelection](self, "brailleSelection") + 1, 0);
  return -[BRLTBrailleStateManager _deleteBrailleCharSilently:](self, "_deleteBrailleCharSilently:", v3);
}

- (void)setBrailleSelection:(_NSRange)a3 needsForwardToScreenReader:(BOOL *)a4 newScriptLocation:(unint64_t *)a5
{
  NSUInteger length;
  NSUInteger location;
  BOOL v10;

  length = a3.length;
  location = a3.location;
  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v10 = -[BRLTBrailleStateManager _setBrailleSelection:newScriptLocation:](self, "_setBrailleSelection:newScriptLocation:", location, length, a5);
  if (a4)
    *a4 = v10;
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
}

- (void)setBrailleSelection:(_NSRange)a3
{
  -[BRLTBrailleStateManager _setBrailleSelection:newScriptLocation:](self, "_setBrailleSelection:newScriptLocation:", a3.location, a3.length, 0);
}

- (BOOL)_setBrailleSelection:(_NSRange)a3 newScriptLocation:(unint64_t *)a4
{
  NSUInteger length;
  unint64_t location;
  void *v8;
  unint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  unint64_t outputTranslationMode;
  void *v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  BRLTScriptString *v23;
  void *v24;
  BRLTScriptString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  BRLTBrailleBuffer *v37;
  BRLTBrailleBuffer *brailleBuffer;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v44;
  uint64_t v45;
  id v46;
  id v47;

  length = a3.length;
  location = a3.location;
  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (location > v9)
  {
    -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    location = objc_msgSend(v10, "length");

  }
  self->_brailleSelection.location = location;
  self->_brailleSelection.length = length;
  WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unicode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  outputTranslationMode = self->_outputTranslationMode;
  v47 = 0;
  objc_msgSend(WeakRetained, "textForPrintBraille:language:mode:locations:", v13, 0, outputTranslationMode, &v47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v47;

  v17 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", self->_brailleSelection.location, self->_brailleSelection.length, v16, objc_msgSend(v15, "length"));
  v19 = v18;
  if (-[BRLTBrailleStateManager _selectionIsValidForInsert](self, "_selectionIsValidForInsert")
    && -[BRLTBrailleStateManager _selectionIsValidForDelete](self, "_selectionIsValidForDelete"))
  {
    -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      -[BRLTBrailleBuffer setCursor:](self->_brailleBuffer, "setCursor:", self->_brailleSelection.location - self->_activeBrailleEditingRegion.location);
LABEL_9:
      v22 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (self->_brailleDirty)
    {
      -[BRLTBrailleStateManager translate](self, "translate");
      goto LABEL_9;
    }
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = [BRLTScriptString alloc];
      -[BRLTScriptString string](self->_scriptString, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[BRLTScriptString initWithString:selection:](v23, "initWithString:selection:", v24, v17, v19);

      -[BRLTScriptString string](self->_scriptString, "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v26, "length");

      v27 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      -[BRLTScriptString string](self->_scriptString, "string");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = self->_outputTranslationMode;
      v46 = 0;
      objc_msgSend(v27, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v28, 0, v29, 0, v45, &v46, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v46;

      self->_scriptForwardEditingRegion.location = -[BRLTBrailleStateManager forwardEditingAtomForScriptString:](self, "forwardEditingAtomForScriptString:", v25);
      self->_scriptForwardEditingRegion.length = v31;
      self->_scriptBackwardEditingRegion.location = -[BRLTBrailleStateManager backwardEditingAtomForScriptString:](self, "backwardEditingAtomForScriptString:", v25);
      self->_scriptBackwardEditingRegion.length = v32;
      self->_scriptMergeEditingRegion.location = -[BRLTBrailleStateManager deleteMergeAtomForScriptString:](self, "deleteMergeAtomForScriptString:", v25);
      self->_scriptMergeEditingRegion.length = v33;
      self->_brailleForwardEditingRegion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptForwardEditingRegion.location, self->_scriptForwardEditingRegion.length, v44, objc_msgSend(v30, "length"));
      self->_brailleForwardEditingRegion.length = v34;
      self->_brailleBackwardEditingRegion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptBackwardEditingRegion.location, self->_scriptBackwardEditingRegion.length, v44, objc_msgSend(v30, "length"));
      self->_brailleBackwardEditingRegion.length = v35;
      self->_brailleMergeEditingRegion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptMergeEditingRegion.location, self->_scriptMergeEditingRegion.length, v44, objc_msgSend(v30, "length"));
      self->_brailleMergeEditingRegion.length = v36;
      self->_activeScriptEditingRegion = (_NSRange)xmmword_2114E7BB0;
      self->_activeBrailleEditingRegion = (_NSRange)xmmword_2114E7BB0;
      v37 = objc_alloc_init(BRLTBrailleBuffer);
      brailleBuffer = self->_brailleBuffer;
      self->_brailleBuffer = v37;

      v39 = objc_loadWeakRetained((id *)&self->_delegate);
      LOBYTE(v28) = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        v40 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v40, "scriptSelectionDidChange:", v17, v19);

      }
    }
  }
  v22 = 1;
LABEL_15:
  self->_pendingScriptSelection.location = v17;
  self->_pendingScriptSelection.length = v19;
  if (a4)
    *a4 = v17;
  v41 = objc_loadWeakRetained((id *)&self->_delegate);
  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v42, self->_brailleSelection.location, self->_brailleSelection.length, 0);

  return v22;
}

- (_NSRange)_textRangeForBrailleRange:(_NSRange)a3 textPositions:(id)a4 scriptLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  NSUInteger v13;
  int64_t v14;
  NSUInteger v15;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v8 = objc_retainAutorelease(a4);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 < 8)
    goto LABEL_15;
  v12 = 0;
  v13 = location + length;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v15 = *(_QWORD *)(v9 + 8 * v12);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v15 >= location)
      v14 = v12;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL && v15 >= v13)
      v11 = v12;
    ++v12;
  }
  while (v10 >> 3 != v12);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_15:
    v14 = a5;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = a5;
  v18 = v11 - v14;

  v19 = v14;
  v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (_NSRange)_brailleRangeForTextRange:(_NSRange)a3 textPositions:(id)a4 brailleLength:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v8 = objc_retainAutorelease(a4);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 < 8)
    goto LABEL_15;
  v12 = 0;
  v13 = location + length;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v15 = *(_QWORD *)(v9 + 8 * v12);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v15 >= location)
      v14 = v12;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL && v15 >= v13)
      v11 = v12;
    ++v12;
  }
  while (v10 >> 3 != v12);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_15:
    v14 = a5;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = a5;
  v18 = v11 - v14;

  v19 = v14;
  v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (void)translate
{
  -[NSRecursiveLock lock](self->_apiLock, "lock");
  -[BRLTBrailleStateManager _translate:](self, "_translate:", 0);
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
}

- (void)translateForced:(BOOL)a3
{
  if (a3)
    self->_scriptDirty = 1;
  -[BRLTBrailleStateManager translate](self, "translate");
}

- (void)_translate:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  _NSRange *p_activeScriptEditingRegion;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id WeakRetained;
  unint64_t inputTranslationMode;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t outputTranslationMode;
  void *v36;
  uint64_t v37;
  NSUInteger length;
  NSUInteger v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  NSUInteger location;
  void *v52;
  uint64_t v53;
  NSUInteger v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  BRLTScriptString *v65;
  BRLTScriptString *scriptString;
  uint64_t v67;
  BRLTScriptString *v68;
  id v69;
  char v70;
  id v71;
  BRLTBrailleBuffer *v72;
  BRLTBrailleBuffer *brailleBuffer;
  id v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  id v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSUInteger v84;
  BRLTBrailleString *v85;
  void *staticBrailleString;
  id v87;
  void *v88;
  unint64_t v89;
  BRLTBrailleString *v90;
  BRLTBrailleString *v91;
  NSUInteger v92;
  NSUInteger v93;
  NSUInteger v94;
  uint64_t v95;
  uint64_t v96;
  NSUInteger v97;
  uint64_t v98;
  uint64_t v99;
  NSUInteger v100;
  NSUInteger v101;
  NSUInteger v102;
  NSUInteger v103;
  BOOL v104;
  BOOL v105;
  id v106;
  void *v107;
  NSUInteger v108;
  void *v109;
  unint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSUInteger v116;
  uint64_t v117;
  NSUInteger v118;
  NSUInteger v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  id v123;
  void *v124;
  unint64_t v125;
  void *v126;
  void *v127;
  id v128;
  NSUInteger v129;
  id v130;
  char v131;
  id v132;
  void *v133;
  uint64_t v134;
  __CFString *v135;
  id v136;
  id v137;
  id v138;
  uint64_t v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;

  if (!self->_scriptDirty)
  {
    if (!self->_brailleDirty)
      goto LABEL_78;
LABEL_7:
    if (self->_editable)
    {
      p_activeScriptEditingRegion = &self->_activeScriptEditingRegion;
      if (self->_activeScriptEditingRegion.location == 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_activeBrailleEditingRegion = self->_brailleMergeEditingRegion;
        *p_activeScriptEditingRegion = self->_scriptMergeEditingRegion;
      }
      v7 = -[BRLTBrailleBuffer cursor](self->_brailleBuffer, "cursor", a3);
      -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9)
      {
        -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unicode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v11, "length") >= 2
          && objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v11, "length") - 1) == 10240
          && self->_inputTranslationMode != 2)
        {
          objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v11, "length") - 1);
          v134 = objc_claimAutoreleasedReturnValue();

          v12 = 1;
          v11 = (void *)v134;
        }
        else
        {
          v12 = 0;
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
        inputTranslationMode = self->_inputTranslationMode;
        v140 = 0;
        objc_msgSend(WeakRetained, "textForPrintBraille:language:mode:locations:", v11, 0, inputTranslationMode, &v140);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v140;

        if (v12)
        {
          v17 = objc_msgSend(v16, "length");
          objc_msgSend(v15, "stringByAppendingString:", CFSTR(" "));
          v18 = objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v19 = (unint64_t)objc_msgSend(v16, "length") >> 3;
            v20 = objc_retainAutorelease(v16);
            v21 = objc_msgSend(v20, "bytes");
            if (v19 <= 1)
              v22 = 1;
            else
              v22 = v19;
            v139 = *(_QWORD *)(v21 + 8 * v22 - 8) + 1;
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v139, 8);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (id)objc_msgSend(v20, "mutableCopy");

            objc_msgSend(v16, "appendData:", v23);
          }
          else
          {
            v139 = 1;
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v139, 8);
            v40 = objc_claimAutoreleasedReturnValue();

            v16 = (id)v40;
          }
        }
        else
        {
          v18 = (uint64_t)v15;
        }
      }
      else
      {
        -[BRLTBrailleString unicode](self->_staticBrailleString, "unicode");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "substringWithRange:", self->_brailleMergeEditingRegion.location, self->_activeBrailleEditingRegion.location - self->_brailleMergeEditingRegion.location);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[BRLTBrailleString unicode](self->_staticBrailleString, "unicode");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "substringWithRange:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringByAppendingString:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        self->_activeBrailleEditingRegion = self->_brailleMergeEditingRegion;
        *p_activeScriptEditingRegion = self->_scriptMergeEditingRegion;
        v34 = objc_loadWeakRetained((id *)&self->_translationDelegate);
        outputTranslationMode = self->_outputTranslationMode;
        v138 = 0;
        objc_msgSend(v34, "textForPrintBraille:language:mode:locations:", v33, 0, outputTranslationMode, &v138);
        v18 = objc_claimAutoreleasedReturnValue();
        v16 = v138;

        v7 += objc_msgSend(v11, "length");
      }

      if (v18)
        v41 = (__CFString *)v18;
      else
        v41 = &stru_24CBF1330;
      -[BRLTScriptString string](self->_scriptString, "string");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "substringToIndex:", self->_activeScriptEditingRegion.location);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v43)
        v45 = (__CFString *)v43;
      else
        v45 = &stru_24CBF1330;
      v46 = v45;

      -[BRLTScriptString string](self->_scriptString, "string");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "substringFromIndex:", self->_activeScriptEditingRegion.length + self->_activeScriptEditingRegion.location);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v48;
      if (v48)
        v50 = (__CFString *)v48;
      else
        v50 = &stru_24CBF1330;
      v135 = v50;

      location = self->_activeBrailleEditingRegion.location;
      -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "length");

      if (location == 0x7FFFFFFFFFFFFFFFLL
        || (v54 = self->_brailleSelection.location, location > v54)
        || v53 + location < v54)
      {
        v57 = objc_loadWeakRetained((id *)&self->_translationDelegate);
        -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "unicode");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = self->_outputTranslationMode;
        v137 = v16;
        objc_msgSend(v57, "textForPrintBraille:language:mode:locations:", v59, 0, v60, &v137);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v137;

        v56 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", self->_brailleSelection.location, self->_brailleSelection.length, v62, objc_msgSend(v61, "length"));
        v16 = v62;
      }
      else
      {
        v55 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", v7, 0, v16, -[__CFString length](v41, "length"));
        v56 = v55 + -[__CFString length](v46, "length");
      }
      -[__CFString stringByAppendingString:](v46, "stringByAppendingString:", v41);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringByAppendingString:", v135);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = -[BRLTScriptString initWithString:selection:]([BRLTScriptString alloc], "initWithString:selection:", v64, v56, 0);
      scriptString = self->_scriptString;
      self->_scriptString = v65;

      self->_scriptDirty = 1;
      if (-[__CFString length](v46, "length") <= v56)
        v67 = v56 - -[__CFString length](v46, "length");
      else
        v67 = 0x7FFFFFFFFFFFFFFFLL;
      v68 = -[BRLTScriptString initWithString:selection:]([BRLTScriptString alloc], "initWithString:selection:", v41, v67, 0);
      v69 = objc_loadWeakRetained((id *)&self->_delegate);
      v70 = objc_opt_respondsToSelector();

      if ((v70 & 1) != 0)
      {
        if ((unint64_t)-[NSMutableArray count](self->_runningScriptStringHistory, "count") >= 6)
          -[NSMutableArray removeObjectAtIndex:](self->_runningScriptStringHistory, "removeObjectAtIndex:", 0);
        -[NSMutableArray addObject:](self->_runningScriptStringHistory, "addObject:", self->_scriptString);
        self->_lastScriptStringOutputTime = CFAbsoluteTimeGetCurrent();
        v71 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v71, "replaceScriptStringRange:withScriptString:cursorLocation:", self->_activeScriptEditingRegion.location, self->_activeScriptEditingRegion.length, v68, v56);

      }
    }
    else
    {
      v24 = objc_loadWeakRetained((id *)&self->_delegate);
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0)
      {
LABEL_52:
        v72 = objc_alloc_init(BRLTBrailleBuffer);
        brailleBuffer = self->_brailleBuffer;
        self->_brailleBuffer = v72;

        *(_WORD *)&self->_brailleDirty = 256;
LABEL_80:
        -[BRLTBrailleStateManager _translate:](self, "_translate:", 1);
        return;
      }
      v26 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "unicode");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "textForPrintBraille:language:mode:locations:", v28, 0, self->_inputTranslationMode, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "length"))
      {
        v29 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v29, "didInsertScriptString:", v16);

      }
    }

    goto LABEL_52;
  }
  if (self->_brailleDirty)
    goto LABEL_7;
  v4 = a3;
  if (-[BRLTScriptString selection](self->_scriptString, "selection") == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_scriptForwardEditingRegion = (_NSRange)xmmword_2114E7BB0;
    self->_scriptBackwardEditingRegion = (_NSRange)xmmword_2114E7BB0;
    self->_brailleForwardEditingRegion = (_NSRange)xmmword_2114E7BB0;
    self->_brailleBackwardEditingRegion = (_NSRange)xmmword_2114E7BB0;
    self->_activeScriptEditingRegion = (_NSRange)xmmword_2114E7BB0;
    self->_activeBrailleEditingRegion = (_NSRange)xmmword_2114E7BB0;
    if (self->_editable)
    {
      v5 = 0;
    }
    else
    {
      -[BRLTScriptString textFormattingRanges](self->_scriptString, "textFormattingRanges");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[BRLTScriptString focus](self->_scriptString, "focus") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v74 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      -[BRLTScriptString string](self->_scriptString, "string");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v75, 0, self->_outputTranslationMode, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v5);
      v76 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[BRLTScriptString string](self->_scriptString, "string");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "length");

      v79 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      -[BRLTScriptString string](self->_scriptString, "string");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = self->_outputTranslationMode;
      v142 = 0;
      objc_msgSend(v79, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v80, 0, v81, 0, v78, &v142, v5);
      v76 = (id)objc_claimAutoreleasedReturnValue();
      v74 = v142;

      v82 = -[BRLTScriptString focus](self->_scriptString, "focus");
      self->_brailleFocus.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v82, v83, v74, objc_msgSend(v76, "length"));
      self->_brailleFocus.length = v84;
    }

    v85 = -[BRLTBrailleString initWithUnicode:]([BRLTBrailleString alloc], "initWithUnicode:", v76);
    staticBrailleString = self->_staticBrailleString;
    self->_staticBrailleString = v85;
  }
  else
  {
    -[BRLTScriptString string](self->_scriptString, "string");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");

    v39 = self->_brailleSelection.location;
    length = self->_brailleSelection.length;
    if (self->_editable)
    {
      v5 = 0;
    }
    else
    {
      -[BRLTScriptString textFormattingRanges](self->_scriptString, "textFormattingRanges");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v87 = objc_loadWeakRetained((id *)&self->_translationDelegate);
    -[BRLTScriptString string](self->_scriptString, "string");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = self->_outputTranslationMode;
    v144 = 0;
    objc_msgSend(v87, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v88, 0, v89, 0, v37, &v144, v5);
    staticBrailleString = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v144;

    v90 = -[BRLTBrailleString initWithUnicode:]([BRLTBrailleString alloc], "initWithUnicode:", staticBrailleString);
    v91 = self->_staticBrailleString;
    self->_staticBrailleString = v90;

    self->_scriptForwardEditingRegion.location = -[BRLTBrailleStateManager forwardEditingAtomForScriptString:](self, "forwardEditingAtomForScriptString:", self->_scriptString);
    self->_scriptForwardEditingRegion.length = v92;
    self->_scriptBackwardEditingRegion.location = -[BRLTBrailleStateManager backwardEditingAtomForScriptString:](self, "backwardEditingAtomForScriptString:", self->_scriptString);
    self->_scriptBackwardEditingRegion.length = v93;
    self->_scriptMergeEditingRegion.location = -[BRLTBrailleStateManager deleteMergeAtomForScriptString:](self, "deleteMergeAtomForScriptString:", self->_scriptString);
    self->_scriptMergeEditingRegion.length = v94;
    v95 = -[BRLTScriptString selection](self->_scriptString, "selection");
    self->_brailleSelection.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v95, v96, v76, objc_msgSend(staticBrailleString, "length"));
    self->_brailleSelection.length = v97;
    v98 = -[BRLTScriptString focus](self->_scriptString, "focus");
    self->_brailleFocus.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v98, v99, v76, objc_msgSend(staticBrailleString, "length"));
    self->_brailleFocus.length = v100;
    self->_brailleForwardEditingRegion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptForwardEditingRegion.location, self->_scriptForwardEditingRegion.length, v76, objc_msgSend(staticBrailleString, "length"));
    self->_brailleForwardEditingRegion.length = v101;
    self->_brailleBackwardEditingRegion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptBackwardEditingRegion.location, self->_scriptBackwardEditingRegion.length, v76, objc_msgSend(staticBrailleString, "length"));
    self->_brailleBackwardEditingRegion.length = v102;
    self->_brailleMergeEditingRegion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptMergeEditingRegion.location, self->_scriptMergeEditingRegion.length, v76, objc_msgSend(staticBrailleString, "length"));
    self->_brailleMergeEditingRegion.length = v103;
    if (v4)
    {
      v104 = self->_brailleSelection.location == v39 && self->_brailleSelection.length == length;
      v105 = v104;
      if (v39 != 0x7FFFFFFFFFFFFFFFLL && !v105)
      {
        v106 = objc_loadWeakRetained((id *)&self->_translationDelegate);
        -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "unicode");
        v108 = v39;
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = self->_outputTranslationMode;
        v143 = 0;
        objc_msgSend(v106, "textForPrintBraille:language:mode:locations:", v109, 0, v110, &v143);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = v143;

        v112 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", v108, length, v136, objc_msgSend(v111, "length"));
        v114 = v113;
        if (v112 == -[BRLTScriptString selection](self->_scriptString, "selection") && v114 == v115)
        {
          v116 = self->_brailleSelection.location;
          if (v116 < -[BRLTBrailleString length](self->_staticBrailleString, "length"))
          {
            self->_brailleSelection.location = v108;
            self->_brailleSelection.length = length;
          }
        }

      }
    }
  }

  v117 = -[BRLTScriptString suggestionRange](self->_scriptString, "suggestionRange");
  v119 = v118;
  if (v117 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_brailleSuggestion.location = 0x7FFFFFFFFFFFFFFFLL;
    self->_brailleSuggestion.length = v118;
  }
  else
  {
    v120 = v117;
    -[BRLTScriptString string](self->_scriptString, "string");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v121, "length");

    v123 = objc_loadWeakRetained((id *)&self->_translationDelegate);
    -[BRLTScriptString string](self->_scriptString, "string");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = self->_outputTranslationMode;
    v141 = 0;
    -[BRLTScriptString textFormattingRanges](self->_scriptString, "textFormattingRanges");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v124, 0, v125, 0, v122, &v141, v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v141;

    self->_brailleSuggestion.location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v120, v119, v128, objc_msgSend(v127, "length"));
    self->_brailleSuggestion.length = v129;

  }
  self->_scriptDirty = 0;
  v130 = objc_loadWeakRetained((id *)&self->_delegate);
  v131 = objc_opt_respondsToSelector();

  if ((v131 & 1) != 0)
  {
    v132 = objc_loadWeakRetained((id *)&self->_delegate);
    -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v133, self->_brailleSelection.location, self->_brailleSelection.length, 0);

  }
LABEL_78:
  if (self->_scriptDirty || self->_brailleDirty)
    goto LABEL_80;
}

- (id)brailleDisplayString
{
  BRLTBrailleString *v3;
  BRLTBrailleString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRLTBrailleString *v12;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  if (!self->_brailleDirty)
  {
    v3 = self->_staticBrailleString;
    goto LABEL_6;
  }
  if (!self->_editable || self->_activeBrailleEditingRegion.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
    v3 = (BRLTBrailleString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v4 = v3;
    goto LABEL_8;
  }
  -[BRLTBrailleString brailleChars](self->_staticBrailleString, "brailleChars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "brailleChars");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceObjectsInRange:withObjectsFromArray:", self->_activeBrailleEditingRegion.location, self->_activeBrailleEditingRegion.length, v8);

  v4 = -[BRLTBrailleString initWithBrailleChars:]([BRLTBrailleString alloc], "initWithBrailleChars:", v6);
LABEL_8:
  if (self->_isTerminalOutput)
  {
    -[BRLTBrailleString unicode](v4, "unicode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("⠿⠀"), "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("⠀⠿"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[BRLTBrailleString initWithUnicode:]([BRLTBrailleString alloc], "initWithUnicode:", v11);
    v4 = v12;
  }
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v4;
}

- (_NSRange)brailleSelection
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_brailleSelection.length;
  location = self->_brailleSelection.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)brailleFocus
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_brailleFocus.length;
  location = self->_brailleFocus.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)brailleSuggestion
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_brailleSuggestion.length;
  location = self->_brailleSuggestion.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)outputScriptString
{
  void *v3;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v3 = (void *)-[BRLTScriptString copy](self->_scriptString, "copy");
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v3;
}

- (_NSRange)scriptEditingRange
{
  void *v3;
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    location = self->_activeScriptEditingRegion.location;
    length = self->_activeScriptEditingRegion.length;
  }
  else
  {
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  v7 = location;
  v8 = length;
  result.length = v8;
  result.location = v7;
  return result;
}

- (unint64_t)scriptLocationForBrailleLocation:(unint64_t)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  BOOL v8;
  id WeakRetained;
  void *v10;
  void *v11;
  unint64_t outputTranslationMode;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  id v26;
  id v27;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  if (self->_editable
    && (length = self->_activeBrailleEditingRegion.length) != 0
    && ((location = self->_activeBrailleEditingRegion.location, v8 = a3 >= location, v7 = a3 - location, v8)
      ? (v8 = v7 >= length)
      : (v8 = 1),
        !v8))
  {
    -[NSRecursiveLock unlock](self->_apiLock, "unlock");
    return self->_activeBrailleEditingRegion.location;
  }
  else if (self->_brailleDirty)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
    -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unicode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    outputTranslationMode = self->_outputTranslationMode;
    v26 = 0;
    objc_msgSend(WeakRetained, "textForPrintBraille:language:mode:locations:", v11, 0, outputTranslationMode, &v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v26;

    v23 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", a3, 0, v14, objc_msgSend(v13, "length"));
    -[NSRecursiveLock unlock](self->_apiLock, "unlock");

  }
  else
  {
    -[BRLTScriptString string](self->_scriptString, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    v17 = objc_loadWeakRetained((id *)&self->_translationDelegate);
    -[BRLTScriptString string](self->_scriptString, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_outputTranslationMode;
    v27 = 0;
    v20 = (id)objc_msgSend(v17, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v18, 0, v19, 0, v16, &v27, 0);
    v21 = v27;

    if (a3 >= (unint64_t)objc_msgSend(v21, "length") >> 3)
    {
      -[NSRecursiveLock unlock](self->_apiLock, "unlock");
      -[BRLTScriptString string](self->_scriptString, "string");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "length");

    }
    else
    {
      v22 = objc_msgSend(objc_retainAutorelease(v21), "bytes");
      -[NSRecursiveLock unlock](self->_apiLock, "unlock");
      v23 = *(_QWORD *)(v22 + 8 * a3);
    }

  }
  return v23;
}

- (unint64_t)brailleLocationForScriptLocation:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  unint64_t outputTranslationMode;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v14;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  -[BRLTBrailleString unicode](self->_staticBrailleString, "unicode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  outputTranslationMode = self->_outputTranslationMode;
  v14 = 0;
  v8 = (id)objc_msgSend(WeakRetained, "textForPrintBraille:language:mode:locations:", v6, 0, outputTranslationMode, &v14);
  v9 = v14;

  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unicode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", a3, 0, v9, objc_msgSend(v11, "length"));

  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  return v12;
}

- (_NSRange)brailleRangeForScriptRange:(_NSRange)a3
{
  NSUInteger location;
  id WeakRetained;
  void *v6;
  unint64_t outputTranslationMode;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;
  NSUInteger v16;
  NSUInteger v17;
  id v18;
  NSRange v19;
  _NSRange result;

  location = a3.location;
  -[NSRecursiveLock lock](self->_apiLock, "lock", a3.location, a3.length);
  WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  -[BRLTBrailleString unicode](self->_staticBrailleString, "unicode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  outputTranslationMode = self->_outputTranslationMode;
  v18 = 0;
  v8 = (id)objc_msgSend(WeakRetained, "textForPrintBraille:language:mode:locations:", v6, 0, outputTranslationMode, &v18);
  v9 = v18;

  -[BRLTBrailleStateManager brailleDisplayString](self, "brailleDisplayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unicode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", location, 0, v9, objc_msgSend(v11, "length"));
  v14 = v13;

  if (self->_editable)
  {
    v15.length = self->_activeBrailleEditingRegion.length;
    if (v15.length)
    {
      v15.location = self->_activeBrailleEditingRegion.location;
      v19.location = v12;
      v19.length = v14;
      if (NSIntersectionRange(v19, v15).location != 0x7FFFFFFFFFFFFFFFLL)
        v14 += self->_activeBrailleEditingRegion.length;
    }
  }
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");

  v16 = v12;
  v17 = v14;
  result.length = v17;
  result.location = v16;
  return result;
}

- (_NSRange)scriptRangeForBrailleRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  -[NSRecursiveLock lock](self->_apiLock, "lock");
  v6 = -[BRLTBrailleStateManager scriptLocationForBrailleLocation:](self, "scriptLocationForBrailleLocation:", location);
  v7 = -[BRLTBrailleStateManager scriptLocationForBrailleLocation:](self, "scriptLocationForBrailleLocation:", location + length);
  -[NSRecursiveLock unlock](self->_apiLock, "unlock");
  v8 = v7 - v6;
  v9 = v6;
  result.length = v8;
  result.location = v9;
  return result;
}

- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v6;
  unint64_t outputTranslationMode;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  id v22;
  _NSRange result;

  -[NSRecursiveLock lock](self->_apiLock, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  -[BRLTBrailleString unicode](self->_staticBrailleString, "unicode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  outputTranslationMode = self->_outputTranslationMode;
  v22 = 0;
  v8 = (id)objc_msgSend(WeakRetained, "textForPrintBraille:language:mode:locations:", v6, 0, outputTranslationMode, &v22);
  v9 = v22;

  v10 = objc_retainAutorelease(v9);
  v11 = objc_msgSend(v10, "bytes");
  v12 = (unint64_t)objc_msgSend(v10, "length") >> 3;
  if (v12 <= a3)
  {
    -[NSRecursiveLock unlock](self->_apiLock, "unlock");
    v19 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v13 = 0;
    v14 = *(_QWORD *)(v11 + 8 * a3);
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v17 = *(_QWORD *)(v11 + 8 * v13);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v17 == v14)
          v16 = v13;
        else
          v16 = 0x7FFFFFFFFFFFFFFFLL;
        if (v17 == v14)
          v18 = v13;
        else
          v18 = v15;
      }
      else
      {
        v18 = v13;
        if (v17 != v14)
          break;
      }
      ++v13;
      v15 = v18;
    }
    while (v12 != v13);
    -[NSRecursiveLock unlock](self->_apiLock, "unlock");
    v19 = v15 - v16 + 1;
  }

  v20 = v16;
  v21 = v19;
  result.length = v21;
  result.location = v20;
  return result;
}

- (void)setOutputTranslationMode:(unint64_t)a3
{
  if (self->_outputTranslationMode != a3)
  {
    self->_outputTranslationMode = a3;
    self->_scriptDirty = 1;
  }
}

- (void)setInputTranslationMode:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  if (self->_inputTranslationMode != a3)
  {
    self->_inputTranslationMode = a3;
    -[BRLTBrailleBuffer brailleString](self->_brailleBuffer, "brailleString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
      self->_brailleDirty = 1;
  }
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)isTerminalOutput
{
  return self->_isTerminalOutput;
}

- (void)setIsTerminalOutput:(BOOL)a3
{
  self->_isTerminalOutput = a3;
}

- (unint64_t)inputTranslationMode
{
  return self->_inputTranslationMode;
}

- (unint64_t)outputTranslationMode
{
  return self->_outputTranslationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningScriptStringHistory, 0);
  objc_storeStrong((id *)&self->_apiLock, 0);
  objc_destroyWeak((id *)&self->_translationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_staticBrailleString, 0);
  objc_storeStrong((id *)&self->_brailleBuffer, 0);
  objc_storeStrong((id *)&self->_scriptString, 0);
}

@end
