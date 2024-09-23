@implementation NEIKEv2InformationalPacket

+ (NSObject)createDeleteResponse:(void *)a3 child:
{
  id v4;
  id v5;
  NSObject *v6;
  NEIKEv2DeletePayload *v7;
  NSObject *p_super;
  const char *v9;
  void *v10;
  void *v11;
  SEL v12;
  NSObject *v13;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v5)
  {
    v6 = -[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2InformationalPacket alloc], v4);
    if (v6)
    {
      v7 = objc_alloc_init(NEIKEv2DeletePayload);
      p_super = &v7->super.super;
      if (v7)
        v7->_protocol = 3;
      v17 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (p_super)
        objc_setProperty_atomic(p_super, v9, v10, 32);

      if ((-[NEIKEv2Payload isValid]((uint64_t)p_super) & 1) != 0)
      {
        v16 = p_super;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v6, v12, v11, 88);

        v13 = v6;
LABEL_12:

        goto LABEL_13;
      }
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[NEIKEv2InformationalPacket(Exchange) createDeleteResponse:child:]";
        _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
      }

    }
    else
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
      }
    }
    v13 = 0;
    goto LABEL_12;
  }
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[NEIKEv2InformationalPacket(Exchange) createDeleteResponse:child:]";
    _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null childSPI", buf, 0xCu);
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (uint64_t)validateDeleteChild:(uint64_t)a1
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD *v12;
  id v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (v3)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_getProperty((id)a1, v4, 88, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v9 = v7;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (v12)
            {
              if (v12[3] == 3)
              {
                v13 = objc_getProperty(v12, v8, 32, 1);
                v14 = objc_msgSend(v13, "containsObject:", v5, (_QWORD)v16);

                if (v14)
                {

                  a1 = 1;
                  goto LABEL_16;
                }
              }
            }
          }
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }

      a1 = 0;
    }
    else
    {
      a1 = -[NEIKEv2InformationalPacket isDeleteChild]((void *)a1, v4);
    }
  }
LABEL_16:

  return a1;
}

+ (id)createInformationalResponse:(void *)a3 ikeSA:
{
  id v4;
  _BYTE *v5;
  const char *v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  SEL v19;
  id v20;
  void *v21;
  NEIKEv2NotifyPayload *v22;
  BOOL v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  const char *v39;
  NSObject *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v7 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)[NEIKEv2InformationalPacket alloc], v4);
  if (!v7)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed", buf, 2u);
    }
    goto LABEL_41;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  if (v4)
    Property = objc_getProperty(v4, v6, 64, 1);
  else
    Property = 0;
  v9 = Property;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (v15)
          v15 = *(_QWORD *)(v15 + 24);
        v12 |= (v15 & 0xFFFE) == 16388;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  if (v5 && (v5[18] & 1) != 0 && -[NEIKEv2Packet hasNotification:](v4, (const char *)0xA08D))
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v42 = (void *)objc_msgSend(v4, "copyShortDescription", (_QWORD)v43);
      *(_DWORD *)buf = 138412290;
      v48 = v42;
      _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "%@ received sending notify payload request", buf, 0xCu);

    }
    v20 = objc_getProperty(v5, v19, 88, 1);
    objc_msgSend(v20, "IMEI");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataUsingEncoding:", 4);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v22 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]((uint64_t)NEIKEv2NotifyPayload, 0xA08DuLL, v16);
      v23 = -[NEIKEv2Packet addNotifyPayload:](v7, v22);

      if (!v23)
      {
        ne_log_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v39 = "[packet addNotifyPayload:notifyPayload] failed";
          goto LABEL_44;
        }
LABEL_40:

LABEL_41:
        v38 = 0;
        goto LABEL_42;
      }
    }

  }
  if ((v12 & 1) != 0)
  {
    -[NEIKEv2IKESA initiatorSPI](v5, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESA responderSPI](v5, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v28 = objc_getProperty(v5, v26, 64, 1);
    else
      v28 = 0;
    v29 = v28;
    v16 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v24, v27, v29);

    if (-[NEIKEv2Packet addNotification:data:](v7, 0x4004uLL, v16))
    {
      -[NEIKEv2IKESA initiatorSPI](v5, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2IKESA responderSPI](v5, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v35 = objc_getProperty(v5, v33, 72, 1);
      else
        v35 = 0;
      v36 = v35;
      v37 = +[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v31, v34, v36);

      if (-[NEIKEv2Packet addNotification:data:](v7, 0x4005uLL, v37))
      {

        goto LABEL_33;
      }
      ne_log_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19BD16000, v40, OS_LOG_TYPE_FAULT, "[packet addNotification:NEIKEv2NotifyTypeNATDetectionDestinationIP] failed", buf, 2u);
      }

      goto LABEL_40;
    }
    ne_log_obj();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v39 = "[packet addNotification:NEIKEv2NotifyTypeNATDetectionSourceIP] failed";
LABEL_44:
      _os_log_fault_impl(&dword_19BD16000, v37, OS_LOG_TYPE_FAULT, v39, buf, 2u);
      goto LABEL_40;
    }
    goto LABEL_40;
  }
LABEL_33:
  v38 = v7;
LABEL_42:

  return v38;
}

- (uint64_t)validateUpdateAddresses:(void *)a1
{
  _BYTE *v3;
  const char *v4;
  _BYTE *v5;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const __CFString *v12;
  _QWORD *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  SEL v19;
  id v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  SEL v26;
  id v27;
  void *v28;
  SEL v29;
  id v30;
  NSObject *v31;
  char *v32;
  const char *v33;
  __CFString *v34;
  NSObject *v35;
  uint64_t v36;
  SEL v37;
  id v38;
  char v39;
  NSObject *v40;
  char *v41;
  const char *v42;
  SEL v43;
  id v44;
  const char *v45;
  const char *v46;
  id v47;
  char v48;
  id v49;
  SEL v50;
  char *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  __CFString *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (!a1)
  {
    v36 = 0;
    goto LABEL_39;
  }
  if (!v3)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[NEIKEv2InformationalPacket(Exchange) validateUpdateAddresses:]";
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
    }
LABEL_22:
    v36 = 0;
    goto LABEL_38;
  }
  if (-[NEIKEv2Packet hasErrors](a1, v4))
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v7 = objc_getProperty(a1, v6, 64, 1);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v54 != v10)
            objc_enumerationMutation(v7);
          v12 = *(const __CFString **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (v12 && (unint64_t)(v12->length - 1) <= 0x3FFE)
          {
            v34 = (__CFString *)-[NEIKEv2NotifyPayload copyError](v12);
            ne_log_obj();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v52 = (char *)objc_msgSend(a1, "copyShortDescription", (_QWORD)v53);
              *(_DWORD *)buf = 138412546;
              v58 = v52;
              v59 = 2112;
              v60 = v34;
              _os_log_error_impl(&dword_19BD16000, v35, OS_LOG_TYPE_ERROR, "%@ Update addresses received notify error %@", buf, 0x16u);

            }
            -[NEIKEv2IKESA setState:error:]((uint64_t)v5, 3uLL, v34);

            goto LABEL_22;
          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v7 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4004);
  v13 = -[NEIKEv2Packet copyNotification:](a1, (const char *)0x4005);
  v15 = v13;
  if (v7 && v13)
  {
    -[NEIKEv2IKESA initiatorSPI](v5, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESA responderSPI](v5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_getProperty(v5, v19, 72, 1);
    v21 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v16, v18, v20);

    -[NEIKEv2IKESA initiatorSPI](v5, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2IKESA responderSPI](v5, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v27 = objc_getProperty(v5, v26, 64, 1);
    v28 = (void *)+[NEIKEv2Crypto createNATDetectionHashForInitiatorSPI:responderSPI:address:]((uint64_t)NEIKEv2Crypto, v23, (void *)v25, v27);

    v30 = objc_getProperty(v7, v29, 32, 1);
    LOBYTE(v25) = objc_msgSend(v21, "isEqualToData:", v30);

    if ((v25 & 1) != 0)
    {
      v5[15] = 0;
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v32 = (char *)objc_msgSend(a1, "copyShortDescription");
      *(_DWORD *)buf = 138412290;
      v58 = v32;
      v33 = "%@ Detected no incoming NAT";
    }
    else
    {
      v5[15] = 1;
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      v32 = (char *)objc_msgSend(a1, "copyShortDescription");
      *(_DWORD *)buf = 138412290;
      v58 = v32;
      v33 = "%@ Detected incoming NAT";
    }
    _os_log_debug_impl(&dword_19BD16000, v31, OS_LOG_TYPE_DEBUG, v33, buf, 0xCu);

LABEL_24:
    v38 = objc_getProperty(v15, v37, 32, 1);
    v39 = objc_msgSend(v28, "isEqualToData:", v38);

    if ((v39 & 1) != 0)
    {
      v5[14] = 0;
      ne_log_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      v41 = (char *)objc_msgSend(a1, "copyShortDescription");
      *(_DWORD *)buf = 138412290;
      v58 = v41;
      v42 = "%@ Detected no outgoing NAT";
    }
    else
    {
      v5[14] = 1;
      ne_log_obj();
      v40 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        goto LABEL_28;
      v41 = (char *)objc_msgSend(a1, "copyShortDescription");
      *(_DWORD *)buf = 138412290;
      v58 = v41;
      v42 = "%@ Detected outgoing NAT";
    }
    _os_log_debug_impl(&dword_19BD16000, v40, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);

LABEL_28:
    v44 = objc_getProperty(v5, v43, 80, 1);
    if (objc_msgSend(v44, "disableSwitchToNATTPorts"))
    {

    }
    else
    {
      v47 = objc_getProperty(v5, v45, 88, 1);
      if ((objc_msgSend(v47, "negotiateMOBIKE") & 1) != 0 || (v5[15] & 1) != 0)
      {

      }
      else
      {
        v48 = v5[14];

        if ((v48 & 1) == 0)
          goto LABEL_36;
      }
      -[NEIKEv2IKESA switchToNATTraversalPorts]((uint64_t)v5, v46);
    }
LABEL_36:
    v49 = objc_getProperty(v15, v46, 32, 1);
    objc_setProperty_atomic(v5, v50, v49, 496);

  }
  v36 = 1;
LABEL_38:

LABEL_39:
  return v36;
}

- (void)gatherPayloads
{
  const char *v3;
  SEL v4;
  SEL v5;
  const char *v6;
  SEL v7;
  id newValue;

  newValue = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v3, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 88, 1));
    if (objc_getProperty(self, v5, 96, 1))
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v6, 96, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v6, 56, 1));
    objc_setProperty_atomic(self, v7, newValue, 80);
  }
  else
  {
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
    objc_msgSend(newValue, "addObjectsFromArray:", 0);
  }

}

- (void)filloutPayloads
{
  NEIKEv2InformationalPacket *v2;
  NEIKEv2InformationalPacket *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NEIKEv2InformationalPacket *v18;
  void *v19;
  ptrdiff_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = self;
  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (self)
    self = (NEIKEv2InformationalPacket *)objc_getProperty(self, a2, 80, 1);
  v3 = self;
  v4 = -[NEIKEv2InformationalPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v10, 64, 1))
            {
              objc_msgSend(objc_getProperty(v2, v11, 64, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }
            v27 = v8;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1, (_QWORD)v21);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
            {
LABEL_24:
              v18 = v2;
              v19 = v13;
              v20 = 64;
              goto LABEL_29;
            }
LABEL_30:

            goto LABEL_31;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v14, 88, 1))
            {
              objc_msgSend(objc_getProperty(v2, v15, 88, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v26 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1, (_QWORD)v21);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2)
                goto LABEL_30;
            }
            v20 = 88;
            v18 = v2;
            v19 = v13;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_31;
            if (v2 && objc_getProperty(v2, v16, 56, 1))
            {
              objc_msgSend(objc_getProperty(v2, v17, 56, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1, (_QWORD)v21);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2)
                goto LABEL_30;
            }
            v18 = v2;
            v19 = v13;
            v20 = 56;
          }
LABEL_29:
          objc_setProperty_atomic(v18, v12, v19, v20);
          goto LABEL_30;
        }
        if (v2)
          objc_setProperty_atomic(v2, v9, v8, 96);
LABEL_31:
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NEIKEv2InformationalPacket countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("INFORMATIONAL");
}

+ (unint64_t)exchangeType
{
  return 37;
}

- (uint64_t)isDeleteIKE
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
  v2 = objc_getProperty(a1, a2, 88, 1);
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
        if (v6 && *(_QWORD *)(v6 + 24) == 1)
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

- (uint64_t)isMOBIKE
{
  if ((-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4011) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400F) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400D) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400E) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[NEIKEv2Packet hasNotification:](a1, (const char *)0x4010);
  }
}

- (uint64_t)isDeleteChild
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
  v2 = objc_getProperty(a1, a2, 88, 1);
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
        if (v6 && *(_QWORD *)(v6 + 24) == 3)
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

@end
