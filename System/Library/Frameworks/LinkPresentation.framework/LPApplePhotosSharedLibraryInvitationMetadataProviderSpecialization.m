@implementation LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 2048;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization *v6;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[LPPresentationSpecializations isApplePhotosSharedLibraryInvitationURL:](LPPresentationSpecializations, "isApplePhotosSharedLibraryInvitationURL:", v4);

  if (v5)
    v6 = -[LPMetadataProviderSpecialization initWithContext:]([LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization alloc], "initWithContext:", v3);
  else
    v6 = 0;

  return v6;
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0C41000, log, OS_LOG_TYPE_ERROR, "LinkPresentation: Failed to generate metadata - TCC denied", v1, 2u);
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
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
  uint64_t v34;
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2;
    v29 = __Block_byref_object_dispose__2;
    v30 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v7 = (void *)getPHShareParticipantClass_softClass;
    v34 = getPHShareParticipantClass_softClass;
    v8 = MEMORY[0x1E0C809B0];
    if (!getPHShareParticipantClass_softClass)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __getPHShareParticipantClass_block_invoke;
      v35[3] = &unk_1E44A7DB0;
      v35[4] = &v31;
      __getPHShareParticipantClass_block_invoke((uint64_t)v35);
      v7 = (void *)v32[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v31, 8);
    objc_msgSend(v9, "fetchParticipantsInShare:options:", v5, *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_4;
    v24[3] = &unk_1E44A8E38;
    v24[4] = &v25;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v24);
    v11 = (void *)v26[5];
    if (!v11)
    {
      sharedLibraryLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_2(v18, (uint64_t)v35, v17);
      }

      objc_msgSend(*(id *)(a1 + 40), "completeWithOriginatorDisplayName:", 0);
      goto LABEL_21;
    }
    v12 = v11;
    objc_msgSend(v12, "nameComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v14, "setStyle:", 1);
      objc_msgSend(v14, "stringFromPersonNameComponents:", v13);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "emailAddress");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "length"))
      {
        objc_msgSend(v12, "phoneNumber");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length"))
          v19 = v23;
        else
          v19 = 0;

        goto LABEL_16;
      }
      v15 = v14;
      v14 = v15;
    }
    v19 = v15;
LABEL_16:

    if (!v19)
    {
      sharedLibraryLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v26[5], "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_3(v21, v22, (uint64_t)v35, v20);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "completeWithOriginatorDisplayName:", v19);

LABEL_21:
    _Block_object_dispose(&v25, 8);

    goto LABEL_22;
  }
  sharedLibraryLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_1(a1, (uint64_t)v6, v16);

  objc_msgSend(*(id *)(a1 + 40), "completeWithOriginatorDisplayName:", 0);
LABEL_22:

}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "role") == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)completeWithOriginatorDisplayName:(id)a3
{
  id v4;
  LPLinkMetadata *v5;
  void *v6;
  LPApplePhotosSharedLibraryInvitationMetadata *v7;
  void *v8;
  void *v9;
  void *v10;
  LPLinkMetadata *v11;
  _QWORD block[5];
  LPLinkMetadata *v13;

  v4 = a3;
  v5 = objc_alloc_init(LPLinkMetadata);
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setURL:](v5, "setURL:", v6);

  v7 = objc_alloc_init(LPApplePhotosSharedLibraryInvitationMetadata);
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("%@ wants you to join a Shared Library in Photos"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosSharedLibraryInvitationMetadata setMessage:](v7, "setMessage:", v10);

    -[LPApplePhotosSharedLibraryInvitationMetadata setOriginatorDisplayName:](v7, "setOriginatorDisplayName:", v4);
  }
  -[LPLinkMetadata setSpecialization:](v5, "setSpecialization:", v7);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_completeWithOriginatorDisplayName___block_invoke;
  block[3] = &unk_1E44A7D10;
  block[4] = self;
  v13 = v5;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __104__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_completeWithOriginatorDisplayName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecialization:didCompleteWithMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1_2(&dword_1A0C41000, a3, (uint64_t)a3, "LinkPresentation: Failed to generate metadata - No library scope for URL: %@, error: %@", (uint8_t *)&v4);
}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A0C41000, a3, (uint64_t)a3, "LinkPresentation: Failed to generate metadata - No owner for library scope: %{public}@", (uint8_t *)a2);

}

void __75__LPApplePhotosSharedLibraryInvitationMetadataProviderSpecialization_start__block_invoke_cold_3(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_2(&dword_1A0C41000, a4, a3, "LinkPresentation: Failed to generate metadata - No name for owner: %{public}@, library scope: %{public}@", (uint8_t *)a3);

}

@end
