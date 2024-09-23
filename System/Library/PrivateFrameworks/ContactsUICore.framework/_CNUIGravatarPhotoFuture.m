@implementation _CNUIGravatarPhotoFuture

+ (id)photoForEmailAddresses:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D139E8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "photoForEmailAddresses:dataProxy:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)photoForEmailAddresses:(id)a3 dataProxy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    v8 = (void *)MEMORY[0x1E0D13A68];
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 401);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke;
    v17[3] = &unk_1EA604EF8;
    v19 = a1;
    v18 = v7;
    objc_msgSend(v6, "_cn_map:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13A68], "chain:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke_2;
    v15[3] = &unk_1EA604F20;
    v16 = v6;
    objc_msgSend(v13, "recover:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)photoForEmailAddress:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D139E8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "photoForEmailAddress:dataProxy:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)photoForEmailAddress:(id)a3 dataProxy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    v8 = (void *)MEMORY[0x1E0D13A68];
    +[CNContactsUIError errorWithCode:](CNContactsUIError, "errorWithCode:", 401);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "urlForEmailAddress:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfURL:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59___CNUIGravatarPhotoFuture_photoForEmailAddress_dataProxy___block_invoke;
    v13[3] = &unk_1EA604F20;
    v14 = v6;
    objc_msgSend(v11, "recover:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)urlForEmailAddress:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "filenameForEmailAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "imageSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://www.gravatar.com/avatar/%@.jpg?s=%lu&d=404&r=pg"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filenameForEmailAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "_cn_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseStringWithLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hashForEmailAddress:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)hashForEmailAddress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_md5Hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_hexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int64_t)imageSize
{
  return 512;
}

@end
