@implementation DAKeySharingSession

- (DAKeySharingSession)initWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAKeySharingSession;
  return -[DASession initWithDelegate:](&v4, sel_initWithDelegate_, a3);
}

- (void)sendSharingInvitationForKeyIdentifier:(id)a3 toIdsIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[6];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, uint64_t))a7;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:]", 54, CFSTR("KeyIdentifier : %@, remoteIdsId: %@"), v17, v18, v19, v20, (uint64_t)v12);
  if (v12 && v13 && v14 && objc_msgSend(v15, "count"))
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__4;
    v44 = __Block_byref_object_dispose__4;
    v45 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    v25 = MEMORY[0x24BDAC760];
    v39 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke;
    v33[3] = &unk_24C327380;
    v33[4] = &v40;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v25;
    v32[1] = 3221225472;
    v32[2] = __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke_2;
    v32[3] = &unk_24C327510;
    v32[4] = &v40;
    v32[5] = &v34;
    objc_msgSend(v26, "sendSharingInviteForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:", v12, v13, v14, v15, v32);

    v16[2](v16, v35[5], v41[5]);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:]", 56, CFSTR("Null argument provided"), v21, v22, v23, v24, v31);
    v27 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, (uint64_t)v30);

  }
}

void __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSharingInvitationForKeyIdentifier:toIdsIdentifier:auth:config:completionHandler:]_block_invoke", 65, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __107__DAKeySharingSession_sendSharingInvitationForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)sendSilentSharingInvitationWithKeyIdentifier:(id)a3 config:(id)a4 groupIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:]", 77, CFSTR("KeyIdentifier : %@, uuid: %@"), v14, v15, v16, v17, (uint64_t)v10);
  if (v10 && v11 && v12)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__4;
    v41 = __Block_byref_object_dispose__4;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v22 = MEMORY[0x24BDAC760];
    v36 = 0;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke;
    v30[3] = &unk_24C327380;
    v30[4] = &v37;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke_2;
    v29[3] = &unk_24C328388;
    v29[4] = &v37;
    v29[5] = &v31;
    objc_msgSend(v23, "sendSilentSharingInviteForKeyIdentifier:config:groupIdentifier:completionHandler:", v10, v11, v12, v29);

    v13[2](v13, v32[5], v38[5]);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:]", 79, CFSTR("Null argument provided"), v18, v19, v20, v21, v28);
    v24 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, (uint64_t)v27);

  }
}

void __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession sendSilentSharingInvitationWithKeyIdentifier:config:groupIdentifier:completionHandler:]_block_invoke", 87, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __109__DAKeySharingSession_sendSilentSharingInvitationWithKeyIdentifier_config_groupIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)authorizeSharingInvitationIdentifier:(id)a3 auth:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession authorizeSharingInvitationIdentifier:auth:completionHandler:]", 101, CFSTR("InvitationId : %@"), v11, v12, v13, v14, (uint64_t)v8);
  if (v8)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "authorizeSharingInvitationIdentifier:auth:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession authorizeSharingInvitationIdentifier:auth:completionHandler:]", 103, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession authorizeSharingInvitationIdentifier:auth:completionHandler:]_block_invoke", 110, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __83__DAKeySharingSession_authorizeSharingInvitationIdentifier_auth_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)cancelSharingInvitation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]", 121, CFSTR("InvitationId : %@"), v5, v6, v7, v8, (uint64_t)v4);
  if (v4)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    v13 = MEMORY[0x24BDAC760];
    v28 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __47__DAKeySharingSession_cancelSharingInvitation___block_invoke;
    v22[3] = &unk_24C327380;
    v22[4] = &v23;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __47__DAKeySharingSession_cancelSharingInvitation___block_invoke_2;
    v21[3] = &unk_24C327380;
    v21[4] = &v23;
    objc_msgSend(v14, "cancelSharingInvitation:completionHandler:", v4, v21);

    v15 = (id)v24[5];
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]", 123, CFSTR("Null argument provided"), v9, v10, v11, v12, v20);
    v16 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v18);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __47__DAKeySharingSession_cancelSharingInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]_block_invoke", 130, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __47__DAKeySharingSession_cancelSharingInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession cancelSharingInvitation:]_block_invoke_2", 133, CFSTR("Result: %@"), v4, v5, v6, v7, (uint64_t)v3);
  kmlErrorToDAError(v3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v12 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:completionHandler:]", 143, CFSTR("This method will be deprecated soon. Start using acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler"), v7, v8, v9, v10, v11);
  -[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:](self, "acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:", v12, 0, 0, v6);

}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v15 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:completionHandler:]", 151, CFSTR("This method will be deprecated soon. Start using acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler"), v10, v11, v12, v13, v14);
  -[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:](self, "acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:", v15, v9, 0, v8);

}

- (void)acceptSharingInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 160, CFSTR("Invitation Id %@"), v14, v15, v16, v17, (uint64_t)v10);
  if (v10)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__4;
    v41 = __Block_byref_object_dispose__4;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v22 = MEMORY[0x24BDAC760];
    v36 = 0;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke;
    v30[3] = &unk_24C327380;
    v30[4] = &v37;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2;
    v29[3] = &unk_24C3283B0;
    v29[4] = &v37;
    v29[5] = &v31;
    objc_msgSend(v23, "acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:", v10, v11, v12, v29);

    v13[2](v13, v32[5], v38[5]);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 162, CFSTR("Null argument provided"), v18, v19, v20, v21, v28);
    v24 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, (uint64_t)v27);

  }
}

void __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]_block_invoke", 171, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __110__DAKeySharingSession_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)requestInviteWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession requestInviteWithConfig:completionHandler:]", 186, &stru_24C3287B0, v8, v9, v10, v11, v22);
  if (v6)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__4;
    v30 = __Block_byref_object_dispose__4;
    v16 = MEMORY[0x24BDAC760];
    v31 = 0;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke;
    v25[3] = &unk_24C327380;
    v25[4] = &v26;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke_2;
    v24[3] = &unk_24C327380;
    v24[4] = &v26;
    objc_msgSend(v17, "requestInviteWithConfig:completionHandler:", v6, v24);

    v7[2](v7, v27[5]);
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestInviteWithConfig:completionHandler:]", 188, CFSTR("Null argument provided"), v12, v13, v14, v15, v23);
    v18 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v21);

  }
}

void __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestInviteWithConfig:completionHandler:]_block_invoke", 196, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __65__DAKeySharingSession_requestInviteWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 config:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v21 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:config:completionHandler:]", 213, CFSTR("Deprecated function"), v16, v17, v18, v19, v20);
  -[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:](self, "createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:", v21, v15, v14, 0, v13, v12);

}

- (void)createSharingInvitationsForKeyIdentifier:(id)a3 friendIdentifier:(id)a4 auth:(id)a5 ourBindingAttestation:(id)a6 config:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[6];
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, uint64_t, uint64_t))a8;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:]", 229, CFSTR("KeyIdentifier : %@, friendIdentifier: %@"), v20, v21, v22, v23, (uint64_t)v14);
  if (v14 && objc_msgSend(v18, "count"))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__4;
    v47 = __Block_byref_object_dispose__4;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__4;
    v41 = __Block_byref_object_dispose__4;
    v28 = MEMORY[0x24BDAC760];
    v42 = 0;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke;
    v36[3] = &unk_24C327380;
    v36[4] = &v43;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v28;
    v35[1] = 3221225472;
    v35[2] = __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke_2;
    v35[3] = &unk_24C327510;
    v35[4] = &v43;
    v35[5] = &v37;
    objc_msgSend(v29, "createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:", v14, v15, v16, v17, v18, v35);

    v19[2](v19, v38[5], v44[5]);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:]", 231, CFSTR("Null argument provided"), v24, v25, v26, v27, v34);
    v30 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, (uint64_t)v33);

  }
}

void __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSharingInvitationsForKeyIdentifier:friendIdentifier:auth:ourBindingAttestation:config:completionHandler:]_block_invoke", 240, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __133__DAKeySharingSession_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)createSilentSharingInvitationWithGroupIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession createSilentSharingInvitationWithGroupIdentifier:completionHandler:]", 258, CFSTR("groupIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke_2;
    v23[3] = &unk_24C327580;
    v23[4] = &v31;
    v23[5] = &v25;
    objc_msgSend(v17, "createSilentSharingInvitationWithGroupIdentifier:completionHandler:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSilentSharingInvitationWithGroupIdentifier:completionHandler:]", 260, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession createSilentSharingInvitationWithGroupIdentifier:completionHandler:]_block_invoke", 269, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __90__DAKeySharingSession_createSilentSharingInvitationWithGroupIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)setMailboxIdentifier:(id)a3 forOwnerKeyIdentifier:(id)a4 forInvitationIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]", 286, CFSTR("OwnerKeyIdentifier - %@, InvitationIdentifier - %@"), v14, v15, v16, v17, (uint64_t)v11);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]", 287, CFSTR("mailboxIdentifier - %@"), v18, v19, v20, v21, (uint64_t)v10);
  if (v10 && v11 && v12)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__4;
    v39 = __Block_byref_object_dispose__4;
    v26 = MEMORY[0x24BDAC760];
    v40 = 0;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke;
    v34[3] = &unk_24C327380;
    v34[4] = &v35;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v26;
    v33[1] = 3221225472;
    v33[2] = __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke_2;
    v33[3] = &unk_24C327380;
    v33[4] = &v35;
    objc_msgSend(v27, "setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:", v10, v11, v12, v33);

    v13[2](v13, v36[5]);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]", 289, CFSTR("Null argument provided"), v22, v23, v24, v25, v32);
    v28 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v13)[2](v13, v31);

  }
}

void __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setMailboxIdentifier:forOwnerKeyIdentifier:forInvitationIdentifier:completionHandler:]_block_invoke", 297, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __108__DAKeySharingSession_setMailboxIdentifier_forOwnerKeyIdentifier_forInvitationIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:]", 310, CFSTR("MailboxIdentifier - %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:]", 312, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession startShareAcceptanceFlowWithInvitation:fromMailboxIdentifier:completionHandler:]_block_invoke", 320, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __102__DAKeySharingSession_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)acceptSharingInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v15 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:completionHandler:]", 333, CFSTR("This method will be deprecated soon. Start using acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler"), v10, v11, v12, v13, v14);
  -[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:](self, "acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:", v15, v9, 0, v8);

}

- (void)acceptSharingInvitation:(id)a3 fromMailboxIdentifier:(id)a4 passcode:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[6];
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]", 342, CFSTR("This method will be deprecated soon. Start using acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler"), v14, v15, v16, v17, v34);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]", 344, CFSTR("MailboxIdentifier - %@"), v18, v19, v20, v21, (uint64_t)v11);
  if (v10 && v11)
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__4;
    v48 = __Block_byref_object_dispose__4;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__4;
    v42 = __Block_byref_object_dispose__4;
    v26 = MEMORY[0x24BDAC760];
    v43 = 0;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke;
    v37[3] = &unk_24C327380;
    v37[4] = &v44;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "genericData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sharingIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v26;
    v36[1] = 3221225472;
    v36[2] = __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke_2;
    v36[3] = &unk_24C3283D8;
    v36[4] = &v38;
    v36[5] = &v44;
    objc_msgSend(v27, "acceptSharingInvitation:withIdentifier:fromMailboxIdentifier:passcode:productPlanIdentifier:completionHandler:", v10, v29, v11, v12, 0, v36);

    v13[2](v13, v39[5], v45[5]);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]", 346, CFSTR("Null argument provided"), v22, v23, v24, v25, v35);
    v30 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, (uint64_t)v33);

  }
}

void __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptSharingInvitation:fromMailboxIdentifier:passcode:completionHandler:]_block_invoke", 354, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __96__DAKeySharingSession_acceptSharingInvitation_fromMailboxIdentifier_passcode_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v11 = a2;
  v7 = a4;
  kmlErrorToDAError(v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 passcode:(id)a4 productPlanIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[6];
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, uint64_t))a6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 374, CFSTR("InvitationIdentifier - %@"), v14, v15, v16, v17, (uint64_t)v10);
  if (v10)
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__4;
    v41 = __Block_byref_object_dispose__4;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v22 = MEMORY[0x24BDAC760];
    v36 = 0;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke;
    v30[3] = &unk_24C327380;
    v30[4] = &v37;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2;
    v29[3] = &unk_24C3283D8;
    v29[4] = &v31;
    v29[5] = &v37;
    objc_msgSend(v23, "acceptSharingInvitation:withIdentifier:fromMailboxIdentifier:passcode:productPlanIdentifier:completionHandler:", 0, v10, 0, v11, v12, v29);

    v13[2](v13, v32[5], v38[5]);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]", 376, CFSTR("Null argument provided"), v18, v19, v20, v21, v28);
    v24 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, (uint64_t)v27);

  }
}

void __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptCrossPlatformInvitationWithIdentifier:passcode:productPlanIdentifier:completionHandler:]_block_invoke", 384, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __116__DAKeySharingSession_acceptCrossPlatformInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v11 = a2;
  v7 = a4;
  kmlErrorToDAError(v7);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)acceptInvitationWithIdentifier:(id)a3 passcode:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  DAShareRecipientResult *v21;
  void *v22;
  uint64_t v23;
  DAShareRecipientResult *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  DAShareRecipientResult *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[7];
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]", 404, CFSTR("InvitationIdentifier - %@"), v11, v12, v13, v14, (uint64_t)v8);
  if (v8)
  {
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__4;
    v60 = __Block_byref_object_dispose__4;
    v61 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__4;
    v54 = __Block_byref_object_dispose__4;
    v55 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__4;
    v48 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v49 = 0;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke;
    v43[3] = &unk_24C327380;
    v43[4] = &v56;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v43);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v19;
    v42[1] = 3221225472;
    v42[2] = __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke_2;
    v42[3] = &unk_24C328400;
    v42[4] = &v50;
    v42[5] = &v56;
    v42[6] = &v44;
    objc_msgSend(v20, "acceptSharingInvitation:withIdentifier:fromMailboxIdentifier:passcode:productPlanIdentifier:completionHandler:", 0, v8, 0, v9, 0, v42);

    if (v51[5])
    {
      v21 = [DAShareRecipientResult alloc];
      objc_msgSend((id)v45[5], "publicKeyIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[DAShareRecipientResult initDataRequiredResultWithCredentialIdentifier:response:keyInformation:](v21, "initDataRequiredResultWithCredentialIdentifier:response:keyInformation:", v22, v51[5], v45[5]);
    }
    else
    {
      if (!v57[5])
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v62 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(109));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 109, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v57[5];
        v57[5] = v33;

      }
      v35 = [DAShareRecipientResult alloc];
      objc_msgSend((id)v45[5], "publicKeyIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[DAShareRecipientResult initFailureResultWithCrdentialIdentifier:error:](v35, "initFailureResultWithCrdentialIdentifier:error:", v22, v57[5]);
    }
    v36 = (void *)v23;

    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]", 440, CFSTR("Result : %@"), v37, v38, v39, v40, (uint64_t)v36);
    v10[2](v10, v36);

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v50, 8);

    _Block_object_dispose(&v56, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]", 406, CFSTR("Null argument provided"), v15, v16, v17, v18, v41);
    v24 = [DAShareRecipientResult alloc];
    v25 = (void *)MEMORY[0x24BDD1540];
    v64 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[DAShareRecipientResult initFailureResultWithCrdentialIdentifier:error:](v24, "initFailureResultWithCrdentialIdentifier:error:", 0, v28);

    v10[2](v10, v29);
  }

}

void __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession acceptInvitationWithIdentifier:passcode:completionHandler:]_block_invoke", 416, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __81__DAKeySharingSession_acceptInvitationWithIdentifier_passcode_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v17 = v7;
  v11 = a4;

  kmlErrorToDAError(v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v8;

}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  DAShareRecipientResult *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]", 449, CFSTR("InvitationIdentifier - %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v39 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke;
    v33[3] = &unk_24C327380;
    v33[4] = &v34;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke_2;
    v32[3] = &unk_24C328428;
    v32[4] = &v34;
    objc_msgSend(v20, "handleRecipientMessage:forInvitationIdentifier:completionHandler:", v8, v9, v32);

    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]", 468, CFSTR("Result : %@"), v21, v22, v23, v24, v35[5]);
    v10[2](v10, v35[5]);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]", 451, CFSTR("Null argument provided"), v15, v16, v17, v18, v31);
    v25 = [DAShareRecipientResult alloc];
    v26 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[DAShareRecipientResult initFailureResultWithCrdentialIdentifier:error:](v25, "initFailureResultWithCrdentialIdentifier:error:", 0, v29);

    ((void (**)(id, id))v10)[2](v10, v30);
  }

}

void __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleRecipientMessage:forInvitationIdentifier:completionHandler:]_block_invoke", 460, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = -[DAShareRecipientResult initFailureResultWithCrdentialIdentifier:error:]([DAShareRecipientResult alloc], "initFailureResultWithCrdentialIdentifier:error:", 0, v3);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __88__DAKeySharingSession_handleRecipientMessage_forInvitationIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)handleInitiatorMessage:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  DAShareInitiatorResult *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]", 476, CFSTR("InvitationIdentifier - %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v39 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke;
    v33[3] = &unk_24C327380;
    v33[4] = &v34;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke_2;
    v32[3] = &unk_24C328450;
    v32[4] = &v34;
    objc_msgSend(v20, "handleInitiatorMessage:forInvitationIdentifier:completionHandler:", v8, v9, v32);

    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]", 496, CFSTR("Result : %@"), v21, v22, v23, v24, v35[5]);
    v10[2](v10, v35[5]);
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]", 478, CFSTR("Null argument provided"), v15, v16, v17, v18, v31);
    v25 = [DAShareInitiatorResult alloc];
    v26 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[DAShareInitiatorResult initFailureResultWithResponse:error:](v25, "initFailureResultWithResponse:error:", 0, v29);

    ((void (**)(id, id))v10)[2](v10, v30);
  }

}

void __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession handleInitiatorMessage:forInvitationIdentifier:completionHandler:]_block_invoke", 488, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = -[DAShareInitiatorResult initFailureResultWithResponse:error:]([DAShareInitiatorResult alloc], "initFailureResultWithResponse:error:", 0, v3);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __88__DAKeySharingSession_handleInitiatorMessage_forInvitationIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)retryPasscode:(id)a3 forInvitationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  DAShareRecipientResult *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  DAShareRecipientResult *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[7];
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession retryPasscode:forInvitationIdentifier:completionHandler:]", 506, CFSTR("Invitation Identifier : %@"), v11, v12, v13, v14, (uint64_t)v9);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__4;
  v49 = __Block_byref_object_dispose__4;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4;
  v43 = __Block_byref_object_dispose__4;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4;
  v37 = __Block_byref_object_dispose__4;
  v15 = MEMORY[0x24BDAC760];
  v38 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke;
  v32[3] = &unk_24C327380;
  v32[4] = &v45;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke_2;
  v31[3] = &unk_24C328400;
  v31[4] = &v39;
  v31[5] = &v45;
  v31[6] = &v33;
  objc_msgSend(v16, "retryPasscode:forInvitationIdentifier:completionHandler:", v8, v9, v31);

  if (v40[5])
  {
    v17 = [DAShareRecipientResult alloc];
    objc_msgSend((id)v34[5], "publicKeyIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[DAShareRecipientResult initDataRequiredResultWithCredentialIdentifier:response:keyInformation:](v17, "initDataRequiredResultWithCredentialIdentifier:response:keyInformation:", v18, v40[5], v34[5]);
  }
  else
  {
    if (!v46[5])
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v51 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(114));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 114, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v46[5];
      v46[5] = v23;

    }
    v25 = [DAShareRecipientResult alloc];
    objc_msgSend((id)v34[5], "publicKeyIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[DAShareRecipientResult initFailureResultWithCrdentialIdentifier:error:](v25, "initFailureResultWithCrdentialIdentifier:error:", v18, v46[5]);
  }
  v26 = (void *)v19;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession retryPasscode:forInvitationIdentifier:completionHandler:]", 531, CFSTR("Result: %@"), v27, v28, v29, v30, (uint64_t)v26);
  v10[2](v10, v26);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession retryPasscode:forInvitationIdentifier:completionHandler:]_block_invoke", 512, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __79__DAKeySharingSession_retryPasscode_forInvitationIdentifier_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v17 = v7;
  v11 = a4;

  kmlErrorToDAError(v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v8;

}

- (void)retryPasscode:(id)a3 forKeyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession retryPasscode:forKeyIdentifier:completionHandler:]", 539, CFSTR("KeyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v15 = MEMORY[0x24BDAC760];
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_24C327380;
  v18[4] = &v19;
  -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke_2;
  v17[3] = &unk_24C327380;
  v17[4] = &v19;
  objc_msgSend(v16, "retryPasscode:forKeyIdentifier:completionHandler:", v8, v9, v17);

  v10[2](v10, v20[5]);
  _Block_object_dispose(&v19, 8);

}

void __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession retryPasscode:forKeyIdentifier:completionHandler:]_block_invoke", 543, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __72__DAKeySharingSession_retryPasscode_forKeyIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)requestBindingAttestationDataForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 556, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2;
    v23[3] = &unk_24C3275F8;
    v23[4] = &v31;
    v23[5] = &v25;
    objc_msgSend(v17, "requestBindingAttestationDataForKeyWithIdentifier:callback:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestBindingAttestationDataForKeyWithIdentifier:callback:]", 558, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession requestBindingAttestationDataForKeyWithIdentifier:callback:]_block_invoke", 567, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __82__DAKeySharingSession_requestBindingAttestationDataForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  kmlErrorToDAError(a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (void)setBindingAttestation:(id)a3 forKeyWithIdentifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setBindingAttestation:forKeyWithIdentifier:callback:]", 579, CFSTR("keyIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (v8 && v9)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "setBindingAttestation:forKeyWithIdentifier:callback:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setBindingAttestation:forKeyWithIdentifier:callback:]", 581, CFSTR("Null argument provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setBindingAttestation:forKeyWithIdentifier:callback:]_block_invoke", 588, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __75__DAKeySharingSession_setBindingAttestation_forKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)getPreTrackRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 600, CFSTR("invitationIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend(v6, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v23[3] = &unk_24C3275A8;
    v23[4] = &v25;
    v23[5] = &v31;
    objc_msgSend(v17, "getPreTrackRequestForInvitationWithIdentifier:completionHandler:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]", 602, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 611, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __87__DAKeySharingSession_getPreTrackRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)getPreTrackRequestForKeyWithIdentifier:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForKeyWithIdentifier:callback:]", 626, CFSTR("keyIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (v6)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2;
    v23[3] = &unk_24C3275A8;
    v23[4] = &v25;
    v23[5] = &v31;
    objc_msgSend(v17, "getPreTrackRequestForKeyWithIdentifier:callback:", v6, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForKeyWithIdentifier:callback:]", 628, CFSTR("Null argument provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession getPreTrackRequestForKeyWithIdentifier:callback:]_block_invoke", 637, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __71__DAKeySharingSession_getPreTrackRequestForKeyWithIdentifier_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 650, CFSTR("invitationIdentifier: %@"), v8, v9, v10, v11, (uint64_t)v6);
  if (objc_msgSend(v6, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__4;
    v35 = __Block_byref_object_dispose__4;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__4;
    v29 = __Block_byref_object_dispose__4;
    v16 = MEMORY[0x24BDAC760];
    v30 = 0;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke;
    v24[3] = &unk_24C327380;
    v24[4] = &v31;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2;
    v23[3] = &unk_24C3275A8;
    v23[4] = &v25;
    v23[5] = &v31;
    objc_msgSend(v17, "ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v6, 0, v23);

    v7[2](v7, v26[5], v32[5]);
    _Block_object_dispose(&v25, 8);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:completionHandler:]", 652, CFSTR("Null arguments provided"), v12, v13, v14, v15, v22);
    v18 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, (uint64_t)v21);

  }
}

void __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:completionHandler:]_block_invoke", 661, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __80__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)ppidRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = (uint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 677, CFSTR("invitationIdentifier: %@"), v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v23 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v34;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v26[3] = &unk_24C3275A8;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend(v24, "ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5], v35[5]);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 679, CFSTR("Null arguments provided"), v15, v16, v17, v18, v25);
    v19 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, (uint64_t)v22);

  }
}

void __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession ppidRequestForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 688, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __102__DAKeySharingSession_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)setProductPlanIdentifier:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 702, CFSTR("invitationIdentifier: %@"), v11, v12, v13, v14, (uint64_t)v9);
  if (objc_msgSend(v9, "length"))
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v19 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v28;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2;
    v26[3] = &unk_24C327380;
    v26[4] = &v28;
    objc_msgSend(v20, "setProductPlanIdentifier:forInvitationIdentifier:completion:", v8, v9, v26);

    v10[2](v10, v29[5]);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setProductPlanIdentifier:forInvitationIdentifier:completion:]", 704, CFSTR("Null arguments provided"), v15, v16, v17, v18, v25);
    v21 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v24);

  }
}

void __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession setProductPlanIdentifier:forInvitationIdentifier:completion:]_block_invoke", 713, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __83__DAKeySharingSession_setProductPlanIdentifier_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  kmlErrorToDAError(a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)readerInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  unint64_t v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = (uint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 726, CFSTR("invitationIdentifier: %@"), v11, v12, v13, v14, v8);
  if (v8 | v9)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__4;
    v38 = __Block_byref_object_dispose__4;
    v39 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v23 = MEMORY[0x24BDAC760];
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v27[3] = &unk_24C327380;
    v27[4] = &v34;
    -[DAKeyPairingSession getKeyPairingProxy:](self, (uint64_t)v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v23;
    v26[1] = 3221225472;
    v26[2] = __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v26[3] = &unk_24C327620;
    v26[4] = &v28;
    v26[5] = &v34;
    objc_msgSend(v24, "readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:", v8, v9, v26);

    v10[2](v10, v29[5], v35[5]);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]", 728, CFSTR("Null arguments provided"), v15, v16, v17, v18, v25);
    v19 = (void *)MEMORY[0x24BDD1540];
    v40 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(217));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 217, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, (uint64_t)v22);

  }
}

void __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeySharingSession readerInformationForInvitationWithIdentifier:fromMailboxIdentifier:completionHandler:]_block_invoke", 737, CFSTR("XPC Proxy error %@"), v4, v5, v6, v7, (uint64_t)v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void __108__DAKeySharingSession_readerInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v10 = a2;
  v6 = a3;
  kmlErrorToDAError(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)didStart:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  objc_super v9;

  v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession didStart:]", 754, &stru_24C3287B0, v3, v4, v5, v6, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeySharingSession;
  -[DASession didStart:](&v9, sel_didStart_, v7);
}

- (void)didEnd:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DAKeySharingSession didEnd:]", 760, &stru_24C3287B0, v5, v6, v7, v8, (uint64_t)v9.receiver);
  v9.receiver = self;
  v9.super_class = (Class)DAKeySharingSession;
  -[DASession didEnd:](&v9, sel_didEnd_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DAKeySharingSession;
  -[DASession encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (DAKeySharingSession)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DAKeySharingSession;
  return -[DASession initWithCoder:](&v4, sel_initWithCoder_, a3);
}

@end
