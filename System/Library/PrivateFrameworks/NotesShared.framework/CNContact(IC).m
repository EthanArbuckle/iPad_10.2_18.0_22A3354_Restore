@implementation CNContact(IC)

+ (id)ic_contactFromParticipant:()IC
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v3, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lookupInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_alloc(MEMORY[0x1E0C97338]);
    v9 = (void *)objc_msgSend(v8, "initWithLabel:value:", *MEMORY[0x1E0C966A8], v7);
    v39[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmailAddresses:", v10);

  }
  objc_msgSend(v3, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lookupInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "phoneNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0C97338]);
    v16 = (void *)objc_msgSend(v15, "initWithLabel:value:", *MEMORY[0x1E0C967C0], v14);
    v38 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPhoneNumbers:", v17);

  }
  objc_msgSend(v3, "userIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nameComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "namePrefix");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNamePrefix:", v20);

  objc_msgSend(v3, "userIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nameComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "givenName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v23);

  objc_msgSend(v3, "userIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "nameComponents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "middleName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMiddleName:", v26);

  objc_msgSend(v3, "userIdentity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "nameComponents");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "familyName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v29);

  objc_msgSend(v3, "userIdentity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "nameComponents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "nameSuffix");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNameSuffix:", v32);

  objc_msgSend(v3, "userIdentity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "nameComponents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "nickname");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNickname:", v35);

  v36 = (void *)objc_msgSend(v4, "copy");
  return v36;
}

- (uint64_t)ic_shortName
{
  return objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a1, 1000);
}

@end
