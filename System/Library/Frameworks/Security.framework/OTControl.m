@implementation OTControl

- (OTControl)initWithConnection:(id)a3 sync:(BOOL)a4
{
  id v7;
  OTControl *v8;
  OTControl *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OTControl;
  v8 = -[OTControl init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_sync = a4;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[OTControl connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)OTControl;
  -[OTControl dealloc](&v4, sel_dealloc);
}

- (id)getConnection:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[OTControl sync](self, "sync");
  -[OTControl connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  else
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAsyncConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[OTControl connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)restore:(id)a3 dsid:(id)a4 secret:(id)a5 escrowRecordID:(id)a6 reply:(id)a7
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2F90];
  v10 = a7;
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -4, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a7 + 2))(v10, 0, 0, v11);

}

- (void)reset:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v6, 0, v7);

}

- (void)octagonSigningPublicKey:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v6, 0, v7);

}

- (void)octagonEncryptionPublicKey:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v6, 0, v7);

}

- (void)listOfEligibleBottledPeerRecords:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2F90];
  v6 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a3 + 2))(v6, MEMORY[0x1E0C9AA60], v7);

}

- (void)appleAccountSignedIn:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__OTControl_appleAccountSignedIn_reply___block_invoke;
  v14[3] = &unk_1E1FD6038;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__OTControl_appleAccountSignedIn_reply___block_invoke_2;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "appleAccountSignedIn:reply:", v9, v12);

}

- (void)appleAccountSignedOut:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__OTControl_appleAccountSignedOut_reply___block_invoke;
  v14[3] = &unk_1E1FD6038;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __41__OTControl_appleAccountSignedOut_reply___block_invoke_2;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "appleAccountSignedOut:reply:", v9, v12);

}

- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke;
  v14[3] = &unk_1E1FD6038;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke_2;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "notifyIDMSTrustLevelChangeForAltDSID:reply:", v9, v12);

}

- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke;
  v17[3] = &unk_1E1FD6038;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke_2;
  v15[3] = &unk_1E1FCC1E8;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "rpcEpochWithArguments:configuration:reply:", v12, v11, v15);

}

- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke;
  v17[3] = &unk_1E1FD6038;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke_2;
  v15[3] = &unk_1E1FCC210;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "rpcPrepareIdentityAsApplicantWithArguments:configuration:reply:", v12, v11, v15);

}

- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v18 = a11;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke;
  v32[3] = &unk_1E1FD6038;
  v19 = v18;
  v33 = v19;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  -[OTControl getConnection:](self, "getConnection:", v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke_2;
  v30[3] = &unk_1E1FCC238;
  v31 = v19;
  v29 = v19;
  objc_msgSend(v28, "rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:", v27, v26, v25, v24, v23, v22, v21, v20, v30);

}

- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7
{
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v12 = a7;
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke;
  v23[3] = &unk_1E1FD6038;
  v14 = v12;
  v24 = v14;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[OTControl getConnection:](self, "getConnection:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472;
  v21[2] = __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke_2;
  v21[3] = &unk_1E1FD6038;
  v22 = v14;
  v20 = v14;
  objc_msgSend(v19, "rpcJoinWithArguments:configuration:vouchData:vouchSig:reply:", v18, v17, v16, v15, v21);

}

- (void)preflightBottledPeer:(id)a3 dsid:(id)a4 reply:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2F90];
  v8 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -4, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))a5 + 2))(v8, 0, 0, 0, v9);

}

- (void)launchBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = (void (**)(id, void *))a5;
  secLogObjForScope("octagon");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18A900000, v6, OS_LOG_TYPE_DEFAULT, "launchBottledPeer", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

}

- (void)scrubBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2F90];
  v8 = a5;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -4, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v8, v9);

}

- (void)status:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  OTControlArguments *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[OTControlArguments initWithContainerName:contextID:altDSID:]([OTControlArguments alloc], "initWithContainerName:contextID:altDSID:", v10, v9, 0);

  -[OTControl status:reply:](self, "status:reply:", v11, v8);
}

- (void)status:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__OTControl_status_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "status:reply:", v8, v7);

}

- (void)fetchEgoPeerID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__OTControl_fetchEgoPeerID_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchEgoPeerID:reply:", v8, v7);

}

- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_fetchCliqueStatus_configuration_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchCliqueStatus:configuration:reply:", v11, v10, v9);

}

- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__OTControl_fetchTrustStatus_configuration_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchTrustStatus:configuration:reply:", v11, v10, v9);

}

- (void)startOctagonStateMachine:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__OTControl_startOctagonStateMachine_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startOctagonStateMachine:reply:", v8, v7);

}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 reply:(id)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;

  v10 = a7;
  v16 = a9;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __117__OTControl_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_reply___block_invoke;
  v26 = &unk_1E1FD6038;
  v27 = v16;
  v17 = v16;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  -[OTControl getConnection:](self, "getConnection:", &v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", v21, a4, v20, v19, v10, v18, v17, v23, v24, v25, v26);

}

- (void)establish:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__OTControl_establish_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "establish:reply:", v8, v7);

}

- (void)leaveClique:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__OTControl_leaveClique_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leaveClique:reply:", v8, v7);

}

- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__OTControl_removeFriendsInClique_peerIDs_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFriendsInClique:peerIDs:reply:", v11, v10, v9);

}

- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__OTControl_peerDeviceNamesByPeerID_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "peerDeviceNamesByPeerID:reply:", v8, v7);

}

- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__OTControl_fetchAllViableBottles_source_reply___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAllViableBottles:source:reply:", v10, a4, v9);

}

- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__OTControl_restoreFromBottle_entropy_bottleID_reply___block_invoke;
  v16[3] = &unk_1E1FD6038;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[OTControl getConnection:](self, "getConnection:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "restoreFromBottle:entropy:bottleID:reply:", v14, v13, v12, v11);

}

- (void)fetchEscrowContents:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__OTControl_fetchEscrowContents_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchEscrowContents:reply:", v8, v7);

}

- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__OTControl_createRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createRecoveryKey:recoveryKey:reply:", v11, v10, v9);

}

- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_joinWithRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "joinWithRecoveryKey:recoveryKey:reply:", v11, v10, v9);

}

- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_createCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createCustodianRecoveryKey:uuid:reply:", v11, v10, v9);

}

- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__OTControl_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "joinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", v11, v10, v9);

}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__OTControl_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preflightJoinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", v11, v10, v9);

}

- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_removeCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeCustodianRecoveryKey:uuid:reply:", v11, v10, v9);

}

- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__OTControl_checkCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkCustodianRecoveryKey:uuid:reply:", v11, v10, v9);

}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__OTControl_createInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createInheritanceKey:uuid:reply:", v11, v10, v9);

}

- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__OTControl_generateInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generateInheritanceKey:uuid:reply:", v11, v10, v9);

}

- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__OTControl_storeInheritanceKey_ik_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storeInheritanceKey:ik:reply:", v11, v10, v9);

}

- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__OTControl_joinWithInheritanceKey_inheritanceKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "joinWithInheritanceKey:inheritanceKey:reply:", v11, v10, v9);

}

- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__OTControl_preflightJoinWithInheritanceKey_inheritanceKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preflightJoinWithInheritanceKey:inheritanceKey:reply:", v11, v10, v9);

}

- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__OTControl_removeInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeInheritanceKey:uuid:reply:", v11, v10, v9);

}

- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__OTControl_checkInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkInheritanceKey:uuid:reply:", v11, v10, v9);

}

- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__OTControl_recreateInheritanceKey_uuid_oldIK_reply___block_invoke;
  v16[3] = &unk_1E1FD6038;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[OTControl getConnection:](self, "getConnection:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recreateInheritanceKey:uuid:oldIK:reply:", v14, v13, v12, v11);

}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__OTControl_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke;
  v19[3] = &unk_1E1FD6038;
  v20 = v12;
  v13 = v12;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[OTControl getConnection:](self, "getConnection:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createInheritanceKey:uuid:claimTokenData:wrappingKeyData:reply:", v17, v16, v15, v14, v13);

}

- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__OTControl_healthCheck_skipRateLimitingCheck_repair_reply___block_invoke;
  v14[3] = &unk_1E1FD6038;
  v15 = v10;
  v11 = v10;
  v12 = a3;
  -[OTControl getConnection:](self, "getConnection:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "healthCheck:skipRateLimitingCheck:repair:reply:", v12, v7, v6, v11);

}

- (void)simulateReceivePush:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__OTControl_simulateReceivePush_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "simulateReceivePush:reply:", v8, v7);

}

- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__OTControl_waitForOctagonUpgrade_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "waitForOctagonUpgrade:reply:", v8, v7);

}

- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v9 = a4;
  v12 = a7;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__OTControl_postCDPFollowupResult_success_type_error_reply___block_invoke;
  v19[3] = &unk_1E1FD6038;
  v20 = v12;
  v13 = v12;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  -[OTControl getConnection:](self, "getConnection:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SecXPCHelper cleanseErrorForXPC:](SecXPCHelper, "cleanseErrorForXPC:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "postCDPFollowupResult:success:type:error:reply:", v16, v9, v15, v18, v13);
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__OTControl_tapToRadar_description_radar_reply___block_invoke;
  v16[3] = &unk_1E1FD6038;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[OTControl getConnection:](self, "getConnection:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tapToRadar:description:radar:reply:", v14, v13, v12, v11);

}

- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__OTControl_refetchCKKSPolicy_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "refetchCKKSPolicy:reply:", v8, v7);

}

- (void)setCDPEnabled:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__OTControl_setCDPEnabled_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCDPEnabled:reply:", v8, v7);

}

- (void)getCDPStatus:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__OTControl_getCDPStatus_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getCDPStatus:reply:", v8, v7);

}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__OTControl_fetchEscrowRecords_source_reply___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchEscrowRecords:source:reply:", v10, a4, v9);

}

- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__OTControl_setUserControllableViewsSyncStatus_enabled_reply___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserControllableViewsSyncStatus:enabled:reply:", v10, v5, v9);

}

- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__OTControl_fetchUserControllableViewsSyncStatus_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchUserControllableViewsSyncStatus:reply:", v8, v7);

}

- (void)fetchUserControllableViewsSyncStatusAsync:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__OTControl_fetchUserControllableViewsSyncStatusAsync_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getAsyncConnection:](self, "getAsyncConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchUserControllableViewsSyncStatus:reply:", v8, v7);

}

- (void)invalidateEscrowCache:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__OTControl_invalidateEscrowCache_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateEscrowCache:reply:", v8, v7);

}

- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = a6;
  v12 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__OTControl_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply___block_invoke;
  v18[3] = &unk_1E1FD6038;
  v19 = v12;
  v13 = v12;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[OTControl getConnection:](self, "getConnection:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resetAccountCDPContents:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:", v16, v15, v14, v7, v13);

}

- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__OTControl_setLocalSecureElementIdentity_secureElementIdentity_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocalSecureElementIdentity:secureElementIdentity:reply:", v11, v10, v9);

}

- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__OTControl_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:", v11, v10, v9);

}

- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__OTControl_fetchTrustedSecureElementIdentities_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchTrustedSecureElementIdentities:reply:", v8, v7);

}

- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__OTControl_setAccountSetting_setting_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccountSetting:setting:reply:", v11, v10, v9);

}

- (void)fetchAccountSettings:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__OTControl_fetchAccountSettings_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAccountSettings:reply:", v8, v7);

}

- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__OTControl_fetchAccountWideSettingsWithForceFetch_arguments_reply___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v9 = v8;
  v10 = a4;
  -[OTControl getConnection:](self, "getConnection:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAccountWideSettingsWithForceFetch:arguments:reply:", v6, v10, v9);

}

- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__OTControl_waitForPriorityViewKeychainDataRecovery_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "waitForPriorityViewKeychainDataRecovery:reply:", v8, v7);

}

- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__OTControl_tlkRecoverabilityForEscrowRecordData_recordData_source_reply___block_invoke;
  v15[3] = &unk_1E1FD6038;
  v16 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  -[OTControl getConnection:](self, "getConnection:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tlkRecoverabilityForEscrowRecordData:recordData:source:reply:", v13, v12, a5, v11);

}

- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__OTControl_setMachineIDOverride_machineID_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMachineIDOverride:machineID:reply:", v11, v10, v9);

}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__OTControl_isRecoveryKeySet_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isRecoveryKeySet:reply:", v8, v7);

}

- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__OTControl_recoverWithRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recoverWithRecoveryKey:recoveryKey:reply:", v11, v10, v9);

}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__OTControl_removeRecoveryKey_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeRecoveryKey:reply:", v8, v7);

}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__OTControl_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E1FD6038;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[OTControl getConnection:](self, "getConnection:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:", v11, v10, v9);

}

- (void)getAccountMetadata:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__OTControl_getAccountMetadata_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAccountMetadata:reply:", v8, v7);

}

- (void)resetAcountData:(id)a3 resetReason:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__OTControl_resetAcountData_resetReason_reply___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[OTControl getConnection:](self, "getConnection:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetAcountData:resetReason:reply:", v10, a4, v9);

}

- (void)totalTrustedPeers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__OTControl_totalTrustedPeers_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "totalTrustedPeers:reply:", v8, v7);

}

- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__OTControl_areRecoveryKeysDistrusted_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "areRecoveryKeysDistrusted:reply:", v8, v7);

}

- (void)reroll:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__OTControl_reroll_reply___block_invoke;
  v10[3] = &unk_1E1FD6038;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[OTControl getConnection:](self, "getConnection:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reroll:reply:", v8, v7);

}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __26__OTControl_reroll_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__OTControl_areRecoveryKeysDistrusted_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__OTControl_totalTrustedPeers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__OTControl_resetAcountData_resetReason_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __38__OTControl_getAccountMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__OTControl_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__OTControl_removeRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__OTControl_recoverWithRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__OTControl_isRecoveryKeySet_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__OTControl_setMachineIDOverride_machineID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__OTControl_tlkRecoverabilityForEscrowRecordData_recordData_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__OTControl_waitForPriorityViewKeychainDataRecovery_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__OTControl_fetchAccountWideSettingsWithForceFetch_arguments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__OTControl_fetchAccountSettings_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__OTControl_setAccountSetting_setting_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__OTControl_fetchTrustedSecureElementIdentities_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__OTControl_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__OTControl_setLocalSecureElementIdentity_secureElementIdentity_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__OTControl_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__OTControl_invalidateEscrowCache_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__OTControl_fetchUserControllableViewsSyncStatusAsync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__OTControl_fetchUserControllableViewsSyncStatus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__OTControl_setUserControllableViewsSyncStatus_enabled_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__OTControl_fetchEscrowRecords_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __32__OTControl_getCDPStatus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __33__OTControl_setCDPEnabled_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__OTControl_refetchCKKSPolicy_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__OTControl_tapToRadar_description_radar_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__OTControl_postCDPFollowupResult_success_type_error_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__OTControl_waitForOctagonUpgrade_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__OTControl_simulateReceivePush_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__OTControl_healthCheck_skipRateLimitingCheck_repair_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__OTControl_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__OTControl_recreateInheritanceKey_uuid_oldIK_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__OTControl_checkInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__OTControl_removeInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__OTControl_preflightJoinWithInheritanceKey_inheritanceKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__OTControl_joinWithInheritanceKey_inheritanceKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __42__OTControl_storeInheritanceKey_ik_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__OTControl_generateInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__OTControl_createInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__OTControl_checkCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__OTControl_removeCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__OTControl_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__OTControl_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__OTControl_createCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__OTControl_joinWithRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__OTControl_createRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__OTControl_fetchEscrowContents_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__OTControl_restoreFromBottle_entropy_bottleID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__OTControl_fetchAllViableBottles_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__OTControl_peerDeviceNamesByPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__OTControl_removeFriendsInClique_peerIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__OTControl_leaveClique_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __29__OTControl_establish_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__OTControl_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__OTControl_startOctagonStateMachine_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__OTControl_fetchTrustStatus_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__OTControl_fetchCliqueStatus_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__OTControl_fetchEgoPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __26__OTControl_status_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__OTControl_appleAccountSignedOut_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__OTControl_appleAccountSignedOut_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__OTControl_appleAccountSignedIn_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__OTControl_appleAccountSignedIn_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)controlObject:(id *)a3
{
  return +[OTControl controlObject:error:](OTControl, "controlObject:error:", 0, a3);
}

+ (id)controlObject:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v5 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.security.octagon"), 0);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF88A48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    OTSetupControlProtocol(v7);
    objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setRemoteObjectInterface:", v7);
    objc_msgSend(v6, "resume");
    a4 = -[OTControl initWithConnection:sync:]([OTControl alloc], "initWithConnection:sync:", v6, v5);

  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2F90];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Couldn't create connection (no reason given)");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -67671, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end
