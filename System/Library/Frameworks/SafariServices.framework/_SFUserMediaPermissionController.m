@implementation _SFUserMediaPermissionController

- (void)savePendingChanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54___SFUserMediaPermissionController_savePendingChanges__block_invoke;
  v7[3] = &unk_1E4ABFC78;
  v7[4] = &v8;
  v5 = objc_msgSend(v3, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.SafariServices.savePermissionsBackgroundTask"), v7);

  v9[3] = v5;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __54___SFUserMediaPermissionController_savePendingChanges__block_invoke_2;
  v6[3] = &unk_1E4ABFC78;
  v6[4] = &v8;
  -[WBSUserMediaPermissionController savePendingChangesWithCompletionHandler:](self, "savePendingChangesWithCompletionHandler:", v6);
  _Block_object_dispose(&v8, 8);
}

- (void)coalescedAsynchronousWriter:(id)a3 didFinishWritingData:(id)a4
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_18);
}

- (void)requestUserMediaAuthorizationForDevices:(unint64_t)a3 url:(id)a4 mainFrameURL:(id)a5 decisionHandler:(id)a6 dialogPresenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __125___SFUserMediaPermissionController_requestUserMediaAuthorizationForDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke;
  v22[3] = &unk_1E4AC2700;
  v22[4] = self;
  v23 = v12;
  v26 = v14;
  v27 = a3;
  v24 = v13;
  v25 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[WBSUserMediaPermissionController getPermissionForOrigin:topLevelOrigin:completionHandler:](self, "getPermissionForOrigin:topLevelOrigin:completionHandler:", v16, v17, v22);

}

- (void)_didRetrieveUserMediaPermission:(unint64_t)a3 forDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7 dialogPresenter:(id)a8
{
  char v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id *v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  _SFUserMediaPermissionController *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  _QWORD v43[5];
  id v44;

  v11 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v14, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "safari_hasScheme:", CFSTR("https")) & 1) == 0)
    LODWORD(a3) = -[WBSUserMediaPermissionController permissionForNonHTTPSOriginFromPermission:](self, "permissionForNonHTTPSOriginFromPermission:", a3);
  if ((v11 & 1) != 0 && (a3 & 2) != 0 || (v20 = v11 & 2, (v11 & 2) != 0) && (a3 & 0x10) != 0)
  {
    v43[1] = MEMORY[0x1E0C809B0];
    v43[2] = 3221225472;
    v43[3] = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke;
    v43[4] = &unk_1E4AC0230;
    v21 = &v44;
    v44 = v16;
  }
  else
  {
    v22 = v11 & 1;
    v23 = v20 >> 1;
    if (v22)
      v24 = (a3 >> 2) & 1;
    else
      v24 = 0;
    v25 = (a3 >> 5) & 1;
    if (!v20)
      v25 = 0;
    if (v24 != (_DWORD)v22 || v25 != (_DWORD)v23)
    {
      v27 = v20 | v22;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_3;
      block[3] = &unk_1E4AC2778;
      v21 = &v29;
      v29 = v15;
      v30 = v14;
      v26 = v17;
      v37 = v22;
      v38 = v23;
      v31 = v26;
      v32 = self;
      v33 = v18;
      v34 = v19;
      v35 = v16;
      v36 = v27;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_9;
    }
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __128___SFUserMediaPermissionController__didRetrieveUserMediaPermission_forDevices_url_mainFrameURL_decisionHandler_dialogPresenter___block_invoke_2;
    v42 = &unk_1E4AC0230;
    v21 = (id *)v43;
    v43[0] = v16;
  }
  WBSRespondWithRandomDelay();
LABEL_9:

}

@end
