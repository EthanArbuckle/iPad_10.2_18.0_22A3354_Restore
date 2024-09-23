@implementation IDSSocketPairResourceTransferSender

- (IDSSocketPairResourceTransferSender)initWithResourceAtPath:(id)a3 metadata:(id)a4 sequenceNumber:(unsigned int)a5 streamID:(unsigned __int16)a6 expectsPeerResponse:(BOOL)a7 wantsAppAck:(BOOL)a8 compressPayload:(BOOL)a9 compressed:(BOOL)a10 didWakeHint:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 expiryDate:(id)a14
{
  id v17;
  id v18;
  id v19;
  IDSSocketPairResourceTransferSender *v20;
  NSObject *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  uint64_t v31;
  NSDictionary *resourceAttributes;
  const char *v33;
  uint64_t v34;
  double v35;
  NSDictionary *v36;
  unint64_t v37;
  NSObject *v38;
  unint64_t totalBytes;
  NSObject *v40;
  id v42;
  int v44;
  _BOOL4 v45;
  _BOOL4 v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  unint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v45 = a7;
  v46 = a8;
  v44 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v47 = a4;
  v48 = a12;
  v18 = a13;
  v19 = a14;
  v50.receiver = self;
  v50.super_class = (Class)IDSSocketPairResourceTransferSender;
  v20 = -[IDSSocketPairResourceTransferSender init](&v50, sel_init);
  if (v20)
  {
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138414594;
      v52 = (unint64_t)v17;
      v53 = 2112;
      v54 = v47;
      if (v45)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v55 = 2048;
      if (v46)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v56 = a5;
      v57 = 1024;
      if (a10)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v58 = v44;
      v59 = 2112;
      v60 = v22;
      v61 = 2112;
      v62 = v23;
      v63 = 2112;
      v64 = v24;
      v65 = 2112;
      v66 = v48;
      v67 = 2112;
      v68 = v18;
      v69 = 2112;
      v70 = v19;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: created with path %@  metadata %@ sequenceNumber %lu streamID %u expectsPeerResponse %@ wantsAppAck %@ compressed %@ peerResponseIdentifier %@ messageUUID %@ expiryDate %@", buf, 0x62u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    objc_storeStrong((id *)&v20->_resourcePath, a3);
    objc_storeStrong((id *)&v20->_metadata, a4);
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend_attributesOfItemAtPath_error_(v28, v29, (uint64_t)v17, v30, &v49);
    v31 = objc_claimAutoreleasedReturnValue();
    v42 = v49;
    resourceAttributes = v20->_resourceAttributes;
    v20->_resourceAttributes = (NSDictionary *)v31;

    v36 = v20->_resourceAttributes;
    if (v36)
    {
      v37 = objc_msgSend_fileSize(v36, v33, v34, v35);
      v20->_totalBytes = v37;
      if (!v37)
        goto LABEL_35;
      if (!HIBYTE(v37))
      {
LABEL_36:
        v20->_sequenceNumber = a5;
        v20->_streamID = v44;
        v20->_expectsPeerResponse = v45;
        v20->_wantsAppAck = v46;
        v20->_compressPayload = a9;
        v20->_compressed = a10;
        v20->_didWakeHint = a11;
        objc_storeStrong((id *)&v20->_peerResponseIdentifier, a12);
        objc_storeStrong((id *)&v20->_messageUUID, a13);
        v20->_maxChunkSize = 4000;
        v20->_fileDescriptor = -1;
        objc_storeStrong((id *)&v20->_expiryDate, a14);

        goto LABEL_37;
      }
      OSLogHandleForIDSCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        totalBytes = v20->_totalBytes;
        *(_DWORD *)buf = 134217984;
        v52 = totalBytes;
        _os_log_impl(&dword_19B949000, v38, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: file too big %llu", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_35;
      if (MarcoShouldLog())
        MarcoLog();
      if (!IMShouldLog())
      {
LABEL_35:
        v20->_done = 1;
        goto LABEL_36;
      }
    }
    else
    {
      OSLogHandleForIDSCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = (unint64_t)v42;
        _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to read file attributes %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_35;
      if (MarcoShouldLog())
        MarcoLog();
      if (!IMShouldLog())
        goto LABEL_35;
    }
    IMLogString();
    goto LABEL_35;
  }
LABEL_37:

  return v20;
}

- (id)description
{
  double v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = CFSTR("YES");
  if (self->_resourceAttributes)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_metadata)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (!self->_sentFirstMessage)
    v3 = CFSTR("NO");
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("IDSSocketPairResourceTransferSender: path: %@  attributes: %@  metadata: %@  sentFirstMessage: %@  nextbyte: %llu  totalbytes: %llu  messageUUID: %@  filedescriptor: %d expiryDate: %@"), v2, self->_resourcePath, v4, v5, v3, self->_nextByte, self->_totalBytes, self->_messageUUID, self->_fileDescriptor, self->_expiryDate);
}

- (unsigned)command
{
  return 53;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *resourcePath;
  NSDictionary *resourceAttributes;
  int fileDescriptor;
  NSString *messageUUID;
  int v8;
  NSString *v9;
  NSDictionary *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v13;
  uint8_t buf[4];
  NSString *v15;
  __int16 v16;
  NSDictionary *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    resourcePath = self->_resourcePath;
    resourceAttributes = self->_resourceAttributes;
    fileDescriptor = self->_fileDescriptor;
    messageUUID = self->_messageUUID;
    *(_DWORD *)buf = 138413058;
    v15 = resourcePath;
    v16 = 2112;
    v17 = resourceAttributes;
    v18 = 1024;
    v19 = fileDescriptor;
    v20 = 2112;
    v21 = messageUUID;
    _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: done with %@ attributes %@ fd %d messageUUID %@", buf, 0x26u);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0)
  {
    if (MarcoShouldLog())
    {
      v11 = self->_fileDescriptor;
      v12 = self->_messageUUID;
      v9 = self->_resourcePath;
      v10 = self->_resourceAttributes;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v11 = self->_fileDescriptor;
      v12 = self->_messageUUID;
      v9 = self->_resourcePath;
      v10 = self->_resourceAttributes;
      IMLogString();
    }
  }
  v8 = self->_fileDescriptor;
  if (v8 != -1)
    close(v8);
  v13.receiver = self;
  v13.super_class = (Class)IDSSocketPairResourceTransferSender;
  -[IDSSocketPairResourceTransferSender dealloc](&v13, sel_dealloc, v9, v10, v11, v12);
}

- (void)closeFileAndMarkDone
{
  close(self->_fileDescriptor);
  self->_fileDescriptor = -1;
  self->_done = 1;
}

- (BOOL)readNextBytes:(id *)a3 byteOffset:(unint64_t *)a4
{
  NSObject *v4;
  int v5;
  unint64_t nextByte;
  unint64_t totalBytes;
  BOOL v9;
  unint64_t v10;
  size_t maxChunkSize;
  size_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  ssize_t v18;
  const char *v19;
  double v20;
  ssize_t v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  NSString *resourcePath;
  const char *v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  int v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  unint64_t v45;
  NSString *v46;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  NSString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (self->_done)
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v4, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: already done reading", buf, 2u);
    }

    v5 = os_log_shim_legacy_logging_enabled();
    if (v5)
    {
      if (MarcoShouldLog())
        MarcoLog();
      v5 = IMShouldLog();
      if (v5)
      {
LABEL_8:
        IMLogString();
LABEL_63:
        LOBYTE(v5) = 0;
      }
    }
  }
  else if (self->_fileDescriptor == -1)
  {
    OSLogHandleForIDSCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: file not open", buf, 2u);
    }

    v5 = os_log_shim_legacy_logging_enabled();
    if (v5)
    {
      if (MarcoShouldLog())
        MarcoLog();
      v5 = IMShouldLog();
      if (v5)
        goto LABEL_8;
    }
  }
  else
  {
    nextByte = self->_nextByte;
    totalBytes = self->_totalBytes;
    v9 = totalBytes >= nextByte;
    v10 = totalBytes - nextByte;
    if (v10 == 0 || !v9)
    {
      OSLogHandleForIDSCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: no more bytes to read - should not happen", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      objc_msgSend_closeFileAndMarkDone(self, v32, v33, v34);
      goto LABEL_63;
    }
    if (v10 >= self->_maxChunkSize)
      maxChunkSize = self->_maxChunkSize;
    else
      maxChunkSize = v10;
    if (self->_resumeResourceTransfers)
      v14 = maxChunkSize;
    else
      v14 = maxChunkSize + 8;
    v15 = malloc_type_malloc(v14, 0x87493E0uLL);
    if (!v15)
    {
      OSLogHandleForIDSCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v48 = maxChunkSize + 8;
        _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: malloc failed for %llu", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v45 = maxChunkSize + 8;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v45 = maxChunkSize + 8;
          IMLogString();
        }
      }
      objc_msgSend_closeFileAndMarkDone(self, v36, v37, v38, v45);
      goto LABEL_63;
    }
    v16 = v15;
    v17 = v15;
    if (!self->_resumeResourceTransfers)
    {
      *v15 = bswap64(self->_nextByte);
      v16 = v15 + 1;
    }
    v18 = read(self->_fileDescriptor, v16, maxChunkSize);
    if (v18 <= 0)
    {
      v39 = *__error();
      OSLogHandleForIDSCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = v39;
        _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to read file (errno: %d)", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      free(v17);
      objc_msgSend_closeFileAndMarkDone(self, v41, v42, v43);
      goto LABEL_63;
    }
    v21 = v18;
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v19, (uint64_t)v17, v20, v14, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = self->_nextByte;
    v22 = self->_nextByte + v21;
    self->_nextByte = v22;
    if (v22 == self->_totalBytes)
    {
      OSLogHandleForIDSCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_totalBytes;
        resourcePath = self->_resourcePath;
        *(_DWORD *)buf = 134218242;
        v48 = v24;
        v49 = 2112;
        v50 = resourcePath;
        _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: read all %llu bytes from file %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          v45 = self->_totalBytes;
          v46 = self->_resourcePath;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          v45 = self->_totalBytes;
          v46 = self->_resourcePath;
          IMLogString();
        }
      }
      objc_msgSend_closeFileAndMarkDone(self, v26, v27, v28, v45, v46);
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)readNextBytes
{
  double v2;
  int v3;
  id v4;
  void *v5;
  id v6;
  id v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v3 = objc_msgSend_readNextBytes_byteOffset_(self, a2, (uint64_t)&v8, v2, &v9);
  v4 = v8;
  v5 = v4;
  v6 = 0;
  if (v3)
    v6 = v4;

  return v6;
}

- (id)nextMessage_old
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  NSObject *v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  int fileDescriptor;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  __CFDictionary *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  NSString *v34;
  const char *v35;
  double v36;
  NSDictionary *metadata;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  unint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  unint64_t v55;
  id v56;
  IDSSocketPairResourceTransferMessage *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  NSObject *v74;
  NSString *resourcePath;
  const char *v76;
  uint64_t v77;
  double v78;
  NSString *v79;
  uint8_t buf[4];
  NSString *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!self->_sentFirstMessage)
  {
    fileDescriptor = self->_fileDescriptor;
    if (fileDescriptor != -1)
      close(fileDescriptor);
    v15 = (const char *)objc_msgSend_fileSystemRepresentation(self->_resourcePath, a2, v2, v3);
    v16 = open(v15, 0);
    self->_fileDescriptor = v16;
    if (v16 == -1)
    {
      v28 = *__error();
      OSLogHandleForIDSCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v81) = v28;
        _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to open file for read (errno %d)", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      IDSAssertNonFatalErrnoWithSource(v28, "IDSSocketPairResourceTransferSender open() failed", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2464, v30);
      objc_msgSend_closeFileAndMarkDone(self, v31, v32, v33);
      return 0;
    }
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19);
    v22 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (self->_totalBytes)
    {
      objc_msgSend_readNextBytes(self, v20, v21, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        objc_msgSend_closeFileAndMarkDone(self, v24, v25, v27);
        goto LABEL_53;
      }
    }
    else
    {
      v26 = 0;
    }
    v34 = self->_resourcePath;
    if (v34)
    {
      CFDictionarySetValue(v22, CFSTR("ids-message-resource-transfer-url"), v34);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF72EC();
    }

    metadata = self->_metadata;
    if (metadata)
      CFDictionarySetValue(v22, CFSTR("ids-message-resource-transfer-metadata"), metadata);
    if (v26)
      CFDictionarySetValue(v22, CFSTR("ids-message-resource-transfer-data"), v26);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v35, self->_totalBytes, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      CFDictionarySetValue(v22, CFSTR("ids-message-resource-transfer-total-bytes"), v38);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF726C();
    }

    v39 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_timeIntervalSinceReferenceDate(self->_expiryDate, v40, v41, v42);
    objc_msgSend_numberWithDouble_(v39, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
      CFDictionarySetValue(v22, CFSTR("ids-message-resource-transfer-expiry-date"), v46);

    JWEncodeDictionary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self->_sentFirstMessage = 1;

      goto LABEL_42;
    }
    OSLogHandleForIDSCategory();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      resourcePath = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v81 = resourcePath;
      _os_log_impl(&dword_19B949000, v74, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create first message from %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v79 = self->_resourcePath;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v79 = self->_resourcePath;
        IMLogString();
      }
    }
    objc_msgSend_closeFileAndMarkDone(self, v76, v77, v78, v79);

LABEL_53:
    return 0;
  }
  objc_msgSend_readNextBytes(self, a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v81 = v10;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create data message from %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v79 = self->_resourcePath;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v79 = self->_resourcePath;
        IMLogString();
      }
    }
    objc_msgSend_closeFileAndMarkDone(self, v11, v12, v13, v79);
    return 0;
  }
LABEL_42:
  v47 = (void *)objc_msgSend__CUTCopyGzippedData(v7, v5, v6, v8);
  v51 = objc_msgSend_length(v47, v48, v49, v50);
  v55 = objc_msgSend_length(v7, v52, v53, v54);
  if (v51 < v55)
  {
    v56 = v47;

    v7 = v56;
  }
  v57 = [IDSSocketPairResourceTransferMessage alloc];
  v60 = (void *)objc_msgSend_initWithSequenceNumber_streamID_expectsPeerResponse_wantsAppAck_compressed_didWakeHint_peerResponseIdentifier_messageUUID_data_expiryDate_(v57, v58, self->_sequenceNumber, v59, self->_streamID, self->_expectsPeerResponse, self->_wantsAppAck, v51 < v55, self->_didWakeHint, self->_peerResponseIdentifier, self->_messageUUID, v7, 0);
  objc_msgSend_topic(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTopic_(v60, v65, (uint64_t)v64, v66);

  objc_msgSend_context(self, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContext_(v60, v71, (uint64_t)v70, v72);

  return v60;
}

- (id)nextMessage
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  double v8;
  char v9;
  const char *v10;
  id v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  int fileDescriptor;
  const char *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  void *v24;
  double v25;
  int v26;
  const char *v27;
  uint64_t v28;
  id v29;
  double v30;
  NSObject *v31;
  NSString *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  NSObject *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  NSString *v42;
  const char *v43;
  double v44;
  NSDictionary *metadata;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  unint64_t v61;
  const char *v62;
  uint64_t v63;
  double v64;
  unint64_t v65;
  BOOL v66;
  _BOOL8 v67;
  id v68;
  IDSSocketPairResourceTransferMessage *v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  const char *v85;
  double v86;
  const char *v87;
  uint64_t v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  NSObject *v93;
  NSString *resourcePath;
  NSString *v95;
  id v96;
  id v97;
  uint64_t v98;
  uint8_t buf[4];
  NSString *v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (!self->_resumeResourceTransfers)
  {
    objc_msgSend_nextMessage_old(self, a2, v2, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_data(MEMORY[0x1E0C99DF0], a2, v2, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_sentFirstMessage)
  {
    fileDescriptor = self->_fileDescriptor;
    if (fileDescriptor != -1)
      close(fileDescriptor);
    v18 = (const char *)objc_msgSend_fileSystemRepresentation(self->_resourcePath, v5, v6, v8);
    v19 = open(v18, 0);
    self->_fileDescriptor = v19;
    if (v19 == -1)
    {
      v36 = *__error();
      OSLogHandleForIDSCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v100) = v36;
        _os_log_impl(&dword_19B949000, v37, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: unable to open file for read (errno %d)", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
          MarcoLog();
        if (IMShouldLog())
          IMLogString();
      }
      IDSAssertNonFatalErrnoWithSource(v36, "IDSSocketPairResourceTransferSender open() failed", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IdentityServices/IDSFoundation/IDSSocketPairMessage.m", 2554, v38);
      objc_msgSend_closeFileAndMarkDone(self, v39, v40, v41);
      goto LABEL_59;
    }
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0;
    if (self->_totalBytes)
    {
      v97 = 0;
      v26 = objc_msgSend_readNextBytes_byteOffset_(self, v23, (uint64_t)&v97, v25, &v98);
      v29 = v97;
      if (!v26)
      {
LABEL_58:
        objc_msgSend_closeFileAndMarkDone(self, v27, v28, v30, v95);

        goto LABEL_59;
      }
    }
    else
    {
      v29 = 0;
    }
    v42 = self->_resourcePath;
    if (v42)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, CFSTR("ids-message-resource-transfer-url"), v42);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF72EC();
    }

    metadata = self->_metadata;
    if (metadata)
      CFDictionarySetValue((CFMutableDictionaryRef)v24, CFSTR("ids-message-resource-transfer-metadata"), metadata);
    if (v29)
      CFDictionarySetValue((CFMutableDictionaryRef)v24, CFSTR("ids-message-resource-transfer-data"), v29);
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v43, self->_totalBytes, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, CFSTR("ids-message-resource-transfer-total-bytes"), v46);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF726C();
    }

    v47 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_timeIntervalSinceReferenceDate(self->_expiryDate, v48, v49, v50);
    objc_msgSend_numberWithDouble_(v47, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      CFDictionarySetValue((CFMutableDictionaryRef)v24, CFSTR("ids-message-resource-transfer-expiry-date"), v54);

    JWEncodeDictionary();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      buf[0] = 1;
      objc_msgSend_appendBytes_length_(v7, v55, (uint64_t)buf, v56, 1);
      self->_sentFirstMessage = 1;

      goto LABEL_45;
    }
    OSLogHandleForIDSCategory();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      resourcePath = self->_resourcePath;
      *(_DWORD *)buf = 138412290;
      v100 = resourcePath;
      _os_log_impl(&dword_19B949000, v93, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create first message from %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        v95 = self->_resourcePath;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        v95 = self->_resourcePath;
        IMLogString();
      }
    }
    goto LABEL_58;
  }
  v98 = 0;
  v96 = 0;
  v9 = objc_msgSend_readNextBytes_byteOffset_(self, v5, (uint64_t)&v96, v8, &v98);
  v11 = v96;
  if ((v9 & 1) != 0)
  {
    buf[1] = BYTE6(v98);
    buf[2] = BYTE5(v98);
    buf[3] = BYTE4(v98);
    LOBYTE(v100) = BYTE3(v98);
    BYTE1(v100) = BYTE2(v98);
    BYTE2(v100) = BYTE1(v98);
    BYTE3(v100) = v98;
    buf[0] = 0;
    objc_msgSend_appendBytes_length_(v7, v10, (uint64_t)buf, v12, 8);
LABEL_45:
    if (self->_compressPayload)
    {
      v57 = (void *)objc_msgSend__CUTCopyGzippedData(v11, v13, v14, v15);
      v61 = objc_msgSend_length(v57, v58, v59, v60);
      v65 = objc_msgSend_length(v11, v62, v63, v64);
      v66 = v61 >= v65;
      v67 = v61 < v65;
      if (!v66)
      {
        v68 = v57;

        v11 = v68;
      }

    }
    else
    {
      v67 = 0;
    }
    objc_msgSend_appendData_(v7, v13, (uint64_t)v11, v15);
    v69 = [IDSSocketPairResourceTransferMessage alloc];
    v72 = (void *)objc_msgSend_initWithSequenceNumber_streamID_expectsPeerResponse_wantsAppAck_compressed_didWakeHint_peerResponseIdentifier_messageUUID_data_expiryDate_(v69, v70, self->_sequenceNumber, v71, self->_streamID, self->_expectsPeerResponse, self->_wantsAppAck, v67, self->_didWakeHint, self->_peerResponseIdentifier, self->_messageUUID, v7, 0);
    objc_msgSend_topic(self, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTopic_(v72, v77, (uint64_t)v76, v78);

    objc_msgSend_setStreamID_(v72, v79, self->_streamID, v80);
    v84 = objc_msgSend_useDynamicServiceName(self, v81, v82, v83);
    objc_msgSend_setUseDynamicServiceName_(v72, v85, v84, v86);
    objc_msgSend_context(self, v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContext_(v72, v91, (uint64_t)v90, v92);

    goto LABEL_60;
  }
  OSLogHandleForIDSCategory();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = self->_resourcePath;
    *(_DWORD *)buf = 138412290;
    v100 = v32;
    _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "IDSSocketPairResourceTransferSender: failed to create data message from %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      v95 = self->_resourcePath;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      v95 = self->_resourcePath;
      IMLogString();
    }
  }
  objc_msgSend_closeFileAndMarkDone(self, v33, v34, v35, v95);

LABEL_59:
  v72 = 0;
LABEL_60:

  return v72;
}

- (void)reset
{
  int fileDescriptor;

  self->_sentFirstMessage = 0;
  self->_nextByte = 0;
  self->_done = 0;
  fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
  {
    close(fileDescriptor);
    self->_fileDescriptor = -1;
  }
}

- (BOOL)sentFirstMessage
{
  return self->_sentFirstMessage;
}

- (BOOL)isDone
{
  return self->_done;
}

- (unsigned)maxChunkSize
{
  return self->_maxChunkSize;
}

- (void)setMaxChunkSize:(unsigned int)a3
{
  self->_maxChunkSize = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)messageUUID
{
  return self->_messageUUID;
}

- (BOOL)resumeResourceTransfers
{
  return self->_resumeResourceTransfers;
}

- (void)setResumeResourceTransfers:(BOOL)a3
{
  self->_resumeResourceTransfers = a3;
}

- (unint64_t)nextByte
{
  return self->_nextByte;
}

- (void)setNextByte:(unint64_t)a3
{
  self->_nextByte = a3;
}

- (unint64_t)totalBytes
{
  return self->_totalBytes;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceAttributes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end
