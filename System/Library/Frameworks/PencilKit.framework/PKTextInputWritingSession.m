@implementation PKTextInputWritingSession

- (PKTextInputWritingSession)init
{
  PKTextInputWritingSession *v2;
  double v3;
  uint64_t v4;
  NSNumber *sessionIdentifier;
  uint64_t v6;
  NSMutableSet *pendingWritingEndedElements;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKTextInputWritingSession;
  v2 = -[PKTextInputWritingSession init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v2->_beginTimestamp = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", _nextWritingSessionIdentifier);
    v4 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v2->_sessionIdentifier;
    v2->_sessionIdentifier = (NSNumber *)v4;

    ++_nextWritingSessionIdentifier;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    pendingWritingEndedElements = v2->_pendingWritingEndedElements;
    v2->_pendingWritingEndedElements = (NSMutableSet *)v6;

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  NSNumber *sessionIdentifier;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTextInputWritingSession;
  -[PKTextInputWritingSession description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    sessionIdentifier = self->_sessionIdentifier;
  else
    sessionIdentifier = 0;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" identifier: %@"), sessionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCurrentTargetElement:(id *)a1
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    v6 = a1[5];
    if (v6 != v4)
    {
      v7 = v6;
      objc_storeStrong(a1 + 5, a2);
      if (v5 && v7 && (-[PKTextInputElement isEquivalentToElement:]((id *)v7, v5) & 1) != 0)
      {
        objc_msgSend(v7, "swapWritingStateWithElement:", v5);
      }
      else
      {
        v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v28 = a1;
          v29 = 2112;
          v30 = v7;
          v31 = 2112;
          v32 = v5;
          _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "Target element changed for writing session %p. (%@) -> (%@)", buf, 0x20u);
        }

        objc_msgSend(v7, "didMoveToWritingSession:", 0);
        objc_msgSend(v5, "didMoveToWritingSession:", a1);
        v9 = v7;
        if (v9 && (objc_msgSend(a1[2], "containsObject:", v9) & 1) == 0)
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = a1[2];
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v24;
            while (2)
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v24 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
                if ((-[PKTextInputElement isEquivalentToElement:]((id *)v15, v9) & 1) != 0)
                {
                  v16 = v15;

                  if (v16)
                    objc_msgSend(a1[2], "removeObject:", v16, (_QWORD)v23);
                  goto LABEL_22;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
              if (v12)
                continue;
              break;
            }
          }

          v16 = 0;
LABEL_22:
          objc_msgSend(a1[2], "addObject:", v9, (_QWORD)v23);

        }
        -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](a1);
        v17 = v5;
        if (v17)
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v18 = a1[2];
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v24 != v21)
                  objc_enumerationMutation(v18);
                if ((-[PKTextInputElement isEquivalentToElement:](*(id **)(*((_QWORD *)&v23 + 1) + 8 * j), v17) & 1) != 0)
                {

                  goto LABEL_34;
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
              if (v20)
                continue;
              break;
            }
          }

          objc_msgSend(v17, "willBeginWriting");
        }
LABEL_34:

      }
    }
  }

}

- (void)_evaluatePendingWritingEndedElements
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  id WeakRetained;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = a1[2];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (!v3)
    {
      v5 = v2;
      goto LABEL_18;
    }
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = a1[5];
        if (-[PKTextInputElement isEquivalentToElement:]((id *)v9, v8))
        {

        }
        else
        {
          WeakRetained = objc_loadWeakRetained(a1 + 6);
          v11 = objc_msgSend(WeakRetained, "writingSession:elementHasPendingOperations:", a1, v8);

          if ((v11 & 1) == 0)
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "addObject:", v8);
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);

    if (v5)
    {
      -[PKTextInputWritingSession _flushPendingWritingEndedElements:]((uint64_t)a1, v5);
LABEL_18:

    }
  }
}

- (void)invalidate
{
  if (a1)
  {
    -[PKTextInputWritingSession setCurrentTargetElement:]((id *)a1, 0);
    if (objc_msgSend(*(id *)(a1 + 16), "count"))
      -[PKTextInputWritingSession _flushPendingWritingEndedElements:](a1, *(void **)(a1 + 16));
    *(_BYTE *)(a1 + 8) = 1;
  }
}

- (void)_flushPendingWritingEndedElements:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "didEndWriting");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    objc_msgSend(*(id *)(a1 + 16), "minusSet:", v4);
  }

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  PKTextInputWritingSession *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_isInvalidated)
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Deallocating session that hasn't been invalidated %@.", buf, 0xCu);
    }

  }
  if (self->_currentTargetElement)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "Deallocating session that still has a current target element %@.", buf, 0xCu);
    }

  }
  if (-[NSMutableSet count](self->_pendingWritingEndedElements, "count"))
  {
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_error_impl(&dword_1BE213000, v5, OS_LOG_TYPE_ERROR, "Deallocating session that still has pending writing eneded elements %@.", buf, 0xCu);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputWritingSession;
  -[PKTextInputWritingSession dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTargetElement, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingWritingEndedElements, 0);
}

- (void)willBeginWritingInElement:(uint64_t)a1
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a1)
  {
    v3 = (id *)(a1 + 48);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "writingSession:willBeginWritingInElement:", a1, v4);

  }
}

- (void)didEndWritingInElement:(uint64_t)a1
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a1)
  {
    v3 = (id *)(a1 + 48);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "writingSession:didEndWritingInElement:", a1, v4);

  }
}

- (void)didInsertTextInElement:(uint64_t)a1
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a1)
  {
    v3 = (id *)(a1 + 48);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "writingSession:didInsertTextInElement:", a1, v4);

  }
}

@end
