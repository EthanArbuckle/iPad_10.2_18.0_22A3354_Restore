@implementation CKShareParticipant

void __50__CKShareParticipant_IC__ic_mentionableNamesCache__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D641C8]);
  v1 = objc_msgSend(v0, "initWithMaxSize:notificationName:", 50, *MEMORY[0x1E0C96870]);
  v2 = (void *)ic_mentionableNamesCache_sMentionableNamesCache;
  ic_mentionableNamesCache_sMentionableNamesCache = v1;

}

uint64_t __64__CKShareParticipant_IC__ic_displayableNames_maximumNamesCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_participantName");
}

uint64_t __56__CKShareParticipant_IC__ic_nonCurrentUserParticipants___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUser") ^ 1;
}

uint64_t __54__CKShareParticipant_IC__ic_mentionTokensFromContacts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_tokenSafeText");
}

void __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v20, "length"))
  {
    objc_msgSend(v20, "ic_tokenSafeText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v13)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = v11;
LABEL_8:
        v17 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v15;
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v10, "ic_tokenSafeText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      {

LABEL_7:
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = v10;
        goto LABEL_8;
      }
      if (objc_msgSend(v11, "length"))
      {

      }
      else
      {
        v18 = objc_msgSend(v9, "length");

        if (!v18)
          goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ic_shortNameFromGivenName:familyName:", v9, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length"))
        v19 = v17;
      else
        v19 = v11;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v19);
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __74__CKShareParticipant_IC__ic_participantNameMatchingString_returnFullName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "length");
    v4 = v6;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }

}

@end
