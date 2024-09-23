@implementation _LSDIconClient

- (void)getAlternateIconNameForIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58___LSDIconClient_getAlternateIconNameForIdentifier_reply___block_invoke;
  v17[3] = &unk_1E1042F38;
  v17[4] = self;
  v8 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v17);
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_xpcConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_LSXPCConnectionMayMapDatabase(v10))
  {

  }
  else
  {
    v8[2](v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v6);

    if (!v12)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDIconClient getAlternateIconNameForIdentifier:reply:]", 87, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v14);
      goto LABEL_6;
    }
  }
  +[LSAltIconManager sharedInstance](LSAltIconManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v13, "alternateIconNameForIdentifier:error:", v6, &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;

  ((void (**)(id, void *, void *))v7)[2](v7, v14, v15);
LABEL_6:

}

- (void)setAlternateIconName:(id)a3 forIdentifier:(id)a4 iconsDictionary:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  audit_token_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)_LSCopyBundleIdentifierForXPCConnection(v15, 0);

  -[_LSDClient XPCConnection](self, "XPCConnection", 0, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "auditToken");
  else
    memset(&v20, 0, sizeof(v20));

  if ((objc_msgSend(v16, "isEqualToString:", v11) & 1) != 0
    || _LSCheckEntitlementForAuditToken(&v20, CFSTR("com.apple.lsapplicationworkspace.rebuildappdatabases")))
  {
    +[LSAltIconManager sharedInstance](LSAltIconManager, "sharedInstance", *(_OWORD *)v20.val, *(_OWORD *)&v20.val[4]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlternateIconName:forIdentifier:iconsDictionary:reply:", v10, v11, v12, v13);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDIconClient setAlternateIconName:forIdentifier:iconsDictionary:reply:]", 66, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v19);
  }

}

@end
