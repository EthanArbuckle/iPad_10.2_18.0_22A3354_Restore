@implementation PKEmojiAlternativesGenerator

+ (id)sharedInstance
{
  objc_opt_self();
  if (_MergedGlobals_160 != -1)
    dispatch_once(&_MergedGlobals_160, &__block_literal_global_91);
  return (id)qword_1ECEE65F8;
}

void __46__PKEmojiAlternativesGenerator_sharedInstance__block_invoke()
{
  PKEmojiAlternativesGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(PKEmojiAlternativesGenerator);
  v1 = (void *)qword_1ECEE65F8;
  qword_1ECEE65F8 = (uint64_t)v0;

}

- (PKEmojiAlternativesGenerator)init
{
  PKEmojiAlternativesGenerator *v2;
  PKEmojiAlternativesGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKEmojiAlternativesGenerator;
  v2 = -[PKEmojiAlternativesGenerator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKEmojiAlternativesGenerator _connectToRemoteServiceIfNecessary]((uint64_t)v2);
  return v3;
}

- (void)_connectToRemoteServiceIfNecessary
{
  NSObject *v2;
  dispatch_queue_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 8))
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = dispatch_queue_create("com.apple.pencilkit.emoji.xpc", v2);
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.rdt"), 4096);
      v5 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v4;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF5F3F20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "setRemoteObjectInterface:", v6);

      objc_initWeak(&location, (id)a1);
      v7 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke;
      v12[3] = &unk_1E7777588;
      objc_copyWeak(&v13, &location);
      objc_msgSend(*(id *)(a1 + 8), "setInterruptionHandler:", v12);
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_2;
      v10[3] = &unk_1E7777588;
      objc_copyWeak(&v11, &location);
      objc_msgSend(*(id *)(a1 + 8), "setInvalidationHandler:", v10);
      objc_msgSend(*(id *)(a1 + 8), "_setQueue:", v3);
      objc_msgSend(*(id *)(a1 + 8), "resume");
      objc_msgSend(*(id *)(a1 + 8), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_19_0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);

    }
  }
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.pencilkit", "emoji");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "xpc for emoji alternatives interrupted. Retrying connection.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_15;
  block[3] = &unk_1E7777588;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_15(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "invalidate");
    WeakRetained = v2;
  }

}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.pencilkit", "emoji");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "xpc for emoji alternatives invalidated.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_16;
  block[3] = &unk_1E7777588;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_16(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[2];
    v4[2] = 0;

    WeakRetained = v4;
  }

}

void __66__PKEmojiAlternativesGenerator__connectToRemoteServiceIfNecessary__block_invoke_2_17(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "emoji");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection for emoji alternatives: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)clearExistingAlternativesForTextInput:(_QWORD *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    +[PKTextInputUtilities removeTextAlternativesForTextInput:](PKTextInputUtilities, "removeTextAlternativesForTextInput:", a2);
    v3 = (void *)a1[3];
    a1[3] = 0;

    v4 = (void *)a1[4];
    a1[4] = 0;

    v5 = (void *)a1[6];
    a1[6] = 0;

    v6 = (void *)a1[5];
    a1[5] = 0;

    v7 = (void *)a1[7];
    a1[7] = 0;

    v8 = (void *)a1[8];
    a1[8] = 0;

    v9 = (void *)a1[9];
    a1[9] = 0;

  }
}

- (void)scheduleGenerateAlternativesForTextInput:(void *)a3 localeIdentifiers:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v21 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__generateAlternatives, 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__generateAlternativesForWebKit, 0);
    v7 = v21;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      objc_opt_self();
      goto LABEL_9;
    }
    v8 = objc_msgSend(v7, "keyboardType");

    objc_opt_self();
    if ((unint64_t)(v8 - 1) >= 8 && v8 != 11 && v8 != 13 && v8 != 123)
    {
LABEL_9:
      v9 = v7;
      if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EF5F4550) & 1) != 0)
      {
        v10 = v9;

        if (v10)
        {
          v11 = v10;
          v12 = v6;
          objc_storeStrong((id *)(a1 + 64), a2);
          objc_storeStrong((id *)(a1 + 40), a3);
          v13 = objc_alloc_init(MEMORY[0x1E0DC3F60]);
          objc_msgSend(v13, "setFlags:", 2);
          objc_msgSend(v13, "setSurroundingGranularity:", 4);
          objc_msgSend(v13, "setGranularityCount:", 1);
          objc_initWeak(&location, (id)a1);
          v14 = *(_QWORD *)(a1 + 64);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __89__PKEmojiAlternativesGenerator__scheduleGenerateAlternativesForWebKit_localeIdentifiers___block_invoke;
          v22[3] = &unk_1E777DC08;
          objc_copyWeak(&v23, &location);
          +[PKTextInputUtilities requestDocumentContext:forWebDocumentSourceView:completionHandler:](PKTextInputUtilities, "requestDocumentContext:forWebDocumentSourceView:completionHandler:", v13, v14, v22);
          objc_destroyWeak(&v23);
          objc_destroyWeak(&location);

LABEL_14:
          goto LABEL_15;
        }
      }
      else
      {

      }
      objc_storeStrong((id *)(a1 + 24), a2);
      objc_storeStrong((id *)(a1 + 40), a3);
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "emojiConversionDelay");
      v17 = v16;

      objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateOfDocumentWithParagraph:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v18;
      v20 = v18;

      objc_msgSend((id)a1, "performSelector:withObject:afterDelay:", sel__generateAlternatives, 0, v17);
      v11 = 0;
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (uint64_t)cancelScheduledTasks
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", result, sel__generateAlternatives, 0);
    return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v1, sel__generateAlternativesForWebKit, 0);
  }
  return result;
}

- (void)_generateAlternatives
{
  NSObject *v3;
  NSObject *v4;
  UITextInput *v5;
  TIEmojiAlternativesProtocol *remoteObject;
  UITextInput *v7;
  uint64_t v8;
  const char *v9;
  os_log_t v10;
  void *v11;
  void *v12;
  TIEmojiAlternativesProtocol *v13;
  _QWORD v14[4];
  os_log_t v15;
  id v16;
  uint8_t buf[4];
  PKEmojiAlternativesGenerator *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKEmojiAlternativesGenerator _connectToRemoteServiceIfNecessary]((uint64_t)self);
  if (!self->_connection)
  {
    v4 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v18 = self;
    v9 = "Error: missing XPC connection for %@";
LABEL_13:
    _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
    goto LABEL_17;
  }
  if (!self->_localeIdentifiers)
  {
    v4 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 138412290;
    v18 = self;
    v9 = "Error: Missing locale identifiers for %@";
    goto LABEL_13;
  }
  -[TIDocumentState contextBeforeInput](self->_documentState, "contextBeforeInput");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && -[NSObject length](v3, "length"))
  {
    v5 = self->_textInput;
    -[TIEmojiAlternativesProtocol updateForActiveLocaleIdentifiers:](self->_remoteObject, "updateForActiveLocaleIdentifiers:", self->_localeIdentifiers);
    remoteObject = self->_remoteObject;
    v7 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = -[UITextInput keyboardType](v7, "keyboardType");
    else
      v8 = 0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEmojiAlternativesProtocol updateKeyboardType:appIdentifier:](remoteObject, "updateKeyboardType:appIdentifier:", v8, v12);

    objc_initWeak((id *)buf, self);
    v13 = self->_remoteObject;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke;
    v14[3] = &unk_1E777DBE0;
    objc_copyWeak(&v16, (id *)buf);
    v10 = v7;
    v15 = v10;
    -[TIEmojiAlternativesProtocol alternativesForText:completionHandler:](v13, "alternativesForText:completionHandler:", v4, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v10 = os_log_create("com.apple.pencilkit", "emoji");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_error_impl(&dword_1BE213000, v10, OS_LOG_TYPE_ERROR, "Error: Attempting to find alternatives for nil or empty text. %@", buf, 0xCu);
    }
  }

LABEL_17:
}

void __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke_2;
    v8[3] = &unk_1E777DBB8;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v12);
  }

}

void __53__PKEmojiAlternativesGenerator__generateAlternatives__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id *v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v23 = WeakRetained;
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    v7 = v4;
    if (!v6 || !objc_msgSend(v6, "length") || !objc_msgSend(v7, "count"))
    {
      v8 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "No results for emoji conversion.", buf, 2u);
      }
      goto LABEL_10;
    }
    if (v23[3] != v5)
    {
      v8 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "Unexpected error. UITextInput changed while waiting for remote operation.", buf, 2u);
      }
LABEL_10:

      WeakRetained = v23;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0DBDB78], "documentStateOfDocumentWithParagraph:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") >= 4)
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, 3);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v9;
    }
    v10 = v6;
    v7 = v7;
    if (v7)
    {
      if (!v23[3])
      {
        v11 = os_log_create("com.apple.pencilkit", "emoji");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE213000, v11, OS_LOG_TYPE_ERROR, "Unexpected error. No UITextInput to populate with emoji alternatives.", buf, 2u);
        }
        goto LABEL_35;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC12A8]), "initWithPrimaryString:alternativeStrings:isLowConfidence:", v10, v7, 1);
        objc_msgSend(v23[3], "addTextAlternatives:", v11);
LABEL_35:

        goto LABEL_36;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = v23[3];
        objc_msgSend(v12, "selectedTextRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "start");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "positionFromPosition:offset:", v14, --[NSObject length](v10, "length"));
        v11 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23[3], "selectedTextRange");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "start");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && v16)
        {
          objc_msgSend(v23[3], "textRangeFromPosition:toPosition:", v11, v16);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v23[3], "textInRange:", v17);
            v18 = objc_claimAutoreleasedReturnValue();
            if (-[NSObject isEqualToString:](v18, "isEqualToString:", v10))
            {
              objc_msgSend(v23[3], "setSelectedTextRange:", v17);
              objc_msgSend(v23[3], "insertText:alternatives:style:", v10, v7, 1);
              objc_storeStrong(v23 + 6, v3);
              objc_storeStrong(v23 + 7, v17);
            }
            else
            {
              v19 = os_log_create("com.apple.pencilkit", "emoji");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138740227;
                v25 = v18;
                v26 = 2117;
                v27 = v10;
                _os_log_error_impl(&dword_1BE213000, v19, OS_LOG_TYPE_ERROR, "Unexpected error. Trying to replace \"%{sensitive}@\" with \"%{sensitive}@\", buf, 0x16u);
              }

            }
          }
          else
          {
            v18 = os_log_create("com.apple.pencilkit", "emoji");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1BE213000, v18, OS_LOG_TYPE_ERROR, "Unexpected error. Could not find the text replacement range to populate with emoji alternatives.", buf, 2u);
            }
          }

        }
        else
        {
          v17 = os_log_create("com.apple.pencilkit", "emoji");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1BE213000, v17, OS_LOG_TYPE_ERROR, "Unexpected error. Could not find the start and and/or end position in the text to populate with emoji alternatives.", buf, 2u);
          }
        }

        goto LABEL_35;
      }
    }
LABEL_36:

    if (!v23[4] || (-[NSObject isEqualIgnoringMarkedText:](v8, "isEqualIgnoringMarkedText:") & 1) == 0)
    {
      v20 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v20, OS_LOG_TYPE_ERROR, "Either no existing document state or document state changed while waiting for remote operation.", buf, 2u);
      }

      v21 = os_log_create("com.apple.pencilkit", "emoji");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v23[4];
        *(_DWORD *)buf = 138740227;
        v25 = v22;
        v26 = 2117;
        v27 = v8;
        _os_log_error_impl(&dword_1BE213000, v21, OS_LOG_TYPE_ERROR, "document state - cached: %{sensitive}@; current: %{sensitive}@",
          buf,
          0x16u);
      }

    }
    goto LABEL_10;
  }
LABEL_11:

}

void __89__PKEmojiAlternativesGenerator__scheduleGenerateAlternativesForWebKit_localeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 9, a2);
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emojiConversionDelay");
    v8 = v7;

    objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel__generateAlternativesForWebKit, 0, v8);
  }

}

- (void)_generateAlternativesForWebKit
{
  TIEmojiAlternativesProtocol *remoteObject;
  UIWKInteractionViewProtocol *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  UIWKInteractionViewProtocol *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  TIEmojiAlternativesProtocol *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  PKEmojiAlternativesGenerator *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PKEmojiAlternativesGenerator _connectToRemoteServiceIfNecessary]((uint64_t)self);
  if (!self->_connection)
  {
    v6 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v20 = self;
    v7 = "Error: missing XPC connection for %@";
LABEL_9:
    _os_log_error_impl(&dword_1BE213000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0xCu);
    goto LABEL_12;
  }
  if (!self->_localeIdentifiers)
  {
    v6 = os_log_create("com.apple.pencilkit", "emoji");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v20 = self;
    v7 = "Error: Missing locale identifiers for %@";
    goto LABEL_9;
  }
  -[TIEmojiAlternativesProtocol updateForActiveLocaleIdentifiers:](self->_remoteObject, "updateForActiveLocaleIdentifiers:");
  remoteObject = self->_remoteObject;
  v4 = self->_wkInteractionView;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[UIWKInteractionViewProtocol keyboardType](v4, "keyboardType");
  else
    v5 = 0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIEmojiAlternativesProtocol updateKeyboardType:appIdentifier:](remoteObject, "updateKeyboardType:appIdentifier:", v5, v9);

  v10 = self->_wkInteractionView;
  v11 = objc_opt_class();
  -[UIWKDocumentContext contextBefore](self->_wkDocumentContext, "contextBefore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicCast(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v14 = self->_remoteObject;
  objc_msgSend(v13, "string");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke;
  v16[3] = &unk_1E777DBE0;
  objc_copyWeak(&v18, (id *)buf);
  v6 = v10;
  v17 = v6;
  -[TIEmojiAlternativesProtocol alternativesForText:completionHandler:](v14, "alternativesForText:completionHandler:", v15, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

LABEL_12:
}

void __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke_2;
  v9[3] = &unk_1E777DBB8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __62__PKEmojiAlternativesGenerator__generateAlternativesForWebKit__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = v3;
  if (WeakRetained && v5 && objc_msgSend(v6, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v6, "count") >= 4)
    {
      objc_msgSend(v6, "subarrayWithRange:", 0, 3);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12A8]), "initWithPrimaryString:alternativeStrings:isLowConfidence:", v5, v6, 1);
    objc_msgSend(v4, "addTextAlternatives:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wkDocumentContext, 0);
  objc_storeStrong((id *)&self->_wkInteractionView, 0);
  objc_storeStrong((id *)&self->_rangeWithAlternatives, 0);
  objc_storeStrong((id *)&self->_textWithAlternatives, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_textInput, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
