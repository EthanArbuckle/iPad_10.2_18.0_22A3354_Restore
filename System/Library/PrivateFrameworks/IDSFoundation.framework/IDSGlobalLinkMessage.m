@implementation IDSGlobalLinkMessage

- (IDSGlobalLinkMessage)initWithCommand:(int64_t)a3
{
  IDSGlobalLinkMessage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSGlobalLinkMessage;
  result = -[IDSGlobalLinkMessage init](&v5, sel_init);
  if (result)
    result->_command = a3;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IDSGlobalLinkMessage;
  -[IDSGlobalLinkMessage dealloc](&v2, sel_dealloc);
}

+ (id)messageWithCommand:(int64_t)a3 attributes:(id)a4
{
  id v5;
  IDSGlobalLinkMessage *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;

  v5 = a4;
  v6 = [IDSGlobalLinkMessage alloc];
  v9 = (void *)objc_msgSend_initWithCommand_(v6, v7, a3, v8);
  objc_msgSend_setAttributes_(v9, v10, (uint64_t)v5, v11);

  return v9;
}

+ (id)messageWithBuffer:(char *)a3 length:(int)a4
{
  uint64_t v4;
  IDSGlobalLinkMessage *v6;
  const char *v7;
  double v8;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(IDSGlobalLinkMessage);
  objc_msgSend_read_inputLength_(v6, v7, (uint64_t)a3, v8, v4);
  return v6;
}

- (BOOL)_addAttribute:(IDSGlobalLinkAttribute *)a3
{
  int *p_numAttribute;
  int numAttribute;
  NSObject *v5;
  int v6;
  int v7;
  __CFString *v8;
  NSObject *v9;
  int v10;
  uint8_t v12[16];
  uint8_t buf[16];

  if (a3)
  {
    p_numAttribute = &self->_numAttribute;
    numAttribute = self->_numAttribute;
    if (numAttribute != 20)
    {
      memcpy(&self->_attributes[numAttribute], a3, sizeof(self->_attributes[numAttribute]));
      ++*p_numAttribute;
      LOBYTE(v6) = 1;
      return v6;
    }
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "maximum GL attribute limit reached, skip.", v12, 2u);
    }

    v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("maximum GL attribute limit reached, skip."));
        v7 = _IDSShouldLog();
        LOBYTE(v6) = 0;
        if (v7)
        {
          v8 = CFSTR("maximum GL attribute limit reached, skip.");
LABEL_15:
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), v8);
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "invalid GL attribute.", buf, 2u);
    }

    v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("invalid GL attribute."));
        v10 = _IDSShouldLog();
        LOBYTE(v6) = 0;
        if (v10)
        {
          v8 = CFSTR("invalid GL attribute.");
          goto LABEL_15;
        }
      }
    }
  }
  return v6;
}

- (void)_addAddressAttribute:(int64_t)a3 value:(sockaddr *)a4
{
  __int16 v4;
  const char *v6;
  double v7;
  _WORD __b[520];
  uint64_t v9;

  v4 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  __b[0] = v4;
  __b[1] = 128;
  __memcpy_chk();
  objc_msgSend__addAttribute_(self, v6, (uint64_t)__b, v7);
}

- (void)_addUInt16Attribute:(int64_t)a3 value:(unsigned __int16)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _WORD __b[520];
  uint64_t v10;

  v5 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  __b[0] = v5;
  __b[1] = 2;
  __b[4] = a4;
  objc_msgSend__addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt32Attribute:(int64_t)a3 value:(unsigned int)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _DWORD __b[260];
  uint64_t v10;

  v5 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  LOWORD(__b[0]) = v5;
  HIWORD(__b[0]) = 4;
  __b[2] = a4;
  objc_msgSend__addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt64Attribute:(int64_t)a3 value:(unint64_t)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _QWORD __b[131];

  v5 = a3;
  __b[130] = *MEMORY[0x1E0C80C00];
  memset(__b, 170, 0x410uLL);
  LOWORD(__b[0]) = v5;
  WORD1(__b[0]) = 8;
  __b[1] = a4;
  objc_msgSend__addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addBinaryDataAttribute:(int64_t)a3 value:(id)a4
{
  unsigned __int16 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  double v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  _DWORD __b[260];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(__b, 170, sizeof(__b));
      v10 = objc_msgSend_length(v6, v7, v8, v9);
      v11 = v10;
      if ((v10 - 1025) > 0xFFFFFBFF)
      {
        LOWORD(__b[0]) = v4;
        HIWORD(__b[0]) = v10;
        __b[2] = v10;
        v13 = objc_retainAutorelease(v6);
        objc_msgSend_bytes(v13, v14, v15, v16);
        __memcpy_chk();
        objc_msgSend__addAttribute_(self, v17, (uint64_t)__b, v18);
      }
      else
      {
        OSLogHandleForTransportCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v20 = v11;
          v21 = 1024;
          v22 = v4;
          _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "failed to add %dB for binary attr type %04x.", buf, 0xEu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("failed to add %dB for binary attr type %04x."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("failed to add %dB for binary attr type %04x."));
          }
        }
      }
    }
  }

}

- (void)setAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t command;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *Value;
  void *v16;
  id v17;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  unsigned __int16 v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  double v30;
  unsigned __int16 v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  unsigned __int16 v37;
  const char *v38;
  double v39;
  const char *v40;
  uint64_t v41;
  double v42;
  unsigned __int16 v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  const char *v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  const char *v66;
  uint64_t v67;
  double v68;
  unsigned __int16 v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  const char *v74;
  double v75;
  const char *v76;
  double v77;
  const char *v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  const char *v82;
  double v83;
  const char *v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  const char *v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  const char *v94;
  double v95;
  const char *v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  const char *v104;
  double v105;
  NSObject *v106;
  const char *v107;
  double v108;
  const char *v109;
  double v110;
  void *v111;
  const char *v112;
  double v113;
  int64_t v114;
  id v115;
  char v116;
  id obj;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  uint8_t buf[24];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForTransportCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    command = self->_command;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = command;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage command:%04lx setAttributes: %@]", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v114 = self->_command;
      v115 = v4;
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("[IDSGlobalLinkMessage command:%04lx setAttributes: %@]"));
      if (_IDSShouldLog())
      {
        v114 = self->_command;
        v115 = v4;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("[IDSGlobalLinkMessage command:%04lx setAttributes: %@]"));
      }
    }
  }
  objc_msgSend_allKeys(v4, v7, v8, v9, v114, v115);
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v118, v11, v122, 16);
  if (v12)
  {
    v116 = 0;
    v13 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v119 != v13)
          objc_enumerationMutation(obj);
        Value = 0;
        v16 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        if (v4 && v16)
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v4, *(const void **)(*((_QWORD *)&v118 + 1) + 8 * i));
        v17 = Value;
        if (objc_msgSend_isEqualToString_(v16, v18, (uint64_t)CFSTR("gl-attr-counter"), v19))
        {
          v23 = objc_msgSend_unsignedIntValue(v17, v20, v21, v22);
          objc_msgSend__addUInt16Attribute_value_(self, v24, 1, v25, v23);
        }
        else if (objc_msgSend_isEqualToString_(v16, v20, (uint64_t)CFSTR("gl-attr-skedata"), v22))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v26, 4, v27, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v26, (uint64_t)CFSTR("gl-attr-transport"), v27))
        {
          v31 = objc_msgSend_unsignedIntValue(v17, v28, v29, v30);
          objc_msgSend__addUInt16Attribute_value_(self, v32, 2, v33, v31);
        }
        else if (objc_msgSend_isEqualToString_(v16, v28, (uint64_t)CFSTR("gl-attr-rat"), v30))
        {
          v37 = objc_msgSend_unsignedIntValue(v17, v34, v35, v36);
          objc_msgSend__addUInt16Attribute_value_(self, v38, 5, v39, v37);
        }
        else if (objc_msgSend_isEqualToString_(v16, v34, (uint64_t)CFSTR("gl-attr-mtu"), v36))
        {
          v43 = objc_msgSend_unsignedIntValue(v17, v40, v41, v42);
          objc_msgSend__addUInt16Attribute_value_(self, v44, 6, v45, v43);
        }
        else if (objc_msgSend_isEqualToString_(v16, v40, (uint64_t)CFSTR("gl-attr-conndata"), v42))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v46, 3, v47, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v46, (uint64_t)CFSTR("gl-attr-acceptdelay"), v47))
        {
          v51 = objc_msgSend_unsignedIntValue(v17, v48, v49, v50);
          objc_msgSend__addUInt32Attribute_value_(self, v52, 7, v53, v51);
        }
        else if (objc_msgSend_isEqualToString_(v16, v48, (uint64_t)CFSTR("gl-attr-relayremoteaddress"), v50))
        {
          v57 = objc_msgSend_sa(v17, v54, v55, v56);
          objc_msgSend__addAddressAttribute_value_(self, v58, 8, v59, v57);
        }
        else if (objc_msgSend_isEqualToString_(v16, v54, (uint64_t)CFSTR("gl-attr-hmac"), v56))
        {
          objc_storeStrong((id *)&self->_hmacKeyData, Value);
          v116 = 1;
        }
        else if (objc_msgSend_isEqualToString_(v16, v60, (uint64_t)CFSTR("gl-attr-rttreport"), v61))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v62, 10, v63, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v62, (uint64_t)CFSTR("gl-attr-linkuuid"), v63))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v64, 11, v65, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v64, (uint64_t)CFSTR("gl-attr-capability"), v65))
        {
          v69 = objc_msgSend_unsignedIntValue(v17, v66, v67, v68);
          objc_msgSend__addUInt16Attribute_value_(self, v70, 12, v71, v69);
        }
        else if (objc_msgSend_isEqualToString_(v16, v66, (uint64_t)CFSTR("gl-attr-local-cbuuid"), v68))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v72, 13, v73, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v72, (uint64_t)CFSTR("gl-attr-remote-cbuuid"), v73))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v74, 14, v75, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v74, (uint64_t)CFSTR("gl-attr-generic-data"), v75))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v76, 15, v77, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v76, (uint64_t)CFSTR("gl-attr-error-code-data"), v77))
        {
          v81 = objc_msgSend_unsignedIntValue(v17, v78, v79, v80);
          objc_msgSend__addUInt32Attribute_value_(self, v82, 17, v83, v81);
        }
        else if (objc_msgSend_isEqualToString_(v16, v78, (uint64_t)CFSTR("gl-attr-version"), v80))
        {
          v87 = objc_msgSend_unsignedShortValue(v17, v84, v85, v86);
          objc_msgSend__addUInt16Attribute_value_(self, v88, 18, v89, v87);
        }
        else if (objc_msgSend_isEqualToString_(v16, v84, (uint64_t)CFSTR("gl-attr-link-flags"), v86))
        {
          v93 = objc_msgSend_unsignedShortValue(v17, v90, v91, v92);
          objc_msgSend__addUInt16Attribute_value_(self, v94, 19, v95, v93);
        }
        else if (objc_msgSend_isEqualToString_(v16, v90, (uint64_t)CFSTR("gl-attr-data-so-mask"), v92))
        {
          v99 = objc_msgSend_unsignedIntValue(v17, v96, v97, v98);
          objc_msgSend__addUInt32Attribute_value_(self, v100, 20, v101, v99);
        }
        else if (objc_msgSend_isEqualToString_(v16, v96, (uint64_t)CFSTR("gl-attr-relay-link-interface-info"), v98))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v102, 21, v103, v17);
        }
        else if (objc_msgSend_isEqualToString_(v16, v102, (uint64_t)CFSTR("gl-attr-mkm"), v103))
        {
          objc_msgSend__addBinaryDataAttribute_value_(self, v104, 22, v105, v17);
        }
        else
        {
          OSLogHandleForTransportCategory();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v16;
            _os_log_impl(&dword_19B949000, v106, OS_LOG_TYPE_DEFAULT, "receive invalid attribute key %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive invalid attribute key %@."));
              if (_IDSShouldLog())
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive invalid attribute key %@."));
            }
          }
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v107, (uint64_t)&v118, v108, v122, 16);
    }
    while (v12);

    if ((v116 & 1) != 0)
    {
      memset(buf, 170, 20);
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v109, (uint64_t)buf, v110, 20);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__addBinaryDataAttribute_value_(self, v112, 9, v113, v111);

    }
  }
  else
  {

  }
}

- (BOOL)getAttribute:(int64_t)a3 attribute:(IDSGlobalLinkAttribute *)a4
{
  unint64_t numAttribute;
  IDSGlobalLinkAttribute *attributes;
  BOOL v6;
  unint64_t v7;
  IDSGlobalLinkAttribute *v8;
  uint64_t type;

  numAttribute = self->_numAttribute;
  if ((int)numAttribute < 1)
    return 0;
  attributes = self->_attributes;
  if (self->_attributes[0].type != a3)
  {
    v7 = 0;
    v8 = &self->_attributes[1];
    while (numAttribute - 1 != v7)
    {
      type = v8->type;
      ++v8;
      ++v7;
      if (type == a3)
      {
        v6 = v7 < numAttribute;
        attributes = v8 - 1;
        goto LABEL_8;
      }
    }
    return 0;
  }
  v6 = 1;
LABEL_8:
  memcpy(a4, attributes, sizeof(IDSGlobalLinkAttribute));
  return v6;
}

- (BOOL)verifyHMacDigestWithKey:(id)a3 inputBuffer:(char *)a4 inputLength:(int)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v23;
  NSObject *v24;
  const char *v25;
  double v26;
  _BOOL4 v27;
  const __CFString *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  id v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  id v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  const __CFString *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  void *v52;
  char *v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  double v80;
  void *v82;
  void *v83;
  void *v84;
  uint8_t buf[4];
  const __CFString *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  _QWORD macOut[4];

  macOut[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  memset(macOut, 170, 20);
  v84 = v7;
  if (a5 < 44)
  {
    v23 = 0;
  }
  else
  {
    v8 = objc_retainAutorelease(v7);
    v12 = (const void *)objc_msgSend_bytes(v8, v9, v10, v11);
    v16 = objc_msgSend_length(v8, v13, v14, v15);
    CCHmac(0, v12, v16, a4, (a5 - 24), macOut);
    v17 = &a4[a5];
    v18 = *(_QWORD *)(v17 - 20);
    v19 = *(_QWORD *)(v17 - 12);
    v20 = *((unsigned int *)v17 - 1);
    v23 = macOut[0] == v18 && macOut[1] == v19 && LODWORD(macOut[2]) == v20;
  }
  OSLogHandleForTransportCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v23;
    if (v23)
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v25, (uint64_t)macOut, v26, 20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imHexString(v29, v30, v31, v32);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v34, (uint64_t)&a4[a5 - 20], v35, 20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imHexString(v36, v37, v38, v39);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imHexString(v84, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v86 = v28;
    v87 = 2112;
    v88 = v33;
    v89 = 2112;
    v90 = v40;
    v91 = 2112;
    v92 = v44;
    _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "verifyHMacDigestWithKey result:%@ (HMac:%@, Recv:%@, Key: %@).", buf, 0x2Au);

    v23 = v27;
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    if (v23)
      v47 = CFSTR("YES");
    else
      v47 = CFSTR("NO");
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v45, (uint64_t)macOut, v46, 20);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imHexString(v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = &a4[a5 - 20];
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v54, (uint64_t)v53, v55, 20);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imHexString(v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imHexString(v84, v61, v62, v63);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("verifyHMacDigestWithKey result:%@ (HMac:%@, Recv:%@, Key: %@)."));

    if (_IDSShouldLog())
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v64, (uint64_t)macOut, v65, 20, v47, v52, v60, v82);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___imHexString(v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v71, (uint64_t)v53, v72, 20);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___imHexString(v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___imHexString(v84, v78, v79, v80);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("verifyHMacDigestWithKey result:%@ (HMac:%@, Recv:%@, Key: %@)."));

    }
  }

  return v23;
}

- (BOOL)write:(char *)a3 outputLength:(int *)a4
{
  NSObject *v7;
  const char *v8;
  double v9;
  NSObject *v10;
  const char *v11;
  double v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  OSLogHandleForTransportCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] attempting with all fields", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("[IDSGlobalLinkMessage write] attempting with all fields"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("[IDSGlobalLinkMessage write] attempting with all fields"));
    }
  }
  if ((objc_msgSend__write_outputLength_dropLowerPriorityFields_(self, v8, (uint64_t)a3, v9, a4, 0) & 1) != 0)
    goto LABEL_15;
  OSLogHandleForTransportCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] failed with all fields; will drop lower priority fields",
      v19,
      2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("[IDSGlobalLinkMessage write] failed with all fields; will drop lower priority fields"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("[IDSGlobalLinkMessage write] failed with all fields; will drop lower priority fields"));
    }
  }
  if ((objc_msgSend__write_outputLength_dropLowerPriorityFields_(self, v11, (uint64_t)a3, v12, a4, 1) & 1) != 0)
  {
LABEL_15:
    OSLogHandleForTransportCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] success", v17, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v14 = CFSTR("[IDSGlobalLinkMessage write] success");
      goto LABEL_25;
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "[IDSGlobalLinkMessage write] WARNING: failed even after dropping lower priority fields", v18, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v14 = CFSTR("[IDSGlobalLinkMessage write] WARNING: failed even after dropping lower priority fields");
LABEL_25:
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), v14);
      if ((_IDSShouldLog() & 1) != 0)
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), v14);
    }
  }
  return 1;
}

- (BOOL)_write:(char *)a3 outputLength:(int *)a4 dropLowerPriorityFields:(BOOL)a5
{
  int *v5;
  char *v8;
  int *p_numAttribute;
  int numAttribute;
  _BOOL4 v11;
  uint64_t v12;
  char v13;
  IDSGlobalLinkAttribute *attributes;
  uint64_t v15;
  NSObject *v16;
  int type;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  int *v21;
  const __CFString *v22;
  const __CFString *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSData *hmacKeyData;
  uint64_t v28;
  const void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  size_t v33;
  NSObject *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  __CFString *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  __CFString *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  void *v67;
  void *v68;
  int v70;
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  const __CFString *v74;
  uint64_t v75;

  v5 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  *(_WORD *)a3 = bswap32(LOWORD(self->_command)) >> 16;
  *(_QWORD *)(a3 + 12) = 0;
  *(_QWORD *)(a3 + 4) = 0;
  v8 = a3 + 20;
  p_numAttribute = &self->_numAttribute;
  numAttribute = self->_numAttribute;
  if (numAttribute <= 0)
  {
    v13 = 0;
    v18 = 1;
    goto LABEL_30;
  }
  v11 = a5;
  v12 = 0;
  v13 = 0;
  attributes = self->_attributes;
  while (v11 && attributes->type == 22)
  {
LABEL_19:
    ++v12;
    ++attributes;
    if (v12 >= numAttribute)
    {
      v18 = 1;
      goto LABEL_29;
    }
  }
  v15 = attributes->len + 4;
  v70 = attributes->len + 4;
  if (v8 - a3 + v15 < 1025)
  {
    switch(attributes->type)
    {
      case 1u:
      case 2u:
      case 5u:
      case 6u:
      case 0xCu:
      case 0x12u:
      case 0x13u:
        writeIDSGLAttrU16(&attributes->type, v8, &v70);
        break;
      case 3u:
      case 4u:
      case 0xAu:
      case 0xBu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x15u:
      case 0x16u:
        goto LABEL_7;
      case 7u:
      case 0x14u:
        writeIDSGLAttrU32(&attributes->type, (uint64_t)v8, &v70);
        break;
      case 8u:
        writeIDSGLAttrAddress(&attributes->type, (uint64_t)v8, &v70);
        break;
      case 9u:
        v13 = 1;
LABEL_7:
        writeIDSGLAttrBinaryData(&attributes->type, v8, &v70);
        break;
      default:
        OSLogHandleForTransportCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          type = attributes->type;
          *(_DWORD *)buf = 67109120;
          LODWORD(v72) = type;
          _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "receive invalid command attribute (%04x), skip.", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive invalid command attribute (%04x), skip."));
            if (_IDSShouldLog())
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive invalid command attribute (%04x), skip."));
          }
        }
        break;
    }
    v8 += v70;
    numAttribute = *p_numAttribute;
    goto LABEL_19;
  }
  OSLogHandleForTransportCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "exceed max command buffer length, stop.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("exceed max command buffer length, stop."));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("exceed max command buffer length, stop."));
    }
  }
  v18 = 0;
LABEL_29:
  v5 = a4;
LABEL_30:
  *((_WORD *)a3 + 1) = bswap32((_DWORD)v8 - (_DWORD)a3 - 20) >> 16;
  if (v5)
    *v5 = (_DWORD)v8 - (_DWORD)a3;
  OSLogHandleForTransportCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v5;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22 = CFSTR("NO");
    if ((v13 & 1) != 0)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    if (self->_hmacKeyData)
      v22 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v72 = v23;
    v73 = 2112;
    v74 = v22;
    _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "has hmac? %@; data: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("has hmac? %@; data: %@"));
      if (_IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("has hmac? %@; data: %@"));
    }
  }
  if ((v13 & 1) != 0)
  {
    hmacKeyData = self->_hmacKeyData;
    if (hmacKeyData)
    {
      v28 = *v5;
      v29 = (const void *)objc_msgSend_bytes(hmacKeyData, v24, v25, v26);
      v33 = objc_msgSend_length(self->_hmacKeyData, v30, v31, v32);
      CCHmac(0, v29, v33, a3, v28 - 24, &a3[v28 - 20]);
      OSLogHandleForTransportCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v35, (uint64_t)&a3[*v21 - 20], v36, 20);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend___imHexString(v37, v38, v39, v40);
        v41 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        objc_msgSend___imHexString(self->_hmacKeyData, v42, v43, v44);
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v72 = v41;
        v73 = 2112;
        v74 = v45;
        _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "HMac:%@, Key: %@", buf, 0x16u);

      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v46, (uint64_t)&a3[*v21 - 20], v47, 20);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___imHexString(v48, v49, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend___imHexString(self->_hmacKeyData, v53, v54, v55);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("HMac:%@, Key: %@"));

          if (_IDSShouldLog())
          {
            objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v56, (uint64_t)&a3[*v21 - 20], v57, 20, v52, v67);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___imHexString(v58, v59, v60, v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend___imHexString(self->_hmacKeyData, v63, v64, v65);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("HMac:%@, Key: %@"));

          }
        }
      }
    }
  }
  return v18;
}

- (BOOL)read:(char *)a3 inputLength:(int)a4
{
  NSObject *v5;
  int v6;
  unsigned int v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  char *v12;
  unsigned __int16 *v13;
  char *v14;
  IDSGlobalLinkAttribute *attributes;
  uint64_t v16;
  unsigned int v17;
  int64_t v18;
  NSObject *v19;
  int type;
  NSObject *v22;
  NSObject *v23;
  int v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a4 > 19)
  {
    self->_command = bswap32(*(unsigned __int16 *)a3) >> 16;
    v8 = (bswap32(*((unsigned __int16 *)a3 + 1)) >> 16) + 20;
    if (v8 <= a4)
    {
      v25 = -1431655766;
      if (a4 >= 0x18)
      {
        v11 = 0;
        v12 = &a3[a4];
        v13 = (unsigned __int16 *)(a3 + 24);
        v14 = a3 + 20;
        attributes = self->_attributes;
        v16 = 67109120;
        while (1)
        {
          v17 = bswap32(*(unsigned __int16 *)v14) >> 16;
          attributes->type = v17;
          v18 = bswap32(*((unsigned __int16 *)v14 + 1)) >> 16;
          attributes->len = v18;
          v25 = v18;
          if (v12 - (char *)v13 < v18)
          {
            OSLogHandleForTransportCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              v27 = (_DWORD)v12 - (_DWORD)v13;
              v28 = 1024;
              v29 = v25;
              _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "Buffer may overflow, %d, %d, return", buf, 0xEu);
            }

            v6 = os_log_shim_legacy_logging_enabled();
            if (v6)
            {
              v6 = _IDSShouldLogTransport();
              if (v6)
              {
                _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("Buffer may overflow, %d, %d, return"));
                v6 = _IDSShouldLog();
                if (v6)
                {
                  _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("Buffer may overflow, %d, %d, return"));
                  goto LABEL_15;
                }
              }
            }
            return v6;
          }
          if (v18 >= 0x401)
            break;
          switch(v17)
          {
            case 1u:
            case 2u:
            case 5u:
            case 6u:
            case 0xCu:
            case 0x12u:
            case 0x13u:
              readIDSGLAttrU16((uint64_t)attributes, (char *)&v25, v13, (_DWORD)v12 - (_DWORD)v13, *(double *)&v16);
              break;
            case 3u:
            case 4u:
            case 9u:
            case 0xAu:
            case 0xBu:
            case 0xDu:
            case 0xEu:
            case 0xFu:
            case 0x15u:
            case 0x16u:
              readIDSGLAttrBinaryData((uint64_t)attributes, (const char *)&v25, v13, (_DWORD)v12 - (_DWORD)v13, *(double *)&v16);
              break;
            case 7u:
            case 0x14u:
              readIDSGLAttrU32((uint64_t)attributes, (char *)&v25, (unsigned int *)v13, (_DWORD)v12 - (_DWORD)v13, *(double *)&v16);
              break;
            case 8u:
              readIDSGLAttrAddress((uint64_t)attributes, (const char *)&v25, (uint64_t)v13, (_DWORD)v12 - (_DWORD)v13, *(double *)&v16);
              break;
            default:
              OSLogHandleForTransportCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                type = attributes->type;
                *(_DWORD *)buf = 67109120;
                v27 = type;
                _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "receive invalid attribute %04x, skip.", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive invalid attribute %04x, skip."));
                  if (_IDSShouldLog())
                    _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive invalid attribute %04x, skip."));
                }
              }
              break;
          }
          v14 = (char *)v13 + v25;
          v10 = v11 + 1;
          v13 = (unsigned __int16 *)(v14 + 4);
          if (v14 + 4 <= v12)
          {
            ++attributes;
            if (v11++ < 0x13)
              continue;
          }
          goto LABEL_18;
        }
        OSLogHandleForTransportCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v27 = v25;
          _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "attrLen %d is greater than kIDSGLAttributeMaxSize, return", buf, 8u);
        }

        v6 = os_log_shim_legacy_logging_enabled();
        if (v6)
        {
          v6 = _IDSShouldLogTransport();
          if (v6)
          {
            _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("attrLen %d is greater than kIDSGLAttributeMaxSize, return"));
            v6 = _IDSShouldLog();
            if (v6)
            {
              _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("attrLen %d is greater than kIDSGLAttributeMaxSize, return"));
              goto LABEL_15;
            }
          }
        }
      }
      else
      {
        v10 = 0;
LABEL_18:
        self->_numAttribute = v10;
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v27 = a4;
        v28 = 1024;
        v29 = v8;
        _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "receive incomplete packet (%d < %d), skip.", buf, 0xEu);
      }

      v6 = os_log_shim_legacy_logging_enabled();
      if (v6)
      {
        v6 = _IDSShouldLogTransport();
        if (v6)
        {
          _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive incomplete packet (%d < %d), skip."));
          v6 = _IDSShouldLog();
          if (v6)
          {
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive incomplete packet (%d < %d), skip."));
            goto LABEL_15;
          }
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v27 = a4;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "receive invalid command data length %uB, too short.", buf, 8u);
    }

    v6 = os_log_shim_legacy_logging_enabled();
    if (v6)
    {
      v6 = _IDSShouldLogTransport();
      if (v6)
      {
        _IDSLogTransport(CFSTR("GL"), CFSTR("IDS"), CFSTR("receive invalid command data length %uB, too short."));
        v6 = _IDSShouldLog();
        if (v6)
        {
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("GL"), CFSTR("receive invalid command data length %uB, too short."));
LABEL_15:
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

- (int64_t)command
{
  return self->_command;
}

- (NSData)hmacKeyData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmacKeyData, 0);
}

@end
