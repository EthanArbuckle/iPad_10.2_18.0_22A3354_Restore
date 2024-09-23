@implementation MFIMAPSimpleDownload

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 lengthIsKnown:(BOOL)a6 range:(_NSRange)a7 consumer:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  id v14;
  id v15;
  MFIMAPSimpleDownload *v16;
  uint64_t v17;
  NSString *section;
  MFCountingDataConsumer *v19;
  MFCountingDataConsumer *countingConsumer;
  id v21;
  void *v22;
  uint64_t v23;
  MFBaseFilterDataConsumer *mainConsumer;
  objc_super v26;
  _QWORD v27[3];

  length = a7.length;
  location = a7.location;
  v12 = *(_QWORD *)&a3;
  v27[2] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MFIMAPSimpleDownload;
  v16 = -[MFIMAPDownload initWithUid:](&v26, sel_initWithUid_, v12);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    section = v16->_section;
    v16->_section = (NSString *)v17;

    v16->_length = a5;
    *((_BYTE *)v16 + 72) = *((_BYTE *)v16 + 72) & 0xFE | a6;
    v16->_range.location = location;
    v16->_range.length = length;
    v19 = (MFCountingDataConsumer *)objc_alloc_init(MEMORY[0x1E0D46078]);
    countingConsumer = v16->super._countingConsumer;
    v16->super._countingConsumer = v19;

    v21 = objc_alloc(MEMORY[0x1E0D46058]);
    v27[0] = v16->super._countingConsumer;
    v27[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithConsumers:", v22);
    mainConsumer = v16->super._mainConsumer;
    v16->super._mainConsumer = (MFBaseFilterDataConsumer *)v23;

  }
  return v16;
}

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 estimatedLength:(unint64_t)a5 consumer:(id)a6
{
  return -[MFIMAPSimpleDownload initWithUid:section:length:lengthIsKnown:range:consumer:](self, "initWithUid:section:length:lengthIsKnown:range:consumer:", *(_QWORD *)&a3, a4, a5, 0, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
}

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 length:(unint64_t)a5 consumer:(id)a6
{
  return -[MFIMAPSimpleDownload initWithUid:section:length:lengthIsKnown:range:consumer:](self, "initWithUid:section:length:lengthIsKnown:range:consumer:", *(_QWORD *)&a3, a4, a5, 1, 0, 0x7FFFFFFFFFFFFFFFLL, a6);
}

- (MFIMAPSimpleDownload)initWithUid:(unsigned int)a3 section:(id)a4 range:(_NSRange)a5 consumer:(id)a6
{
  return -[MFIMAPSimpleDownload initWithUid:section:length:lengthIsKnown:range:consumer:](self, "initWithUid:section:length:lengthIsKnown:range:consumer:", *(_QWORD *)&a3, a4, a5.length, 1, a5.location, a5.length, a6);
}

- (id)section
{
  return self->_section;
}

- (unint64_t)expectedLength
{
  return self->_length;
}

- (unint64_t)bytesFetched
{
  unint64_t v3;

  -[MFIMAPSimpleDownload mf_lock](self, "mf_lock");
  v3 = -[MFCountingDataConsumer count](self->super._countingConsumer, "count");
  -[MFIMAPSimpleDownload mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)handleFetchResult:(id)a3
{
  uint64_t v4;
  NSString *section;
  void *v6;
  uint64_t v7;
  NSComparisonResult v8;
  NSMutableArray *pendingFetchResults;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "type");
  switch(v4)
  {
    case 4:
      v8 = -[NSString caseInsensitiveCompare:](self->_section, "caseInsensitiveCompare:", CFSTR("HEADER"));
      break;
    case 5:
      v8 = -[NSString caseInsensitiveCompare:](self->_section, "caseInsensitiveCompare:", CFSTR("TEXT"));
      break;
    case 7:
      section = self->_section;
      objc_msgSend(v12, "section");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString caseInsensitiveCompare:](section, "caseInsensitiveCompare:", v6);

      if (v7)
        goto LABEL_12;
      goto LABEL_9;
    default:
      goto LABEL_12;
  }
  if (v8)
    goto LABEL_12;
LABEL_9:
  -[MFIMAPSimpleDownload mf_lock](self, "mf_lock");
  pendingFetchResults = self->super._pendingFetchResults;
  if (!pendingFetchResults)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->super._pendingFetchResults;
    self->super._pendingFetchResults = v10;

    pendingFetchResults = self->super._pendingFetchResults;
  }
  -[NSMutableArray addObject:](pendingFetchResults, "addObject:", v12);
  -[MFIMAPSimpleDownload mf_unlock](self, "mf_unlock");
LABEL_12:

}

- (void)processResults
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  char v14;
  BOOL v15;
  NSString *section;
  unint64_t length;
  void *v18;
  __int128 v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[MFIMAPSimpleDownload mf_lock](self, "mf_lock");
  if ((*((_BYTE *)self + 72) & 2) == 0)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[NSMutableArray count](self->super._pendingFetchResults, "count");
    -[NSMutableArray sortUsingFunction:context:](self->super._pendingFetchResults, "sortUsingFunction:context:", _comparePartialFetchResults, 0);
    if (v4)
    {
      *(_QWORD *)&v5 = 138543874;
      v19 = v5;
      while (1)
      {
        if ((*((_BYTE *)self + 72) & 2) != 0)
          goto LABEL_23;
        -[NSMutableArray removeObjectAtIndex:](self->super._pendingFetchResults, "removeObjectAtIndex:", 0);
        v6 = -[MFIMAPSimpleDownload bytesFetched](self, "bytesFetched");
        v7 = v6;
        v8 = *((_BYTE *)self + 72);
        if ((v8 & 2) == 0 && self->_lastBytesFetched == v6)
        {
          *((_BYTE *)self + 72) = v8 | 2;
          +[MFIMAPConnection log](MFIMAPConnection, "log");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            section = self->_section;
            length = self->_length;
            *(_DWORD *)buf = v19;
            v21 = section;
            v22 = 2048;
            v23 = v7;
            v24 = 2048;
            v25 = length;
            _os_log_error_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_ERROR, "Server returned less bytes than expected for part %{public}@ (%lu versus %lu)", buf, 0x20u);
          }

          v8 = *((_BYTE *)self + 72);
        }
        if ((v8 & 2) == 0 && (*((_BYTE *)self + 72) & 1) != 0)
        {
          v15 = v7 >= self->_length;
          *((_BYTE *)self + 72) = v8 & 0xFD | (2 * v15);
          if (!v15)
            goto LABEL_19;
        }
        else
        {
          *((_BYTE *)self + 72) = v8 | 2;
        }
        objc_msgSend(v3, "error", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (!v10)
          break;
        v12 = objc_msgSend(v10, "mf_shouldFailDownload");
        v13 = *((_BYTE *)self + 72);
        if ((v12 & 1) == 0)
          goto LABEL_17;
        v14 = 0;
LABEL_18:
        *((_BYTE *)self + 72) = v13 & 0xFD | v14;

LABEL_19:
        if (!--v4)
          goto LABEL_23;
      }
      v13 = *((_BYTE *)self + 72);
LABEL_17:
      v14 = 2;
      goto LABEL_18;
    }
LABEL_23:
    if ((*((_BYTE *)self + 72) & 2) != 0 && self->_range.length == 0x7FFFFFFFFFFFFFFFLL)
      self->_originalDataLength = -[MFIMAPSimpleDownload bytesFetched](self, "bytesFetched");
    -[MFIMAPDownload mainConsumer](self, "mainConsumer", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "done");

  }
  -[MFIMAPSimpleDownload mf_unlock](self, "mf_unlock");
}

- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t length;
  NSUInteger v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[MFIMAPSimpleDownload mf_lock](self, "mf_lock");
  if ((objc_msgSend(v11, "isFull") & 1) == 0 && !-[MFIMAPSimpleDownload isComplete](self, "isComplete"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6 = -[MFIMAPSimpleDownload bytesFetched](self, "bytesFetched");
    objc_msgSend(v5, "appendString:", CFSTR("BODY.PEEK["));
    if (self->_section)
      objc_msgSend(v5, "appendString:");
    objc_msgSend(v5, "appendString:", CFSTR("]"));
    length = self->_length;
    if ((*((_BYTE *)self + 72) & 1) != 0)
    {
      length -= v6;
      self->_lastBytesFetched = -[MFIMAPSimpleDownload bytesFetched](self, "bytesFetched");
      v8 = length;
      if (v6 || (v8 = self->_range.length, v8 != 0x7FFFFFFFFFFFFFFFLL))
      {
        if (v8)
        {
          objc_msgSend(v5, "appendString:", CFSTR("<"));
          EFStringWithUnsignedInteger();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v9);

          objc_msgSend(v5, "appendString:", CFSTR("."));
          EFStringWithUnsignedInteger();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v10);

          objc_msgSend(v5, "appendString:", CFSTR(">"));
        }
      }
    }
    objc_msgSend(v11, "addFetchCommandForUid:fetchItem:expectedLength:bodyDataConsumer:consumerSection:", self->super._uid, v5, length, self->super._mainConsumer, self->_section);

  }
  -[MFIMAPSimpleDownload mf_unlock](self, "mf_unlock");

}

- (BOOL)isComplete
{
  return (*((unsigned __int8 *)self + 72) >> 1) & 1;
}

- (BOOL)isSuccessful
{
  return (*((_BYTE *)self + 72) & 2) != 0 && self->_error == 0;
}

- (id)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  id v5;

  v5 = a3;
  -[MFIMAPSimpleDownload mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_error, a3);
  -[MFIMAPSimpleDownload mf_unlock](self, "mf_unlock");

}

- (unint64_t)lengthOfDataBeforeLineConversion
{
  return self->_originalDataLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

@end
