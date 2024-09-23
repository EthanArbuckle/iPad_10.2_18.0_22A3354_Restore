@implementation ABBufferQueryCursor

- (void)fetchNextBatchWithReply:(id)a3
{
  CPSqliteStatement *v5;
  sqlite3_stmt **v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSIndexSet *v10;
  const void *v11;
  int v12;
  NSMutableData *v13;
  NSMutableData *v14;
  NSUInteger v15;
  NSData *v16;
  NSMutableSet *v17;
  NSData *v18;
  NSMutableSet *v19;
  NSIndexSet *v20;
  NSMutableData *v21;
  uint64_t v22;
  ABPropertyType TypeOfProperty;
  uint64_t v24;
  int v25;
  const void *v26;
  int v27;
  ABPropertyType v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t (**v34)(id, _QWORD);
  uint64_t v35;
  uint64_t v36;
  NSMutableDictionary *v37;
  NSObject *v38;
  NSMutableData *mutableData;
  uint64_t v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  int v45;
  int v46;
  ABPropertyType v47;
  _QWORD v48[5];
  int v49;
  _QWORD v50[2];
  uint64_t (*v51)(uint64_t, uint64_t);
  void *v52;
  ABBufferQueryCursor *v53;
  id v54;
  char v55;
  _BYTE v56[20];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE buf[24];
  void *v62;
  ABBufferQueryCursor *v63;
  sqlite3_stmt **v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = -[ABBufferQuery statement](self->_query, "statement");
  if (v5)
  {
    v6 = (sqlite3_stmt **)v5;
    if (v5->var1)
    {
      if (v5->var0 && v5->var0->var1)
      {
        v7 = MEMORY[0x1E0C809B0];
        v45 = kABPersonWatchWallpaperImageDataProperty;
        v46 = kABPersonWallpaperProperty;
        v44 = kABPersonWallpaperMetadataProperty;
        while (1)
        {
          do
          {
            if (!-[ABBufferQueryCursor resumeToken](self, "resumeToken"))
            {
              v8 = sqlite3_step(v6[1]);
              if (v8 != 100)
              {
                if (v8 == 101)
                {
                  v41 = objc_alloc_init(MEMORY[0x1E0D13A20]);
                  objc_msgSend(v41, "setData:", self->_mutableData);
                  objc_msgSend(v41, "setMatchInfo:", self->_matchInfo);
                  objc_msgSend(v41, "setIdentifierAccountingData:", self->_contactIdentifiers);
                  (*((void (**)(id, id, uint64_t, _QWORD))a3 + 2))(a3, v41, 1, 0);
                  CPSqliteStatementReset();
                  -[ABBufferQuery setStatement:](self->_query, "setStatement:", 0);

                }
                else
                {
                  v42 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ABSQLiteErrorDomain"), sqlite3_errcode(*((sqlite3 **)*v6 + 1)), 0);
                  v43 = ABOSLogGeneral();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    -[ABBufferQueryCursor fetchNextBatchWithReply:].cold.1((uint64_t)v6, v43);
                  (*((void (**)(id, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, 0, 0, v42);
                }
                goto LABEL_54;
              }
            }
            v50[0] = v7;
            v50[1] = 3221225472;
            v51 = __ABAddressBookPersonBufferRowHandler_block_invoke;
            v52 = &unk_1E3CA4628;
            v53 = self;
            v54 = a3;
          }
          while (!-[ABBufferQuery propertyIndices](-[ABBufferQueryCursor query](self, "query"), "propertyIndices"));
          v9 = sqlite3_column_int(v6[1], 0);
          if (-[ABBufferQueryCursor currentRecordID](self, "currentRecordID") != (_DWORD)v9)
          {
            -[ABBufferQueryCursor setHasFoundAnyImageDataForCurrentContact:](self, "setHasFoundAnyImageDataForCurrentContact:", 0);
            -[ABBufferQueryCursor setCurrentPropertyID:](self, "setCurrentPropertyID:", 0xFFFFFFFFLL);
          }
          if (-[ABBufferQueryCursor currentRecordID](self, "currentRecordID") != (_DWORD)v9
            || -[ABBufferQueryCursor resumeToken](self, "resumeToken"))
          {
            break;
          }
LABEL_38:
          if (!-[NSIndexSet count](-[ABBufferQuery requestedMultivalueIdentifiers](-[ABBufferQueryCursor query](self, "query"), "requestedMultivalueIdentifiers"), "count")|| sqlite3_column_type(v6[1], -[ABBufferQueryCursor multivaluePropertyIDColumn](self, "multivaluePropertyIDColumn")) == 5)
          {
            goto LABEL_50;
          }
          v22 = sqlite3_column_int(v6[1], -[ABBufferQueryCursor multivaluePropertyIDColumn](self, "multivaluePropertyIDColumn"));
          TypeOfProperty = ABPersonGetTypeOfProperty(v22);
          v24 = sqlite3_column_int(v6[1], -[ABBufferQueryCursor multivalueIdentifierColumn](self, "multivalueIdentifierColumn"));
          if (-[ABBufferQueryCursor currentPropertyID](self, "currentPropertyID") == (_DWORD)v22)
          {
            if (-[ABBufferQueryCursor currentMultivalueIdentifier](self, "currentMultivalueIdentifier") == (_DWORD)v24)
              goto LABEL_48;
          }
          else
          {
            -[ABBufferQueryCursor setCurrentPropertyID:](self, "setCurrentPropertyID:", v22);
            v55 = 3;
            *(_DWORD *)v56 = v22;
            -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", &v55, 5);
          }
          v47 = TypeOfProperty;
          -[ABBufferQueryCursor setCurrentMultivalueIdentifier:](self, "setCurrentMultivalueIdentifier:", v24);
          v25 = sqlite3_column_bytes(v6[1], -[ABBufferQueryCursor multivalueUUIDColumn](self, "multivalueUUIDColumn"));
          v26 = sqlite3_column_blob(v6[1], -[ABBufferQueryCursor multivalueUUIDColumn](self, "multivalueUUIDColumn"));
          v27 = sqlite3_column_bytes(v6[1], -[ABBufferQueryCursor multivalueLabelColumn](self, "multivalueLabelColumn"));
          v59 = 0;
          v60 = 0;
          v58 = 0;
          v28 = ABPersonGetTypeOfProperty(-[ABBufferQueryCursor currentPropertyID](self, "currentPropertyID"));
          if (v28 == 261)
          {
            v29 = 0;
            v30 = 0;
          }
          else
          {
            GetBytePointerAndLengthForTypeAtColumn((uint64_t)v6, v28, -[ABBufferQueryCursor multivalueValueColumn](self, "multivalueValueColumn"), &v60, &v59, (double *)&v58);
            v30 = v59;
            v29 = v60;
          }
          v55 = 4;
          *(_DWORD *)v56 = v24;
          *(_QWORD *)&v56[4] = v25;
          *(_QWORD *)&v56[12] = v27;
          v57 = v30;
          -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", &v55, 29);
          -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", v26, v25);
          -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", sqlite3_column_blob(v6[1], -[ABBufferQueryCursor multivalueLabelColumn](self, "multivalueLabelColumn")), v27);
          -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", v29, v30);
          v7 = MEMORY[0x1E0C809B0];
          TypeOfProperty = v47;
LABEL_48:
          if (TypeOfProperty == 261)
          {
            v55 = 5;
            v31 = sqlite3_column_bytes(v6[1], -[ABBufferQueryCursor multivalueEntryKeyColumn](self, "multivalueEntryKeyColumn"));
            v32 = sqlite3_column_bytes(v6[1], -[ABBufferQueryCursor multivalueEntryValueColumn](self, "multivalueEntryValueColumn"));
            *(_QWORD *)v56 = v31;
            v33 = v32;
            *(_QWORD *)&v56[8] = v32;
            -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", &v55, 17);
            -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", sqlite3_column_blob(v6[1], -[ABBufferQueryCursor multivalueEntryKeyColumn](self, "multivalueEntryKeyColumn")), v31);
            -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", sqlite3_column_blob(v6[1], -[ABBufferQueryCursor multivalueEntryValueColumn](self, "multivalueEntryValueColumn")), v33);
          }
LABEL_50:
          v34 = -[ABSQLPredicate matchInfoProvider](-[ABBufferQuery predicate](-[ABBufferQueryCursor query](self, "query"), "predicate"), "matchInfoProvider");
          if (v34)
          {
            v35 = v34[2](v34, v9);
            if (v35)
            {
              v36 = v35;
              v37 = -[ABBufferQueryCursor matchInfo](self, "matchInfo");
              -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:", v36, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9));
            }
          }
        }
        -[ABBufferQueryCursor setCurrentRecordID:](self, "setCurrentRecordID:", v9);
        *(_QWORD *)buf = v7;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __ABAddressBookPersonBufferRowHandler_block_invoke_453;
        v62 = &unk_1E3CA4650;
        v63 = self;
        v64 = v6;
        v65 = v9;
        if ((__ABAddressBookPersonBufferRowHandler_block_invoke((uint64_t)v50, (uint64_t)buf) & 1) != 0)
          return;
        AppendBaseProperties((uint64_t)v6, self);
        if (-[ABBufferQueryCursor resumeToken](self, "resumeToken"))
        {
LABEL_30:
          if (!-[ABBufferQueryCursor resumeToken](self, "resumeToken"))
          {
            if (-[ABBufferQuery requestedWallpaperData](-[ABBufferQueryCursor query](self, "query"), "requestedWallpaperData"))
            {
              AppendPropertyBlobData(v9, v46, self);
            }
            if (-[ABBufferQuery requestedWatchWallpaperImageData](-[ABBufferQueryCursor query](self, "query"), "requestedWatchWallpaperImageData"))
            {
              AppendPropertyBlobData(v9, v45, self);
            }
            if (-[ABBufferQuery requestedWallpaperMetadata](-[ABBufferQueryCursor query](self, "query"), "requestedWallpaperMetadata"))
            {
              AppendPropertyBlobData(v9, v44, self);
            }
          }
          v48[0] = v7;
          v48[1] = 3221225472;
          v48[2] = __ABAddressBookPersonBufferRowHandler_block_invoke_2;
          v48[3] = &unk_1E3CA4678;
          v49 = v9;
          v48[4] = self;
          if ((v51((uint64_t)v50, (uint64_t)v48) & 1) != 0)
            return;
          goto LABEL_38;
        }
        v10 = -[ABBufferQuery requestedPropertyIdentifiers](-[ABBufferQueryCursor query](self, "query"), "requestedPropertyIdentifiers");
        if (!-[NSIndexSet containsIndex:](v10, "containsIndex:", kABCPersonLinkUUIDProperty))
          goto LABEL_27;
        if (sqlite3_column_type(v6[1], -[ABBufferQueryCursor contactLinkUUIDColumn](self, "contactLinkUUIDColumn")) == 5)
          goto LABEL_19;
        v11 = sqlite3_column_blob(v6[1], -[ABBufferQueryCursor contactLinkUUIDColumn](self, "contactLinkUUIDColumn"));
        v12 = sqlite3_column_bytes(v6[1], -[ABBufferQueryCursor contactLinkUUIDColumn](self, "contactLinkUUIDColumn"));
        v55 = 2;
        *(_DWORD *)v56 = kABCPersonLinkUUIDProperty;
        *(_QWORD *)&v56[4] = v12;
        -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", &v55, 13);
        v13 = -[ABBufferQueryCursor mutableData](self, "mutableData");
        -[NSMutableData appendBytes:length:](v13, "appendBytes:length:", v11, *(_QWORD *)&v56[4]);
        if (-[ABBufferQuery contactidentifierAuditMode](-[ABBufferQueryCursor query](self, "query"), "contactidentifierAuditMode") != 2)
        {
LABEL_19:
          v16 = 0;
        }
        else
        {
          v14 = -[ABBufferQueryCursor mutableData](self, "mutableData");
          v15 = -[NSMutableData length](-[ABBufferQueryCursor mutableData](self, "mutableData"), "length");
          v16 = (NSData *)-[NSMutableData subdataWithRange:](v14, "subdataWithRange:", v15 - *(_QWORD *)&v56[4]);
        }
        if (-[ABBufferQuery contactidentifierAuditMode](-[ABBufferQueryCursor query](self, "query"), "contactidentifierAuditMode") != 2)
        {
LABEL_27:
          v20 = -[ABBufferQuery requestedPropertyIdentifiers](-[ABBufferQueryCursor query](self, "query"), "requestedPropertyIdentifiers");
          if (-[NSIndexSet containsIndex:](v20, "containsIndex:", kABCPersonIsPreferredImageProperty)
            && sqlite3_column_type(v6[1], -[ABBufferQueryCursor contactPreferredForImageColumn](self, "contactPreferredForImageColumn")) != 5)
          {
            LODWORD(v60) = sqlite3_column_int(v6[1], -[ABBufferQueryCursor contactPreferredForImageColumn](self, "contactPreferredForImageColumn"));
            v55 = 2;
            *(_DWORD *)v56 = kABCPersonIsPreferredImageProperty;
            *(_QWORD *)&v56[4] = 4;
            -[NSMutableData appendBytes:length:](-[ABBufferQueryCursor mutableData](self, "mutableData"), "appendBytes:length:", &v55, 13);
            v21 = -[ABBufferQueryCursor mutableData](self, "mutableData");
            -[NSMutableData appendBytes:length:](v21, "appendBytes:length:", &v60, *(_QWORD *)&v56[4]);
          }
          goto LABEL_30;
        }
        if (-[NSData length](v16, "length"))
        {
          if (-[NSData isEqualToData:](v16, "isEqualToData:", -[ABBufferQueryCursor currentRecordLinkedUniqueIDAuditData](self, "currentRecordLinkedUniqueIDAuditData")))
          {
LABEL_26:
            -[ABBufferQueryCursor setCurrentRecordLinkedUniqueIDAuditData:](self, "setCurrentRecordLinkedUniqueIDAuditData:", v16);
            goto LABEL_27;
          }
          v17 = -[ABBufferQueryCursor contactIdentifiers](self, "contactIdentifiers");
          v18 = v16;
        }
        else
        {
          v19 = -[ABBufferQueryCursor contactIdentifiers](self, "contactIdentifiers");
          v18 = -[ABBufferQueryCursor currentRecordIndividualUniqueIDAuditData](self, "currentRecordIndividualUniqueIDAuditData");
          v17 = v19;
        }
        -[NSMutableSet addObject:](v17, "addObject:", v18);
        goto LABEL_26;
      }
    }
  }
  (*((void (**)(id, _QWORD, _QWORD, uint64_t))a3 + 2))(a3, 0, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ABSQLiteErrorDomain"), 1, 0));
LABEL_54:
  -[NSMutableSet removeAllObjects](self->_contactIdentifiers, "removeAllObjects");
  v38 = ABOSLogImageMetadata();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    mutableData = self->_mutableData;
    v40 = -[NSMutableData length](mutableData, "length");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = mutableData;
    *(_WORD *)&buf[22] = 2048;
    v62 = (void *)v40;
    _os_log_impl(&dword_19BC4B000, v38, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p) fetchNextBatchWithReply, releasing buffer (%p) [%lu]", buf, 0x20u);
  }

  self->_mutableData = 0;
}

- (NSMutableData)mutableData
{
  return self->_mutableData;
}

- (ABBufferQuery)query
{
  return self->_query;
}

- (int)currentRecordID
{
  return self->_currentRecordID;
}

- (int)multivaluePropertyIDColumn
{
  return self->_multivaluePropertyIDColumn;
}

- (int)currentPropertyID
{
  return self->_currentPropertyID;
}

- (int)multivalueUUIDColumn
{
  return self->_multivalueUUIDColumn;
}

- (int)multivalueLabelColumn
{
  return self->_multivalueLabelColumn;
}

- (int)multivalueIdentifierColumn
{
  return self->_multivalueIdentifierColumn;
}

- (void)setCurrentMultivalueIdentifier:(int)a3
{
  self->_currentMultivalueIdentifier = a3;
}

- (int)multivalueValueColumn
{
  return self->_multivalueValueColumn;
}

- (void)setCurrentPropertyID:(int)a3
{
  self->_currentPropertyID = a3;
}

- (int)currentMultivalueIdentifier
{
  return self->_currentMultivalueIdentifier;
}

- (void)setHasFoundAnyImageDataForCurrentContact:(BOOL)a3
{
  self->_hasFoundAnyImageDataForCurrentContact = a3;
}

- (int64_t)maxContactsPerBatch
{
  return self->_maxContactsPerBatch;
}

- (int64_t)countOfContactsInBuffer
{
  return self->_countOfContactsInBuffer;
}

- (unint64_t)maxBufferSize
{
  return self->_maxBufferSize;
}

- (int64_t)resumeToken
{
  return self->_resumeToken;
}

- (void)setResumeToken:(int64_t)a3
{
  self->_resumeToken = a3;
}

- (void)setCurrentRecordID:(int)a3
{
  self->_currentRecordID = a3;
}

- (void)setCountOfContactsInBuffer:(int64_t)a3
{
  self->_countOfContactsInBuffer = a3;
}

- (int)contactLinkUUIDColumn
{
  return self->_contactLinkUUIDColumn;
}

- (ABBufferQueryCursor)initWithQuery:(id)a3 batchSize:(int64_t)a4
{
  char *v6;
  char *v7;
  int Count;
  int64_t v9;
  const __CFDictionary *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  objc_super v41;
  uint8_t buf[4];
  char *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)ABBufferQueryCursor;
  v6 = -[ABBufferQueryCursor init](&v41, sel_init);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 5) = -1;
    *(_QWORD *)(v6 + 12) = -1;
    Count = CFDictionaryGetCount((CFDictionaryRef)objc_msgSend(a3, "propertyIndices"));
    v9 = 2000;
    if (a4)
      v9 = a4;
    *((_QWORD *)v7 + 18) = 3145728;
    *((_QWORD *)v7 + 19) = v9;
    v10 = (const __CFDictionary *)objc_msgSend(a3, "propertyIndices");
    if (!CFDictionaryGetValueIfPresent(v10, (const void *)kABPersonLinkProperty, (const void **)(v7 + 60)))
      *((_DWORD *)v7 + 15) = -1;
    v11 = (void *)objc_msgSend(a3, "requestedPropertyIdentifiers");
    v12 = objc_msgSend(v11, "containsIndex:", kABCPersonLinkUUIDProperty);
    if (v12)
      v13 = Count + 2;
    else
      v13 = Count + 1;
    if (v12)
      v14 = Count + 1;
    else
      v14 = -1;
    *((_DWORD *)v7 + 13) = v14;
    v15 = (void *)objc_msgSend(a3, "requestedPropertyIdentifiers");
    v16 = objc_msgSend(v15, "containsIndex:", kABCPersonIsPreferredImageProperty);
    v17 = v13 + v16;
    if (v16)
      v18 = v13;
    else
      v18 = -1;
    *((_DWORD *)v7 + 14) = v18;
    v19 = objc_msgSend(a3, "needsMultivalueTable");
    v20 = v17 + v19;
    if (v19)
      v21 = v17;
    else
      v21 = -1;
    *((_DWORD *)v7 + 6) = v21;
    v22 = objc_msgSend(a3, "needsMultivalueTable");
    v23 = v20 + v22;
    if (v22)
      v24 = v20;
    else
      v24 = -1;
    *((_DWORD *)v7 + 7) = v24;
    v25 = objc_msgSend(a3, "needsMultivalueTable");
    v26 = v23 + v25;
    if (v25)
      v27 = v23;
    else
      v27 = -1;
    *((_DWORD *)v7 + 8) = v27;
    v28 = objc_msgSend(a3, "needsMultivalueTable");
    v29 = v26 + v28;
    if (v28)
      v30 = v26;
    else
      v30 = -1;
    *((_DWORD *)v7 + 9) = v30;
    v31 = objc_msgSend(a3, "needsMultivalueTable");
    v32 = v29 + v31;
    if (v31)
      v33 = v29;
    else
      v33 = -1;
    *((_DWORD *)v7 + 10) = v33;
    v34 = objc_msgSend(a3, "needsMultivalueEntryTable");
    v35 = v32 + v34;
    if (v34)
      v36 = v32;
    else
      v36 = -1;
    *((_DWORD *)v7 + 11) = v36;
    if (objc_msgSend(a3, "needsMultivalueEntryTable"))
      v37 = v35;
    else
      v37 = -1;
    *((_DWORD *)v7 + 12) = v37;
    *((_QWORD *)v7 + 21) = a3;
    *((_QWORD *)v7 + 8) = objc_opt_new();
    v38 = ABOSLogImageMetadata();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *((_QWORD *)v7 + 8);
      *(_DWORD *)buf = 134218240;
      v43 = v7;
      v44 = 2048;
      v45 = v39;
      _os_log_impl(&dword_19BC4B000, v38, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p) created buffer (%p)", buf, 0x16u);
    }
    *((_QWORD *)v7 + 9) = objc_opt_new();
    if (objc_msgSend((id)objc_msgSend(a3, "predicate"), "matchInfoProvider"))
      *((_QWORD *)v7 + 10) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return (ABBufferQueryCursor *)v7;
}

- (int)contactPreferredForImageColumn
{
  return self->_contactPreferredForImageColumn;
}

- (int)multivalueEntryValueColumn
{
  return self->_multivalueEntryValueColumn;
}

- (int)multivalueEntryKeyColumn
{
  return self->_multivalueEntryKeyColumn;
}

- (BOOL)hasFoundAnyImageDataForCurrentContact
{
  return self->_hasFoundAnyImageDataForCurrentContact;
}

- (void)setCurrentRecordIndividualUniqueIDAuditData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSData)currentRecordIndividualUniqueIDAuditData
{
  return self->_currentRecordIndividualUniqueIDAuditData;
}

- (NSMutableSet)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)dealloc
{
  sqlite3_blob *incompleteBlob;
  NSObject *v4;
  _BOOL4 v5;
  NSMutableData *mutableData;
  NSUInteger v7;
  objc_super v8;
  uint8_t buf[4];
  ABBufferQueryCursor *v10;
  __int16 v11;
  NSMutableData *v12;
  __int16 v13;
  NSUInteger v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  incompleteBlob = self->_incompleteBlob;
  if (incompleteBlob)
    sqlite3_blob_close(incompleteBlob);
  if (self->_mutableData)
  {
    v4 = ABOSLogImageMetadata();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    mutableData = self->_mutableData;
    if (v5)
    {
      v7 = -[NSMutableData length](self->_mutableData, "length");
      *(_DWORD *)buf = 134218496;
      v10 = self;
      v11 = 2048;
      v12 = mutableData;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_19BC4B000, v4, OS_LOG_TYPE_DEFAULT, "ABBufferQueryCursor (%p) dealloc, releasing buffer (%p) [%lu]", buf, 0x20u);
      mutableData = self->_mutableData;
    }
  }
  else
  {
    mutableData = 0;
  }

  v8.receiver = self;
  v8.super_class = (Class)ABBufferQueryCursor;
  -[ABBufferQueryCursor dealloc](&v8, sel_dealloc);
}

- (ABBufferQueryCursor)initWithAddressBook:(void *)a3 predicate:(id)a4 propertyIdentifierSet:(__CFSet *)a5 includeLinkedContacts:(BOOL)a6 sortOrder:(unsigned int)a7 suggestedContactsPerBatch:(int64_t)a8 managedConfiguration:(id)a9 identifierAuditMode:(int64_t)a10 authorizationContext:(id)a11
{
  ABBufferQuery *v13;
  ABBufferQuery *v14;
  ABBufferQueryCursor *v15;

  v13 = -[ABBufferQuery initWithAddressBook:predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:]([ABBufferQuery alloc], "initWithAddressBook:predicate:requestedProperties:includeLinkedContacts:sortOrder:managedConfiguration:identifierAuditStyle:authorizationContext:", a3, a4, a5, a6, *(_QWORD *)&a7, a9, a10, a11);
  if (v13)
  {
    v14 = v13;
    v15 = -[ABBufferQueryCursor initWithQuery:batchSize:](self, "initWithQuery:batchSize:", v13, a8);

    return v15;
  }
  else
  {

    return 0;
  }
}

- (void)setMutableData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableDictionary)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (sqlite3_blob)incompleteBlob
{
  return self->_incompleteBlob;
}

- (void)setIncompleteBlob:(sqlite3_blob *)a3
{
  self->_incompleteBlob = a3;
}

- (unint64_t)blobBytesWritten
{
  return self->_blobBytesWritten;
}

- (void)setBlobBytesWritten:(unint64_t)a3
{
  self->_blobBytesWritten = a3;
}

- (unint64_t)blobLength
{
  return self->_blobLength;
}

- (void)setBlobLength:(unint64_t)a3
{
  self->_blobLength = a3;
}

- (int64_t)currentMultivalue
{
  return self->_currentMultivalue;
}

- (void)setCurrentMultivalue:(int64_t)a3
{
  self->_currentMultivalue = a3;
}

- (NSData)currentRecordLinkedUniqueIDAuditData
{
  return self->_currentRecordLinkedUniqueIDAuditData;
}

- (void)setCurrentRecordLinkedUniqueIDAuditData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (void)setMaxBufferSize:(unint64_t)a3
{
  self->_maxBufferSize = a3;
}

- (void)setMaxContactsPerBatch:(int64_t)a3
{
  self->_maxContactsPerBatch = a3;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (void)setMultivaluePropertyIDColumn:(int)a3
{
  self->_multivaluePropertyIDColumn = a3;
}

- (void)setMultivalueIdentifierColumn:(int)a3
{
  self->_multivalueIdentifierColumn = a3;
}

- (void)setMultivalueUUIDColumn:(int)a3
{
  self->_multivalueUUIDColumn = a3;
}

- (void)setMultivalueValueColumn:(int)a3
{
  self->_multivalueValueColumn = a3;
}

- (void)setMultivalueLabelColumn:(int)a3
{
  self->_multivalueLabelColumn = a3;
}

- (void)setMultivalueEntryKeyColumn:(int)a3
{
  self->_multivalueEntryKeyColumn = a3;
}

- (void)setMultivalueEntryValueColumn:(int)a3
{
  self->_multivalueEntryValueColumn = a3;
}

- (void)setContactLinkUUIDColumn:(int)a3
{
  self->_contactLinkUUIDColumn = a3;
}

- (void)setContactPreferredForImageColumn:(int)a3
{
  self->_contactPreferredForImageColumn = a3;
}

- (int)personLinkColumn
{
  return self->_personLinkColumn;
}

- (void)setPersonLinkColumn:(int)a3
{
  self->_personLinkColumn = a3;
}

- (void)fetchNextBatchWithReply:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  const char *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_errmsg(*(sqlite3 **)(*(_QWORD *)a1 + 8));
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_19BC4B000, a2, v4, "Error handling SQL statement in ABAddressBookCopyPersonBufferForQuery: %s", (uint8_t *)&v5);
}

@end
