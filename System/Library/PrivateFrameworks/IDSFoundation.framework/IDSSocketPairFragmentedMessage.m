@implementation IDSSocketPairFragmentedMessage

- (IDSSocketPairFragmentedMessage)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  IDSSocketPairFragmentedMessage *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  unsigned int *v12;
  objc_super v14;

  v4 = a3;
  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSSocketPairFragmentedMessage;
  v7 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v14, sel_initWithCommand_underlyingData_, v4, v6);
  if (v7)
  {
    v8 = objc_retainAutorelease(v6);
    v12 = (unsigned int *)objc_msgSend_bytes(v8, v9, v10, v11);
    v7->_fragmentedMessageID = bswap32(*v12);
    v7->_fragmentIndex = bswap32(v12[1]);
    v7->_totalFragmentCount = bswap32(v12[2]);
    v7->_offset = 12;
  }

  return v7;
}

- (IDSSocketPairFragmentedMessage)initWithData:(id)a3 withFragmentedMessageID:(unsigned int)a4 fragmentIndex:(unsigned int)a5 totalFragmentCount:(unsigned int)a6
{
  id v11;
  IDSSocketPairFragmentedMessage *v12;
  IDSSocketPairFragmentedMessage *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSSocketPairFragmentedMessage;
  v12 = -[IDSSocketPairFragmentedMessage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_fragmentedMessageID = a4;
    v12->_fragmentIndex = a5;
    v12->_totalFragmentCount = a6;
    objc_storeStrong((id *)&v12->_data, a3);
  }

  return v13;
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("fragmentedMessage: ID: %u, index: %u, total: %u"), v2, self->_fragmentedMessageID, self->_fragmentIndex, self->_totalFragmentCount);
}

- (unsigned)command
{
  return 21;
}

- (NSData)data
{
  uint64_t v2;
  double v3;
  NSData *data;
  NSData *v5;
  void *v7;
  unint64_t offset;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;

  data = self->_data;
  if (data)
  {
    v5 = data;
  }
  else
  {
    objc_msgSend_underlyingData(self, a2, v2, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    offset = self->_offset;
    objc_msgSend__existingUnderlyingData(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_length(v12, v13, v14, v15);
    objc_msgSend_subdataWithRangeNoCopy_(v7, v17, offset, v18, v16 - self->_offset);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_nonHeaderData
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v15 = bswap32(self->_fragmentedMessageID);
  objc_msgSend_appendBytes_length_(v3, v4, (uint64_t)&v15, v5, 4);
  v14 = bswap32(self->_fragmentIndex);
  objc_msgSend_appendBytes_length_(v3, v6, (uint64_t)&v14, v7, 4);
  v13 = bswap32(self->_totalFragmentCount);
  objc_msgSend_appendBytes_length_(v3, v8, (uint64_t)&v13, v9, 4);
  objc_msgSend_appendData_(v3, v10, (uint64_t)self->_data, v11);
  return v3;
}

+ (id)createOriginalMessageFromFragmentedMessages:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  unsigned int v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  unsigned int v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  void *v30;
  double v31;
  uint64_t i;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  uint8_t buf[4];
  unsigned int v65;
  __int16 v66;
  unsigned int v67;
  __int16 v68;
  unsigned int v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7 = objc_msgSend_count(v3, v4, v5, v6);
  if (!v7)
  {
    OSLogHandleForIDSCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v65 = 0;
      _os_log_impl(&dword_19B949000, v61, OS_LOG_TYPE_DEFAULT, "createOriginalMessageFromFragmentedMessages: have %u pieces, nothing created", buf, 8u);
    }

    if (!os_log_shim_legacy_logging_enabled())
      goto LABEL_30;
    if (MarcoShouldLog())
      MarcoLog();
    if (!IMShouldLog())
      goto LABEL_30;
LABEL_29:
    IMLogString();
LABEL_30:
    v40 = 0;
    goto LABEL_40;
  }
  v10 = v7;
  objc_msgSend_objectAtIndex_(v3, v8, 0, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_totalFragmentCount(v11, v12, v13, v14);

  if (!v15)
    goto LABEL_16;
  v18 = 0;
  LODWORD(v19) = 0;
  v20 = v15;
  do
  {
    objc_msgSend_objectAtIndex_(v3, v16, v18, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v19 + objc_msgSend_length(v25, v26, v27, v28);

    ++v18;
  }
  while (v15 != v18);
  if (!(_DWORD)v19)
  {
LABEL_16:
    OSLogHandleForIDSCategory();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v65 = v10;
      v66 = 1024;
      v67 = v15;
      _os_log_impl(&dword_19B949000, v60, OS_LOG_TYPE_DEFAULT, "FragmentedMessage: have %u pieces, %u expected, 0 length", buf, 0xEu);
    }

    if (!os_log_shim_legacy_logging_enabled())
      goto LABEL_30;
    if (MarcoShouldLog())
      MarcoLog();
    if (!IMShouldLog())
      goto LABEL_30;
    goto LABEL_29;
  }
  objc_msgSend_dataWithCapacity_(MEMORY[0x1E0C99DF0], v16, v19, v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    for (i = 0; i != v20; ++i)
    {
      objc_msgSend_objectAtIndex_(v3, v29, i, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendData_(v30, v38, (uint64_t)v37, v39);

    }
    objc_msgSend_messageWithData_(IDSSocketPairMessage, v29, (uint64_t)v30, v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    OSLogHandleForIDSCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v65 = objc_msgSend_command(v40, v42, v43, v44);
      v66 = 1024;
      v67 = objc_msgSend_length(v30, v45, v46, v47);
      v68 = 1024;
      v69 = v10;
      _os_log_impl(&dword_19B949000, v41, OS_LOG_TYPE_DEFAULT, "createOriginalMessageFromFragmentedMessages: made cmd %u length %u from %u pieces", buf, 0x14u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        objc_msgSend_command(v40, v48, v49, v50);
        objc_msgSend_length(v30, v51, v52, v53);
        MarcoLog();
      }
      if (IMShouldLog())
      {
        objc_msgSend_command(v40, v54, v55, v56);
        objc_msgSend_length(v30, v57, v58, v59);
        IMLogString();
      }
    }
  }
  else
  {
    OSLogHandleForIDSCategory();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v65 = v19;
      v66 = 1024;
      v67 = v10;
      v68 = 1024;
      v69 = v15;
      _os_log_impl(&dword_19B949000, v62, OS_LOG_TYPE_DEFAULT, "FragmentedMessage: can't create NSMutableData of %u length (have %u pieces, %u expected)", buf, 0x14u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
        MarcoLog();
      if (IMShouldLog())
        IMLogString();
    }
    v40 = 0;
  }

LABEL_40:
  return v40;
}

+ (id)createMessageFragmentsFromOriginalMessage:(id)a3 withFragmentedMessageID:(unsigned int)a4 fragmentSize:(unsigned int)a5
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  double v19;
  const char *v20;
  void *v21;
  double v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  IDSSocketPairFragmentedMessage *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  IDSSocketPairFragmentedMessage *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  NSObject *v40;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  id v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;
  uint64_t v53;

  v5 = *(_QWORD *)&a4;
  v53 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v9 = a5 - objc_msgSend_headerDataSize(IDSSocketPairMessage, v6, v7, v8) - 12;
  v13 = objc_msgSend_length(v46, v10, v11, v12);
  v14 = v13 / v9;
  v15 = v13 % v9;
  if ((_DWORD)v15)
    v16 = v14 + 1;
  else
    v16 = v14;
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v43 = v14 + 1;
  v21 = (void *)objc_msgSend_initWithCapacity_(v17, v18, v43, v19);
  v44 = v13;
  if (v9 > v13)
  {
    v23 = 0;
    if (!(_DWORD)v15)
      goto LABEL_13;
LABEL_12:
    objc_msgSend_subdataWithRangeNoCopy_(v46, v20, (v23 * v9), v22, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = [IDSSocketPairFragmentedMessage alloc];
    v37 = (void *)objc_msgSend_initWithData_withFragmentedMessageID_fragmentIndex_totalFragmentCount_(v34, v35, (uint64_t)v33, v36, v5, v23, v43);
    objc_msgSend_addObject_(v21, v38, (uint64_t)v37, v39);

    goto LABEL_13;
  }
  v42 = v13 % v9;
  v24 = 0;
  v25 = 0;
  if (v14 <= 1)
    v23 = 1;
  else
    v23 = v14;
  do
  {
    objc_msgSend_subdataWithRangeNoCopy_(v46, v20, v24, v22, v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = [IDSSocketPairFragmentedMessage alloc];
    v30 = (void *)objc_msgSend_initWithData_withFragmentedMessageID_fragmentIndex_totalFragmentCount_(v27, v28, (uint64_t)v26, v29, v5, v25, v16);
    objc_msgSend_addObject_(v21, v31, (uint64_t)v30, v32);

    ++v25;
    v24 += v9;
  }
  while (v23 != v25);
  v15 = v42;
  if ((_DWORD)v42)
    goto LABEL_12;
LABEL_13:
  OSLogHandleForIDSCategory();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v48 = v16;
    v49 = 1024;
    v50 = v44;
    v51 = 1024;
    v52 = a5;
    _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "createMessageFragmentsFromOriginalMessage: made %u pieces from %u length at %u per fragment", buf, 0x14u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
      MarcoLog();
    if (IMShouldLog())
      IMLogString();
  }

  return v21;
}

- (unsigned)fragmentedMessageID
{
  return self->_fragmentedMessageID;
}

- (unsigned)fragmentIndex
{
  return self->_fragmentIndex;
}

- (unsigned)totalFragmentCount
{
  return self->_totalFragmentCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
