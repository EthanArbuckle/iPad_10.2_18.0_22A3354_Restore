@implementation FAMonogram

+ (id)monogramForContact:(id)a3 diameter:(double)a4 scale:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v8, "setContactType:", objc_msgSend(v7, "contactType"));
  objc_msgSend(v7, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGivenName:", v9);

  objc_msgSend(v7, "middleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMiddleName:", v10);

  objc_msgSend(v7, "familyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFamilyName:", v11);

  objc_msgSend(v7, "namePrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNamePrefix:", v12);

  objc_msgSend(v7, "nameSuffix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNameSuffix:", v13);

  objc_msgSend(v7, "nickname");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNickname:", v14);

  v15 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "characterDirectionForLanguage:", v17);

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v19 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  v31 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v27[3] = &unk_1E85620F8;
    v27[4] = &v28;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)v27);
    v19 = (void *)v29[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v20, "scopeWithPointSize:scale:rightToLeft:style:", v18 == 2, 0, a4, a4, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc_init((Class)getCNAvatarImageRendererClass());
  v32[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "avatarImageForContacts:scope:", v23, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _weakUIImagePNGRepresentation(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)silhouetteMonogramWithDiameter:(double)a3 scale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init((Class)getCNAvatarImageRendererClass());
  objc_msgSend(v6, "placeholderImageProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForSize:scale:", a3, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _weakUIImagePNGRepresentation(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)monogramWithFirstName:(id)a3 lastName:(id)a4 diameter:(double)a5 scale:(double)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = (objc_class *)MEMORY[0x1E0C97360];
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v10);
  objc_msgSend(v13, "setContactType:", 0);
  objc_msgSend(v13, "setGivenName:", v12);

  objc_msgSend(v13, "setFamilyName:", v11);
  objc_msgSend(a1, "monogramForContact:diameter:scale:", v13, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
