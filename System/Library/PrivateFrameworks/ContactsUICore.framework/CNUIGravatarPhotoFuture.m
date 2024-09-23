@implementation CNUIGravatarPhotoFuture

uint64_t __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "photoForEmailAddress:dataProxy:", a2, *(_QWORD *)(a1 + 32));
}

id __61___CNUIGravatarPhotoFuture_photoForEmailAddresses_dataProxy___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("email-address");
  (*(void (**)(_QWORD, _QWORD))(*MEMORY[0x1E0D13878] + 16))(*MEMORY[0x1E0D13878], *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsUIError errorWithCode:userInfo:](CNContactsUIError, "errorWithCode:userInfo:", 402, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59___CNUIGravatarPhotoFuture_photoForEmailAddress_dataProxy___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("email-address");
  (*(void (**)(_QWORD, _QWORD))(*MEMORY[0x1E0D13878] + 16))(*MEMORY[0x1E0D13878], *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsUIError errorWithCode:userInfo:](CNContactsUIError, "errorWithCode:userInfo:", 402, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
