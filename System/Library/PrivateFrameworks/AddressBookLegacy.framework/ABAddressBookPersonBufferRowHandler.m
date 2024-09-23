@implementation ABAddressBookPersonBufferRowHandler

uint64_t __ABAddressBookPersonBufferRowHandler_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if ((_DWORD)v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D13A20]);
    objc_msgSend(v4, "setData:", objc_msgSend(*(id *)(a1 + 32), "mutableData"));
    objc_msgSend(v4, "setIdentifierAccountingData:", objc_msgSend(*(id *)(a1 + 32), "contactIdentifiers"));
    objc_msgSend(v4, "setMatchInfo:", objc_msgSend(*(id *)(a1 + 32), "matchInfo"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setCountOfContactsInBuffer:", 0);
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mutableData"), "length");
    objc_msgSend(*(id *)(a1 + 32), "setMutableData:", objc_msgSend(MEMORY[0x1E0C99DF0], "data"));
    v6 = ABOSLogImageMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v9 = 134218496;
      v10 = v7;
      v11 = 2048;
      v12 = objc_msgSend(v7, "mutableData");
      v13 = 2048;
      v14 = v5;
      _os_log_impl(&dword_19BC4B000, v6, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p), re-created buffer (%p) [previous %lu]", (uint8_t *)&v9, 0x20u);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "matchInfo"), "removeAllObjects");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "contactIdentifiers"), "removeAllObjects");

  }
  return v3;
}

uint64_t __ABAddressBookPersonBufferRowHandler_block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;
  uint64_t appended;
  char v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v8;
  char v9;
  int v10;
  uint64_t v11;
  _QWORD v12[5];

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (!objc_msgSend(v2, "resumeToken")
    && ((objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageData") & 1) != 0
     || objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageCropRect")))
  {
    if (objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageCropRect"))
      v4 = objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageData") ^ 1;
    else
      v4 = 0;
    appended = AppendImageData(v1, 2, v4, 2, v2);
  }
  else
  {
    if (objc_msgSend(v2, "resumeToken") == 2)
    {
      if (!AppendPendingBlobData(v2))
      {
        appended = 1;
        goto LABEL_13;
      }
      objc_msgSend(v2, "setResumeToken:", 0);
    }
    appended = 0;
  }
LABEL_13:
  if (objc_msgSend(v2, "resumeToken")
    || !objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageThumbnail"))
  {
    if (objc_msgSend(v2, "resumeToken") == 3)
    {
      if (AppendPendingBlobData(v2))
        objc_msgSend(v2, "setResumeToken:", 0);
      else
        appended = 1;
    }
  }
  else
  {
    appended = AppendImageData(v1, 0, 0, 3, v2);
  }
  if (objc_msgSend(v2, "resumeToken")
    || !objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageFullscreenData"))
  {
    if (objc_msgSend(v2, "resumeToken") == 4)
    {
      if (AppendPendingBlobData(v2))
        objc_msgSend(v2, "setResumeToken:", 0);
      else
        appended = 1;
    }
  }
  else
  {
    appended = AppendImageData(v1, 4, 0, 4, v2);
  }
  if (objc_msgSend(v2, "resumeToken")
    || !objc_msgSend((id)objc_msgSend(v2, "query"), "requestedSyncImageData"))
  {
    if (objc_msgSend(v2, "resumeToken") == 5)
    {
      if (AppendPendingBlobData(v2))
        objc_msgSend(v2, "setResumeToken:", 0);
      else
        appended = 1;
    }
  }
  else
  {
    appended = AppendImageData(v1, 5, 0, 5, v2);
  }
  if (!objc_msgSend(v2, "resumeToken")
    && objc_msgSend((id)objc_msgSend(v2, "query"), "requestedHasImageData"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __AppendHasImageData_block_invoke;
    v12[3] = &unk_1E3CA46A0;
    v12[4] = v2;
    if ((objc_msgSend(v2, "hasFoundAnyImageDataForCurrentContact") & 1) != 0
      || (objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageData") & 1) == 0
      && (objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageCropRect") & 1) == 0
      && __AppendHasImageData_block_invoke((uint64_t)v12, (uint64_t)CFSTR("SELECT COUNT(ROWID) FROM ABFullSizeImage WHERE record_id = ? AND data IS NOT NULL;"),
           v1))
    {
      v5 = 1;
    }
    else
    {
      v5 = (!objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageThumbnail")
         || (objc_msgSend((id)objc_msgSend(v2, "query"), "requestedImageFullscreenData") & 1) == 0)
        && __AppendHasImageData_block_invoke((uint64_t)v12, (uint64_t)CFSTR("SELECT COUNT(ROWID) FROM ABThumbnailImage WHERE record_id = ? AND data IS NOT NULL;"),
             v1);
    }
    v9 = 2;
    v10 = kABCPersonHasImageDataProperty;
    v11 = 4;
    v8 = v5;
    objc_msgSend((id)objc_msgSend(v2, "mutableData"), "appendBytes:length:", &v9, 13);
    v6 = (void *)objc_msgSend(v2, "mutableData");
    objc_msgSend(v6, "appendBytes:length:", &v8, v11);
  }
  return appended;
}

uint64_t __ABAddressBookPersonBufferRowHandler_block_invoke_453(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  void *value;
  char v15;
  int v16;
  uint64_t v17;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_DWORD *)(a1 + 48);
  v4 = objc_msgSend((id)objc_msgSend(v1, "mutableData"), "length");
  if (v4 >= objc_msgSend(v1, "maxBufferSize")
    || objc_msgSend(v1, "maxContactsPerBatch") >= 1
    && (v5 = objc_msgSend(v1, "countOfContactsInBuffer"), v5 >= objc_msgSend(v1, "maxContactsPerBatch")))
  {
    v8 = 1;
    objc_msgSend(v1, "setResumeToken:", 1);
  }
  else
  {
    if (!objc_msgSend(v1, "resumeToken") || objc_msgSend(v1, "resumeToken") == 1)
    {
      objc_msgSend(v1, "setResumeToken:", 0);
      objc_msgSend(v1, "setCountOfContactsInBuffer:", objc_msgSend(v1, "countOfContactsInBuffer") + 1);
      v15 = 1;
      v16 = v3;
      value = 0;
      v6 = (const __CFDictionary *)objc_msgSend((id)objc_msgSend(v1, "query"), "propertyIndices");
      if (CFDictionaryGetValueIfPresent(v6, (const void *)kABPersonInternalUUIDProperty, (const void **)&value))
        v7 = sqlite3_column_bytes(*(sqlite3_stmt **)(v2 + 8), (int)value);
      else
        v7 = 0;
      v17 = v7;
      objc_msgSend((id)objc_msgSend(v1, "mutableData"), "appendBytes:length:", &v15, 13);
      if (v17)
      {
        v9 = (void *)objc_msgSend(v1, "mutableData");
        v10 = sqlite3_column_blob(*(sqlite3_stmt **)(v2 + 8), (int)value);
        objc_msgSend(v9, "appendBytes:length:", v10, v17);
        if (objc_msgSend((id)objc_msgSend(v1, "query"), "contactidentifierAuditMode"))
        {
          v11 = (void *)objc_msgSend(v1, "mutableData");
          v12 = objc_msgSend((id)objc_msgSend(v1, "mutableData"), "length");
          objc_msgSend(v1, "setCurrentRecordIndividualUniqueIDAuditData:", objc_msgSend(v11, "subdataWithRange:", v12 - v17));
          if (objc_msgSend((id)objc_msgSend(v1, "query"), "contactidentifierAuditMode") == 1
            || !objc_msgSend((id)objc_msgSend(v1, "query"), "fetchLinkedContacts")
            || objc_msgSend(v1, "contactLinkUUIDColumn") == -1)
          {
            objc_msgSend((id)objc_msgSend(v1, "contactIdentifiers"), "addObject:", objc_msgSend(v1, "currentRecordIndividualUniqueIDAuditData"));
          }
        }
      }
    }
    return 0;
  }
  return v8;
}

@end
