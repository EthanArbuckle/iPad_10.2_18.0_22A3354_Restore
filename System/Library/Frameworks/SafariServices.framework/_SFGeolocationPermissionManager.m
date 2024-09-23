@implementation _SFGeolocationPermissionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_54);
  return (id)sharedManager_instance;
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UIWebGeolocationPolicyDecider *v14;
  UIWebGeolocationPolicyDecider *policyDecider;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!self->_policyDecider)
  {
    objc_msgSend(MEMORY[0x1E0DC3F90], "sharedPolicyDecider");
    v14 = (UIWebGeolocationPolicyDecider *)objc_claimAutoreleasedReturnValue();
    policyDecider = self->_policyDecider;
    self->_policyDecider = v14;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebGeolocationPolicyDecider clearAuthorizationForDomain:](self->_policyDecider, "clearAuthorizationForDomain:", v12);
  v16.receiver = self;
  v16.super_class = (Class)_SFGeolocationPermissionManager;
  -[WBSGeolocationPreferenceManager setValue:ofPreference:forDomain:completionHandler:](&v16, sel_setValue_ofPreference_forDomain_completionHandler_, v10, v11, v12, v13);

}

- (void)requestPermissionForURL:(id)a3 frame:(id)a4 dialogPresenter:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "safari_userVisibleHostWithoutWWWSubdomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke;
  v19[3] = &unk_1E4AC6D88;
  v22 = v12;
  v23 = v13;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  -[WBSGeolocationPreferenceManager getGeolocationSettingForDomain:completionHandler:](self, "getGeolocationSettingForDomain:completionHandler:", v14, v19);

}

- (void)_showDialogRequestingPermissionForURL:(id)a3 frame:(id)a4 dialogPresenter:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  UIWebGeolocationPolicyDecider *policyDecider;
  UIWebGeolocationPolicyDecider *v26;
  UIWebGeolocationPolicyDecider *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _SFGeolocationPermissionManager *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _SFGeolocationPermissionManager *v44;
  void (**v45)(id, uint64_t);
  id v46[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  objc_msgSend(v11, "securityOrigin");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v14, "protocol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScheme:", v16);

  if (objc_msgSend(v14, "port"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "port"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPort:", v17);

  }
  else
  {
    objc_msgSend(v15, "setPort:", 0);
  }
  objc_msgSend(v14, "host");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHost:", v18);

  v19 = objc_alloc(MEMORY[0x1E0CEF670]);
  objc_msgSend(v15, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithURL:", v20);

  objc_msgSend(v11, "webView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "webui_privateBrowsingEnabled");

  if ((v23 & 1) != 0)
  {
LABEL_5:
    v24 = 0;
    goto LABEL_9;
  }
  policyDecider = self->_policyDecider;
  if (!policyDecider)
  {
    objc_msgSend(MEMORY[0x1E0DC3F90], "sharedPolicyDecider");
    v26 = (UIWebGeolocationPolicyDecider *)objc_claimAutoreleasedReturnValue();
    v27 = self->_policyDecider;
    self->_policyDecider = v26;

    policyDecider = self->_policyDecider;
  }
  v46[0] = 0;
  v28 = -[UIWebGeolocationPolicyDecider getAuthorizationStatusForOrigin:requestingURL:promptInfo:](policyDecider, "getAuthorizationStatusForOrigin:requestingURL:promptInfo:", v21, v10, v46);
  v24 = v46[0];
  if (!v24)
  {
    if ((objc_msgSend(MEMORY[0x1E0D8AD68], "isLockdownModeEnabledForSafari") & v28 & 1) == 0)
    {
      v13[2](v13, v28);
      goto LABEL_11;
    }
    goto LABEL_5;
  }
LABEL_9:
  objc_msgSend(v12, "permissionDialogThrottler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = v29;
    v31 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __113___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke;
    v40[3] = &unk_1E4AC6DB0;
    v41 = v29;
    v42 = v11;
    v43 = v24;
    v44 = self;
    v45 = v13;
    v32 = v24;
    v33 = v30;
    v35[0] = v31;
    v35[1] = 3221225472;
    v35[2] = __113___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_completionHandler___block_invoke_2;
    v35[3] = &unk_1E4AC6DD8;
    v39 = (id)MEMORY[0x1A8598C40](v40);
    v36 = v10;
    v37 = self;
    v38 = v12;
    v34 = v39;
    objc_msgSend(v33, "requestPermissionDialogPresentation:", v35);

LABEL_11:
    return;
  }
  __break(0xC471u);
}

- (BOOL)hasPreciseLocationPermission
{
  CLLocationManager *locationManager;
  CLLocationManager *v4;
  CLLocationManager *v5;

  locationManager = self->_locationManager;
  if (!locationManager)
  {
    v4 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
    v5 = self->_locationManager;
    self->_locationManager = v4;

    locationManager = self->_locationManager;
  }
  return -[CLLocationManager authorizationStatus](locationManager, "authorizationStatus") - 3 <= 1
      && -[CLLocationManager accuracyAuthorization](self->_locationManager, "accuracyAuthorization") == CLAccuracyAuthorizationFullAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_policyDecider, 0);
}

@end
