@implementation ATXClipboardContents

- (ATXClipboardContents)initWithDevice:(id)a3 pasteboardConnection:(id)a4
{
  id v7;
  id v8;
  ATXClipboardContents *v9;
  ATXClipboardContents *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXClipboardContents;
  v9 = -[ATXClipboardContents init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_pasteboardServerConnection, a4);
    objc_msgSend((id)objc_opt_class(), "_observeLocalPasteboard");
  }

  return v10;
}

- (ATXClipboardContents)initWithDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ATXClipboardContents *v7;

  v4 = (void *)MEMORY[0x1E0D6C0E8];
  v5 = a3;
  objc_msgSend(v4, "defaultConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXClipboardContents initWithDevice:pasteboardConnection:](self, "initWithDevice:pasteboardConnection:", v5, v6);

  return v7;
}

- (ATXClipboardContents)contentsWithCallback:(id)a3
{
  void (**v4)(id, void *, void *, void *, _QWORD);
  dispatch_semaphore_t v5;
  PBServerConnection *pasteboardServerConnection;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXClipboardContents *result;
  __int16 v15[8];
  _QWORD v16[4];
  NSObject *v17;
  ATXClipboardContents *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = (void (**)(id, void *, void *, void *, _QWORD))a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v5 = dispatch_semaphore_create(0);
  pasteboardServerConnection = self->_pasteboardServerConnection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__ATXClipboardContents_contentsWithCallback___block_invoke;
  v16[3] = &unk_1E82C4D30;
  v19 = &v21;
  v7 = v5;
  v20 = &v27;
  v17 = v7;
  v18 = self;
  -[PBServerConnection localGeneralPasteboardCompletionBlock:](pasteboardServerConnection, "localGeneralPasteboardCompletionBlock:", v16);
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v7, 5.0) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1, MEMORY[0x1E0C9AA70]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "Getting pasteboard contents timed out", (uint8_t *)v15, 2u);
    }

    if (!v8)
      goto LABEL_9;
  }
  else
  {
    v10 = (void *)v22[5];
    if (!v10)
    {
LABEL_9:
      objc_msgSend((id)v28[5], "content");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v28[5], "creationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v28[5], "originatorBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11, v12, v13, 0);

      v8 = 0;
      goto LABEL_10;
    }
    v8 = v10;
  }
  ((void (**)(id, void *, void *, void *, id))v4)[2](v4, 0, 0, 0, v8);
LABEL_10:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return result;
}

+ (void)_observeLocalPasteboard
{
  if (_observeLocalPasteboard_onceToken != -1)
    dispatch_once(&_observeLocalPasteboard_onceToken, &__block_literal_global_4);
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke()
{
  NSObject *v0;
  const char *v1;
  NSObject *v2;
  int out_token;

  __atxlog_handle_heuristic();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_cold_1(v0);

  out_token = 0;
  v1 = (const char *)objc_msgSend(CFSTR("com.apple.pasteboard.notify.changed"), "UTF8String");
  dispatch_get_global_queue(9, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch(v1, &out_token, v2, &__block_literal_global_28);

}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_26()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  __atxlog_handle_heuristic();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1C99DF000, v0, OS_LOG_TYPE_INFO, "Received com.apple.pasteboard.notify.changed notification. Checking .changeCount ...", v2, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D6C0E8], "defaultConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localGeneralPasteboardCompletionBlock:", &__block_literal_global_31);

}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = a2;
  __atxlog_handle_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_29_cold_1();

  if (sLastPasteboardChangeCount
    && (v4 = objc_msgSend(v2, "changeCount"), v4 == objc_msgSend((id)sLastPasteboardChangeCount, "integerValue")))
  {
    __atxlog_handle_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C99DF000, v5, OS_LOG_TYPE_INFO, "Local pasteboard has not changed. Not posting ATXLocalPasteboardDidChangeNotification", v7, 2u);
    }
  }
  else
  {
    __atxlog_handle_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_INFO, "Local pasteboard changed! Posting ATXLocalPasteboardDidChangeNotification!", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v5, "postNotificationName:object:", CFSTR("ATXLocalPasteboardDidChangeNotification"), 0);
  }

}

void __45__ATXClipboardContents_contentsWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char CanLearnFromApp;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  id v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  id v46;
  int8x16_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[4];
  void *v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  __atxlog_handle_heuristic();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __45__ATXClipboardContents_contentsWithCallback___block_invoke_cold_1((uint64_t)v6, v8);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    goto LABEL_33;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_29_cold_1();

  if (sLastPasteboardChangeCount)
  {
    v9 = objc_msgSend(v5, "changeCount");
    if (v9 == objc_msgSend((id)sLastPasteboardChangeCount, "integerValue"))
    {
      if (sLastPasteboardContents
        && (objc_msgSend((id)sLastPasteboardContents, "creationDate"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "timeIntervalSinceNow"),
            v12 = fabs(v11),
            v10,
            v12 < 1800.0))
      {
        __atxlog_handle_heuristic();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "Local pasteboard has not changed. Returning early with cached clipboard contents.", buf, 2u);
        }

        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v15 = (id)sLastPasteboardContents;
        v16 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v15;
      }
      else
      {
        __atxlog_handle_heuristic();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v42, OS_LOG_TYPE_DEFAULT, "Local pasteboard has not changed. The clipboard contents are too old.", buf, 2u);
        }

        v16 = (void *)sLastPasteboardContents;
        sLastPasteboardContents = 0;
      }

LABEL_33:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      goto LABEL_34;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "changeCount"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)sLastPasteboardChangeCount;
  sLastPasteboardChangeCount = v17;

  __atxlog_handle_heuristic();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v56 = sLastPasteboardChangeCount;
    v57 = 2112;
    v58 = v20;
    _os_log_impl(&dword_1C99DF000, v19, OS_LOG_TYPE_INFO, "sLastPasteboardChangeCount is now: %@ - %@", buf, 0x16u);
  }

  objc_msgSend(v5, "originatorBundleID");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v5, "originatorBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CanLearnFromApp = ATXHeuristicCanLearnFromApp(v24);

    if ((CanLearnFromApp & 1) == 0)
      goto LABEL_33;
  }
  objc_msgSend(v5, "items");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v28;
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v29;
  objc_msgSend((id)*MEMORY[0x1E0CEC628], "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v30;
  objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)sLastPasteboardContents;
  sLastPasteboardContents = 0;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = v32;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v27, "hasRepresentationConformingToType:", v39))
        {
          objc_msgSend(v27, "representationConformingToType:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __45__ATXClipboardContents_contentsWithCallback___block_invoke_36;
          v43[3] = &unk_1E82C4D08;
          v44 = v5;
          v45 = v39;
          v47 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
          v46 = *(id *)(a1 + 32);
          v41 = (id)objc_msgSend(v40, "loadDataWithCompletion:", v43);

          goto LABEL_28;
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v36)
        continue;
      break;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_28:

LABEL_34:
}

void __45__ATXClipboardContents_contentsWithCallback___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _ATXCachedClipboardContents *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1800.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    v10 = v9;

    if (v10 >= 0.0)
    {
      v17 = *(void **)(a1 + 40);
      objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v17, "isEqualToString:", v18);

      if ((_DWORD)v17)
      {
        v19 = *(_QWORD *)(a1 + 40);
        v32 = 0;
        objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", v5, v19, &v32);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v32;
        if (v20)
        {
          objc_msgSend(v20, "absoluteString");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __atxlog_handle_heuristic();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v21;
            _os_log_impl(&dword_1C99DF000, v22, OS_LOG_TYPE_DEFAULT, "Error decoding URL: %@", buf, 0xCu);
          }

          v11 = 0;
        }

        if (!v11)
          goto LABEL_20;
      }
      else
      {
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:usedEncoding:", v5, 0);
        if (!v11)
          goto LABEL_20;
      }
      v23 = [_ATXCachedClipboardContents alloc];
      objc_msgSend(*(id *)(a1 + 32), "creationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "originatorBundleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[_ATXCachedClipboardContents initWithContent:creationDate:originatorBundleId:](v23, "initWithContent:creationDate:originatorBundleId:", v11, v24, v25);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = v26;

      objc_storeStrong((id *)&sLastPasteboardContents, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      __atxlog_handle_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "content");
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "creationDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "originatorBundleId");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138740483;
        v34 = v29;
        v35 = 2112;
        v36 = v30;
        v37 = 2112;
        v38 = v31;
        _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, "Found clipboard content: %{sensitive}@, creationDate: %@, originatorBundleID: %@", buf, 0x20u);

      }
    }
    else
    {
      __atxlog_handle_heuristic();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(*(id *)(a1 + 32), "creationDate");
      v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v12;
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "Not returning pasteboard content as pasteboard creation date is more than 30 minutes ago. Creation Date: %@", buf, 0xCu);
    }

    goto LABEL_20;
  }
  __atxlog_handle_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(NSObject **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v34 = v14;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "Error getting text representation from pasteboard. Type = %@, Error: %@", buf, 0x16u);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = v6;
  v7 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v16;
LABEL_21:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardServerConnection, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C99DF000, log, OS_LOG_TYPE_DEBUG, "Registering for com.apple.pasteboard.notify.changed notifications...", v1, 2u);
}

void __47__ATXClipboardContents__observeLocalPasteboard__block_invoke_29_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)sLastPasteboardChangeCount, "integerValue");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1C99DF000, v0, v1, "PasteBoard .changeCount - previous: %ld - current: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __45__ATXClipboardContents_contentsWithCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Error getting pasteboard contents: %@", (uint8_t *)&v2, 0xCu);
}

@end
