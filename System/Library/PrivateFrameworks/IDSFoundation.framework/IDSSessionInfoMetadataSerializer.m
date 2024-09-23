@implementation IDSSessionInfoMetadataSerializer

+ (id)serializeSessionInfoMetadata:(id)a3
{
  id v3;
  __int128 v4;
  const char *v5;
  const char *v6;
  double v7;
  void *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  _OWORD v19[2];
  unint64_t v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x4810000000;
  v18 = &unk_19BB6F9F9;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[0] = v4;
  v19[1] = v4;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  IDSByteBufferInitForWrite((uint64_t)v19);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19BAC94F0;
  v14[3] = &unk_1E3C221B8;
  v14[4] = &v15;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v5, (uint64_t)v14, COERCE_DOUBLE(3221225472));
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, v16[4], v7, (unsigned __int16)(*((_WORD *)v16 + 24) - v16[4]));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = IDSByteBufferRelease((uint64_t)(v16 + 4));
  v12 = (void *)objc_msgSend__CUTCopyGzippedData(v8, v10, v11, v9);

  _Block_object_dispose(&v15, 8);
  return v12;
}

+ (void)_writeStringToByteBuffer:(id)a3 buffer:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  size_t v10;
  unint64_t v11;
  _WORD *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  const char *v18;
  unsigned int v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  v10 = v9 + 2;
  v11 = (v9 + 17) & 0xFFFFFFFFFFFFFFF0;
  v12 = (_WORD *)((char *)v20 - v11);
  if (v9 != -2)
    memset((char *)v20 - v11, 170, v10);
  if (v5
    && (v13 = objc_retainAutorelease(v5), (v17 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16)) != 0))
  {
    v18 = v17;
    v19 = strlen(v17);
    *v12 = bswap32(v19) >> 16;
    if ((_WORD)v19)
      memcpy(v12 + 1, v18, (unsigned __int16)v19);
  }
  else
  {
    *v12 = 0;
  }
  IDSByteBufferWriteField((uint64_t)a4, 1, v12, (unsigned __int16)v10);

}

+ (void)_writeNumberToByteBuffer:(id)a3 buffer:(id *)a4
{
  double v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = bswap64(objc_msgSend_unsignedLongLongValue(a3, a2, (uint64_t)a3, v4));
  IDSByteBufferWriteField((uint64_t)a4, 2, v6, 8uLL);
}

+ (void)_writeDictionaryToByteBuffer:(id)a3 buffer:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  _QWORD v11[6];
  __int16 __src;

  v6 = a3;
  __src = bswap32(objc_msgSend_count(v6, v7, v8, v9)) >> 16;
  IDSByteBufferWriteField((uint64_t)a4, 4, &__src, 2uLL);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19BAC9830;
  v11[3] = &unk_1E3C221D8;
  v11[4] = a1;
  v11[5] = a4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v10, (uint64_t)v11, COERCE_DOUBLE(3221225472));

}

+ (void)_writeArrayToByteBuffer:(id)a3 buffer:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int16 __src;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __src = bswap32(objc_msgSend_count(v6, v7, v8, v9)) >> 16;
  IDSByteBufferWriteField((uint64_t)a4, 3, &__src, 2uLL);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v6;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, v12, v24, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v10);
        objc_msgSend__writeNumberToByteBuffer_buffer_(a1, v14, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v15, a4, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v14, (uint64_t)&v19, v15, v24, 16);
    }
    while (v16);
  }

}

+ (id)deserializeSessionInfoMetadata:(id)a3
{
  id v3;
  __int128 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  unint64_t v20;
  __CFString *v21;
  int isEqualToString;
  const char *v23;
  double v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  const char *v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  id v38;
  const char *v39;
  double v40;
  uint64_t v41;
  id v42;
  const char *v43;
  double v44;
  uint64_t v45;
  id v46;
  NSObject *v48;
  NSObject *v49;
  uint8_t buf[16];
  _OWORD v51[2];
  unint64_t v52;
  unsigned __int16 v53;
  unint64_t *v54;
  char v55;

  v3 = a3;
  v55 = -86;
  v54 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
  v53 = -21846;
  v52 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v51[0] = v4;
  v51[1] = v4;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend__CUTDecompressData(v3, v6, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend_bytes(v9, v10, v11, v12);
  v17 = objc_msgSend_length(v9, v14, v15, v16);
  IDSByteBufferInitForRead((uint64_t)v51, v13, v17);
  if (!IDSByteBufferReadField((uint64_t)v51, &v55, &v54, &v53))
  {
    v21 = &stru_1E3C2E4E8;
LABEL_36:
    IDSByteBufferRelease((uint64_t)v51);
    v46 = v5;
    goto LABEL_37;
  }
  v20 = 0x1E0CB3000uLL;
  v21 = &stru_1E3C2E4E8;
  while (2)
  {
    switch(v55)
    {
      case 1:
        isEqualToString = objc_msgSend_isEqualToString_(v21, v18, (uint64_t)&stru_1E3C2E4E8, v19);
        v25 = v53 - 2;
        if (isEqualToString)
        {
          if (v53 < 2u)
          {

            v21 = 0;
            goto LABEL_19;
          }
          v26 = (uint64_t)v54 + 2;
          v27 = __rev16(*(unsigned __int16 *)v54);
          if ((_DWORD)v27)
            v28 = v25 >= v27;
          else
            v28 = 0;
          if (v28)
          {
            v38 = objc_alloc(MEMORY[0x1E0CB3940]);
            v41 = objc_msgSend_initWithBytes_length_encoding_(v38, v39, v26, v40, v27, 4);

            if (!v41)
            {
              OSLogHandleForTransportCategory();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B949000, v49, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(CFSTR("IDSNetworking"), CFSTR("IDS"), CFSTR("Could not read NSString from byte array"));
                  if (_IDSShouldLog())
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSNetworking"), CFSTR("Could not read NSString from byte array"));
                }
              }
              v21 = 0;
              goto LABEL_52;
            }
            v54 = (unint64_t *)(v26 + v27);
            v53 = v25 - v27;
            v21 = (__CFString *)v41;
          }
          else
          {

            v21 = 0;
          }
          v20 = 0x1E0CB3000;
          goto LABEL_19;
        }
        if (v53 < 2u)
        {
          v37 = 0;
          objc_msgSend_setObject_forKeyedSubscript_(v5, v23, 0, v24, v21);
LABEL_34:

LABEL_18:
          v21 = &stru_1E3C2E4E8;
LABEL_19:
          if (!IDSByteBufferReadField((uint64_t)v51, &v55, &v54, &v53))
            goto LABEL_36;
          continue;
        }
        v34 = (uint64_t)v54 + 2;
        v35 = __rev16(*(unsigned __int16 *)v54);
        if ((_DWORD)v35)
          v36 = v25 >= v35;
        else
          v36 = 0;
        if (!v36)
        {
          v37 = 0;
LABEL_33:
          v20 = 0x1E0CB3000;
          objc_msgSend_setObject_forKeyedSubscript_(v5, v23, (uint64_t)v37, v24, v21);
          goto LABEL_34;
        }
        v42 = objc_alloc(MEMORY[0x1E0CB3940]);
        v45 = objc_msgSend_initWithBytes_length_encoding_(v42, v43, v34, v44, v35, 4);
        if (v45)
        {
          v37 = (void *)v45;
          v54 = (unint64_t *)(v34 + v35);
          v53 = v25 - v35;
          goto LABEL_33;
        }
        OSLogHandleForTransportCategory();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("IDSNetworking"), CFSTR("IDS"), CFSTR("Could not read NSString from byte array"));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSNetworking"), CFSTR("Could not read NSString from byte array"));
          }
        }
LABEL_52:
        v46 = 0;
LABEL_37:

        return v46;
      case 2:
        v32 = bswap64(*v54++);
        objc_msgSend_numberWithUnsignedLongLong_(*(void **)(v20 + 2024), v18, v32, v19);
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3:
        objc_msgSend__readArrayFromByteArray_fieldByteSize_byteBuffer_(IDSSessionInfoMetadataSerializer, v18, (uint64_t)v54, v19, v53, v51);
        v29 = objc_claimAutoreleasedReturnValue();
        if (!v29)
          goto LABEL_38;
        goto LABEL_17;
      case 4:
        objc_msgSend__readDictionaryFromByteArray_fieldByteSize_byteBuffer_(IDSSessionInfoMetadataSerializer, v18, (uint64_t)v54, v19, v53, v51);
        v29 = objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
LABEL_38:
          IDSByteBufferRelease((uint64_t)v51);
          v46 = 0;
          goto LABEL_37;
        }
LABEL_17:
        v33 = (void *)v29;
        objc_msgSend_setObject_forKeyedSubscript_(v5, v30, v29, v31, v21);

        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }
}

+ (id)_readArrayFromByteArray:(char *)a3 fieldByteSize:(unsigned __int16)a4 byteBuffer:(id *)a5
{
  double v5;
  unsigned int v7;
  void *v9;
  id v10;
  unsigned int v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  double v17;
  char v19;
  unsigned __int16 v20;
  char *v21;

  v7 = a4;
  v21 = a3;
  v20 = a4;
  v19 = -86;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 2)
  {
    v20 = v7 - 2;
    v11 = __rev16(*(unsigned __int16 *)a3);
    v21 = a3 + 2;
    if (v11)
    {
      while (1)
      {
        v10 = 0;
        if (!IDSByteBufferReadField((uint64_t)a5, &v19, &v21, &v20) || v20 < 8u)
          break;
        v14 = bswap64(*(_QWORD *)v21);
        v21 += 8;
        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v12, v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v9, v16, (uint64_t)v15, v17);

        if (!--v11)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      v10 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_readDictionaryFromByteArray:(char *)a3 fieldByteSize:(unsigned __int16)a4 byteBuffer:(id *)a5
{
  double v5;
  unsigned int v7;
  void *v9;
  unsigned int v10;
  int v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  const char *v20;
  uint64_t v21;
  double v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 v27;
  id v28;
  const char *v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  unsigned int v34;
  const char *v35;
  double v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  double v40;
  id v41;
  const char *v42;
  double v43;
  uint64_t v44;
  id v45;
  NSObject *v47;
  NSObject *v48;
  uint8_t v49[16];
  uint8_t buf[5];
  char v51;
  unsigned __int16 v52;
  char *v53;

  v7 = a4;
  v53 = a3;
  v52 = a4;
  v51 = -86;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 2)
    goto LABEL_39;
  v52 = v7 - 2;
  v10 = __rev16(*(unsigned __int16 *)a3);
  v53 = a3 + 2;
  if (!v10)
  {
LABEL_36:
    v45 = v9;
    goto LABEL_40;
  }
  v11 = 0;
  while (1)
  {
    if (!IDSByteBufferReadField((uint64_t)a5, &v51, &v53, &v52))
      goto LABEL_39;
    if (v51 == 1)
      break;
    if (v51 != 2)
      goto LABEL_14;
    if (v52 < 8u)
    {
      v15 = 0;
      goto LABEL_38;
    }
    v52 -= 8;
    v14 = bswap64(*(_QWORD *)v53);
    v53 += 8;
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v12, v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    if (!IDSByteBufferReadField((uint64_t)a5, &v51, &v53, &v52))
      goto LABEL_38;
    if (v51 == 3)
    {
      if (v52 < 2u)
        goto LABEL_38;
      v52 -= 2;
      v34 = __rev16(*(unsigned __int16 *)v53);
      v53 += 2;
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        while (IDSByteBufferReadField((uint64_t)a5, &v51, &v53, &v52) && v52 >= 8u)
        {
          v37 = bswap64(*(_QWORD *)v53);
          v53 += 8;
          objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v35, v37, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v24, v39, (uint64_t)v38, v40);

          if (!--v34)
            goto LABEL_29;
        }

        goto LABEL_38;
      }
      goto LABEL_29;
    }
    if (v51 == 1 && (v23 = v52 - 2, v52 >= 2u))
    {
      v24 = 0;
      v25 = (uint64_t)(v53 + 2);
      v26 = __rev16(*(unsigned __int16 *)v53);
      if ((_DWORD)v26)
      {
        v27 = v23 - v26;
        if (v23 >= v26)
        {
          v28 = objc_alloc(MEMORY[0x1E0CB3940]);
          v31 = objc_msgSend_initWithBytes_length_encoding_(v28, v29, v25, v30, v26, 4);
          if (v31)
          {
            v24 = (void *)v31;
            v53 = (char *)(v25 + v26);
            v52 = v27;
LABEL_29:
            if (v15 && v24)
              objc_msgSend_setObject_forKeyedSubscript_(v9, v32, (uint64_t)v24, v33, v15);
            goto LABEL_32;
          }
          OSLogHandleForTransportCategory();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v49 = 0;
            _os_log_impl(&dword_19B949000, v48, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", v49, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("IDSNetworking"), CFSTR("IDS"), CFSTR("Could not read NSString from byte array"));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSNetworking"), CFSTR("Could not read NSString from byte array"));
            }
          }
LABEL_38:

          goto LABEL_39;
        }
      }
    }
    else
    {
      v24 = 0;
    }
LABEL_32:

    if (++v11 == v10)
      goto LABEL_36;
  }
  v16 = v52 - 2;
  if (v52 < 2u
    || ((v17 = (uint64_t)(v53 + 2), v18 = __rev16(*(unsigned __int16 *)v53), (_DWORD)v18)
      ? (v19 = v16 >= v18)
      : (v19 = 0),
        !v19))
  {
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  v41 = objc_alloc(MEMORY[0x1E0CB3940]);
  v44 = objc_msgSend_initWithBytes_length_encoding_(v41, v42, v17, v43, v18, 4);
  if (v44)
  {
    v15 = (void *)v44;
    v53 = (char *)(v17 + v18);
    v52 = v16 - v18;
    goto LABEL_15;
  }
  OSLogHandleForTransportCategory();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v47, OS_LOG_TYPE_DEFAULT, "Could not read NSString from byte array", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("IDSNetworking"), CFSTR("IDS"), CFSTR("Could not read NSString from byte array"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSNetworking"), CFSTR("Could not read NSString from byte array"));
    }
  }
LABEL_39:
  v45 = 0;
LABEL_40:

  return v45;
}

@end
