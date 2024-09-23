@implementation CUPairingXPCConnection

- (void)connectionInvalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 20
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x14u)))
  {
    v3 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection connectionInvalidated]", 0x14u, (uint64_t)"XPC connection invalidated from %#{pid}\n", v4, v5, v6, v7, v3);
  }
}

- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a3;
  v9 = a5;
  if (*a4
    || (-[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        *a4 = objc_msgSend(v10, "isEqual:", MEMORY[0x1E0C9AAB0]),
        v10,
        *a4)
    || -[CUPairingDaemon testMode](self->_daemon, "testMode"))
  {
    v11 = 0;
  }
  else
  {
    v11 = -71168;
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      v13 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection _entitled:state:label:]", 0x3Cu, (uint64_t)"### %#{pid} lacks '%@' entitlement to use %@\n", v14, v15, v16, v17, v13);
    }
  }

  return v11;
}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairingIdentityWithOptions:completion:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v7, v8, v9, v10, (uint64_t)CFSTR("GetPairingIdentity"));
  }
  v11 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.Read"), &self->_pmEntitledRead, CFSTR("GetPairingIdentity"));
  if (v11
    || (a3 & 0x138) != 0
    && (v11 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.HomeKit"), &self->_pmEntitledHomeKit, CFSTR("GetPairingIdentity"))) != 0)
  {
    v16 = v11;
    if (v11 != -25300
      && gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairingIdentityWithOptions:completion:]", 0x3Cu, (uint64_t)"### %@ failed: %#m\n", v12, v13, v14, v15, (uint64_t)CFSTR("GetPairingIdentity"));
    }
    if (v6)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2F90];
      v19 = v16;
      v25 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v16, 0, 0));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v22 = CFSTR("?");
      if (v20)
        v22 = (const __CFString *)v20;
      v26[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v24);

    }
  }
  else
  {
    -[CUPairingDaemon getIdentityWithOptions:completionHandler:](self->_daemon, "getIdentityWithOptions:completionHandler:", a3, v6);
  }

}

- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection deletePairingIdentityWithOptions:completion:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v7, v8, v9, v10, (uint64_t)CFSTR("DeletePairingIdentity"));
  }
  if ((a3 & 0x138) != 0)
  {
    v12 = -6735;
    v13 = 1;
LABEL_10:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection deletePairingIdentityWithOptions:completion:]", 0x3Cu, (uint64_t)"### %@ %#{flags} failed: %#m\n", v7, v8, v9, v10, (uint64_t)CFSTR("DeletePairingIdentity"));
    }
    goto LABEL_14;
  }
  v11 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.DeleteIdentity"), &self->_pmEntitledDeleteIdentity, CFSTR("DeletePairingIdentity"));
  if (!v11)
    v11 = -[CUPairingDaemon deleteIdentityWithOptions:](self->_daemon, "deleteIdentityWithOptions:", a3);
  v12 = v11;
  v13 = v11 != 0;
  if (v11 != -25300 && v11)
    goto LABEL_10;
LABEL_14:
  if (v6)
  {
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2F90];
      v16 = v12;
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v12, 0, 0));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("?");
      if (v17)
        v19 = (const __CFString *)v17;
      v23[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v21);

    }
    else
    {
      v6[2](v6, 0);
    }
  }

}

- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, id, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairedPeersWithOptions:completion:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v7, v8, v9, v10, (uint64_t)CFSTR("GetPairedPeers"));
  }
  if ((a3 & 0x138) != 0)
  {
    v11 = 0;
    v20 = -6735;
LABEL_24:
    v21 = v20;
    goto LABEL_10;
  }
  v21 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.Read"), &self->_pmEntitledRead, CFSTR("GetPairedPeers"));
  if (!v21)
  {
    v11 = -[CUPairingDaemon copyPairedPeersWithOptions:error:](self->_daemon, "copyPairedPeersWithOptions:error:", a3, &v21);
    if (v21 || v11)
    {
      if (!v21)
        goto LABEL_14;
      goto LABEL_10;
    }
    v20 = -6762;
    goto LABEL_24;
  }
  v11 = 0;
LABEL_10:
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairedPeersWithOptions:completion:]", 0x3Cu, (uint64_t)"### %@ %#{flags} failed: %#m\n", v7, v8, v9, v10, (uint64_t)CFSTR("GetPairedPeers"));
  }
LABEL_14:
  if (v6)
  {
    v12 = v21;
    if (v21)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2F90];
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v21, 0, 0));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("?");
      if (v15)
        v17 = (const __CFString *)v15;
      v23[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v12, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v11, v19);

    }
    else
    {
      v6[2](v6, v11, 0);
    }
  }

}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    objc_msgSend(v8, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection findPairedPeer:options:completion:]", 0x1Eu, (uint64_t)"%@ %@ %#{flags}\n", v10, v11, v12, v13, (uint64_t)CFSTR("FindPairedPeer"));

  }
  v14 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.Read"), &self->_pmEntitledRead, CFSTR("FindPairedPeer"));
  v30 = v14;
  if (v14
    || (a4 & 0x138) != 0
    && (v14 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.HomeKit"), &self->_pmEntitledHomeKit, CFSTR("FindPairedPeer")), (v30 = v14) != 0))
  {
    v15 = 0;
    goto LABEL_10;
  }
  -[CUPairingDaemon findPairedPeer:options:error:](self->_daemon, "findPairedPeer:options:error:", v8, a4, &v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v30;
  if (v30 || v15)
  {
LABEL_10:
    if (v14 == -25300 || !v14)
      goto LABEL_16;
    goto LABEL_12;
  }
  v30 = -6762;
LABEL_12:
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection findPairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### %@ %@ %#{flags} failed: %#m\n", v17, v18, v19, v20, (uint64_t)CFSTR("FindPairedPeer"));

  }
LABEL_16:
  if (v9)
  {
    v21 = v30;
    if (v30)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2F90];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v30, 0, 0));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = CFSTR("?");
      if (v24)
        v26 = (const __CFString *)v24;
      v32[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v21, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v15, v28);

    }
    else
    {
      v9[2](v9, v15, 0);
    }
  }

}

- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL8 pmEntitledRemoveAdmin;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    objc_msgSend(v8, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection savePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"%@ %@ %#{flags}\n", v10, v11, v12, v13, (uint64_t)CFSTR("SavePairedPeer"));

  }
  if ((a4 & 0x138) != 0)
  {
    v17 = -6735;
    goto LABEL_11;
  }
  v14 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.Write"), &self->_pmEntitledWrite, CFSTR("SavePairedPeer"));
  if (v14)
  {
    v17 = v14;
LABEL_11:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      objc_msgSend(v8, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection savePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### %@ %@ %#{flags} failed: %#m\n", v18, v19, v20, v21, (uint64_t)CFSTR("SavePairedPeer"));

    }
    if (v9)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2F90];
      v24 = v17;
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = CFSTR("?");
      if (v25)
        v27 = (const __CFString *)v25;
      v33[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v29);

    }
    goto LABEL_21;
  }
  if (self->_pmEntitledRemoveAdmin)
  {
    pmEntitledRemoveAdmin = 1;
  }
  else
  {
    -[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.PairingManager.RemoveAdmin"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_pmEntitledRemoveAdmin = objc_msgSend(v16, "isEqual:", MEMORY[0x1E0C9AAB0]);

    pmEntitledRemoveAdmin = self->_pmEntitledRemoveAdmin;
  }
  v17 = -[CUPairingDaemon savePairedPeer:options:removeAdminAllowed:](self->_daemon, "savePairedPeer:options:removeAdminAllowed:", v8, a4, pmEntitledRemoveAdmin);
  if (v17)
    goto LABEL_11;
  if (v9)
    v9[2](v9, 0);
LABEL_21:

}

- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL8 pmEntitledRemoveAdmin;
  void *v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    objc_msgSend(v8, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection removePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"%@ %@ %#{flags}\n", v10, v11, v12, v13, (uint64_t)CFSTR("RemovePairedPeer"));

  }
  if ((a4 & 0x138) != 0)
  {
    v17 = -6735;
    v18 = 1;
LABEL_13:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      objc_msgSend(v8, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection removePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### %@ %@ %#{flags} failed: %#m\n", v19, v20, v21, v22, (uint64_t)CFSTR("RemovePairedPeer"));

    }
    goto LABEL_17;
  }
  v14 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.RemovePeer"), &self->_pmEntitledRemovePeer, CFSTR("RemovePairedPeer"));
  if (!v14)
  {
    if (self->_pmEntitledRemoveAdmin)
    {
      pmEntitledRemoveAdmin = 1;
    }
    else
    {
      -[NSXPCConnection cuValueForEntitlementNoCache:](self->_xpcCnx, "cuValueForEntitlementNoCache:", CFSTR("com.apple.PairingManager.RemoveAdmin"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_pmEntitledRemoveAdmin = objc_msgSend(v16, "isEqual:", MEMORY[0x1E0C9AAB0]);

      pmEntitledRemoveAdmin = self->_pmEntitledRemoveAdmin;
    }
    v14 = -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:](self->_daemon, "removePairedPeer:options:removeAdminAllowed:", v8, a4, pmEntitledRemoveAdmin);
  }
  v17 = v14;
  v18 = v14 != 0;
  if (v14 != -25300 && v14)
    goto LABEL_13;
LABEL_17:
  if (v9)
  {
    if (v18)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2F90];
      v25 = v17;
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      v28 = CFSTR("?");
      if (v26)
        v28 = (const __CFString *)v26;
      v34[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v30);

    }
    else
    {
      v9[2](v9, 0);
    }
  }

}

- (void)showWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection showWithCompletion:]", 0x1Eu, (uint64_t)"%@\n", v5, v6, v7, v8, (uint64_t)CFSTR("Show"));
  }
  v9 = -[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.Read"), &self->_pmEntitledRead, CFSTR("Show"));
  if (v9)
  {
    v16 = v9;
  }
  else
  {
    -[CUPairingDaemon detailedDescription](self->_daemon, "detailedDescription");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      if (v4)
        v4[2](v4, v14, 0);
      goto LABEL_9;
    }
    v16 = -6762;
  }
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection showWithCompletion:]", 0x3Cu, (uint64_t)"### %@ failed: %#m\n", v10, v11, v12, v13, (uint64_t)CFSTR("Show"));
  }
  if (v4)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v19 = v16;
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorStringEx(0, v16, 0, 0));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("?");
    if (v20)
      v22 = (const __CFString *)v20;
    v26[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v24);

  }
  v15 = 0;
LABEL_9:

}

- (void)startMonitoringWithOptions:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection startMonitoringWithOptions:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v4, v5, v6, v7, (uint64_t)CFSTR("StartMonitoring"));
  }
  if (-[CUPairingXPCConnection _entitled:state:label:](self, "_entitled:state:label:", CFSTR("com.apple.PairingManager.Read"), &self->_pmEntitledRead, CFSTR("StartMonitoring")))
  {
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection startMonitoringWithOptions:]", 0x3Cu, (uint64_t)"### %@ %#{flags} failed: %#m\n", v8, v9, v10, v11, (uint64_t)CFSTR("StartMonitoring"));
    }
  }
  else
  {
    self->_monitoring = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
