@implementation MFIMAPConnection

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    -[MFIMAPConnection debugDescription](self, "debugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[MFIMAPConnection _connectionLogPrefix](self, "_connectionLogPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ delegate=%p"), v7, WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (id)_connectionLogPrefix
{
  NSString *selectedMailbox;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  selectedMailbox = self->_selectedMailbox;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MFConnection accountLogString](self, "accountLogString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _connectionStateDescription](self, "_connectionStateDescription");
  if (selectedMailbox)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", self->_selectedMailbox);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p:%@> [%@ (%@)]"), self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p:%@> [%@]"), self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_connectionStateDescription
{
  int v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  v2 = *((unsigned __int8 *)self + 152);
  v3 = (uint64_t)(v2 << 29) >> 29;
  if ((v2 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = _connectionStateDescription__StateStrings[v3];
  }
  return v4;
}

- (void)setTag:(int)a3
{
  self->_tag = a3;
}

- (void)setMailboxListFilter:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxListFilter, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_idleSubscriptionCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MFIMAPConnection;
  -[MFConnection dealloc](&v3, sel_dealloc);
}

- (BOOL)connectUsingAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "hostname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "credentialAccessibility");
  if (v6)
  {
    if (v6 == 1)
    {
      MFLookupLocalizedString(CFSTR("FAILED_FETCH_TITLE"), CFSTR("Cannot Get Mail"), CFSTR("Delayed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "missingPasswordErrorWithTitle:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v8;

      if (v10)
      {
        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setError:", v10);

      }
      goto LABEL_11;
    }
    if (v6 == 2)
    {
      MFLookupLocalizedString(CFSTR("FAILED_FETCH_TITLE"), CFSTR("Cannot Get Mail"), CFSTR("Delayed"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "inaccessiblePasswordErrorWithTitle:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (!v5 || !objc_msgSend(v5, "length"))
    goto LABEL_11;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v9 = -[MFIMAPConnection _tryConnectionUsingAccount:](self, "_tryConnectionUsingAccount:", v4);
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
LABEL_12:

  return v9;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if ((*(_BYTE *)&self->_delegateState & 0x40) != 0)
      objc_msgSend(WeakRetained, "willRemoveDelegation:", self);
    *(_BYTE *)&self->_delegateState = *(_BYTE *)&self->_delegateState & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateState = *(_BYTE *)&self->_delegateState & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateState = *(_BYTE *)&self->_delegateState & 0xF7 | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 16;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateState = *(_BYTE *)&self->_delegateState & 0xEF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 32;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateState = *(_BYTE *)&self->_delegateState & 0xDF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 64;
    else
      v9 = 0;
    *(_BYTE *)&self->_delegateState = *(_BYTE *)&self->_delegateState & 0xBF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 0x80;
    else
      v10 = 0;
    *(_BYTE *)&self->_delegateState = v10 & 0x80 | *(_BYTE *)&self->_delegateState & 0x7F;
    objc_storeWeak((id *)&self->_delegate, obj);
  }

}

- (BOOL)gotBadResponse
{
  return self->_gotBadResponse;
}

- (MFIMAPConnection)init
{
  MFIMAPConnection *v2;
  uint64_t v3;
  NSMutableData *data;
  MFNWConnectionWrapper *socket;
  NSString *selectedMailbox;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFIMAPConnection;
  v2 = -[MFConnection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4096);
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    v2->_expirationTime = 0.0;
    socket = v2->super._socket;
    v2->super._socket = 0;

    *((_BYTE *)v2 + 152) &= 0xF8u;
    selectedMailbox = v2->_selectedMailbox;
    v2->_selectedMailbox = 0;

  }
  return v2;
}

- (int64_t)connectionState
{
  MFNWConnectionWrapper *socket;
  _BOOL4 v4;
  char v5;
  _MFIMAPCommandParameters *v6;
  id v7;
  void *v8;
  int v9;
  int64_t result;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!self->super._socket)
    return 0;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if (self->_expirationTime != 0.0 && CFAbsoluteTimeGetCurrent() > self->_expirationTime)
    -[MFIMAPConnection noop](self, "noop");
  socket = self->super._socket;
  if (socket && -[MFNWConnectionWrapper isValid](socket, "isValid"))
  {
    v4 = 0;
    v5 = *((_BYTE *)self + 152);
  }
  else
  {
    v5 = *((_BYTE *)self + 152) & 0xF8;
    *((_BYTE *)self + 152) = v5;
    v4 = self->super._socket != 0;
  }
  if ((char)(32 * v5) >= 1 && -[MFNWConnectionWrapper isReadable](self->super._socket, "isReadable") && !v4)
  {
    do
    {
      v6 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 0);
      v7 = -[MFIMAPConnection _copyNextServerResponseForCommand:](self, "_copyNextServerResponseForCommand:", v6);
      v4 = objc_msgSend(v7, "responseType") == 3 || objc_msgSend(v7, "responseType") == 6;
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v8);

    }
    while (((v4 | !-[MFNWConnectionWrapper isReadable](self->super._socket, "isReadable")) & 1) == 0);
  }
  v9 = *((unsigned __int8 *)self + 152);
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  result = (uint64_t)(v9 << 29) >> 29;
  if (v4 && self->super._socket)
  {
    -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);
    return 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleSubscriptionCancelable, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchPipeline, 0);
  objc_storeStrong((id *)&self->_downloadCache, 0);
  objc_storeStrong((id *)&self->_streamEventQueue, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_lastRequiredHeaders, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_selectedMailbox, 0);
  objc_storeStrong((id *)&self->_serverNamespace, 0);
  objc_storeStrong((id *)&self->_separatorChar, 0);
  objc_storeStrong((id *)&self->_mailboxListFilter, 0);
}

+ (void)setReadSizeParameters
{
  int v2;
  int v3;
  float v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "integerForKey:", CFSTR("MinFetchChunkSize"));
  if (v2)
    sIMAPMinFetchChunkSize = v2;
  v3 = objc_msgSend(v5, "integerForKey:", CFSTR("MaxFetchChunkSize"));
  if (v3)
    sIMAPMaxFetchChunkSize = v3;
  objc_msgSend(v5, "floatForKey:", CFSTR("FetchDeltaTarget"));
  if (v4 != 0.0)
    *(double *)&sIMAPFetchTargetTime = v4;

}

+ (void)initialize
{
  const __CFAllocator *v3;
  __CFCharacterSet *Mutable;
  const __CFAllocator *v5;
  __CFCharacterSet *v6;
  CFRange v7;
  CFRange v8;

  if (!sIMAPNeedsQuoteCharacterSet)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v7.location = 32;
    v7.length = 94;
    CFCharacterSetAddCharactersInRange(Mutable, v7);
    CFCharacterSetInvert(Mutable);
    CFCharacterSetAddCharactersInString(Mutable, CFSTR("(){ %*\\\"));
    sIMAPNeedsQuoteCharacterSet = (uint64_t)CFCharacterSetCreateCopy(v3, Mutable);
    CFRelease(Mutable);
  }
  if (!sIMAPNeedsLiteralCharacterSet)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = CFCharacterSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    v8.location = 1;
    v8.length = 126;
    CFCharacterSetAddCharactersInRange(v6, v8);
    CFCharacterSetInvert(v6);
    CFCharacterSetAddCharactersInString(v6, CFSTR("\r\n"));
    sIMAPNeedsLiteralCharacterSet = (uint64_t)CFCharacterSetCreateCopy(v5, v6);
    CFRelease(v6);
  }
  objc_msgSend(a1, "setReadSizeParameters");
}

- (BOOL)sendResponsesForCondStoreFlagFetchForUIDs:(id)a3 withSequenceIdentifier:(id *)a4 toQueue:(id)a5
{
  id v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _MFIMAPCommandParameters *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  unint64_t v25;
  void *v26;
  id *v28;
  void *v29;
  void *v30;
  MFIMAPConnection *v31;
  void *v32;
  void *v33;
  void *v34;
  _MFIMAPCommandParameters *v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _MFIMAPCommandParameters *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _MFIMAPCommandParameters *v49;
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a5;
  v31 = self;
  v29 = v8;
  -[MFIMAPConnection messageSetForNumbers:](self, "messageSetForNumbers:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  if (a4 && objc_msgSend(*a4, "length"))
    v10 = (const __CFString *)*a4;
  else
    v10 = CFSTR("0");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("(CHANGEDSINCE %@)"), v10);
  v50[0] = v32;
  v50[1] = CFSTR("(FLAGS)");
  v51 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 21, v33);
  v49 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = a4;
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v35;
  v13 = objc_msgSend(v34, "responseType");
  if (v13 == 2)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[_MFIMAPCommandParameters untaggedResponses](v35, "untaggedResponses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (!v14)
    {

      goto LABEL_27;
    }
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend(v19, "responseType") == 17)
        {
          objc_msgSend(v19, "fetchResults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v39 != v23)
                  objc_enumerationMutation(v21);
                v25 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "modSequenceNumber");
                v15 |= v25 > v16;
                if (v25 > v16)
                  v16 = v25;
              }
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            }
            while (v22);
          }

          objc_msgSend(v36, "addItem:", v19);
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v14);

    v12 = v35;
    v13 = 2;
    if (((v28 != 0) & v15) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v16);
      *v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      v12 = v35;
      v13 = 2;
    }
  }
  v46 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](v31, "didFinishCommands:", v26);

  return v13 == 2;
}

- (id)eSearchIDSet:(id)a3 areMessageSequenceNumbers:(BOOL)a4 arguments:(id)a5 success:(BOOL *)a6 returning:(int64_t)a7
{
  void *v11;
  _MFIMAPCommandParameters *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;
  id v33;
  id v35;
  id v36;
  uint8_t buf[8];
  _MFIMAPCommandParameters *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v35 = a5;
  v11 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count") + 2 * (v36 != 0));
  v12 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 24, v11);
  if (!a7)
    __assert_rtn("-[MFIMAPConnection(ESearch) eSearchIDSet:areMessageSequenceNumbers:arguments:success:returning:]", "ESearch.m", 27, "returning && \"Should have at least one return request on an esearch command.\");
  objc_msgSend(v11, "addObject:", CFSTR("RETURN"));
  v13 = (void *)objc_msgSend(CFSTR("("), "mutableCopy");
  v14 = v13;
  if ((a7 & 1) == 0)
  {
    if ((a7 & 2) == 0)
    {
      if ((a7 & 4) == 0)
      {
        v15 = 0;
        if ((a7 & 8) == 0)
          goto LABEL_17;
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  objc_msgSend(v13, "appendString:", CFSTR("MIN"));
  if ((a7 & 2) != 0)
  {
    objc_msgSend(v14, "appendString:", CFSTR(" "));
LABEL_9:
    objc_msgSend(v14, "appendString:", CFSTR("MAX"));
  }
  if ((a7 & 4) == 0)
    goto LABEL_13;
  objc_msgSend(v14, "appendString:", CFSTR(" "));
LABEL_12:
  objc_msgSend(v14, "appendString:", CFSTR("ALL"));
LABEL_13:
  v15 = 1;
  if ((a7 & 8) == 0)
    goto LABEL_17;
LABEL_14:
  if (v15)
    objc_msgSend(v14, "appendString:", CFSTR(" "));
  objc_msgSend(v14, "appendString:", CFSTR("COUNT"));
LABEL_17:
  objc_msgSend(v14, "appendString:", CFSTR(")"));
  objc_msgSend(v11, "addObject:", v14);
  if (v36)
  {
    if (!a4)
      objc_msgSend(v11, "addObject:", CFSTR("UID"));
    objc_msgSend(v11, "addObject:", v36);
  }
  objc_msgSend(v11, "addObjectsFromArray:", v35);
  v39[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v32, "responseType");
  if (a6)
    *a6 = v17 == 2;
  if (v17 == 2
    && (-[_MFIMAPCommandParameters untaggedResponses](v12, "untaggedResponses"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v19))
  {
    v20 = 0;
    v21 = 0;
    do
    {
      -[_MFIMAPCommandParameters untaggedResponses](v12, "untaggedResponses", v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v23, "responseType") == 20)
      {
        objc_msgSend(v23, "keyValuePairs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "objectForKey:", CFSTR("IMAPESearchTagKey"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "intValue");
        LOBYTE(v26) = -[_MFIMAPCommandParameters sequenceNumber](v12, "sequenceNumber") == v26;

        if ((v26 & 1) != 0)
        {
          v21 = v24;
        }
        else
        {
          MFLogGeneral();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4F90000, v27, OS_LOG_TYPE_INFO, "Got a response, but it was not for our tag.  Throwing out the results.", buf, 2u);
          }

          v21 = 0;
        }
        -[_MFIMAPCommandParameters untaggedResponses](v12, "untaggedResponses");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObjectAtIndex:", v20);

        --v19;
      }
      else
      {
        ++v20;
      }

    }
    while (v20 < v19);
  }
  else
  {
    v21 = 0;
  }
  v38 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1, v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v29);

  v30 = v21;
  return v30;
}

- (id)eSearchIDSet:(id)a3 areMessageSequenceNumbers:(BOOL)a4 forTerms:(id)a5 success:(BOOL *)a6 returning:(int64_t)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  BOOL *v20;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v20 = a6;
  v21 = a7;
  v8 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = -[MFIMAPConnection copyArgumentForSearchTerm:](self, "copyArgumentForSearchTerm:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), v20, v21, (_QWORD)v22);
        objc_msgSend(v12, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  -[MFIMAPConnection eSearchIDSet:areMessageSequenceNumbers:arguments:success:returning:](self, "eSearchIDSet:areMessageSequenceNumbers:arguments:success:returning:", v10, v8, v12, v20, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)parseIndexSetFromSequenceSet:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  unint64_t v10;
  unint64_t v11;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v3);
  v11 = 0xAAAAAAAAAAAAAAAALL;
  while ((objc_msgSend(v5, "isAtEnd") & 1) == 0 && objc_msgSend(v5, "scanInteger:", &v11))
  {
    if ((objc_msgSend(v5, "isAtEnd") & 1) != 0)
    {
      objc_msgSend(v4, "addIndex:", v11);
    }
    else
    {
      v6 = objc_msgSend(v5, "scanLocation");
      v7 = objc_msgSend(v3, "characterAtIndex:", v6);
      if (v7 == 44)
      {
        objc_msgSend(v4, "addIndex:", v11);
LABEL_11:
        objc_msgSend(v5, "setScanLocation:", v6 + 1);
      }
      else if (v7 == 58)
      {
        objc_msgSend(v5, "setScanLocation:", v6 + 1);
        v10 = 0xAAAAAAAAAAAAAAAALL;
        objc_msgSend(v5, "scanInteger:", &v10);
        objc_msgSend(v4, "addIndexesInRange:");
        if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
        {
          v6 = objc_msgSend(v5, "scanLocation");
          goto LABEL_11;
        }
      }
      else
      {
        MFLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_INFO, "Got invalid value in sequence set", (uint8_t *)&v10, 2u);
        }

      }
    }
  }

  return v4;
}

- (void)parseSearchReturn:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id i;

  for (i = a3; ; objc_msgSend(i, "parseSpace"))
  {
    v4 = objc_msgSend(i, "end");
    if (v4 <= objc_msgSend(i, "start"))
      break;
    if (objc_msgSend(i, "match:", "MIN"))
    {
      if ((objc_msgSend(i, "parseSpace") & 1) == 0)
        objc_msgSend(i, "emitWarning:", CFSTR("Expected space"));
      v5 = (void *)objc_msgSend(i, "copyNumber");
      if (!v5)
        objc_msgSend(i, "emitError:", CFSTR("Expected number for minimum result"));
      objc_msgSend(i, "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("IMAPESearchMinKey"));
LABEL_25:

      continue;
    }
    if (objc_msgSend(i, "match:", "MAX"))
    {
      if ((objc_msgSend(i, "parseSpace") & 1) == 0)
        objc_msgSend(i, "emitWarning:", CFSTR("Expected space"));
      v5 = (void *)objc_msgSend(i, "copyNumber");
      if (!v5)
        objc_msgSend(i, "emitError:", CFSTR("Expected number for maximum result"));
      objc_msgSend(i, "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("IMAPESearchMaxKey"));
      goto LABEL_25;
    }
    if (objc_msgSend(i, "match:", "ALL"))
    {
      if ((objc_msgSend(i, "parseSpace") & 1) == 0)
        objc_msgSend(i, "emitWarning:", CFSTR("Expected space"));
      v5 = (void *)objc_msgSend(i, "copyMessageSet");
      -[MFIMAPConnection parseIndexSetFromSequenceSet:](self, "parseIndexSetFromSequenceSet:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "response");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v6, CFSTR("IMAPESearchAllKey"));

      goto LABEL_25;
    }
    if (objc_msgSend(i, "match:", "COUNT"))
    {
      if ((objc_msgSend(i, "parseSpace") & 1) == 0)
        objc_msgSend(i, "emitWarning:", CFSTR("Expected space"));
      v5 = (void *)objc_msgSend(i, "copyNumber");
      if (!v5)
        objc_msgSend(i, "emitError:", CFSTR("Expected number for count result"));
      objc_msgSend(i, "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("IMAPESearchCountKey"));
      goto LABEL_25;
    }
    objc_msgSend(i, "emitError:", CFSTR("Did not find a valid search return."));
  }

}

- (void)parseESearchResponseWithContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "parseSpace") & 1) == 0)
    objc_msgSend(v7, "emitWarning:", CFSTR("Expected space"));
  if (objc_msgSend(v7, "match:", "("))
  {
    if (objc_msgSend(v7, "match:", "TAG"))
    {
      if ((objc_msgSend(v7, "parseSpace") & 1) == 0)
        objc_msgSend(v7, "emitWarning:", CFSTR("Expected space"));
      v4 = (void *)objc_msgSend(v7, "copyQuotedString");
      objc_msgSend(v7, "response");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("IMAPESearchTagKey"));

    }
    if ((objc_msgSend(v7, "match:", ")") & 1) == 0)
      objc_msgSend(v7, "emitError:", CFSTR("Expected right paren"));
  }
  if (objc_msgSend(v7, "parseSpace"))
  {
    if (objc_msgSend(v7, "match:", "UID"))
    {
      if ((objc_msgSend(v7, "parseSpace") & 1) == 0)
      {
        v6 = objc_msgSend(v7, "end");
        if (v6 != objc_msgSend(v7, "start"))
          objc_msgSend(v7, "emitWarning:", CFSTR("Expected space"));
      }
    }
    -[MFIMAPConnection parseSearchReturn:](self, "parseSearchReturn:", v7);
  }

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MFIMAPConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __23__MFIMAPConnection_log__block_invoke(uint64_t a1)
{
  const char *v2;
  os_log_t v3;
  void *v4;
  id v5;

  v2 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4D878], "UTF8String");
  NSStringFromClass(*(Class *)(a1 + 32));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = os_log_create(v2, (const char *)objc_msgSend(v5, "UTF8String"));
  v4 = (void *)log_log_1;
  log_log_1 = (uint64_t)v3;

}

- (id)copyDiagnosticInformation
{
  id v3;
  void *v4;
  MFIMAPConnection *v5;
  MFIMAPConnection *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  const __CFString *v12;
  objc_super v14;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v14.receiver = self;
  v14.super_class = (Class)MFIMAPConnection;
  v3 = -[MFConnection copyDiagnosticInformation](&v14, sel_copyDiagnosticInformation);
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = self;
  v6 = v5;
  if ((*((_WORD *)v5 + 64) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPlatform:", 2);

    if (v9)
      v7 = CFSTR("no");
    else
      v7 = CFSTR("yes");
  }
  else
  {

    v7 = CFSTR("no");
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("    supports IDLE: %@\n"), v7);
  v10 = -[MFIMAPConnection isIdle](v6, "isIdle");
  v11 = -[MFIMAPConnection idleCommandSequenceNumber](v6, "idleCommandSequenceNumber");
  if (v10)
    v12 = CFSTR("yes");
  else
    v12 = CFSTR("no");
  objc_msgSend(v4, "appendFormat:", CFSTR("    using IDLE: %@ (seq=%lu)\n"), v12, v11);
  -[MFIMAPConnection mf_unlock](v6, "mf_unlock");

  return v4;
}

- (MFIMAPCommandPipeline)fetchPipeline
{
  MFIMAPCommandPipeline *fetchPipeline;
  MFIMAPCommandPipeline *v4;
  MFIMAPCommandPipeline *v5;
  MFIMAPCommandPipeline *v6;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  fetchPipeline = self->_fetchPipeline;
  if (!fetchPipeline)
  {
    v4 = objc_alloc_init(MFIMAPCommandPipeline);
    v5 = self->_fetchPipeline;
    self->_fetchPipeline = v4;

    fetchPipeline = self->_fetchPipeline;
  }
  v6 = fetchPipeline;
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  return v6;
}

- (MFIMAPDownloadCache)downloadCache
{
  MFIMAPDownloadCache *downloadCache;
  MFIMAPDownloadCache *v4;
  MFIMAPDownloadCache *v5;
  MFIMAPDownloadCache *v6;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  downloadCache = self->_downloadCache;
  if (!downloadCache)
  {
    v4 = objc_alloc_init(MFIMAPDownloadCache);
    v5 = self->_downloadCache;
    self->_downloadCache = v4;

    downloadCache = self->_downloadCache;
  }
  v6 = downloadCache;
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  return v6;
}

- (id)mailboxListFilter
{
  return self->_mailboxListFilter;
}

- (void)_clearCapabilities
{
  NSMutableSet *capabilities;

  capabilities = self->_capabilities;
  self->_capabilities = 0;

  *((_BYTE *)self + 130) = 0;
  *((_WORD *)self + 64) = 0;
}

- (void)_addCapabilities:(id)a3
{
  id v4;
  NSMutableSet *capabilities;
  NSMutableSet *v6;
  NSMutableSet *v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    capabilities = self->_capabilities;
    if (!capabilities)
    {
      v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v7 = self->_capabilities;
      self->_capabilities = v6;

      capabilities = self->_capabilities;
    }
    -[NSMutableSet addObjectsFromArray:](capabilities, "addObjectsFromArray:", v4);
    v8 = 0;
    v19 = xmmword_1E4E89268;
    v20 = *(_OWORD *)&off_1E4E89278;
    v21 = xmmword_1E4E89288;
    v22 = off_1E4E89298;
    v15 = xmmword_1E4E89228;
    v16 = *(_OWORD *)&off_1E4E89238;
    v17 = xmmword_1E4E89248;
    v18 = *(_OWORD *)&off_1E4E89258;
    v11 = xmmword_1E4E891E8;
    v12 = *(_OWORD *)&off_1E4E891F8;
    v13 = xmmword_1E4E89208;
    v14 = *(_OWORD *)&off_1E4E89218;
    do
    {
      if (-[NSMutableSet containsObject:](self->_capabilities, "containsObject:", *((_QWORD *)&v11 + v8), v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22))
      {
        v9 = (1 << v8) | *((unsigned __int16 *)self + 64) | (*((unsigned __int8 *)self + 130) << 16);
        *((_WORD *)self + 64) |= 1 << v8;
        *((_BYTE *)self + 130) = BYTE2(v9);
      }
      ++v8;
    }
    while (v8 != 24);
    for (i = 184; i != -8; i -= 8)

  }
}

- (void)_fetchCapabilities
{
  _MFIMAPCommandParameters *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _MFIMAPCommandParameters *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 0);
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "responseType") == 2;

  if (v6)
  {
    -[_MFIMAPCommandParameters untaggedResponses](v3, "untaggedResponses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = v8 - 1;
      do
      {
        -[_MFIMAPCommandParameters untaggedResponses](v3, "untaggedResponses");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "responseType") == 7)
        {
          objc_msgSend(v11, "capabilities");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFIMAPConnection _addCapabilities:](self, "_addCapabilities:", v12);

          -[_MFIMAPCommandParameters untaggedResponses](v3, "untaggedResponses");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObjectAtIndex:", v9);

        }
        --v9;
      }
      while (v9 != -1);
    }
  }
  v15 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v14);

}

- (void)_sendClientInfoIfSupported
{
  OUTLINED_FUNCTION_7(&dword_1A4F90000, a1, a3, "server does not support ID extension", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_sendApplePushForAccountIfSupported:(id)a3
{
  void *v3;
  char v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *context;
  void *v72;
  id v73;
  void *v74;
  NSObject *v75;
  void *v76;
  _MFIMAPCommandParameters *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  id obj;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _MFIMAPCommandParameters *v98;
  uint8_t buf[4];
  id v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  _MFIMAPCommandParameters *v106;
  _QWORD v107[10];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v85 = a3;
  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canRegisterForAPSPush");

  if ((v4 & 1) == 0)
    goto LABEL_90;
  if ((char)(32 * *((_BYTE *)self + 152)) <= 63)
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_89;
    *(_DWORD *)buf = 138412290;
    v100 = v85;
    v6 = "#aps-push not registering for push on unauthenticated connection for account %@";
    goto LABEL_5;
  }
  if (!-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 13))
  {
    MFLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v100 = v85;
      _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_INFO, "#aps-push connection doesn't support XAPPLEPUSHSERVICE for account %@", buf, 0xCu);
    }

    objc_msgSend(v85, "serverRegisteredMailboxes:withTopic:version:", 0, 0, -1);
    goto LABEL_90;
  }
  if ((objc_msgSend(v85, "shouldRegisterForPush") & 1) == 0)
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_89;
    *(_DWORD *)buf = 138412290;
    v100 = v85;
    v6 = "#aps-push account %@ not registering for push";
LABEL_5:
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
    goto LABEL_89;
  }
  +[MFAPSManager sharedManager](MFAPSManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copyDeviceToken");

  v75 = v8;
  -[NSObject ef_hexString](v8, "ef_hexString");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v78)
  {
    MFLogGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v100 = v85;
      _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, "#aps-push failed to get device token while registering for push on account %@", buf, 0xCu);
    }

    v19 = 0;
    v20 = 0;
    goto LABEL_88;
  }
  context = (void *)MEMORY[0x1A85B0E24]();
  objc_msgSend(v85, "uniqueID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "mailboxNamesForPushRegistration");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v70;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v95 != v11)
          objc_enumerationMutation(obj);
        MFIMAPStringFromMailboxName(*(void **)(*((_QWORD *)&v94 + 1) + 8 * i));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v10 + i)
          v15 = CFSTR(" ");
        else
          v15 = &stru_1E4F1C8F8;
        objc_msgSend(v89, "appendFormat:", CFSTR("%@%@"), v15, v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
      v10 += i;
    }
    while (v9);
  }

  objc_msgSend(v89, "appendString:", CFSTR(")"));
  MFUserAgent();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isMaild"))
  {
    v73 = (id)*MEMORY[0x1E0D4D878];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleIdentifier");
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = (void *)MEMORY[0x1E0C99DE8];
  _IMAPCreateQuotedString(CFSTR("aps-version"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v85, "apsVersion"));
  v86 = (id)objc_claimAutoreleasedReturnValue();
  _IMAPCreateQuotedString(v86);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v83;
  _IMAPCreateQuotedString(CFSTR("aps-account-id"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v24;
  _IMAPCreateQuotedString(v74);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v25;
  _IMAPCreateQuotedString(CFSTR("aps-device-token"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v26;
  _IMAPCreateQuotedString(v78);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v27;
  _IMAPCreateQuotedString(CFSTR("aps-subtopic"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v107[6] = v28;
  _IMAPCreateQuotedString(v73);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v107[7] = v29;
  _IMAPCreateQuotedString(CFSTR("mailboxes"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v107[8] = v30;
  v107[9] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithArray:", v31);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v85, "apsSenderArgument");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    MFLogGeneral();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v100 = v72;
      _os_log_impl(&dword_1A4F90000, v32, OS_LOG_TYPE_INFO, "#aps-push Including Sender paramenter. Argument: {%{public}@}", buf, 0xCu);
    }

    _IMAPCreateQuotedString(CFSTR("sender"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v33);

    _IMAPCreateQuotedString(v72);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v34);

  }
  MFLogGeneral();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v79, "componentsJoinedByString:", CFSTR(" "));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v100 = v85;
    v101 = 2112;
    v102 = v36;
    _os_log_impl(&dword_1A4F90000, v35, OS_LOG_TYPE_INFO, "#aps-push account %@ registering for push: {%@}", buf, 0x16u);

  }
  v77 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 35, v79);
  v106 = v77;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v37);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v76, "responseType") != 2)
  {
    MFLogGeneral();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      -[MFIMAPConnection _sendApplePushForAccountIfSupported:].cold.3();

    v19 = 0;
    v63 = 0;
    objc_msgSend(v85, "setLastPushRegistration:", CFAbsoluteTimeGetCurrent());
    goto LABEL_87;
  }
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[_MFIMAPCommandParameters untaggedResponses](v77, "untaggedResponses");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v38;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  if (!v39)
  {

    v63 = 0;
    v55 = 0;
LABEL_75:
    MFLogGeneral();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      -[_MFIMAPCommandParameters untaggedResponses](v77, "untaggedResponses");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection _sendApplePushForAccountIfSupported:].cold.2((uint64_t)v85, v65, (uint64_t)buf, v64);
    }

    v19 = 0;
    goto LABEL_78;
  }
  v80 = 0;
  v81 = 0;
  v40 = *(_QWORD *)v91;
  do
  {
    for (j = 0; j != v39; ++j)
    {
      if (*(_QWORD *)v91 != v40)
        objc_enumerationMutation(v87);
      v42 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
      if (objc_msgSend(v42, "responseType") == 21)
      {
        objc_msgSend(v42, "serverInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKey:", CFSTR("mailbox"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
        {
          MFLogGeneral();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v100 = v85;
            v101 = 2112;
            v102 = v44;
            _os_log_impl(&dword_1A4F90000, v45, OS_LOG_TYPE_INFO, "#aps-push account %@ will send pushes for mailbox '%@'", buf, 0x16u);
          }

          objc_msgSend(v84, "addObject:", v44);
          goto LABEL_61;
        }
        objc_msgSend(v43, "objectForKey:", CFSTR("aps-version"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKey:", CFSTR("aps-topic"));
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v47;
        if (v46)
          v49 = v47 == 0;
        else
          v49 = 1;
        if (v49)
        {
          MFLogGeneral();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v100 = v85;
            v101 = 2112;
            v102 = v46;
            v103 = 2112;
            v104 = v42;
            v51 = v50;
            v52 = "#aps-push account %@ (version %@) sent unknown push response %@";
            goto LABEL_58;
          }
        }
        else
        {
          v53 = objc_msgSend(v46, "intValue");
          if (v53 >= 1 && (v54 = v53, objc_msgSend(v85, "apsVersion") >= v53))
          {
            v50 = v81;
            v80 = v54;
            v81 = objc_msgSend(v48, "copy");
          }
          else
          {
            MFLogGeneral();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v100 = v85;
              v101 = 2112;
              v102 = v46;
              v103 = 2112;
              v104 = v42;
              v51 = v50;
              v52 = "#aps-push account %@ (version %@) ignoring invalid version in push response '%@'";
LABEL_58:
              _os_log_error_impl(&dword_1A4F90000, v51, OS_LOG_TYPE_ERROR, v52, buf, 0x20u);
            }
          }
        }

LABEL_61:
        continue;
      }
    }
    v39 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  }
  while (v39);

  v55 = v80;
  if (v80 >= 2)
  {
    MFLogGeneral();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);

    if (v57)
    {
      v58 = (void *)objc_msgSend(obj, "mutableCopy");
      objc_msgSend(v58, "minusSet:", v84);
      if (objc_msgSend(v58, "count"))
      {
        MFLogGeneral();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v58, "allObjects");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "componentsJoinedByString:", CFSTR(", "));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v100 = v85;
          v101 = 2112;
          v102 = v61;
          _os_log_impl(&dword_1A4F90000, v59, OS_LOG_TYPE_INFO, "#aps-push account %@ will NOT push these mailboxes {%@}", buf, 0x16u);

        }
      }
      else
      {
        MFLogGeneral();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v85;
          _os_log_impl(&dword_1A4F90000, v59, OS_LOG_TYPE_INFO, "#aps-push account %@ will push all requested mailboxes", buf, 0xCu);
        }
      }

    }
    v19 = v84;
    v55 = v80;
    v63 = (void *)v81;
    goto LABEL_86;
  }
  v63 = (void *)v81;
  if (v80 != 1)
    goto LABEL_75;
  v19 = v84;
LABEL_78:
  if (objc_msgSend(v19, "count"))
  {
    v66 = v55;
    MFLogGeneral();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      -[MFIMAPConnection _sendApplePushForAccountIfSupported:].cold.1((uint64_t)self, v67, v68);

    objc_msgSend(v19, "removeAllObjects");
    v55 = v66;
  }
LABEL_86:
  objc_msgSend(v85, "serverRegisteredMailboxes:withTopic:version:", v19, v63, v55);
LABEL_87:
  v98 = v77;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v69);

  objc_autoreleasePoolPop(context);
  v20 = v63;
LABEL_88:

  v5 = v75;
LABEL_89:

LABEL_90:
}

- (void)_enableCompressionIfSupported
{
  OUTLINED_FUNCTION_7(&dword_1A4F90000, a1, a3, "server supports deflate compression, sending COMPRESS request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (BOOL)_connectSocketUsingAccount:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFIMAPConnection;
  return -[MFConnection connectUsingAccount:](&v4, sel_connectUsingAccount_, a3);
}

- (BOOL)_doBasicConnectionUsingAccount:(id)a3
{
  id v4;
  _MFIMAPCommandParameters *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->super._socket)
    -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 0);
  *((_BYTE *)self + 152) &= 0xF8u;
  self->_expirationTime = 0.0;
  if (-[MFIMAPConnection _connectSocketUsingAccount:](self, "_connectSocketUsingAccount:", v4))
  {
    self->_connectTime = CFAbsoluteTimeGetCurrent();
    v5 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 0);
    v6 = -[MFIMAPConnection _copyNextServerResponseForCommand:](self, "_copyNextServerResponseForCommand:", v5);
    v7 = v6;
    if (v6)
    {
      if ((objc_msgSend(v6, "isUntagged") & 1) != 0)
      {
        v8 = objc_msgSend(v7, "responseType");
        if (v8 == 5)
        {
          *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xF8 | 2;
        }
        else if (v8 == 2)
        {
          *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xF8 | 1;
          if (objc_msgSend(v7, "responseCode") == 14)
          {
            -[MFIMAPConnection _clearCapabilities](self, "_clearCapabilities");
            objc_msgSend(v7, "responseInfo");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFIMAPConnection _addCapabilities:](self, "_addCapabilities:", v9);

          }
        }
        goto LABEL_16;
      }
      +[MFIMAPConnection log](MFIMAPConnection, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[MFNWConnectionWrapper remoteHostname](self->super._socket, "remoteHostname");
        objc_claimAutoreleasedReturnValue();
        -[MFIMAPConnection _doBasicConnectionUsingAccount:].cold.2();
      }
    }
    else
    {
      +[MFIMAPConnection log](MFIMAPConnection, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[MFNWConnectionWrapper remoteHostname](self->super._socket, "remoteHostname");
        objc_claimAutoreleasedReturnValue();
        -[MFIMAPConnection _doBasicConnectionUsingAccount:].cold.1();
      }
    }

    -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 0);
LABEL_16:
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v12);

    v10 = (char)(32 * *((_BYTE *)self + 152)) > 0;
    goto LABEL_17;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (BOOL)_tryConnectionUsingAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  if (!-[MFIMAPConnection _doBasicConnectionUsingAccount:](self, "_doBasicConnectionUsingAccount:", v4))
    goto LABEL_12;
  if (objc_msgSend(v4, "usesSSL"))
  {
    -[MFNWConnectionWrapper securityProtocol](self->super._socket, "securityProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend((id)*MEMORY[0x1E0C9B328], "isEqualToString:", v5);

    if (v6)
    {
      v7 = *((_BYTE *)self + 152);
      if ((v7 & 7) == 2)
      {
        *((_BYTE *)self + 152) = v7 & 0xF8;
        v8 = (void *)MEMORY[0x1E0CB3940];
        MFLookupLocalizedString(CFSTR("TLS_NOT_SUPPORTED_FORMAT"), CFSTR("The %@ server “%@” doesn’t support TLS (SSL) on port %u. Please check your account settings and try again."), CFSTR("Delayed"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "accountTypeString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hostname");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", v9, v10, v11, objc_msgSend(v4, "portNumber"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setError:", v14);

        v15 = 0;
LABEL_11:

        goto LABEL_13;
      }
      if (-[MFIMAPConnection startTLSForAccount:](self, "startTLSForAccount:", v4))
      {
        objc_msgSend(v4, "clientCertificates");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[MFNWConnectionWrapper setClientCertificates:](self->super._socket, "setClientCertificates:", v12);
        v15 = -[MFConnection enableSSL](self, "enableSSL");
        -[MFIMAPConnection _updateCapabilitiesForAccount:withAuthenticationResponse:](self, "_updateCapabilitiesForAccount:withAuthenticationResponse:", v4, 0);
        goto LABEL_11;
      }
LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
  }
  v15 = 1;
LABEL_13:

  return v15;
}

- (void)disconnectAndNotifyDelegate:(BOOL)a3
{
  _BOOL4 v3;
  MFNWConnectionWrapper *socket;
  MFNWConnectionWrapper *v6;
  NSString *separatorChar;
  NSString *serverNamespace;
  NSString *selectedMailbox;
  id WeakRetained;

  v3 = a3;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  socket = self->super._socket;
  if (socket)
  {
    -[MFNWConnectionWrapper unregisterForBytesAvailable](socket, "unregisterForBytesAvailable");
    -[MFNWConnectionWrapper close](self->super._socket, "close");
    v6 = self->super._socket;
    self->super._socket = 0;

    self->_expirationTime = 0.0;
  }
  -[MFConnection endCompression](self, "endCompression");
  -[MFIMAPConnection _clearCapabilities](self, "_clearCapabilities");
  separatorChar = self->_separatorChar;
  self->_separatorChar = 0;

  serverNamespace = self->_serverNamespace;
  self->_serverNamespace = 0;

  selectedMailbox = self->_selectedMailbox;
  self->_selectedMailbox = 0;

  -[NSMutableData setLength:](self->_data, "setLength:", 0);
  *((_BYTE *)self + 152) &= 0xF8u;
  self->_commandNumber = 0;
  self->_idleCommandSequenceNumber = 0;
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      if ((*(_BYTE *)&self->_delegateState & 8) != 0)
        objc_msgSend(WeakRetained, "connectionDidDisconnect:", self);
    }

  }
}

- (void)disconnect
{
  -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);
}

- (BOOL)hasValidConnection
{
  return -[MFIMAPConnection connectionState](self, "connectionState") > 0;
}

- (BOOL)loginDisabled
{
  return -[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 10);
}

- (int)fillLiteralBuffer:(char *)a3 count:(unint64_t)a4 dataLength:(unint64_t)a5 nonSynchronizingLiteral:(BOOL *)a6
{
  __int16 v11;
  const char *v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  void *v18;

  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAPConnection.m"), 935, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outNonSynchronizingLiteral"));

  }
  v11 = *((_WORD *)self + 64);
  v12 = "+";
  if ((v11 & 2) != 0)
  {
    LOBYTE(v15) = 1;
  }
  else if (a5 > 0x1000)
  {
    LOBYTE(v15) = 0;
    v12 = "";
  }
  else
  {
    v14 = v11 & 4;
    v13 = v14 == 0;
    v15 = v14 >> 2;
    if (v13)
      v12 = "";
  }
  *a6 = v15;
  return snprintf(a3, a4, "{%lu%s}\r\n", a5, v12);
}

- (unint64_t)_sendCommands:(id)a3 response:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSUInteger v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSMutableData *data;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char v38;
  char *v39;
  char *v40;
  BOOL v41;
  __int128 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  id v45;
  void *v46;
  id v47;
  char *v48;
  uint64_t v49;
  char *v50;
  int64_t v51;
  _BYTE *v52;
  _BYTE *v53;
  int64_t v54;
  int v55;
  NSMutableData *v56;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _BOOL4 v64;
  unint64_t v65;
  NSObject *v66;
  uint64_t v67;
  id v69;
  unint64_t v70;
  id obj;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  unint64_t v80;
  _QWORD v81[6];
  _QWORD v82[6];
  _QWORD v83[6];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  _BYTE v92[16];
  _BYTE buf[32];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v70 = objc_msgSend(v69, "count");
  v88 = 0;
  v89 = &v88;
  v90 = 0x2020000000;
  v91 = 1;
  -[MFIMAPConnection locked_finishIdle](self, "locked_finishIdle");
  -[NSMutableData setLength:](self->_data, "setLength:", 0);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v69;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (!v5)
  {
    v6 = 0;
    v7 = 0;
    v79 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_134;
  }
  v6 = 0;
  v7 = 0;
  v79 = 0;
  v73 = *(_QWORD *)v85;
  v74 = v5;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_3:
  v76 = 0;
  while (1)
  {
    if (*(_QWORD *)v85 != v73)
      objc_enumerationMutation(obj);
    v9 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v76);
    v77 = objc_msgSend(v9, "command") == 32 ? objc_msgSend(v9, "sequenceNumber") : 0;
    if (objc_msgSend(v9, "command") != 29)
      break;
LABEL_12:
    objc_msgSend(v9, "arguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v11, "count");

    if (objc_msgSend(v9, "command") == 38)
    {
      if (!v80)
        goto LABEL_127;
      objc_msgSend(v9, "arguments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v78 = v7;
        goto LABEL_125;
      }
      data = self->_data;
      v15 = objc_retainAutorelease(v13);
      -[NSMutableData mf_appendCString:](data, "mf_appendCString:", -[NSObject UTF8String](v15, "UTF8String"));

      v16 = 1;
    }
    else
    {
      -[NSMutableData mf_appendCString:](self->_data, "mf_appendCString:", _IMAPCommandTable[objc_msgSend(v9, "command")]);
      v16 = 0;
    }
    if (v16 >= v80)
    {
      v78 = v7;
      goto LABEL_119;
    }
    v78 = v7;
    while (1)
    {
      objc_msgSend(v9, "arguments");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0 || (objc_msgSend(v18, "hasPrefix:", CFSTR(")")) & 1) == 0)
      {
        -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", " ", 1);
        if ((isKindOfClass & 1) == 0)
          break;
      }
      v20 = (void *)MFCreateDataWithString();
      if (objc_msgSend(v9, "command") == 5)
      {
        if (v16 != 1)
          goto LABEL_31;
      }
      else
      {
        v22 = objc_msgSend(v9, "command");
        if (v16 != 1 || v22 != 4)
          goto LABEL_31;
      }
      v8 = -[NSMutableData length](self->_data, "length");
      v6 = objc_msgSend(v20, "length");
LABEL_31:
      -[NSMutableData appendData:](self->_data, "appendData:", v20);

      ++v16;
LABEL_114:

      if (v16 == v80)
        goto LABEL_119;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = ++v16 == v80 && objc_msgSend(v9, "command") == 19;
      v24 = v18;
      v25 = objc_msgSend(v24, "length");
      if (v21)
        v25 += objc_msgSend(v24, "numberOfNewlinesNeedingConversion:", 0);
      v92[0] = -86;
      *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&buf[16] = v26;
      -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", buf, -[MFIMAPConnection fillLiteralBuffer:count:dataLength:nonSynchronizingLiteral:](self, "fillLiteralBuffer:count:dataLength:nonSynchronizingLiteral:", buf, 32, v25 - v77, v92));
      v27 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", self->_data, v8, v6);
      *((_BYTE *)v89 + 24) = v27;
      if (v92[0])
        v28 = 0;
      else
        v28 = v27;
      if (v28)
      {
        v29 = -[MFIMAPConnection _copyNextTaggedOrContinuationResponseForCommand:](self, "_copyNextTaggedOrContinuationResponseForCommand:", v9);
        if (objc_msgSend(v29, "responseType") != 1)
        {

          v30 = 0;
          *((_BYTE *)v89 + 24) = 0;
          v78 = v29;
          goto LABEL_64;
        }
        v30 = v29;
        if (!*((_BYTE *)v89 + 24))
        {
LABEL_64:
          -[NSMutableData setLength:](self->_data, "setLength:", 0);
          v41 = *((_BYTE *)v89 + 24) == 0;

          goto LABEL_112;
        }
      }
      else
      {
        v30 = 0;
        if (!v27)
          goto LABEL_64;
      }
      if (v92[0] || v30)
      {
        if (v21)
        {
          -[NSMutableData setLength:](self->_data, "setLength:", 0);
          *((_BYTE *)v89 + 24) = 1;
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __43__MFIMAPConnection__sendCommands_response___block_invoke_3;
          v81[3] = &unk_1E4E89410;
          v81[4] = self;
          v81[5] = &v88;
          objc_msgSend(v24, "enumerateConvertingNewlinesUsingBlock:", v81);
        }
        else if (objc_msgSend(v9, "command") == 5)
        {
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __43__MFIMAPConnection__sendCommands_response___block_invoke;
          v83[3] = &unk_1E4E893E8;
          v83[4] = self;
          v83[5] = &v88;
          objc_msgSend(v24, "enumerateByteRangesUsingBlock:", v83);
        }
        else
        {
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __43__MFIMAPConnection__sendCommands_response___block_invoke_2;
          v82[3] = &unk_1E4E893E8;
          v82[4] = self;
          v82[5] = &v88;
          objc_msgSend(v24, "enumerateByteRangesUsingBlock:", v82);
        }
      }
      goto LABEL_64;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_118;
    v23 = ++v16 == v80 && objc_msgSend(v9, "command") == 19;
    v31 = v18;
    v75 = v31;
    v32 = objc_msgSend(v31, "length");
    if (v23)
    {
      v33 = objc_retainAutorelease(v31);
      v34 = v8;
      v35 = objc_msgSend(v33, "bytes");
      v36 = v6;
      if (v32 < 1)
      {
        v38 = 0;
      }
      else
      {
        v37 = (char *)v35;
        v38 = 0;
        v39 = (char *)(v35 + v32);
        do
        {
          v40 = (char *)memchr(v37, 10, v39 - v37);
          if (v40 && (v40 == v37 || *(v40 - 1) != 13))
          {
            ++v32;
            v38 = 1;
          }
          if (v40)
            v37 = v40 + 1;
          else
            v37 = v39;
        }
        while (v37 < v39);
      }
      LOBYTE(v23) = v38;
      v6 = v36;
      v8 = v34;
    }
    v92[0] = -86;
    *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v42;
    *(_OWORD *)&buf[16] = v42;
    -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", buf, -[MFIMAPConnection fillLiteralBuffer:count:dataLength:nonSynchronizingLiteral:](self, "fillLiteralBuffer:count:dataLength:nonSynchronizingLiteral:", buf, 32, v32 - v77, v92));
    v43 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", self->_data, v8, v6);
    *((_BYTE *)v89 + 24) = v43;
    if (v92[0])
      v44 = 0;
    else
      v44 = v43;
    if (v44)
    {
      v45 = -[MFIMAPConnection _copyNextTaggedOrContinuationResponseForCommand:](self, "_copyNextTaggedOrContinuationResponseForCommand:", v9);
      if (objc_msgSend(v45, "responseType") == 1)
      {
        v46 = v45;
        if (!*((_BYTE *)v89 + 24))
          goto LABEL_111;
LABEL_75:
        if (v92[0] || v46)
        {
          if (!v23)
          {
            if (objc_msgSend(v9, "command") == 5)
              v60 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", v75, 0, objc_msgSend(v75, "length"));
            else
              v60 = -[MFConnection writeData:](self, "writeData:", v75);
            *((_BYTE *)v89 + 24) = v60;
            goto LABEL_111;
          }
          v47 = objc_retainAutorelease(v75);
          v48 = (char *)objc_msgSend(v47, "bytes");
          v49 = objc_msgSend(v47, "length");
          -[NSMutableData setLength:](self->_data, "setLength:", 0);
          *((_BYTE *)v89 + 24) = 1;
          if (v49 >= 1)
          {
            v50 = &v48[v49];
            do
            {
              v51 = v50 - v48;
              v52 = memchr(v48, 10, v50 - v48);
              v53 = v52;
              if (v52)
              {
                v54 = v52 - v48;
                if (v52 == v48)
                  goto LABEL_87;
                v55 = *(v52 - 1);
                v56 = self->_data;
                if (v55 != 13)
                {
                  -[NSMutableData appendBytes:length:](v56, "appendBytes:length:", v48, v54);
LABEL_87:
                  -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &kIMAPLineEnding, 2);
                  goto LABEL_88;
                }
                v51 = v54 + 1;
              }
              else
              {
                v56 = self->_data;
              }
              -[NSMutableData appendBytes:length:](v56, "appendBytes:length:", v48, v51);
LABEL_88:
              if (v53)
                v48 = v53 + 1;
              else
                v48 = v50;
              if (-[NSMutableData length](self->_data, "length") > 0xFFF || v48 >= v50)
              {
                v58 = -[MFConnection writeData:](self, "writeData:", self->_data);
                *((_BYTE *)v89 + 24) = v58;
                -[NSMutableData setLength:](self->_data, "setLength:", 0);
              }
              if (*((_BYTE *)v89 + 24))
                v59 = v48 >= v50;
              else
                v59 = 1;
            }
            while (!v59);
          }
        }
      }
      else
      {

        v46 = 0;
        *((_BYTE *)v89 + 24) = 0;
        v78 = v45;
      }
    }
    else
    {
      v46 = 0;
      if (v43)
        goto LABEL_75;
    }
LABEL_111:
    -[NSMutableData setLength:](self->_data, "setLength:", 0);
    v41 = *((_BYTE *)v89 + 24) == 0;

LABEL_112:
    v6 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v41)
    {
      ++v79;
      goto LABEL_114;
    }
LABEL_118:

LABEL_119:
    if (!v78)
      -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &kIMAPLineEnding, 2);
    if (*((_BYTE *)v89 + 24) && -[NSMutableData length](self->_data, "length"))
    {
      +[MFIMAPConnection log](MFIMAPConnection, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[MFIMAPConnection _connectionLogPrefix](self, "_connectionLogPrefix");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFIMAPConnection _logStringForCommand:](self, "_logStringForCommand:", v9);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v62;
        _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ WROTE: %{public}@", buf, 0x16u);

      }
LABEL_125:

    }
    v7 = v78;
LABEL_127:
    if (++v76 == v74)
    {
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      if (!v74)
        goto LABEL_134;
      goto LABEL_3;
    }
  }
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v10;
  *(_OWORD *)&buf[16] = v10;
  if ((unint64_t)objc_msgSend(v9, "command") < 0x27)
  {
    ++self->_commandNumber;
    objc_msgSend(v9, "setSequenceNumber:");
    __snprintf_chk(buf, 0x20uLL, 0, 0x20uLL, "%lu ", objc_msgSend(v9, "sequenceNumber"));
    -[NSMutableData mf_appendCString:](self->_data, "mf_appendCString:", buf);
    goto LABEL_12;
  }
  +[MFIMAPConnection log](MFIMAPConnection, "log");
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "command"));
    objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _sendCommands:response:].cold.2();
  }

LABEL_134:
  if (*((_BYTE *)v89 + 24) && -[NSMutableData length](self->_data, "length"))
  {
    v64 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", self->_data, v8, v6);
    v65 = v79;
    if (v64)
      v65 = v70;
    v79 = v65;
  }
  -[NSMutableData setLength:](self->_data, "setLength:", 0);
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  self->_expirationTime = CFAbsoluteTimeGetCurrent() + 1500.0;
  if (v79 < v70)
  {
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      -[MFIMAPConnection _sendCommands:response:].cold.1((uint64_t)self, v66, v67);

    -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);
  }

  _Block_object_dispose(&v88, 8);
  return v79;
}

uint64_t __43__MFIMAPConnection__sendCommands_response___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "writeBytes:length:dontLogBytesInRange:", a2, a4, 0, a4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

uint64_t __43__MFIMAPConnection__sendCommands_response___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "writeBytes:length:dontLogBytesInRange:", a2, a4, 0x7FFFFFFFFFFFFFFFLL, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

uint64_t __43__MFIMAPConnection__sendCommands_response___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "appendBytes:length:", a2, a3);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "length") > 0xFFF || a5 != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "writeData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "setLength:", 0);
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (id)_copyNextServerResponseForCommand:(id)a3
{
  id v4;
  MFIMAPResponse *v5;
  void *v6;
  MFIMAPResponse *v7;

  v4 = a3;
  v5 = [MFIMAPResponse alloc];
  objc_msgSend(v4, "responseConsumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MFIMAPResponse initWithConnection:responseConsumer:](v5, "initWithConnection:responseConsumer:", self, v6);

  if (!v7 || -[MFIMAPResponse responseType](v7, "responseType") == 6)
  {
    -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);

    v7 = 0;
  }

  return v7;
}

- (id)_copyNextTaggedOrContinuationResponseForCommand:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  int v7;
  int v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sequenceNumber");
  EFStringWithUnsignedInteger();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFIMAPConnection _copyNextServerResponseForCommand:](self, "_copyNextServerResponseForCommand:", v4);
  if (!v5)
    goto LABEL_38;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v6 = 138543618;
  v32 = v6;
  while (objc_msgSend(v5, "responseType", v32) != 1)
  {
    if ((objc_msgSend(v5, "isUntagged") & 1) == 0)
    {
      objc_msgSend(v5, "tag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v33, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        break;
    }
    if (objc_msgSend(v5, "responseType") == 17)
    {
      ++v8;
    }
    else if (objc_msgSend(v5, "responseType") == 15)
    {
      ++v7;
    }
    else
    {
      +[MFIMAPConnection log](MFIMAPConnection, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[MFIMAPConnection _connectionLogPrefix](self, "_connectionLogPrefix");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ef_publicDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v32;
        v35 = v12;
        v36 = 2114;
        v37 = v13;
        _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %{public}@", buf, 0x16u);

      }
    }
    if (!objc_msgSend(v5, "isUntagged"))
      goto LABEL_20;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = WeakRetained;
    if (!WeakRetained || (*(_BYTE *)&self->_delegateState & 1) == 0)
    {

LABEL_17:
      objc_msgSend(v4, "untaggedResponses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v4, "setUntaggedResponses:", v18);

      }
      objc_msgSend(v4, "untaggedResponses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v5);

      goto LABEL_20;
    }
    v21 = objc_msgSend(WeakRetained, "connection:shouldHandleUntaggedResponse:forCommand:", self, v5, v4);

    if ((v21 & 1) != 0)
      goto LABEL_17;
LABEL_20:
    v20 = -[MFIMAPConnection _copyNextServerResponseForCommand:](self, "_copyNextServerResponseForCommand:", v4);

    v5 = v20;
    if (!v20)
      goto LABEL_38;
  }
  if (v8)
  {
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[MFIMAPConnection _connectionLogPrefix](self, "_connectionLogPrefix");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v32;
      v35 = v23;
      v36 = 1024;
      LODWORD(v37) = v8;
      _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %d untagged fetch responses", buf, 0x12u);

    }
  }
  if (v7)
  {
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      -[MFIMAPConnection _connectionLogPrefix](self, "_connectionLogPrefix");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v32;
      v35 = v25;
      v36 = 1024;
      LODWORD(v37) = v7;
      _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %d untagged list responses", buf, 0x12u);

    }
  }
  +[MFIMAPConnection log](MFIMAPConnection, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    -[MFIMAPConnection _connectionLogPrefix](self, "_connectionLogPrefix");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_publicDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = v32;
    v35 = v27;
    v36 = 2114;
    v37 = v28;
    _os_log_impl(&dword_1A4F90000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ READ: %{public}@", buf, 0x16u);

  }
  v29 = objc_loadWeakRetained((id *)&self->_delegate);
  v30 = v29;
  if (v29 && (*(_BYTE *)&self->_delegateState & 2) != 0)
    objc_msgSend(v29, "connection:didReceiveResponse:forCommand:", self, v5, v4);

LABEL_38:
  return v5;
}

- (id)_errorForResponse:(id)a3 commandParams:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "command") == 13
    && (-[MFNWConnectionWrapper remoteHostname](self->super._socket, "remoteHostname"),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("IMAP_OPEN_FAILED_MSG_FORMAT"), CFSTR("Mail was unable to open this mailbox on the server “%@”."), CFSTR("Delayed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)v9;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("IMAP_COMMAND_FAILED_FORMAT1"), CFSTR("IMAP command “%@” failed."), CFSTR("Delayed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", _IMAPCommandTable[objc_msgSend(v7, "command")], 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v11, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }

  _messageFromResponse(v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "untaggedResponses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v26;
LABEL_8:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v17);
        _messageFromResponse(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v20));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v18)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      v16 = 0;
    }

  }
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "useGenericDescription:", v12);
  objc_msgSend(v8, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v23)
    objc_msgSend(v8, "setError:", v21);

  return v21;
}

- (id)capabilities
{
  NSMutableSet *capabilities;
  void *v4;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    -[MFIMAPConnection _fetchCapabilities](self, "_fetchCapabilities");
    capabilities = self->_capabilities;
  }
  -[NSMutableSet allObjects](capabilities, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  return v4;
}

- (BOOL)supportsCapability:(int64_t)a3
{
  int locked;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if (!self->_capabilities)
    -[MFIMAPConnection _fetchCapabilities](self, "_fetchCapabilities");
  locked = locked_supportsCapability(self, a3);
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  if (a3 == 16 && locked)
    LOBYTE(locked) = (*((_BYTE *)self + 240) & 1) == 0;
  return locked;
}

- (void)noop
{
  uint64_t v3;
  _MFIMAPCommandParameters *v4;
  void *v5;
  id v6;
  void *v7;
  _MFIMAPCommandParameters *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v3 = -[MFNWConnectionWrapper timeout](self->super._socket, "timeout");
  if ((int)v3 >= 11)
    -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", 10);
  v4 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v5);

  if ((int)v3 > 10)
    -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", v3);
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v7);

}

- (BOOL)authenticateUsingAccount:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  void *v32;
  objc_super v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if ((char)(32 * *((_BYTE *)self + 152)) > 32)
    goto LABEL_4;
  v33.receiver = self;
  v33.super_class = (Class)MFIMAPConnection;
  v6 = -[MFConnection authenticateUsingAccount:](&v33, sel_authenticateUsingAccount_, v4);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredAuthScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D1E668]);

  if ((v6 & 1) == 0)
  {
    if (-[MFConnection isValid](self, "isValid"))
    {
      if (v11)
      {
        objc_msgSend(v4, "username");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataUsingEncoding:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
        {
          +[MFIMAPConnection log](MFIMAPConnection, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(0, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            -[MFIMAPConnection authenticateUsingAccount:].cold.2();
          }

          v23 = (void *)MEMORY[0x1E0CB3940];
          MFLookupLocalizedString(CFSTR("FAILED_LOGIN"), CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "hostname");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", v24, v25);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          MFLookupLocalizedString(CFSTR("FAILED_FETCH_TITLE"), CFSTR("Cannot Get Mail"), CFSTR("Delayed"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, v20, v26, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_18;
        }
        if (!v5 || -[MFIMAPConnection loginDisabled](self, "loginDisabled"))
        {
          MFLookupLocalizedString(CFSTR("FAILED_FETCH_TITLE"), CFSTR("Cannot Get Mail"), CFSTR("Delayed"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "missingPasswordErrorWithTitle:", v20);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        if (-[MFIMAPConnection loginWithAccount:password:](self, "loginWithAccount:password:", v4, v5))
        {
          objc_msgSend(v7, "setError:", 0);
          goto LABEL_3;
        }
      }
      else if (!v8)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        MFLookupLocalizedString(CFSTR("AUTH_NOT_SUPPORTED_FORMAT"), CFSTR("The %@ server “%@” doesn’t support %@ authentication. Please check your account settings and try again."), CFSTR("Delayed"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "accountTypeString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hostname");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "preferredAuthScheme");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "humanReadableName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v32, v31, v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, v20);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v27 = (void *)v21;
LABEL_18:

        if (!v8 && v27)
        {
          +[MFIMAPConnection log](MFIMAPConnection, "log");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v27, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            -[MFIMAPConnection authenticateUsingAccount:].cold.1();
          }

          +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setError:", v27);

        }
      }
    }

    v12 = 0;
    goto LABEL_25;
  }
LABEL_3:

LABEL_4:
  -[MFIMAPConnection _sendApplePushForAccountIfSupported:](self, "_sendApplePushForAccountIfSupported:", v4);
  -[MFIMAPConnection _sendClientInfoIfSupported](self, "_sendClientInfoIfSupported");
  -[MFIMAPConnection _enableCompressionIfSupported](self, "_enableCompressionIfSupported");
  v12 = 1;
LABEL_25:
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");

  return v12;
}

- (id)_serverErrorForAccount:(id)a3 response:(id)a4 command:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "errorForResponse:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "untaggedResponses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v9 && v11)
  {
    v12 = 1;
    do
    {
      objc_msgSend(v8, "untaggedResponses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v12 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "errorForResponse:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
    }
    while (v12++ < v11);
  }

  return v9;
}

- (void)_updateCapabilitiesForAccount:(id)a3 withAuthenticationResponse:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MFIMAPConnection _clearCapabilities](self, "_clearCapabilities");
  if (v6 && objc_msgSend(v6, "responseCode") == 14)
  {
    objc_msgSend(v6, "responseInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _addCapabilities:](self, "_addCapabilities:", v7);
  }
  else
  {
    -[MFIMAPConnection capabilities](self, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "_setCapabilities:", v7);

}

- (int64_t)_doIMAPLoginForAccount:(id)a3 quotedUsername:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  _MFIMAPCommandParameters *v10;
  void *v11;
  _MFIMAPCommandParameters *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  _MFIMAPCommandParameters *v29;
  _MFIMAPCommandParameters *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [_MFIMAPCommandParameters alloc];
  v31[0] = v8;
  v31[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_MFIMAPCommandParameters initWithCommand:arguments:](v10, "initWithCommand:arguments:", 5, v11);

  v30 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "responseType");
  if (v15 == 2)
  {
    *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xF8 | 2;
    v16 = 0;
    -[MFIMAPConnection _updateCapabilitiesForAccount:withAuthenticationResponse:](self, "_updateCapabilitiesForAccount:withAuthenticationResponse:", v28, v14);
  }
  else
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_6;
    -[MFIMAPConnection _serverErrorForAccount:response:command:](self, "_serverErrorForAccount:response:command:", v28, v14, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_6;
    v18 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("FAILED_LOGIN"), CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hostname");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    MFLookupLocalizedString(CFSTR("FAILED_FETCH_TITLE"), CFSTR("Cannot Get Mail"), CFSTR("Delayed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, v21, v22, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
LABEL_6:
      v23 = *((_BYTE *)self + 152);
      if ((char)(32 * v23) >= 33)
        *((_BYTE *)self + 152) = v23 & 0xF8 | 1;
      objc_msgSend(v14, "userString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMoreInfo:", v24);

      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setError:", v16);

    }
  }
  v29 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v26);

  return v15;
}

- (BOOL)loginWithAccount:(id)a3 password:(id)a4
{
  id v6;
  __CFString *v7;
  BOOL v8;
  void *v9;
  void *v10;
  const __CFCharacterSet *v11;
  void *v12;
  char v13;
  int v14;
  int64_t v15;
  BOOL v16;
  char v17;
  void *v18;
  CFRange v20;

  v6 = a3;
  v7 = (__CFString *)a4;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if ((char)(32 * *((_BYTE *)self + 152)) <= 32)
  {
    objc_msgSend(v6, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAPCreateQuotedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (v11 = (const __CFCharacterSet *)sIMAPNeedsLiteralCharacterSet,
          v20.length = -[__CFString length](v7, "length"),
          v20.location = 0,
          CFStringFindCharacterFromSet(v7, v11, v20, 0, 0)))
    {
      -[__CFString dataUsingEncoding:allowLossyConversion:](v7, "dataUsingEncoding:allowLossyConversion:", 4, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
    }
    else
    {
      _IMAPCreateQuotedString(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
    }
    v14 = (char)(32 * *((_BYTE *)self + 152));
    if (v14 > 63
      || ((v15 = -[MFIMAPConnection _doIMAPLoginForAccount:quotedUsername:password:](self, "_doIMAPLoginForAccount:quotedUsername:password:", v6, v10, v12), v14 = (char)(32 * *((_BYTE *)self + 152)), v14 <= 63)? (v16 = v15 == 3): (v16 = 0), !v16 ? (v17 = 1) : (v17 = v13), (v17 & 1) != 0))
    {
      v18 = v12;
    }
    else
    {
      -[__CFString dataUsingEncoding:allowLossyConversion:](v7, "dataUsingEncoding:allowLossyConversion:", 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFIMAPConnection _doIMAPLoginForAccount:quotedUsername:password:](self, "_doIMAPLoginForAccount:quotedUsername:password:", v6, v10, v18);
      LOBYTE(v14) = 32 * *((_BYTE *)self + 152);
    }
    v8 = (char)v14 > 32;

  }
  else
  {
    v8 = 1;
  }
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");

  return v8;
}

- (BOOL)logout
{
  _MFIMAPCommandParameters *v3;
  void *v4;
  BOOL v5;
  void *v6;
  _MFIMAPCommandParameters *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 152) & 7) == 0)
    return 1;
  v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 2);
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v4, 0) != 0;

  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v6);

  return v5;
}

- (id)separatorChar
{
  NSString *v3;
  void *v4;
  NSString *separatorChar;
  NSString *v6;
  NSString *v7;
  __CFString *v8;
  __CFString *v9;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v3 = self->_separatorChar;
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  if (!v3)
  {
    -[MFIMAPConnection _doListCommand:withReference:mailboxName:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:](self, "_doListCommand:withReference:mailboxName:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:", 6, &stru_1E4F1C8F8, &stru_1E4F1C8F8, 0, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[MFIMAPConnection mf_lock](self, "mf_lock");
      separatorChar = self->_separatorChar;
      if (!separatorChar)
      {
        v6 = (NSString *)objc_msgSend(CFSTR("/"), "copy");
        v7 = self->_separatorChar;
        self->_separatorChar = v6;

        separatorChar = self->_separatorChar;
      }
      v3 = separatorChar;
      -[MFIMAPConnection mf_unlock](self, "mf_unlock");
    }
    else
    {
      v3 = 0;
    }
  }
  if (v3)
    v8 = (__CFString *)v3;
  else
    v8 = &stru_1E4F1C8F8;
  v9 = v8;

  return v9;
}

- (id)serverPathPrefix
{
  id v3;

  if (!self->_serverNamespace && -[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 7))
    v3 = -[MFIMAPConnection _doNamespaceCommand](self, "_doNamespaceCommand");
  return self->_serverNamespace;
}

- (id)_doNamespaceCommand
{
  _MFIMAPCommandParameters *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _MFIMAPCommandParameters *v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 7))
    return 0;
  v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 30);
  v22[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "responseType") == 2)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[_MFIMAPCommandParameters untaggedResponses](v3, "untaggedResponses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v9, "responseType") == 22)
          {
            objc_msgSend(v9, "privateNamespaces");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "firstObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", 0x1E4F2A258);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "length"))
              {
                objc_storeStrong((id *)&self->_serverNamespace, v12);

                goto LABEL_19;
              }

            }
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_19:

  }
  else
  {
    v12 = 0;
  }
  v20 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v14);

  return v12;
}

- (id)_doListCommand:(int64_t)a3 withReference:(id)a4 mailboxName:(id)a5 options:(int64_t)a6 getSpecialUse:(BOOL)a7 statusDataItems:(id)a8 statusEntriesByMailbox:(id *)a9
{
  _BOOL4 v10;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *MutableCopy;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  MFIMAPConnection *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  MFIMAPConnection *v37;
  uint64_t v38;
  NSString *separatorChar;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unsigned int v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v70;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  __CFString *theString;
  id v79;
  void *v80;
  _MFIMAPCommandParameters *v81;
  MFIMAPConnection *v82;
  void *v83;
  unint64_t v84;
  unint64_t v85;
  _MFIMAPCommandParameters *v86;
  void *v87;
  _QWORD v88[3];

  v10 = a7;
  v88[1] = *MEMORY[0x1E0C80C00];
  v72 = a4;
  v14 = (__CFString *)a5;
  v74 = a8;
  theString = v14;
  if (!v14)
  {
    v79 = 0;
    v75 = 0;
    goto LABEL_75;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", a3, v76);
  MFIMAPStringFromMailboxName(v72);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v15);

  if (a6 == 1)
  {
    v16 = CFSTR("%");
LABEL_7:
    if (-[__CFString length](v14, "length"))
    {
      -[MFIMAPConnection separatorChar](self, "separatorChar");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      MutableCopy = CFStringCreateMutableCopy(0, -[__CFString length](v17, "length")+ -[__CFString length](v14, "length")+ -[__CFString length](v16, "length"), v14);
      v19 = MutableCopy;
      if (v17)
        CFStringAppend(MutableCopy, v17);
      CFStringAppend(v19, v16);
      MFIMAPStringFromMailboxName(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "addObject:", v20);

      CFRelease(v19);
    }
    else
    {
      MFIMAPStringFromMailboxName(v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "addObject:", v17);
    }
    goto LABEL_13;
  }
  if (a6 == 2)
  {
    v16 = CFSTR("*");
    goto LABEL_7;
  }
  MFIMAPStringFromMailboxName(v14);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObject:", v17);
LABEL_13:

  v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10)
    objc_msgSend(v73, "addObject:", CFSTR("SPECIAL-USE"));
  if (objc_msgSend(v74, "count") && -[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 22))
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MFIMAPConnection parenthesizedStringWithObjects:](self, "parenthesizedStringWithObjects:", v74);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("STATUS %@"), v23);

    objc_msgSend(v73, "addObject:", v24);
    v79 = v21;
  }
  else
  {
    v79 = 0;
  }
  if (objc_msgSend(v73, "count"))
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v73, "componentsJoinedByString:", CFSTR(" "));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("RETURN (%@)"), v26);

    objc_msgSend(v76, "addObject:", v27);
  }
  v88[0] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = self;
  v30 = objc_msgSend(v29, "responseType") == 2;

  if (v30)
  {
    -[_MFIMAPCommandParameters untaggedResponses](v81, "untaggedResponses");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v31, "count");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v75 = (id)objc_claimAutoreleasedReturnValue();
    v32 = self;
    if (v84)
    {
      v85 = 0;
      while (1)
      {
        -[_MFIMAPCommandParameters untaggedResponses](v81, "untaggedResponses");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndex:", v85);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = objc_msgSend(v34, "responseType");
        v36 = v35;
        if ((unint64_t)(v35 - 15) <= 1)
          break;
        if (v79 && v35 == 13)
        {
          objc_msgSend(v34, "statusEntries");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "mailboxName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKeyedSubscript:", v42, v43);

          -[_MFIMAPCommandParameters untaggedResponses](v81, "untaggedResponses");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "removeObjectAtIndex:", v85);

LABEL_70:
          --v84;
          goto LABEL_71;
        }
        ++v85;
LABEL_71:

        v32 = v82;
        if (v85 >= v84)
          goto LABEL_74;
      }
      v77 = objc_msgSend(v34, "mailboxAttributes");
      objc_msgSend(v34, "mailboxName");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "separator");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        -[MFIMAPConnection mf_lock](v82, "mf_lock");
        v37 = v82;
        if (!v82->_separatorChar)
        {
          v38 = objc_msgSend(v80, "copy");
          separatorChar = v82->_separatorChar;
          v82->_separatorChar = (NSString *)v38;

          v37 = v82;
        }
        -[MFIMAPConnection mf_unlock](v37, "mf_unlock");
      }
      if (v83)
      {
        if (objc_msgSend(v83, "length")
          && (!-[__CFString length](theString, "length") || objc_msgSend(v83, "hasPrefix:", theString)))
        {
          v40 = v75;
          v41 = -[__CFString length](theString, "length");
          if (-[NSString length](v82->_serverNamespace, "length"))
            v70 = objc_msgSend(v83, "hasPrefix:", v82->_serverNamespace) ^ 1;
          else
            v70 = 0;
          if (v80)
          {
            objc_msgSend(v83, "rangeOfString:options:range:", v80, 8, v41, objc_msgSend(v83, "length") - v41);
            if (v45)
              v41 += objc_msgSend(v80, "length");
          }
          if (v41)
          {
            objc_msgSend(v83, "substringFromIndex:", v41);
            v46 = objc_claimAutoreleasedReturnValue();

            v83 = (void *)v46;
          }
          if (!v80)
          {
            v87 = v83;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = 1;
LABEL_51:
            v53 = 0;
            v52 = 0;
            while (2)
            {
              objc_msgSend(v47, "objectAtIndex:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v40, "mf_indexOfMailboxDictionaryWithName:", v54);
              if (v55 == 0x7FFFFFFFFFFFFFFFLL)
              {

                goto LABEL_55;
              }
              objc_msgSend(v40, "objectAtIndex:", v55);
              v56 = objc_claimAutoreleasedReturnValue();

              v52 = (void *)v56;
              if (!v56)
              {
LABEL_55:
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKey:", v54, CFSTR("MailboxName"));
                if (v53 + 1 < v51)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKey:", v57, CFSTR("IMAPMailboxAttributes"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setObject:forKey:", v58, CFSTR("MailboxAttributes"));

                }
                objc_msgSend(v40, "ef_insertObject:usingSortFunction:context:allowDuplicates:", v52, _MFCompareMailboxDictionariesByName, 0, 1);
              }
              objc_msgSend(v52, "objectForKey:", CFSTR("MailboxChildren"));
              v59 = objc_claimAutoreleasedReturnValue();

              v40 = (id)v59;
              if (!((v59 != 0) | (a6 != 2) | v77 & 1))
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v40 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKey:", v40, CFSTR("MailboxChildren"));
              }

              if (v51 == ++v53)
                goto LABEL_61;
              continue;
            }
          }
          objc_msgSend(v83, "componentsSeparatedByString:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");
          if (v48)
          {
            objc_msgSend(v47, "lastObject");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "isEqualToString:", &stru_1E4F1C8F8);

            v51 = v48 - v50;
            if (v48 != v50)
              goto LABEL_51;
          }
          v52 = 0;
LABEL_61:
          v60 = v47;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v77);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKey:", v61, CFSTR("IMAPMailboxAttributes"));

          objc_msgSend(v52, "objectForKey:", CFSTR("MailboxAttributes"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "unsignedIntValue") & 0xFFFFFFFD | (2 * ((v77 >> 1) & 1));
          if (v70)
            v64 = v63 | 0x80;
          else
            v64 = v63;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKey:", v65, CFSTR("MailboxAttributes"));

          if (v36 == 15)
          {
            objc_msgSend(v34, "extraAttributes");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v66, "count"))
              objc_msgSend(v52, "setObject:forKey:", v66, CFSTR("MailboxExtraAttributes"));

          }
        }
      }
      else
      {
        v83 = 0;
      }
      -[_MFIMAPCommandParameters untaggedResponses](v81, "untaggedResponses");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "removeObjectAtIndex:", v85);

      goto LABEL_70;
    }
  }
  else
  {
    v75 = 0;
    v32 = self;
  }
LABEL_74:
  v86 = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](v32, "didFinishCommands:", v68);

LABEL_75:
  if (a9)
    *a9 = objc_retainAutorelease(v79);

  return v75;
}

- (id)_listingForMailbox:(id)a3 options:(int64_t)a4 getSpecialUse:(BOOL)a5 statusDataItems:(id)a6 statusEntriesByMailbox:(id *)a7 withCommand:(int64_t)a8
{
  _BOOL8 v11;
  id v14;
  void *v15;
  MFIMAPMailboxListFilter *mailboxListFilter;

  v11 = a5;
  v14 = a3;
  -[MFIMAPConnection _doListCommand:withReference:mailboxName:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:](self, "_doListCommand:withReference:mailboxName:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:", a8, &stru_1E4F1C8F8, v14, a4, v11, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  mailboxListFilter = self->_mailboxListFilter;
  if (mailboxListFilter)
    -[MFIMAPMailboxListFilter filterMailboxList:forMailbox:options:](mailboxListFilter, "filterMailboxList:forMailbox:options:", v15, v14, a4);

  return v15;
}

- (id)listingForMailbox:(id)a3 options:(int64_t)a4 getSpecialUse:(BOOL)a5 statusDataItems:(id)a6 statusEntriesByMailbox:(id *)a7
{
  -[MFIMAPConnection _listingForMailbox:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:withCommand:](self, "_listingForMailbox:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:withCommand:", a3, a4, a5, a6, a7, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subscribedListingForMailbox:(id)a3 options:(int64_t)a4
{
  -[MFIMAPConnection _listingForMailbox:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:withCommand:](self, "_listingForMailbox:options:getSpecialUse:statusDataItems:statusEntriesByMailbox:withCommand:", a3, a4, 0, 0, 0, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)close
{
  _MFIMAPCommandParameters *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSString *selectedMailbox;
  void *v8;
  _MFIMAPCommandParameters *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 18);
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "responseType") == 2;

  if (v6)
  {
    *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xF8 | 2;
    selectedMailbox = self->_selectedMailbox;
    self->_selectedMailbox = 0;

  }
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v8);

}

- (BOOL)closeAndLogout
{
  _MFIMAPCommandParameters *v3;
  _MFIMAPCommandParameters *v4;
  void *v5;
  unint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 18);
  v8[0] = v3;
  v4 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 2);
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v6 = -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v5, 0);
  -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v5);

  return v6 != 0;
}

- (void)unselect
{
  _MFIMAPCommandParameters *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSString *selectedMailbox;
  void *v8;
  _MFIMAPCommandParameters *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 9))
  {
    v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 25);
    -[MFIMAPConnection mf_lock](self, "mf_lock");
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "responseType") == 2;

    if (v6)
    {
      *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xF8 | 2;
      selectedMailbox = self->_selectedMailbox;
      self->_selectedMailbox = 0;

    }
    -[MFIMAPConnection mf_unlock](self, "mf_unlock");
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v8);

  }
  else
  {
    -[MFIMAPConnection close](self, "close");
  }
}

- (void)handleBytesAvailable
{
  MFInvocationQueue *streamEventQueue;
  MFInvocationQueue *v4;
  MFInvocationQueue *v5;
  id v6;

  streamEventQueue = self->_streamEventQueue;
  if (!streamEventQueue)
  {
    v4 = objc_alloc_init(MFInvocationQueue);
    v5 = self->_streamEventQueue;
    self->_streamEventQueue = v4;

    streamEventQueue = self->_streamEventQueue;
  }
  objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:", sel__handleBytesAvailableInternal, self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFInvocationQueue addInvocation:](streamEventQueue, "addInvocation:");

}

- (void)_handleBytesAvailableInternal
{
  __int128 v3;
  MFIMAPResponse *v4;
  NSObject *v5;
  _MFIMAPCommandParameters *v6;
  id WeakRetained;
  void *v8;
  __int128 v9;
  uint8_t buf[4];
  MFIMAPConnection *v11;
  __int16 v12;
  MFIMAPResponse *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if (-[MFConnection hasBytesAvailable](self, "hasBytesAvailable"))
  {
    *(_QWORD *)&v3 = 134218242;
    v9 = v3;
    do
    {
      v4 = -[MFIMAPResponse initWithConnection:responseConsumer:]([MFIMAPResponse alloc], "initWithConnection:responseConsumer:", self, 0);
      if (-[MFIMAPResponse isUntagged](v4, "isUntagged") && (*(_BYTE *)&self->_delegateState & 2) != 0)
      {
        if (-[MFIMAPConnection isIdle](self, "isIdle"))
        {
          +[MFIMAPConnection log](MFIMAPConnection, "log");
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v9;
            v11 = self;
            v12 = 2112;
            v13 = v4;
            _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> received response while idling: %@", buf, 0x16u);
          }

        }
        v6 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 28);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v8 = WeakRetained;
        if (WeakRetained && (*(_BYTE *)&self->_delegateState & 2) != 0)
          objc_msgSend(WeakRetained, "connection:didReceiveResponse:forCommand:", self, v4, v6);

      }
    }
    while (-[MFConnection hasBytesAvailable](self, "hasBytesAvailable"));
  }
  -[MFIMAPConnection mf_unlock](self, "mf_unlock", v9);
}

- (void)locked_startIdle
{
  void *v3;
  id WeakRetained;
  void *v5;
  _MFIMAPCommandParameters *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _MFIMAPCommandParameters *v22;
  _MFIMAPCommandParameters *v23;
  uint8_t buf[4];
  MFIMAPConnection *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__MFIMAPConnection_locked_startIdle__block_invoke;
  v21[3] = &unk_1E4E89438;
  v21[4] = self;
  objc_msgSend(MEMORY[0x1E0D1EEC0], "lazyFutureWithBlock:", v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MFIMAPConnection isIdle](self, "isIdle")
    && -[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = WeakRetained;
    if (WeakRetained && (*(_BYTE *)&self->_delegateState & 0x80000000) != 0)
    {
      v8 = objc_msgSend(WeakRetained, "shouldStartIdleForConnection:", self);

      if (v8)
      {
        +[MFIMAPConnection log](MFIMAPConnection, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[MFIMAPConnection delegate](self, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v25 = self;
          v26 = 2112;
          v27 = v10;
          _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> starting IDLE state for delegate %@", buf, 0x16u);

        }
        v6 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 28);
        v23 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v12 = -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v11, &v20);
        v13 = v20;

        if (v12)
        {
          v14 = -[MFIMAPConnection _copyNextTaggedOrContinuationResponseForCommand:](self, "_copyNextTaggedOrContinuationResponseForCommand:", v6);

          if (objc_msgSend(v14, "responseType") == 1)
          {
            self->_idleCommandSequenceNumber = -[_MFIMAPCommandParameters sequenceNumber](v6, "sequenceNumber");
            v13 = v14;
            v15 = (id)objc_msgSend(v3, "result:", 0);
          }
          else
          {
            v13 = v14;
          }
        }
        v22 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v16);

        if (-[MFIMAPConnection isIdle](self, "isIdle"))
        {
          -[MFIMAPConnection locked_scheduleIdleResetAfterDelay:](self, "locked_scheduleIdleResetAfterDelay:", 1740.0);
        }
        else
        {
          +[MFIMAPConnection log](MFIMAPConnection, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            -[MFIMAPConnection delegate](self, "delegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v25 = self;
            v26 = 2112;
            v27 = v18;
            _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> failed to enter IDLE state: %@", buf, 0x16u);

          }
        }

        goto LABEL_21;
      }
    }
    else
    {

    }
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v6 = (_MFIMAPCommandParameters *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      -[MFIMAPConnection delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v25 = self;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_1A4F90000, &v6->super, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> delegate rejected starting IDLE state: %@", buf, 0x16u);

    }
LABEL_21:

  }
  v19 = (id)objc_msgSend(v3, "result:", 0);

}

id __36__MFIMAPConnection_locked_startIdle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__MFIMAPConnection_locked_startIdle__block_invoke_2;
  v4[3] = &unk_1E4E88DC8;
  v4[4] = v1;
  objc_msgSend(v2, "registerForBytesAvailableWithHandler:", v4);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __36__MFIMAPConnection_locked_startIdle__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBytesAvailable");
}

- (void)locked_finishIdle
{
  void *v3;
  NSObject *v4;
  void *v5;
  _MFIMAPCommandParameters *v6;
  void *v7;
  _MFIMAPCommandParameters *v8;
  uint8_t buf[4];
  MFIMAPConnection *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[MFNWConnectionWrapper unregisterForBytesAvailable](self->super._socket, "unregisterForBytesAvailable");
  -[MFIMAPConnection idleSubscriptionCancelable](self, "idleSubscriptionCancelable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  if (-[MFIMAPConnection isIdle](self, "isIdle"))
  {
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[MFIMAPConnection delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> leaving IDLE state for delegate: %@", buf, 0x16u);

    }
    v6 = -[_MFIMAPCommandParameters initWithCommand:sequenceNumber:]([_MFIMAPCommandParameters alloc], "initWithCommand:sequenceNumber:", 29, self->_idleCommandSequenceNumber);
    self->_idleCommandSequenceNumber = 0;
    v8 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v7, 0);

  }
}

- (void)finishIdle
{
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  -[MFIMAPConnection locked_finishIdle](self, "locked_finishIdle");
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
}

- (BOOL)isIdle
{
  return self->_idleCommandSequenceNumber != 0;
}

- (void)locked_scheduleIdle
{
  MFIMAPConnection *v3;
  void *v4;
  char v5;
  MFNWConnectionWrapper *socket;
  MFIMAPConnection *v7;
  _QWORD v8[5];

  if (-[MFIMAPConnection hasValidConnection](self, "hasValidConnection"))
  {
    v3 = self;
    if ((*((_WORD *)v3 + 64) & 0x20) != 0)
    {
      v7 = v3;
      objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isPlatform:", 2);

      if ((v5 & 1) == 0)
      {
        socket = v7->super._socket;
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __39__MFIMAPConnection_locked_scheduleIdle__block_invoke;
        v8[3] = &unk_1E4E88DC8;
        v8[4] = v7;
        -[MFNWConnectionWrapper registerForBytesAvailableWithHandler:](socket, "registerForBytesAvailableWithHandler:", v8);
        if (v7->_selectedMailbox)
          -[MFIMAPConnection locked_scheduleIdleResetAfterDelay:](v7, "locked_scheduleIdleResetAfterDelay:", 2.0);
      }
    }
    else
    {

    }
  }
}

uint64_t __39__MFIMAPConnection_locked_scheduleIdle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBytesAvailable");
}

- (void)scheduleIdleReset
{
  void *v3;
  char v4;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if (-[MFIMAPConnection hasValidConnection](self, "hasValidConnection"))
  {
    if ((*((_WORD *)self + 64) & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isPlatform:", 2);

      if ((v4 & 1) == 0)
      {
        if (self->_selectedMailbox)
          -[MFIMAPConnection locked_scheduleIdleResetAfterDelay:](self, "locked_scheduleIdleResetAfterDelay:", 2.0);
      }
    }
  }
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
}

- (void)locked_scheduleIdleResetAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MFIMAPConnection idleSubscriptionCancelable](self, "idleSubscriptionCancelable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__MFIMAPConnection_locked_scheduleIdleResetAfterDelay___block_invoke;
  v8[3] = &unk_1E4E89460;
  objc_copyWeak(v9, &location);
  v9[1] = *(id *)&a3;
  objc_msgSend(v6, "afterDelay:performBlock:", v8, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection setIdleSubscriptionCancelable:](self, "setIdleSubscriptionCancelable:", v7);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __55__MFIMAPConnection_locked_scheduleIdleResetAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  _WORD *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[MFIMAPConnection log](MFIMAPConnection, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218498;
    v13 = WeakRetained;
    v14 = 2048;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> timer fired for delayed IDLE reset after %0.2fs delay: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(WeakRetained, "mf_lock");
  v6 = WeakRetained;
  v7 = v6;
  if ((v6[64] & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPlatform:", 2);

    if ((v9 & 1) == 0)
    {
      +[MFIMAPConnection log](MFIMAPConnection, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 134218242;
        v13 = v7;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "Idle: connection <%p> resetting IDLE state: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(v7, "locked_finishIdle");
      objc_msgSend(v7, "locked_startIdle");
    }
  }
  else
  {

  }
  objc_msgSend(v7, "mf_unlock");

}

- (BOOL)expunge
{
  _MFIMAPCommandParameters *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _MFIMAPCommandParameters *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 16);
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "responseType") == 4)
  {
    -[MFIMAPConnection _errorForResponse:commandParams:](self, "_errorForResponse:commandParams:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v7);

  if (v6)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v6);

  }
  return 0;
}

- (BOOL)expungeUIDs:(id)a3
{
  id v4;
  void *v5;
  _MFIMAPCommandParameters *v6;
  void *v7;
  _MFIMAPCommandParameters *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _MFIMAPCommandParameters *v20;
  _MFIMAPCommandParameters *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 3))
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, CFSTR("*** Server doesn't support UIDPLUS"));
    v12 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_11;
LABEL_9:
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setError:", v17);

    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v12 = 1;
    goto LABEL_11;
  }
  -[MFIMAPConnection messageSetForUIDs:](self, "messageSetForUIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [_MFIMAPCommandParameters alloc];
  v22[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_MFIMAPCommandParameters initWithCommand:arguments:](v6, "initWithCommand:arguments:", 17, v7);

  v21 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "responseType");
  v12 = v11 == 2;
  v20 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v13);

  if (v11 != 2
    && (+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "error"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = v15 == 0,
        v15,
        v14,
        v16))
  {
    -[MFIMAPConnection _errorForResponse:commandParams:](self, "_errorForResponse:commandParams:", v10, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  if (v17)
    goto LABEL_9;
LABEL_11:

  return v12;
}

- (void)fetchStatusForMailboxes:(id)a3 args:(id)a4
{
  id v6;
  void *v7;
  MFIMAPConnection *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _MFIMAPCommandParameters *v17;
  void *v18;
  _MFIMAPCommandParameters *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;

  v6 = a3;
  -[MFIMAPConnection parenthesizedStringWithObjects:](self, "parenthesizedStringWithObjects:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self;
  v23 = v6;
  v22 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 30);
  v10 = objc_msgSend(v23, "count");
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v11, "addObject:", &stru_1E4F1C8F8);
  if (v22)
    objc_msgSend(v11, "addObject:", v22);
  if (v10)
  {
    v12 = 0;
    while (1)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection separatorChar](v8, "separatorChar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasPrefix:", v14))
      {
        objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length"));
        v15 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v15;
      }
      MFIMAPStringFromMailboxName(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceObjectAtIndex:withObject:", 0, v16);

      v17 = [_MFIMAPCommandParameters alloc];
      v18 = (void *)objc_msgSend(v11, "copy");
      v19 = -[_MFIMAPCommandParameters initWithCommand:arguments:](v17, "initWithCommand:arguments:", 8, v18);
      objc_msgSend(v9, "addObject:", v19);

      if (v12 == 29 || v10 - 1 == v12)
      {
        -[MFIMAPConnection _responseFromSendingCommands:](v8, "_responseFromSendingCommands:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "responseType");

        -[MFIMAPConnection didFinishCommands:](v8, "didFinishCommands:", v9);
        objc_msgSend(v9, "removeAllObjects");
        if (v21 != 2)
          break;
      }
      ++v12;

      if (v10 == v12)
        goto LABEL_13;
    }

  }
LABEL_13:

}

- (BOOL)examineMailbox:(id)a3
{
  return _processSelectCommand(self, 9, a3);
}

- (BOOL)selectMailbox:(id)a3 withAccount:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  v8 = _processSelectCommand(self, 13, v6);
  if (v8)
    -[MFIMAPConnection _updateSearchCapabilityWithAccount:](self, "_updateSearchCapabilityWithAccount:", v7);

  return v8;
}

- (id)selectedMailbox
{
  return self->_selectedMailbox;
}

- (BOOL)createMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFIMAPStringFromMailboxName(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 10, v6);
  if (v7)
    -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 14, v6);

  return v7;
}

- (BOOL)deleteMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFIMAPStringFromMailboxName(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 15, v6);
  LOBYTE(self) = -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 11, v6);

  return (char)self;
}

- (BOOL)renameMailbox:(id)a3 toMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MFIMAPStringFromMailboxName(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MFIMAPStringFromMailboxName(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 12, v10);
  if (v11)
  {
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 15, v12);

    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _sendMailboxCommand:withArguments:](self, "_sendMailboxCommand:withArguments:", 14, v13);

  }
  return v11;
}

- (BOOL)_sendMailboxCommand:(int64_t)a3 withArguments:(id)a4
{
  id v6;
  _MFIMAPCommandParameters *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  _MFIMAPCommandParameters *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", a3, v6);
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "responseType");
  if (v10 != 2)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
      v14 = -[MFIMAPConnection _errorForResponse:commandParams:](self, "_errorForResponse:commandParams:", v9, v7);
  }
  v17 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v15);

  return v10 == 2;
}

- (id)copyArgumentForSearchTerm:(id)a3
{
  __CFString *v3;
  const __CFCharacterSet *v4;
  uint64_t v5;
  void *v6;
  CFRange v8;

  v3 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (const __CFCharacterSet *)sIMAPNeedsLiteralCharacterSet;
    v8.length = -[__CFString length](v3, "length");
    v8.location = 0;
    if (CFStringFindCharacterFromSet(v3, v4, v8, 0, 0))
    {
      -[__CFString dataUsingEncoding:allowLossyConversion:](v3, "dataUsingEncoding:allowLossyConversion:", 4, 0);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v5;
      goto LABEL_9;
    }
    _IMAPCreateQuotedString(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_7:
      v5 = -[__CFString copy](v3, "copy");
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)searchUidSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  char v16;
  id v17;
  id v19;

  v8 = a3;
  v9 = a4;
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 15))
  {
    -[MFIMAPConnection eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:](self, "eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:", v8, 0, v9, a5, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("IMAPESearchAllKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1A85B0E24]();
      for (i = objc_msgSend(v11, "firstIndex");
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = objc_msgSend(v11, "indexGreaterThanIndex:", i))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v15);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v19 = 0;
    v16 = _doUidSearch(self, v8, v9, &v19, a5, 0);
    v17 = v19;
    v12 = v17;
    if ((v16 & 1) == 0)
    {

      v12 = 0;
    }
  }

  return v12;
}

- (id)searchIDSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  char v16;
  id v17;
  id v19;

  v8 = a3;
  v9 = a4;
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 15))
  {
    -[MFIMAPConnection eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:](self, "eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:", v8, 1, v9, a5, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("IMAPESearchAllKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1A85B0E24]();
      for (i = objc_msgSend(v11, "firstIndex");
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = objc_msgSend(v11, "indexGreaterThanIndex:", i))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v15);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v19 = 0;
    v16 = _doUidSearch(self, v8, v9, &v19, a5, 1);
    v17 = v19;
    v12 = v17;
    if ((v16 & 1) == 0)
    {

      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)countForSearchOfIDSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v8 = a3;
  v9 = a4;
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 15))
  {
    -[MFIMAPConnection eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:](self, "eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:", v8, 1, v9, a5, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("IMAPESearchCountKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "unsignedIntValue");
    }
    else
    {
      if (a5)
        *a5 = 0;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    -[MFIMAPConnection searchIDSet:forTerms:success:](self, "searchIDSet:forTerms:success:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "count");
  }

  return v13;
}

- (unint64_t)countForSearchOfUidSet:(id)a3 forTerms:(id)a4 success:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v8 = a3;
  v9 = a4;
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 15))
  {
    -[MFIMAPConnection eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:](self, "eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:", v8, 0, v9, a5, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("IMAPESearchCountKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "unsignedIntValue");
    }
    else
    {
      if (a5)
        *a5 = 0;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    -[MFIMAPConnection searchUidSet:forTerms:success:](self, "searchUidSet:forTerms:success:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "count");
  }

  return v13;
}

- (void)_updateSearchCapabilityWithAccount:(id)a3
{
  id v4;
  _BOOL4 verifiedESearchResponse;
  char v6;
  NSObject *v7;
  int v8;
  unsigned int v9;
  _QWORD v10[5];

  v4 = a3;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  verifiedESearchResponse = self->_verifiedESearchResponse;
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  if (!verifiedESearchResponse && -[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 15))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__MFIMAPConnection__updateSearchCapabilityWithAccount___block_invoke;
    v10[3] = &unk_1E4E89488;
    v10[4] = self;
    v6 = objc_msgSend(v4, "verifyESearchSupportWithBlock:", v10);
    -[MFIMAPConnection mf_lock](self, "mf_lock");
    if ((v6 & 1) == 0)
    {
      +[MFIMAPConnection log](MFIMAPConnection, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MFIMAPConnection _updateSearchCapabilityWithAccount:].cold.1(v7);

      v8 = *((unsigned __int16 *)self + 64);
      v9 = v8 & 0xFFFF7FFF | (*((unsigned __int8 *)self + 130) << 16);
      *((_WORD *)self + 64) = v8 & 0x7FFF;
      *((_BYTE *)self + 130) = BYTE2(v9);
    }
    self->_verifiedESearchResponse = 1;
    -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  }

}

BOOL __55__MFIMAPConnection__updateSearchCapabilityWithAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "countForSearchOfIDSet:forTerms:success:", CFSTR("1:*"), &unk_1E4F68EF0, 0);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = v2;
  objc_msgSend(*(id *)(a1 + 32), "eSearchIDSet:areMessageSequenceNumbers:forTerms:success:returning:", CFSTR("1:*"), 1, &unk_1E4F68EF0, 0, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IMAPESearchAllKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v3 = v4 == objc_msgSend(v6, "count");
  else
    v3 = 0;

  return v3;
}

- (unsigned)getMailboxIDForUID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  _MFIMAPCommandParameters *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[8];
  _MFIMAPCommandParameters *v22;
  _QWORD v23[2];

  v3 = *(_QWORD *)&a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", CFSTR("UID"), v6, 0);

  v8 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 31, v7);
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v9);

  -[_MFIMAPCommandParameters untaggedResponses](v8, "untaggedResponses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 1;

  if (v12)
  {
    -[_MFIMAPCommandParameters untaggedResponses](v8, "untaggedResponses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "searchResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      if (v17)
        goto LABEL_9;
    }
    else
    {

    }
  }
  MFLogGeneral();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "#Warning Invalid response from SEARCH command", buf, 2u);
  }

  v17 = 0;
LABEL_9:
  v22 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v19);

  return v17;
}

- (BOOL)storeFlags:(id)a3 state:(BOOL)a4 forMessageSet:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  _MFIMAPCommandParameters *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MFIMAPResponse *v17;
  MFIMAPFetchResult *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  __CFString *v23;
  _MFIMAPCommandParameters *v24;
  _MFIMAPCommandParameters *v25;
  id v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = CFSTR("-FLAGS.SILENT");
  if (v6)
    v10 = CFSTR("+FLAGS.SILENT");
  v26 = v9;
  v27 = v10;
  v23 = v27;
  -[MFIMAPConnection parenthesizedStringWithObjects:](self, "parenthesizedStringWithObjects:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 22, v12);
  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "responseType");

  if (v16 == 2)
  {
    v17 = objc_alloc_init(MFIMAPResponse);
    v18 = -[MFIMAPFetchResult initWithType:]([MFIMAPFetchResult alloc], "initWithType:", 10);
    -[MFIMAPFetchResult setFlagsArray:](v18, "setFlagsArray:", v8);
    -[MFIMAPResponse setResponseType:](v17, "setResponseType:", 24);
    -[MFIMAPResponse setUidFlagsChange:](v17, "setUidFlagsChange:", v6);
    -[MFIMAPResponse setUids:](v17, "setUids:", v9);
    -[MFIMAPResponse setFlagsFetchResult:](v17, "setFlagsFetchResult:", v18);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = WeakRetained;
    if (WeakRetained && (*(_BYTE *)&self->_delegateState & 1) != 0)
      objc_msgSend(WeakRetained, "connection:shouldHandleUntaggedResponse:forCommand:", self, v17, v13);

  }
  v24 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v21);

  return v16 == 2;
}

- (BOOL)storeFlags:(id)a3 state:(BOOL)a4 forUIDs:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    -[MFIMAPConnection messageSetForNumbers:](self, "messageSetForNumbers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MFIMAPConnection storeFlags:state:forMessageSet:](self, "storeFlags:state:forMessageSet:", v8, v6, v10);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)deleteMessagesOlderThanNumberOfDays:(int)a3
{
  void *v5;
  void *v6;
  _MFIMAPCommandParameters *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __CFArray *Mutable;
  CFIndex v17;
  unsigned int v18;
  CFRange v19;
  BOOL v20;
  void *v22;
  _QWORD v23[2];
  _MFIMAPCommandParameters *v24;
  _MFIMAPCommandParameters *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (a3 <= 0)
  {
    -[MFIMAPConnection messageSetForRange:](self, "messageSetForRange:", 0xFFFFFFFF00000001);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = CFSTR("+FLAGS.SILENT");
    v26[2] = CFSTR("(\\Deleted)");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 22, v5);
    v25 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v14);

    v24 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1 - a3, v6, 0);
    v7 = (_MFIMAPCommandParameters *)objc_claimAutoreleasedReturnValue();

    v23[0] = CFSTR("BEFORE");
    MFIMAPDateSearchStringForDate(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFIMAPConnection searchUidSet:forTerms:success:](self, "searchUidSet:forTerms:success:", 0, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      MFCreateArrayForMessageFlags(2, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 > 0x64)
      {
        v22 = v5;
        Mutable = CFArrayCreateMutable(0, 100, 0);
        v17 = 0;
        v18 = 100;
        do
        {
          CFArrayRemoveAllValues(Mutable);
          if (v11 - v17 >= 0x64)
            v19.length = 100;
          else
            v19.length = v11 - v17;
          v19.location = v17;
          CFArrayAppendArray(Mutable, (CFArrayRef)v10, v19);
          -[MFIMAPConnection storeFlags:state:forUIDs:](self, "storeFlags:state:forUIDs:", v12, 1, Mutable);
          v17 = v18;
          v20 = v11 > v18;
          v18 += 100;
        }
        while (v20);
        v5 = v22;
        CFRelease(Mutable);
      }
      else
      {
        -[MFIMAPConnection storeFlags:state:forUIDs:](self, "storeFlags:state:forUIDs:", v12, 1, v10);
      }

    }
  }

  return 1;
}

- (id)_responseFromSendingCommand:(id)a3 andPossiblyCreateMailbox:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "responseType") == 4)
  {
    v10 = objc_msgSend(v9, "responseCode") == 8;
    if (v9)
    {
LABEL_12:
      if (!v10)
        goto LABEL_18;
      goto LABEL_16;
    }
  }
  else
  {
    v10 = 0;
    if (v9)
      goto LABEL_12;
  }
  if (v10)
    goto LABEL_12;
  objc_msgSend(v6, "untaggedResponses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v9 = 0;
    goto LABEL_18;
  }
  v13 = 0;
  while (1)
  {
    objc_msgSend(v6, "untaggedResponses");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "responseType") == 4 && objc_msgSend(v15, "responseCode") == 8)
      break;

    if (++v13 >= v12)
      goto LABEL_18;
  }
  objc_msgSend(v6, "untaggedResponses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectAtIndex:", v13);

LABEL_16:
  v22 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v17);

  if (-[MFIMAPConnection createMailbox:](self, "createMailbox:", v7))
  {
    v21 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v19;
  }
LABEL_18:

  return v9;
}

- (BOOL)copyUIDs:(id)a3 toMailboxNamed:(id)a4 copyInfo:(id *)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _MFIMAPCommandParameters *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  _MFIMAPCommandParameters *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAPConnection.m"), 2668, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uids"));

  }
  -[MFIMAPConnection messageSetForUIDs:](self, "messageSetForUIDs:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v24[0] = v13;
    MFIMAPStringFromMailboxName(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 23, v15);
    -[MFIMAPConnection _responseFromSendingCommand:andPossiblyCreateMailbox:](self, "_responseFromSendingCommand:andPossiblyCreateMailbox:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v18);

    if (a5)
    {
      MFUIDPlusInfoFromResponse(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = -[MFIMAPConnection copyInfoForMessageInfo:](self, "copyInfoForMessageInfo:", v19);

    }
    v20 = objc_msgSend(v17, "responseType") == 2;

  }
  else if (a6)
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
    v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)moveUIDs:(id)a3 toMailboxNamed:(id)a4 copyInfo:(id *)a5 error:(id *)a6
{
  id v11;
  void *v12;
  _MFIMAPCommandParameters *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _MFIMAPCommandParameters *v37;
  _BYTE v38[128];
  _QWORD v39[2];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v11 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAPConnection.m"), 2692, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mailboxName"));

  }
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 20))
  {
    -[MFIMAPConnection messageSetForUIDs:](self, "messageSetForUIDs:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {
      v39[0] = v31;
      MFIMAPStringFromMailboxName(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 37, v30);
      -[MFIMAPConnection _responseFromSendingCommand:andPossiblyCreateMailbox:](self, "_responseFromSendingCommand:andPossiblyCreateMailbox:", v13, v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v29, "responseType");
      v15 = v14 == 2;
      if (a5)
      {
        if (v14 == 2)
        {
          MFUIDPlusInfoFromResponse(v29);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[MFIMAPConnection copyInfoForMessageInfo:](self, "copyInfoForMessageInfo:", v16);

          if (!v17)
          {
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            -[_MFIMAPCommandParameters untaggedResponses](v13, "untaggedResponses");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            if (v17)
            {
              v19 = *(_QWORD *)v34;
              while (2)
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v34 != v19)
                    objc_enumerationMutation(v18);
                  v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                  if (objc_msgSend(v21, "responseType") == 2 && objc_msgSend(v21, "responseCode") == 16)
                  {
                    MFUIDPlusInfoFromResponse(v21);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = -[MFIMAPConnection copyInfoForMessageInfo:](self, "copyInfoForMessageInfo:", v24);

                    goto LABEL_28;
                  }
                }
                v17 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
                if (v17)
                  continue;
                break;
              }
            }
LABEL_28:

          }
        }
        else
        {
          v17 = 0;
        }
        v25 = objc_retainAutorelease(v17);
        *a5 = v25;

      }
      v37 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v26);

    }
    else if (a6)
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, 0);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else if (a6)
  {
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[MFIMAPConnection ef_publicDescription](self, "ef_publicDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v23;
      _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "<%{public}@> Server does not support move.", buf, 0xCu);

    }
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, 0);
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyInfoForMessageInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D1E720]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIDVALIDITY"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUidValidity:", objc_msgSend(v6, "unsignedIntValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Source UIDS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Destination UIDS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _dictionaryFromSourceUIDs:destinationUIDs:](self, "_dictionaryFromSourceUIDs:destinationUIDs:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceUIDsToDestinationUIDs:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_dictionaryFromSourceUIDs:(id)a3 destinationUIDs:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  const char *CStringPtr;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int i;
  void *v14;
  void *v15;
  __int128 v17;
  __CFString *v18;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  UniChar buffer[8];
  __CFString *v27;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = -[__CFString length](v5, "length", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL,
         0xAAAAAAAAAAAAAAAALL);
  v27 = v5;
  v30 = 0;
  v31 = v8;
  if (CFStringGetCharactersPtr(v5))
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  v29 = CStringPtr;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = v8;
  v36 = 0;
  v10 = -[__CFString length](v6, "length");
  v18 = v6;
  v21 = 0;
  v22 = v10;
  if (CFStringGetCharactersPtr(v6))
    v11 = 0;
  else
    v11 = CFStringGetCStringPtr(v6, 0x600u);
  v20 = v11;
  v23 = 0;
  v24 = 0uLL;
  v25 = (unint64_t)v10;
  v12 = IMAPNextUidFromSet(buffer);
  for (i = IMAPNextUidFromSet((UniChar *)&v17); (_DWORD)v12 && i; i = IMAPNextUidFromSet((UniChar *)&v17))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

    v12 = IMAPNextUidFromSet(buffer);
  }
  if (v12 | i && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MFIMAPConnection _dictionaryFromSourceUIDs:destinationUIDs:].cold.1();

  return v7;
}

- (id)_indexSetForIMAPInlineSet:(id)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  const char *CStringPtr;
  unsigned int v7;
  __int128 v9;
  __CFString *v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (__CFString *)a3;
  v4 = (void *)objc_opt_new();
  v5 = -[__CFString length](v3, "length", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
  v10 = v3;
  v13 = 0;
  v14 = v5;
  if (CFStringGetCharactersPtr(v3))
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v12 = CStringPtr;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = v5;
  v19 = 0;
  while (1)
  {
    v7 = IMAPNextUidFromSet((UniChar *)&v9);
    if (!v7)
      break;
    objc_msgSend(v4, "addIndex:", v7);
  }

  return v4;
}

- (BOOL)appendData:(id)a3 toMailboxNamed:(id)a4 flags:(id)a5 dateReceived:(id)a6 appendInfo:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = -[MFIMAPConnection permanentFlags](self, "permanentFlags");
  v18 = MFMessageFlagsForECMessageFlags(v15);
  v19 = IMAPCreateArrayForMessageFlags(v18, -[MFIMAPConnection permanentFlags](self, "permanentFlags"), v17 >> 31);
  v27 = 0;
  v20 = -[MFIMAPConnection appendData:toMailboxNamed:flags:dateReceived:newMessageInfo:](self, "appendData:toMailboxNamed:flags:dateReceived:newMessageInfo:", v13, v14, v19, v16, &v27);
  v21 = v27;
  if (a7)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0D1E718]);
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("UIDVALIDITY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUidValidity:", objc_msgSend(v23, "unsignedIntValue"));

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Source UIDS"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNewMessageUID:", objc_msgSend(v24, "unsignedIntegerValue"));

    v25 = objc_retainAutorelease(v22);
    *a7 = v25;

  }
  return v20;
}

- (BOOL)storeFlagChange:(id)a3 forUIDs:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = -[MFIMAPConnection permanentFlags](self, "permanentFlags");
  v14 = 0;
  v15 = 0;
  MFGetFlagsAndMaskForFlagChange(v6, &v15, &v14);
  v9 = IMAPCreateArrayForMessageFlags(v14 & v15, v8, v8 >> 31);
  v10 = IMAPCreateArrayForMessageFlags(v14 & ~v15, v8, v8 >> 31);
  -[MFIMAPConnection messageSetForUIDs:](self, "messageSetForUIDs:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count")
    && v11
    && !-[MFIMAPConnection storeFlags:state:forMessageSet:](self, "storeFlags:state:forMessageSet:", v9, 1, v11))
  {
    v12 = 0;
  }
  else if (objc_msgSend(v10, "count"))
  {
    v12 = -[MFIMAPConnection storeFlags:state:forMessageSet:](self, "storeFlags:state:forMessageSet:", v10, 0, v11);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)storeGmailLabels:(id)a3 state:(BOOL)a4 forUIDs:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a5;
  -[MFIMAPConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFIMAPConnection storeGmailLabels:state:forUIDs:]", "IMAPConnection.m", 2825, "0");
}

- (BOOL)appendData:(id)a3 toMailboxNamed:(id)a4 flags:(id)a5 dateReceived:(id)a6 newMessageInfo:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  _MFIMAPCommandParameters *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v28;
  id v29;
  id v30;

  v30 = a3;
  v12 = a4;
  v13 = a5;
  v29 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 19, v14);
  if (a7)
    *a7 = 0;
  MFIMAPStringFromMailboxName(v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v16);

  if (v13)
  {
    -[MFIMAPConnection parenthesizedStringWithObjects:](self, "parenthesizedStringWithObjects:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v17);

  }
  v18 = v29;
  if (_MFIMAPDateStringForDate_onceToken != -1)
    dispatch_once(&_MFIMAPDateStringForDate_onceToken, &__block_literal_global_758);
  objc_msgSend((id)_MFIMAPDateStringForDate_formatter, "stringFromDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v14, "addObject:", v19);
  objc_msgSend(v14, "addObject:", v30);
  -[MFIMAPConnection _responseFromSendingCommand:andPossiblyCreateMailbox:](self, "_responseFromSendingCommand:andPossiblyCreateMailbox:", v15, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a7 && objc_msgSend(v20, "responseType") == 2 && objc_msgSend(v21, "responseCode") == 15)
  {
    objc_msgSend(v21, "responseInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("UIDVALIDITY"));

    objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("Source UIDS"));

    v25 = objc_retainAutorelease(v22);
    *a7 = v25;

  }
  v26 = objc_msgSend(v21, "responseType") == 2;

  return v26;
}

- (id)fetchMessageIdsForUids:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  MFIMAPConnection *v23;
  void *v24;
  _MFIMAPCommandParameters *v25;
  id v26;
  uint64_t v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _MFIMAPCommandParameters *v34;
  _BYTE v35[128];
  _MFIMAPCommandParameters *v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v26, "count"));
  objc_msgSend(v26, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  -[MFIMAPConnection messageSetForNumbers:](self, "messageSetForNumbers:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)v5;
  v37[0] = v5;
  v37[1] = CFSTR("(BODY.PEEK[HEADER.FIELDS (MESSAGE-ID)])");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 21, v24);
  v36 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](v23, "_responseFromSendingCommands:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "responseType") == 2;

  if ((_DWORD)v5)
  {
    -[_MFIMAPCommandParameters untaggedResponses](v25, "untaggedResponses");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      v27 = *MEMORY[0x1E0D1E5B0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v11, "responseType") == 17)
          {
            objc_msgSend(v11, "fetchResultWithType:", 4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fetchResultWithType:", 8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "fetchData");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithData:", v14);
              objc_msgSend(v15, "mf_convertNetworkLineEndingsToUnix");
              v16 = v15;

              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46110]), "initWithHeaderData:encoding:", v16, 0xFFFFFFFFLL);
              v18 = (void *)objc_msgSend(v17, "copyFirstStringValueForKey:", v27);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "uid"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, v19);

            }
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }

  }
  v34 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](v23, "didFinishCommands:", v20);

  return v28;
}

- (BOOL)performCustomCommand:(id)a3 withArguments:(id)a4
{
  id v6;
  void *v7;
  _MFIMAPCommandParameters *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _MFIMAPCommandParameters *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "insertObject:atIndex:", v19, 0);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v19, 0);
  }
  v8 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 38, v7);
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "responseType");
  if (v11 != 2)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      _messageFromResponse(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1033, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setError:", v16);

    }
  }
  v20 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v17);

  return v11 == 2;
}

- (void)setReadBufferSizeFromElapsedTime:(double)a3 bytesRead:(unint64_t)a4
{
  double v5;
  unsigned int v7;
  uint64_t v8;

  if (a3 > 0.0 && a4 >= 0x401)
  {
    v5 = a3 - *(double *)&sIMAPFetchTargetTime;
    if (a3 - *(double *)&sIMAPFetchTargetTime < 0.0)
      v5 = -(a3 - *(double *)&sIMAPFetchTargetTime);
    if (v5 > *(double *)&sIMAPFetchTargetTime * 0.5)
    {
      v7 = -[MFIMAPConnection readBufferSize](self, "readBufferSize");
      if (*(double *)&sIMAPFetchTargetTime <= a3)
      {
        if (v7 >> 1 <= sIMAPMinFetchChunkSize)
          v8 = sIMAPMinFetchChunkSize;
        else
          v8 = v7 >> 1;
      }
      else if (2 * v7 >= sIMAPMaxFetchChunkSize)
      {
        v8 = sIMAPMaxFetchChunkSize;
      }
      else
      {
        v8 = 2 * v7;
      }
      -[MFIMAPConnection setReadBufferSize:](self, "setReadBufferSize:", v8, *(double *)&sIMAPFetchTargetTime);
    }
  }
}

- (unsigned)readBufferSize
{
  unsigned int readBufferSize;

  readBufferSize = self->_readBufferSize;
  if (!readBufferSize)
  {
    readBufferSize = 0x2000;
    self->_readBufferSize = 0x2000;
  }
  return readBufferSize;
}

- (void)setReadBufferSize:(unsigned int)a3
{
  self->_readBufferSize = a3;
}

- (id)messageSetForRange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (a3.var1 == 0xFFFFFFFFLL)
    v4 = 0x7FFFFFFFFFFFFFFELL - a3.var0;
  else
    v4 = a3.var1 - a3.var0 + 1;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3.var0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection messageSetForUIDs:](self, "messageSetForUIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)messageSetForNumbers:(id)a3
{
  void *v4;
  void *v5;

  uidSetForUIDArray(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection messageSetForUIDs:](self, "messageSetForUIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)messageSetForUIDs:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    -[MFIMAPConnection messageSetForUIDs:maxTokens:remainder:](self, "messageSetForUIDs:maxTokens:remainder:", v4, -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)messageSetForUIDs:(id)a3 maxTokens:(unint64_t)a4 remainder:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[4];

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 200);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MFIMAPConnection_messageSetForUIDs_maxTokens_remainder___block_invoke;
  v13[3] = &unk_1E4E894B0;
  v15 = v29;
  v16 = &v19;
  v17 = &v25;
  v18 = a4;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v13);
  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  if (*((_BYTE *)v26 + 24))
    v10 = 0;
  else
    v10 = v9;
  v11 = v10;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

  return v11;
}

void __58__MFIMAPConnection_messageSetForUIDs_maxTokens_remainder___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if ((unint64_t)(v7 + 4) <= *(_QWORD *)(a1 + 64))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 0;
      if (!a3)
        return;
    }
    else
    {
      *(_QWORD *)(v6 + 24) = v7 + 1;
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(","));
      if (!a3)
        return;
    }
    if (a3 == 1)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%llu"), a2, v13);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += 3;
      if (HIDWORD(a3))
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%llu:*"), a2, v13);
      else
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%llu:%llu"), a2, a3 + a2 - 1);
    }
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v8)
    {
      objc_msgSend(v8, "addIndexesInRange:", a2, a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", a2, a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
}

- (id)parenthesizedStringWithObjects:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (i)
        objc_msgSend(v6, "appendString:", CFSTR(" "));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "appendString:", v8);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[MFIMAPConnection parenthesizedStringWithObjects:](self, "parenthesizedStringWithObjects:", v8);
        else
          objc_msgSend(v8, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v9);

      }
    }
  }
  objc_msgSend(v6, "appendString:", CFSTR(")"));

  return v6;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _MFIMAPCommandParameters *v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  NSMutableData *data;
  BOOL v26;
  NSObject *v27;
  ECSASLSecurityLayer *v28;
  ECSASLSecurityLayer *securityLayer;
  NSObject *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v35;
  id v36;
  _MFIMAPCommandParameters *v37;
  _MFIMAPCommandParameters *v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v6, "authenticationScheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 17)
    && objc_msgSend(v6, "supportsInitialClientResponse"))
  {
    objc_msgSend(v6, "responseForServerData:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mf_encodeBase64WithoutLineBreaks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 1);
      objc_msgSend(v10, "addObject:", v13);

    }
    else
    {
      MFLogGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "#Warning %@ claimed to support initial response data, and didn't supply an initial response", buf, 0xCu);
      }

    }
  }
  v15 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 4, v10);
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v38 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v17 = -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v16, &v36);
  v18 = v36;

  if (!v17)
  {
LABEL_24:
    v19 = v18;
    goto LABEL_46;
  }
  objc_msgSend(v6, "setAuthenticationState:", 1);
  while (1)
  {
    if (objc_msgSend(v6, "authenticationState") == 3)
      goto LABEL_24;
    v19 = -[MFIMAPConnection _copyNextTaggedOrContinuationResponseForCommand:](self, "_copyNextTaggedOrContinuationResponseForCommand:", v15);

    if (!v19)
    {
      objc_msgSend(v6, "setAuthenticationState:", 3);
      goto LABEL_46;
    }
    v20 = objc_msgSend(v19, "responseType");
    if (v20 != 1)
      break;
    objc_msgSend(v19, "userData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseForServerData:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if (objc_msgSend(v6, "usesBase64EncodeResponseData"))
      {
        objc_msgSend(v22, "mf_encodeBase64WithoutLineBreaks");
        v23 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v23;
      }
      -[NSMutableData setData:](self->_data, "setData:", v22);
    }
    else
    {
      -[NSMutableData setLength:](self->_data, "setLength:", 0);
    }
    -[NSMutableData appendBytes:length:](self->_data, "appendBytes:length:", &kIMAPLineEnding, 2);
    v24 = objc_msgSend(v6, "justSentPlainTextPassword");
    data = self->_data;
    if (v24)
      v26 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", data, 0, -[NSMutableData length](data, "length") - 2);
    else
      v26 = -[MFConnection writeData:](self, "writeData:", data);
    if (!v26)
    {
      if (objc_msgSend(v6, "authenticationState") == 1)
        objc_msgSend(v6, "setAuthenticationState:", 3);
      goto LABEL_45;
    }

    v18 = v19;
  }
  if (v20 == 2)
  {
    objc_msgSend(v6, "setAuthenticationState:", 4);
    *((_BYTE *)self + 152) = *((_BYTE *)self + 152) & 0xF8 | 2;
    if (!self->super._securityLayer)
    {
      objc_msgSend(v6, "securityLayer");
      v28 = (ECSASLSecurityLayer *)objc_claimAutoreleasedReturnValue();
      securityLayer = self->super._securityLayer;
      self->super._securityLayer = v28;

    }
    -[MFIMAPConnection _updateCapabilitiesForAccount:withAuthenticationResponse:](self, "_updateCapabilitiesForAccount:withAuthenticationResponse:", v35, v19);
    goto LABEL_46;
  }
  if (v20 == 3)
  {
    MFLogGeneral();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v19, "userString");
      objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection authenticateUsingAccount:authenticator:].cold.1();
    }
    goto LABEL_40;
  }
  if (v20 != 4)
  {
    +[MFIMAPConnection log](MFIMAPConnection, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v19;
      _os_log_error_impl(&dword_1A4F90000, v30, OS_LOG_TYPE_ERROR, "*** Unexpected response during authentication: %@", buf, 0xCu);
    }
LABEL_40:

    objc_msgSend(v6, "setAuthenticationState:", 3);
    goto LABEL_46;
  }
  MFLogGeneral();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v19, "userString");
    objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection authenticateUsingAccount:authenticator:].cold.2();
  }

  objc_msgSend(v6, "setAuthenticationState:", 2);
  if (objc_msgSend(v19, "responseCode") == 18)
  {
    objc_msgSend(v6, "setMissingPasswordError");
    goto LABEL_46;
  }
  -[MFIMAPConnection _serverErrorForAccount:response:command:](self, "_serverErrorForAccount:response:command:", v35, v19, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setError:", v22);

  }
LABEL_45:

LABEL_46:
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  v37 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v32);

  if (objc_msgSend(v6, "authenticationState") == 3)
    -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 0);
  v33 = objc_msgSend(v6, "authenticationState") == 4;

  return v33;
}

- (BOOL)startTLSForAccount:(id)a3
{
  id v4;
  _MFIMAPCommandParameters *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _MFIMAPCommandParameters *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 0))
  {
    v5 = -[_MFIMAPCommandParameters initWithCommand:]([_MFIMAPCommandParameters alloc], "initWithCommand:", 3);
    v26[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection _responseFromSendingCommands:](self, "_responseFromSendingCommands:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "responseType") == 2;

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("TLS_FAILED_FORMAT"), CFSTR("Starting TLS failed on %@ server “%@”. Please check your account settings and try again."), CFSTR("Delayed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "accountTypeString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hostname");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1033, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setError:", v15);

    }
    v25 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection didFinishCommands:](self, "didFinishCommands:", v16);

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("TLS_NOT_SUPPORTED_FORMAT"), CFSTR("The %@ server “%@” doesn’t support TLS (SSL) on port %u. Please check your account settings and try again."), CFSTR("Delayed"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "accountTypeString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostname");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19, v20, objc_msgSend(v4, "portNumber"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1034, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setError:", v23);

    v8 = 0;
  }
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");

  return v8;
}

- (NSString)debugDescription
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  unsigned __int8 v15;
  const char *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[MFIMAPConnection log](MFIMAPConnection, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v21 = objc_opt_class();
    -[MFIMAPConnection _connectionStateDescription](self, "_connectionStateDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = atomic_load((unsigned __int8 *)&self->super._isFetching);
    if ((v15 & 1) != 0)
      v16 = ", Fetching";
    else
      v16 = "";
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = v16;
    v18 = (void *)v14;
    objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@:%p> [%@%s] delegate=%p mailbox=<%@>"), v21, self, v14, v20, WeakRetained, self->_selectedMailbox);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_debug_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEBUG, "debugDescription for _connectionState: %@", buf, 0xCu);

  }
  v4 = self->_selectedMailbox == 0;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[MFIMAPConnection _connectionStateDescription](self, "_connectionStateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = atomic_load((unsigned __int8 *)&self->super._isFetching);
  if ((v8 & 1) != 0)
    v9 = ", Fetching";
  else
    v9 = "";
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = v10;
  if (v4)
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p> [%@%s] delegate=%p"), v6, self, v7, v9, v10);
  else
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p> [%@%s] delegate=%p mailbox=<%@>"), v6, self, v7, v9, v10, self->_selectedMailbox);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unsigned)literalChunkSize
{
  return 4096;
}

- (id)_readDataOfLength:(int64_t)a3
{
  NSMutableData *data;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  _BYTE *v10;
  _BYTE *v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  BOOL v15;
  NSUInteger v16;

  -[NSMutableData setLength:](self->_data, "setLength:", 0);
  if (a3 < 1)
  {
    if (a3 < 0 && -[MFConnection readLineIntoData:](self, "readLineIntoData:", self->_data))
    {
      v6 = -[NSMutableData bytes](self->_data, "bytes");
      if (v6)
      {
        v8 = v6;
        v9 = -[NSMutableData length](self->_data, "length");
        v7 = v9 - 2;
        if (v9 >= 2 && *(_BYTE *)(v9 + v8 - 1) == 10 && *(_BYTE *)(v8 + v7) == 13)
          -[NSMutableData setLength:](self->_data, "setLength:");
      }
      if (-[NSMutableData length](self->_data, "length", v7))
      {
        v10 = (_BYTE *)-[NSMutableData bytes](self->_data, "bytes");
        if (v10)
        {
          v11 = v10;
          if (!*v10)
          {
            v12 = -[NSMutableData length](self->_data, "length");
            v13 = 0;
            do
            {
              v14 = v13 + 1;
              if (v11[v13 + 1])
                v15 = 1;
              else
                v15 = v14 >= v12;
              ++v13;
            }
            while (!v15);
            v16 = v12 - v14;
            memmove(-[NSMutableData mutableBytes](self->_data, "mutableBytes"), &v11[v14], v12 - v14);
            -[NSMutableData setLength:](self->_data, "setLength:", v16);
          }
        }
      }
      goto LABEL_3;
    }
LABEL_21:
    data = 0;
    return data;
  }
  if (!-[MFConnection readBytesIntoData:desiredLength:](self, "readBytesIntoData:desiredLength:", self->_data, a3))
    goto LABEL_21;
LABEL_3:
  data = self->_data;
  return data;
}

- (id)_fetchArgumentForMessageUidsAndFlags
{
  return CFSTR("(UID FLAGS)");
}

- (id)_fetchArgumentForMessageSkeletonsWithAllHeaders
{
  NSString *lastRequiredHeaders;
  void *v4;
  NSString *v5;
  NSString *v6;

  -[MFIMAPConnection mf_lock](self, "mf_lock");
  lastRequiredHeaders = self->_lastRequiredHeaders;
  if (!lastRequiredHeaders)
  {
    v4 = (void *)objc_msgSend(CFSTR("(INTERNALDATE UID RFC822.SIZE FLAGS "), "mutableCopyWithZone:", 0);
    if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 16))
      objc_msgSend(v4, "appendString:", CFSTR("MODSEQ "));
    if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 19))
      objc_msgSend(v4, "appendString:", CFSTR("X-GM-MSGID "));
    objc_msgSend(v4, "appendString:", CFSTR("BODY.PEEK[HEADER])"));
    v5 = self->_lastRequiredHeaders;
    self->_lastRequiredHeaders = (NSString *)v4;

    lastRequiredHeaders = self->_lastRequiredHeaders;
  }
  v6 = lastRequiredHeaders;
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  return v6;
}

- (BOOL)_isFetchResponseValid:(id)a3
{
  return 1;
}

- (id)_responseFromSendingCommands:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  BOOL v16;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85B0E24]();
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v18 = 0;
  v6 = -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v4, &v18);
  v7 = v18;
  v8 = v7;
  if (v6)
  {
    v9 = v6 - 1;
    objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "sequenceNumber");

    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MFIMAPConnection _copyNextTaggedOrContinuationResponseForCommand:](self, "_copyNextTaggedOrContinuationResponseForCommand:", v12);

      if (!v13)
        break;
      objc_msgSend(v13, "tag");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      v16 = v11 == v15;
      v8 = v13;
    }
    while (!v16);
  }
  else
  {
    v13 = v7;
  }
  -[MFIMAPConnection locked_scheduleIdle](self, "locked_scheduleIdle");
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
  objc_autoreleasePoolPop(v5);

  return v13;
}

- (BOOL)sendResponsesForCommand:(id)a3 toQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  id v14;
  char v15;
  char v16;
  char v17;
  void *v18;
  BOOL v19;
  BOOL v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MFIMAPConnection mf_lock](self, "mf_lock");
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MFIMAPConnection _sendCommands:response:](self, "_sendCommands:response:", v8, 0);

  if (v9)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "sequenceNumber");
    v12 = 1;
    while ((v12 & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1A85B0E24]();
      v14 = -[MFIMAPConnection _copyNextServerResponseForCommand:](self, "_copyNextServerResponseForCommand:", v6);
      v15 = objc_msgSend(v10, "shouldCancel");
      if (v14)
        v16 = v15;
      else
        v16 = 1;
      if ((v16 & 1) != 0
        || (objc_msgSend(v14, "isUntagged") & 1) == 0
        && (objc_msgSend(v14, "tag"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = v11 == objc_msgSend(v18, "intValue"),
            v18,
            v19))
      {
        v17 = 0;
      }
      else
      {
        v12 = objc_msgSend(v7, "addItem:", v14);
        v17 = 1;
      }

      objc_autoreleasePoolPop(v13);
      if ((v17 & 1) == 0)
      {
        v20 = v12 & 1;
        goto LABEL_16;
      }
    }
    v20 = 0;
LABEL_16:

  }
  else
  {
    v20 = 1;
  }
  -[MFIMAPConnection locked_scheduleIdle](self, "locked_scheduleIdle");
  -[MFIMAPConnection mf_unlock](self, "mf_unlock");

  return v20;
}

- (BOOL)sendResponsesForUIDFetchForUIDs:(id)a3 fields:(id)a4 toQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  _MFIMAPCommandParameters *v16;
  uint64_t v17;
  _MFIMAPCommandParameters *v18;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uidSetForUIDArray(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
  while (objc_msgSend(v12, "count") && (objc_msgSend(v11, "shouldCancel") & 1) == 0)
  {
    v20 = 0;
    -[MFIMAPConnection messageSetForUIDs:maxTokens:remainder:](self, "messageSetForUIDs:maxTokens:remainder:", v12, 500, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;

    v16 = [_MFIMAPCommandParameters alloc];
    v21[0] = v14;
    v21[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[_MFIMAPCommandParameters initWithCommand:arguments:](v16, "initWithCommand:arguments:", 21, v17);

    LOBYTE(v17) = -[MFIMAPConnection sendResponsesForCommand:toQueue:](self, "sendResponsesForCommand:toQueue:", v18, v10);
    v13 &= v17;
    v12 = v15;
  }

  return v13 & 1;
}

- (BOOL)sendSkeletonResponsesForUIDs:(id)a3 includeTo:(BOOL)a4 toQueue:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a5;
  -[MFIMAPConnection _fetchArgumentForMessageSkeletonsWithAllHeaders](self, "_fetchArgumentForMessageSkeletonsWithAllHeaders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MFIMAPConnection sendResponsesForUIDFetchForUIDs:fields:toQueue:](self, "sendResponsesForUIDFetchForUIDs:fields:toQueue:", v7, v9, v8);

  return (char)self;
}

- (BOOL)sendUidAndFlagResponsesForUIDs:(id)a3 sequenceIdentifierProvider:(id)a4 flagSearchResults:(id)a5 toQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12 || !-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 16))
  {
    -[MFIMAPConnection _fetchArgumentForMessageUidsAndFlags](self, "_fetchArgumentForMessageUidsAndFlags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = -[MFIMAPConnection sendResponsesForUIDs:fields:flagSearchResults:toQueue:](self, "sendResponsesForUIDs:fields:flagSearchResults:toQueue:", v10, v16, v12, v13);

  }
  else
  {
    objc_msgSend(v11, "sequenceIdentifierForUIDs:", v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    LODWORD(self) = -[MFIMAPConnection sendResponsesForCondStoreFlagFetchForUIDs:withSequenceIdentifier:toQueue:](self, "sendResponsesForCondStoreFlagFetchForUIDs:withSequenceIdentifier:toQueue:", v10, &v18, v13);
    v15 = v18;

    objc_msgSend(v13, "flush");
    if ((_DWORD)self && objc_msgSend(v15, "length") && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
      objc_msgSend(v11, "setSequenceIdentifier:forUIDs:", v15, v10);

  }
  return (char)self;
}

- (BOOL)sendUidResponsesForSearchArguments:(id)a3 toQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t i;
  char v14;
  char v15;
  void *v16;
  _MFIMAPCommandParameters *v17;
  BOOL v18;
  MFIMAPResponse *v19;
  void *context;
  char v22;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  if (-[MFIMAPConnection supportsCapability:](self, "supportsCapability:", 15))
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPConnection eSearchIDSet:areMessageSequenceNumbers:arguments:success:returning:](self, "eSearchIDSet:areMessageSequenceNumbers:arguments:success:returning:", 0, 0, v6, &v22, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("IMAPESearchAllKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v22 && v10)
    {
      context = (void *)MEMORY[0x1A85B0E24]();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = objc_msgSend(v11, "firstIndex"); ; i = objc_msgSend(v11, "indexGreaterThanIndex:", i))
      {
        v14 = objc_msgSend(v8, "shouldCancel");
        v15 = i == 0x7FFFFFFFFFFFFFFFLL ? 1 : v14;
        if ((v15 & 1) != 0)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v16);

      }
      if ((objc_msgSend(v8, "shouldCancel") & 1) == 0)
      {
        v19 = objc_alloc_init(MFIMAPResponse);
        -[MFIMAPResponse setResponseType:](v19, "setResponseType:", 14);
        -[MFIMAPResponse setSearchResults:](v19, "setSearchResults:", v12);
        objc_msgSend(v7, "addItem:", v19);

      }
      objc_autoreleasePoolPop(context);
    }

    v18 = v22 != 0;
  }
  else
  {
    v17 = -[_MFIMAPCommandParameters initWithCommand:arguments:]([_MFIMAPCommandParameters alloc], "initWithCommand:arguments:", 24, v6);
    v18 = -[MFIMAPConnection sendResponsesForCommand:toQueue:](self, "sendResponsesForCommand:toQueue:", v17, v7);

  }
  return v18;
}

- (id)searchUIDs:(id)a3 withFlagRequests:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  MFIMAPConnectionFlagSearchResults *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = v6;
  v22 = a4;
  -[MFIMAPConnection _fetchArgumentForMessageUidsAndFlags](self, "_fetchArgumentForMessageUidsAndFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(CFSTR("(UID FLAGS)"), "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v19, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MFIMAPConnectionFlagSearchResults);
    v27 = 1;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v22;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "searchTerms");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFIMAPConnection searchUidSet:forTerms:success:](self, "searchUidSet:forTerms:success:", v9, v16, &v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {

            v10 = 0;
            goto LABEL_13;
          }
          -[MFIMAPConnectionFlagSearchResults cacheStateForUIDs:mask:existenceSetsFlag:](v10, "cacheStateForUIDs:mask:existenceSetsFlag:", v17, objc_msgSend(v15, "mask"), objc_msgSend(v15, "isPositiveMatch"));

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)sendResponsesForUIDs:(id)a3 fields:(id)a4 flagSearchResults:(id)a5 toQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          v18 = (void *)objc_msgSend(v12, "copyResponseForUID:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "integerValue", (_QWORD)v21));
          if (v18)
            objc_msgSend(v13, "addItem:", v18);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

    v19 = 1;
  }
  else
  {
    v19 = -[MFIMAPConnection sendResponsesForUIDFetchForUIDs:fields:toQueue:](self, "sendResponsesForUIDFetchForUIDs:fields:toQueue:", v10, v11, v13);
  }

  return v19;
}

- (void)didFinishCommands:(id)a3
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *WeakRetained;
  void *v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v4)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = v4;
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v6, "untaggedResponses");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v9 = 0;
          v10 = 0;
          do
          {
            objc_msgSend(v6, "untaggedResponses");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            switch(objc_msgSend(v12, "responseType"))
            {
              case 2:
                if (objc_msgSend(v12, "responseCode") != 12)
                  goto LABEL_30;
                WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                if (WeakRetained && (*(_BYTE *)&self->_delegateState & 0x20) != 0)
                {
                  objc_msgSend(v12, "responseInfo");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject setHighestModSequence:](WeakRetained, "setHighestModSequence:", objc_msgSend(v14, "unsignedLongLongValue"));

                }
                goto LABEL_29;
              case 3:
                MFLogGeneral();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  -[MFIMAPConnection _errorForResponse:commandParams:](self, "_errorForResponse:commandParams:", v12, v6);
                  objc_claimAutoreleasedReturnValue();
                  -[MFIMAPConnection didFinishCommands:].cold.1();
                }

                self->_gotBadResponse = 1;
                goto LABEL_30;
              case 4:
                +[MFIMAPConnection log](MFIMAPConnection, "log");
                WeakRetained = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
                {
                  v19 = _IMAPCommandTable[objc_msgSend(v6, "command")];
                  *(_DWORD *)buf = 136315394;
                  v28 = v19;
                  v29 = 2112;
                  v30 = v12;
                  _os_log_error_impl(&dword_1A4F90000, WeakRetained, OS_LOG_TYPE_ERROR, "Unhandled response to command %s: %@", buf, 0x16u);
                }
                goto LABEL_29;
              case 6:
                +[MFIMAPConnection log](MFIMAPConnection, "log");
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  v16 = _IMAPCommandTable[objc_msgSend(v6, "command")];
                  *(_DWORD *)buf = 136315394;
                  v28 = v16;
                  v29 = 2112;
                  v30 = v12;
                  _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_DEFAULT, "MFIMAPConnection was lost during processing of command %s: %@.", buf, 0x16u);
                }

                v9 = 1;
                goto LABEL_30;
              case 7:
                objc_msgSend(v12, "capabilities");
                WeakRetained = objc_claimAutoreleasedReturnValue();
                if (WeakRetained)
                {
                  -[MFIMAPConnection mf_lock](self, "mf_lock");
                  -[MFIMAPConnection _clearCapabilities](self, "_clearCapabilities");
                  -[MFIMAPConnection _addCapabilities:](self, "_addCapabilities:", WeakRetained);
                  -[MFIMAPConnection mf_unlock](self, "mf_unlock");
                }
                goto LABEL_29;
              case 9:
                WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                if (WeakRetained && (*(_BYTE *)&self->_delegateState & 0x10) != 0)
                  -[NSObject setServerMessageCount:](WeakRetained, "setServerMessageCount:", objc_msgSend(v12, "number"));
LABEL_29:

                goto LABEL_30;
              case 10:
              case 11:
              case 17:
LABEL_30:
                objc_msgSend(v6, "untaggedResponses");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "removeObjectAtIndex:", v10);

                --v8;
                break;
              default:
                ++v10;
                break;
            }

          }
          while (v10 < v8);
          if ((v9 & 1) != 0)
            -[MFIMAPConnection disconnectAndNotifyDelegate:](self, "disconnectAndNotifyDelegate:", 1);
        }
        objc_msgSend(v6, "setUntaggedResponses:", 0);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v4);
  }

}

- (id)_logStringForIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x65)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "substringToIndex:", 100);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ ..."), v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_logStringForCommand:(id)a3
{
  id v4;
  const char *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  if (objc_msgSend(v4, "command") == 38)
    v5 = "";
  else
    v5 = _IMAPCommandTable[objc_msgSend(v4, "command")];
  v6 = &stru_1E4F1C8F8;
  v7 = objc_msgSend(v4, "command");
  switch(v7)
  {
    case 20:
    case 21:
      objc_msgSend(v4, "arguments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      objc_msgSend(v4, "arguments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v11, "length") >= 0x65)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "substringToIndex:", 100);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ ..."), v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
      v15 = CFSTR(" ...");
      if (v9 <= 2)
        v15 = &stru_1E4F1C8F8;
      v16 = v15;
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "arguments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ %@%@"), v11, v19, v16);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 22:
      objc_msgSend(v4, "arguments");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection _logStringForIDs:](self, "_logStringForIDs:", v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "arguments");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ %@"), v11, v18);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 23:
    case 37:
      objc_msgSend(v4, "arguments");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection _logStringForIDs:](self, "_logStringForIDs:", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = (void *)MEMORY[0x1E0D1EF48];
      objc_msgSend(v4, "arguments");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "partiallyRedactedStringForString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ %@"), v11, v19);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v6 = (__CFString *)v20;

LABEL_17:
      goto LABEL_18;
    case 24:
    case 31:
      objc_msgSend(v4, "arguments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPConnection _publicDescriptionForSearchString:](self, "_publicDescriptionForSearchString:", v11);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString componentsJoinedByString:](v16, "componentsJoinedByString:", CFSTR(" "));
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
      goto LABEL_20;
    case 38:
      objc_msgSend(v4, "arguments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    default:
      if (v7 != 13)
        goto LABEL_20;
      v26 = (void *)MEMORY[0x1E0D1EF48];
      objc_msgSend(v4, "arguments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "partiallyRedactedStringForString:", v16);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v6 = (__CFString *)v25;
LABEL_18:

LABEL_19:
LABEL_20:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu %s %@"), objc_msgSend(v4, "sequenceNumber"), v5, v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      return v30;
  }
}

- (id)_publicDescriptionForSearchString:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_388);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __54__MFIMAPConnection__publicDescriptionForSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "hasPrefix:", CFSTR("\")))
  {
    v3 = (void *)MEMORY[0x1E0D1EF48];
    objc_msgSend(v2, "substringFromIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "partiallyRedactedStringForString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (double)connectTime
{
  return self->_connectTime;
}

- (int)tag
{
  return self->_tag;
}

- (MFIMAPConnectionDelegate)delegate
{
  return (MFIMAPConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)idleCommandSequenceNumber
{
  return self->_idleCommandSequenceNumber;
}

- (void)setIdleCommandSequenceNumber:(unint64_t)a3
{
  self->_idleCommandSequenceNumber = a3;
}

- (EFCancelable)idleSubscriptionCancelable
{
  return self->_idleSubscriptionCancelable;
}

- (void)setIdleSubscriptionCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_idleSubscriptionCancelable, a3);
}

- (unsigned)permanentFlags
{
  return self->_permanentFlags;
}

- (void)setPermanentFlags:(unsigned int)a3
{
  self->_permanentFlags = a3;
}

- (id)_searchUidsForMessageIDs:(id)a3 excludeDeleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4 * v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__MFIMAPConnection_ReferenceSearching___searchUidsForMessageIDs_excludeDeleted___block_invoke;
  v13[3] = &unk_1E4E89558;
  v15 = v7 - 1;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  if (v4)
    objc_msgSend(v9, "addObject:", CFSTR("UNDELETED"));
  v12 = 0;
  -[MFIMAPConnection searchIDSet:forTerms:success:](self, "searchIDSet:forTerms:success:", 0, v9, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __80__MFIMAPConnection_ReferenceSearching___searchUidsForMessageIDs_excludeDeleted___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40) > a3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("OR"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("HEADER"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("Message-ID"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)_uidsForMessageIDs:(id)a3 excludeDeleted:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_msgSend(v6, "ef_subarraysOfSize:", 5);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        -[MFIMAPConnection _searchUidsForMessageIDs:excludeDeleted:](self, "_searchUidsForMessageIDs:excludeDeleted:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v4, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)_sendApplePushForAccountIfSupported:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "#aps-push account %@ received mailbox responses but version 1 response, ignoring mailboxes", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_sendApplePushForAccountIfSupported:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4(&dword_1A4F90000, a4, a3, "#aps-push account %@ specified bad version/topic in response: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_1();
}

- (void)_sendApplePushForAccountIfSupported:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v0, (uint64_t)v0, "#aps-push account %@ rejected XAPPLEPUSHSERVICE request: %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)_doBasicConnectionUsingAccount:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "*** Failed to read initial response from %@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_doBasicConnectionUsingAccount:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "*** Expected untagged initial response from %@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_sendCommands:(uint64_t)a3 response:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "%{public}@ failed to write commands", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_sendCommands:response:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "*** Invalid IMAP command %@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)authenticateUsingAccount:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "LOGIN failed with error %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)authenticateUsingAccount:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "LOGIN failed due to non-ascii username: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_updateSearchCapabilityWithAccount:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "inconsistent esearch counts detected, ignoring esearch capability", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)_dictionaryFromSourceUIDs:destinationUIDs:.cold.1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A4F90000, MEMORY[0x1E0C81028], v0, "IMAPConnection: source UIDs count is different from destination UIDs (source: %@; destination: %@)",
    v1);
  OUTLINED_FUNCTION_5();
}

- (void)authenticateUsingAccount:authenticator:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  *v1 = 138412290;
  *v3 = v2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v5, (uint64_t)v3, "IMAP protocol error: %@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)authenticateUsingAccount:authenticator:.cold.2()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  *v1 = 138412290;
  *v3 = v2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v5, (uint64_t)v3, "IMAP auth failure: %@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)didFinishCommands:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  *v1 = 138412290;
  *v3 = v2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v5, (uint64_t)v3, "%@", v4);

  OUTLINED_FUNCTION_1();
}

@end
