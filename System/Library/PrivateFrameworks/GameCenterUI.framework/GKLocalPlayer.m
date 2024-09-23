@implementation GKLocalPlayer

void __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  UIImage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;

  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "clearInMemoryCachedAvatars");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a1;
    objc_msgSend(*(id *)(a1 + 40), "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKAvatarSubdirectoryNameForPlayerID();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i != 4; ++i)
    {
      v10 = qword_1AB7F7E90[i];
      GKImageURLKeyForSize();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_gkImageByScalingToSize:scale:", (double)v10, (double)v10, 1.0);
      v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v12, v11);
      UIImagePNGRepresentation(v12);
      v13 = v2;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, v11);

      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "avatarSourceWithDimension:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "keyForImageIdentifier:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "basename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v11);

      v2 = v13;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("temporaryTemplateAvatar.tmp"), CFSTR("template"));
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("template"));

    objc_msgSend(*(id *)(v27 + 40), "daemonProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "profileServicePrivate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v27 + 56));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_2;
    v29[3] = &unk_1E59C4CE0;
    v30 = v21;
    v23 = v13;
    v24 = *(void **)(v27 + 48);
    v34 = *(_QWORD *)(v27 + 56);
    v25 = *(_QWORD *)(v27 + 40);
    v31 = v23;
    v32 = v25;
    v33 = v24;
    v26 = v21;
    objc_msgSend(v26, "cachePhotos:avatarType:fileNames:handler:", v4, v22, v5, v29);

  }
  else
  {
    objc_msgSend(v3, "deletePhotoWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  }

}

void __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 32);
  UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPhotoData:avatarType:handler:", v3, v4, &__block_literal_global_7);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E59C4CB8;
  v5 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v5, "loadProfileWithCompletionHandler:", v6);

}

uint64_t __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  CGImage *v13;
  CGImage *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  CGRect v21;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkImageWithCheckedData:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "source") == 1 || objc_msgSend(*(id *)(a1 + 40), "source") == 4)
    {
      v9 = 1;
    }
    else
    {
      v12 = objc_retainAutorelease(v8);
      v13 = (CGImage *)objc_msgSend(v12, "CGImage");
      objc_msgSend(*(id *)(a1 + 40), "cropRect");
      v14 = CGImageCreateWithImageInRect(v13, v21);
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v14);

      CGImageRelease(v14);
      v9 = 2;
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_2;
    v18[3] = &unk_1E59C4D30;
    v15 = *(void **)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v20 = v3;
    v11 = v3;
    objc_msgSend(v15, "setPhoto:avatarType:withCompletionHandler:", v8, v9, v18);

  }
  else
  {
LABEL_6:
    v10 = *(void **)(a1 + 48);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E59C4CB8;
    v17 = v3;
    v8 = v3;
    objc_msgSend(v10, "deletePhotoWithCompletionHandler:", v16);
    v11 = v17;
  }

}

uint64_t __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monogramSourceWithDimension:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_2;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "deleteImageUsingGamedWithSubdirectory:withHandler:", v6, v8);

}

uint64_t __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4;
  v6[3] = &unk_1E59C4CB8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "deletePhotoWithCompletionHandler:", v6);

}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke_2;
  v2[3] = &unk_1E59C4CB8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "deletePhotoWithCompletionHandler:", v2);

}

void __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
  }

}

uint64_t __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a2;
  v6 = a3;
  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  if (!objc_msgSend(v5, "integerValueFromKey:defaultValue:", *MEMORY[0x1E0D25228], 0))
    goto LABEL_7;
  if (objc_msgSend(a1[4], "didShowWelcomeBannerInOverlayWithNewUserState:uponReturnToForeground:", objc_msgSend(a1[4], "isNewToGameCenter"), 0))
  {
    objc_msgSend(MEMORY[0x1E0D25AD0], "didShowBanner");
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didShowSignInBanner");

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_13;
  }
  if ((objc_msgSend(a1[4], "isBannerVisible") & 1) == 0)
  {
    +[GKAccessPoint shared](GKAccessPoint, "shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isActive") ^ 1;

  }
  else
  {
LABEL_7:
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D25AC8], "SIGN_IN_BANNER_TITLE");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = a1[4];
    objc_msgSend(MEMORY[0x1E0D25AC8], "SIGN_IN_BANNER_SUBTITLE");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_2;
    v19[3] = &unk_1E59C4148;
    v20 = a1[5];
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_3;
    v17[3] = &unk_1E59C53C8;
    v17[4] = a1[4];
    v18 = a1[6];
    objc_msgSend(v12, "showBannerWithTitle:message:touchHandler:completionHandler:", v11, v13, v19, v17);

    objc_msgSend(MEMORY[0x1E0D25AD0], "didShowBanner");
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didShowSignInBanner");

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

LABEL_13:
}

void __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D25330], "authenticationPersonality");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticationShowSignInUIForLocalPlayer:origin:dismiss:", *(_QWORD *)(a1 + 32), 2, 0);

}

uint64_t __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsWelcomeOrSignInBannerEnqueued:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldPreserveOnboardingUI:", 0);
  objc_msgSend(v3, "setAuthenticated:", objc_msgSend(v2, "gkIsUnauthenticatedError") ^ 1);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showAccessPoint");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_2;
  v7[3] = &unk_1E59C4708;
  v8 = v3;
  v9 = v2;
  v5 = v2;
  v6 = v3;
  objc_msgSend(v6, "removeActiveViewControllerAnimated:completionHandler:", 1, v7);

}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_3;
  v3[3] = &unk_1E59C5310;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "refreshInternalWithCompletion:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[5];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_4;
  v3[3] = &unk_1E59C4708;
  v3[4] = WeakRetained;
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callAuthHandlerWithError:", *(_QWORD *)(a1 + 40));
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthenticated:", 0);
  v5 = *MEMORY[0x1E0D25460];
  if (v3)
  {
    if (!v5)
      v6 = (id)GKOSLoggers();
    v7 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    if (!v5)
      v14 = (id)GKOSLoggers();
    v15 = *MEMORY[0x1E0D25478];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25478], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "showOnboardingUIFromViewController: Showing Onboarding view controller", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "keyWindow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rootViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = dispatch_time(0, 200000000);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_29;
    v21[3] = &unk_1E59C4708;
    v22 = v4;
    v23 = v18;
    v20 = v18;
    dispatch_after(v19, MEMORY[0x1E0C80D38], v21);

  }
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_29(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "signInViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showViewController:usingPresentingViewController:wrapInNavController:", v3, *(_QWORD *)(a1 + 40), 0);

}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "setShowingInGameUI:", 0);

  objc_msgSend(*(id *)(a1 + 32), "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E59C8130;
  v10 = v7;
  v13 = v10;
  objc_copyWeak(&v16, &to);
  v14 = *(id *)(a1 + 32);
  v11 = v3;
  v15 = v11;
  objc_msgSend(v9, "removeActiveViewControllerAnimated:completionHandler:", 1, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&to);

}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isAuthenticated") || !*(_QWORD *)(a1 + 32))
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((objc_msgSend(WeakRetained, "shouldShowOnBoardingUI") & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = objc_msgSend(v4, "shouldShowAnyOnboardingScreen");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v6, "showOnboardingUIFromViewController:signInOrigin:", *(_QWORD *)(a1 + 32), 0);

    return;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "authenticationDidCompleteWithError:", *(_QWORD *)(a1 + 48));
}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D25460];
  if (v6)
  {
    if (!v7)
      v8 = (id)GKOSLoggers();
    v9 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    if (!v7)
      v16 = (id)GKOSLoggers();
    v17 = *MEMORY[0x1E0D25480];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1AB361000, v17, OS_LOG_TYPE_INFO, "authenticationShowGreenBuddyUIForLocalPlayer:Showing sign in view controller", v20, 2u);
    }
    v18 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "signInViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "showViewController:usingPresentingViewController:wrapInNavController:", v19, 0, 0);

  }
}

void __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  id to;

  v3 = a2;
  objc_copyWeak(&to, a1 + 6);
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "setShowingInGameUI:", 0);

  objc_msgSend(a1[4], "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1[4], "activeViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentingViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = a1[4];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_2;
  v12[3] = &unk_1E59C81A8;
  v10 = v7;
  v13 = v10;
  objc_copyWeak(v17, &to);
  v17[1] = a1[7];
  v14 = a1[4];
  v11 = v3;
  v15 = v11;
  v16 = a1[5];
  objc_msgSend(v9, "removeActiveViewControllerAnimated:completionHandler:", 1, v12);

  objc_destroyWeak(v17);
  objc_destroyWeak(&to);

}

uint64_t __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isAuthenticated") || !*(_QWORD *)(a1 + 32))
    goto LABEL_7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(WeakRetained, "shouldShowOnBoardingUI") & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  v4 = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = objc_msgSend(v4, "shouldShowAnyOnboardingScreen");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v6, "showOnboardingUIFromViewController:signInOrigin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "authenticationDidCompleteWithError:signInOrigin:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
LABEL_9:
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v23[16];

  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D25460];
  if (v6)
  {
    if (!v7)
      v8 = (id)GKOSLoggers();
    v9 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    if (!v7)
      v16 = (id)GKOSLoggers();
    v17 = *MEMORY[0x1E0D25480];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25480], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1AB361000, v17, OS_LOG_TYPE_INFO, "authenticationShowSignInUIForLocalPlayer:Showing sign in view controller", v23, 2u);
    }
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyWindow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rootViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(void **)(a1 + 32);
    objc_msgSend(v21, "signInViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "showViewController:usingPresentingViewController:wrapInNavController:", v22, v20, 0);

  }
}

uint64_t __53__GKLocalPlayer_Friends__sendFriendInviteTo_groupId___block_invoke(uint64_t result, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    if (!a4)
    {
      v5 = result;
      v6 = *(void **)(result + 32);
      v7 = a3;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", a2, CFSTR("friendCode"));
      objc_msgSend(*(id *)(v5 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("friendUrl"));

      return objc_msgSend(*(id *)(v5 + 40), "openMessagesWith:recipient:groupId:", *(_QWORD *)(v5 + 32), *(_QWORD *)(v5 + 48), *(_QWORD *)(v5 + 56));
    }
  }
  return result;
}

void __61__GKLocalPlayer_Friends__openMessagesWith_recipient_groupId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  uint8_t v9[16];

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = (NSObject **)MEMORY[0x1E0D25460];
    v7 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v8 = (id)GKOSLoggers();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AB361000, v7, OS_LOG_TYPE_DEFAULT, "error opening friend request url", v9, 2u);
    }
  }

}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error deleting monogram image for local player %@", a5, a6, a7, a8, 2u);
}

void __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Error deleting player profile image %@", a5, a6, a7, a8, 2u);
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "showOnboardingUIFromViewController: Failed to set up remote for Onboarding view controller due to error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "Failed to set up remote for Sign In ViewController due to error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AB361000, a2, a3, "authenticationShowSignInUIForLocalPlayer - Failed to set up remote for Sign In ViewController.Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
