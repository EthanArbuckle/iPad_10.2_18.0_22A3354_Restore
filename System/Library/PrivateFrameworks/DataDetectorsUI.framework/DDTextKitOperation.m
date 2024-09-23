@implementation DDTextKitOperation

- (_NSRange)_addResultsToAttributesInStorage:(id)a3
{
  void *v4;
  void *v5;
  unsigned int (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger location;
  uint64_t i;
  void *v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  NSRange v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  void *v24;
  NSUInteger range1;
  DDTextKitOperation *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  NSRange v35;
  _NSRange result;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  -[DDOperation scannerResults](self, "scannerResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[DDOperation scannerResults](self, "scannerResults");
  else
    -[DDOperation results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    +[DDOperation shouldUrlifyBlockForTypes:](DDOperation, "shouldUrlifyBlockForTypes:", -[DDOperation detectionTypes](self, "detectionTypes"));
    v6 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDOperation context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("ReferenceDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v24 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v10)
    {
      range1 = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_24;
    }
    v11 = v10;
    range1 = 0;
    v26 = self;
    v12 = *(_QWORD *)v30;
    location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (v4)
        {
          v16 = v15;
          v15 = (void *)objc_msgSend(v16, "coreResult");
          if (!v16)
            goto LABEL_19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_19;
        }
        if (((unsigned int (**)(_QWORD, void *, void *, void *))v6)[2](v6, v15, v8, v28))
        {
          v17 = -[DDTextKitOperation _addResultToAttributes:inStorage:editing:](v26, "_addResultToAttributes:inStorage:editing:", v16, v27, location != 0x7FFFFFFFFFFFFFFFLL);
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v19.location = v17;
            v19.length = v18;
            if (location == 0x7FFFFFFFFFFFFFFFLL)
            {
              range1 = v18;
              location = v17;
            }
            else
            {
              v35.location = location;
              v35.length = range1;
              v20 = NSUnionRange(v35, v19);
              location = v20.location;
              range1 = v20.length;
            }
          }
        }
LABEL_19:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v11)
      {
LABEL_24:

        v5 = v24;
        v21 = range1;
        goto LABEL_25;
      }
    }
  }
  v21 = 0;
  location = 0x7FFFFFFFFFFFFFFFLL;
LABEL_25:

  v22 = location;
  v23 = v21;
  result.length = v23;
  result.location = v22;
  return result;
}

uint64_t __63__DDTextKitOperation__addResultToAttributes_inStorage_editing___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "container");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v4, "textStorage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke_2;
    v5[3] = &unk_1E4258E40;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "coordinateAccess:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)textDidChange:(id)a3
{
  ++self->_editCount;
}

- (BOOL)needsToStartOver
{
  int editCount;

  editCount = self->_editCount;
  return editCount > -[DDOperation generationNumber](self, "generationNumber");
}

- (DDTextKitOperation)initWithContainer:(id)a3
{
  id v4;
  DDTextKitOperation *v5;
  DDTextKitOperation *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDTextKitOperation;
  v5 = -[DDOperation initWithContainer:](&v11, sel_initWithContainer_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_range = (_NSRange)xmmword_19F006900;
    v5->_editCount = 1;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CEA168];
      objc_msgSend(v4, "textStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_textDidChange_, v8, v9);

    }
  }

  return v6;
}

- (BOOL)doURLificationOnDocument
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;

  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = -[DDTextKitOperation _addResultsToAttributesInStorage:](self, "_addResultsToAttributesInStorage:", v4),
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = v5;
    v9 = v6;
    v10 = -[DDOperation detectionTypes](self, "detectionTypes");
    -[DDOperation context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dd_makeLinksForResultsInAttributesOfType:context:range:", v10, v11, v8, v9);

    objc_msgSend(v4, "endEditing");
    objc_msgSend(v3, "_containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsDisplay");

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dispatchContainerModificationBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke;
  v6[3] = &unk_1E4258540;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)cleanup
{
  void *v3;
  objc_super v4;

  -[DDOperation setResults:](self, "setResults:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DDTextKitOperation;
  -[DDOperation cleanup](&v4, sel_cleanup);
}

- (void)_updateGenerationNumber
{
  -[DDOperation setGenerationNumber:](self, "setGenerationNumber:", self->_editCount);
}

- (BOOL)_rangeValidForContainer
{
  NSUInteger location;
  BOOL v3;
  unint64_t v4;
  void *v5;
  void *v6;

  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  v4 = self->_range.length + location;
  -[DDOperation container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 <= objc_msgSend(v6, "length");

  return v3;
}

- (__DDScanQuery)_createScanQueryForBackend
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _NSRange *p_range;
  NSUInteger location;
  unint64_t length;
  __DDScanQuery *v10;
  NSUInteger v11;
  NSUInteger v12;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDTextKitOperation _createScanQueryForBackend].cold.1((uint64_t)self);
  -[DDOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (!v6)
  {
    v10 = 0;
    goto LABEL_13;
  }
  p_range = &self->_range;
  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    length = objc_msgSend(v6, "length");
    p_range->location = 0;
    self->_range.length = length;
LABEL_9:
    v11 = 20000;
    goto LABEL_10;
  }
  length = self->_range.length;
  if (!location)
    goto LABEL_9;
  v11 = 100000;
LABEL_10:
  if (length > v11)
  {
    self->_range.length = v11;
    p_range->location = objc_msgSend(v6, "lineRangeForRange:");
    self->_range.length = v12;
    -[DDOperation setNeedContinuation:](self, "setNeedContinuation:", 1);
  }
  v10 = (__DDScanQuery *)DDScanQueryCreateFromString();
LABEL_13:

  return v10;
}

- (_NSRange)_addResultToAttributes:(id)a3 inStorage:(id)a4 editing:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t RangeForURLification;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _NSRange result;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "coreResult");
  RangeForURLification = DDResultGetRangeForURLification();
  v11 = v10;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = *MEMORY[0x1E0CEA0C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__DDTextKitOperation__addResultToAttributes_inStorage_editing___block_invoke;
  v15[3] = &unk_1E4258D38;
  v15[4] = &v16;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v12, RangeForURLification, v10, 0, v15);
  if (*((_BYTE *)v17 + 24))
  {
    v11 = 0;
    RangeForURLification = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (!a5)
      objc_msgSend(v8, "beginEditing");
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0D1CC00], v7, RangeForURLification, v11);
  }
  _Block_object_dispose(&v16, 8);

  v13 = RangeForURLification;
  v14 = v11;
  result.length = v14;
  result.location = v13;
  return result;
}

- (id)newOperationForStartingOver
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DDTextKitOperation;
  v3 = -[DDOperation newOperationForStartingOver](&v7, sel_newOperationForStartingOver);
  -[DDOperation container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRange:", 0, objc_msgSend(v5, "length"));

  return v3;
}

- (id)newOperationForContinuation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DDTextKitOperation;
  v3 = -[DDOperation newOperationForContinuation](&v13, sel_newOperationForContinuation);
  v4 = -[DDTextKitOperation range](self, "range");
  v6 = v4 + v5;
  -[DDOperation container](self, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = -[DDTextKitOperation range](self, "range");
  objc_msgSend(v3, "setRange:", v6, v9 - (v11 + v10));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDTextKitOperation newOperationForContinuation].cold.1(v3);
  return v3;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (void)_createScanQueryForBackend
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 134217984;
  v2 = a1;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "operation %p", (uint8_t *)&v1, 0xCu);
}

- (void)newOperationForContinuation
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;
  NSRange v8;

  v7 = *MEMORY[0x1E0C80C00];
  v8.location = objc_msgSend(a1, "range");
  NSStringFromRange(v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = v2;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Creating continuation %@. The new range is %@", (uint8_t *)&v3, 0x16u);

}

@end
