@implementation NEIKEv2Packet

- (void)gatherPayloads
{
  const char *v3;
  SEL v4;
  SEL v5;
  id newValue;

  newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v3, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 56, 1));
    objc_setProperty_atomic(self, v5, newValue, 80);
  }
  else
  {
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2Packet *v2;
  NEIKEv2Packet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  NEIKEv2Packet *v15;
  void *v16;
  ptrdiff_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v2 = self;
  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  if (self)
    self = (NEIKEv2Packet *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2Packet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2 && objc_getProperty(v2, v9, 64, 1))
          {
            objc_msgSend(objc_getProperty(v2, v10, 64, 1), "arrayByAddingObject:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
            v15 = v2;
            v16 = v12;
            v17 = 64;
            goto LABEL_20;
          }
          v23 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1, (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2)
            goto LABEL_17;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_22;
          if (v2 && objc_getProperty(v2, v13, 56, 1))
          {
            objc_msgSend(objc_getProperty(v2, v14, 56, 1), "arrayByAddingObject:", v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
            v15 = v2;
            v16 = v12;
            v17 = 56;
LABEL_20:
            objc_setProperty_atomic(v15, v11, v16, v17);
            goto LABEL_21;
          }
          v22 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1, (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2)
            goto LABEL_19;
        }
LABEL_21:

LABEL_22:
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NEIKEv2Packet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  SEL v10;
  SEL v11;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Exchange"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 32, 1), CFSTR("Initiator SPI"), v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v10, 40, 1), CFSTR("Responder SPI"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", self->_isInitiator, CFSTR("Initiator"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", self->_isResponse, CFSTR("Response"), v5, a4);
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", self->_messageID, CFSTR("Message ID"), v5, a4);
    Property = objc_getProperty(self, v11, 80, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Initiator SPI"), v5, a4);
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Responder SPI"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", 0, CFSTR("Initiator"), v5, a4);
    objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", 0, CFSTR("Response"), v5, a4);
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", 0, CFSTR("Message ID"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Payloads"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2Packet descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyShortDescription
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t messageID;
  id v9;
  SEL v10;
  id Property;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  v6 = "R";
  v7 = "req";
  if (self)
  {
    if (self->_isInitiator)
      v6 = "I";
    if (self->_isResponse)
      v7 = "resp";
    messageID = self->_messageID;
    v9 = objc_getProperty(self, v4, 32, 1);
    Property = objc_getProperty(self, v10, 40, 1);
  }
  else
  {
    v9 = 0;
    messageID = 0;
    Property = 0;
  }
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[%@ %s %s%d %@-%@]"), v5, v6, v7, messageID, v9, Property);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPayloads, 0);
  objc_storeStrong((id *)&self->_packetDatagrams, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_customPayloads, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
  objc_storeStrong((id *)&self->_responderSPI, 0);
  objc_storeStrong((id *)&self->_initiatorSPI, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Invalid");
}

+ (BOOL)encryptPayloads
{
  return 1;
}

+ (unint64_t)exchangeType
{
  return 0;
}

- (void)addNotification:(void *)a3 fromArray:(void *)a4 toPayloads:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * v13);
          if (v14)
          {
            if (v14[3] == a2)
            {
              v16 = v14;

              objc_msgSend(v8, "addObject:", v16, (_QWORD)v17);
              objc_msgSend(v9, "removeObject:", v16);
              v9 = v16;
              goto LABEL_16;
            }
          }
          else if (!a2)
          {
            goto LABEL_16;
          }
          ++v13;
        }
        while (v11 != v13);
        v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v11 = v15;
      }
      while (v15);
    }
LABEL_16:

  }
}

- (NSObject)initOutbound
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)NEIKEv2Packet;
  v1 = objc_msgSendSuper2(&v6, sel_init);
  if (!v1)
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_19BD16000, v2, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }
    goto LABEL_7;
  }
  v2 = v1;
  if (-[NSObject isMemberOfClass:](v1, "isMemberOfClass:", objc_opt_class()))
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, "Must use a subclass of NEIKEv2Packet to create outbound packets", v5, 2u);
    }

LABEL_7:
    return 0;
  }
  return v2;
}

- (uint64_t)initResponse:(uint64_t)a1
{
  _DWORD *v3;
  _DWORD *v4;
  id v5;
  NSObject *v6;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      if ((v3[3] & 1) != 0)
      {
        v11.receiver = (id)a1;
        v11.super_class = (Class)NEIKEv2Packet;
        v5 = objc_msgSendSuper2(&v11, sel_init);
        if (!v5)
        {
          ne_log_obj();
          a1 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)a1, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_19BD16000, (os_log_t)a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
          }
          goto LABEL_8;
        }
        a1 = (uint64_t)v5;
        if (!objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
        {
          *(_BYTE *)(a1 + 10) = 1;
          *(_DWORD *)(a1 + 24) = v4[6];
          goto LABEL_10;
        }
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
LABEL_7:

LABEL_8:
          a1 = 0;
          goto LABEL_10;
        }
        *(_WORD *)buf = 0;
        v8 = "Must use a subclass of NEIKEv2Packet to create outbound packets";
        v9 = v6;
        v10 = 2;
LABEL_12:
        _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, v8, buf, v10);
        goto LABEL_7;
      }
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        goto LABEL_7;
      *(_DWORD *)buf = 136315138;
      v13 = "-[NEIKEv2Packet initResponse:]";
      v8 = "%s called with null originalMessage.isInbound";
    }
    else
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        goto LABEL_7;
      *(_DWORD *)buf = 136315138;
      v13 = "-[NEIKEv2Packet initResponse:]";
      v8 = "%s called with null originalMessage";
    }
    v9 = v6;
    v10 = 12;
    goto LABEL_12;
  }
LABEL_10:

  return a1;
}

- (void)constructHeadersForNextPayloadType:(uint64_t)a3 payloadsLength:(unsigned int)a4 fragmentNumber:(unsigned int)a5 totalFragments:(void *)a6 securityContext:
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v12;
  int v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unsigned __int8 v19;
  void *v20;
  char v21;
  SEL v22;
  SEL v23;
  int v24;
  BOOL v28;
  _WORD v29[2];
  _WORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  unsigned int v33;

  v10 = a4 != 0;
  v11 = a5 != 0;
  v12 = a6;
  v13 = objc_msgSend(v12, "overheadForPlaintextLength:", a3);
  v14 = objc_alloc(MEMORY[0x1E0C99DF0]);

  v15 = !v10 || !v11;
  v28 = v10 && v11;
  if (v10 && v11)
    v16 = 8;
  else
    v16 = 4;
  v17 = 46;
  if (!v15)
    v17 = 53;
  if (a6)
    v18 = v16 + 28;
  else
    v18 = 28;
  if (a6)
    v19 = v17;
  else
    v19 = a2;
  v20 = (void *)objc_msgSend(v14, "initWithCapacity:", v18);
  v21 = 32;
  v31[0] = objc_msgSend(objc_getProperty((id)a1, v22, 32, 1), "value");
  v31[1] = objc_msgSend(objc_getProperty((id)a1, v23, 40, 1), "value");
  v32 = v19;
  BYTE1(v32) = 32;
  *(_DWORD *)((char *)&v32 + 2) = objc_msgSend((id)objc_opt_class(), "exchangeType");
  if ((*(_BYTE *)(a1 + 11) & 1) != 0)
  {
    BYTE3(v32) = 8;
    v21 = 40;
  }
  v24 = v13 + a3;
  if ((*(_BYTE *)(a1 + 10) & 1) != 0)
    BYTE3(v32) = v21;
  HIDWORD(v32) = bswap32(*(_DWORD *)(a1 + 24));
  v33 = bswap32(v18 + (unsigned __int16)v24);
  objc_msgSend(v20, "appendBytes:length:", v31, 28);
  if (a6)
  {
    v30[0] = a2;
    v30[1] = bswap32(v24 + v16) >> 16;
    objc_msgSend(v20, "appendBytes:length:", v30, 4);
    if (v28)
    {
      v29[0] = __rev16(a4);
      v29[1] = __rev16(a5);
      objc_msgSend(v20, "appendBytes:length:", v29, 4);
    }
  }
  return v20;
}

- (uint64_t)copyUnifiedData
{
  const char *v3;

  if (objc_msgSend(objc_getProperty(a1, a2, 72, 1), "count") != 1)
    return 0;
  objc_msgSend(objc_getProperty(a1, v3, 72, 1), "firstObject");
  return objc_claimAutoreleasedReturnValue();
}

- (id)copyPacketDatagramsForIKESA:(_BYTE *)a1
{
  const char *v3;
  _BYTE *v4;
  const char *v5;
  void *v6;
  SEL v7;
  const char *v8;
  void *v9;
  SEL v10;
  const char *v11;
  char v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  id Property;
  unsigned int v24;
  void *v25;
  const char *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  _BYTE *v32;
  const char *v33;
  unsigned int v34;
  const char *v35;
  uint64_t v36;
  SEL v37;
  id v38;
  _BYTE *v39;
  const char *v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  SEL v44;
  id v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NEIKEv2EncryptedPayload *v52;
  void *v53;
  SEL v54;
  unsigned __int16 v55;
  SEL v56;
  id v57;
  id v58;
  const char *v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  SEL v65;
  const char *v66;
  unsigned __int16 v67;
  unsigned int v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  unsigned __int8 v73;
  unsigned __int16 v74;
  SEL v75;
  id v76;
  void *v77;
  const char *v78;
  NSObject *v79;
  id v80;
  void *v81;
  NEIKEv2EncryptedPayload *v82;
  const char *v83;
  SEL v84;
  const char *v85;
  void *v86;
  const char *v87;
  SEL v88;
  NSObject *v90;
  _BYTE *v91;
  _BYTE *v92;
  unsigned int v93;
  unsigned int v94;
  unsigned __int16 v95;
  void *v96;
  unsigned int v97;
  NSObject *v98;
  _BYTE *v99;
  _BYTE *v100;
  void *self;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  NEIKEv2EncryptedPayload *v106;
  void *v107;
  uint8_t buf[4];
  _BYTE v109[10];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if ((a1[12] & 1) == 0)
  {
    objc_msgSend(a1, "gatherPayloads");
    -[NEIKEv2IKESA initiatorSPI](v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v7, v6, 32);

    -[NEIKEv2IKESA responderSPI](v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v10, v9, 40);

    if (v4)
      v12 = v4[9] & 1;
    else
      v12 = 0;
    a1[11] = v12;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    objc_msgSend(objc_getProperty(a1, v11, 80, 1), "reverseObjectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    if (v14)
    {
      v15 = v14;
      v99 = a1;
      v91 = v4;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v103;
      for (i = *(_QWORD *)v103; ; i = *(_QWORD *)v103)
      {
        if (i != v19)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v18);
        if ((objc_msgSend(v21, "generatePayloadData") & 1) != 0)
        {
          *(_DWORD *)buf = 0;
          if (v21)
            Property = objc_getProperty(v21, v22, 16, 1);
          else
            Property = 0;
          v24 = objc_msgSend(Property, "length") + 4;
          buf[0] = v16;
          *(_WORD *)&buf[2] = bswap32(v24) >> 16;
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v17, "length") + (unsigned __int16)v24);
          objc_msgSend(v25, "appendBytes:length:", buf, 4);
          if (v21)
            v27 = objc_getProperty(v21, v26, 16, 1);
          else
            v27 = 0;
          objc_msgSend(v25, "appendData:", v27);
          if (v17)
            objc_msgSend(v25, "appendData:", v17);

          v16 = objc_msgSend(v21, "type");
          v17 = v25;
        }
        else
        {
          ne_log_large_obj();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v109 = v21;
            _os_log_error_impl(&dword_19BD16000, v28, OS_LOG_TYPE_ERROR, "Failed to generate payload data for %@", buf, 0xCu);
          }

        }
        if (++v18 >= v15)
        {
          v29 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
          if (!v29)
          {
            v4 = v91;
            a1 = v99;
            goto LABEL_28;
          }
          v15 = v29;
          v18 = 0;
        }
      }
    }
    v16 = 0;
    v17 = 0;
LABEL_28:

    if (!objc_msgSend((id)objc_opt_class(), "encryptPayloads"))
    {
      v50 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]((uint64_t)a1, v16, (unsigned __int16)objc_msgSend(v17, "length"), 0, 0, 0);
      if (!v50)
      {
LABEL_76:
        v30 = 0;
        goto LABEL_70;
      }
      v51 = v50;
      v52 = (NEIKEv2EncryptedPayload *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v17, "length") + -[NSObject length](v50, "length"));
      -[NEIKEv2EncryptedPayload appendData:](v52, "appendData:", v51);
      -[NEIKEv2EncryptedPayload appendData:](v52, "appendData:", v17);
      v106 = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v54, v53, 72);

      goto LABEL_68;
    }
    if (v4)
    {
      if ((v4[10] & 1) != 0)
      {
        v31 = objc_msgSend(v17, "length");
        v32 = v4;
        v34 = -[NEIKEv2IKESA headerOverhead](v32, v33);
        v36 = -[NEIKEv2IKESA maximumPacketSize]((uint64_t)v32, v35) - v34 - 32;
        v38 = objc_getProperty(v32, v37, 208, 1);

        LODWORD(v36) = objc_msgSend(v38, "maximumPayloadSizeWithinLimit:", v36);
        if (v36 < v31)
        {
          v39 = v32;
          v41 = -[NEIKEv2IKESA headerOverhead](v39, v40);
          v43 = -[NEIKEv2IKESA maximumPacketSize]((uint64_t)v39, v42) - v41 - 36;
          v45 = objc_getProperty(v39, v44, 208, 1);
          self = v39;

          v46 = objc_msgSend(v45, "maximumPayloadSizeWithinLimit:", v43);
          v96 = v17;
          if (!v46)
          {
            ne_log_obj();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19BD16000, v51, OS_LOG_TYPE_FAULT, "Fragment size of 0 is impossible!", buf, 2u);
            }
            goto LABEL_75;
          }
          v47 = objc_msgSend(v17, "length");
          v97 = v47;
          if (v47 / v46 * v46 == v47)
            v48 = v47 / v46;
          else
            LOWORD(v48) = v47 / v46 + 1;
          ne_log_obj();
          v49 = objc_claimAutoreleasedReturnValue();
          v100 = a1;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v109 = (unsigned __int16)v48;
            *(_WORD *)&v109[4] = 1024;
            *(_DWORD *)&v109[6] = v46;
            _os_log_impl(&dword_19BD16000, v49, OS_LOG_TYPE_INFO, "Splitting packet into %u fragments with max size %u each", buf, 0xEu);
          }
          v92 = v4;

          v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unsigned __int16)v48);
          if ((_WORD)v48)
          {
            v94 = v46;
            v95 = v48;
            v98 = 0;
            v67 = 1;
            v68 = v97;
            v93 = (unsigned __int16)v48;
            while (1)
            {
              v69 = v46 >= v68 ? v68 : v46;
              objc_msgSend(v17, "subdataWithRange:", v97 - v68, v69);
              v70 = objc_claimAutoreleasedReturnValue();
              if (!v70)
                break;
              v71 = v70;
              v72 = v16;
              if (v67 == 1)
                v73 = v16;
              else
                v73 = 0;
              v74 = -[NSObject length](v70, "length");
              v76 = objc_getProperty(self, v75, 208, 1);
              v77 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]((uint64_t)v100, v73, v74, v67, v95, v76);

              if (!v77)
              {
                v51 = v98;
                v17 = v96;
                goto LABEL_81;
              }
              if (v67 == 1)
              {
                v79 = v77;

                v98 = v79;
              }
              v16 = v72;
              v80 = objc_getProperty(self, v78, 208, 1);
              objc_msgSend(v80, "constructEncryptedPacketFromPayloadData:authenticatedHeaders:", v71, v77);
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              v17 = v96;
              if (!v81)
              {

                v51 = v98;
                goto LABEL_81;
              }
              -[NSObject addObject:](v60, "addObject:", v81);
              v68 -= v69;

              ++v67;
              v46 = v94;
              if (v93 < v67)
                goto LABEL_62;
            }
            ne_log_obj();
            v71 = objc_claimAutoreleasedReturnValue();
            v51 = v98;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19BD16000, v71, OS_LOG_TYPE_FAULT, "[NSData subdataWithRange:] failed", buf, 2u);
            }
LABEL_81:

            v4 = v92;
            goto LABEL_75;
          }
          v98 = 0;
LABEL_62:
          a1 = v100;
          objc_setProperty_atomic(v100, v66, v60, 72);
          v4 = v92;
          v51 = v98;
          goto LABEL_63;
        }
      }
      v55 = objc_msgSend(v17, "length");
      v57 = objc_getProperty(v4, v56, 208, 1);
    }
    else
    {
      v55 = objc_msgSend(v17, "length");
      v57 = 0;
    }
    v58 = v57;
    v30 = -[NEIKEv2Packet constructHeadersForNextPayloadType:payloadsLength:fragmentNumber:totalFragments:securityContext:]((uint64_t)a1, v16, v55, 0, 0, v58);

    if (!v30)
    {
LABEL_70:

      goto LABEL_71;
    }
    v60 = v30;
    if (v4)
      v61 = objc_getProperty(v4, v59, 208, 1);
    else
      v61 = 0;
    v62 = v61;
    objc_msgSend(v62, "constructEncryptedPacketFromPayloadData:authenticatedHeaders:", v17, v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v63)
    {

      v51 = v60;
      goto LABEL_75;
    }
    v107 = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v65, v64, 72);

    v51 = v60;
LABEL_63:

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_69:

      v30 = objc_getProperty(a1, v88, 72, 1);
      goto LABEL_70;
    }
    v82 = objc_alloc_init(NEIKEv2EncryptedPayload);
    v52 = v82;
    if (v82)
    {
      objc_setProperty_atomic(v82, v83, v17, 16);
      objc_setProperty_atomic(v52, v84, v51, 24);
      v52->_nextPayload = v16;
    }
    objc_setProperty_atomic(a1, v83, v52, 48);
    -[NEIKEv2IntermediatePacket authenticatedData](a1, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      objc_setProperty_atomic(a1, v87, 0, 48);
LABEL_68:

      goto LABEL_69;
    }
    ne_log_obj();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v90, OS_LOG_TYPE_ERROR, "Failed to get authenticated data for IKE_INTERMEDIATE", buf, 2u);
    }

LABEL_75:
    goto LABEL_76;
  }
  v30 = objc_getProperty(a1, v3, 72, 1);
LABEL_71:

  return v30;
}

+ (uint64_t)createPacketFromReceivedData:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  __objc2_class **v9;
  int v11;
  _BYTE *v12;
  const char *v13;
  void *v14;
  const char *v15;
  NEIKEv2IKESPI *v16;
  NEIKEv2IKESPI *v17;
  const char *v18;
  NEIKEv2IKESPI *v19;
  unsigned int v20;
  const char *v21;
  __int128 v22;
  uint64_t v23;
  unsigned __int8 *v24;
  uint64_t v25;
  int v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  _BOOL4 v33;
  int v34;
  NSObject *v35;
  id v36;
  SEL v37;
  void *v38;
  SEL v39;
  SEL v40;
  const char *v41;
  char isKindOfClass;
  id v43;
  const char *v44;
  NSObject *v45;
  int v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  int v51;
  const char *v52;
  __int128 v53;
  id v54;
  int v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  uint8_t buf[4];
  _DWORD v60[7];

  *(_QWORD *)&v60[5] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (!objc_msgSend(v2, "bytes"))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v60 = "+[NEIKEv2Packet createPacketFromReceivedData:]";
    v52 = "%s called with null data.bytes";
LABEL_82:
    _os_log_fault_impl(&dword_19BD16000, (os_log_t)v5, OS_LOG_TYPE_FAULT, v52, buf, 0xCu);
    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v2, "length") <= 0x1B)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v60 = "+[NEIKEv2Packet createPacketFromReceivedData:]";
    v52 = "%s called with null (data.length >= sizeof(ikev2_hdr_t))";
    goto LABEL_82;
  }
  v3 = objc_msgSend(v2, "bytes");
  v4 = bswap32(*(_DWORD *)(v3 + 24));
  if (objc_msgSend(v2, "length") < v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v60[0] = v4;
      LOWORD(v60[1]) = 1024;
      *(_DWORD *)((char *)&v60[1] + 2) = objc_msgSend(v2, "length");
      v6 = "Cannot parse packet, header claims to be longer than data (%u > %u)";
      v7 = v5;
      v8 = 14;
LABEL_67:
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (*(_BYTE *)(v3 + 17) == 32)
  {
    v55 = 1;
    v9 = off_1E3CBBA40;
    switch(*(_BYTE *)(v3 + 18))
    {
      case '"':
        break;
      case '#':
        v55 = 0;
        v9 = off_1E3CBBA28;
        break;
      case '$':
        v55 = 0;
        v9 = off_1E3CBB980;
        break;
      case '%':
        v55 = 0;
        v9 = off_1E3CBBAD0;
        break;
      case '+':
        v55 = 0;
        v9 = off_1E3CBBAF8;
        break;
      case ',':
        v55 = 0;
        v9 = off_1E3CBBA00;
        break;
      default:
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        v11 = *(unsigned __int8 *)(v3 + 18);
        *(_DWORD *)buf = 67109120;
        v60[0] = v11;
        v6 = "Unknown exchange type %u";
        goto LABEL_66;
    }
    v12 = objc_alloc_init(*v9);
    v5 = (uint64_t)v12;
    if (v12)
      v12[12] = 1;
    v58 = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_setProperty_atomic((id)v5, v13, v14, 72);

    v16 = -[NEIKEv2IKESPI initWithValue:]([NEIKEv2IKESPI alloc], "initWithValue:", *(_QWORD *)v3);
    if (v5)
      objc_setProperty_atomic((id)v5, v15, v16, 32);

    v17 = -[NEIKEv2IKESPI initWithValue:]([NEIKEv2IKESPI alloc], "initWithValue:", *(_QWORD *)(v3 + 8));
    v19 = v17;
    if (v5)
    {
      objc_setProperty_atomic((id)v5, v18, v17, 40);

      *(_BYTE *)(v5 + 11) = (*(_BYTE *)(v3 + 19) & 8) != 0;
      *(_BYTE *)(v5 + 10) = (*(_BYTE *)(v3 + 19) & 0x20) != 0;
      *(_DWORD *)(v5 + 24) = bswap32(*(_DWORD *)(v3 + 20));
    }
    else
    {

    }
    v20 = *(unsigned __int8 *)(v3 + 16);
    v54 = v2;
    v56 = objc_msgSend(v2, "bytes");
    if (v20 && v4 >= 0x20)
    {
      v23 = 28;
      *(_QWORD *)&v22 = 67109376;
      v53 = v22;
      while (1)
      {
        v24 = (unsigned __int8 *)(v56 + v23);
        v25 = bswap32(*(unsigned __int16 *)(v56 + v23 + 2)) >> 16;
        if (v25 <= 3)
        {
          ne_log_obj();
          v45 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            goto LABEL_61;
          *(_DWORD *)buf = 67109120;
          v60[0] = v25;
          v48 = "Bad payload length too short (%u)";
LABEL_77:
          v49 = v45;
          v50 = 8;
          goto LABEL_72;
        }
        v23 = (v23 + v25);
        if (v23 > v4)
        {
          ne_log_obj();
          v45 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            goto LABEL_61;
          *(_DWORD *)buf = 67109120;
          v60[0] = v25;
          v48 = "Bad payload length too long (%u)";
          goto LABEL_77;
        }
        v26 = (char)v24[1];
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v24 + 4, v25 - 4);
        v28 = +[NEIKEv2Payload createPayloadWithType:fromData:]((uint64_t)NEIKEv2Payload, v20, v27);
        if (v28)
          break;
        if (v26 < 0)
        {
          ne_log_obj();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v60[0] = v20;
            _os_log_error_impl(&dword_19BD16000, v32, OS_LOG_TYPE_ERROR, "Failed to parse critical payload type %u", buf, 8u);
          }
          v28 = 0;
          goto LABEL_70;
        }
LABEL_45:
        v20 = *v24;

        if (!v20 || v23 + 4 > v4)
          goto LABEL_54;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v28;
        v36 = objc_alloc(MEMORY[0x1E0C99DF0]);
        v38 = (void *)objc_msgSend(v36, "initWithCapacity:", objc_msgSend(objc_getProperty(v35, v37, 24, 1), "length") + 32);
        objc_msgSend(v38, "appendBytes:length:", v3, 28);
        objc_msgSend(v38, "appendBytes:length:", v24, 4);
        objc_msgSend(v38, "appendData:", objc_getProperty(v35, v39, 24, 1));
        objc_setProperty_atomic(v35, v40, v38, 24);
        v35[4].isa = (Class)*v24;
        if (v5)
          objc_setProperty_atomic((id)v5, v41, v35, 48);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (v5 && (isKindOfClass & 1) != 0)
        {
          *(_BYTE *)(v5 + 9) = 1;
          *(_DWORD *)(v5 + 16) = v35[5].isa;
          *(_DWORD *)(v5 + 20) = HIDWORD(v35[5].isa);
        }

        goto LABEL_54;
      }
      if (!v55)
      {
        ne_log_obj();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
        if (v26 < 0)
        {
          if (v33)
          {
            v51 = *(unsigned __int8 *)(v3 + 18);
            *(_DWORD *)buf = v53;
            v60[0] = v20;
            LOWORD(v60[1]) = 1024;
            *(_DWORD *)((char *)&v60[1] + 2) = v51;
            _os_log_error_impl(&dword_19BD16000, v32, OS_LOG_TYPE_ERROR, "Unencrypted critical payload type %u is not permitted for packet type %u", buf, 0xEu);
          }
LABEL_70:
          v2 = v54;

          goto LABEL_10;
        }
        if (v33)
        {
          v34 = *(unsigned __int8 *)(v3 + 18);
          *(_DWORD *)buf = v53;
          v60[0] = v20;
          LOWORD(v60[1]) = 1024;
          *(_DWORD *)((char *)&v60[1] + 2) = v34;
          _os_log_error_impl(&dword_19BD16000, v32, OS_LOG_TYPE_ERROR, "Unencrypted payload type %u is not permitted for packet type %u", buf, 0xEu);
        }
        goto LABEL_44;
      }
      if (v5 && objc_getProperty((id)v5, v29, 80, 1))
      {
        objc_msgSend(objc_getProperty((id)v5, v30, 80, 1), "arrayByAddingObject:", v28);
        v32 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v57 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1, v53);
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
LABEL_44:

          goto LABEL_45;
        }
      }
      objc_setProperty_atomic((id)v5, v31, v32, 80);
      goto LABEL_44;
    }
LABEL_54:
    if (v5)
    {
      v43 = objc_getProperty((id)v5, v21, 80, 1);
      if (v43)
      {

LABEL_58:
        objc_msgSend((id)v5, "filloutPayloads", v53);
LABEL_59:
        v2 = v54;
        goto LABEL_11;
      }
      if (objc_getProperty((id)v5, v44, 48, 1))
        goto LABEL_58;
    }
    ne_log_obj();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v48 = "Cannot parse packet, no acceptable payloads found";
      v49 = v45;
      v50 = 2;
LABEL_72:
      _os_log_error_impl(&dword_19BD16000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    }
LABEL_61:

    v5 = 0;
    goto LABEL_59;
  }
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    v47 = *(unsigned __int8 *)(v3 + 17);
    *(_DWORD *)buf = 67109120;
    v60[0] = v47;
    v6 = "Cannot parse packet, unknown version (%x)";
LABEL_66:
    v7 = v5;
    v8 = 8;
    goto LABEL_67;
  }
LABEL_10:

  v5 = 0;
LABEL_11:

  return v5;
}

- (uint64_t)processDecryptedPacketForIKESA:(_BYTE *)a1
{
  const char *v3;
  id v4;
  id Property;
  const char *v6;
  const char *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  unsigned int v11;
  SEL v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;
  uint64_t v18;
  void *v19;
  NEIKEv2ResponseConfigPayload *v20;
  SEL v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NEIKEv2ResponseConfigPayload *v26;
  const char *v27;
  SEL v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  void *v32;
  SEL v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  NSObject *v43;
  const char *v45;
  id v46;
  NSObject *v47;
  unsigned int v48;
  unint64_t v49;
  uint64_t v50;
  NEIKEv2ResponseConfigPayload *v51;
  uint8_t buf[4];
  NEIKEv2ResponseConfigPayload *v53;
  objc_super v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
  {
    v36 = 0;
    goto LABEL_47;
  }
  if ((a1[8] & 1) == 0)
  {
    ne_log_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      goto LABEL_36;
    LODWORD(v54.receiver) = 136315138;
    *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
    v45 = "%s called with null self.decrypted";
    goto LABEL_52;
  }
  Property = objc_getProperty(a1, v3, 48, 1);
  if (Property && objc_getProperty(Property, v6, 16, 1))
  {
    if (v4)
    {
      v8 = objc_getProperty(a1, v7, 48, 1);
      if (v8)
        v8 = objc_getProperty(v8, v9, 16, 1);
      v10 = v8;
      v11 = -[NSObject length](v10, "length");
      v47 = v10;
      v50 = -[NSObject bytes](v10, "bytes");
      v13 = objc_getProperty(a1, v12, 48, 1);
      if (v13)
      {
        v14 = v13[4];
        if (v14)
        {
          v49 = v11;
          if (v11 >= 4uLL)
          {
            v15 = 0;
            v16 = 0;
            v46 = v4;
            v48 = v11;
            while (1)
            {
              v17 = (unsigned __int8 *)(v50 + v15);
              v18 = bswap32(*(unsigned __int16 *)(v50 + v15 + 2)) >> 16;
              if (v18 <= 3)
              {
                ne_log_obj();
                v38 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  goto LABEL_43;
                LODWORD(v54.receiver) = 67109120;
                HIDWORD(v54.receiver) = v18;
                v39 = "Bad payload length too short (%u)";
LABEL_41:
                v40 = v38;
                v41 = 8;
                goto LABEL_54;
              }
              v15 = (v16 + v18);
              if (v15 > v11)
              {
                ne_log_obj();
                v38 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  goto LABEL_43;
                LODWORD(v54.receiver) = 67109120;
                HIDWORD(v54.receiver) = v18;
                v39 = "Bad payload length too long (%u)";
                goto LABEL_41;
              }
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v17 + 4, v18 - 4);
              if (v14 == 47 && (a1[10] & 1) != 0)
              {
                v20 = [NEIKEv2ResponseConfigPayload alloc];
                v22 = objc_getProperty(v4, v21, 88, 1);
                objc_msgSend(v22, "configurationRequest");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v19;
                v25 = v23;
                if (v20)
                {
                  v54.receiver = v20;
                  v54.super_class = (Class)NEIKEv2ResponseConfigPayload;
                  v26 = (NEIKEv2ResponseConfigPayload *)objc_msgSendSuper2(&v54, sel_init);
                  v20 = v26;
                  if (v26)
                  {
                    objc_setProperty_atomic(v26, v27, v24, 16);
                    v20->super.super._isInbound = 1;
                    objc_setProperty_atomic(v20, v28, v25, 32);
                    if (!-[NEIKEv2ResponseConfigPayload parsePayloadData](v20, "parsePayloadData"))
                    {
                      ne_log_obj();
                      v29 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v53 = v20;
                        _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "Failed to parse payload data for %@", buf, 0xCu);
                      }

                      v20 = 0;
                      v4 = v46;
                    }
                  }
                }

                v11 = v48;
                if (v20)
                {
LABEL_23:
                  if (objc_getProperty(a1, v30, 80, 1))
                  {
                    objc_msgSend(objc_getProperty(a1, v31, 80, 1), "arrayByAddingObject:", v20);
                  }
                  else
                  {
                    v51 = v20;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
                  }
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_setProperty_atomic(a1, v33, v32, 80);

                  goto LABEL_30;
                }
              }
              else
              {
                v20 = (NEIKEv2ResponseConfigPayload *)+[NEIKEv2Payload createPayloadWithType:fromData:]((uint64_t)NEIKEv2Payload, v14, v19);
                if (v20)
                  goto LABEL_23;
              }
              if ((char)v17[1] < 0)
              {
                ne_log_obj();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v54.receiver) = 67109120;
                  HIDWORD(v54.receiver) = v14;
                  _os_log_error_impl(&dword_19BD16000, v43, OS_LOG_TYPE_ERROR, "Failed to parse critical payload type %u", (uint8_t *)&v54, 8u);
                }

                goto LABEL_44;
              }
LABEL_30:
              v14 = *v17;

              if (v14)
              {
                v16 = v15;
                if (v15 + 4 <= v49)
                  continue;
              }
              break;
            }
          }
        }
      }
      a1[9] = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (-[NEIKEv2IntermediatePacket authenticatedData](a1, v34),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v35,
            !v35))
      {
        ne_log_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v54.receiver) = 0;
          v39 = "Failed to get authenticated data for IKE_INTERMEDIATE";
          v40 = v38;
          v41 = 2;
LABEL_54:
          _os_log_error_impl(&dword_19BD16000, v40, OS_LOG_TYPE_ERROR, v39, (uint8_t *)&v54, v41);
        }
LABEL_43:

LABEL_44:
        v36 = 0;
      }
      else
      {
        objc_setProperty_atomic(a1, v34, 0, 48);
        objc_msgSend(a1, "filloutPayloads");
        v36 = 1;
      }
      v37 = v47;
      goto LABEL_46;
    }
    ne_log_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v54.receiver) = 136315138;
      *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
      v45 = "%s called with null ikeSA";
      goto LABEL_52;
    }
  }
  else
  {
    ne_log_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v54.receiver) = 136315138;
      *(id *)((char *)&v54.receiver + 4) = "-[NEIKEv2Packet processDecryptedPacketForIKESA:]";
      v45 = "%s called with null self.encryptedPayload.payloadData";
LABEL_52:
      _os_log_fault_impl(&dword_19BD16000, v37, OS_LOG_TYPE_FAULT, v45, (uint8_t *)&v54, 0xCu);
    }
  }
LABEL_36:
  v36 = 0;
LABEL_46:

LABEL_47:
  return v36;
}

- (uint64_t)processReceivedPacketForIKESA:(_BYTE *)a1
{
  id v3;
  uint64_t v4;
  SEL v5;
  id v6;
  const char *v7;
  void *v8;
  id Property;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  SEL v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 1;
  v6 = objc_getProperty(a1, v5, 48, 1);
  v8 = v6;
  if ((a1[8] & 1) != 0 || !v6)
    goto LABEL_19;
  if (v3)
    Property = objc_getProperty(v3, v7, 96, 1);
  else
    Property = 0;
  v10 = Property;

  if (!v10)
  {
LABEL_18:
    v4 = 0;
    goto LABEL_19;
  }
  if (v3)
    v12 = objc_getProperty(v3, v11, 208, 1);
  else
    v12 = 0;
  v14 = v12;
  if (!v14)
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v22 = 136315138;
      v23 = "-[NEIKEv2EncryptedPayload decryptPayloadsUsingSecurityContext:]";
      _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "%s called with null securityContext", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_17;
  }
  v15 = objc_getProperty(v8, v13, 16, 1);
  objc_msgSend(v14, "decryptPayloadData:authenticatedHeaders:", v15, objc_getProperty(v8, v16, 24, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    ne_log_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, "Failed to decrypt packet", (uint8_t *)&v22, 2u);
    }

    v19 = 0;
LABEL_17:

    goto LABEL_18;
  }
  objc_setProperty_atomic(v8, v18, v17, 16);

  a1[8] = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v4 = -[NEIKEv2Packet processDecryptedPacketForIKESA:](a1, v3);
LABEL_19:

  return v4;
}

- (_QWORD)copyNotification:(void *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  _QWORD *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_getProperty(a1, a2, 64, 1);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        if (v8)
          v9 = (const char *)v8[3];
        else
          v9 = 0;
        if (v9 == a2)
        {
          v11 = v8;
          goto LABEL_15;
        }
        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v10;
    }
    while (v10);
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (uint64_t)hasNotification:(void *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_getProperty(a1, a2, 64, 1);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (v8)
          v8 = *(_QWORD *)(v8 + 24);
        if ((const char *)v8 == a2)
        {
          v9 = 1;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (uint64_t)hasErrors
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_getProperty(a1, a2, 64, 1);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (v6 && (unint64_t)(*(_QWORD *)(v6 + 24) - 1) < 0x3FFF)
        {
          v3 = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)addNotifyPayload:(void *)a1
{
  const char *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    if (objc_getProperty(a1, v3, 64, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 64, 1), "arrayByAddingObject:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    objc_setProperty_atomic(a1, v7, v6, 64);

  }
  else
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[NEIKEv2Packet addNotifyPayload:]";
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "%s called with null notifyPayload", buf, 0xCu);
    }

  }
  return v4 != 0;
}

- (BOOL)addNotification:(void *)a3 data:
{
  NEIKEv2NotifyPayload *v4;
  _BOOL8 v5;

  v4 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, a2, a3);
  v5 = -[NEIKEv2Packet addNotifyPayload:](a1, v4);

  return v5;
}

@end
