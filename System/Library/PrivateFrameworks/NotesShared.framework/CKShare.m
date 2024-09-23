@implementation CKShare

BOOL __38__CKShare_IC__ic_acceptedParticipants__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "acceptanceStatus") == 2;
}

BOOL __52__CKShare_IC__ic_nonCurrentUserAcceptedParticipants__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isCurrentUser") & 1) == 0 && objc_msgSend(v2, "acceptanceStatus") == 2;

  return v3;
}

uint64_t __48__CKShare_IC__ic_participantWithUserRecordName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userRecordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v6;
}

uint64_t __40__CKShare_IC__ic_participantWithHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(a2, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lookupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DBD2F8];
    objc_msgSend(v4, "emailAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "normalizedEmailAddressHandleForValue:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      v10 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v4, "phoneNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("+"));

    if ((v16 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "normalizedValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("+"), &stru_1E76DB108, 0, 0, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "phoneNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v19, "isEqualToString:", v10);

      goto LABEL_5;
    }
    v17 = (void *)MEMORY[0x1E0DBD2F8];
    objc_msgSend(v4, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

LABEL_4:
  v11 = objc_msgSend(v10, "isEquivalentToHandle:", *(_QWORD *)(a1 + 32));
LABEL_5:

  return v11;
}

@end
