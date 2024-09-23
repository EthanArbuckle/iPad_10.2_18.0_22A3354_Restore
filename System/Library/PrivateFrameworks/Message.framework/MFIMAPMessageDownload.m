@implementation MFIMAPMessageDownload

void ___ef_log_MFIMAPMessageDownload_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MFIMAPMessageDownload");
  v1 = (void *)_ef_log_MFIMAPMessageDownload_log;
  _ef_log_MFIMAPMessageDownload_log = (uint64_t)v0;

}

- (MFIMAPMessageDownload)initWithMessage:(id)a3
{
  id v5;
  MFIMAPMessageDownload *v6;
  MFIMAPMessageDownload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFIMAPMessageDownload;
  v6 = -[MFIMAPDownload initWithUid:](&v9, sel_initWithUid_, objc_msgSend(v5, "uid"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v7->_nextByteToFetch = 0;
  }

  return v7;
}

- (id)message
{
  return self->_message;
}

- (BOOL)allowsPartialDownloads
{
  return *((_BYTE *)self + 64) & 1;
}

- (void)setAllowsPartialDownloads:(BOOL)a3
{
  *((_BYTE *)self + 64) = *((_BYTE *)self + 64) & 0xFE | a3;
}

- (BOOL)partial
{
  return (*((unsigned __int8 *)self + 64) >> 1) & 1;
}

- (id)topLevelPart
{
  MFMimePart *v3;

  -[MFIMAPMessageDownload mf_lock](self, "mf_lock");
  v3 = self->_topLevelPart;
  -[MFIMAPMessageDownload mf_unlock](self, "mf_unlock");
  return v3;
}

- (void)setTopLevelPart:(id)a3
{
  id v5;

  v5 = a3;
  -[MFIMAPMessageDownload mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_topLevelPart, a3);
  -[MFIMAPMessageDownload mf_unlock](self, "mf_unlock");

}

- (id)data
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  CFMutableDictionaryRef Mutable;
  void *v11;
  void *v12;
  uint64_t v13;
  MFMessageWriter *v14;
  _BOOL8 v15;
  uint64_t v16;

  if (!-[MFIMAPMessageDownload isComplete](self, "isComplete"))
    return 0;
  -[MFIMAPMessageDownload mf_lock](self, "mf_lock");
  -[_MFSharedBufferedDataConsumer _reallyDone](self->_textConsumer, "_reallyDone");
  if ((*((_BYTE *)self + 64) & 2) != 0)
  {
    if (self->_receivedHeaders)
    {
      -[MFCollectingDataConsumer data](self->_headerConsumer, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v8, "mutableCopy");

    }
    else
    {
      v6 = 0;
    }
    if (self->_receivedText
      && (-[MFBufferedDataConsumer data](self->_textConsumer, "data"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = (void *)v9;
      if (!v6)
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithBytes:length:", "\n", 1);
      objc_msgSend(v6, "appendData:", v4);
    }
    else
    {
      if (self->_topLevelPart)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v6)
        {
          -[MFMimePart type](self->_topLevelPart, "type");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("multipart")) & 1) != 0)
          {
            -[MFMimePart bodyParameterForKey:](self->_topLevelPart, "bodyParameterForKey:", CFSTR("boundary"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              v13 = objc_msgSend(v6, "length", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
              if (MFMimeDataGetRangeOfHeader(&v16, 0, *MEMORY[0x1E0D1E558], v6, 0, v13))
              {
                objc_msgSend(objc_retainAutorelease(v6), "bytes");
                MFMimePartParseContentTypeHeader();
              }
            }
          }
          else
          {

          }
        }
        else
        {
          v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithBytes:length:", "\n", 1);
        }
        v14 = objc_alloc_init(MFMessageWriter);
        -[MFMessageWriter appendDataForMimePart:toData:withPartData:](v14, "appendDataForMimePart:toData:withPartData:", self->_topLevelPart, v6, Mutable);

      }
      v4 = 0;
    }
    goto LABEL_29;
  }
  if (self->_receivedHeaders)
  {
    -[MFCollectingDataConsumer data](self->_headerConsumer, "data");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      if (self->_receivedText
        && (-[MFBufferedDataConsumer data](self->_textConsumer, "data"),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v6 = (void *)objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v6, "appendData:", v5);

      }
      else
      {
        v6 = 0;
      }
LABEL_29:

      goto LABEL_30;
    }
  }
  v6 = 0;
LABEL_30:
  -[MFIMAPMessageDownload mf_unlock](self, "mf_unlock");
  if (v6)
  {
    v15 = (*((_BYTE *)self + 64) & 2) != 0 && (*((_BYTE *)self + 64) & 0x10) == 0;
    -[MFMessage setMessageData:isPartial:](self->_message, "setMessageData:isPartial:", v6, v15);
  }
  return v6;
}

- (BOOL)isComplete
{
  void *v3;
  void *v4;
  int v5;
  objc_super v7;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "mf_shouldFailDownload") ^ 1;
  else
    LOBYTE(v5) = 1;

  if ((*((_BYTE *)self + 64) & 4) == 0 || (*((_BYTE *)self + 64) & 0x20) == 0)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)MFIMAPMessageDownload;
  return -[MFIMAPCompoundDownload isComplete](&v7, sel_isComplete) & v5;
}

- (BOOL)isSuccessful
{
  _BOOL4 v3;
  MFCollectingDataConsumer *headerConsumer;
  _MFSharedBufferedDataConsumer *textConsumer;
  BOOL v6;

  v3 = -[MFIMAPMessageDownload isComplete](self, "isComplete");
  if (v3)
  {
    headerConsumer = self->_headerConsumer;
    textConsumer = self->_textConsumer;
    if (headerConsumer)
    {
      LOBYTE(v3) = self->_receivedHeaders;
      if (!textConsumer)
        return v3;
      if (self->_receivedHeaders && self->_receivedText)
      {
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    else if (!textConsumer)
    {
      LOBYTE(v3) = 0;
      return v3;
    }
    if (headerConsumer)
      v6 = 1;
    else
      v6 = !self->_receivedText;
    LOBYTE(v3) = !v6;
  }
  return v3;
}

- (void)handleFetchResult:(id)a3
{
  NSMutableArray **p_pendingFetchResults;
  NSMutableArray *pendingFetchResults;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  -[MFIMAPMessageDownload mf_lock](self, "mf_lock");
  if (!self->_topLevelPart && objc_msgSend(v8, "type") == 6)
  {
    p_pendingFetchResults = &self->super.super._pendingFetchResults;
    pendingFetchResults = self->super.super._pendingFetchResults;
    if (!pendingFetchResults)
      goto LABEL_7;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "type") == 12)
  {
    p_pendingFetchResults = &self->super.super._pendingFetchResults;
    pendingFetchResults = self->super.super._pendingFetchResults;
    if (!pendingFetchResults)
    {
LABEL_7:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v7 = *p_pendingFetchResults;
      *p_pendingFetchResults = (NSMutableArray *)v6;

      pendingFetchResults = *p_pendingFetchResults;
    }
LABEL_8:
    -[NSMutableArray addObject:](pendingFetchResults, "addObject:", v8);
  }
  -[MFIMAPMessageDownload mf_unlock](self, "mf_unlock");

}

- (void)processResults
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  MFMailMimePart *topLevelPart;
  char v9;
  MFMessage *v10;
  char v11;
  char *v12;
  char v13;
  char v14;

  -[MFIMAPMessageDownload mf_lock](self, "mf_lock");
  v3 = -[NSMutableArray count](self->super.super._pendingFetchResults, "count");
  if (v3)
  {
    v4 = v3;
    v12 = sel_setRemoteContentLinks_;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->super.super._pendingFetchResults, "objectAtIndex:", 0, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!self->_topLevelPart && objc_msgSend(v5, "type") == 6)
        break;
      if (objc_msgSend(v6, "type") != 12 || (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_23;
      v10 = self->_message;
      objc_msgSend(v6, "appleRemoteLinks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMessage setRemoteContentLinks:](v10, "setRemoteContentLinks:", v7);
LABEL_22:

LABEL_23:
      -[NSMutableArray removeObjectAtIndex:](self->super.super._pendingFetchResults, "removeObjectAtIndex:", 0);
      --v4;

      if (!v4)
        goto LABEL_24;
    }
    objc_msgSend(v6, "bodyStructure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      topLevelPart = objc_alloc_init(MFMailMimePart);
      v9 = -[MFMailMimePart parseIMAPPropertyList:](topLevelPart, "parseIMAPPropertyList:", v7);
      if ((v9 & 1) == 0)
      {
        v10 = 0;
        goto LABEL_14;
      }
      if (topLevelPart)
      {
        v10 = topLevelPart;
        topLevelPart = (MFMailMimePart *)self->_topLevelPart;
        self->_topLevelPart = (MFMimePart *)v10;
LABEL_14:

LABEL_15:
        if (!-[MFMessage isSecurePart](v10, "isSecurePart")
          && -[MFMessage hasSecureSubparts](v10, "hasSecureSubparts"))
        {
          *((_BYTE *)self + 64) &= ~2u;
          *((_BYTE *)self + 64) |= 8u;
        }
        v11 = v9 ^ 1;
        if ((*((_BYTE *)self + 64) & 2) == 0)
          v11 = 1;
        if ((v11 & 1) == 0)
        {
          v14 = -86;
          v13 = -86;
          -[MFMessage getNumberOfAttachments:isSigned:isEncrypted:](v10, "getNumberOfAttachments:isSigned:isEncrypted:", 0, &v14, &v13);
        }
        goto LABEL_22;
      }
    }
    v9 = 0;
    v10 = 0;
    goto LABEL_15;
  }
LABEL_24:
  -[MFIMAPMessageDownload mf_unlock](self, "mf_unlock");
}

- (id)_networkConverterWithConsumer:(id)a3 didReceiveData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A0]), "initWithConsumer:", v5);
  v8 = v7;
  if (v6)
  {
    v9 = objc_alloc(MEMORY[0x1E0D46060]);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __70__MFIMAPMessageDownload__networkConverterWithConsumer_didReceiveData___block_invoke;
    v18 = &unk_1E4E8C298;
    v19 = v6;
    v10 = (void *)objc_msgSend(v9, "initWithAppendHandler:doneHandler:", &v15, 0);
    v11 = (void *)MEMORY[0x1E0D46058];
    v20[0] = v8;
    v20[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filterWithConsumers:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v7;
  }

  return v13;
}

uint64_t __70__MFIMAPMessageDownload__networkConverterWithConsumer_didReceiveData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (void)addCommandsToPipeline:(id)a3 withCache:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  char v9;
  char v10;
  unint64_t nextByteToFetch;
  unint64_t v12;
  unint64_t v13;
  char v14;
  MFCollectingDataConsumer *v15;
  MFCollectingDataConsumer *headerConsumer;
  MFCollectingDataConsumer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  objc_super v23;
  _QWORD v24[5];

  v6 = a3;
  v7 = a4;
  -[MFIMAPMessageDownload mf_lock](self, "mf_lock");
  if ((*((_BYTE *)self + 64) & 4) == 0)
  {
    if ((*((_BYTE *)self + 64) & 1) == 0 && (*((_BYTE *)self + 64) & 0x40) != 0)
    {
LABEL_16:
      v15 = (MFCollectingDataConsumer *)objc_alloc_init(MEMORY[0x1E0D46068]);
      headerConsumer = self->_headerConsumer;
      self->_headerConsumer = v15;

      v17 = self->_headerConsumer;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __57__MFIMAPMessageDownload_addCommandsToPipeline_withCache___block_invoke;
      v24[3] = &unk_1E4E88DC8;
      v24[4] = self;
      -[MFIMAPMessageDownload _networkConverterWithConsumer:didReceiveData:](self, "_networkConverterWithConsumer:didReceiveData:", v17, v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "downloadForUid:section:expectedLength:consumer:", -[MFIMAPDownload uid](self, "uid"), CFSTR("HEADER"), 1024, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPCompoundDownload addSubdownload:](self, "addSubdownload:", v19);

      if ((*((_BYTE *)self + 64) & 2) != 0)
      {
        objc_msgSend(v6, "addFetchCommandForUid:fetchItem:expectedLength:bodyDataConsumer:consumerSection:", -[MFIMAPDownload uid](self, "uid"), CFSTR("BODYSTRUCTURE"), 256, 0, 0);
      }
      else
      {
        -[MFIMAPMessageDownload _addSubdownloadForBodyTextWithCache:](self, "_addSubdownloadForBodyTextWithCache:", v7);
        *((_BYTE *)self + 64) |= 8u;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MFMessage account](self->_message, "account");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessage dateReceived](self->_message, "dateReceived");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "shouldFetchRemoteLinksWithDateReceived:", v21);

        if (v22)
          objc_msgSend(v6, "addFetchCommandForUid:fetchItem:expectedLength:bodyDataConsumer:consumerSection:", -[MFIMAPDownload uid](self, "uid"), CFSTR("X-APPLE-REMOTE-LINKS"), 1024, 0, 0);

      }
      *((_BYTE *)self + 64) |= 4u;

      goto LABEL_24;
    }
    if ((*((_BYTE *)self + 64) & 0x40) != 0)
    {
      v12 = -[MFMessage messageSize](self->_message, "messageSize");
      v13 = objc_msgSend(v6, "chunkSize");
      v8 = (char *)self + 64;
      v9 = *((_BYTE *)self + 64);
      if (v12 < v13)
      {
        v14 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v8 = (char *)self + 64;
      v9 = *((_BYTE *)self + 64);
    }
    v14 = 2;
LABEL_15:
    *v8 = v14 | v9 & 0xFD;
    goto LABEL_16;
  }
  v10 = *((_BYTE *)self + 64);
  if ((v10 & 0x20) == 0)
  {
    if ((*((_BYTE *)self + 64) & 8) != 0)
    {
      nextByteToFetch = self->_nextByteToFetch;
      if (nextByteToFetch < -[MFMessage messageSize](self->_message, "messageSize"))
      {
        -[MFIMAPMessageDownload _addSubdownloadForBodyTextWithCache:](self, "_addSubdownloadForBodyTextWithCache:", v7);
        goto LABEL_24;
      }
      v10 = *((_BYTE *)self + 64);
    }
    *((_BYTE *)self + 64) = v10 | 0x20;
  }
LABEL_24:
  v23.receiver = self;
  v23.super_class = (Class)MFIMAPMessageDownload;
  -[MFIMAPCompoundDownload addCommandsToPipeline:withCache:](&v23, sel_addCommandsToPipeline_withCache_, v6, v7);
  -[MFIMAPMessageDownload mf_unlock](self, "mf_unlock");

}

uint64_t __57__MFIMAPMessageDownload_addCommandsToPipeline_withCache___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 96) = 1;
  return result;
}

- (void)_addSubdownloadForBodyTextWithCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t nextByteToFetch;
  void *v13;
  _MFSharedBufferedDataConsumer *v14;
  _MFSharedBufferedDataConsumer *textConsumer;
  _MFSharedBufferedDataConsumer *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFMessage account](self->_message, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchLimits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fetchMinBytes");

    if (v7)
      v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v8 = 1;
    if (v8)
      v9 = 0x4000;
    else
      v9 = v7;
  }
  else
  {
    v9 = 0x4000;
  }
  if (self->_nextByteToFetch)
  {
    -[MFIMAPMessageDownload _networkConverterWithConsumer:didReceiveData:](self, "_networkConverterWithConsumer:didReceiveData:", self->_textConsumer, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MFMessage messageSize](self->_message, "messageSize");
    nextByteToFetch = self->_nextByteToFetch;
    if (v9 >= v11 - nextByteToFetch)
      v9 = v11 - nextByteToFetch;
    objc_msgSend(v4, "downloadForUid:section:range:consumer:", -[MFIMAPDownload uid](self, "uid"), CFSTR("TEXT"), nextByteToFetch, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFIMAPCompoundDownload addSubdownload:](self, "addSubdownload:", v13);

    self->_nextByteToFetch = v9 + nextByteToFetch;
  }
  else
  {
    v14 = objc_alloc_init(_MFSharedBufferedDataConsumer);
    textConsumer = self->_textConsumer;
    self->_textConsumer = v14;

    v16 = self->_textConsumer;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__MFIMAPMessageDownload__addSubdownloadForBodyTextWithCache___block_invoke;
    v20[3] = &unk_1E4E88DC8;
    v20[4] = self;
    -[MFIMAPMessageDownload _networkConverterWithConsumer:didReceiveData:](self, "_networkConverterWithConsumer:didReceiveData:", v16, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MFMessage messageSize](self->_message, "messageSize");
    if (v17 <= v9)
    {
      objc_msgSend(v4, "downloadForUid:section:expectedLength:consumer:", -[MFIMAPDownload uid](self, "uid"), CFSTR("TEXT"), v17, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPCompoundDownload addSubdownload:](self, "addSubdownload:", v19);

      *((_BYTE *)self + 64) |= 0x20u;
    }
    else
    {
      objc_msgSend(v4, "downloadForUid:section:range:consumer:", -[MFIMAPDownload uid](self, "uid"), CFSTR("TEXT"), self->_nextByteToFetch, v9, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFIMAPCompoundDownload addSubdownload:](self, "addSubdownload:", v18);

      self->_nextByteToFetch = v9;
    }
  }

}

uint64_t __61__MFIMAPMessageDownload__addSubdownloadForBodyTextWithCache___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 97) = 1;
  return result;
}

- (void)setFetchBodyData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 64) = *((_BYTE *)self + 64) & 0xBF | v3;
}

- (BOOL)fetchBodyData
{
  return (*((unsigned __int8 *)self + 64) >> 6) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textConsumer, 0);
  objc_storeStrong((id *)&self->_headerConsumer, 0);
  objc_storeStrong((id *)&self->_topLevelPart, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
