@implementation NEIKEv2ChildSA

- (id)description
{
  const char *v3;
  id v4;
  uint64_t childID;
  id Property;
  const char *v7;
  id v8;
  SEL v9;
  id v10;
  const char *v11;
  id v12;
  void *v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    childID = self->_childID;
    Property = objc_getProperty(self, v3, 56, 1);
    if (Property)
      Property = objc_getProperty(Property, v7, 80, 1);
    v8 = Property;
    v10 = objc_getProperty(self, v9, 56, 1);
    if (v10)
      v10 = objc_getProperty(v10, v11, 88, 1);
  }
  else
  {
    childID = 0;
    v8 = 0;
    v10 = 0;
  }
  v12 = v10;
  v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("ChildSA[%u, %@-%@]"), childID, v8, v12);

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[NEIKEv2ChildSA reset](self, a2);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2ChildSA;
  -[NEIKEv2ChildSA dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalProposalsWithoutKEM, 0);
  objc_storeStrong((id *)&self->_rekeyedRemoteSPI, 0);
  objc_storeStrong((id *)&self->_rekeyedSPI, 0);
  objc_storeStrong((id *)&self->_rekeyResponseProposal, 0);
  objc_storeStrong((id *)&self->_rekeyRequestProposals, 0);
  objc_storeStrong((id *)&self->_outgoingIntegrityKey, 0);
  objc_storeStrong((id *)&self->_outgoingEncryptionKey, 0);
  objc_storeStrong((id *)&self->_incomingIntegrityKey, 0);
  objc_storeStrong((id *)&self->_incomingEncryptionKey, 0);
  objc_storeStrong((id *)&self->_followupSharedSecrets, 0);
  objc_storeStrong((id *)&self->_additionalKENotify, 0);
  objc_storeStrong((id *)&self->_primarySharedSecret, 0);
  objc_storeStrong((id *)&self->_currentKEHandler, 0);
  objc_storeStrong((id *)&self->_remoteKeyExchangeData, 0);
  objc_storeStrong((id *)&self->_remotePreferredKEMProtocol, 0);
  objc_storeStrong((id *)&self->_remoteNonce, 0);
  objc_storeStrong((id *)&self->_localNonce, 0);
  objc_storeStrong((id *)&self->_remoteTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_localTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_chosenProposal, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_ikeSA);
}

- (void)reset
{
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  SEL v9;
  SEL v10;
  SEL v11;
  SEL v12;
  SEL v13;
  SEL v14;
  SEL v15;
  SEL v16;

  if (a1)
  {
    a1[9] = 1;
    objc_setProperty_atomic(a1, a2, 0, 56);
    objc_setProperty_atomic(a1, v3, 0, 208);
    a1[8] = 1;
    objc_setProperty_atomic(a1, v4, 0, 64);
    objc_setProperty_atomic(a1, v5, 0, 72);
    objc_setProperty_atomic(a1, v6, 0, 80);
    objc_setProperty_atomic(a1, v7, 0, 88);
    objc_setProperty_atomic(a1, v8, 0, 104);
    objc_setProperty_atomic(a1, v9, 0, 112);
    objc_setProperty_atomic(a1, v10, 0, 120);
    objc_setProperty_atomic(a1, v11, 0, 128);
    objc_setProperty_atomic(a1, v12, 0, 136);
    objc_setProperty_atomic(a1, v13, 0, 144);
    objc_setProperty_atomic(a1, v14, 0, 152);
    objc_setProperty_atomic(a1, v15, 0, 160);
    objc_setProperty_atomic(a1, v16, 0, 168);
  }
}

- (id)initWithConfiguration:(int)a3 childID:(void *)a4 ikeSA:
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  SEL v12;
  SEL v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  const char *v18;
  int v19;
  id Property;
  id v21;
  SEL v22;
  id v23;
  NSObject *v25;
  objc_super v26;
  uint8_t buf[4];
  _BYTE v28[14];
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_15;
  }
  if (v7)
  {
    v26.receiver = a1;
    v26.super_class = (Class)NEIKEv2ChildSA;
    v9 = -[NSObject init](&v26, sel_init);
    if (v9)
    {
      v11 = v9;
      objc_setProperty_atomic(v9, v10, v7, 48);
      *((_BYTE *)v11 + 9) = 1;
      objc_setProperty_atomic(v11, v12, 0, 56);
      *((_DWORD *)v11 + 4) = a3;
      *((_QWORD *)v11 + 4) = 3;
      objc_setProperty_atomic(v11, v13, 0, 40);
      *((_BYTE *)v11 + 8) = 0;
      objc_opt_self();
      v14 = nextDatabaseReqID_nextReqid;
      if ((unsigned __int16)(nextDatabaseReqID_nextReqid + 1) >> 14)
        v15 = 1;
      else
        v15 = nextDatabaseReqID_nextReqid + 1;
      nextDatabaseReqID_nextReqid = v15;
      *((_WORD *)v11 + 6) = v14;
      objc_opt_self();
      v16 = nextDatabaseReqID_nextReqid;
      if ((unsigned __int16)(nextDatabaseReqID_nextReqid + 1) >> 14)
        v17 = 1;
      else
        v17 = nextDatabaseReqID_nextReqid + 1;
      nextDatabaseReqID_nextReqid = v17;
      *((_WORD *)v11 + 7) = v16;
      objc_storeWeak((id *)v11 + 3, v8);
      ne_log_large_obj();
      a1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_INFO))
      {
        v19 = *((_DWORD *)v11 + 4);
        if (v8)
          Property = objc_getProperty(v8, v18, 32, 1);
        else
          Property = 0;
        v21 = Property;
        v23 = objc_getProperty(v11, v22, 48, 1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v28 = v19;
        *(_WORD *)&v28[4] = 2112;
        *(_QWORD *)&v28[6] = v21;
        v29 = 2112;
        v30 = v23;
        _os_log_impl(&dword_19BD16000, a1, OS_LOG_TYPE_INFO, "Created Child SA %u (off of %@) with configuration %@", buf, 0x1Cu);

      }
      goto LABEL_14;
    }
    ne_log_obj();
    a1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v28 = "-[NEIKEv2ChildSA initWithConfiguration:childID:ikeSA:]";
      _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, "%s called with null configuration", buf, 0xCu);
    }

  }
  v11 = 0;
LABEL_14:

LABEL_15:
  return v11;
}

- (void)setState:(void *)a3 error:
{
  const char *v5;
  unint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *SessionStateString;
  SEL v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  __CFString *v16;
  __CFString *v17;
  SEL v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  SEL v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  id Property;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a1)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (v6 | (unint64_t)objc_getProperty((id)a1, v5, 40, 1)) != 0;
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == a2)
    {
      if (v8)
      {
        if (v10)
        {
          SessionStateString = NEIKEv2CreateSessionStateString(*(_QWORD *)(a1 + 32));
          v23 = 138413058;
          v24 = a1;
          v25 = 2112;
          v26 = SessionStateString;
          v27 = 2112;
          Property = objc_getProperty((id)a1, v12, 40, 1);
          v29 = 2112;
          v30 = v6;
          v13 = "%@ not changing state %@ nor error %@ -> %@";
          v14 = v9;
          v15 = 42;
LABEL_11:
          _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v15);

        }
      }
      else if (v10)
      {
        SessionStateString = NEIKEv2CreateSessionStateString(*(_QWORD *)(a1 + 32));
        v23 = 138412546;
        v24 = a1;
        v25 = 2112;
        v26 = SessionStateString;
        v13 = "%@ not changing state %@ nor error";
        v14 = v9;
        v15 = 22;
        goto LABEL_11;
      }

      goto LABEL_17;
    }
    if (v8)
    {
      if (v10)
      {
        v16 = NEIKEv2CreateSessionStateString(*(_QWORD *)(a1 + 32));
        v17 = NEIKEv2CreateSessionStateString(a2);
        v23 = 138413314;
        v24 = a1;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        Property = v17;
        v29 = 2112;
        v30 = (unint64_t)objc_getProperty((id)a1, v18, 40, 1);
        v31 = 2112;
        v32 = v6;
        v19 = "%@ state %@ -> %@ error %@ -> %@";
        v20 = v9;
        v21 = 52;
LABEL_15:
        _os_log_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);

      }
    }
    else if (v10)
    {
      v16 = NEIKEv2CreateSessionStateString(*(_QWORD *)(a1 + 32));
      v17 = NEIKEv2CreateSessionStateString(a2);
      v23 = 138412802;
      v24 = a1;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      Property = v17;
      v19 = "%@ state %@ -> %@";
      v20 = v9;
      v21 = 32;
      goto LABEL_15;
    }

    *(_QWORD *)(a1 + 32) = a2;
    objc_setProperty_atomic((id)a1, v22, (id)v6, 40);
    *(_BYTE *)(a1 + 8) = 1;
  }
LABEL_17:

}

- (void)setConfigProposalsWithoutKEM:(id)self
{
  if (self)
    objc_setProperty_atomic(self, a2, 0, 208);

}

- (id)configProposalsWithoutKEM
{
  void *v2;
  const char *v3;
  id v4;
  SEL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE *v11;
  char v12;
  void *v13;
  void *v14;
  SEL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    if (!objc_getProperty(a1, a2, 208, 1))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(objc_getProperty(v2, v5, 48, 1), "proposals", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            v11 = -[NEIKEv2ChildSAProposal copyWithoutKEM](*(void **)(*((_QWORD *)&v17 + 1) + 8 * i));
            v12 = objc_msgSend(v4, "count");
            if (v11)
              v11[8] = v12 + 1;
            objc_msgSend(v4, "addObject:", v11);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

      if (objc_msgSend(v4, "count"))
      {
        objc_msgSend(v4, "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_setProperty_atomic(v2, v15, v14, 208);

      }
    }
    a1 = objc_getProperty(v2, v3, 208, 1);
  }
  return a1;
}

- (uint64_t)shouldGenerateNewDHKeys
{
  uint64_t v2;
  const char *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SEL v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  _BYTE v22[128];
  uint64_t v23;

  v2 = (uint64_t)self;
  v23 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v4 = objc_getProperty(self, a2, 184, 1);
    if (v4)
      goto LABEL_3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = objc_getProperty((id)v2, v3, 176, 1);
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v4);
          -[NEIKEv2IKESAProposal kemProtocol](*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "method", (_QWORD)v16);

          if (v12)
          {
            v2 = 1;
            goto LABEL_18;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v8)
          continue;
        break;
      }
    }

    v4 = objc_getProperty((id)v2, v13, 56, 1);
    if (v4
      || (objc_msgSend(objc_getProperty((id)v2, v3, 48, 1), "proposals"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "firstObject"),
          v4 = objc_claimAutoreleasedReturnValue(),
          v14,
          v4))
    {
LABEL_3:
      -[NEIKEv2IKESAProposal kemProtocol](v4, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v5, "method") != 0;

    }
    else
    {
      ne_log_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[NEIKEv2ChildSA shouldGenerateNewDHKeys]";
        _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "%s called with null proposal", buf, 0xCu);
      }
      v2 = 0;
    }
LABEL_18:

  }
  return v2;
}

- (BOOL)isRekeying
{
  uint64_t v3;
  const char *v4;

  v3 = 1;
  if (!objc_getProperty(a1, a2, 176, 1))
    return objc_getProperty(a1, v4, 184, 1) != 0;
  return v3;
}

- (_BYTE)configuredInitiatorTrafficSelectors
{
  char v2;
  id Property;

  if (a1)
  {
    v2 = a1[9];
    Property = objc_getProperty(a1, a2, 48, 1);
    if ((v2 & 1) != 0)
      objc_msgSend(Property, "localTrafficSelectors");
    else
      objc_msgSend(Property, "remoteTrafficSelectors");
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_BYTE)configuredResponderTrafficSelectors
{
  char v2;
  id Property;

  if (a1)
  {
    v2 = a1[9];
    Property = objc_getProperty(a1, a2, 48, 1);
    if ((v2 & 1) != 0)
      objc_msgSend(Property, "remoteTrafficSelectors");
    else
      objc_msgSend(Property, "localTrafficSelectors");
    a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setInitiatorTrafficSelectors:(_BYTE *)a1
{
  char *v3;
  ptrdiff_t v4;
  char *v5;

  v3 = a2;
  if (a1)
  {
    if ((a1[9] & 1) != 0)
      v4 = 64;
    else
      v4 = 72;
    v5 = v3;
    objc_setProperty_atomic(a1, v3, v3, v4);
    v3 = v5;
  }

}

- (_BYTE)initiatorTrafficSelectors
{
  ptrdiff_t v2;

  if (a1)
  {
    if ((a1[9] & 1) != 0)
      v2 = 64;
    else
      v2 = 72;
    a1 = objc_getProperty(a1, a2, v2, 1);
  }
  return a1;
}

- (void)setResponderTrafficSelectors:(_BYTE *)a1
{
  char *v3;
  ptrdiff_t v4;
  char *v5;

  v3 = a2;
  if (a1)
  {
    if ((a1[9] & 1) != 0)
      v4 = 72;
    else
      v4 = 64;
    v5 = v3;
    objc_setProperty_atomic(a1, v3, v3, v4);
    v3 = v5;
  }

}

- (_BYTE)responderTrafficSelectors
{
  ptrdiff_t v2;

  if (a1)
  {
    if ((a1[9] & 1) != 0)
      v2 = 72;
    else
      v2 = 64;
    a1 = objc_getProperty(a1, a2, v2, 1);
  }
  return a1;
}

- (id)preferredKEMProtocol
{
  const char *v3;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  SEL v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_getProperty(a1, a2, 96, 1))
    return objc_getProperty(a1, v3, 96, 1);
  v6 = objc_getProperty(a1, v3, 184, 1);
  if (v6)
    goto LABEL_4;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_getProperty(a1, v5, 176, 1);
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(NSObject **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NEIKEv2IKESAProposal kemProtocol](v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "method", (_QWORD)v18);

        if (v14)
        {
          v7 = v12;
          goto LABEL_19;
        }
      }
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v9)
        continue;
      break;
    }
  }

  v6 = objc_getProperty(a1, v15, 56, 1);
  if (v6
    || (objc_msgSend(objc_getProperty(a1, v5, 48, 1), "proposals"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "firstObject"),
        v6 = objc_claimAutoreleasedReturnValue(),
        v16,
        v6))
  {
LABEL_4:
    v7 = v6;
LABEL_19:
    -[NEIKEv2IKESAProposal kemProtocol](v7, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[NEIKEv2ChildSA preferredKEMProtocol]";
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null proposal", buf, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (id)ikeSA
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  return WeakRetained;
}

- (uint64_t)generateLocalValuesForKEMProtocol:(void *)a1
{
  const char *v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  SEL v9;
  SEL v10;
  id v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = objc_getProperty(a1, v3, 112, 1);

    if (v5)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        v13 = 136315138;
        v14 = "-[NEIKEv2ChildSA(Crypto) generateLocalValuesForKEMProtocol:]";
        _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null !self.currentKEHandler", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v8 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:]((uint64_t)NEIKEv2KeyExchangeHandler, objc_msgSend(v4, "method"));
      objc_setProperty_atomic(a1, v9, v8, 112);

      v7 = 1;
      v11 = objc_getProperty(a1, v10, 112, 1);

      if (v11)
        goto LABEL_8;
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = (const char *)v4;
        _os_log_error_impl(&dword_19BD16000, v6, OS_LOG_TYPE_ERROR, "Failed to get handler for KE method %@", (uint8_t *)&v13, 0xCu);
      }
    }

  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (uint64_t)generateInitialValues
{
  void *v1;
  id WeakRetained;
  const char *v3;
  void *v4;
  id v5;
  unsigned int v6;
  NSObject *v7;
  SEL v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 3);
    v4 = WeakRetained;
    if (WeakRetained)
      WeakRetained = objc_getProperty(WeakRetained, v3, 80, 1);
    v5 = WeakRetained;
    v6 = objc_msgSend(v5, "nonceSize");

    if (v6 <= 0xF)
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v15 = 67109120;
        LODWORD(v16) = v6;
        _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "Invalid nonce size %u", (uint8_t *)&v15, 8u);
      }
    }
    else
    {
      v7 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v6);
      objc_setProperty_atomic(v1, v8, v7, 80);

      if (!-[NEIKEv2ChildSA shouldGenerateNewDHKeys](v1, v9))
        return 1;
      -[NEIKEv2ChildSA preferredKEMProtocol](v1, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && -[NSObject method](v11, "method") != 11001 && -[NSObject method](v12, "method") != 11002)
      {
        v1 = (void *)-[NEIKEv2ChildSA generateLocalValuesForKEMProtocol:](v1, v12);
LABEL_13:

        return (uint64_t)v1;
      }
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = 138412290;
        v16 = v12;
        _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "KE method %@ is not Diffie-Hellman", (uint8_t *)&v15, 0xCu);
      }

    }
    v1 = 0;
    goto LABEL_13;
  }
  return (uint64_t)v1;
}

- (uint64_t)processCurrentKeyExchange
{
  id v2;
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  SEL v9;
  id Property;
  id v11;
  uint64_t v12;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v2 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (self)
    self = objc_getProperty(self, a2, 112, 1);
  v3 = self;

  if (!v3)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_11:

      return 0;
    }
    v16 = 136315138;
    v17 = "-[NEIKEv2ChildSA(Crypto) processCurrentKeyExchange]";
    v15 = "%s called with null self.currentKEHandler";
LABEL_14:
    _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_11;
  }
  objc_getProperty(v2, v4, 104, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    v16 = 136315138;
    v17 = "-[NEIKEv2ChildSA(Crypto) processCurrentKeyExchange]";
    v15 = "%s called with null self.remoteKeyExchangeData";
    goto LABEL_14;
  }
  objc_getProperty(v2, v6, 104, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_setProperty_atomic(v2, v7, 0, 104);
    Property = objc_getProperty(v2, v9, 112, 1);
  }
  else
  {
    Property = 0;
  }
  v11 = Property;
  v12 = objc_msgSend(v11, "processPeerPayload:", v8);

  return v12;
}

- (uint64_t)processPrimaryKeyExchange
{
  void *v2;
  const char *v3;
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  SEL v8;

  if (result)
  {
    v2 = (void *)result;
    result = -[NEIKEv2ChildSA processCurrentKeyExchange]((id)result, a2);
    if ((_DWORD)result)
    {
      v4 = objc_getProperty(v2, v3, 112, 1);
      v6 = v4;
      if (v4)
        v7 = (void *)*((_QWORD *)v4 + 3);
      else
        v7 = 0;
      objc_setProperty_atomic(v2, v5, v7, 120);

      objc_setProperty_atomic(v2, v8, 0, 112);
      return 1;
    }
  }
  return result;
}

- (uint64_t)generateAllValues
{
  _BYTE *WeakRetained;
  const char *v3;
  _BYTE *v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  ptrdiff_t v10;
  const char *v11;
  id v12;
  ptrdiff_t v13;
  id v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  SEL v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  CFIndex v39;
  CFMutableDataRef v40;
  CFMutableDataRef v41;
  SEL v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  SEL v48;
  unsigned int Hkdf;
  const char *v50;
  const char *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  const char *v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
  const char *v59;
  __CFData *v60;
  id v61;
  const char *v62;
  void *v63;
  unsigned int v64;
  const UInt8 *v65;
  const char *v66;
  const __CFData *v67;
  ptrdiff_t v68;
  const char *v69;
  ptrdiff_t v70;
  id v71;
  uint64_t v72;
  unsigned int v73;
  const char *v74;
  const __CFData *v75;
  ptrdiff_t v76;
  const char *v77;
  ptrdiff_t v78;
  id v79;
  const char *v80;
  const __CFData *v81;
  ptrdiff_t v82;
  const char *v83;
  ptrdiff_t v84;
  id v85;
  const char *v86;
  const __CFData *v87;
  ptrdiff_t v88;
  const char *v89;
  ptrdiff_t v90;
  id v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t v97;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  unsigned int v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  uint64_t v106;
  unsigned int v107;
  unsigned int v108;
  NSObject *v109;
  void *v110;
  _BYTE *v111;
  void *v112;
  __CFData *v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  unsigned __int8 v123;
  uint8_t buf[4];
  unsigned int v125;
  _BYTE v126[128];
  uint8_t v127[128];
  uint8_t v128[24];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(_QWORD *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", v128, 0xCu);
    }
    v97 = 0;
    goto LABEL_97;
  }
  v6 = objc_getProperty(WeakRetained, v3, 96, 1);
  if (!v6)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(_QWORD *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null ikeProposal", v128, 0xCu);
    }
    goto LABEL_110;
  }
  v7 = objc_getProperty((id)a1, v5, 56, 1);
  if (!v7)
  {
    ne_log_obj();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 136315138;
      *(_QWORD *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
      _os_log_fault_impl(&dword_19BD16000, v100, OS_LOG_TYPE_FAULT, "%s called with null childProposal", v128, 0xCu);
    }

    v9 = 0;
LABEL_110:
    v97 = 0;
    goto LABEL_96;
  }
  v9 = v7;
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
    v10 = 80;
  else
    v10 = 88;
  v12 = objc_getProperty((id)a1, v8, v10, 1);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
    v13 = 88;
  else
    v13 = 80;
  v14 = objc_getProperty((id)a1, v11, v13, 1);
  v16 = v14;
  if (v12 && v14)
  {
    v17 = v12;
  }
  else
  {
    -[NEIKEv2IKESA initiatorNonce](v4, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NEIKEv2IKESA initiatorNonce](v4, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      ne_log_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v128 = 136315138;
        *(_QWORD *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
        _os_log_fault_impl(&dword_19BD16000, v35, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.initiatorNonce", v128, 0xCu);
      }

      v123 = 0;
      goto LABEL_95;
    }
    -[NEIKEv2IKESA responderNonce](v4, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    -[NEIKEv2IKESA responderNonce](v4, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      ne_log_obj();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v128 = 136315138;
        *(_QWORD *)&v128[4] = "-[NEIKEv2ChildSA(Crypto) generateAllValues]";
        _os_log_fault_impl(&dword_19BD16000, v95, OS_LOG_TYPE_FAULT, "%s called with null ikeSA.responderNonce", v128, 0xCu);
      }

      v123 = 0;
      v16 = (void *)v21;
      goto LABEL_95;
    }
    v16 = (void *)v21;
  }
  objc_getProperty((id)a1, v15, 120, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v17;
  v111 = v4;
  if (v112)
  {
    v25 = v16;
    v26 = v9;
    objc_setProperty_atomic((id)a1, v24, 0, 120);
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v28 = objc_getProperty((id)a1, v27, 136, 1);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v120 != v32)
            objc_enumerationMutation(v28);
          v31 += objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "length");
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
      }
      while (v30);
    }
    else
    {
      v31 = 0;
    }
    v34 = v6;

    v9 = v26;
    v17 = v114;
    v16 = v25;
  }
  else
  {
    v34 = v6;
    v31 = 0;
  }
  v36 = objc_msgSend(v17, "length");
  v37 = v16;
  v38 = objc_msgSend(v16, "length");
  v39 = v36 + objc_msgSend(v112, "length") + v31 + v38;
  v40 = +[NSMutableData mutableSensitiveDataWithMaxCapacity:](MEMORY[0x1E0C99DF0], v39);
  if (!v40)
  {
    ne_log_obj();
    v101 = objc_claimAutoreleasedReturnValue();
    v6 = v34;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v128 = 134217984;
      *(_QWORD *)&v128[4] = v39;
      _os_log_fault_impl(&dword_19BD16000, v101, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataWithMaxCapacity:%zu] failed", v128, 0xCu);
    }

    v41 = 0;
    v123 = 0;
    v16 = v37;
    v4 = v111;
    v92 = v112;
    goto LABEL_94;
  }
  v41 = v40;
  -[__CFData appendData:](v40, "appendData:", v112);
  -[__CFData appendData:](v41, "appendData:", v17);
  v110 = v37;
  -[__CFData appendData:](v41, "appendData:", v37);
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v43 = objc_getProperty((id)a1, v42, 136, 1);
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
  v6 = v34;
  v4 = v111;
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v116 != v46)
          objc_enumerationMutation(v43);
        -[__CFData appendData:](v41, "appendData:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j));
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
    }
    while (v45);
  }

  objc_setProperty_atomic((id)a1, v48, 0, 136);
  *(_QWORD *)v128 = 0;
  -[__CFData bytes](v41, "bytes");
  -[__CFData length](v41, "length");
  Hkdf = CCKDFParametersCreateHkdf();
  if (Hkdf)
  {
    v102 = Hkdf;
    ne_log_obj();
    v103 = objc_claimAutoreleasedReturnValue();
    v17 = v114;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = v102;
      _os_log_fault_impl(&dword_19BD16000, v103, OS_LOG_TYPE_FAULT, "CCKDFParametersCreateHkdf failed %d", buf, 8u);
    }

    v123 = 0;
    v16 = v110;
    v92 = v112;
    goto LABEL_94;
  }
  -[NEIKEv2ChildSAProposal integrityProtocol](v9, v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v114;
  if (v52)
  {
    -[NEIKEv2ChildSAProposal integrityProtocol](v9, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[NEIKEv2IntegrityProtocol keyLength]((uint64_t)v53);

  }
  else
  {
    v54 = 0;
  }

  -[NEIKEv2ChildSAProposal encryptionProtocol](v9, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[NEIKEv2EncryptionProtocol keyLength]((uint64_t)v56);

  v107 = v54;
  v58 = v57 + v54;
  v60 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], (2 * v58));
  if (!v60)
  {
    ne_log_obj();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = 2 * v58;
      _os_log_fault_impl(&dword_19BD16000, v104, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%u] failed", buf, 8u);
    }

    v123 = 0;
    v16 = v110;
    v92 = v112;
    goto LABEL_93;
  }
  v106 = v58;
  v108 = v57;
  v109 = v9;
  v61 = objc_getProperty(v111, v59, 216, 1);
  -[NEIKEv2IKESAProposal prfProtocol](v6, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2PRFProtocol ccDigest](v63);
  objc_msgSend(v61, "bytes");
  objc_msgSend(v61, "length");
  -[__CFData mutableBytes](v60, "mutableBytes");
  -[__CFData length](v60, "length");
  v64 = CCHKDFExpand();

  CCKDFParametersDestroy();
  *(_QWORD *)v128 = 0;
  if (v64)
  {
    ne_log_obj();
    v105 = objc_claimAutoreleasedReturnValue();
    v92 = v112;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = v64;
      _os_log_fault_impl(&dword_19BD16000, v105, OS_LOG_TYPE_FAULT, "CCHKDFExpand failed %d", buf, 8u);
    }

    v123 = 0;
    v16 = v110;
    v4 = v111;
    goto LABEL_92;
  }

  v113 = v60;
  v65 = (const UInt8 *)-[__CFData bytes](v60, "bytes");
  v67 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], v65, v108);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
    v68 = 160;
  else
    v68 = 144;
  objc_setProperty_atomic((id)a1, v66, v67, v68);

  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
    v70 = 160;
  else
    v70 = 144;
  v71 = objc_getProperty((id)a1, v69, v70, 1);

  if (!v71)
  {
    ne_log_obj();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = v108;
      _os_log_fault_impl(&dword_19BD16000, v93, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

    goto LABEL_90;
  }
  v72 = v108;
  v73 = v108;
  if (v107)
  {
    v75 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v65[v108], v107);
    if ((*(_BYTE *)(a1 + 9) & 1) != 0)
      v76 = 168;
    else
      v76 = 152;
    objc_setProperty_atomic((id)a1, v74, v75, v76);

    if ((*(_BYTE *)(a1 + 9) & 1) != 0)
      v78 = 168;
    else
      v78 = 152;
    v79 = objc_getProperty((id)a1, v77, v78, 1);

    if (v79)
    {
      v72 = v106;
      v73 = v106;
      goto LABEL_62;
    }
    ne_log_obj();
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = v107;
      _os_log_fault_impl(&dword_19BD16000, v96, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

LABEL_90:
    v41 = 0;
    v92 = 0;
    v61 = 0;
    v123 = 0;
    v4 = v111;
    goto LABEL_91;
  }
LABEL_62:
  v81 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v65[v72], v108);
  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
    v82 = 144;
  else
    v82 = 160;
  objc_setProperty_atomic((id)a1, v80, v81, v82);

  if ((*(_BYTE *)(a1 + 9) & 1) != 0)
    v84 = 144;
  else
    v84 = 160;
  v85 = objc_getProperty((id)a1, v83, v84, 1);

  if (!v85)
  {
    ne_log_obj();
    v94 = objc_claimAutoreleasedReturnValue();
    v4 = v111;
    v60 = v113;
    v9 = v109;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = v108;
      _os_log_fault_impl(&dword_19BD16000, v94, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

    v41 = 0;
    v92 = 0;
    v61 = 0;
    v123 = 0;
    v16 = v110;
    goto LABEL_92;
  }
  v4 = v111;
  if (!v107)
    goto LABEL_77;
  v87 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], &v65[v73 + v108], v107);
  v88 = (*(_BYTE *)(a1 + 9) & 1) != 0 ? 152 : 168;
  objc_setProperty_atomic((id)a1, v86, v87, v88);

  v90 = (*(_BYTE *)(a1 + 9) & 1) != 0 ? 152 : 168;
  v91 = objc_getProperty((id)a1, v89, v90, 1);

  if (!v91)
  {
    ne_log_obj();
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v125 = v107;
      _os_log_fault_impl(&dword_19BD16000, v99, OS_LOG_TYPE_FAULT, "[NESensitiveData sensitiveDataWithBytes:length:%u] failed", buf, 8u);
    }

    v41 = 0;
    v92 = 0;
    v61 = 0;
    v123 = 0;
  }
  else
  {
LABEL_77:
    v41 = 0;
    v92 = 0;
    v61 = 0;
    v123 = 1;
  }
LABEL_91:
  v9 = v109;
  v16 = v110;
  v60 = v113;
LABEL_92:

  v17 = v114;
LABEL_93:

LABEL_94:
LABEL_95:

  v97 = v123;
LABEL_96:

LABEL_97:
  return v97;
}

@end
